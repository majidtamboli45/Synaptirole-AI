# How to Generate Word Embedding using BERT?

> Source: https://www.geeksforgeeks.org/nlp/how-to-generate-word-embedding-using-bert/

Word embedding is an important part of the NLP process. It is responsible to capture the semantic meaning of words, reduce dimensionality, add contextual information, and promote efficient learning by transferring linguistic knowledge via pre-trained embeddings. As a result, we get enhanced performance with limited task-specific data. In this article, we are going to understand BERT and how it's going to generate embeddings.
What is word embedding?
Word embedding is an unsupervised method required for various Natural Language Processing (NLP) tasks like text classification, sentiment analysis, etc. Generating word embeddings from Bidirectional Encoder Representations from Transformers (BERT) is an efficient technique. BERT can be commonly referred to as a pre-trained language model, which can also be used for NLP tasks by fine-tuning.
Some of the popular word-embedding techniques
There are some well-known word-embedding techniques are discussed below:
- Term Frequency-Inverse Document Frequency (TF-IDF)
- Bag of Words(BoW)
- Word2Vec
- Global Vector for Word Representation (Glove)
In this article, we will generate word embeddings using the BERT model.
Architecture of BERT
BERT is a commonly used state-of-the-art deep learning model for various NLP tasks. We will explore its architecture below:
- Transformer Architecture: Transformers are highly parallelizable and efficient for capturing long-range dependencies in text. BERT utilizes transformers architecture which enables self-attention mechanisms and feedforward neural networks.
- Bidirectional Encoding: Old models used to read text in only one direction(mostly left to right). But BERT has a bidirectionality feature that enables to processing of the text from both directions i.e. left to right and right to left. For this feature, BERT can effectively analyze the context of each word by considering all the words in the sentence.
- Pre-training and Fine-tuning: BERT is capable of learning rich and contextualized word representations as it is pre-trained on a massive corpus of text data. And we can perform fine-tuning on this pre-trained data as per our requirement which makes BERT highly adaptable and effective for various NLP tasks.
- Multi-Layer Stacking: BERT consists of stacked transformers i.e. it has multiple layers of transformers stacked on top of each other. This feature enables BERT to capture more complex contextual information.
- Embedding Layers: BERT utilizes Word Piece tokenization where each word of the input sentence breaks down into sub-word tokens.
- Masked Language Modeling (MLM): BERT is also trained to predict masked words within a sentence. This forces the model to understand the context of words in relation to their surroundings.
Why do we need to use BERT
There are several reasons which made BERT a common choice for NLP tasks. The reasons are discussed below:
- Contextual Understanding: BERT not only reads the sentence but also captures the contextual meaning of each words in a sentence. This makes BERT model very popular for NLP task like sentiment analysis, text classification and named entity recognition.
- Pre-trained Representations: BERT is a pre-trained model which already has the knowledge of massive amount of text data. So, it saves a lot of time of long trainings makes it one-step forward to directly jump into NLP tasks. And we can perform fine-tuning as per our requirements which provides enhanced model performance.
- Transfer Learning: BERT utilizes transfer learning which allows you to leverage the knowledge gained from pre-training on a broad range of tasks without starting from scratch. So, it also saves a lot of time once again.
How BERT is better than Word2vec?
BERT and Word2vec both are famous for generating word-embeddings for different NLP tasks. But somehow BERT outperforms over Word2vec. The reasons are discussed below:
- Contextual Understanding: BERT model can capture the contextual meaning of each word based on their surrounding words in a sentence. So, BERT can generate contextual word-embeddings. In the other hand, Word2vec is not capable to capture context of the words so that it generates static embeddings only. So, BERT model is more informative and effective for NLP tasks like sentiment analysis, text classification etc. where contextual meanings need to be considered.
- Pre-training and Transfer Learning: BERT is pre-trained on a massive amount of text data so that this model can predict masked words within sentences and gains a deep understanding of language semantics. Also we can perform fine-tuning for specific downstream NLP tasks. But Word2vec model is only trained using a simpler prediction task of predicting words within a fixed window and there is no default way to perform fine-tuning on it.
- Out-of-Vocabulary Handling: BERT can effectively handle out-of-vocabulary (OOV) words by breaking them down into sub-word tokens using sub-word tokenization techniques like Word Piece or Byte Pair Encoding (BPE). But Word2vec doesn't has any sub-word tokenization feature so, it can't handle OOV effectively.
- Polysemy Handling: When single word carries multiple meanings(sarcasm or irony) it can be called polysemy. BERT can effectively handle it as this model captures the whole context of the sentence. Word2vec model may not capture all meanings as it assigns only one vector for one word.
Step-by-step implementation
Installing transformers module
There is a high probability that the most important transformers module will not be pre-installed in your Python environment. To install it write the following line of code only.
!pip install transformers
Importing required libraries
Now, we will import all necessary Python libraries like PyTorch etc.
# importing libraries
import random
import torch
from transformers import BertTokenizer, BertModel
from sklearn.metrics.pairwise import cosine_similarity
Setting random seed
We will set random seed for PyTorch to get high reproducibility. It is good practice to use random seeding when we use any kind of model loading in our code. It also handles the randomness of GPU(if any).
# Set a random seed
random_seed = 42
random.seed(random_seed)
# Set a random seed for PyTorch (for GPU as well)
torch.manual_seed(random_seed)
if torch.cuda.is_available():
    torch.cuda.manual_seed_all(random_seed)
