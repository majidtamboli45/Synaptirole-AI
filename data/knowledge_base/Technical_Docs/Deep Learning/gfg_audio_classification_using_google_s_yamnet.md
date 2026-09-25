# Audio Classification Using Google's YAMnet

> Source: https://www.geeksforgeeks.org/deep-learning/audio-classification-using-googles-yamnet/

With abundant audio data available, analyzing and classifying it presents a significant challenge due to the complexity and variability of sound. This is where transfer learning comes in, offering a solution to tackle audio classification tasks with greater efficiency and accuracy. In this article, we will explore the application of transfer learning for audio classification, specifically focusing on using the YAMNet model to classify animal sounds.
Google's YAMnet Model For Audio Classification
Developed by Google Research, YAMNet is a pre-trained deep neural network designed to categorize audio into numerous specific events. It leverages the AudioSet dataset, a massive collection of labeled YouTube excerpts, to learn and identify a staggering 521 distinct audio event categories.
YAMNet shines in audio classification, offering a potent base for transfer learning, where you leverage its pre-trained knowledge to tackle new tasks with limited datasets. Here's how it works:
Feature Extraction:
- You input your audio data to YAMNet.
- YAMNet's trained layers extract meaningful features, capturing essential characteristics of the audio content.
- These features represent learned knowledge about audio in general, not just the specific 521 categories it was trained upon
New Classifier:
- You create a new classification layer on top of the extracted features.
- This new layer focuses on your specific classification task, with fewer neurons compared to YAMNet's full output layer.
- You train this new layer using your smaller dataset relevant to your task.
Why to use Transfer Learning for Audio Classification?
Transfer learning is a machine learning technique where a model trained on one task is repurposed or adapted for use on a different but related task. Instead of starting the learning process from scratch, transfer learning leverages the knowledge gained from solving one problem and applies it to a different, yet related, problem domain. This approach can significantly reduce the amount of labeled data required for training and improve the efficiency of the learning process, especially in cases where the target task has limited data availability.
- Pre-trained models in tasks like speech recognition or general audio classification have acquired valuable representations from audio data. These representations capture essential patterns in audio signals, beneficial for various downstream tasks, including audio classification. By adapting pre-trained models, one can utilize these learned representations to enhance performance in specific audio classification tasks.
- Reduced Training Time and Resources: Training deep learning models from scratch for audio classification is resource-intensive and time-consuming. Transfer learning addresses this by utilizing pre-trained models, which have already learned features from large datasets. Fine-tuning these models for the target audio classification task typically demands less time and computational resources compared to training from scratch.
- Improved Performance: Transfer learning leverages knowledge from related tasks to enhance performance in the target audio classification task. Fine-tuning pre-trained models allows adaptation of learned representations to suit the nuances of the target audio dataset better, potentially resulting in higher accuracy and improved generalization.
Implementing Audio Classification using YAMNet Model
We will be using an audio dataset containing audio of three different classes bird, dog and cat and we'll try to build a Classifier upon our transfer learning model.
Importing necessary libraries
For the implementation, we require NumPy, Pandas, Matplotlib libraries. We will also require TensorFlow library to build the model and IPython.display to create a widget to play the audio.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import os
from IPython.display import Audio
from scipy.io import wavfile
import soundfile as sf
import tensorflow as tf
import tensorflow_hub as hub
import warnings
warnings.filterwarnings('ignore')
from sklearn.preprocessing import OneHotEncoder
from sklearn.model_selection import train_test_split
import tensorflow as tf
from tensorflow.keras import layers, models
from sklearn.metrics import classification_report
Loading Dataset and Preprocessing 
You can download the dataset from here. Once, you have downloaded the data, you can unzip the folder using the following command:
!unzip archive.zip
After the unzipping the zip file, you will get a folder named "Animal".
data_path = "/content/Animals"
Ensuring Sample rate while Gathering data
Audio signals are represented by discrete samples collected at regular intervals, with the sample rate determining the frequency of these samples. Maintaining consistent sample rates is vital for accurate audio analysis:
- Feature Extraction: Techniques like mel-spectrogram creation rely on consistent sample rates for precise frequency representations.
- Classification: Varying sample rates can hinder machine learning models trained on specific rates, leading to decreased accuracy when applied to data with different rates.
- Time-based Measurements: Consistent sample rates are crucial for reliable duration calculation and temporal pattern analysis, ensuring accuracy in timing-related tasks.
def ensure_sample_rate(original_sample_rate, waveform, desired_sample_rate=22000):
    if original_sample_rate != desired_sample_rate:
        desired_length = int(
            round(float(len(waveform))/original_sample_rate * desired_sample_rate))
        waveform = scipy.signal.resample(waveform, desired_length)
    return desired_sample_rate, waveform
