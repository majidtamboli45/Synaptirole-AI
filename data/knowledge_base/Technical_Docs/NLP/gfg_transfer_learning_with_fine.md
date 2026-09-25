# Transfer Learning with Fine

> Source: https://www.geeksforgeeks.org/nlp/transfer-learning-and-fine-tuning-in-nlp/

Transfer learning is a technique that reuses the knowledge learned by a pre-trained model to solve a new but related task. Instead of building a model from scratch, it adapts an existing model using a smaller task-specific dataset.
- Requires less labeled data than training a new model from scratch.
- Speeds up model development and improves learning efficiency.
- Delivers strong performance even on domain specific tasks.
- Commonly applied to sentiment analysis, text classification and question answering.
Fine-Tuning BERT Model for Sentiment Analysis using Transfer Learning
1. Installing and Importing Required Libraries
First, we will install the Hugging Face transformers library. The transformers library from Hugging Face provides pre-trained models and tokenisers.
!pip install transformers
We are importing PyTorch for tensor operations and model training.
- DataLoader and TensorDataset help load and batch data efficiently during training.
- torch.nn.functional provides functions like softmax for calculating prediction probabilities.
- AdamW is the optimizer suited for transformer models.
- BertTokenizer converts text into tokens that BERT can understand.
- BertForSequenceClassification loads the BERT model adapted for classification tasks.
import torch
from transformers import BertTokenizer, BertForSequenceClassification
from torch.optim import AdamW
from torch.utils.data import DataLoader, TensorDataset
import torch.nn.functional as F
2. Loading the Pre-Trained BERT Model and Tokenizer
We load the bert-base-uncased model and its tokenizer. The tokenizer converts raw text into input IDs and attention masks which BERT requires.
- BertTokenizer.from_pretrained(): Prepares text for BERT input.
- BertForSequenceClassification.from_pretrained(): Loads BERT configured for classification tasks with two output labels like positive and negative.
pretrained_model_name = 'bert-base-uncased'
tokenizer = BertTokenizer.from_pretrained(pretrained_model_name)
model = BertForSequenceClassification.from_pretrained(pretrained_model_name, 
                                                      num_labels=2)
Move the model to GPU if available:
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)
3. Preparing the Training Dataset
We create a small labeled dataset for sentiment analysis. Here:
- 1 represents positive sentiment
- 0 represent negative sentiment.
train_texts = [
    "I love this product, it's amazing!",  # Positive
    "Absolutely fantastic experience, will buy again!",  # Positive
    "Worst purchase ever. Completely useless.",  # Negative
    "I hate this item, it doesn't work!",  # Negative
    "The quality is top-notch, highly recommend!",  # Positive
    "Terrible service, never coming back.",  # Negative
    "This is the best thing I've ever bought!",  # Positive
    "Very disappointing. Waste of money.",  # Negative
    "Superb! Exceeded all my expectations.",  # Positive
    "Not worth the price at all.",  # Negative
]
train_labels = torch.tensor([1, 1, 0, 0, 1, 0, 1, 0, 1, 0]).to(device)
4. Tokenizing the Dataset
The tokenizer processes text into fixed-length sequences, adding padding and truncation as needed.
- padding=True: Ensures all input sequences have the same length.
- truncation=True: Shortens long sentences beyond max_length=128.
encoded_train = tokenizer(train_texts,
                          padding=True,
                          truncation=True,
                          max_length=128,
                          return_tensors='pt')
train_input_ids = encoded_train['input_ids'].to(device)
train_attention_masks = encoded_train['attention_mask'].to(device)
5. Creating a DataLoader for Efficient Training
Data is wrapped in TensorDataset and loaded into DataLoader to enable mini-batch training which improves training efficiency and stability.
- TensorDataset(): Combines input IDs, attention masks and labels into a dataset.
- DataLoader(): Loads data in mini-batches to improve efficiency.
train_dataset = TensorDataset(
    train_input_ids, train_attention_masks, train_labels)
