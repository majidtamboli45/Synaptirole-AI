# NLP Libraries in Python

> Source: https://www.geeksforgeeks.org/nlp/nlp-libraries-in-python/

Python provides many NLP libraries that help process, analyze and understand text data efficiently. These libraries support tasks such as tokenization, sentiment analysis, named entity recognition and topic modelling.
1. Regex (Regular Expressions) Library
Regex is used for pattern matching and text processing in NLP. It helps clean text, extract useful information and perform text transformations efficiently.
- Identifies patterns in text data
- Removes unwanted characters and symbols
- Extracts information such as dates, emails and IDs
- Commonly used for data cleaning and information extraction
This code matches pattern for email id and phone number.
import re
text = """
Contact us at support@gmail.com or call 9876543210
"""
email = re.findall(r'\S+@\S+', text)
phone = re.findall(r'\d{10}', text)
print("Email:", email)
print("Phone:", phone)
Output:
2. NLTK (Natural Language Toolkit)
NLTK is a Python library used for text analysis and NLP tasks such as tokenization, stemming, lemmatization and part-of-speech tagging.
- Performs tokenization and text preprocessing
- Supports stemming and lemmatization
- Used for text classification and sentiment analysis
- Commonly applied in research and educational NLP projects
This code breaks text into small units (tokens).
import nltk
nltk.download('punkt_tab')
from nltk.tokenize import word_tokenize
text = "Natural Language Processing is interesting."
tokens = word_tokenize(text)
print(tokens)
3. spaCy
spaCy is a high-performance NLP library used for fast text processing tasks such as named entity recognition and dependency parsing.
- Performs fast and efficient text processing
- Supports named entity recognition (NER)
- Understands grammatical relationships between words
- Used in real-time NLP applications and automation
This code loads SpaCy’s English model, processes the text and identifies named entities such as organizations and locations.
import spacy
nlp = spacy.load("en_core_web_sm")
text = "Apple opened a new office in California."
doc = nlp(text)
for ent in doc.ents:
    print(ent.text, ent.label_)
Output:
Apple ORG
California GPE
4. TextBlob
TextBlob is a simple NLP library used for tasks such as sentiment analysis and language translation. It is beginner-friendly and useful for quick NLP applications.
- Performs sentiment analysis on text
- Supports language translation
- Easy to use for basic NLP tasks
- Useful for social media and customer feedback analysis
This code analyzes the sentiment of the text and returns polarity and subjectivity scores.
from textblob import TextBlob
text = TextBlob("I love learning NLP with Python.")
print(text.sentiment)
Output:
Sentiment(polarity=0.5, subjectivity=0.6)
5. Textacy
Textacy is an NLP library built on top of spaCy that provides tools for preprocessing, feature extraction and topic modeling.
- Cleans and preprocesses text data
- Supports topic modeling and text analysis
- Extracts linguistic features from text
- Useful for market research and content analysis
This code removes punctuation from the text using Textacy preprocessing functions.
import textacy.preprocessing as preprocessing
text = "Hello!!! Welcome to NLP with Textacy."
clean_text = preprocessing.remove.punctuation(text)
print(clean_text)
Output:
Hello Welcome to NLP with Textacy
6. VADER (Valence Aware Dictionary and sEntiment Reasoner)
VADER is a rule-based sentiment analysis tool designed for analyzing social media and informal text. It can understand sentiment in text containing emojis, slang and informal expressions.
- Performs sentiment analysis on text
- Handles emojis and social media language
- Detects positive, negative and neutral sentiment
- Commonly used for social media and feedback analysis
This code analyzes the sentiment of the text and returns sentiment scores for positive, negative, neutral and compound sentiment.
from vaderSentiment.vaderSentiment import SentimentIntensityAnalyzer
analyzer = SentimentIntensityAnalyzer()
text = "This movie was amazing! 😍"
scores = analyzer.polarity_scores(text)
print(scores)
Output:
{'neg': 0.0, 'neu': 0.458, 'pos': 0.542, 'compound': 0.7959}
7. Gensim
Gensim is an NLP library used for topic modeling, document similarity analysis and word embeddings. It is designed to efficiently process large text datasets.
- Performs topic modeling using techniques like LDA
- Generates word embeddings for semantic understanding
- Supports document similarity and clustering
- Useful for recommendation systems and text analysis
This code preprocesses the text and converts it into lowercase tokens using Gensim.
from gensim.utils import simple_preprocess
text = "Gensim is useful for topic modeling and NLP."
tokens = simple_preprocess(text)
print(tokens)
Output:
['gensim', 'is', 'useful', 'for', 'topic', 'modeling', 'and', 'nlp']
8. KerasNLP
KerasNLP is a deep learning NLP library built on TensorFlow and Keras that provides pre-trained models and tools for tasks such as text classification, generation, and translation.
- Provides transformer-based NLP models
- Supports text classification and text generation
- Integrates easily with TensorFlow and Keras
- Useful for modern deep learning NLP applications
This code loads a pre-trained BERT model and performs text classification on the input text.
import keras_nlp
preprocessor = keras_nlp.models.BertPreprocessor.from_preset(
    "bert_tiny_en_uncased"
)
classifier = keras_nlp.models.BertClassifier.from_preset(
    "bert_tiny_en_uncased",
    num_classes=2,
    preprocessor=preprocessor
)
prediction = classifier.predict(
    ["KerasNLP makes NLP easy"]
)
print(prediction)
Output:
9. Stanza
Stanza is an NLP library developed by Stanford that provides pre-trained models for tasks such as tokenization, named entity recognition and dependency parsing. It is built on PyTorch for efficient and scalable NLP processing.
- Performs tokenization and dependency parsing
- Provides pre-trained NLP models
- Analyzes sentence structure and word relationships
- Used in legal text analysis and syntactic analysis
This code loads Stanza’s English model, processes the text and displays each word with its part-of-speech tag.
import stanza
stanza.download('en')
nlp = stanza.Pipeline('en')
doc = nlp("Natural Language Processing is powerful.")
for sentence in doc.sentences:
    for word in sentence.words:
        print(word.text, word.upos)
