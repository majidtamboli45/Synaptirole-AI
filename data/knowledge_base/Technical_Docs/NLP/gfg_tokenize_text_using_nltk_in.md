# Tokenize text using NLTK in python

> Source: https://www.geeksforgeeks.org/nlp/tokenize-text-using-nltk-python/

Text tokenization is a fundamental Natural Language Processing (NLP) technique and one such technique is Tokenization. It is the process of dividing text into smaller components or tokens. These can be:
- Words: “I love NLP” → ["I", "love", "NLP"]
- Sentences: “I love NLP. Python is great.” → ["I love NLP.", "Python is great."]
With Python’s popular library NLTK (Natural Language Toolkit), splitting text into meaningful units becomes both simple and extremely effective.
Basic Implementation
Let's see the implementation of Tokenization using NLTK in Python,
Step 1: Install and Setup
Install the “punkt” tokenizer models needed for sentence and word tokenization.
!pip install nltk
import nltk
nltk.download('punkt')
Step 2: Tokenize Sentences
sent_tokenize() splits a string into a list of sentences, handling punctuation and abbreviations.
from nltk.tokenize import sent_tokenize
text = "NLTK is a great NLP toolkit. It makes processing text easy!"
sentences = sent_tokenize(text)
print(sentences)
Output:
['NLTK is a great NLP toolkit.', 'It makes processing text easy!']
Step 3: Tokenize Words
- word_tokenize() splits a sentence into words and punctuation marks as separate tokens.
- Handles contractions, punctuation, numbers and more.
from nltk.tokenize import word_tokenize
sentence = "Tokenization is easy with NLTK's word_tokenize."
words = word_tokenize(sentence)
print(words)
Output:
['Tokenization', 'is', 'easy', 'with', 'NLTK', "'s", 'word_tokenize', '.']
Lets see some more Examples,
1. WordPunctTokenizer
It Splits text into alphabetic and non-alphabetic characters,
- Separates all sequences of word characters and punctuation into tokens.
- Especially splits contractions (Don't becomes Don, ', t).
- Splits E-mails into E, -, mails.
from nltk.tokenize import WordPunctTokenizer
tokenizer = WordPunctTokenizer()
tokens = tokenizer.tokenize(
    "Don't split contractions. E-mails: hello@example.com!")
print(tokens)
Output:
['Don', "'", 't', 'split', 'contractions', '.', 'E', '-', 'mails', ':', 'hello', '@', 'example', '.', 'com', '!']
2. TreebankWordTokenizer
It is suitable for linguistic analysis, handles punctuation and contractions.
- Mimics Penn Treebank-style tokenization, which is commonly used for NLP linguistic analysis.
- Handles certain English grammatical structures more “intelligently.”
from nltk.tokenize import TreebankWordTokenizer
tokenizer = TreebankWordTokenizer()
tokens = tokenizer.tokenize("Have a look at NLTK's tokenizers.")
print(tokens)
Output:
['Have', 'a', 'look', 'at', 'NLTK', "'s", 'tokenizers', '.']
3. Regex Tokenizer
It customize pattern-based splitting.
- Tokenizes based on a regular expression pattern.
- \w+ matches words and numbers, omitting punctuation completely.
from nltk.tokenize import RegexpTokenizer
tokenizer = RegexpTokenizer(r'\w+')
tokens = tokenizer.tokenize(
    "Custom rule: keep only words & numbers, drop punctuation!")
print(tokens)
Output:
['Custom', 'rule', 'keep', 'only', 'words', 'numbers', 'drop', 'punctuation']
NLTK provides a useful and user-friendly toolkit for tokenizing text in Python, supporting a range of tokenization needs from basic word and sentence splitting to advanced custom patterns.
