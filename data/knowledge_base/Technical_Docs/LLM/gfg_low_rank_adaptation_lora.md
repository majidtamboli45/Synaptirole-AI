# Low Rank Adaptation (LoRA)

> Source: https://www.geeksforgeeks.org/deep-learning/low-rank-adaptation-lora/

Low-Rank Adaptation (LoRA) is a parameter-efficient fine-tuning technique used to adapt large pre-trained models for specific tasks with minimal computational and memory overhead. As models grow larger, full fine-tuning becomes expensive. LoRA addresses this by reducing the number of trainable parameters, making the process faster and more efficient.
Instead of updating the entire model, it introduces low-rank matrices into the model's layers. This allows us to adapt the model for specific tasks without changing the whole structure, maintaining high performance while reducing resource usage.
Key Features of LoRA
- Parameter Efficiency: It reduces the number of trainable parameters, leading to lower memory usage during fine-tuning and inference.
- Computational Efficiency: It minimizes matrix operations, reducing the computational workload on GPUs/TPUs and speeding up the fine-tuning process.
- Preservation of Pre-Trained Knowledge: The original pre-trained model remains unchanged making it easy to revert to the base model when needed.
- Scalability: It can be applied to various transformer-based models like GPT, BERT and T5 making it versatile for different tasks.
- Faster Fine-Tuning: By updating fewer parameters, it accelerates the fine-tuning process compared to traditional methods.
Architecture
- Pre-Trained Backbone: We start with a large transformer model like GPT or BERT that has already been trained on a range of data.
- Low-Rank Adaptation Layers: It adds small low-rank matrices to the model’s attention mechanism. These matrices are the only parts of the model that get updated during fine-tuning.
- Frozen Original Parameters: The original weights of the model are kept frozen. This means we don’t modify the entire model, just the added low-rank matrices.
- Task-Specific Fine-Tuning: We fine-tune the low-rank matrices for the specific task such as sentiment analysis or translation while the rest of the model stays the same.
This approach helps us adapt large models to new tasks without changing the entire structure making it more efficient.
Working
LoRA modifies the traditional fine-tuning process by introducing low-rank matrices into specific layers of a neural network allowing the model to adapt to new tasks without changing the entire model. Let's see how LoRA works:
1. Decomposing the Weight Matrix
Instead of updating the entire weight matrix during fine-tuning, it approximates it using two smaller low-rank matrices A and B. The adapted weight matrix (W') is calculated as:
W' = W + A \cdot B 
Here W is the original weight matrix and A and B are the low-rank matrices. This decomposition allows the model to make task-specific adjustments without the need to retrain the entire model, drastically reducing the computational load.
2. Training Only the LoRA Parameters
During the fine-tuning process, only the low-rank matrices A and B are updated while the original model weights W remain frozen. This minimizes the number of parameters that need to be adjusted making fine-tuning faster and more memory-efficient compared to traditional methods where all model weights are updated.
3. Inference with Adapted Weights
After fine-tuning, the adapted weight matrix W′ is used for inference. This helps the model to make predictions for specific tasks, fine-tuned with minimal computational resources. Since only the low-rank matrices are updated, it maintains efficiency even during inference.
By using LoRA, we can adapt large pre-trained models to new tasks quickly and efficiently without the computational burden of full model fine-tuning.
Implementation of LoRA with BERT on Emotion Detection
Here we will see a practical implementation of LoRA on the Emotion Dataset. Instead of updating the entire BERT model, we fine-tune only small LoRA modules, saving time and resources while still achieving good performance in classifying emotions such as joy, sadness, anger, love, fear and surprise.
1. Installing Required Libraries
We use Hugging Face’s transformers, datasets, peft, accelerate and evaluate libraries for model training, LoRA fine-tuning and evaluation.
!pip install transformers datasets peft accelerate evaluate
2. Importing Dependencies
We will be importing BERT, tokenizer, LoRA config, dataset loader, training utilities and PyTorch for this implementation.
from transformers import AutoModelForSequenceClassification, AutoTokenizer, TrainingArguments, Trainer, pipeline
from datasets import load_dataset
from peft import LoraConfig, get_peft_model
import evaluate
import torch
3. Loading the Dataset
We load the Emotion dataset(dair-ai/emotion). For quick implementation, we use only 3,000 training samples and smaller validation/test subsets.
dataset = load_dataset("dair-ai/emotion")
dataset["train"] = dataset["train"].shuffle(seed=42).select(range(3000))
dataset["validation"] = dataset["validation"].shuffle(seed=42).select(range(500))
dataset["test"] = dataset["test"].shuffle(seed=42).select(range(500))
Output:
4. Preprocessing Data
Before training, we tokenize the text so BERT can process it. Each input is padded or truncated to 128 tokens for uniformity. We also rename label to labels and set the dataset format to PyTorch tensors. Then we load BERT-base-uncased for sequence classification with 6 output labels.
model_name = "bert-base-uncased"
tokenizer = AutoTokenizer.from_pretrained(model_name)
def preprocess(batch):
    return tokenizer(batch["text"], truncation=True, padding="max_length", max_length=128)
dataset = dataset.map(preprocess, batched=True).rename_column("label", "labels")
dataset.set_format(type="torch", columns=["input_ids", "attention_mask", "labels"])
model = AutoModelForSequenceClassification.from_pretrained(model_name, num_labels=6)
Output:
5. Applying LoRA Configuration
Instead of training all of BERT’s 110M+ parameters, LoRA injects small trainable matrices into the attention layers (query, value). This makes fine-tuning efficient without sacrificing much performance.
lora_config = LoraConfig(
    r=8,
    lora_alpha=16,
    target_modules=["query", "value"],  
    lora_dropout=0.1,
    bias="none",
    task_type="SEQ_CLS"
)
model = get_peft_model(model, lora_config)
6. Training the Model
We fine-tune only the LoRA layers using Hugging Face’s Trainer API.
- Batch size = 8
- Learning rate = 2e-4 (slightly higher since only LoRA layers are trained)
- Epochs = 2 (kept short for quick results)
metric = evaluate.load("accuracy")
def compute_metrics(eval_pred):
    logits, labels = eval_pred
    preds = logits.argmax(axis=-1)
    return metric.compute(predictions=preds, references=labels)
args = TrainingArguments(
    output_dir="./lora_emotion",
    per_device_train_batch_size=8,
    per_device_eval_batch_size=8,
    learning_rate=2e-4,
    num_train_epochs=2,    
    eval_strategy="epoch",
    logging_steps=10,
    report_to="none"
)
trainer = Trainer(
    model=model,
    args=args,
    train_dataset=dataset["train"],
    eval_dataset=dataset["validation"],
    compute_metrics=compute_metrics
)
trainer.train()
model.save_pretrained("./lora_emotion_adapter")
print("LoRA fine-tuning complete! Adapter saved at ./lora_emotion_adapter")
Output:
The accuracy here is not very high (~54%) because we trained only for 2 epochs on a small subset of the dataset. This setup is mainly for demonstration and understanding. For better performance, we can train for more epochs and use the full dataset.
7. Testing the Model on Custom Sentences
Now let’s test our fine-tuned model on some custom sentences. This helps us confirm that the LoRA adapter works as intended.
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)
emotion_labels = dataset["train"].features["labels"].names
samples = [
    "I am so happy to see you!",
    "This is terrifying, I can't handle it.",
    "He surprised everyone with his gift.",
    "I feel so sad and lonely.",
    "I love spending time with my family."
]
inputs = tokenizer(samples, truncation=True, padding=True, return_tensors="pt").to(device)
model.eval()
with torch.no_grad():
    logits = model(**inputs).logits
    preds = torch.argmax(logits, dim=-1)