train_loader = DataLoader(train_dataset, batch_size=2, shuffle=True)
6. Defining the Optimizer
We use the AdamW optimizer which works well with transformer models.
optimizer = AdamW(model.parameters(), lr=2e-5)
7. Training the model
The training loop iterates over batches, computing loss and gradients, updating model weights and tracking accuracy.
- optimizer.zero_grad(): Clears gradients before each batch.
- model(...): Runs forward pass and calculates loss.
- loss.backward(): Backpropagates the error.
- optimizer.step(): Updates model weights based on gradients.
- torch.argmax(F.softmax(...)): Determines predicted class.
epochs = 5
model.train()
for epoch in range(epochs):
    total_loss = 0
    correct = 0
    total = 0
    for batch in train_loader:
        batch_input_ids, batch_attention_masks, batch_labels = batch
        optimizer.zero_grad()
        outputs = model(input_ids=batch_input_ids, 
                        attention_mask=batch_attention_masks, 
                        labels=batch_labels)
        loss = outputs.loss
        logits = outputs.logits
        total_loss += loss.item()
        loss.backward()
        optimizer.step()
        preds = torch.argmax(F.softmax(logits, dim=1), dim=1)
        correct += (preds == batch_labels).sum().item()
        total += batch_labels.size(0)
    avg_loss = total_loss / len(train_loader)
    accuracy = correct / total * 100
    print(f"Epoch {epoch+1} - Loss: {avg_loss:.4f}, Accuracy: {accuracy:.2f}%")
Output:
7. Saving and Loading the Fine-Tuned Model
We can save the model using torch.save() function. The model’s state dictionary is saved and can be reloaded later for inference or further training.
Saving the model:
torch.save(model.state_dict(), "fine_tuned_bert.pth")
Loading the fine-tuned model:
model.load_state_dict(torch.load("fine_tuned_bert.pth"))
model.to(device)
8. Creating test data for Evaluation
We prepare a test dataset and run the fine-tuned model to measure accuracy and make predictions on new text samples.
- torch.tensor([...]).to(device) converts the label list into a tensor and moves it to the computing device like CPU or GPU.
- tokenizer(test_texts, padding=True, truncation=True, max_length=128, return_tensors='pt') tokenizes the test texts.
- encoded_test['input_ids'] extracts token IDs representing each word or subword.
- encoded_test['attention_mask'] extracts attention masks indicating which tokens should be attended to (1) and which are padding (0).
test_texts = [
    "This is a great product, I love it!",  # Positive
    "Horrible experience, I want a refund!",  # Negative
    "Highly recommended! Five stars.",  # Positive
    "Not worth it. I regret buying this.",  # Negative
]
test_labels = torch.tensor([1, 0, 1, 0]).to(device)
encoded_test = tokenizer(test_texts, 
                         padding=True, 
                         truncation=True, 
                         max_length=128, 
                         return_tensors='pt')
                         
test_input_ids = encoded_test['input_ids'].to(device)
test_attention_masks = encoded_test['attention_mask'].to(device)
9. Making Predictions and Evaluating Performance
We set the model to evaluation mode using model.eval() to disable training-specific layers like dropout. Accuracy is calculated by comparing predicted labels to true labels and computing the percentage correct. Each test text and its predicted label are printed in a loop for review.
- torch.no_grad() disables gradient calculations for faster and more memory-efficient inference.
- The model processes inputs with model(input_ids=..., attention_mask=...) to produce output logits.
- torch.argmax(outputs.logits, dim=1) selects the class with the highest score as the prediction.
model.eval()
with torch.no_grad():
    outputs = model(input_ids=test_input_ids,
                    attention_mask=test_attention_masks)
    predicted_labels = torch.argmax(outputs.logits, dim=1)
test_accuracy = (predicted_labels == test_labels).sum(
).item() / len(test_labels) * 100
print(f"\nTest Accuracy: {test_accuracy:.2f}%")
for text, label in zip(test_texts, predicted_labels):
    print(f'Text: {text}\nPredicted Label: {label.item()}\n')
Output:
Here we can see that our model is working fine.
You can download the source code from here : Transfer Learning with Fine-Tuning in NLP.
