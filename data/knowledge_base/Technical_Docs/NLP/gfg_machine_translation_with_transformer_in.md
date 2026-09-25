# Machine Translation with Transformer in Python

> Source: https://www.geeksforgeeks.org/nlp/machine-translation-with-transformer-in-python/

Machine translation is the process of converting text from one language to another using AI models. Modern systems, such as Google Translate, rely on advanced architectures like Transformers to understand and generate accurate translations.
- Enables automatic translation between languages
- Uses Transformer models to capture context and meaning
- Widely applied in tools for communication and localization
- Can be fine-tuned for specific language pairs like English to Hindi
Understanding Transformers
Transformer are deep learning models widely used in NLP because they can capture relationships between words, even when they are far apart in a sentence.
- Encoder processes and understands the input sentence (e.g., English)
- Decoder generates the translated output in the target language (e.g., Hindi)
- Self-Attention helps the model focus on relevant words across the entire sentence
- Processes the whole sentence at once, making it faster and more efficient than older sequential models
- Pre-trained models like those from Helsinki-NLP can be used directly for translation tasks
Implementation
Transformers have improved the quality and efficiency of machine translation models. Here we will be using hugging Face's transformer models to perform English to Hindi translation.
Step 1: Installing Libraries
Before starting make sure that we have the required libraries installed in our environment. If not then use the following commands to install them:
!pip install datasets transformers sentencepiece sacrebleu evaluate accelerate
We will use cfilt/iitb-english-hindi dataset available on Hugging face.
Step 2: Loading the Dataset
Load the dataset from Hugging Face. It provides splits like "train", "validation" and "test" which we will use to train and evaluate our model.
from datasets import load_dataset
dataset = load_dataset("cfilt/iitb-english-hindi")
Step 3: Load Model and Tokenizer
We will be using the pre-trained model Helsinki-NLP/opus-mt-en-hi for English to Hindi translation. The AutoTokenizer and AutoModelForSeq2SeqLM classes from the Hugging Face transformers library allow us to load the tokenizer and model. The tokenizer converts text to tokens and the model performs the translation.
max_length = 256
from transformers import AutoTokenizer, AutoModelForSeq2SeqLM
tokenizer = AutoTokenizer.from_pretrained("Helsinki-NLP/opus-mt-en-hi")
model = AutoModelForSeq2SeqLM.from_pretrained("Helsinki-NLP/opus-mt-en-hi")
Step 4: Example Translation
Test the model with a sentence from the validation set. The input sequence is: 'Rajesh Gavre, the President of the MNPA teachers association, honoured the school by presenting the award'.
article = dataset['validation'][2]['translation']['en']
inputs = tokenizer(article, return_tensors="pt")
translated_tokens = model.generate(
    **inputs, max_length=256
)
tokenizer.batch_decode(translated_tokens, skip_special_tokens=True)[0]
Output:
'एमएनएपी शिक्षकों के राष्ट्रपति, राजस्वीवर ने इस पुरस्कार को पेश करके स्कूल की प्रतिष्ठा की'
Let's check the expected output using the following code.
dataset['validation'][2]['translation']['hi']
Output:
'मनपा शिक्षक संघ के अध्यक्ष राजेश गवरे ने स्कूल को भेंट देकर सराहना की।'
Step 5: Tokenize the Dataset
To fine-tune the model, we need to preprocess the dataset. This involves tokenizing both the input (English) and target (Hindi) sentences and check that they are properly formatted for the model.
def preprocess_function(examples):
    inputs = [ex["en"] for ex in examples["translation"]]
    targets = [ex["hi"] for ex in examples["translation"]]
    model_inputs = tokenizer(inputs, max_length=max_length, truncation=True)
    labels = tokenizer(targets, max_length=max_length, truncation=True)
    model_inputs["labels"] = labels["input_ids"]
    return model_inputs
We map each of the examples of our dataset using the map function.
- tokenized_datasets_validation = dataset['validation'].map(...): Apply the preprocess_function to the validation split of the dataset in batches, removing original columns and processing 2 samples per batch.
- tokenized_datasets_test = dataset['test'].map(...): Apply the preprocess_function similarly to the test split, with the same batching and column removal settings.
tokenized_datasets_validation = dataset['validation'].map(
    preprocess_function,
    batched=True,
    remove_columns=dataset["validation"].column_names,
    batch_size=2
)
tokenized_datasets_test = dataset['test'].map(
    preprocess_function,
    batched=True,
    remove_columns=dataset["test"].column_names,
    batch_size=2)
