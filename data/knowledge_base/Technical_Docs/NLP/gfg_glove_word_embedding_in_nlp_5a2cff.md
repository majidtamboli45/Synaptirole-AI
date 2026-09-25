# Glove Word Embedding in NLP

> Source: https://www.geeksforgeeks.org/nlp/pre-trained-word-embedding-using-glove-in-nlp-models/

GloVe (Global Vectors for Word Representation) is an unsupervised learning algorithm that generates dense word embeddings by analyzing co-occurrence patterns in a large text corpus, capturing semantic relationships between words.
- Uses a word co-occurrence matrix to learn relationships between words
- Combines global statistical information (LSA) with local context-based learning (like Word2Vec)
- Optimizes embeddings so the dot product approximates Pointwise Mutual Information (PMI)
- Captures both semantic and syntactic relationships
Glove Data
GloVe provides pre-trained dense vectors learned from large corpora (e.g., 6 billion tokens), with embeddings available for a large vocabulary of unique words. These embeddings represent words as numerical vectors that capture semantic relationships.
- Contains vectors for a large vocabulary, including words and common symbols
- Can be directly downloaded and used in NLP applications
- Available in different dimensions such as 50d, 100d, 200d and 300d
Working of GloVe
The GloVe algorithm works using the following process
1. Preprocess the Text
First, we split the text into individual words (tokenization) so that we can work with them.
Example:
Input text: "The peon is ringing the bell"
Tokenized words: ['The', 'peon', 'is', 'ringing', 'the', 'bell']
2. Creating the Vocabulary
After tokenization, we create a list of all unique words in the text and then count how often each word appears.
Example:
Vocabulary with word frequencies:
{'The': 2, 'peon': 1, 'is': 1, 'ringing': 1, 'the': 1, 'bell': 1}
After this, the words are typically sorted by frequency.
3. Building a Co-occurrence Matrix
Now, we build a co-occurrence matrix where we count how often each word appears near other words in a given context (usually within a window of fixed size around the word).
Example: Let's say we choose a window size of 2 (2 words before and after each word). The co-occurrence matrix might look something like this
|  | The | peon | is | ringing | the | bell | 
|---|---|---|---|---|---|---|
| The | 0 | 1 | 1 | 0 | 0 | 0 | 
| peon | 1 | 0 | 1 | 1 | 0 | 0 | 
| is | 1 | 1 | 0 | 1 | 1 | 0 | 
| ringing | 0 | 1 | 1 | 0 | 1 | 1 | 
| the | 0 | 0 | 1 | 1 | 0 | 1 | 
| bell | 0 | 0 | 0 | 1 | 1 | 0 | 
In this matrix, the value at (i, j) represents how often word i and word j appear together in the context window.
4. Performing Dot Product
The aim is to learn word vectors such that the dot product of two word vectors reflects how often the words co-occur in the context. This ensures that words that appear in similar contexts will have similar vector representations.
Example:
"The" and "is" are frequently seen together, so their vectors will be close in the embedding space.
"peon" and "bell" don't co-occur much, so their vectors will be far apart.
5. Training the Word Vectors
The model learns word embeddings by adjusting vectors based on how often words appear together. It aims to capture meaningful relationships between words using co-occurrence information.
- Optimizes word vectors by minimizing the difference between predicted and actual co-occurrence relationships
- Uses measures like Pointwise Mutual Information (PMI) to represent word associations
- Adjusts vectors so that words with similar contexts have similar representations
Example:
"The" and "is" will have vector adjustments that make their dot product similar to their co-occurrence probability, ensuring their vectors are close to each other.
"peon" and "bell" will be adjusted to have distant vectors since their co-occurrence is low.
6. Embedding Matrix
After training, the model outputs an embedding matrix where each word is represented by a dense vector. These vectors are able to capture the semantic and syntactic relationships between words.
Example: The resulting word vectors in the embedding matrix might look like this:
| Word | Vector | 
|---|---|
| The | [0.3, 0.1, 0.5] | 
| peon | [0.2, 0.4, 0.3] | 
| is | [0.6, 0.3, 0.4] | 
| ringing | [0.1, 0.8, 0.7] | 
| the | [0.3, 0.1, 0.5] | 
| bell | [0.2, 0.3, 0.1] | 
Implementation
Here we will see step by step implementation
1. Importing Libraries
We will be importing necessary libraries to handle text processing and numerical operations.
- Tokenizer and pad_sequences from tensorflow.keras.preprocessing.text help us tokenize the text and manage sequences of tokens, respectively.
- numpy is used for handling numerical operations, especially creating and manipulating arrays like the embedding matrix.
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
import numpy as np
2. Creating Vocabulary
We will be defining a list of words (texts) that we want to use for building a vocabulary. These words represent our small sample text corpus that the tokenizer will later process.
texts = ['text', 'the', 'leader', 'prime', 'natural', 'language']
3. Initializing and Fitting the Tokenizer
We will be initializing the Tokenizer object and fitting it on the texts corpus to create a dictionary of words and their corresponding integer indices. The tokenizer will break the words into unique tokens and assign each token an integer ID.
- The fit_on_texts function processes the provided corpus and generates the word-to-index mapping.
- tokenizer.word_index gives the dictionary that maps each word to its corresponding index.
tokenizer = Tokenizer()
tokenizer.fit_on_texts(texts)
print("Number of unique words in dictionary =", len(tokenizer.word_index))
print("Dictionary is =", tokenizer.word_index)
Output:
Number of unique words in dictionary = 6
Dictionary is = {'text': 1, 'the': 2, 'leader': 3, 'prime': 4, 'natural': 5, 'language': 6}
4. Defining a Function to Create Embedding Matrix
We will be defining the function embedding_for_vocab that loads pre-trained GloVe word vectors and creates an embedding matrix for the vocabulary.
- filepath: Path to the GloVe file.
- word_index: The dictionary created by the tokenizer, mapping words to indices.
- embedding_dim: The dimensionality of the word vectors (e.g., 50-dimensional vectors).
Inside the function:
- We initialize a matrix of zeros with shape (vocab_size, embedding_dim) where vocab_size is the number of words plus one (to account for the padding token).
- We read the GloVe file line by line and match the word to the tokenizer's word index, copying the corresponding word vector to the embedding matrix.
def embedding_for_vocab(filepath, word_index, embedding_dim):
    vocab_size = len(word_index) + 1  
    embedding_matrix_vocab = np.zeros((vocab_size, embedding_dim))
    with open(filepath, encoding="utf8") as f:
        for line in f:
            word, *vector = line.split()
            if word in word_index:
                idx = word_index[word]
                embedding_matrix_vocab[idx] = np.array(vector, dtype=np.float32)[:embedding_dim]
    return embedding_matrix_vocab
