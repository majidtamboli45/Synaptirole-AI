# Transformer using PyTorch

> Source: https://www.geeksforgeeks.org/deep-learning/transformer-using-pytorch/

In this article, we will explore how to implement a basic transformer model using PyTorch , one of the most popular deep learning frameworks. By the end of this guide, you’ll have a clear understanding of the transformer architecture and how to build one from scratch.
Understanding Transformers in NLP
Transformers are neural network architectures introduced in the paper "Attention is All You Need" (2017). Unlike traditional recurrent neural networks (RNNs), Transformers use the attention mechanism to process sequences in parallel, significantly improving efficiency and scalability. They are particularly effective in NLP tasks like text generation, language translation, and sentiment analysis.
Self-Head Attention in Transformer
Attention mechanism allows models to weigh the importance of different words in a sequence. In self-attention, each word in a sentence considers all other words computing a score to determine how much attention it should pay to each word. This enables the model to capture relationships between words effectively.
Mathematical Intuition Behind Self-Attention:
- Token Embedding: Convert text into tokens each mapped to a vector.
- Self-Attention Score: The model calculates three vectors—Query (Q), Key (K), and Value (V) from the input using linear transformations.
- Scaled Dot Product: Compute attention scores by taking the dot product of Q and K, scale the result and apply softmax to normalize.
- Contextual Representation: The output is computed by multiplying the attention scores by the value vectors.
Now lets start building our transformer model.
Building Transformer Architecture using PyTorch
To construct the Transformer model, we need to follow these key steps:
1. Importing Libraries
This block imports the necessary libraries and modules such as PyTorch for neural network creation and other utilities like math and copy for calculations.
import torch
from torch import nn as nn
from torch import optim as optim
import torch.utils.data as data
import math
import copy
2. Multi-Head Attention
This block defines the MultiHeadAttention class. It splits the input into multiple attention heads, computes scaled dot-product attention, and then combines the outputs.
- nn.Linear(d_model, d_model) : Initializes a linear transformation for the query, key and value vectors in multi-head attention.
- torch.matmul(Q, K.transpose(-2, -1)) : Calculates the dot product between the query and key vectors used for attention scoring.
- torch.softmax(attn_scores, dim=-1) : Applies the softmax function on attention scores to get the normalized attention probabilities.
- torch.matmul(attn_probs, V) : Uses the attention probabilities to weight the value vectors and compute the final output of the attention mechanism.
class MultiHeadAttention(nn.Module):
    def __init__(self, d_model, num_heads):
        super(MultiHeadAttention, self).__init__()
        assert d_model % num_heads == 0, "d_model must be divisible by num_heads"
        self.d_model = d_model
        self.num_heads = num_heads
        self.d_k = d_model // num_heads
        self.W_q = nn.Linear(d_model, d_model)
        self.W_k = nn.Linear(d_model, d_model)
        self.W_v = nn.Linear(d_model, d_model)
        self.W_o = nn.Linear(d_model, d_model)
    def scaled_dot_product_attention(self, Q, K, V, mask=None):
        attn_scores = torch.matmul(Q, K.transpose(-2, -1)) / math.sqrt(self.d_k)
        if mask is not None:
            attn_scores = attn_scores.masked_fill(mask == 0, -1e9)
        attn_probs = torch.softmax(attn_scores, dim=-1)
        output = torch.matmul(attn_probs, V)
        return output
    def split_heads(self, x):
        batch_size, seq_length, d_model = x.size()
        return x.view(batch_size, seq_length, self.num_heads, self.d_k).transpose(1, 2)
    def combine_heads(self, x):
        batch_size, _, seq_length, d_k = x.size()
        return x.transpose(1, 2).contiguous().view(batch_size, seq_length, self.d_model)
    def forward(self, Q, K, V, mask=None):
        Q = self.split_heads(self.W_q(Q))
        K = self.split_heads(self.W_k(K))
        V = self.split_heads(self.W_v(V))
        attn_output = self.scaled_dot_product_attention(Q, K, V, mask)
        output = self.W_o(self.combine_heads(attn_output))
        return output
3. Position-Wise Feed Forward
This block defines a position-wise feed-forward network which consists of two linear layers and a ReLU activation to process each position of the input sequence independently.
- self.fc1 = nn.Linear(d_model, d_ff) : Initializes a linear transformation to map input embeddings to a higher-dimensional space (d_ff ) used in the feed-forward network.
- self.relu = nn.ReLU() : Defines the ReLU activation function to introduce non-linearity between the two fully connected layers.
- self.fc2 = nn.Linear(d_ff, d_model) : Maps the output back to the model’s original dimension (d_model ).
class PositionWiseFeedForward(nn.Module):
    def __init__(self, d_model, d_ff):
        super(PositionWiseFeedForward, self).__init__()
        self.fc1 = nn.Linear(d_model, d_ff)
        self.fc2 = nn.Linear(d_ff, d_model)
        self.relu = nn.ReLU()
    def forward(self, x):
        return self.fc2(self.relu(self.fc1(x)))
