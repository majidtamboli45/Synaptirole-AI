# Speech emotion Recognition using Transfer Learning

> Source: https://www.geeksforgeeks.org/nlp/speech-emotion-recognition-using-transfer-learning/

This article provides a comprehensive guide to implementing Speech Emotion Recognition (SER) using Transfer Learning, leveraging tools like Librosa for audio feature extraction and VGG16 for robust classification.
Prerequisites: VGG-16
Need for Speech Emotion Recognition
Speech emotion recognition (SER) focuses on analyzing the pitch, tone, loudness, and frequency of sound to identify emotions in speech. This technique plays a crucial role in industries like entertainment, customer service, robotics, and security by providing insights into customer sentiment and human interactions.
Transfer Learning is a powerful technique where a pre-trained model is fine-tuned and reused for new datasets. It eliminates the need to train a model from scratch, significantly reducing training time and improving efficiency.
Why Use CNN Based Model for Speech Emotion Recognition?
- Mel-Spectrograms as Images: Speech features are converted into visual representations, making CNNs ideal for processing.
- Feature Extraction: CNNs capture global and local characteristics effectively.
- Transfer Learning: Pre-trained models like VGG16 reduce training time and improve accuracy by leveraging existing knowledge.
Techniques and Tools
In this project, we use Python due to its robust library ecosystem. Speech data contains features such as pitch, loudness, and frequency that need to be accurately captured for analysis.
- Librosa: A popular library for audio analysis. Its Mel-Frequency Cepstral Coefficients (MFCC) method extracts key audio features by converting the audio into small parts, applying filters, and analyzing the frequencies.
- NumPy: Used to store feature values in arrays.
- PyTorch: Chosen for implementing transfer learning due to its ease of debugging and flexibility.
- VGG16: A pre-trained Convolutional Neural Network (CNN) model is fine-tuned for emotion classification.
For this task, we will utilize the Toronto Emotional Speech Set (TESS), which includes 2,800 samples of seven emotions recorded by a 64-year-old woman and a young woman in her 20s.
The emotions are:
- Anger
- Disgust
- Fear
- Happiness
- Pleasant Surprise
- Sadness
- Neutral
You can download the dataset from here.
Step 1: Import Required Libraries
Import the necessary libraries for data preprocessing, model creation, and training. Key libraries include:
- librosa: For audio feature extraction.
- torch and torchvision: For building and training the neural network.
- numpy: For handling numerical data.
- os: For file path manipulations.
import os
import librosa
import torch
from torch.utils.data import Dataset
import numpy as np
from torch.utils.data import DataLoader, random_split
import torch.nn as nn
import torchvision.models as models
import matplotlib.pyplot as plt
Step 2: Define the Custom Dataset Class
The EmotionDataset class loads audio files, preprocesses them into Mel-Spectrograms, and prepares data for model training.
class EmotionDataset(Dataset):
    def __init__(self, data_path, emotions, transform=None):
        self.data_path = data_path
        self.emotions = emotions
        self.file_list = []
        self.labels = []
        self.transform = transform
        for idx, emotion in enumerate(emotions):
            emotion_folders = [f'YAF_{emotion}', f'OAF_{emotion}']
            for folder in emotion_folders:
                folder_path = os.path.join(data_path, folder)
                if os.path.exists(folder_path):
                    for file_name in os.listdir(folder_path):
                        file_path = os.path.join(folder_path, file_name)
                        self.file_list.append(file_path)
                        self.labels.append(idx)
    def __len__(self):
        return len(self.file_list)
    def __getitem__(self, idx):
        file_path = self.file_list[idx]
        label = self.labels[idx]
        y, sr = librosa.load(file_path, sr=16000)
        mel_spectrogram = librosa.feature.melspectrogram(y=y, sr=sr, n_mels=128)
        mel_spectrogram_db = librosa.power_to_db(mel_spectrogram, ref=np.max)
        max_length = 128
        pad_width = max_length - mel_spectrogram_db.shape[1]
        if pad_width > 0:
            mel_spectrogram_db = np.pad(mel_spectrogram_db, pad_width=((0, 0), (0, pad_width)), mode='constant')
        else:
            mel_spectrogram_db = mel_spectrogram_db[:, :max_length]
        mel_spectrogram_3ch = np.repeat(mel_spectrogram_db[np.newaxis, :, :], 3, axis=0)
        return torch.tensor(mel_spectrogram_3ch, dtype=torch.float32), torch.tensor(label)