Function to read Audio File :
The sf.read() function gives you information in pieces about the audio file you read. It returns information about audio file and sample rate of the audio file.
def read_audio(filename):
    wav_data, sample_rate = sf.read(file=filename, dtype=np.int16)
    if len(wav_data.shape) > 1:
        wav_data = np.mean(wav_data, axis=1)
    sample_rate, wav_data = ensure_sample_rate(sample_rate, wav_data)
    return sample_rate, wav_data
Gathering Data:
Iterating through all the paths and gathering data and labels for all the audio data files
audio_data = []
for i in os.listdir(data_path):
    filename = data_path+"/"+i
    filename = filename.format(i=i)
    for j in os.listdir(filename):
        path = os.path.join(filename, j)
        audio_data.append([read_audio(path)[1], i])
Converting it into a pandas Dataframe
audio_dataframe = pd.DataFrame(audio_data, columns=["audio_data", "class"])
print(audio_dataframe.head())
Output:
                                          audio_data class
0  [-217.00000000000014, -176.40361314519922, -19...   cat
1  [-2.999999999999825, -7.18011342683155, -10.76...   cat
2  [160.99999999999918, 205.50300351462909, 211.5...   cat
3  [50.000000000000014, 74.50393148594556, 75.032...   cat
4  [-9.000000000000144, 25.326100094416585, 44.74...   cat
Visualizing Different Classes of Audio Dataset
Using librosa and matplotlib to visualize different audio classes.
bird_data, bird_sr = librosa.load(
    r"/content/Animals/bird/0a7c2a8d_nohash_0.wav")
cat_data, cat_sr = librosa.load(r"/content/Animals/cat/0e5193e6_nohash_0.wav")
dog_data, dog_sr = librosa.load(r"/content/Animals/dog/0ab3b47d_nohash_0.wav")
fig, (ax1, ax2, ax3) = plt.subplots(1, 3, figsize=(20, 5), sharex=True)
librosa.display.waveshow(bird_data, sr=bird_sr, ax=ax1)
ax1.set_title("Bird")
librosa.display.waveshow(cat_data, sr=cat_sr, ax=ax2)
ax2.set_title("Cat")
librosa.display.waveshow(dog_data, sr=dog_sr, ax=ax3)
ax3.set_title("Dog")
plt.show()
Output:
Viewing a single Audio File
We will view some basic audio features like duration, sample rate, size and also will listen what kind of audio it is.
wav_file_name = '/content/Animals/bird/0a7c2a8d_nohash_0.wav'
sample_rate, wav_data = wavfile.read(wav_file_name, "rb")
sample_rate, wav_data = ensure_sample_rate(sample_rate, wav_data)
duration = len(wav_data)/sample_rate
print(f'Sample rate: {sample_rate} Hz')
print(f'Total duration: {duration:.2f}s')
print(f'Size of the input: {len(wav_data)}')
Audio(wav_data, rate=sample_rate)
Output:
Sample rate: 22000 Hz
Total duration: 1.00s
Size of the input: 22000
Preparing Data for extracting features
converting the data into numpy array so as to prepare it to feed on YAMnet model.
audio_data = np.array(audio_dataframe["audio_data"].to_list())
Loading Google's YAMnet model
The Model returns :-
- class scores : it is the probability of the audio belonging to each of its 521 trained classes
- embeddings : It is the dense continuous representation of the audio features extracted from the audio file . We will be further training our model on this data.
- Log mel Spectrograms : it visualizes the distribution of audio energy across frequencies and time, providing a different perspective on the audio content.
model_yamnet = hub.load('https://tfhub.dev/google/yamnet/1')
Extracting features from data using YAMNet model
Store YAMNet embeddings for fine-tuning our model ,but before we put our data into the model we need to first bring all the data parameter to same scale . It is a crucial step in machine learning to bring all your data to same scale so that each feature or data value contribute equally to the computations leading to better results
audio_embeddings = []
for i in audio_data:
    waveform = i / tf.int16.max
    scores, embeddings, spectrogram = model_yamnet(waveform)
    audio_embeddings.append(embeddings)
Padding data
we need to pad our data to adjust the size of input data or feature representations. It involves adding extra elements (usually zeros) around the edges of the data to ensure that the output maintains a desired size or shape.
padded_audio_embeddings = []
for i in audio_embeddings:
    padding_needed = 100-i.shape[0]
    padded_tensor = tf.pad(i, [[0, padding_needed], [0, 0]])
    padded_audio_embeddings.append(padded_tensor)
OneHotEncoding Classes
We need to Encode our classes into numerical labels for this we'll be using One-hot encoding, which is a technique used to represent categorical data numerically in machine learning models. It works by creating a vector for each possible category, where all elements are zeros except for one element at the index corresponding to the category's position. This single "1" acts as a binary flag indicating the presence of that specific category.
ohe = OneHotEncoder(sparse_output=False)
classes = ohe.fit_transform(audio_dataframe[["class"]])
Dividing Data into Training and Testing sets
xtrain, xtest, ytrain, ytest = train_test_split(
    np.array(padded_audio_embeddings), classes, random_state=42, test_size=0.2)
Model Building and Training
We will be using TensorFlow to build our deep neural network .Tensorflow is an open-source machine learning library developed by Google. TensorFlow is used to build and train deep learning models as it facilitates the creation of computational graphs and efficient execution on various hardware platforms.
model = models.Sequential([
    layers.Input(shape=(100, 1024)),
    layers.Flatten(),
    layers.Dense(16, activation='relu'),
    layers.Dropout(0.1),
    layers.Dense(16, activation='relu'),
    layers.Dropout(0.1),
    layers.Dense(16, activation='relu'),
    layers.Dense(3, activation='softmax')
])
model.compile(optimizer='adam', loss='categorical_crossentropy',
              metrics=['accuracy'])
model.fit(xtrain, ytrain, epochs=20)
Output:
Epoch 1/20
16/16 [==============================] - 2s 41ms/step - loss: 1.0865 - accuracy: 0.3750
Epoch 2/20
16/16 [==============================] - 1s 43ms/step - loss: 1.0176 - accuracy: 0.5266
Epoch 3/20
16/16 [==============================] - 1s 40ms/step - loss: 0.9262 - accuracy: 0.5840
Epoch 4/20
16/16 [==============================] - 1s 91ms/step - loss: 0.8379 - accuracy: 0.6393
Epoch 5/20
16/16 [==============================] - 1s 56ms/step - loss: 0.7507 - accuracy: 0.6455
Epoch 6/20
16/16 [==============================] - 1s 37ms/step - loss: 0.6865 - accuracy: 0.7213
Epoch 7/20
16/16 [==============================] - 0s 29ms/step - loss: 0.6660 - accuracy: 0.6926
Epoch 8/20
16/16 [==============================] - 1s 31ms/step - loss: 0.6023 - accuracy: 0.7746
Model Evaluation
loss, accuracy = model.evaluate(xtest, ytest)
print(loss, accuracy)
Output:
4/4 [==============================] - 0s 13ms/step - loss: 0.8147 - accuracy: 0.7541
0.8146933317184448 0.7540983557701111
Get Predictions
Using the following function, you can input the audio file and get the prediction class as an output.
def pipeline(filename):
    audio_data = read_audio(filename)[1]
    audio_data = audio_data/tf.int16.max
    scores, embeddings, spectrogram = model_yamnet(audio_data)
    padding_needed = 100-embeddings.shape[0]
    padded_tensor = tf.pad(embeddings, [[0, padding_needed], [0, 0]])
    # Reshape the padded tensor to match the input shape expected by the model
    padded_tensor = tf.reshape(padded_tensor, (1, 100, 1024))
    prob = model.predict(padded_tensor)[0]
    max_index = np.argmax(prob)
    if max_index == 0:
        return "bird"
    elif max_index == 1:
        return "cat"
    else:
        return "dog"
print("the audio given is of", pipeline("/content/Animals/cat/0e5193e6_nohash_0.wav"))
Output:
1/1 [==============================] - 0s 94ms/step
the audio given is of cat
How to get better accuracy?
You can further tune your neural network to achieve higher accuracy and better generalization on the dataset by systematically experimenting with these techniques and monitoring the model's performance:
- Adding Layers: Increasing the depth of the network by adding more layers allows the model to capture more complex patterns in the data, potentially improving its ability to generalize.
- Changing Layer Sizes: Adjusting the number of neurons in each layer can control the model's capacity. Increasing the number of neurons may enable the network to learn more intricate relationships in the data, while reducing the number can help prevent overfitting.
- Changing Activation Functions: Different activation functions affect how information flows through the network. Experimenting with alternatives like ReLU, Leaky ReLU, or ELU can help improve the model's ability to capture nonlinearities in the data.
- Regularization: Techniques such as dropout, L1, or L2 regularization help prevent overfitting by introducing constraints on the network's parameters. Regularization encourages the model to learn simpler representations, leading to better generalization performance.
- Batch Normalization: Adding batch normalization layers helps stabilize and accelerate the training process by normalizing the activations of each layer. This can lead to faster convergence and improved performance, especially in deeper networks.
