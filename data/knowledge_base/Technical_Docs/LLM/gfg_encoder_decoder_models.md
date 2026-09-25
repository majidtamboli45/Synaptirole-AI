# Encoder Decoder Models

> Source: https://www.geeksforgeeks.org/nlp/encoder-decoder-models/

The encoder-decoder model is a neural network used for tasks where both input and output are sequences, often of different lengths. It is commonly applied in areas like translation, summarization and speech processing.
- The encoder processes the input sequence and converts it into a fixed representation (context vector)
- The decoder uses this representation to generate the output sequence step by step
- Works well for tasks where input and output lengths are different
Encoder-Decoder Model Architecture
In an encoder-decoder model both the encoder and decoder are separate networks each one has its own specific task.
Encoder
The encoder processes the input sequence and converts it into a fixed representation (context vector) using an RNN or LSTM.
- Processes input tokens sequentially and updates hidden states
- Captures relationships between words in the sequence
- Produces final hidden and cell states forming the context vector
Decoder
The decoder uses the context vector from the encoder to generate the output sequence step by step.
- Takes previous output and context to predict the next token
- Generates output sequentially until an end token is reached
- Initializes its states using the encoder’s final states
Working of Encoder Decoder Model
The actual working of the encoder decoder model is shown in below diagram. Now we will understand it stepwise
Step 1: Tokenizing the Input Sentence
- The sentence "I am learning AI" is first broken into tokens: ["I", "am", "learning", "AI"].
- Each word (token) is converted into a vector that a machine can understand. This process is called embedding.
Step 2: Encoding the Input
- The encoder processes these embeddings sequentially using an LSTM network.
- At each step, it updates its hidden state based on the current word and previous context. This helps the model understand the sequence order and relationships between words.
- After processing the full sentence, the encoder generates a context vector (final hidden and cell states), which represents the meaning of the entire input sentence.
Step 3: Passing the Context to the Decoder
- The Context Vector is passed to the Decoder as shown in image.
- It acts like a summary of the full input sentence.
Step 4: Decoder Generates Output Step-by-Step
- The Decoder uses the context and starts creating the output one word at a time.
- First it predicts the first word then uses that to predict the second word and so on.
Step 5: Attention Mechanism
- Basic encoder-decoder uses a single context vector, which can limit performance for long sequences.
- Attention mechanism helps the decoder focus on different parts of the input at each step.
- Improves accuracy by not relying only on one fixed representation.
Step 6: Producing the Final Output
- The decoder continues generating until the full translated sentence is produced.
- Each output token depends on the previous ones and the input context. You finally see the output tokens generated on the right side of the diagram completing the translation.
Implementation
Step 1: Import Libraries and Load dataset
In this step we import all the necessary libraries like numpy , pandas , string and Tokenizer , pad_sequence for preprocessing the text into model-friendly format and load the dataset. 
You can download the dataset from here
import numpy as np, pandas as pd, string
from string import digits
import tensorflow as tf
from tensorflow.keras.models import Model
from tensorflow.keras.layers import Input, LSTM, Embedding, Dense
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
lines = pd.read_csv("/content/Hindi_English_Truncated_Corpus.csv", encoding='utf-8')
lines = lines[lines['source'] == 'ted'][['english_sentence', 'hindi_sentence']].dropna().drop_duplicates()
lines = lines.sample(n=25000, random_state=42)
Step 2: Text Cleaning
Here it remove punctuation and digits and converts text to lowercase and strips whitespace.
def clean_text(text):
    exclude = set(string.punctuation)
    text = ''.join(ch for ch in text if ch not in exclude)
    text = text.translate(str.maketrans('', '', digits))
    return text.strip().lower()