Step 3: Define the Emotion Recognition Model
Use a pre-trained VGG16 model for transfer learning. Freeze the existing layers and replace the final layer with a custom classification layer for emotion recognition.
class EmotionRecognitionModel(nn.Module):
    def __init__(self, num_classes):
        super(EmotionRecognitionModel, self).__init__()
        self.vgg = models.vgg16(pretrained=True)
        for param in self.vgg.parameters():
            param.requires_grad = False
        self.vgg.classifier[6] = nn.Linear(self.vgg.classifier[6].in_features, num_classes)
    def forward(self, x):
        return self.vgg(x)
Step 4: Initialize Dataset and DataLoader
- Initialize the dataset with the path and emotion categories.
- Split the dataset into training, validation, and test sets.
- Create DataLoaders for batch processing.
emotions = ['anger', 'disgust', 'fear', 'happiness', 'pleasant_surprise', 'sadness', 'neutral']
data_path = 'TESS Toronto emotional speech set data'
dataset = EmotionDataset(data_path, emotions)
train_size = int(0.7 * len(dataset))
val_size = int(0.15 * len(dataset))
test_size = len(dataset) - train_size - val_size
train_dataset, val_dataset, test_dataset = random_split(dataset, [train_size, val_size, test_size])
train_loader = DataLoader(train_dataset, batch_size=32, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=32)
test_loader = DataLoader(test_dataset, batch_size=32)
Step 5: Training the Model
- Define the loss function (CrossEntropyLoss) and optimizer (Adam).
- Train the model for 10 epochs and calculate training and validation accuracy.
model = EmotionRecognitionModel(num_classes=len(emotions))
criterion = nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=1e-4)
num_epochs = 10
for epoch in range(num_epochs):
    model.train()
    train_loss = 0.0
    total_train_correct = 0
    total_train_samples = 0
    for inputs, labels in train_loader:
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()
        train_loss += loss.item()
        total_train_correct += (outputs.argmax(dim=1) == labels).sum().item()
        total_train_samples += labels.size(0)
    train_accuracy = total_train_correct / total_train_samples
    print(f"Epoch [{epoch+1}/{num_epochs}], Training Accuracy: {train_accuracy:.4f}")
Output:
Epoch [1/10], Training Loss: 3.5698, Training Accuracy: 0.3829
Epoch [1/10], Validation Loss: 0.6287, Validation Accuracy: 0.7867
Epoch [2/10], Training Loss: 1.6390, Training Accuracy: 0.4850
Epoch [2/10], Validation Loss: 0.2506, Validation Accuracy: 0.8433
.
.
.
Epoch [10/10], Training Loss: 0.3281, Training Accuracy: 0.7450
Epoch [10/10], Validation Loss: 0.0285, Validation Accuracy: 0.9493
Final Training Accuracy: 0.7450
Final Validation Accuracy: 0.9493
Step 7: Predict an Emotion
Use the trained model to predict the emotion of a new audio file.
def predict_emotion(audio_path):
    y, sr = librosa.load(audio_path, sr=16000)
    mel_spectrogram = librosa.feature.melspectrogram(y=y, sr=sr, n_mels=128)
    mel_spectrogram_db = librosa.power_to_db(mel_spectrogram, ref=np.max)
    max_length = 128
    pad_width = max_length - mel_spectrogram_db.shape[1]
    if pad_width > 0:
        mel_spectrogram_db = np.pad(mel_spectrogram_db, pad_width=((0, 0), (0, pad_width)), mode='constant')
    else:
        mel_spectrogram_db = mel_spectrogram_db[:, :max_length]
    mel_spectrogram_3ch = np.repeat(mel_spectrogram_db[np.newaxis, :, :], 3, axis=0)
    input_tensor = torch.tensor(mel_spectrogram_3ch, dtype=torch.float32).unsqueeze(0)
    model.eval()
    with torch.no_grad():
        output = model(input_tensor)
        predicted_class = output.argmax(dim=1).item()
    return emotions[predicted_class]
audio_file_path = '/path/to/audio.wav'  # Replace with your audio file path
predicted_emotion = predict_emotion(audio_file_path)
print(f"Predicted Emotion: {predicted_emotion}")
Output:
Predicted Emotion: fear
Complete Code
import os
import librosa
import torch
from torch.utils.data import Dataset
import numpy as np
from torch.utils.data import DataLoader, random_split
import torch.nn as nn
import torchvision.models as models
import matplotlib.pyplot as plt
import librosa
import torch
class EmotionDataset(Dataset):
    def __init__(self, data_path, emotions, transform=None):
        self.data_path = data_path
        self.emotions = emotions
        self.file_list = []
        self.labels = []
        self.transform = transform
        for idx, emotion in enumerate(emotions):
            emotion_folders = [f'YAF_{emotion}', f'OAF_{emotion}']
            for folder in emotion_folders:
                folder_path = os.path.join(data_path, folder)
                if os.path.exists(folder_path):
                    for file_name in os.listdir(folder_path):
                        file_path = os.path.join(folder_path, file_name)
                        self.file_list.append(file_path)
                        self.labels.append(idx)
    def __len__(self):
        return len(self.file_list)
    def __getitem__(self, idx):
        file_path = self.file_list[idx]
        label = self.labels[idx]
        y, sr = librosa.load(file_path, sr=16000)
        mel_spectrogram = librosa.feature.melspectrogram(y=y, sr=sr, n_mels=128)
        mel_spectrogram_db = librosa.power_to_db(mel_spectrogram, ref=np.max)
        max_length = 128
        pad_width = max_length - mel_spectrogram_db.shape[1]
        if pad_width > 0:
            mel_spectrogram_db = np.pad(mel_spectrogram_db, pad_width=((0, 0), (0, pad_width)), mode='constant')
        else:
            mel_spectrogram_db = mel_spectrogram_db[:, :max_length]
        mel_spectrogram_3ch = np.repeat(mel_spectrogram_db[np.newaxis, :, :], 3, axis=0)
        return torch.tensor(mel_spectrogram_3ch, dtype=torch.float32), torch.tensor(label)
class EmotionRecognitionModel(nn.Module):
    def __init__(self, num_classes):
        super(EmotionRecognitionModel, self).__init__()
        self.vgg = models.vgg16(pretrained=True)
        for param in self.vgg.parameters():
            param.requires_grad = False
        self.vgg.classifier[6] = nn.Linear(self.vgg.classifier[6].in_features, num_classes)
    def forward(self, x):
        return self.vgg(x)
