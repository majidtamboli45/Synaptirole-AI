# Tokenization vs Embeddings

> Source: https://www.geeksforgeeks.org/nlp/tokenization-vs-embeddings/

Tokenization and Embeddings are two most fundamental and important concepts in Natural Language processing. Tokenization is a method used to split a huge corpus of data into small segments or tokens. These segments can be of different forms depending on the type of Tokenization technique. Embedding, on the other hand, is an approach of representing textual data in the form of a one-dimensional array of numbers. Here, each number represents a value corresponding to an attribute or feature.
Tokenization
Tokenization is an essential process in Natural Language Processing (NLP) that involves breaking down a larger stream of text into smaller textual units, called tokens, which can be in various forms. These tokens can range from individual characters to full words or phrases, depending on the level of decomposition required. Tokenization is performed to enhance the model interpretability and ease in processing.
Features of Tokenization
- Breaks large textual data into significantly smaller chunks
- Tokens can be of various forms: Sentences, Words, Sub-words, or Characters
- Can facilitate various NLP tasks like Summarization, Translation, etc.
- Enhances Model Interpretability
- Eases the processing by machines
Working of Tokenization
The process of Tokenization uses pre-defined Tokenizers from Libraries like NLTK and Hugging Face.
To explore the dependency libraries, you can refer to the NLTK Library, Tokenization using NLTK
1. Installation of all Dependencies and Libraries
!pip install nltk
import nltk
from nltk.tokenize import word_tokenize
nltk.download('punkt')
nltk.download('punkt_tab')
2. Implementation of Tokenization
- The corpus of textual data is stored in a list
- Tokenize each sentence using "word_tokenize()"
- Display the generated token sequence
corpus = ["Machine learning models require large datasets.","Artificial intelligence is changing the world.",
    "Neural networks are inspired by the human brain.","Deep learning is a subset of machine learning.",
    "Data preprocessing is essential for better accuracy."]
print("Corpus: ")
print(corpus)
tokenized_corpus = [word_tokenize(sentence) for sentence in corpus]
print("Generated Tokens: ")
for i, tokens in enumerate(tokenized_corpus):
    print(f"Sentence {i+1} tokens:", tokens)
Output
Corpus: 
['Machine learning models require large datasets.', 'Artificial intelligence is changing the world.', 'Neural networks are inspired by the human brain.', 'Deep learning is a subset of machine learning.', 'Data preprocessing is essential for better accuracy.']
Generated Tokens:  
Sentence 1 tokens: ['Machine', 'learning', 'models', 'require', 'large', 'datasets', '.'] 
Sentence 2 tokens: ['Artificial', 'intelligence', 'is', 'changing', 'the', 'world', '.'] 
Sentence 3 tokens: ['Neural', 'networks', 'are', 'inspired', 'by', 'the', 'human', 'brain', '.'] 
Sentence 4 tokens: ['Deep', 'learning', 'is', 'a', 'subset', 'of', 'machine', 'learning', '.'] 
Sentence 5 tokens: ['Data', 'preprocessing', 'is', 'essential', 'for', 'better', 'accuracy', '.']
Alternate implementation techniques are:
- Natural Language Toolkit (Used in implementation above)
- SpaCy library
- BERT Tokenizer
- Sentence Piece
Types of Tokenization
- Word Tokenization: Text is divided into individual words.
- Character Tokenization: The textual data is split and converted to a sequence of individual characters.
- Sub-word Tokenization: This strikes a balance between word and character tokenization by breaking down text into units that are larger than a single character but smaller than a full word.
- Sentence Tokenization: Makes a division of paragraphs or large set of sentences into separated sentences as tokens.
- N-gram Tokenization: It splits words into fixed-sized chunks (size = n) of data.
Techniques used in Tokenization
- Whitespace Tokenization: This method splits text based on the position of spaces. It doesn't handle some different cases like compound words.
- Statistical Tokenization: This method of tokenization uses statistical properties in text. These include frequency count of words and probability of co-occurrence.
- Transformer-based Tokenization: This method combines sub-words by pre-training vocabulary and also maintain consistency.
- Rule-based Tokenization: This approach uses manually defined if-else conditions or rules that are used to handle or tokenize regular expressions, punctuations, etc.
- Byte-Pair Encoding: This is a sub-word tokenization algorithm. It iteratively merges most frequent pairs of bytes or characters.
Applications of Tokenization
Some applications of Tokenization are listed below:
- Text Summarization: Used in Information Retrieval
- Text Pre-processing
- Chatbots, Virtual Assistants: Used in speech recognition and Machine Translation
- Text-to-Speech and Speech Recognition
- Named Entity Recognition (NER)
To read in more detail, you can refer to Tokenization Tutorial.
Embedding
Word Embedding is an approach for representing words and documents in the form of a numerical array. These can also be represented as a Word Vector, which is a numeric vector input that represents a word in a lower-dimensional space and can be plotted to visualize the representation. It allows words with similar meanings to have a similar representation. The metrics of similarity used in usually Cosine Similarity.
Features of Word Embedding
- Approach used to extract features from textual data. Almost all modern NLP applications start with an embedding layer
- To represent or visualize any underlying patterns of usage in the corpus
- Inter-word semantics must be captured, extracts inference from the data and preserves syntactical and semantic information
- Aims to reduce dimensionality
- Faster to train than hand build models
Working of Word Embeddings
The process of Embedding uses pre-defined Sentence Transformers, and Scikit learn.
To explore the dependency libraries, you can refer to Sentence Transformers, Sci-kit Learn, Matplotlib, Numpy.
1. Installation of all Dependencies and Libraries
!pip install sentence-transformers matplotlib scikit-learn
import matplotlib.pyplot as plt
import numpy as np
from sentence_transformers import SentenceTransformer
from sklearn.decomposition import PCA
from sklearn.metrics.pairwise import cosine_similarity
2. Implementation of Word Embedding
- The corpus of textual data is stored in a list
- Convert each sentence to an array of numerical representation using "SentenceTransformer('all-MiniLM-L6-v2')"
- Display the generated embedding sequence or Word embedding
corpus = ["Machine learning models require large datasets.","Artificial intelligence is changing the world.",
    "Neural networks are inspired by the human brain.","Deep learning is a subset of machine learning.",
    "Data preprocessing is essential for better accuracy."]
