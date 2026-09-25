# Next Word Prediction with Deep Learning in NLP

> Source: https://www.geeksforgeeks.org/nlp/next-word-prediction-with-deep-learning-in-nlp/

Next Word Prediction is a natural language processing (NLP) task where a model predicts the most likely word that should follow a given sequence of words in a sentence. It is a fundamental concept in language modeling and is widely used in various applications such as autocomplete systems, chatbots, text generation, and speech recognition.
Next-word prediction aims to estimate the probability distribution over possible next words based on the context provided by the preceding words. The model then selects the word with the highest probability as its prediction.
Key Techniques for Next Word Prediction
1. N-gram Models
- N-gram is a traditional statistical models that predict the next word based on the previous n words.
- Example: A bigram model predicts the next word based on the last word, while a trigram model considers the last two words.
2. Recurrent Neural Networks (RNNs)
- Recurrent neural networks that capture dependencies between words over time.
- Variants like LSTMs (Long Short-Term Memory) and GRUs (Gated Recurrent Units) are commonly used for better handling of long-term dependencies.
3. Transformer Models
- Modern architectures like GPT (Generative Pre-trained Transformer) and BERT use self-attention mechanisms to capture contextual relationships across the entire input sequence.
- These models achieve state-of-the-art performance in next word prediction tasks.
4. Language Models
- Pre-trained language models (e.g., GPT, T5, BERT) are fine-tuned or directly used for next word prediction.
- These models are trained on large corpora and can generalize well to various contexts.
Implementing Next Word Prediction using Recurrent Neural Network
Step 1: Import libraries
TensorFlow is imported as 'tf' to utilize its functionalities for deep learning. The Sequential model from Keras is imported to build a sequential neural network, and specific layers such as Embedding, LSTM, and Dense are imported. Numpy is imported as np for generating arrays and regex as a re for data processing pattern recognition.
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Embedding, LSTM, Dense
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
import numpy as np
import regex as re
Step 2: Understanding and preprocessing the dataset
The data preparation begins by reading a file and breaking up its text into separate sentences.
- Keras Tokenizer class learns the vocabulary from the input sentences, tokenizes the text data once it has been parsed.
- Tokenized data is then used to produce n-gram sequences, each of which contains a range of tokens from the start to the current index. Input_sequences contains a list of these sequences.
- The sequences are padding with zeros in order to guarantee uniform length. The input sequences are divided into predictors (X) and labels (Y), where X contains all elements other than the last token of each sequence and Y only the final token.
- Finally, the target data y is converted to one-hot encoding, ready for training a language model.
The text file used cab be downloaded from here: pizza.txt.
def file_to_sentence_list(file_path):
    with open(file_path, 'r') as file:
        text = file.read()
    # Splitting the text into sentences using
    # delimiters like '.', '?', and '!'
    sentences = [sentence.strip() for sentence in re.split(
        r'(?<=[.!?])\s+', text) if sentence.strip()]
    return sentences
file_path = 'pizza.txt'
text_data = file_to_sentence_list(file_path)
# Tokenize the text data
tokenizer = Tokenizer()
tokenizer.fit_on_texts(text_data)
total_words = len(tokenizer.word_index) + 1
# Create input sequences
input_sequences = []
for line in text_data:
    token_list = tokenizer.texts_to_sequences([line])[0]
    for i in range(1, len(token_list)):
        n_gram_sequence = token_list[:i+1]
        input_sequences.append(n_gram_sequence)
# Pad sequences and split into predictors and label
max_sequence_len = max([len(seq) for seq in input_sequences])
input_sequences = np.array(pad_sequences(
    input_sequences, maxlen=max_sequence_len, padding='pre'))