Loading BERT Pre-trained Model
Now we will load our BERT model along with tokenizer. Here we have used 'bert-base-uncased' which is the most commonly used of several NLP tasks. This will convert all upper case character present in input text to lower case. For all general NLP tasks like text classification, Sentiment analysis and Named entity recognition, this variant is used. However for advanced usage you can use 'bert-base-cased' which will keep the case sensitivity of the characters.
# Load BERT tokenizer and model
tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')
model = BertModel.from_pretrained('bert-base-uncased')
Tokenize and Encode Text
Now we will consider any input text and tokenize it using BERT tokenizer (batch_encode_plus). This is basically Word Piece tokenization which split each word of sentence into sub-word tokens. Then we will encode these tokens into IDs. We will also set the add_special_tokens parameter 'True' to add special token like SEP and CLS in tokenized text. SEP special token is used for separating different segments or sentences within a single input sequence. It is also should be inserted between two sentences or segments. And the CLS special token is the first token in every input sequence. It is used to represent the entire input sequence in a single vector and called as the "CLS" embedding. Adding special tokens is a good practice when working with word Embeddings.
# Input text
text = "GeeksforGeeks is a computer science portal"
# Tokenize and encode text using batch_encode_plus
# The function returns a dictionary containing the token IDs and attention masks
encoding = tokenizer.batch_encode_plus( [text],# List of input texts
    padding=True,              # Pad to the maximum sequence length
    truncation=True,           # Truncate to the maximum sequence length if necessary
    return_tensors='pt',      # Return PyTorch tensors
    add_special_tokens=True    # Add special tokens CLS and SEP
)
input_ids = encoding['input_ids']  # Token IDs
# print input IDs
print(f"Input ID: {input_ids}")
attention_mask = encoding['attention_mask']  # Attention mask
# print attention mask
print(f"Attention mask: {attention_mask}")
Output:
Input ID: tensor([[  101, 29294, 22747, 21759,  4402,  5705,  2003,  1037,  3274,  2671,
9445, 102]])
Attention mask: tensor([[1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]])
So, for each token attention is 1 so, overall attention score is 1 which denotes that out BERT model is considering the entire input sequence to generate the embeddings for each token. Getting attention score 1 is very good as it effectively capturing all context. However, if you use very long input sequence the attention score may drop. This score denotes that how much attention should be given to that token for generating word-embeddings. Here, all tokens are fully attended.
Generating Word Embeddings
Now we will pass the tokens and encoded input through BERT model. The model will generate embeddings for each tokens.
# Generate embeddings using BERT model
with torch.no_grad():
    outputs = model(input_ids, attention_mask=attention_mask)
    word_embeddings = outputs.last_hidden_state  # This contains the embeddings
# Output the shape of word embeddings
print(f"Shape of Word Embeddings: {word_embeddings.shape}")
Output:
Shape of Word Embeddings: torch.Size([1, 12, 768])
The shape of Word embeddings is [1, 12, 768] where 768 is the dimensionality/hidden size of the word embeddings generated by our BERT model (bert-base-uncased variant mode). Each token is represented by a 768-dimensional vector and 12 is the number of tokens in our input text after tokenization. Here 1 is nothing but batch dimension i.e. the total number of sentences(input sequences) we have passed(here only one sentence).
Decode and Encode the text
Here we will decode the token IDs back to text using a function (tokenizer.decode) then tokenize it (tokenizer.tokenize) and finally encode it (tokenizer.encode).
# Decode the token IDs back to text
decoded_text = tokenizer.decode(input_ids[0], skip_special_tokens=True)
#print decoded text
print(f"Decoded Text: {decoded_text}")
# Tokenize the text again for reference
tokenized_text = tokenizer.tokenize(decoded_text)
#print tokenized text
print(f"tokenized Text: {tokenized_text}")
# Encode the text
encoded_text = tokenizer.encode(text, return_tensors='pt')  # Returns a tensor
# Print encoded text
print(f"Encoded Text: {encoded_text}")
Output:
Decoded Text: geeksforgeeks is a computer science portal
tokenized Text: ['geek', '##sf', '##org', '##ee', '##ks', 'is', 'a', 'computer', 'science', 'portal']
Encoded Text: tensor([[ 101, 29294, 22747, 21759, 4402, 5705, 2003, 1037, 3274, 2671,
9445, 102]])
If you look into the decoded text which is same with input text but only changed with all lower case as we used bert-base-uncased variant mode. And Encoded text and Input IDs are same as tokenizer.encode and tokenizer.batch_encode_plus both variables produces same sequence of token IDs for a particular input text. As discussed previously BERT can handle out-of-vocabulary(new word to its pre-trained corpus) words which is here 'GeeksforGeeks'. So, it is broken down into sub-word tokens.
Extract and print Word Embeddings
Finally, we will extract the generated word embeddings and print them. Word embeddings are contextual and can capture the meaning of each word present in the sentence. We also print the shape of embedding. We will not print tokens here as it is not needed. If you wish you can also print them by uncommenting the token printing line present in for loop.
# Print word embeddings for each token
for token, embedding in zip(tokenized_text, word_embeddings[0]):
    #print(f"Token: {token}")
    print(f"Embedding: {embedding}")
    print("\n")