emotions = ['anger', 'disgust', 'fear', 'happiness', 'pleasant_surprise', 'sadness', 'neutral']
data_path = '/content/drive/MyDrive/extract_speech/TESS Toronto emotional speech set data'
dataset = EmotionDataset(data_path, emotions)
train_size = int(0.7 * len(dataset))
val_size = int(0.15 * len(dataset))
test_size = len(dataset) - train_size - val_size
train_dataset, val_dataset, test_dataset = random_split(dataset, [train_size, val_size, test_size])
train_loader = DataLoader(train_dataset, batch_size=32, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=32)
model = EmotionRecognitionModel(num_classes=len(emotions))
criterion = nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=1e-4)
total_train_correct = 0
total_train_samples = 0
total_val_correct = 0
total_val_samples = 0
num_epochs = 10
for epoch in range(num_epochs):
    model.train()
    train_loss = 0.0
    
    for inputs, labels in train_loader:
        optimizer.zero_grad()
        outputs = model(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()
        train_loss += loss.item()
        total_train_correct += (outputs.argmax(dim=1) == labels).sum().item()
        total_train_samples += labels.size(0)
    avg_train_loss = train_loss / len(train_loader)
    train_accuracy = total_train_correct / total_train_samples
    print(f"Epoch [{epoch+1}/{num_epochs}], Training Loss: {avg_train_loss:.4f}, Training Accuracy: {train_accuracy:.4f}")
    
    model.eval()
    val_loss = 0.0
    with torch.no_grad():
        for inputs, labels in val_loader:
            outputs = model(inputs)
            loss = criterion(outputs, labels)
            val_loss += loss.item()
            total_val_correct += (outputs.argmax(dim=1) == labels).sum().item()
            total_val_samples += labels.size(0)
    avg_val_loss = val_loss / len(val_loader)
    val_accuracy = total_val_correct / total_val_samples
    print(f"Epoch [{epoch+1}/{num_epochs}], Validation Loss: {avg_val_loss:.4f}, Validation Accuracy: {val_accuracy:.4f}")
final_train_accuracy = total_train_correct / total_train_samples
final_val_accuracy = total_val_correct / total_val_samples
print(f"Final Training Accuracy: {final_train_accuracy:.4f}")
print(f"Final Validation Accuracy: {final_val_accuracy:.4f}")
torch.save(model.state_dict(), 'emotion_recognition_model.pth')
test_loader = DataLoader(test_dataset, batch_size=32)
model.load_state_dict(torch.load('emotion_recognition_model.pth'))
model.eval()
test_loss = 0.0
total_test_correct = 0
total_test_samples = 0
with torch.no_grad():
    for inputs, labels in test_loader:
        outputs = model(inputs)
        loss = criterion(outputs, labels)
        test_loss += loss.item()
        total_test_correct += (outputs.argmax(dim=1) == labels).sum().item()
        total_test_samples += labels.size(0)
avg_test_loss = test_loss / len(test_loader)
test_accuracy = total_test_correct / total_test_samples
print(f"Test Loss: {avg_test_loss:.4f}, Test Accuracy: {test_accuracy:.4f}")
def predict_emotion(audio_path):
    
    y, sr = librosa.load(audio_path, sr=16000)
    mel_spectrogram = librosa.feature.melspectrogram(y=y, sr=sr, n_mels=128)
    mel_spectrogram_db = librosa.power_to_db(mel_spectrogram, ref=np.max)  
    max_length = 128
    pad_width = max_length - mel_spectrogram_db.shape[1]
    if pad_width > 0:
        mel_spectrogram_db = np.pad(mel_spectrogram_db, pad_width=((0, 0), (0, pad_width)), mode='constant')
    else:
        mel_spectrogram_db = mel_spectrogram_db[:, :max_length]
    mel_spectrogram_3ch = np.repeat(mel_spectrogram_db[np.newaxis, :, :], 3, axis=0)
    input_tensor = torch.tensor(mel_spectrogram_3ch, dtype=torch.float32).unsqueeze(0)
    model.eval()
    with torch.no_grad():
        output = model(input_tensor)
        predicted_class = output.argmax(dim=1).item()
    return emotions[predicted_class]
audio_file_path = '/content/drive/MyDrive/extract_speech/TESS Toronto emotional speech set data/OAF_Fear/OAF_bar_fear.wav'  # Replace with your audio file path
predicted_emotion = predict_emotion(audio_file_path)
print(f'Predicted Emotion: {predicted_emotion}')
Speech Emotion Analysis is a useful technique as it helps to analyze the emotions of a person via speech. Combining the extraction power of Librosa and VGG 16 will be definitely useful in many industries as it will leverage the sentiment analysis.
