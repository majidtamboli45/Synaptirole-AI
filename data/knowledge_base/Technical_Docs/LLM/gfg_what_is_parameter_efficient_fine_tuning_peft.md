# What is Parameter-Efficient Fine-Tuning (PEFT)?

> Source: https://www.geeksforgeeks.org/artificial-intelligence/what-is-parameter-efficient-fine-tuning-peft/

Parameter-Efficient Fine-Tuning (PEFT) is a technique that fine-tunes large pretrained language models (LLMs) for specific tasks by updating only a small subset of their parameters while keeping most of the model unchanged. This approach typically reduces computational costs and training time of LLMs for specialised tasks without retraining the entire model.
Problem with Traditional Fine-Tuning
Traditional fine-tuning updates a pre-trained model to perform a specific task, but it becomes inefficient as model size grows. Modern LLMs contain billions of parameters making full fine-tuning costly and resource-intensive.
- Updates all model parameters, which requires high computational power and memory.
- Needs large storage since separate copies of the model are saved for each task.
- Training becomes slow and expensive, especially for very large models.
- Risk of overfitting when fine-tuned on small or task-specific datasets.
- Difficult to deploy and maintain multiple fine-tuned models in real-world applications.
How Parameter-Efficient Fine-Tuning (PEFT) Works
1. Start with a Pre-trained Model
A large language model is first taken that has already learned general language patterns from vast amounts of training data. This pretrained knowledge serves as a strong foundation, allowing it to be efficiently fine-tuned for specific tasks.
- Uses pre-trained models like BERT, GPT or T5 that already have a strong understanding of language.
- These models have learned grammar, context and general knowledge from large datasets.
- This existing knowledge can be reused, so we only need to focus on the new task instead of training everything again.
2. Freeze the Core Model
In PEFT, the original pre-trained model is not updated during training. Instead, it's weights are kept fixed and only a small set of additional parameters are trained for the new task.
- Preserves the pre-trained model’s knowledge by keeping its weights unchanged.
- Reduces computational cost and memory usage by limiting trainable parameters.
- Avoids storing multiple full models, making deployment more efficient.
3. Add Task-Specific Trainable Layers
Instead of modifying the entire model, PEFT introduces small, task-specific components that can be trained while the main model stays frozen. These components capture the changes needed for the new task.
- Adds small, trainable modules or updates a limited set of parameters instead of the full model.
- Learns task-specific patterns without affecting the core pre-trained model.
- Maintains efficiency while enabling easy customization using techniques like adapters, LoRA, and prompt tuning.
4. Train Only Selected Parameters
In PEFT, training is focused only on the newly added or selected parameters, while the main model remains completely unchanged. This makes the fine-tuning process much more efficient and targeted.
- Updates only a small set of parameters, reducing training complexity.
- Keeps the core model frozen, preserving its original knowledge.
- Requires less data and converges faster compared to full fine-tuning.
- Lowers the risk of overfitting on small or task-specific datasets.
- Makes experimentation easier since only a small part of the model is trained.
5. Scalable and Efficient Deployment
After fine-tuning, only the small task-specific components are stored and used, while the main pre-trained model remains the same. This makes deployment highly efficient and scalable.
- A single base model can handle multiple tasks using different lightweight modules.
- Task switching is simple by loading the required module when needed.
- Reduces storage and deployment cost by saving only small task-specific components.
PEFT Techniques for LLMs
PEFT is not a single technique but a collection of methods designed to efficiently fine-tune large language models. Each method takes a different approach to updating a small subset of parameters and the choice depends on factors like the task, available resources and required performance.
1. Adapter Modules
Adapter modules are small neural network layers inserted between the layers of a pre-trained model. During fine-tuning, only these adapters are trained while the original model weights remain frozen, enabling efficient and modular learning.
- Adds a small number of additional parameters, making training lightweight and efficient.
- Supports multi-task learning by using different adapters for different tasks on the same base model.
Hugging Face AdapterHub provides a collection of pre-trained adapters that can be plugged into models for tasks like text classification, translation and question answering without modifying the original model.
2. LoRA (Low-Rank Adaptation)
LoRA reduces the number of trainable parameters by representing weight updates as low-rank matrices. Instead of modifying the full weight matrix, it learns small, efficient updates that approximate the required changes for fine-tuning.
- Significantly reduces memory and computation while maintaining performance close to full fine-tuning.
- Can be easily integrated into existing models without modifying the original weights.
LoRA has been widely used with large models like GPT-3 and T5, where it enables efficient fine-tuning for tasks such as text generation and summarization without updating billions of parameters.
3. DoRA (Weight-Decomposed Low-Rank Adaptation)
DoRA extends LoRA by introducing a weight-decomposition strategy, where model weights are separated into a scaling component and a low-rank update. This allows more precise control over parameter updates while keeping the process efficient.
- Improves performance by combining scaling factors with low-rank adaptations.
- Maintains low computational cost while offering better stability and flexibility than LoRA.
DoRA is useful in scenarios like cross-domain adaptation or multilingual tasks, where models need to efficiently adapt to new data distributions while maintaining strong performance.
4. Prefix Tuning
Prefix tuning is a PEFT technique where a small set of learnable prefix vectors is added to the model at each layer. These prefixes guide the model’s behavior for a specific task without modifying the original model parameters.
- Learns task-specific behavior by optimizing only the prefix vectors.
- Keeps the pre-trained model unchanged while enabling flexible control over outputs.
Prefix tuning is commonly used in text generation tasks, where the learned prefixes can control the style, tone, or content of the generated output without retraining the full model.
5. Prompt Tuning
Prompt tuning is a PEFT technique that learns a set of soft (continuous) prompt vectors added to the input sequence. Unlike other methods, it operates only at the input level, without modifying the internal layers of the model.
- Trains only a small set of input-level prompt parameters, making it simple and lightweight.
- Does not require changes to the model architecture, enabling easy implementation.
Prompt tuning is effective in few-shot learning scenarios, where limited labeled data is available, allowing quick adaptation of the model to tasks like classification or text generation.
6. BitFit (Bias-Term Fine-Tuning)
BitFit fine-tunes only the bias terms of a neural network while keeping all other parameters frozen. Despite updating very few parameters, it can still achieve strong performance on many NLP tasks.
- Updates only bias parameters, making it extremely lightweight and memory-efficient.
- Requires minimal changes to the model and is easy to implement.
BitFit can be used for tasks like sentiment analysis or text classification, where adjusting only bias terms is often enough to adapt the model without full fine-tuning.
7. (IA)³ (Infused Adapter by Inhibiting and Amplifying Inner Activations)
(IA)3 adjusts a model’s behavior by scaling its internal activations instead of adding new layers or heavily modifying weights. It introduces small, learnable parameters that control how information flows through the network.
- Modulates internal activations using scaling factors, enabling fine-grained control.
- Adds very few parameters, keeping the method efficient and lightweight.
(IA)3 is effective in tasks like text classification, where subtle adjustments in internal representations can significantly improve performance without full fine-tuning.
Implementation
Here we implement Parameter-Efficient Fine-Tuning (PEFT) using LoRA as an example technique on the IMDb dataset. This demonstrates how PEFT methods can efficiently adapt large models while training only a small subset of parameters.
Step 1: Installing Required Libraries
Install required libraries Transformers, Datasets, Peft, Accelerate and Scikit Learn to set up the fine-tuning environment.
!pip install -q transformers datasets peft accelerate evaluate scikit-learn
Step 2: Loading Model & Dataset
We use BERT-base-uncased as our pre-trained model which already has strong language understanding. The IMDb dataset contains 50k movie reviews labeled as positive or negative. This combination makes it a good benchmark to show PEFT for sentiment analysis.
from transformers import AutoModelForSequenceClassification, AutoTokenizer, TrainingArguments, Trainer
from datasets import load_dataset
from peft import LoraConfig, get_peft_model
model_name = "bert-base-uncased"
dataset = load_dataset("imdb")  
tokenizer = AutoTokenizer.from_pretrained(model_name)
Step 3: Preprocessing Data
Before training, we tokenize the reviews so that BERT can process them. Each review is truncated or padded to a maximum length of 128 tokens for consistency. Finally we rename label to labels and set the dataset format to PyTorch tensors.
def preprocess(example):
    return tokenizer(example["text"], truncation=True, padding="max_length", max_length=128)
