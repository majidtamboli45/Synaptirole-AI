# Text Generation using Fnet

> Source: https://www.geeksforgeeks.org/nlp/text-generation-using-fnet/

FNet (Fourier Network) is a transformer-based model that replaces the self-attention mechanism with the Fourier Transform to process text sequences. This approach improves computational efficiency while maintaining competitive performance in text generation and other NLP tasks.
- Uses the Fourier Transform instead of self-attention.
- Processes long text sequences more efficiently.
- Requires fewer computational resources than traditional transformers.
- Supports tasks such as text generation, translation, and text classification.
Implementing FNet for Text Generation in Python
Lets see the implementation of FNet for text generation:
Step 1: Installing and Importing Libraries
We will install below libraries if they are not available in our environment using:
!pip install datasets
!pip install torch[transformers]
Here we will be using PyTorch, Numpy and Pandas libraries for the implementation.
import torch
import torch.nn as nn
import torch.nn.functional as F
import torch.fft as fft
import numpy as np
import pandas as pd
import re
Additionally we define the device variable that ensures computation is done on GPU if available otherwise it defaults to CPU.
device = 'cuda' if torch.cuda.is_available() else 'cpu'
print(device)
Output:
cuda
Step 2: Loading Data
Here we will load the wikitext-103-raw-v1 version of the WikiText dataset which contains text data from Wikipedia articles, without any additional processing applied to it. Also we'll be using the datasets library which makes it easy to access and work with datasets from Hugging Face.
from datasets import load_dataset
datasets = load_dataset('wikitext','wikitext-2-raw-v1')
Step 3: Data Preprocessing
Before feeding the raw text into the model, it's important to clean and preprocess the data. Here we decalare a preprocess_text function which will:
- Make all the words in the sentence lowercase
- Remove any special characters
- Replace any multiple white spaces
After defining the preprocess_text function, we apply it to each text sample in the dataset using the map function from the datasets library. Additionally, we use the filter function to keep only those text sequences that have more than 20 words, ensuring that we discard any short, irrelevant sequences.
def preprocess_text(sentence):
	text = sentence['text'].lower()
	text = re.sub('[^a-z?!.,]', ' ', text)
	text = re.sub('\s\s+', ' ', text) 
	sentence['text'] = text
	return sentence
datasets['train'] = datasets['train'].map(preprocess_text)
datasets['test'] = datasets['test'].map(preprocess_text)
datasets['validation'] = datasets['validation'].map(preprocess_text)
datasets['train'] = datasets['train'].filter(lambda x: len(x['text']) > 20)
datasets['test'] = datasets['test'].filter(lambda x: len(x['text']) > 20)
datasets['validation'] = datasets['validation'].filter(
	lambda x: len(x['text']) > 20)
Step 4: Tokenization
For tokenization, we use a pretrained tokenizer from Hugging Face. The distilbert-base-uncased-finetuned-sst-2-english tokenizer is loaded using AutoTokenizer.from_pretrained(). This converts raw text into tokenized sequences suitable for model training.
- Tokenization Function: Define a function to tokenize each sentence.
- Apply Tokenizer: Use the map() function to apply the tokenizer across the dataset.
- Remove Original Text: Remove the original text column using remove_columns() to retain only tokenized inputs.
- Padding: Ensure consistent input lengths across batches with DataCollatorWithPadding.
from torch.utils.data import DataLoader
from transformers import DataCollatorWithPadding
from transformers import AutoTokenizer
checkpoint = "distilbert-base-uncased-finetuned-sst-2-english"
tokenizer = AutoTokenizer.from_pretrained(checkpoint)
def tokenize(sentence):
	sentence = tokenizer(sentence['text'], truncation=True)
	return sentence
tokenized_inputs = datasets['test'].map(tokenize)
tokenized_inputs = tokenized_inputs.remove_columns(['text'])
batch = 16
data_collator = DataCollatorWithPadding(
	tokenizer=tokenizer, padding=True, return_tensors="pt")
dataloader = DataLoader(
	tokenized_inputs, batch_size=batch, collate_fn=data_collator)
