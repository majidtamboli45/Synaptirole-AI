# Speech) Tagging in NLP

> Source: https://www.geeksforgeeks.org/nlp/nlp-part-of-speech-default-tagging/

Parts of Speech (PoS) tagging is a fundamental task in Natural Language Processing (NLP) where each word in a sentence is assigned a grammatical category such as noun, verb, adjective or adverb.
- This process help machines to understand the structure and meaning of sentences by identifying the roles of words and their relationships.
- Analyzes the context of words to determine their correct part of speech
- Improves text analysis, parsing, machine translation, and information extraction
- Widely used in text classification, sentiment analysis, chatbots, and search engine
It plays an important role in various NLP applications including machine translation, sentiment analysis and information retrieval, by bridging the gap between human language and machine understanding.
Key Concepts
- Parts of Speech: These are categories like nouns, verbs, adjectives, adverbs, etc that define the role of a word in a sentence.
- Tagging: The process of assigning a specific part-of-speech label to each word in a sentence.
- Corpus: A large collection of text data used to train POS taggers.
Example of POS Tagging
Consider the sentence: "The quick brown fox jumps over the lazy dog."
After performing POS Tagging, we get:
- "The" is tagged as determiner (DT)
- "quick" is tagged as adjective (JJ)
- "brown" is tagged as adjective (JJ)
- "fox" is tagged as noun (NN)
- "jumps" is tagged as verb (VBZ)
- "over" is tagged as preposition (IN)
- "the" is tagged as determiner (DT)
- "lazy" is tagged as adjective (JJ)
- "dog" is tagged as noun (NN)
Each word is assigned a tag based on its role in the sentence. For example, "quick" and "brown" are adjectives that describe the noun "fox."
Working
Let’s see various steps involved in POS tagging:
- Tokenization: The input text is split into individual tokens (words or subwords), this step is necessary for further analysis.
- Preprocessing: The text is cleaned such as converting it to lowercase and removing special characters, to improve accuracy.
- Loading a Language Model: Tools like NLTK or SpaCy use pre-trained language models to understand the grammatical rules of the language, these models have been trained on large datasets.
- Linguistic Analysis: The structure of the sentence is analyzed to understand the role of each word in context.
- POS Tagging: Each word is assigned a part-of-speech label based on its role in the sentence and the context provided by surrounding words.
- Evaluation: The results are checked for accuracy. If there are any errors or misclassifications, they are corrected.
Types of POS Tagging
There are different types and each has its strengths and use cases. Let's see few common methods:
1. Rule-Based Tagging
Rule-based POS tagging assigns POS tags based on predefined grammatical rules. These rules are crafted based on morphological features (like word endings) and syntactic context, making the approach highly interpretable and transparent.
Example:
1. Rule: Assign the POS tag "Noun" to words ending in "-tion" or "-ment".
2. Sentence: "The presentation highlighted the key achievements of the project's development."
3. Tagged Output:
- "presentation" → Noun (N)
- "highlighted" → Verb (V)
- "development" → Noun (N)
2. Transformation-Based Tagging (TBT)
TBT refines POS tags through a series of context-based transformations. Unlike statistical taggers that rely on probabilities or rule-based taggers, it starts with initial tags and improves them iteratively by applying transformation rules.
Example:
- Text: "The cat chased the mouse."
- Initial Tags: "The" – DET, "cat" – NOUN, "chased" – VERB, "the" – DET, "mouse" – NOUN
- Rule Applied: Change “chased” from Verb to Nounbecause it follows “the”.
- Updated Tags: "chased" becomes Noun.
3. Statistical POS Tagging
It uses probabilistic models to assign grammatical categories (e.g noun, verb, adjective) to words in a text. Unlike rule-based methods which rely on handcrafted rules, it learns patterns from large annotated corpora using machine learning techniques.
These models calculate the likelihood of a tag based on a word and its context, helping to resolve ambiguities and handle complex grammar. Common models include:
Implementing POS Tagging with NLTK
Let's see step by step process how POS Tagging works with NLTK:
Step 1: Installing Required Resources
Here we import the NLTK library and download the necessary datasets using nltk.download().
import nltk
from nltk.tokenize import word_tokenize
from nltk import pos_tag
nltk.download('punkt_tab')
nltk.download('averaged_perceptron_tagger_eng')
Step 2: Applying POS Tagging
First we store the sentence and tokenize it into words using word_tokenize(text). Then we apply POS tagging to the tokenized words using pos_tag(words). This assigns a part-of-speech to each word.
text = "NLTK is a powerful library for natural language processing."
words = word_tokenize(text)
pos_tags = pos_tag(words)
Step 3: Displaying Results
Now we print the original sentence and loop through the tagged words to show each word with its POS tag.
print("Original Text:")
print(text)
print("\nPoS Tagging Result:")
for word, pos_tag in pos_tags:
    print(f"{word}: {pos_tag}")
Output:
Implementing POS Tagging with SpaCy
Let's see step by step process how POS Tagging works with SpaCy:
Step 1: Installing and importing Required Resources
Here we install and import the SpaCy library and install the pre-trained English language model (en_core_web_sm).
!pip install spacy
!python -m spacy download en_core_web_sm
import spacy
nlp = spacy.load("en_core_web_sm")
Step 2: Defining and Processing the Text
We store the sentence in a variable and process it with nlp(text) to get linguistic annotations.
text = "SpaCy is a popular natural language processing library."
doc = nlp(text)
Step 3: Displaying POS Tagging
Print the original sentence then loop through the tokens and display each word with its POS tag.
print("Original Text: ", text)
print("PoS Tagging Result:")
for token in doc:
    print(f"{token.text}: {token.pos_}")
Output:
Advantages
- Text Simplification: POS tagging can break down complex sentences into simpler parts, making them easier to understand.
- Improved Search: It improves information retrieval by categorizing words, making it easier to index and search text.
- Named Entity Recognition (NER): It helps identify names, places and organizations by recognizing the role of words in a sentence.
Challenges
- Ambiguity: Words can have multiple meanings depending on the context which can make tagging difficult.
- Idiomatic Expressions: Informal language and idioms may be hard to tag correctly.
- Out-of-Vocabulary Words: Words that haven’t been seen before can lead to incorrect tagging.
- Domain Dependence: Models may not work well outside the specific language domain they were trained on.