for text, pred in zip(samples, preds):
    print(f"Text: {text}\nPredicted Emotion: {emotion_labels[pred]}\n")
Output:
You can download source code from here.
LoRA vs Other Fine-Tuning Techniques
Different fine-tuning techniques have their strengths and weaknesses. Let's see a comparison of LoRA with some of the common techniques used for fine-tuning large models:
| Technique | Parameter Efficiency | Computation Cost | Model Preservation | 
|---|---|---|---|
| Full Fine-Tuning | High | High | No | 
| Adapter Layers | Moderate | Moderate | Yes | 
| LoRA | High | Low | Yes | 
| Prefix Tuning | High | Moderate | Yes | 
Applications
- Natural Language Processing (NLP): It is used to fine-tune large transformer models like GPT, BERT and T5 for various tasks including text classification, sentiment analysis, summarization and machine translation.
- Computer Vision: It can be applied to vision transformers (ViTs) for tasks such as image classification, object detection and segmentation, enabling efficient adaptation to specific image-related tasks.
- Speech Processing: It is also effective in speech recognition tasks such as automatic speech recognition (ASR) and text-to-speech (TTS) systems making it easier to adapt these models to specific languages or accents.
- Large Language Models (LLMs): It is used to fine-tune large open-source models like LLaMA, BERT and T5, reducing computational overhead and enabling efficient task adaptation.
Advantages
- Reduced GPU Memory Consumption: By only updating low-rank matrices, it reduces memory usage making it easier to fine-tune large models on hardware with limited resources.
- Faster Fine-Tuning: It speeds up the fine-tuning process by updating fewer parameters resulting in faster task-specific adaptation compared to traditional full fine-tuning.
- Improved Transferability: Since the original model weights remain frozen, it allows easy adaptation to multiple tasks, preserving the knowledge from the pre-trained model.
- Supports Multi-Task Learning: It enables training multiple low-rank adapters for different tasks without interference, supporting efficient multi-task learning.
Limitations
- Task-Specific Limitations: It performs best when the pre-trained model is already well-aligned with the target task. For tasks that differ from the model's original training, it may not be as effective as full model fine-tuning.
- Complexity in Selection: Deciding where to apply the low-rank matrices within the model such as which layers to target, requires careful consideration and expertise. An improper selection could result in suboptimal performance.
- Model Size: For smaller models, the benefits of using LoRA may not be as noticeable since the extra cost of fine-tuning the entire model is not that high. In these cases, full fine-tuning might be just as effective without needing LoRA.