Step 5: Embedding and Positional Encoding
Here we create two class, One for positional encoding and one for embedding.
- Positional Encoding: Generate positional encodings to provide the model with information about token positions.
- Embedding: The PositionalEmbedding class takes tokenized inputs, embeds them and adds the positional encoding to capture sequential information effectively.
class PositionalEncoding(torch.nn.Module):
    def __init__(self, d_model, max_sequence_length):
        super().__init__()
        self.d_model = d_model
        self.max_sequence_length = max_sequence_length
        self.positional_encoding = self.create_positional_encoding().to(device)
    def create_positional_encoding(self):
        positional_encoding = np.zeros((self.max_sequence_length, self.d_model))
        for pos in range(self.max_sequence_length):
            for i in range(0, self.d_model, 2):
               
                positional_encoding[pos, i] = np.sin(pos / (10000 ** ((2 * i) / self.d_model)))
                if i + 1 < self.d_model:
                    
                    positional_encoding[pos, i + 1] = np.cos(pos / (10000 ** ((2 * i) / self.d_model)))
        return torch.from_numpy(positional_encoding).float()
    def forward(self, x):
        expanded_tensor = torch.unsqueeze(self.positional_encoding, 0).expand(x.size(0), -1, -1).to(device)
        return x.to(device) + expanded_tensor[:,:x.size(1), :]
class PositionalEmbedding(nn.Module):
  def __init__(self, sequence_length, vocab_size, embed_dim):
    super(PositionalEmbedding, self).__init__()
    self.token_embeddings = nn.Embedding(vocab_size, embed_dim)
    self.position_embeddings = PositionalEncoding(embed_dim,sequence_length)
  def forward(self, inputs):
    embedded_tokens = self.token_embeddings(inputs).to(device)
    embedded_positions = self.position_embeddings(embedded_tokens).to(device)
    return embedded_positions.to(device)
Step 6: Create FNet Encoder
The FNet Encoder is designed based on the FNet architecture, using Fourier Transforms to process the input sequence.
- Fourier Transform: Applies fft.fft2 to the input and the real part of the result is added back to the original input.
- Normalization: After applying Fourier Transform, layer normalization (self.layernorm_1) is used.
- Dense Projection: Two linear layers with ReLU activation (self.dense_proj) project the input into a different dimension.
- Final Normalization: A second layer normalization (self.layernorm_2) is applied to the output.
class FNetEncoder(nn.Module):
  def __init__(self,embed_dim, dense_dim):
    super(FNetEncoder,self).__init__()
    self.embed_dim = embed_dim
    self.dense_dim = dense_dim
    self.dense_proj = nn.Sequential(nn.Linear(self.embed_dim,self.dense_dim), nn.ReLU(), nn.Linear(self.dense_dim,self.embed_dim))
    self.layernorm_1 = nn.LayerNorm(self.embed_dim)
    self.layernorm_2 = nn.LayerNorm(self.embed_dim)
  def forward(self,inputs):
    fft_result = fft.fft2(inputs)
    fft_real = fft_result.real.float()
    proj_input = self.layernorm_1 (inputs + fft_real)
    proj_output = self.dense_proj(proj_input)
    return self.layernorm_2(proj_input +proj_output)
Step 7 : Create FnetDecoder
The FNet Decoder is designed based on the FNet architecture and includes multi-head attention mechanisms to process the input sequence.
- Multi-Head Attention: self.attention_1 attends to decoder inputs with a causal mask to prevent future token information while self.attention_2 attends to encoder outputs with an optional key padding mask.
- Normalization: Layer normalization is applied after each attention mechanism to stabilize intermediate representations.
- Dense Projection: Two linear layers with ReLU activation (self.dense_proj) project the output to a different dimension.
- Final Normalization: A second layer normalization (self.layernorm_3) is applied to the final output.
class FNetDecoder(nn.Module):
  def __init__(self,embed_dim,dense_dim,num_heads):
    super(FNetDecoder,self).__init__()
    self.embed_dim = embed_dim
    self.dense_dim = dense_dim
    self.num_heads = num_heads
    self.attention_1 = nn.MultiheadAttention(embed_dim,num_heads,batch_first=True)
    self.attention_2 = nn.MultiheadAttention(embed_dim,num_heads,batch_first=True)
    self.dense_proj = nn.Sequential(nn.Linear(embed_dim, dense_dim),nn.ReLU(),nn.Linear(dense_dim, embed_dim))
    self.layernorm_1 = nn.LayerNorm(embed_dim)
    self.layernorm_2 = nn.LayerNorm(embed_dim)
    self.layernorm_3 = nn.LayerNorm(embed_dim)
  def forward(self, inputs, encoder_outputs, mask=None):
    causal_mask = nn.Transformer.generate_square_subsequent_mask(inputs.size(1)).to(device)
    attention_output_1, _ = self.attention_1(inputs, inputs, inputs, attn_mask=causal_mask)
    out_1 = self.layernorm_1(inputs + attention_output_1)
    if mask != None:
      attention_output_2, _ = self.attention_2(out_1, encoder_outputs, encoder_outputs, key_padding_mask =torch.transpose(mask, 0, 1).to(device))
    else:
      attention_output_2, _ = self.attention_2(out_1, encoder_outputs, encoder_outputs)
    out_2 = self.layernorm_2(out_1 + attention_output_2)
    proj_output = self.dense_proj(out_2)
    return self.layernorm_3(out_2 + proj_output)
