# Automatic Speech Recognition using CTC

> Source: https://www.geeksforgeeks.org/nlp/automatic-speech-recognition-using-ctc/

We use speeches to express ourselves. But sometimes it is crucial to store our speech in text format. One such technology is Automatic Speech Recognition which converts spoken language into written text. In this article, we will implement Automatic Speech Recognition using Connectionist Temporal Classification (CTC).
In various real-time applications like voice-activated virtual assistants and transcription services to dictation systems and language translation, ASR systems are everywhere being used to understand and transcribe spoken words accurately, making spoken information accessible in textual form. ASR involves a series of complex tasks, including feature extraction from audio signals, acoustic modelling to capture the characteristics of different sounds, language modelling to understand the context of words, and finally decoding to generate the final text output. The development of ASR systems has advanced significantly with the integration of deep learning techniques, leading to improved accuracy and performance.
What is CTC model?
The Connectionist Temporal Classification model is a neural network-based sequence-to-sequence model designed for tasks where the alignment between input and output sequences is not known a priori. In the context of ASR, CTC addresses the challenge of aligning variable-length audio sequences with their corresponding variable-length text transcriptions. The key idea behind CTC is to allow the model to learn the alignment during training without the need for explicit alignment information. CTC introduces a blank symbol and allows repetitions of both regular symbols and the blank symbol in the output sequence. This flexibility enables the model to handle sequences of different lengths and align them appropriately.
CTC model relies on some of the key-concepts which are listed below:
- Sequence-to-Sequence model: CTC is a neural network-based sequence-to-sequence model that excels in tasks where the alignment between input and output sequences is not predetermined which is particularly beneficial in scenarios with variable-length input and output sequences.
- Dynamic alignment learning: In Automatic Speech Recognition, aligning variable-length audio sequences with corresponding variable-length text transcriptions presents a significant challenge. The core idea behind the use of CTC model is to empower the model to learn the alignment between input and output sequences dynamically during training. Unlike traditional methods, CTC eliminates the need for explicit alignment information, making it more adaptable to varying sequence lengths.
- Blank symbolling: CTC introduces a special blank symbol in the output sequence. This blank symbol, along with repetitions of both regular symbols and the blank symbol which allows the model to align sequences of different lengths effectively. The blank symbol acts as a placeholder which facilitates the alignment learning process.
- Flexibility in Handling Variable-Length Sequences: The flexibility provided by CTC enables the model to handle sequences of different lengths without requiring explicit alignment annotations which makes it well-suited for ASR tasks where spoken utterances may vary in duration.
Automatic Speech Recognition Step-by-step implementation using CTC
1. Installing required modules
Before starting implementation, we need to install some required Python modules to our runtime.
!pip install transformers
!pip install datasets
!pip install evaluate
!pip install jiwer
!pip install accelerate
2. Importing required modules
Now we will import all required Python modules like NumPy, transformers, Evaluate and Torch etc.
from datasets import load_dataset, Audio
from transformers import AutoProcessor, AutoModelForCTC, TrainingArguments, Trainer, pipeline
import torch
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional, Union
import evaluate
import numpy as np
3. Dataset loading
Now we will load minds dataset which is specially used to speech recognition model training. We will load a smaller subset of data as per our system capabilities. After that we will split it into training and testing sets in 70:30 ratio. Also, we will remove all useless columns like "english_transcription", "intent_class", "lang_id" and only keep the audio and transcription columns with a fixed sampling rate of 16000 (general sampling rate of model input) for all audio files.
from datasets import load_dataset, Audio
# load the dataset.
# you may get "can't be fetched" error if the server of the dataset is down
minds = load_dataset("PolyAI/minds14", name="en-US", split="train[:400]")
# split the data into training and testing sets
minds = minds.train_test_split(test_size=0.2)
# removing useless columns
minds = minds.remove_columns(
    ["english_transcription", "intent_class", "lang_id"])
# preparing all the audio files in a fixed sampling rate of 16000
minds = minds.cast_column("audio", Audio(sampling_rate=16_000))
4. Defining processor
For Automatic Speech Recognition model finetuning we need to define a processor from pre-trained models
from transformers import AutoProcessor
processor = AutoProcessor.from_pretrained("facebook/wav2vec2-base")
5. Preparing the dataset
We need to prepare our dataset in certain format which can be compatible with model's input format. We can't pass raw dataset as that will not in compatible format. We need to make all the letters in upper case of transcription so we will define a small mapping function (uppercase) to to this. After that, we will define another small function (prepare_dataset) which will prepare the dataset with fixed input lengths and sampling rate. You can lower the mapping rate (num_proc) for more accurate mapping but it will take more time to run.
def uppercase(example):
    return {"transcription": example["transcription"].upper()}
minds = minds.map(uppercase)
def prepare_dataset(batch):
    audio = batch["audio"]
    batch = processor(audio["array"], 
                      sampling_rate=audio["sampling_rate"], 
                      text=batch["transcription"])
    batch["input_length"] = len(batch["input_values"][0])
    return batch
encoded_minds = minds.map(
    prepare_dataset, remove_columns=minds.column_names["train"], num_proc=16)
