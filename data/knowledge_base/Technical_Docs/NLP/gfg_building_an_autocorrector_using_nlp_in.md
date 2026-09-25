# Building an Autocorrector Using NLP in Python

> Source: https://www.geeksforgeeks.org/nlp/autocorrector-feature-using-nlp-in-python/

Autocorrect feature predicts and correct misspelled words, it helps to save time invested in the editing of articles, emails and reports. This feature is added many websites and social media platforms to ensure easy typing.
In this tutorial we will build a Python-based autocorrection feature using Natural Language Processing (NLP) and the NLTK library.
Before diving into the implementation make sure you have Python installed and set up. You’ll also need to install the following libraries:
pip install nltk
Step 1: Import Required Libraries
We'll begin by importing the necessary libraries like nltk library, re and string to help with text processing, and WordNetLemmatizer from nltk for word normalization.
import nltk
import re
import string
from nltk.stem import WordNetLemmatizer
from google.colab import files
# Download required NLTK data
nltk.download('wordnet')
nltk.download('omw-1.4')
These datasets provide word lists and other resources needed for word processing.
Step 2: Load and Process the Text Dataset
To build an effective autocorrect system we need a large dataset of correctly spelled words. We’ll use a text file (final.txt) to create a vocabulary list. The dataset link is provided at the end of the article. 
- text_data is processed to lowercase to avoid case sensitivity
- re.findall(r'\w+', text_data) extracts all the words (sequences of alphanumeric characters).
print("Upload your text dataset (final.txt)")
uploaded = files.upload()
file_name = list(uploaded.keys())[0]
with open(file_name, 'r', encoding="utf8") as f:
    text_data = f.read().lower()
    words = re.findall(r'\w+', text_data)
vocab = set(words)
Step 3: Count Word Frequency
To calculate the probability of the correct word prediction, we compute how often each word appears in the dataset. Words that appear more frequently are likely to be correct and the frequency count of each word is stored in a dictionary.
def count_word_frequency(words):
    word_count = {}
    for word in words:
        word_count[word] = word_count.get(word, 0) + 1
    return word_count
word_count = count_word_frequency(words)
Step 4: Calculate Word Probability
Using the word frequency data, we calculate the probability of each word. Words that appear more often will have a higher probability.
def calculate_probability(word_count):
    total_words = sum(word_count.values())
    return {word: count / total_words for word, count in word_count.items()}
probabilities = calculate_probability(word_count)
Step 5: Define NLP-Based Functions
Here, we define a few helper functions that will generate possible corrections for misspelled words. These functions apply common spelling correction strategies such as:
- Deleting a letter: removes a letter from the word.
- Swapping adjacent letters: swaps adjacent letters in the word
- Replacing a letter: replaces each letter with every other letter of the alphabet
- Inserting a new letter: inserts a new letter at every position in the word
lemmatizer = WordNetLemmatizer()
def lemmatize_word(word):
    """Lemmatize a given word using NLTK WordNet Lemmatizer."""
    return lemmatizer.lemmatize(word)
def delete_letter(word):
    return [word[:i] + word[i+1:] for i in range(len(word))]
def swap_letters(word):
    return [word[:i] + word[i+1] + word[i] + word[i+2:] for i in range(len(word)-1)]
def replace_letter(word):
    letters = string.ascii_lowercase
    return [word[:i] + l + word[i+1:] for i in range(len(word)) for l in letters]
def insert_letter(word):
    letters = string.ascii_lowercase
    return [word[:i] + l + word[i:] for i in range(len(word)+1) for l in letters]
Step 6: Generate Candidate Corrections
Using the functions above, we generate "candidate corrections" for a misspelled word. We first try to generate candidates from a single edit (level 1), and if needed, we go to a second level (level 2) by applying the edit operations to the level 1 candidates.
def generate_candidates(word):
    candidates = set()
    candidates.update(delete_letter(word))
    candidates.update(swap_letters(word))
    candidates.update(replace_letter(word))
    candidates.update(insert_letter(word))
    return candidates
def generate_candidates_level2(word):
    level1 = generate_candidates(word)
    level2 = set()
    for w in level1:
        level2.update(generate_candidates(w))
    return level2
Step 8: Get the Best Corrections
Now, we define a function to determine the best possible correction for a misspelled word. We compare the candidates against the vocabulary and choose the one with the highest probability.
def get_best_correction(word, probs, vocab, max_suggestions=3):
    candidates = (
        [word] if word in vocab else list(generate_candidates(word).intersection(vocab)) or 
        list(generate_candidates_level2(word).intersection(vocab))
    )
    return sorted([(w, probs.get(w, 0)) for w in candidates], key=lambda x: x[1], reverse=True)[:max_suggestions]
- Candidates: The list of potential corrections is first limited to words in the vocabulary, then expanded using level 1 or level 2 candidate generation.
- Sorting: We sort the candidates by their probabilities (higher probability = more likely correct).
Step 9: User Input & Output Suggestions
Finally, we take user input and display the top suggestions. This is the interactive part where the user inputs a word, and the system outputs the best corrections.
user_input = input("\n Enter a word for autocorrection: ")
suggestions = get_best_correction(user_input, probabilities, vocab, max_suggestions=3)
print("\n Top suggestions:")
for suggestion in suggestions:
    print(suggestion[0])
Output:
This basic implementation is a good starting point, but we can improve it by:
- Using a larger corpus for the vocabulary.
- Implementing more advanced NLP techniques like n-grams (for predicting context) or TF-IDF (to measure word importance).
- Exploring machine learning or transformer-based models like BERT to improve accuracy.
You can download the dataset and source code:
- Notebook: click here
- Dataset: click here
