# Text Generation using Recurrent Long Short Term Memory Network

> Source: https://www.geeksforgeeks.org/machine-learning/text-generation-using-recurrent-long-short-term-memory-network/

LSTMs are a type of neural network that are well-suited for tasks involving sequential data such as text generation. They are particularly useful because they can remember long-term dependencies in the data which is crucial when dealing with text that often has context that spans over multiple words or sentences.
Implementation
Text generation is a part of NLP where we train our model on dataset that involves vast amount of textual data and our LSTM model will use it to train model. Here is the step by step implementation of text generation:
1. Importing Required Libraries
We will import the following libraries:
- TensorFlow: For building and training the deep learning model.
- NumPy: For numerical operations on arrays.
- Pandas: For loading and processing the CSV dataset.
- random, sys: Used in text generation and output handling.
import tensorflow as tf
import numpy as np
import pandas as pd
import random
import sys
2. Loading the Dataset
You can download dataset from here. It contains vast amount of textual data for training.
- pd.read_csv(): Reads the CSV file into a DataFrame.
- df['text'].dropna(): Drops rows with missing text entries.
- " ".join(): Concatenates all text rows into a single string for training.
- .lower(): Converts text to lowercase for consistency.
df = pd.read_csv('/content/train.csv')
text = " ".join(df['text'].dropna().astype(str)).lower()
print(f'Total characters in text: {len(text)}')
Output:
Total characters in text: 35695884
3. Creating Vocabulary and Character Mappings
We will create vocabulary of unique characters and implement character to index mapping and vise-versa.
- sorted(set(text)): Extracts unique characters and sorts them to form the vocabulary.
- char2idx: Maps each character to a unique integer index.
- idx2char: Maps integers back to characters and is used during text generation.
- text_as_int: Converts the entire text into a sequence of integer indices.
vocab = sorted(set(text))
print(f'Vocabulary size: {len(vocab)}')
char2idx = {c: i for i, c in enumerate(vocab)}
idx2char = np.array(vocab)
text_as_int = np.array([char2idx[c] for c in text])
Output:
Vocabulary size: 104
4. Pre-processing the Data
We will ceate dataset from integer encoded text and split sequences into input and target. Then we will shuffle and divide the dataset into batches.
- seq_length: Defines the length of input sequences for the model.
- tf.data.Dataset.from_tensor_slices(): Converts the integer sequence into a TensorFlow dataset.
- batch(seq_length + 1): Creates sequences of length 101 where first 100 are input and the last is the target.
- split_input_target(): Splits each sequence into input and target (next character).
- shuffle() and batch(): Randomizes data order and creates batches for training.
seq_length = 100 
char_dataset = tf.data.Dataset.from_tensor_slices(text_as_int)
sequences = char_dataset.batch(seq_length + 1, drop_remainder=True)
def split_input_target(chunk):
    return chunk[:-1], chunk[1:]
dataset = sequences.map(split_input_target)
BATCH_SIZE = 64
BUFFER_SIZE = 10000
dataset = dataset.shuffle(BUFFER_SIZE).batch(BATCH_SIZE, drop_remainder=True)
5. Building the LSTM Model
We will build a LSTM model with the following layers and compile the model. We will be using RMSprop optimizer in this model.
- Embedding layer: Converts integer indices into dense vectors of length embedding_dim.
- LSTM layer: Processes sequences capturing temporal dependencies with rnn_units memory cells. return_sequences=True outputs sequence at each timestep.
- Dense layer: Produces output logits for all characters in the vocabulary to predict the next character.
vocab_size = len(vocab)
embedding_dim = 64
rnn_units = 128
model = tf.keras.Sequential([
    tf.keras.layers.Embedding(vocab_size, embedding_dim, input_shape=(None,)),
    tf.keras.layers.LSTM(rnn_units, return_sequences=True, recurrent_initializer='glorot_uniform'),
    tf.keras.layers.Dense(vocab_size)
])
def loss(labels, logits):
    return tf.keras.losses.sparse_categorical_crossentropy(labels, logits, from_logits=True)
model.compile(optimizer='adam', loss=loss)
model.summary()
Output:
6. Training the LSTM model
 
We will train our model on 20 Epochs to use it for predictions.
- model.fit(): Trains the model on the dataset for 20 epochs.
- history: Stores training metrics for later analysis.
EPOCHS = 20
history = model.fit(dataset, epochs=EPOCHS)
Output:
7. Generating new random text
We will try to generate some texts using our model.
- start_string: Initial seed text to start generation.
- temperature: Controls randomness; lower values make output more predictable, higher values more creative.
- model.reset_states(): Clears LSTM states before generation.
- tf.random.categorical(): Samples the next character probabilistically from the model’s predictions.
- Returns: The seed text plus generated characters.
def generate_text(model, start_string, num_generate=100, temperature=1.0):
    input_eval = [char2idx.get(s, 0) for s in start_string.lower()]
    input_eval = tf.expand_dims(input_eval, 0)
    text_generated = []
    model.layers[1].reset_states()
    for _ in range(num_generate):
        predictions = model(input_eval)
        predictions = tf.squeeze(predictions, 0) / temperature
        predicted_id = tf.random.categorical(
            predictions, num_samples=1)[-1, 0].numpy()
        input_eval = tf.expand_dims([predicted_id], 0)
        text_generated.append(idx2char[predicted_id])
    return start_string + ''.join(text_generated)
print(generate_text(model, start_string="The ", num_generate=200, temperature=0.8))
Output:
The uster mp fo haveun fre anth to wasicore s mprmalitrsall win a f r pens. tmilerin inthentin s vistha as. in fout wr pres bla an ivo “ithe bed o, ase tay s fed ste “trinsppove a atond d s. hexpled he l
Here we generate 200 characters of text with a diversity of 0.8 after training. But we can further tune this model to generate better sentences.
You can download source code from here.