4. Positional Encoding
This block defines the Positional Encoding class which adds positional information to the token embeddings allowing the model to retain information about word positions in the input sequence.
- torch.sin(position * div_term) : Applies the sine function to compute positional encoding values for even indices.
- torch.cos(position * div_term) : Applies the cosine function to compute positional encoding values for odd indices.
- self.register_buffer('pe', pe.unsqueeze(0)) : Registers the positional encoding as a buffer so that it is part of the model but not considered a parameter during optimization.
class PositionalEncoding(nn.Module):
    def __init__(self, d_model, max_seq_length):
        super(PositionalEncoding, self).__init__()
        pe = torch.zeros(max_seq_length, d_model)
        position = torch.arange(0, max_seq_length, dtype=torch.float).unsqueeze(1)
        div_term = torch.exp(torch.arange(0, d_model, 2).float() * -(math.log(10000.0) / d_model))
        pe[:, 0::2] = torch.sin(position * div_term)
        pe[:, 1::2] = torch.cos(position * div_term)
        self.register_buffer('pe', pe.unsqueeze(0))
    def forward(self, x):
        return x + self.pe[:, :x.size(1)]
5. Encoder Layer
This block defines the Encoder Layer class which contains the multi-head attention mechanism and the position-wise feed-forward network, with layer normalization and dropout applied.
-  attn_output = self.self_attn(x, x, x, mask) : Performs self-attention on the input, where the input sequence attends to itself.
- self.norm1(x + self.dropout(attn_output)) : Adds the attention output to the input and applies layer normalization.
- self.feed_forward(x) : Passes the result through a position-wise feed-forward network to refine the embeddings.
class EncoderLayer(nn.Module):
    def __init__(self, d_model, num_heads, d_ff, dropout):
        super(EncoderLayer, self).__init__()
        self.self_attn = MultiHeadAttention(d_model, num_heads)
        self.feed_forward = PositionWiseFeedForward(d_model, d_ff)
        self.norm1 = nn.LayerNorm(d_model)
        self.norm2 = nn.LayerNorm(d_model)
        self.dropout = nn.Dropout(dropout)
    def forward(self, x, mask):
        attn_output = self.self_attn(x, x, x, mask)
        x = self.norm1(x + self.dropout(attn_output))
        ff_output = self.feed_forward(x)
        x = self.norm2(x + self.dropout(ff_output))
        return x
6. Decoder Layer
This block defines the Decoder Layer class, which is similar to the encoder layer but also includes a cross-attention mechanism to attend to the encoder’s output.
- attn_output = self.self_attn(x, x, x, tgt_mask) : Performs self-attention on the target sequence attending to the target sequence itself.
- attn_output = self.cross_attn(x, enc_output, enc_output, src_mask) : Performs cross-attention where the target sequence attends to the encoder's output sequence.
- self.norm2(x + self.dropout(attn_output)) : Adds the attention output from the cross-attention mechanism to the input and applies layer normalization.
class DecoderLayer(nn.Module):
    def __init__(self, d_model, num_heads, d_ff, dropout):
        super(DecoderLayer, self).__init__()
        self.self_attn = MultiHeadAttention(d_model, num_heads)
        self.cross_attn = MultiHeadAttention(d_model, num_heads)
        self.feed_forward = PositionWiseFeedForward(d_model, d_ff)
        self.norm1 = nn.LayerNorm(d_model)
        self.norm2 = nn.LayerNorm(d_model)
        self.norm3 = nn.LayerNorm(d_model)
        self.dropout = nn.Dropout(dropout)
    def forward(self, x, enc_output, src_mask, tgt_mask):
        attn_output = self.self_attn(x, x, x, tgt_mask)
        x = self.norm1(x + self.dropout(attn_output))
        attn_output = self.cross_attn(x, enc_output, enc_output, src_mask)
        x = self.norm2(x + self.dropout(attn_output))
        ff_output = self.feed_forward(x)
        x = self.norm3(x + self.dropout(ff_output))
        return x