5. Downloading GloVe File
We will be downloading the GloVe dataset from Stanford's NLP repository. This dataset contains pre-trained word embeddings and we will be specifically using the 50-dimensional embeddings (glove.6B.50d.txt).
- !wget is used to download the file.
- !unzip is used to extract the zipped GloVe file.
!wget https://downloads.cs.stanford.edu/nlp/data/glove.6B.zip
!unzip -q glove.6B.zip
Output:
6. Loading GloVe Embeddings and Creating a Matrix
We will be specifying the embedding dimension (50 in this case, matching the GloVe file) and providing the path to the GloVe file. We then call the previously defined function embedding_for_vocab to load the GloVe embeddings and generate the embedding matrix for our vocabulary.
embedding_dim = 50 
glove_path = './glove.6B.50d.txt'
embedding_matrix_vocab = embedding_for_vocab(glove_path, tokenizer.word_index, embedding_dim)
7. Accessing Embedding Vector for a Word
We will be accessing the embedding vector for a specific word in the tokenizer’s index. In this case, we're accessing the vector for the word with index 1, which corresponds to the word "text" in the vocabulary.
first_word_index = 1  
print("Dense vector for word with index 1 =>", embedding_matrix_vocab[first_word_index])
Output:
Applications
- Text Classification: Used for tasks like sentiment analysis, topic classification and spam detection.
- Named Entity Recognition (NER): Enhances entity identification by capturing word relationships.
- Machine Translation: Improves translation quality by representing words in source and target languages.
- Question Answering: Helps models understand word context for more accurate answers.
- Document Similarity and Clustering: Measures semantic similarity for document retrieval and organization.
- Word Analogy: Helps solve tasks like "king - man + woman = queen" by recognizing word relationships.
- Semantic Search: Improves search by retrieving content based on semantic relevance to a query.
