# Words Representations in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/bag-of-words-representations-in-tensorflow/

Bag-of-Words (BoW) converts text into numerical vectors based on word occurrences, ignoring grammar and word order. The model represents text as a collection (bag) of words, where each word's frequency or presence is recorded. It follows these steps:
- Tokenization – Splitting text into words.
- Vocabulary Creation – Listing all unique words from the dataset.
- Vectorization – Converting text into a numerical vector where each dimension represents a word's occurrence.
For example, consider two sentences:
- "The cat sat on the mat."
- "The dog lay on the rug."
The vocabulary: ["the", "cat", "sat", "on", "mat", "dog", "lay", "rug"]
Their BoW representation:
Sentence 1: [1, 1, 1, 1, 1, 0, 0, 0]
Sentence 2: [1, 0, 0, 1, 0, 1, 1, 1]
Bag-of-Words method is widely used in text classification, sentiment analysis, and information retrieval.
Implementing Bag-of-Words in TensorFlow
We will implement BoW using TensorFlow's tf.keras.layers.TextVectorization layer.
1. Install Dependencies
Ensure you have TensorFlow installed:
pip install tensorflow
2. Import Libraries
import tensorflow as tf
import numpy as np
3. Define Sample Text Data
text_data = [
    "The cat sat on the mat.",
    "The dog lay on the rug."
]
4. Create and Configure the TextVectorization Layer
# Set parameters
max_tokens = 10  
output_mode = "count" 
# Create the vectorization layer
vectorizer = tf.keras.layers.TextVectorization(max_tokens=max_tokens, output_mode=output_mode)
# Adapt the vectorizer to the dataset
vectorizer.adapt(text_data)
5. Convert Text into BoW Representation
bow_representation = vectorizer(text_data)
# Display results
print("Vocabulary:", vectorizer.get_vocabulary())
print("Bag-of-Words Representation:\n", bow_representation.numpy())
Output:
Vocabulary: ['[UNK]', 'the', 'on', 'sat', 'rug', 'mat', 'lay', 'dog', 'cat']
Bag-of-Words Representation:
 [[0 2 1 1 0 1 0 0 1]
 [0 2 1 0 1 0 1 1 0]]
The vectorizer.get_vocabulary() method returns the learned vocabulary, and bow_representation.numpy() provides the BoW vectors for the input sentences.
- 2 represents the count of "the".
- Other values indicate word frequencies in the respective sentence.
Applications of BoW
- Text Classification – Used in spam detection, sentiment analysis.
- Information Retrieval – Search engines match queries with documents using BoW.
- Topic Modeling – Helps in clustering similar documents.
Limitations of Bag-of-Words
- Ignores Word Order – Cannot differentiate between "dog bites man" and "man bites dog."
- Sparse Representation – Large vocabularies lead to high-dimensional vectors.
- Lack of Semantic Understanding – Words with similar meanings are treated differently.
Alternatives: TF-IDF, Word Embeddings (Word2Vec, GloVe), Transformer-based models (BERT).
Bag-of-Words is a simple yet effective method for text representation. With TensorFlow’s TextVectorization layer, implementing BoW is efficient and scalable. However, for complex NLP tasks, embeddings and deep learning-based representations are often preferred.