Step 8: FNet Model
The FNet Model combines positional encoding, FNet encoder and FNet decoder components.
- Initialization (__init__ method): Initializes model with parameters like embed_dim, latent_dim, num_heads and vocab_size.
- Encoder: Processes encoder_inputs through positional encoding and four FNetEncoder layers sequentially.
- Decoder: Processes decoder_inputs, encoder_output and attention mask through four FNetDecoder layers.
- Forward Pass: Takes encoder_inputs, decoder_inputs and attention mask and passes them through encoder and decoder layers to get the final output.
class FNetModel(nn.Module):
	def __init__(self, max_length, vocab_size, embed_dim, latent_dim, num_heads):
		super(FNetModel, self).__init__()
		self.encoder_inputs = PositionalEmbedding(max_length,vocab_size, embed_dim)
		self.encoder1 = FNetEncoder(embed_dim, latent_dim)
		self.encoder2 = FNetEncoder(embed_dim, latent_dim)
		self.encoder3 = FNetEncoder(embed_dim, latent_dim)
		self.encoder4 = FNetEncoder(embed_dim, latent_dim)
		self.decoder_inputs = PositionalEmbedding(max_length,vocab_size, embed_dim)
		self.decoder1 = FNetDecoder(embed_dim, latent_dim, num_heads)
		self.decoder2 = FNetDecoder(embed_dim, latent_dim, num_heads)
		self.decoder3 = FNetDecoder(embed_dim, latent_dim, num_heads)
		self.decoder4 = FNetDecoder(embed_dim, latent_dim, num_heads)
		self.dropout = nn.Dropout(0.5)
		self.dense = nn.Linear(embed_dim, vocab_size)
	def encoder(self,encoder_inputs):
		x_encoder = self.encoder_inputs(encoder_inputs)
		x_encoder = self.encoder1(x_encoder)
		x_encoder = self.encoder2(x_encoder)
		x_encoder = self.encoder3(x_encoder)
		x_encoder = self.encoder4(x_encoder)
		return x_encoder
	def decoder(self,decoder_inputs,encoder_output,att_mask):
		x_decoder = self.decoder_inputs(decoder_inputs)
		x_decoder = self.decoder1(x_decoder, encoder_output,att_mask)
		x_decoder = self.decoder2(x_decoder, encoder_output,att_mask) 
		x_decoder = self.decoder3(x_decoder, encoder_output,att_mask)  
		x_decoder = self.decoder4(x_decoder, encoder_output,att_mask) 
		decoder_outputs = self.dense(x_decoder)
		return decoder_outputs
	def forward(self, encoder_inputs, decoder_inputs,att_mask = None):
		encoder_output = self.encoder(encoder_inputs)
		decoder_output = self.decoder(decoder_inputs,encoder_output,att_mask=None)
		return decoder_output
