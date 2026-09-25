# Gram Language Modelling with NLTK

> Source: https://www.geeksforgeeks.org/nlp/n-gram-language-modelling-with-nltk/

Language modelling is the process of determining the probability of a sequence of words. It is an important part of Natural Language Processing (NLP) and is widely used in applications where predicting or ranking sentences is necessary.
- Helps predict the next word in a sentence.
- Used in speech recognition and machine translation.
- Helps detect spam and improve text-based applications.
- Supports tasks like text generation and autocomplete systems.
N-gram
N-gram is a language modeling technique that represents a sequence of n continuous items from a text or speech sample. These items are usually words and N-grams are created from a text corpus to analyze language patterns.
- Single words are called unigrams. Example: “This”, “article”, “is”, “on”, “NLP”
- Pairs of consecutive words are called bigrams. Example: “This article”, “article is”, “is on”, “on NLP”
- Groups of three words are called trigrams.
- Larger word combinations can also be formed similarly.
N-gram Language Model
N-gram models predict the probability of a word given the previous n−1 words. For example, a trigram model uses the preceding two words to predict the next word:
Goal: Calculate 
Example: For the phrase: “This article is on…”, if we want to predict the likelihood of “NLP” as the next word:
p(\text"NLP"|"This","article","is","on") 
Chain Rule of Probability
The probability of a sequence of words is computed as
P(w_1, w_2, \ldots, w_n) = \prod_{i=1}^{n} P(w_i \mid w_1, w_2, \ldots, w_{i-1}) 
Markov Assumption
To reduce complexity, N-gram models assume the probability of a word depends only on the previous n−1 words.
P(w_i \mid w_1, \ldots, w_{i-1}) \approx P(w_i \mid w_{i-(n-1)}, \ldots, w_{i-1}) 
Evaluating Language Models
1. Entropy: Measures the uncertainty or information content in a distribution.
H(p) = \sum_x p(x) \cdot \left(-\log(p(x))\right) 
It always give non negative.
2. Cross-Entropy: Measures how well a probability distribution predicts a sample from test data.
H(p, q) = -\sum_x p(x) \log(q(x)) 
Usually ≥ entropy; reflects model “surprise” at the test data.
3. Perplexity: Exponential of cross-entropy; lower values indicate a better model.
\text{Perplexity}(W) = \sqrt[N]{\prod_{i=1}^{N} \frac{1}{P(w_i \mid w_{i-1})}} 
Implementing N-Gram Language Modelling in NLTK
- word_tokenize() converts text into words.
- trigrams(words) creates 3-word sequences.
- model[(w1, w2)][w3] += 1 counts trigram occurrences.
- Probabilities are calculated from these counts.
- The model predicts the most likely next word.
import nltk
from nltk import trigrams
from nltk.corpus import reuters
from collections import defaultdict
nltk.download('reuters')
nltk.download('punkt')
nltk.download('punkt_tab')
words = nltk.word_tokenize(' '.join(reuters.words()))
tri_grams = list(trigrams(words))
model = defaultdict(lambda: defaultdict(lambda: 0))
for w1, w2, w3 in tri_grams:
    model[(w1, w2)][w3] += 1
for w1_w2 in model:
    total_count = float(sum(model[w1_w2].values()))
    
    for w3 in model[w1_w2]:
        model[w1_w2][w3] /= total_count
def predict_next_word(w1, w2):
    next_word_probs = model[(w1, w2)]
    
    if next_word_probs:
        return max(next_word_probs, key=next_word_probs.get)
    else:
        return "No prediction available"
print("Next Word:", predict_next_word('the', 'stock'))
Output:
Next Word: of
Download code from here
Advantages
- Simple and easy to implement for language modeling tasks.
- Fast and efficient when using small values of n.
- Easy to understand, analyze and debug.
- Works well as a baseline model for many NLP applications.
Limitations
- Considers only a few previous words and misses long-range context.
- Requires large amounts of data as rare word combinations increase with larger n.
- Large N-gram models need more memory and storage.
- Struggles with unseen or rare words without smoothing techniques.
