# Bidirectional Recurrent Neural Network

> Source: https://www.geeksforgeeks.org/deep-learning/bidirectional-recurrent-neural-network/

Bidirectional Recurrent Neural Networks (BRNNs) are an advanced form of RNNs that process sequential data in both forward and backward directions. This allows the network to use both past and future context, improving understanding and prediction accuracy.
- Processes sequences in forward and backward directions
- Captures both past and future context
- Improves prediction accuracy over traditional RNNs
- Helps understand contextual meaning more effectively
- Used in NLP, speech recognition, and sequence analysis
Example: In the sentence “I like apple. It is very healthy.”, a BRNN can identify that “apple” refers to the fruit using future context from the second sentence.
Working of Bidirectional Recurrent Neural Networks (BRNNs)
BRNNs process sequential data in both forward and backward directions to capture complete contextual information from a sequence.
Step 1: Input Sequence
A sequence of data points is provided as input, where each element is represented as a vector.
Step 2: Dual Direction Processing
The sequence is processed in two directions
- Forward direction: uses current input and previous hidden state
- Backward direction: uses current input and next hidden state
Step 3: Hidden State Computation
Hidden states are computed using weighted inputs and activation functions, allowing the network to retain sequence information.
Step 4: Output Generation
The outputs are generated from the hidden states and can be used directly for prediction or passed to additional layers for further processing.
Implementation of Bi-directional Recurrent Neural Network
This implementation uses a Bidirectional RNN with Keras and TensorFlow for sentiment analysis on the IMDb dataset.
1. Loading and Preprocessing Data
The IMDb dataset is loaded and preprocessed by padding sequences to ensure uniform input length.
import warnings
warnings.filterwarnings('ignore')
from keras.datasets import imdb
from keras.preprocessing.sequence import pad_sequences
features = 2000  
max_len = 50     
(X_train, y_train), (X_test, y_test) = imdb.load_data(num_words=features)
X_train = pad_sequences(X_train, maxlen=max_len)
X_test = pad_sequences(X_test, maxlen=max_len)
2. Defining the Model Architecture
A Bidirectional RNN model is created using Keras for binary sentiment classification.
- Embedding() converts input words into 128-dimensional dense vectors
- Bidirectional(SimpleRNN(hidden)) adds a bidirectional RNN layer with 64 hidden units
- Dense(1, activation='sigmoid') creates the binary output layer
- model.compile() configures the model using Adam optimizer, binary cross-entropy loss, and accuracy metric
from keras.models import Sequential
from keras.layers import Embedding, Bidirectional, SimpleRNN, Dense
embedding_dim = 128  
hidden_units = 64    
model = Sequential()
model.add(Embedding(features, embedding_dim, input_length=max_len))
model.add(Bidirectional(SimpleRNN(hidden_units)))
model.add(Dense(1, activation='sigmoid'))
model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
3. Training the Model
After preparing the data and compiling the model, the Bidirectional RNN is trained on the dataset.
- batch_size=32 sets the number of samples processed in one iteration
- epochs=5 defines the number of training cycles over the dataset
- model.fit() trains the model and validates it using validation data
batch_size = 32
epochs = 5
model.fit(X_train, y_train,
          batch_size=batch_size,
          epochs=epochs,
          validation_data=(X_test, y_test))
Output:
4. Evaluating the Model
The trained BRNN model is evaluated on test data to measure its performance and prediction accuracy.
- model.evaluate(X_test, y_test) evaluates the model on test data
- Returns loss and accuracy values
- Predicted outputs are compared with true labels to measure performance
loss, accuracy = model.evaluate(X_test, y_test)
print('Test accuracy:', accuracy)
Output :
Test accuracy: 0.76951
5. Predicting on Test Data
The trained model is used to generate predictions on the test dataset and compare them with the actual labels.
- model.predict(X_test) generates prediction probabilities for test data
- y_pred = (y_pred > 0.5) converts probabilities into binary classes
- classification_report(...) displays precision, recall, F1-score, and support for each class
from sklearn.metrics import classification_report
y_pred = model.predict(X_test)
y_pred = (y_pred > 0.5)
print(classification_report(y_test, y_pred, target_names=['Negative', 'Positive']))
Output:
Download full code from here
Advantages
- Uses both past and future context for better understanding
- Improves accuracy in NLP and speech-related tasks
- Handles variable-length sequences effectively
- Forward and backward processing improves robustness and reduces noise
Challenges
- Requires more computation than unidirectional RNNs
- Training takes longer due to additional parameters
- Not ideal for real-time tasks since full sequences are needed
- More difficult to interpret compared to standard RNNs
Applications
- Sentiment analysis for understanding text emotions and opinions
- Named Entity Recognition (NER) for identifying entities in text
- Machine translation for improving translation accuracy
- Speech recognition for better audio transcription accuracy