Step 9: Initialize Model
In this step, we initialize the model by declaring the necessary hyperparameters and passing them to the model class.
- max_length: Maximum sequence length for inputs.
- vocab_size: Size of the vocabulary.
- embed_dim: Embedding dimension for tokens.
- latent_dim: Dimension of the latent space.
- num_heads: Number of attention heads in multi-head attention.
- Model Initialization: Instantiate the FNet model with the defined hyperparameters.
MAX_LENGTH = 512
VOCAB_SIZE = len(tokenizer.vocab)
EMBED_DIM = 256
LATENT_DIM = 100
NUM_HEADS = 4
fnet_model = FNetModel(MAX_LENGTH, VOCAB_SIZE, EMBED_DIM, LATENT_DIM, NUM_HEADS).to(device)
Step 10: Train the Model
Here we train the model by defining the optimizer, loss function and iterating through the training data.
- Optimizer: We use the Adam optimizer to update the model's parameters during training which adapts the learning rate based on the gradient.
- Loss Function: Cross Entropy Loss is used as the loss function which is applied in classification tasks like sequence generation.
- Gradient Calculation: Before each step, gradients are zeroed using optimizer.zero_grad().
- Backpropagation: Gradients are calculated using loss.backward() and the optimizer updates the model's weights with optimizer.step().
- Training Loop: The training process is repeated for 10 epochs during which the model learns to predict the output sequences more accurately.
optimizer = torch.optim.Adam(fnet_model.parameters())
criterion = nn.CrossEntropyLoss(ignore_index=0)
epochs = 100
for epoch in range(epochs):
    train_loss = 0
    for batch in dataloader:
        encoder_inputs_tensor = batch['input_ids'][:,:-1].to(device)
        decoder_inputs_tensor = batch['input_ids'][:,1:].to(device)
        att_mask = batch['attention_mask'][:,:-1].to(device).to(dtype=bool)
        optimizer.zero_grad()
        outputs = fnet_model(encoder_inputs_tensor, decoder_inputs_tensor,att_mask)
        decoder_inputs_tensor.masked_fill(batch['attention_mask'][:,1:].ne(1).to(device), -100).to(device)
        loss = criterion(outputs.view(-1, VOCAB_SIZE), decoder_inputs_tensor.reshape(-1))
        train_loss = train_loss + loss.item()
        loss.backward()
        optimizer.step()
    print (f" epoch: {epoch}, train_loss : {train_loss}")
Output:
Step 11: Use Model for Text Generation
To perform text generation using a Transformer decoder, we can use autoregressive decoding where we iteratively generate one token at a time by sampling from the model's output distribution and feeding the sampled token back into the input for the next step.
We use the encoder part of the model to generate context vector for a given input token.
MAX_LENGTH =100
def decode_sentence(input_sentence, fnet_model):
    fnet_model.eval()
    with torch.no_grad():
        tokenized_input_sentence = torch.tensor(tokenizer(preprocess_text(input_sentence)['text'])['input_ids']).to(device)#
        tokenzied_target_sentence = torch.tensor([101]).to(device) 
        current_text = preprocess_text(input_sentence)['text']
        for i in range(MAX_LENGTH):
            predictions = fnet_model(tokenized_input_sentence[:-1].unsqueeze(0),tokenzied_target_sentence.unsqueeze(0))
            predicted_index = torch.argmax(predictions[0, -1, :]).item()
            predicted_token = tokenizer.decode(predicted_index)
            if predicted_token == "[SEP]":  
              break
            current_text += " "+ predicted_token
            tokenized_target_sentence = torch.cat([tokenzied_target_sentence, torch.tensor([predicted_index]).to(device)], 0).to(device)
            tokenized_input_sentence = torch.tensor(tokenizer(current_text)['input_ids']).to(device)
        return current_text
decode_sentence({'text': 'How are you ?'}, fnet_model)
Output:
how are you ? ufc ufc imp ufc ufc ufc ufc ufc ufc ufc own hey own own own own ufc
You can download source code from here.
Applications
- Generates long-form content such as articles, blogs, and reports by efficiently processing lengthy text sequences.
- Supports machine translation by preserving context across long sentences and documents.
- Produces concise summaries of lengthy documents with reduced computational overhead.
- Analyzes sentiment from reviews, feedback, and other long-form text more efficiently.
- Can be extended to speech-to-text systems for processing and transcribing long audio sequences.
Challenges
- Provides less interpretability since it does not explicitly model token-to-token attention.
- May struggle with highly contextual tasks that require fine-grained relationships between words.
- Replacing self-attention can reduce its ability to capture detailed token interactions.
- Has a smaller research ecosystem and fewer practical resources compared to models such as BERT and GPT.