Output:
Embedding: tensor([-2.4299e-01, -2.2849e-01,  5.8441e-02,  5.7861e-03, -4.3398e-01,
-3.4387e-01, 9.6974e-02, 3.6446e-01, -6.3829e-02, -2.3413e-01,
-3.2477e-01, -4.9730e-01, -3.0048e-01, 3.5098e-01, -4.8904e-01,
-1.2836e-01, -5.5042e-01, 4.0802e-02, -3.2041e-01, -1.6057e-01,
................................................
......
......
......
......
Embedding: tensor([-5.9422e-01, 3.0865e-01, -3.5836e-01, -1.6872e-02, 2.9080e-01,
-5.5942e-01, -2.2233e-01, 7.7186e-01, -8.0256e-01, 2.2205e-01,
-6.1288e-01, -6.0329e-01, -8.2418e-02, 2.8664e-01, -1.1168e+00,
1.1978e+00, 6.1283e-02, -3.9820e-01, 1.1269e-01, -7.9150e-01,
...................................................
It will generate a very large output. A little portion of embedding is provided for understanding purpose. So, the output we have shown the some portions of embeddings of the fast and last token only.
Printing Sentence Embedding
We will also generate sentence embedding by computing average of word embeddings using average pooling.
# Compute the average of word embeddings to get the sentence embedding
sentence_embedding = word_embeddings.mean(dim=1)  # Average pooling along the sequence length dimension
# Print the sentence embedding
print("Sentence Embedding:")
print(sentence_embedding)
# Output the shape of the sentence embedding
print(f"Shape of Sentence Embedding: {sentence_embedding.shape}")
Output:
Sentence Embedding:
tensor([[-1.2731e-01, 2.3766e-01, 1.6280e-01, 1.7505e-01, 2.1393e-01,
-7.2085e-01, -1.1638e-01, 5.5303e-01, -2.4897e-01, -3.5929e-02,
-9.9867e-02, -5.9745e-01, -1.2873e-02, 4.0385e-01, -4.7625e-01,
9.3286e-02, -3.1485e-01, 1.4257e-02, -3.1248e-01, -1.5662e-01,
-1.8107e-01, -2.4591e-01, -9.8347e-02, 5.4759e-01, 1.2483e-01,
.......................................
.......................................
-1.1171e-01, 2.2538e-01, 5.8986e-02]])
Shape of Sentence Embedding: torch.Size([1, 768])
It will also generate a large output along with shape of sentence embedding which is [number of sentences, hidden size].
Computing similarity metrics
Now we will compute similarity metrics of a example sentence(GeeksforGeeks is a technology website) with our original sentence(GeeksforGeeks is a computer science portal) which is used till now. Checking similarity metrics or index is the most used task of word embeddings.
# Example sentence for similarity comparison
example_sentence = "GeeksforGeeks is a technology website"
# Tokenize and encode the example sentence
example_encoding = tokenizer.batch_encode_plus(
    [example_sentence],
    padding=True,
    truncation=True,
    return_tensors='pt',
    add_special_tokens=True
)
example_input_ids = example_encoding['input_ids']
example_attention_mask = example_encoding['attention_mask']
# Generate embeddings for the example sentence
with torch.no_grad():
    example_outputs = model(example_input_ids, attention_mask=example_attention_mask)
    example_sentence_embedding = example_outputs.last_hidden_state.mean(dim=1)
# Compute cosine similarity between the original sentence embedding and the example sentence embedding
similarity_score = cosine_similarity(sentence_embedding, example_sentence_embedding)
# Print the similarity score
print("Cosine Similarity Score:", similarity_score[0][0])
Output:
 Cosine Similarity Score: 0.9561723
So, more than 95% similarity is encountered.
Conclusion
So we can conclude that, generating Word embeddings is very much necessary for various NLP task. The size of output of the word embedding may be huge but they are can capture the meaning of each token present in the sentence which can play an essential role in sentiment analysis and text classification.