It applies Applies cleaning and adds special tokens to Hindi sentences to mark start and end (start_, _end).
lines['english_sentence'] = lines['english_sentence'].apply(clean_text)
lines['hindi_sentence'] = lines['hindi_sentence'].apply(clean_text)
lines['hindi_sentence'] = lines['hindi_sentence'].apply(lambda x: 'start_ ' + x + ' _end')
Step 4: Tokenization
Converts text to sequences of integers using word indices. Hindi tokenizer keeps_because of special tokens.
eng_tokenizer = Tokenizer()
eng_tokenizer.fit_on_texts(lines['english_sentence'])
eng_seq = eng_tokenizer.texts_to_sequences(lines['english_sentence'])
hin_tokenizer = Tokenizer(filters='')  
hin_tokenizer.fit_on_texts(lines['hindi_sentence'])
hin_seq = hin_tokenizer.texts_to_sequences(lines['hindi_sentence'])
Step 5: Padding
Pads sequences to uniform length
max_eng_len = max(len(seq) for seq in eng_seq)
max_hin_len = max(len(seq) for seq in hin_seq)
encoder_input = pad_sequences(eng_seq, maxlen=max_eng_len, padding='post')
decoder_input = pad_sequences(hin_seq, maxlen=max_hin_len, padding='post')
decoder_target is shifted version of decoder_input used for teacher forcing.
decoder_target = np.zeros((decoder_input.shape[0], decoder_input.shape[1], 1))
decoder_target[:, 0:-1, 0] = decoder_input[:, 1:]
Step 6: Define Model Architecture
Encoder: It embeds English input and Passes through LSTM. Keeps hidden (state_h) and cell state (state_c) to pass to decoder.
encoder_inputs = Input(shape=(None,))
enc_emb = Embedding(eng_vocab_size, latent_dim)(encoder_inputs)
enc_outputs, state_h, state_c = LSTM(latent_dim, return_state=True)(enc_emb)
encoder_states = [state_h, state_c]
Decoder: It embeds Hindi input. Uses initial states from encoder and Outputs probability distribution over Hindi vocabulary at each time step.
decoder_inputs = Input(shape=(None,))
dec_emb_layer = Embedding(hin_vocab_size, latent_dim)
dec_emb = dec_emb_layer(decoder_inputs)
decoder_lstm = LSTM(latent_dim, return_sequences=True, return_state=True)
decoder_outputs, _, _ = decoder_lstm(dec_emb, initial_state=encoder_states)
decoder_dense = Dense(hin_vocab_size, activation='softmax')
decoder_outputs = decoder_dense(decoder_outputs)
Step 7. Compile and Train
Trains on source (encoder_input) and target (decoder_input) with shifted targets and uses RMSProp optimizer and cross-entropy loss.
model = Model([encoder_inputs, decoder_inputs], decoder_outputs)
model.compile(optimizer='rmsprop', loss='sparse_categorical_crossentropy')
model.fit([encoder_input, decoder_input], decoder_target, batch_size=64, epochs=20, validation_split=0.2)
Step 8: Inference Models
To translate new sentences after training:
Encoder Inference: Returns hidden/cell states given an English sentence.
encoder_model_inf = Model(encoder_inputs, encoder_states)
Decoder Inference:
decoder_state_input_h = Input(shape=(latent_dim,))
decoder_state_input_c = Input(shape=(latent_dim,))
decoder_states_inputs = [decoder_state_input_h, decoder_state_input_c]
dec_inf_emb = dec_emb_layer(decoder_inputs)
dec_outputs_inf, state_h_inf, state_c_inf = decoder_lstm(dec_inf_emb, initial_state=decoder_states_inputs)
decoder_outputs_inf = decoder_dense(dec_outputs_inf)
decoder_model_inf = Model([decoder_inputs] + decoder_states_inputs, [decoder_outputs_inf, state_h_inf, state_c_inf])
Step 9: Reverse Lookup
Used to convert indices back to words during decoding.
reverse_eng = {v: k for k, v in eng_tokenizer.word_index.items()}
reverse_hin = {v: k for k, v in hin_tokenizer.word_index.items()}
Step 10: Translate Function
It prepares input sentence. Starts decoding with <start> token and Iteratively predicts next word and feeds it back until <end> is predicted. and the test the model with example
def translate(sentence):
    sentence = clean_text(sentence)
    seq = eng_tokenizer.texts_to_sequences([sentence])
    padded = pad_sequences(seq, maxlen=max_eng_len, padding='post')
    states = encoder_model_inf.predict(padded)
    target_seq = np.zeros((1, 1))
    target_seq[0, 0] = hin_tokenizer.word_index['start_']
    decoded = []
    while True:
        output, h, c = decoder_model_inf.predict([target_seq] + states)
        token_index = np.argmax(output[0, -1, :])
        word = reverse_hin.get(token_index, '')
        if word == '_end' or len(decoded) >= max_hin_len:
            break
        decoded.append(word)
        target_seq = np.zeros((1, 1))
        target_seq[0, 0] = token_index
        states = [h, c]
    return ' '.join(decoded)
    
print("English: And")
print("Hindi:", translate("And"))
Output:
