# How Do Self-attention Masks Work?

> Source: https://www.geeksforgeeks.org/nlp/how-do-self-attention-masks-work/

Self-attention mechanism enables each word or token in a sequence to focus on other relevant words or tokens within the same sequence, allowing for relationships between elements to be dynamic and context-dependent.
For example, in the sentence "The cat sat on the mat", the word "sat" has to notice "cat" to know who is sitting and notice "mat" in order to know where the action is taking place.
What Do Self-Attention Masks Do?
Self-Attention Mask is like a set of instructions for the model. It tells the model which words to pay attention to and which ones to skip over. Sometimes, there are words in a sentence that aren't important for the task at hand like extra padding words that are just there to fill space or future words that the model shouldn't look at yet.
The mask helps the model stay focused on the right words and ignore the ones that aren't useful. This way, the model can do its job more efficiently and accurately, without getting confused by unnecessary information.
What Are Padding Words?
Padding words are special tokens added to sequences in NLP tasks to make all sequences the same length. This is important for many machine learning models, including neural networks, which require consistent input lengths.
Padding tokens don't carry meaningful information, they are just placeholders to ensure uniform sequence length.
For example,
Sentence : "The horse ran quickly."
Padded Sentence : "The horse ran quickly [PAD]"
Here, "[PAD]" is the padding token that fills the space to make both sentences the same length.
Concept of Mask Attention
1. Making Attention Scores:
- Every word in the sentence makes a "query" (a question), "key" (a label) and "value" (the content).
- The model computes attention scores depending on how well the query matches the key, this informs the model how much attention a word should pay to other words.
2. Applying the Mask:
- The self-attention mask is applied to these attention scores, if the word needs to be masked (such as a padding word or future word), the mask prevents it by setting its score to 0.
- If the word is crucial, the mask allows the score to remain at 1, i.e. the word can pay attention to it.
3. Adjusting Attention:
- Having applied the mask, the model refines its attention according to the valid attention scores that have remained.
- This manner, the model leave unnecessary sections (such as padding or upcoming words) and only checks the significant sections of the input.
4. Generating Final Output:
- The model then sum up the attention scores to generate a final output based on the most important sections of the sentence, assisting it in making more accurate predictions, e.g. translating text or predicting the subsequent word in a sentence.
Table showing Attention scores Before and After Masking
Before applying the mask, the attention mechanism considers all words equally.
| Token | The | cat | sat | on | the | mat | 
|---|---|---|---|---|---|---|
| The | 1.0 | 0.8 | 0.6 | 0.4 | 0.5 | 0.3 | 
| Cat | 0.8 | 1.0 | 0.9 | 0.4 | 0.5 | 0.2 | 
| Sat | 0.6 | 0.9 | 1.0 | 0.8 | 0.7 | 0.6 | 
After applying a future word mask, the model cannot "see" future tokens:
| Token | The | cat | sat | on | the | mat | 
|---|---|---|---|---|---|---|
| The | 1.0 | 0.8 | 0.6 | -∞ | -∞ | -∞ | 
| Cat | 0.8 | 1.0 | 0.9 | -∞ | -∞ | -∞ | 
| Sat | 0.6 | 0.9 | 1.0 | -∞ | -∞ | -∞ | 
Why Are Self-Attention Masks Important?
- Efficiency: Cross-attention helps the model focus on important details, making processing faster and more efficient.
- Handling Padding: When dealing with sequences that are of different lengths, padding is added to fill the gaps. The mask stops the model from paying attention to this padding, since it doesn’t have any real info.
- Autoregressive Models: In tasks like writing text, self-attention masks stop the model from peeking ahead and using future words to guess the current one.
Implementing Self-Attention Masks for Causal Attention
In this example, let's assume we are using PyTorch to implement a basic self-attention layer and apply a mask to prevent attention to future positions (in a causal or autoregressive setting).
Step 1: Initialize Input Tensor
The first step is to create a random input tensor representing token embeddings. This tensor has dimensions (batch_size, seq_len, embedding_dim) where:
- batch_size is the number of sequences in the batch.
- seq_len is the length of each sequence.
- embedding_dim is the dimensionality of the token embeddings (features).
# sequence length and batch size
seq_len = 5
batch_size = 2
# Random input tensor (batch_size, seq_len, embedding_dim)
embedding_dim = 4
x = torch.rand(batch_size, seq_len, embedding_dim)
print("Input Tensor (x):")
print(x)
Output:
Step 2: Create Self-Attention Mask
Next, we create a self-attention mask that controls how each token can attend to other tokens. In this case, we use a causal mask, which ensures that tokens cannot attend to future positions (i.e., tokens ahead of them in the sequence). This is commonly used in autoregressive models where the model must not look ahead in the sequence.
The mask is an upper triangular matrix (torch.tril) where:
- 1's represent positions that are allowed to attend.
- 0's represent positions that are masked and cannot attend.
mask = torch.tril(torch.ones(seq_len, seq_len)).unsqueeze(0).repeat(batch_size, 1, 1)
print("\nSelf-attention Mask (Causal):")
print(mask)
Output:
Step 3: Compute Attention Scores
Now, we compute the attention scores, which represent the similarity between each pair of tokens. This is done by performing a dot product between the input tensor (x) and its transpose. The scores are then scaled by the square root of the embedding dimension (embedding_dim ** 0.5) to stabilize gradients during training.
attention_scores = torch.matmul(x, x.transpose(-1, -2)) / (embedding_dim ** 0.5)
print("\nAttention Scores (Before Masking):")
print(attention_scores)
Output:
Step 4: Apply Mask to Attention Scores
In this step, we apply the mask to the attention scores. We use the mask to set the attention scores for masked positions (where the mask is 0) to a very large negative value (-1e9). This ensures that when we apply the softmax in the next step, the masked positions will have an attention weight of zero.
attention_scores = attention_scores.masked_fill(mask == 0, -1e9)
print("\nAttention Scores (After Masking):")
print(attention_scores)
Output:
Step 5: Compute Attention Weights
Explanation: Once the mask is applied, we perform a softmax operation on the attention scores to get the attention weights. This operation converts the scores into probabilities, ensuring that the sum of the attention weights for each token equals 1. The softmax is applied along the sequence dimension (dim=-1), so each token's attention distribution over all other tokens is computed.
# Attention weights
import torch.nn.functional as F
attention_weights = F.softmax(attention_scores, dim=-1)
print("\nAttention Weights (After Softmax):")
print(attention_weights)
Output:
Step 6: Compute Output of Self-Attention
Finally, we compute the output of the self-attention mechanism by taking a weighted sum of the input tensor (x) based on the attention weights. This is done by performing a matrix multiplication between the attention weights and the input tensor.
output = torch.matmul(attention_weights, x)
print("\nOutput Tensor (After Attention):")
print(output)
Output:
Self-attention masks are essential for making Transformers efficient and context-aware. As NLP advances, newer masking techniques will further improve large-scale models, enabling better accuracy and faster computations in text and speech processing.