encoded_dataset = dataset.map(preprocess, batched=True)
encoded_dataset = encoded_dataset.rename_column("label", "labels")
encoded_dataset.set_format("torch")
Step 4: Configuring LoRA
Instead of updating all BERT weights, we configure LoRA (Low-Rank Adaptation) to inject small trainable matrices inside the attention layers (query, value). This reduces the number of trainable parameters while still adapting the model effectively. The dropout helps avoid overfitting during fine-tuning.
lora_config = LoraConfig(
    r=8,                          
    lora_alpha=16,                
    target_modules=["query", "value"],  
    lora_dropout=0.05,
    bias="none",
    task_type="SEQ_CLS"           
)
model = AutoModelForSequenceClassification.from_pretrained(model_name, num_labels=2)
model = get_peft_model(model, lora_config)
Step 5: Training
We define training arguments using Hugging Face’s Trainer.
- Batch size is set to 16 for both training and evaluation.
- Learning rate is slightly higher (2e-4) since we are only training small LoRA layers.
- For demonstration, we train on a subset (2000 training + 1000 test samples) to reduce runtime.
training_args = TrainingArguments(
    output_dir="./lora-imdb",
    per_device_train_batch_size=16,
    per_device_eval_batch_size=16,
    learning_rate=2e-4,
    num_train_epochs=2,
    logging_dir="./logs",
    report_to="none",
    eval_strategy="epoch",
    save_strategy="epoch"
)
trainer = Trainer(
    model=model,
    args=training_args,
    train_dataset=encoded_dataset["train"].shuffle(seed=42).select(range(2000)), 
    eval_dataset=encoded_dataset["test"].shuffle(seed=42).select(range(1000)),
)
trainer.train()
model.save_pretrained("./lora-imdb-adapter")
tokenizer.save_pretrained("./lora-imdb-adapter")
Output:
Step 6: Making Predictions
Once trained, we can test our model on new sentences. We load the fine-tuned LoRA adapter and run a few sample reviews through a sentiment pipeline. The output gives us the predicted label (POSITIVE or NEGATIVE) along with confidence scores between 0 and 1.
from transformers import pipeline
sentiment = pipeline(
    "text-classification",
    model="./lora-imdb-adapter",
    tokenizer="bert-base-uncased"
)
label_map = {"LABEL_0": "NEGATIVE", "LABEL_1": "POSITIVE"}
examples = [
    "I absolutely loved this film—best sci-fi I’ve seen in years!",
    "It was okay, not great, but worth a watch.",
    "Terrible plot, terrible acting, total waste of time."
]
for text in examples:
    result = sentiment(text)[0]
    print(f"{text[:40]}... → {label_map[result['label']]} ({result['score']:.2f})")