Step 6: Define the Data Collator
DataCollatorForSeq2Seq helps to batch the tokenized data with proper padding and formatting for seq2seq training. It handles tasks such as padding sequences to the maximum length in a batch helps in creating attention masks and organizing the data.
from transformers import DataCollatorForSeq2Seq
data_collator = DataCollatorForSeq2Seq(tokenizer, model=model)
Step 7: Set Model Training Parameters
To fine-tune the model, we need to specify training parameters. In this case, we freeze some layers and train only the last few layers to fine-tune the model effectively.
- num_layers_to_freeze = 10: Define the number of layers at the end of the encoder and decoder to keep trainable.
for parameter in model.parameters():
    parameter.requires_grad = True
num_layers_to_freeze = 10  
for layer_index, layer in enumerate(model.model.encoder.layers):
    print
    if layer_index < len(model.model.encoder.layers) - num_layers_to_freeze:
        for parameter in layer.parameters():
            parameter.requires_grad = False
num_layers_to_freeze = 10  
for layer_index, layer in enumerate(model.model.decoder.layers):
    print
    if layer_index < len(model.model.encoder.layers) - num_layers_to_freeze:
        for parameter in layer.parameters():
            parameter.requires_grad = False
Step 8: Evaluate the Model
We use SacreBLEU for evaluating the model's performance. BLEU (Bilingual Evaluation Understudy) is a metric used for evaluating machine translation models.
- if isinstance(preds, tuple): preds = preds[0]: Handle cases where predictions come as a tuple by selecting the first element.
- decoded_preds = tokenizer.batch_decode(preds, skip_special_tokens=True): Convert predicted token IDs back to text ignoring special tokens.
import evaluate
metric = evaluate.load("sacrebleu")
import numpy as np
def compute_metrics(eval_preds):
    preds, labels = eval_preds
    if isinstance(preds, tuple):
        preds = preds[0]
    decoded_preds = tokenizer.batch_decode(preds, skip_special_tokens=True)
    labels = np.where(labels != -100, labels, tokenizer.pad_token_id)
    decoded_labels = tokenizer.batch_decode(labels, skip_special_tokens=True)
    decoded_preds = [pred.strip() for pred in decoded_preds]
    decoded_labels = [[label.strip()] for label in decoded_labels]
    result = metric.compute(predictions=decoded_preds, references=decoded_labels)
    return {"bleu": result["score"]}
Step 9: Train the Model
We define the training parameters using Seq2SeqTrainingArguments from Hugging Face.
- training_args = Seq2SeqTrainingArguments(...): Define the training configuration with specific options like batch size, learning rate and mixed precision.
- gradient_checkpointing=True: Enable gradient checkpointing to reduce memory usage during training.
- push_to_hub=False: Disable pushing the trained model to the Hugging Face Hub.
import torch
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
from transformers import Seq2SeqTrainingArguments
model.to(device)
training_args = Seq2SeqTrainingArguments(
    f"finetuned-nlp-en-hi",
    gradient_checkpointing=True,
    per_device_train_batch_size=32,
    learning_rate=1e-5,
    warmup_steps=2,
    max_steps=2000,
    fp16=True,
    optim='adafactor',
    per_device_eval_batch_size=16,
    metric_for_best_model="eval_bleu",
    predict_with_generate=True,
    push_to_hub=False,
)
We start training with Seq2SeqTrainer.
- trainer = Seq2SeqTrainer(...): Create a trainer object by providing the model, training arguments, datasets, data collator, tokenizer and metric computation function.
from transformers import Seq2SeqTrainer
trainer = Seq2SeqTrainer(
    model=model,
    args=training_args,
    train_dataset=tokenized_datasets_test,
    eval_dataset=tokenized_datasets_validation,
    data_collator=data_collator,
    compute_metrics=compute_metrics,
)
trainer.train()
Output:
Step 10: Building an Interactive Gradio App
We can create an interactive Gradio app to translate English sentences to Hindi.
import gradio as gr
def translate(text):
  inputs = tokenizer(text, return_tensors="pt").to(device)
  translated_tokens = model.generate(**inputs,  max_length=256)
  results = tokenizer.batch_decode(translated_tokens, skip_special_tokens=True)[0]
  return results
interface = gr.Interface(fn=translate,inputs=gr.Textbox(lines=2, placeholder='Text to translate'),
                        outputs='text')
interface.launch()
Output:
Get complete Notebook Link from here.
