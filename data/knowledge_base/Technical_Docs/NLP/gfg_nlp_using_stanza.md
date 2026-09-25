# NLP using Stanza

> Source: https://www.geeksforgeeks.org/nlp/nlp-using-stanza/

Stanza is a easy to use Python library developed by the Stanford NLP Group for performing Natural Language Processing (NLP) tasks like tokenization, part of speech tagging, named entity recognition and dependency parsing. Built on deep learning and supporting over 70 languages Stanza makes it simple to analyze and understand text in multiple languages with high accuracy. Whether you're working on chatbots, text analysis or research projects Stanza provides a flexible and reliable tool for turning raw text into structured linguistic information.
Key Features
- Multilingual Support: Stanza supports NLP tasks in over 70 languages, making it one of the most comprehensive multilingual NLP libraries. This is especially useful for global applications like translation, multilingual chatbots or text analysis.
- Deep Learning Models: It uses state of the art neural network models built on PyTorch. These models are trained on large datasets giving Stanza high accuracy across various languages and tasks.
- Modular Pipeline: Stanza allows you to build a custom processing pipeline by specifying tasks like tokenization, POS tagging or NER. This flexibility makes it easy to use only the components you need for your project.
- Easy to Use: With a clean Python API, Stanza is very beginner friendly. You can download models and run complex NLP tasks with just a few lines of code.
Implementation
Step 1: Install Necessary Libraries
This code installs the stanza library quietly without extra output and imports both stanza for NLP tasks and pandas for data handling.
!pip install stanza --quiet
import stanza
import pandas as pd
Step 2: Download English NLP Model
This code downloads the English language model for Stanza, enabling it to process English text for tasks like tokenization, POS tagging and named entity recognition.
stanza.download('en')
Step 3: Load Stanza Pipeline
This code creates a Stanza NLP pipeline for English that includes tokenization, part of speech tagging, lemmatization and named entity recognition. It uses GPU for faster processing if available.
nlp = stanza.Pipeline('en', processors='tokenize,pos,lemma,ner', use_gpu=True)
Step 4: Load IMDb Dataset
This code reads the zipped IMDB dataset CSV file into a pandas DataFrame for further processing and analysis.
df = pd.read_csv("IMDB Dataset.csv.zip")
Step 5: Process First 5 Reviews
This code processes the first five reviews from the IMDB dataset using Stanza. For each review it prints the original text, extracts and displays named entities and shows each word’s part of speech tag and lemma using the Stanza NLP pipeline.
for i in range(5):
    print(f"\n\nReview {i+1}\n")
    text = df['review'][i]
    print("Original Review:\n", text)
    #NLP with Stanza
    doc = nlp(text)
    print("\n Named Entities:")
    for ent in doc.ents:
        print(f"{ent.text} : {ent.type}")
    print("\n Lemmas and POS Tags:")
    for sent in doc.sentences:
        for word in sent.words:
            print(f"{word.text:15} POS: {word.upos:8} Lemma: {word.lemma}")
Output:
Applications
- Chatbots and Virtual Assistants: Stanza helps chatbots understand user input by identifying sentence structure, entities and intent. This improves natural language understanding (NLU) for smarter, context aware responses.
- Information Extraction: Automatically extract names, dates, locations or other useful data from documents using Named Entity Recognition (NER) and dependency parsing. Useful in news analysis, legal text and finance.
- Text Preprocessing for Machine Learning: Clean and process raw text data before feeding it into models. Stanza provides high quality linguistic features for better model performance.
- Sentiment and Emotion Analysis: Use Stanza’s parsing and POS tagging to extract features for classifying opinions or emotions in reviews, tweets and other social media content.