Output:
The results are decent but not highly accurate yet, mainly because we trained for only 2 epochs on a small subset of the IMDb dataset (2000 samples). With longer training, more data, hyperparameter tuning or larger LoRA ranks, the model’s performance would improve significantly.
You can download source code from here.
Full Fine-Tuning vs PEFT
When we compare full fine-tuning with parameter-efficient fine-tuning (PEFT), the differences become clear:
| Attribute | Full Fine-Tuning | PEFT (Parameter-Efficient Fine-Tuning) | 
|---|---|---|
| Parameters Updated | Updates every parameter of the model (billions of weights). | Updates only a small subset or adds small modules; base model stays frozen. | 
| Compute Requirement | Needs very high compute (multi-GPU / TPU). | Can run on a single GPU or modest hardware. | 
| Storage Requirement | Stores a full model for each task; heavy storage usage. | Stores only small adapter weights; base model reused. | 
| Performance | Strong results but expensive and less scalable. | Almost same performance but much cheaper and scalable. | 
| Practicality | Difficult in low-resource setups; fits large labs. | Practical for edge devices, startups, universities, research groups. | 
Applications
- Fine-tuning models to run on devices with limited memory or computing power such as mobile phones, IoT devices or embedded systems.
- Using one shared base model with separate lightweight adapters for different tasks. This avoids storing a full copy of the model for each task.
- Creating task-specific or user-specific adapters so organizations and individuals can have custom models without retraining everything.
Limitation
- In some cases, full fine-tuning still delivers slightly higher accuracy, especially for very complex tasks that require deep adaptation.
- It includes techniques like LoRA, Adapters, Prefix-Tuning and BitFit. Each has its strengths but also limitations. Choosing the right one for a specific task is not always straightforward.
- Some PEFT models may perform well on the training dataset but struggle to generalize to different domains or unseen data.
- When we use one model for many tasks, we often end up with many small adapters. Keeping track of them and integrating them efficiently can become complex.