X, y = input_sequences[:, :-1], input_sequences[:, -1]
# Convert target data to one-hot encoding
y = tf.keras.utils.to_categorical(y, num_classes=total_words)
Step 3: Defining the Model
The input sequences are mapped to dense vectors of fixed size in the first layer, which is an embedding layer. It requires three arguments: input_length (the length of the input sequences less one because we are predicting the next word), 10 (the dimensionality of the embedding space), and total_words (the total number of unique words in the vocabulary).
- LSTM (Long Short-Term Memory) layer with 128 units makes up the second layer.
- Dense layer with total_words units and softmax activation make up the third layer. The output probabilities for each word in the vocabulary are generated by this layer.
The categorical cross-entropy loss function used in the model is appropriate for multi-class classification applications. Adam is the chosen optimizer, and accuracy is the evaluation metric.
# Define the model
model = Sequential()
model.add(Embedding(total_words, 10,
                    input_length=max_sequence_len-1))
model.add(LSTM(128))
model.add(Dense(total_words, activation='softmax'))
model.compile(loss='categorical_crossentropy',
              optimizer='adam', metrics=['accuracy'])
Step 4: Train the Model
fit method of the model object is used in this code to train the defined model. As parameters, the input data X and the target data Y are given. The number of iterations that the entire dataset will undergo during training is indicated by the epochs parameter, which is set to 500. The model develops the ability to anticipate the following word in a sequence depending on the input data during training. The progress bar and training data for each epoch are shown when the verbose parameter is set to 1, which is the default value.
The model is trained for 500 epochs by running this code, and the weights of the model's layers are adjusted iteratively to reduce the defined loss function and increase precision in predicting the next word in the input sequences.
# Train the model
model.fit(X, y, epochs=500, verbose=1)
Output:
Epoch 496/500
51/51 [==============================] - 1s 20ms/step - loss: 0.0679 - accuracy: 0.9668
Epoch 497/500
51/51 [==============================] - 1s 20ms/step - loss: 0.0671 - accuracy: 0.9687
Epoch 498/500
51/51 [==============================] - 1s 24ms/step - loss: 0.0676 - accuracy: 0.9687
Epoch 499/500
51/51 [==============================] - 1s 20ms/step - loss: 0.0679 - accuracy: 0.9681
Epoch 500/500
51/51 [==============================] - 1s 21ms/step - loss: 0.0673 - accuracy: 0.9705
Step 5: Predicting the next word
The variable seed_text contains the initial input text from which we want to generate the next word predictions. The variable next_words indicates the number of words to be predicted. A loop is then executed next_words times. Inside the loop, the seed_text is tokenized using the tokenizer's texts_to_sequences method. The token list is padded to match the expected input length of the model's input sequences.
The model's prediction method is called on the padded token list to obtain the predicted probabilities for each word in the vocabulary. The argmax function is used to determine the index of the word with the highest probability.
The predicted word is obtained by converting the index to the corresponding word using the tokenizer's index_word dictionary. The predicted word is then appended to the seed_text. This process is repeated for the desired number of next_words predictions. Finally, the generated sequence of words is printed as "Next predicted words: [seed_text]".
# Generate next word predictions
seed_text = "Pizza have different "
next_words = 5
for _ in range(next_words):
    token_list = tokenizer.texts_to_sequences([seed_text])[0]
    token_list = pad_sequences(
        [token_list], maxlen=max_sequence_len-1, padding='pre')
    predicted_probs = model.predict(token_list)
    predicted_word = tokenizer.index_word[np.argmax(predicted_probs)]
    seed_text += " " + predicted_word
print("Next predicted words:", seed_text)
Output:
1/1 ━━━━━━━━━━━━━━━━━━━━ 0s 191ms/step
1/1 ━━━━━━━━━━━━━━━━━━━━ 0s 25ms/step
1/1 ━━━━━━━━━━━━━━━━━━━━ 0s 25ms/step
1/1 ━━━━━━━━━━━━━━━━━━━━ 0s 24ms/step
1/1 ━━━━━━━━━━━━━━━━━━━━ 0s 24ms/step
Next predicted words: Pizza have different become a symbol of comfort
Deep learning in NLP has several useful applications, including next-word prediction. We can efficiently capture the sequential dependencies in text data and produce precise predictions by applying models like LSTM or GRU. Next-word prediction models keep getting better thanks to deep learning developments and the accessibility of big text corpora, which enhance user experience and enable a variety of NLP applications.
Get the complete notebook and dataset link here:
- Notebook link : click here
- Dataset Link : click here