Output:
10. PyTorch-NLP
PyTorch-NLP is an NLP library built on PyTorch that provides utilities and preprocessing tools for deep learning-based NLP applications.
- Supports text preprocessing and tokenization
- Provides datasets and NLP utility functions
- Integrates easily with PyTorch models
- Useful for deep learning NLP projects
This code tokenizes and converts the text into numerical token IDs using PyTorch-NLP.
from torchnlp.encoders.text import WhitespaceEncoder
texts = ["PyTorch NLP is powerful"]
encoder = WhitespaceEncoder(texts)
encoded = encoder.encode(texts[0])
print(encoded)
Output:
tensor([5, 6, 7, 8])
11. PyNLPl
PyNLPl is an NLP library used for tasks such as corpus processing, syntactic parsing, and linguistic analysis. It is useful for multilingual NLP and research based text processing.
- Supports corpus processing and text analysis
- Performs syntactic and linguistic analysis
- Useful for multilingual NLP projects
- Applied in linguistic and language research
This code tokenizes the sentence into individual words using PyNLPl.
from pynlpl.textprocessors import tokenize
text = "Natural Language Processing is interesting."
tokens = list(tokenize(text))
print(tokens)
Output:
['Natural', 'Language', 'Processing', 'is', 'interesting', '.']
12. Hugging Face Transformer
Hugging Face Transformers is an NLP library that provides transformer-based models such as BERT and GPT for advanced NLP tasks like text classification, generation and question answering.
- Provides pre-trained transformer models
- Supports fine-tuning on custom datasets
- Used for text generation and classification
- Commonly applied in AI assistants and chatbots
This code uses a pre-trained transformer model to generate text based on the given input prompt.
from transformers import pipeline
generator = pipeline("text-generation")
result = generator(
    "Artificial Intelligence is",
    max_length=20
)
print(result)
Output:
13. Flair
Flair is a deep learning NLP library used for tasks such as named entity recognition and text classification. It provides high accuracy using modern language embedding techniques.
- Performs named entity recognition (NER)
- Supports text classification tasks
- Uses deep learning for accurate NLP processing
- Useful for document and news categorization
This code loads Flair’s NER model and identifies named entities in the sentence.
from flair.data import Sentence
from flair.models import SequenceTagger
tagger = SequenceTagger.load("ner")
sentence = Sentence("Apple is opening a new office in London.")
tagger.predict(sentence)
print(sentence.get_spans('ner'))
Output:
14. FastText
FastText is an NLP library developed by Facebook AI for fast text classification and word embedding generation. It is designed to efficiently handle large text datasets.
- Performs fast text classification
- Generates word embeddings for semantic analysis
- Efficient for large-scale NLP tasks
- Used in spam detection and real-time text analysis
This code trains a simple FastText model and displays the word embedding vector for the word “NLP”.
from gensim.models import FastText
sentences = [
    ["I", "love", "NLP"],
    ["FastText", "is", "efficient"]
]
model = FastText(
    sentences,
    vector_size=10,
    min_count=1
)
print(model.wv['NLP'])
Output:
15. Polyglot
Polyglot is a multilingual NLP library that supports more than 130 languages for tasks such as language detection, tokenization, and sentiment analysis.
- Supports multilingual NLP processing
- Detects languages automatically
- Performs tokenization and sentiment analysis
- Useful for global text and customer support analysis
This code detects the language of the given text using Polyglot.
from polyglot.detect import Detector
text = "Bonjour tout le monde"
detector = Detector(text)
print(detector.language)
Output:
Download full code form here
