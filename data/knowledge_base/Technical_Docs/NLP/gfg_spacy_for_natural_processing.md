# spaCy for Natural Language Processing

> Source: https://www.geeksforgeeks.org/nlp/spacy-for-natural-language-processing/

spaCy is a Python library used to process and analyze text efficiently for natural language processing tasks. It provides ready-to-use models and tools for working with linguistic data.
- Supports tokenization, POS tagging and dependency parsing
- Designed for speed and production use
- Works well with large text datasets
- Commonly used in NLP pipelines
Unlike traditional NLP libraries such as NLTK, which are often used for learning and experimentation, spaCy is built with a modern architecture optimized for large-scale text processing and industrial use cases.
Core Concepts and Data Structures
spaCy processes text using a central Language object and when raw text is passed to this object, it returns a Doc object that stores all linguistic annotations.
Key Container Objects:
- Doc: Stores the processed text and all linguistic annotations
- Token: Represents an individual word, punctuation mark or symbol
- Span: A slice or segment of a Doc object
- Vocab: Stores lexical attributes and word vectors
- Language: Manages the NLP pipeline and processes text
Tokenization in spaCy
Tokenization is the process of breaking raw text into meaningful units such as words, punctuation and symbols. spaCy uses rule-based tokenization combined with statistical models to handle linguistic edge cases efficiently.
spaCy’s Processing Pipeline
spaCy follows a modular pipeline architecture, where text passes through a sequence of processing components. Each component adds annotations to the same Doc object.
- Tokenizer: Splits text into tokens like words, punctuation, etc.
- Tagger: Assigns part-of-speech (POS) tags.
- Parser: Performs dependency parsing to analyze grammatical relationships.
- NER (Entity Recognizer): Identifies and labels named entities like persons, organizations, locations, etc.
- Lemmatizer: Assigns base forms to words.
- Text Categorizer: Assigns categories or labels to documents. Each component modifies the Doc object in place, passing it along the pipeline for further processing.
NLP Tasks using spaCy
spaCy provides out-of-the-box support for a wide range of NLP tasks:
- Tokenization: Breaking text into individual words, punctuation and symbols.
- Part-of-Speech Tagging: Identifying grammatical roles of words.
- Dependency Parsing: Analyzing syntactic relationships between words.
- Named Entity Recognition (NER): Extracting entities such as names, organizations and locations.
- Lemmatization: Reducing words to their base forms.
- Text Classification: Assigning documents to predefined categories (e.g., spam detection, sentiment analysis).
- Entity Linking: Connecting recognized entities to knowledge bases like Wikipedia.
- Rule-based Matching: Finding token sequences based on patterns, similar to regular expressions.
- Similarity: Comparing words, phrases or documents for semantic similarity.
Step By Step Installation of spaCy
Step 1: Upgrade Package Management Tools
This ensures you have the latest package management tools
!pip install --upgrade pip setuptools wheel
Step 2: Install or Upgrade spaCy
Install the latest version of spaCy using pip. This command also upgrades spaCy if it's already installed.
!pip install --upgrade spacy
Output:
Step 3: Download a Language Model
spaCy requires a language model for processing text. For English, the most common models are:
- en_core_web_sm: Small, fast, suitable for most tasks
- en_core_web_md: Medium, more accurate, includes word vectors
- en_core_web_lg: Large, most accurate, larger size
The small model is usually sufficient for most tasks and is fastest to download: Replace en_core_web_sm with en_core_web_md or en_core_web_lg if you need a larger model.
!python -m spacy download en_core_web_sm
Output:
Using spaCy for Basic NLP Tasks
Here’s a simple example demonstrating spaCy’s core capabilities. Steps to perform NLP task using spacy are:
- Import spaCy and load the language model
- Process input text
- Perform tokenization and POS tagging
- Extract linguistic information
import spacy
# Load the downloaded language model
nlp = spacy.load("en_core_web_sm")
# Define example text
text = "SpaCy is a powerful library for Natural Language Processing."
# Process the example text
doc = nlp(text)
# Iterate through the processed document and print text and part-of-speech tags
print("Token\t\tPOS Tag")
print("-----------------------")
for token in doc:
    print(f"{token.text}\t\t{token.pos_}")
Output
You can download full code from here
Applications
- Information Extraction: Used to extract structured information such as names, dates and organizations from unstructured text data.
- Document Classification: Helps in classifying documents into categories like spam or non-spam and identifying sentiment in text.
- Question Answering Systems: Assists in understanding user queries and extracting relevant answers from large text corpora.
- Text Summarization: Supports preprocessing and linguistic analysis required for generating concise summaries of documents.
- Entity Linking and Knowledge Graphs: Enables linking recognized entities to knowledge bases for building and enriching knowledge graphs.
- Machine Translation Preprocessing: Used to clean, tokenize and linguistically analyze text before feeding it into translation models.
Advantage
- Speed and Efficiency: It is built for high performance. Its core components are written in Cython, allowing fast text processing while maintaining Python simplicity. It can efficiently handle large volumes of data.
- High Accuracy: It offers reliable pre-trained models for tasks like dependency parsing and Named Entity Recognition (NER), delivering accuracy close to modern research standards.
- Production-Ready Design: Designed for real-world use, spaCy provides stable APIs, optimized memory usage and easy integration with machine learning frameworks and web applications.
- Extensibility: It allows users to customize pipelines by adding or modifying components to suit specific NLP tasks.
- Rich Ecosystem: It is supported by a strong ecosystem, including tools like spaCy Transformers, Prodigy and integrations with Hugging Face models.