print("Corpus: ")
print(corpus)
# Load Sentence-BERT model
model = SentenceTransformer('all-MiniLM-L6-v2')
# Encode sentences into embeddings
embeddings = model.encode(sentences)
print("Embeddings: ")
print(embeddings)
Output
Corpus: 
['Machine learning models require large datasets.', 'Artificial intelligence is changing the world.', 'Neural networks are inspired by the human brain.', 'Deep learning is a subset of machine learning.', 'Data preprocessing is essential for better accuracy.']
Embeddings:  
[[ 0.01991189 -0.05265199  0.04994532 ... -0.02205039 -0.0563393   -0.01477837]  
[ 0.03757552 -0.02693725  0.09156093 ... -0.03287758  0.04237107   -0.04281164]  
[-0.05265831 -0.08134971  0.05750858 ...  0.15181488  0.04654248   -0.05522054]  
[-0.06655442 -0.06664531  0.06687525 ...  0.07452302  0.05554256    0.00640426]  
[-0.02107987  0.05222534 -0.00642961 ... -0.00984242 -0.01077415   -0.02677191]]
Approaches for Text Representation
- Traditional Approach: One-Hot Encoding, Bag of Words (BOW), Term frequency-inverse document frequency (TF-IDF), CountVectorizer
- Neural Approach: Word2Vec, Continuous Bag of Words(CBOW), Skip-Gram
- Pre-trained Word-Embedding: GloVe, FastText, BERT (Bidirectional Encoder Representations from Transformers)
Applications of Embeddings
Some applications of word embeddings are listed below:
- Text Summarization: Used in detecting and correcting semantics
- Information Retrieval: Search Engine and Document ranking on semantic closeness
- Text Similarity & Semantic Search: Similarity in words can be visualized and assessed
- Question Answering Chatbots, Virtual Assistants: Used in Dialogue Context, Machine Translation
- Named Entity Recognition (NER)
To read in more detail, you can refer to Word Embeddings Tutorial.
Tokenization vs Embeddings
Tokenization and Embeddings are two essential steps involved in Natural Language processing. Some of their Key Differences are:
| Tokenization | Embeddings | 
| Process of splitting text into smaller units (tokens) | Converting tokens into numerical vector representations | 
| Raw text (sentences, paragraphs) as Input | Tokenized text (list of tokens) as Input | 
| List of strings (e.g., ["AI", "is", "best"] ) as Output | Numerical array (e.g., [0.23, -0.44, 0.99, ...] ) as Output | 
| Not context-aware just splits text | Can be context-free or contextual | 
| Structural | Semantic | 
| Token-level (word, sub-word, char, sentence) | Vector-level (per token or sentence depending on model) | 
| Mandatory step in every NLP task | Optional for simple tasks; Mandatory for ML/DL NLP tasks |
