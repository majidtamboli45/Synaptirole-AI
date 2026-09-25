# Sentence Similarity using BERT Transformer

> Source: https://www.geeksforgeeks.org/nlp/sentence-similarity-using-bert-transformer/

Conventional techniques for assessing sentence similarity frequently struggle to grasp the intricate nuances and semantic connections found within sentences. With the rise of Transformer-based models such as BERT, RoBERTa, and GPT, there is potential to improve sentence similarity measurements with increased accuracy and contextual awareness.
The article demonstrates how to leverage Transformer-based models like BERT for accurately measuring sentence similarity through tokenization and cosine similarity calculations.
How can we use transformers for sentence similarity?
Using transformers for sentence similarity involves encoding two input sentences into fixed-size representations and then measuring the similarity between these representations. Here's a general approach using a pre-trained transformer model like BERT:
- Preprocess Input Sentences:
  - Tokenize the input sentences into tokens.
  - Add special tokens [CLS] at the beginning and[SEP] at the end of each sentence.
  - Pad or truncate the token sequences to a fixed length.
- Encode Sentences:
  - Pass the tokenized sentences through the pre-trained transformer model (e.g., BERT) to obtain contextual embeddings for each token.
  - Use the output of the [CLS] token as the representation for the entire sentence.
- Calculate Similarity:
  - Measure the similarity between the two sentence embeddings using a similarity metric like cosine similarity or Euclidean distance.
Step 1: Pre-processing Input Sentences
The BERT tokenizer divides input text into tokens, where each token can be a word or a subword. It tokenizes sentences into lists of tokens, like converting "I like coding in Python." into ['i', 'like', 'coding', 'in', 'python', '.']. Additionally, it inserts special tokens: [CLS] at the start of the first sentence and [SEP] at the end of each sentence to aid BERT in understanding sentence structure.
from transformers import BertTokenizer
# Load the BERT tokenizer
tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')
# Example sentences
sentence1 = "I like coding in Python."
sentence2 = "Python is my favorite programming language."
# Tokenize the sentences
tokens1 = tokenizer.tokenize(sentence1)
tokens2 = tokenizer.tokenize(sentence2)
# Add [CLS] and [SEP] tokens
tokens = ['[CLS]'] + tokens1 + ['[SEP]'] + tokens2 + ['[SEP]']
print("Token:", tokens)
Output:
Tokens: ['[CLS]', 'i', 'like', 'coding', 'in', 'python', '.', '[SEP]', 'python', 'is', 'my', 'favorite', 'programming', 'language', '.', '[SEP]']
Step 2: Encoding Sentences
The BERT tokenizer maps each token to a unique integer ID from its vocabulary, converting tokenized sentences into sequences of IDs. BERT's input format includes token IDs, segment IDs to differentiate sentences, and an attention mask for padding, forming the input representation for the BERT model.
# Convert tokens to input IDs
input_ids = tokenizer.convert_tokens_to_ids(tokens)
# Display the tokens and input IDs
print("Input IDs:", input_ids)
Output:
Input IDs: [101, 1045, 2066, 16861, 1999, 18750, 1012, 102, 18750, 2003, 2026, 5440, 4730, 2653, 1012, 102]
Step 3: Calculating Sentence Similarity using BERT Transformer
The process involves importing necessary libraries like BertTokenizer, BertModel, torch, and cosine_similarity. A pre-trained 'bert-base-uncased' model is loaded. Example sentences, preprocessed and tokenized, are converted to token IDs and reshaped into tensors. The BERT model generates embeddings, with the [CLS] token used as the sentence embedding. Cosine similarity between the embeddings is calculated to get a similarity score, which is then printed to the console.
from transformers import BertTokenizer, BertModel
import torch
from sklearn.metrics.pairwise import cosine_similarity
# Load the BERT tokenizer and model
tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')
model = BertModel.from_pretrained('bert-base-uncased')
# Example sentences (already preprocessed)
tokens1 = ["[CLS]", "i", "like", "coding", "in", "python", ".", "[SEP]"]
tokens2 = ["[CLS]", "python", "is", "my", "favorite", "programming", "language", ".", "[SEP]"]
# Convert tokens to input IDs
input_ids1 = torch.tensor(tokenizer.convert_tokens_to_ids(tokens1)).unsqueeze(0)  # Batch size 1
input_ids2 = torch.tensor(tokenizer.convert_tokens_to_ids(tokens2)).unsqueeze(0)  # Batch size 1
# Obtain the BERT embeddings
with torch.no_grad():
    outputs1 = model(input_ids1)
    outputs2 = model(input_ids2)
    embeddings1 = outputs1.last_hidden_state[:, 0, :]  # [CLS] token
    embeddings2 = outputs2.last_hidden_state[:, 0, :]  # [CLS] token
# Calculate similarity
similarity_score = cosine_similarity(embeddings1, embeddings2)
print("Similarity Score:", similarity_score)
Output:
Similarity Score: [[0.9558883]]
The similarity score of approximately 0.956 indicates a high degree of similarity between the two sentences. In the context of cosine similarity, a score of 1 represents identical vectors (i.e., the sentences are identical), while a score of 0 represents completely dissimilar vectors (i.e., the sentences have no similarity). However, the exact interpretation of the score can vary depending on the specific use case and the threshold set for determining similarity.
Sentence Similarity using BERT Transformer
from transformers import BertTokenizer
# Load the BERT tokenizer
tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')
# Example sentences
sentence1 = "I like coding in Python."
sentence2 = "Python is my favorite programming language."
# Tokenize the sentences
tokens1 = tokenizer.tokenize(sentence1)
tokens2 = tokenizer.tokenize(sentence2)
# Add [CLS] and [SEP] tokens
tokens = ['[CLS]'] + tokens1 + ['[SEP]'] + tokens2 + ['[SEP]']
print("Token:", tokens)
# Convert tokens to input IDs
input_ids = tokenizer.convert_tokens_to_ids(tokens)
# Display the tokens and input IDs
print("Input IDs:", input_ids)
from transformers import BertTokenizer, BertModel
import torch
from sklearn.metrics.pairwise import cosine_similarity
# Load the BERT tokenizer and model
tokenizer = BertTokenizer.from_pretrained('bert-base-uncased')
model = BertModel.from_pretrained('bert-base-uncased')
# Convert tokens to input IDs
input_ids1 = torch.tensor(tokenizer.convert_tokens_to_ids(tokens1)).unsqueeze(0)  # Batch size 1
input_ids2 = torch.tensor(tokenizer.convert_tokens_to_ids(tokens2)).unsqueeze(0)  # Batch size 1
# Obtain the BERT embeddings
with torch.no_grad():
    outputs1 = model(input_ids1)
    outputs2 = model(input_ids2)
    embeddings1 = outputs1.last_hidden_state[:, 0, :]  # [CLS] token
    embeddings2 = outputs2.last_hidden_state[:, 0, :]  # [CLS] token
# Calculate similarity
similarity_score = cosine_similarity(embeddings1, embeddings2)
print("Similarity Score:", similarity_score)
Output:
Similarity Score: [[0.38574713]]
The above example highlights the effectiveness of BERT in capturing semantic relationships between sentences and its utility in various natural language processing tasks, including text similarity analysis. Depending on the specific requirements of your application, you can adjust the threshold for similarity to suit your needs. Overall, BERT provides a powerful tool for understanding and analyzing textual data in a wide range of applications.
