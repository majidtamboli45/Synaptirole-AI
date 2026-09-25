# TensorFlow for NLU and Text Processing

> Source: https://www.geeksforgeeks.org/deep-learning/tensorflow-for-nlu-and-text-processing/

Natural Language Understanding (NLU) focuses on the interaction between computers and humans through natural language. The main goal of NLU is to enable computers to understand, interpret, and generate human languages in a valuable way. It is crucial for processing and analyzing large amounts of unstructured data, enabling machines to understand and interpret human language.
The adoption of deep learning for NLU tasks has significantly improved the performance of language models, allowing for more complex and nuanced understanding. Recent advances in machine learning, particularly deep learning, have significantly improved the capabilities of NLP systems. Deep learning's impact on NLP is evident in its ability to handle complex tasks with greater accuracy and efficiency, making it a cornerstone of modern NLP applications.
Natural Language Understanding
Natural Language Understanding (NLU) focuses on enabling computers to comprehend and interpret human language in a manner similar to how humans do. It encompasses a set of techniques and algorithms designed to analyze and derive meaning from natural language data. NLU plays a crucial role in bridging the gap between human communication and machine intelligence, allowing computers to interact with humans in a more intuitive and human-like manner.
Natural Language Understanding Tasks
NLU encompasses a diverse set of tasks and techniques designed to process and analyze natural language data. These tasks can be broadly categorized into several key areas, each serving different purposes and addressing specific challenges in language understanding and generation.
Some of the fundamental NLU tasks include:
- Speech Recognition: Converts spoken language into text.
- Part of Speech Tagging: Identifies the grammatical parts of speech in text.
- Word Sense Disambiguation: Determines the meaning of words based on context.
- Sentiment Analysis: Assesses the sentiment behind text or speech.
- Machine Translation: Translates text or speech from one language to another.
- Text Summarization: Creates concise summaries of large text volumes.
NLP comprises various tasks, each serving a specific purpose in the realm of text and speech processing. These tasks include tokenization, word-sense disambiguation, named entity recognition, part of speech tagging, language generation.
Text Processing Techniques
1. Tokenization
Tokenization breaks down a piece of text into smaller units called tokens. These tokens can be words, subwords, or characters, depending on the level of granularity required for the NLP task.
Tokenization serves as the initial step in text preprocessing, enabling computers to process and analyze natural language data. By breaking text into tokens, NLP models can better understand the structure and meaning of the text.
Example: "The quick brown fox jumps over the lazy dog."
Tokenized form: ["The", "quick", "brown", "fox", "jumps", "over", "the", "lazy", "dog", "."]
Word-Sense Disambiguation
Word Sense Disambiguation is the task of determining the correct meaning or sense of a word based on its context within a sentence.
Many words in natural language have multiple meanings depending on the context in which they are used. WSD aims to resolve such ambiguities to improve the accuracy of NLP tasks such as machine translation, information retrieval, and question answering
Example: Determining that "bass" refers to a type of fish in "He caught a bass" and to low-frequency sounds in "The bass shook the room."
Named Entity Recognition (NER)
Named Entity Recognition is the task of identifying and classifying named entities within text into predefined categories such as persons, organizations, locations, dates, and more.
NER plays a crucial role in information extraction from unstructured text data. By identifying named entities, NER systems can extract structured information and facilitate downstream NLP tasks such as information retrieval, sentiment analysis, and question answering.
Example: In the sentence "Google was founded by Larry Page and Sergey Brin," NER identifies "Google" as an organization, "Larry Page" and "Sergey Brin" as persons.
Part-of-Speech (PoS) Tagging:
Part-of-Speech Tagging, also known as POS Tagging, is the task of assigning grammatical labels (e.g., noun, verb, adjective) to individual words in a sentence.
POS tagging helps in syntactic analysis and understanding the grammatical structure of sentences. It is essential for tasks such as text processing, machine translation, and grammar checking.
Example: In the sentence "Book the flight," PoS tagging would label "Book" as a verb, "the" as a determiner, and "flight" as a noun.
The importance of these tasks extends to domains such as information retrieval, where they help in organizing and locating information, and knowledge representation, where they enable the structuring of information in a way that machines can use to reason.
TensorFlow for Natural Language Understanding and Text Processing
TensorFlow, an open-source machine learning framework, offers a range of tools and libraries for building NLP models. It supports the entire workflow from training to deployment, making it a popular choice for developers working on NLP tasks.
TensorFlow offers robust capabilities for natural language understanding (NLU) and text processing through two main libraries:
- KerasNLP: This is a high-level NLP library that includes modern transformer-based models and lower-level tokenization utilities. It's designed for ease of use and is the recommended solution for most NLP use cases.
- TensorFlow Text: This library provides operations and tools for preprocessing text, such as tokenization, pattern matching, and n-gram creation. It's useful for sequence modeling and can be used directly for lower-level text processing operations.
Implementation
Now we will implement example of TensorFlow code for a Natural Language Processing (NLP) task. This code snippet demonstrates text tokenization, which is the process of breaking down text into individual words or tokens.
Remember to install TensorFlow in your environment before running this code. You can do this using pip:
pip install tensorflow
The code is using TensorFlow's Keras API for tokenizing text.
- First import TensorFlow and specifically the Tokenizer class from Keras, which is used for text preprocessing.
- Then we define a list of sentences that we want to tokenize.
- We create an instance of the Tokenizer, setting the num_words to 100, which means it will only take into account the top 100 words. The oov_token is set to "<OOV>", which stands for "out of vocabulary". This token will be used for words that are not in the top 100 words when converting texts to sequences.
- tokenizer.fit_on_texts(sentences) updates the internal vocabulary based on the list of sentences. The tokenizer creates a dictionary of word-to-index pairs, where each unique word is assigned a unique integer.
- After fitting the tokenizer, we can access the word index which contains the word-to-index dictionary.
- Finally, the script prints out the word_index and the sequences. The word_index shows us the dictionary mapping each word to an integer, and sequences shows the tokenized version of our input sentences.
import tensorflow as tf
from tensorflow.keras.preprocessing.text import Tokenizer
# Sample text
sentences = [
    'Hello, how are you?',
    'I am learning Natural Language Processing.',
    'It involves tasks such as tokenization.'
]
# Initialize the tokenizer
tokenizer = Tokenizer(num_words=100, oov_token="<OOV>")
# Fit the tokenizer on the sentences
tokenizer.fit_on_texts(sentences)
# Get the word index
word_index = tokenizer.word_index
# Tokenize the sentences
sequences = tokenizer.texts_to_sequences(sentences)
print(word_index)
print(sequences)
Output:
{'<OOV>': 1, 'hello': 2, 'how': 3, 'are': 4, 'you': 5, 'i': 6, 'am': 7, 'learning': 8, 'natural': 9, 'language': 10, 'processing': 11, 'it': 12, 'involves': 13, 'tasks': 14, 'such': 15, 'as': 16, 'tokenization': 17}
[[2, 3, 4, 5], [6, 7, 8, 9, 10, 11], [12, 13, 14, 15, 16, 17]]
The output is the dictionary of word indices and the tokenized sequences of the sentences. The num_words parameter defines the maximum number of words to keep, based on word frequency. The oov_token ("<OOV>") is used for out-of-vocabulary words during text_to_sequence calls.