6. Data collection for CTC model
In this article, we will employ CTC model for ASR but to do this we need to collect data as input feature and feature labelling in batches. Here we will utilize our pre-defined processor with padding techniques for both input and labels.
import torch
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional, Union
@dataclass
class DataCollatorCTCWithPadding:
    processor: AutoProcessor
    padding: Union[bool, str] = "longest"
    def __call__(self, features: List[Dict[str, Union[List[int], torch.Tensor]]]) -> Dict[str, torch.Tensor]:
        # split inputs and labels since they have to be of different lengths and need different padding methods
        input_features = [{"input_values": feature["input_values"][0]} for feature in features]
        label_features = [{"input_ids": feature["labels"]} for feature in features]
        batch = self.processor.pad(input_features, padding=self.padding, return_tensors="pt")
        labels_batch = self.processor.pad(labels=label_features, padding=self.padding, return_tensors="pt")
        # To reduce lose more efficiently we will replace the padding with (-100)
        labels = labels_batch["input_ids"].masked_fill(labels_batch.attention_mask.ne(1), -100)
        batch["labels"] = labels
        return batch
data_collator = DataCollatorCTCWithPadding(processor=processor, padding="longest")
7. Evaluation metrics for ASR
In Automatic Speech Recognition, the most common evaluation metrics is Word Error Rate or WER. This is basically a calculation of errors in words during generation of transcription. Less WER means better transcription. To calculate WER during our model training we will define a small function (compute_metrics) for it.
wer = evaluate.load("wer")
def compute_metrics(pred):
    pred_logits = pred.predictions
    pred_ids = np.argmax(pred_logits, axis=-1)
    pred.label_ids[pred.label_ids == -100] = processor.tokenizer.pad_token_id
    pred_str = processor.batch_decode(pred_ids)
    label_str = processor.batch_decode(pred.label_ids, group_tokens=False)
    word_error_rate = wer.compute(predictions=pred_str, references=label_str)
    return {"wer": word_error_rate}
8. Defining the CTC model
Now we will load a publicly available pre-trained CTC model for further fine-tuning. We will set the CTC loss reduction policy as mean for better loss ignorance.
from transformers import AutoModelForCTC, TrainingArguments, Trainer
model = AutoModelForCTC.from_pretrained(
    "facebook/wav2vec2-base",
    ctc_loss_reduction="mean",   # better loss reduction but 'avg' can be used
    pad_token_id=processor.tokenizer.pad_token_id,
)
9. Model training and Fine-tuning
Now we will train and fine-tune the pre-trained model with various hyper-parameters. The values for hyper-parameters are set for standard to low machine resources. If you have better machine resources, try to increase the values for better fine-tuning and less WER.
training_args = TrainingArguments(
    output_dir="GeeksforGeeks_ASR_CTC_Finetuned",
    per_device_train_batch_size=4,
    gradient_accumulation_steps=2,
    learning_rate=4e-4,      # increase this if you have good computing resources
    warmup_steps=500,   # increase this(if you have sufficient resources) for better transcription(min 500)
    max_steps=1000,     # increase this(if you have sufficient resources) for better transcription(min 1000)
    gradient_checkpointing=True,
    fp16=True,       # set this to True if you have GPU enabled to you runtime
    group_by_length=True,
    evaluation_strategy="steps",
    per_device_eval_batch_size=8,
    save_steps=1000,                 # increase this(if you have sufficient resources) for better transcription(min 1000)
    eval_steps=1000,                 # increase this(if you have sufficient resources) for better transcription(min 1000)
    logging_steps=25,
    load_best_model_at_end=True,
    metric_for_best_model="wer",
    greater_is_better=False,
    #push_to_hub=False,
)
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=encoded_minds["train"],
    eval_dataset=encoded_minds["test"],
    tokenizer=processor,
    data_collator=data_collator,
    compute_metrics=compute_metrics,
)
trainer.train()
Output:
Step    Training Loss    Validation Loss    Wer
1000    3.292600    3.293691    1.000000
10. Pipeline for model testing
After finish running you can expand the model directory and copy the path of the model check points. This will be used in pipeline to use our finetuned model. See the below referral image for better understanding of which path needs to be used.
In our case, we will copy the path of 'checkpoint-1000'. Similarly, you need to use your own model's check point to test the model.
# pipeline for model testing
from transformers import pipeline
dataset = load_dataset("PolyAI/minds14", "en-US", split="train[:25]")
dataset = dataset.cast_column("audio", Audio(sampling_rate=16000))
sampling_rate = dataset.features["audio"].sampling_rate
audio_file = dataset[0]["audio"]["path"]
# load the model check-point
transcriber = pipeline("automatic-speech-recognition",
                       model='/content/GeeksforGeeks_ASR_CTC_Finetuned/checkpoint-1000')
transcriber(audio_file)
# actual speech
dataset['transcription'][0]
Output:
'I would like to set up a joint account with my partner'
Applications of CTC
CTC model is widely used in various real-time applications which are listed below:
- Automatic Speech Recognition (ASR): CTC models are widely used in ASR systems to transcribe spoken language into text. They have shown effectiveness in handling variable-length utterances and mitigating the need for precise alignment information during training.
- Handwriting Recognition: CTC has been applied to handwritten text recognition where the challenge lies in aligning variable-length sequences of written symbols with their corresponding words or characters.
- Gesture Recognition: In applications involving gesture recognition from video or sensor data, CTC models can be adapted to handle sequences of gestures and produce meaningful transcriptions.
- Medical Transcription: CTC is applied in medical transcription tasks where physicians' spoken notes or conversations need to be converted into written text for documentation purposes like generating prescriptions from speech.
Conclusion
We can conclude that, finetuning an Automatic Speech Recognition model is a complex and time-consuming task but using CTC model we can perform this task comparatively faster.
Get the Complete Notebook:
Notebook: click here.