7. Transformer Model
This block defines the main Transformer class which combines the encoder and decoder layers. It also includes the embedding layers and the final output layer.
- self.encoder_embedding = nn.Embedding(src_vocab_size, d_model) : Initializes the embedding layer for the source sequence, mapping tokens to continuous vectors of sized_model .
- self.fc = nn.Linear(d_model, tgt_vocab_size) : Maps the final output embeddings from the decoder to the target vocabulary size to predict the output tokens.
- self.generate_mask(src, tgt) : Generates source and target masks to prevent attention to certain parts of the input, such as padding or future tokens in the target sequence.
class Transformer(nn.Module):
    def __init__(self, src_vocab_size, tgt_vocab_size, d_model, num_heads, num_layers, d_ff, max_seq_length, dropout):
        super(Transformer, self).__init__()
        self.encoder_embedding = nn.Embedding(src_vocab_size, d_model)
        self.decoder_embedding = nn.Embedding(tgt_vocab_size, d_model)
        self.positional_encoding = PositionalEncoding(d_model, max_seq_length)
        self.encoder_layers = nn.ModuleList([EncoderLayer(d_model, num_heads, d_ff, dropout) for _ in range(num_layers)])
        self.decoder_layers = nn.ModuleList([DecoderLayer(d_model, num_heads, d_ff, dropout) for _ in range(num_layers)])
        self.fc = nn.Linear(d_model, tgt_vocab_size)
        self.dropout = nn.Dropout(dropout)
    def generate_mask(self, src, tgt):
        src_mask = (src != 0).unsqueeze(1).unsqueeze(2)
        tgt_mask = (tgt != 0).unsqueeze(1).unsqueeze(3)
        seq_length = tgt.size(1)
        nopeak_mask = (1 - torch.triu(torch.ones(1, seq_length, seq_length), diagonal=1)).bool()
        tgt_mask = tgt_mask & nopeak_mask
        return src_mask, tgt_mask
    def forward(self, src, tgt):
        src_mask, tgt_mask = self.generate_mask(src, tgt)
        src_embedded = self.dropout(self.positional_encoding(self.encoder_embedding(src)))
        tgt_embedded = self.dropout(self.positional_encoding(self.decoder_embedding(tgt)))
        enc_output = src_embedded
        for enc_layer in self.encoder_layers:
            enc_output = enc_layer(enc_output, src_mask)
        dec_output = tgt_embedded
        for dec_layer in self.decoder_layers:
            dec_output = dec_layer(dec_output, enc_output, src_mask, tgt_mask)
        output = self.fc(dec_output)
        return output
8. Training the Model
This block defines the training loop using Cross-Entropy loss and the Adam optimizer then trains the model for 100 epochs.
- optimizer.zero_grad() : Clears the gradients of all optimized tensors before the backward pass.
- loss.backward() : Computes the gradients of the loss with respect to the model parameters.
- optimizer.step() : Updates the model parameters based on the gradients computed during backpropagation.
criterion = nn.CrossEntropyLoss(ignore_index=0)
optimizer = optim.Adam(transformer.parameters(), lr=0.0001, betas=(0.9, 0.98), eps=1e-9)
transformer.train()
for epoch in range(100):
    optimizer.zero_grad()
    output = transformer(src_data, tgt_data[:, :-1])
    loss = criterion(output.contiguous().view(-1, tgt_vocab_size), tgt_data[:, 1:].contiguous().view(-1))
    loss.backward()
    optimizer.step()
    print(f"Epoch: {epoch+1}, Loss: {loss.item()}")
Output:
This indicates that the model is learning effectively as the loss decreases with each epoch meaning the model is becoming better at making predictions. The gradual decline in loss suggests that the model is improving its accuracy and minimizing errors over time.
9. Evaluating the Model
This block evaluates the trained model on validation data by calculating the validation loss.
- torch.no_grad() : Disables gradient calculation during the evaluation phase to save memory and computational resources.
- val_output = transformer(val_src_data, val_tgt_data[:, :-1]) : Performs a forward pass on the validation data to obtain model predictions.
- criterion(val_output.contiguous().view(-1, tgt_vocab_size), val_tgt_data[:, 1:].contiguous().view(-1)) : Computes the loss between the model's predictions and the true target values for evaluation.
transformer.eval()
val_src_data = torch.randint(1, src_vocab_size, (64, max_seq_length)) 
val_tgt_data = torch.randint(1, tgt_vocab_size, (64, max_seq_length)) 
with torch.no_grad():
    val_output = transformer(val_src_data, val_tgt_data[:, :-1])
    val_loss = criterion(val_output.contiguous().view(-1, tgt_vocab_size), val_tgt_data[:, 1:].contiguous().view(-1))
    print(f"Validation Loss: {val_loss.item()}")
Output:
Validation Loss: 8.820590019226074
Practical Applications of Transformers
Transformers have proven highly effective in a variety of NLP tasks:
- Text Generation: Models like GPT use Transformers to generate coherent text based on input prompts.
- Machine Translation: BERT and other Transformer-based models excel at translating text from one language to another.
- Sentiment Analysis: Transformers can be fine-tuned to classify sentiment from text data.
Building LLMs from scratch requires an understanding of the Transformer architecture and the self-attention mechanism. By following the steps outlined in this article you can implement your own Transformer model using PyTorch and can further fine tune it for specific tasks. Though transformers have their limitations and it’s important to consider their computational costs and data requirements in real-world applications.
You can download Source code from here.
