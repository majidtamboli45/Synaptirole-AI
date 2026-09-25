# How to remove punctuations in NLTK

> Source: https://www.geeksforgeeks.org/nlp/how-to-remove-punctuations-in-nltk/

Natural Language Processing (NLP) involves processing and analyzing human language using machines. Removing punctuation is an important text preprocessing step that helps clean text data and improve the performance of NLP models and text analysis tasks.
Step 1: Install NLTK
To install NLTK run the following command in your command prompt
pip install nltk
Step 2: Import Required Libraries
Imports NLTK and the tokenizer used for splitting text into words.
import nltk
from nltk.tokenize import word_tokenize
Step 3: Download Tokenizer Resources
Downloads the tokenizer resources required for word tokenization.
nltk.download('punkt')
nltk.download('punkt_tab')
Step 4: Define Input Text
Creates a sample sentence containing punctuation marks.
text = "Hello! Welcome to NLP, using NLTK."
Step 5: Tokenize and Remove Punctuation
Tokenizes the text and removes punctuation using isalnum() to keep only words and numbers.
tokens = word_tokenize(text)
clean_text = [
    word for word in tokens
    if word.isalnum()
]
print(' '.join(clean_text))
Output:
Hello Welcome to NLP using NLTK
Download full code from here
