# Conditional Random Fields (CRFs) for POS tagging in NLP

> Source: https://www.geeksforgeeks.org/nlp/conditional-random-fields-crfs-for-pos-tagging-in-nlp/

Conditional Random Fields (CRFs) are widely used in NLP for Part-of-Speech (POS) tagging where each word in a sentence is assigned a grammatical label such as noun, verb or adjective. As probabilistic sequence-labeling models, CRFs capture contextual and dependency relationships between neighboring words and tags, allowing more accurate labeling of entire sentences rather than individual words.
For the sentence: “She likes to read books”
These tags help machines understand grammatical structure which is useful in tasks like:
- Machine Translation
- Sentiment Analysis
- Text to Speech
- Information Extraction
How CRFs Work
CRFs model the entire sequence as a single structured prediction problem and assign scores to possible tag sequences. They select the most probable global label sequence by combining feature weights and transition dependencies across the sentence. CRF Probability:
P(Y \mid X) = \frac{1}{Z(X)} \exp\left( \sum_i \sum_k \lambda_k\, f_k(y_{i-1}, y_i, x_i) \right) 
where
- X : input words
- Y : output tags
- f_k() : feature functions
- \lambda_k : learned weights
- Z(X) : normalization factor
Types of Conditional Random Fields (CRFs)
- Linear-Chain CRF: Used for sequence labeling tasks like POS Tagging and NER by modeling tag dependencies in a chain.
- Higher-Order CRF: Captures relationships beyond immediate neighbors, allowing longer tag dependency modeling.
- Skip Chain CRF: Links distant but related words to handle long-range dependencies.
- Semi-Markov CRF: Predicts segments instead of single tokens, useful for chunking and phrase-level labeling.
- CRF with Neural Networks (Neural CRF): Combines CRF with LSTM/BERT features to improve accuracy in modern NLP tasks.
Step-by-Step Implementation
Here in this code builds and evaluates a Conditional Random Field model to automatically assign part-of-speech tags to words in sentences.
Step 1: Install and Import Required Libraries
- Install the scikit learn package for CRF modeling.
- NLTK is imported for NLP preprocessing and dataset handling.
- These libraries form the foundation for POS tagging using CRFs.
pip install sklearn-crfsuite
import nltk
import sklearn_crfsuite
from sklearn_crfsuite import metrics  
Step 2: Download and Load the Treebank Corpus
- Treebank dataset contains sentences already tagged with POS labels.
- This labeled dataset will be used for supervised CRF training.
nltk.download('treebank')
corpus = nltk.corpus.treebank.tagged_sents()
print(corpus)
Output:
Step 3: Define Word Feature Extraction Function
- Features describe properties of each word for CRF learning.
- Includes prefixes, suffixes, capitalization, numeric checks and context words.
- These handcrafted features help CRF identify POS patterns.
- The function returns a dictionary of linguistic features.
def word_features(sentence, i):
    word = sentence[i][0]
    features = {
        'word': word,
        'is_first': i == 0,
        'is_last': i == len(sentence) - 1,
        'is_capitalized': word[0].upper() == word[0],
        'is_all_caps': word.upper() == word,
        'is_all_lower': word.lower() == word,
        'prefix-1': word[0],
        'prefix-2': word[:2],
        'prefix-3': word[:3],
        'suffix-1': word[-1],
        'suffix-2': word[-2:],
        'suffix-3': word[-3:],
        'prev_word': '' if i == 0 else sentence[i-1][0],
        'next_word': '' if i == len(sentence)-1 else sentence[i+1][0],
        'has_hyphen': '-' in word,
        'is_numeric': word.isdigit(),
        'capitals_inside': word[1:].lower() != word[1:]
    }
    return features
Step 4: Convert Corpus into Feature and Label Sequences
- Each sentence is converted into feature dictionaries using the function.
- X holds sentence-level feature lists, y holds corresponding POS tags.
- Both X and y must match sequence lengths for CRF training.
- This creates the full training dataset for the model.
X = []
y = []
for sentence in corpus:
    X_sentence = []
    y_sentence = []
    for i in range(len(sentence)):
        X_sentence.append(word_features(sentence, i))
        y_sentence.append(sentence[i][1])
    X.append(X_sentence)
    y.append(y_sentence)
Step 5: Split the Dataset into Training and Testing Sets
- Training set helps the CRF model learn POS patterns.
- Testing set evaluates accuracy on unseen sentences.
- This ensures proper generalization measurement.
split = int(0.8 * len(X))
X_train = X[:split]
y_train = y[:split]
X_test = X[split:]
y_test = y[split:]
Step 6: Train CRF Model Using sklearn_crfsuite
- Here we build a CRF model using the L-BFGS optimization algorithm.
- c1 and c2 are regularization parameters to prevent overfitting.
- The model is trained using extracted training sequences.
crf = sklearn_crfsuite.CRF(
    algorithm='lbfgs',
    c1=0.1,
    c2=0.1,
    max_iterations=100,
    all_possible_transitions=True
)
crf.fit(X_train, y_train)
y_pred = crf.predict(X_test)
print(metrics.flat_accuracy_score(y_test, y_pred))
Step 7: Train CRF Model Using pycrfsuite
- Another CRF is trained using pycrfsuite for comparison.
- Training sequences (features + tags) are appended to the trainer.
- Model parameters such as c1, c2 and max_iterations are specified.
- The trained model is saved as pos.crfsuite.
import pycrfsuite
trainer = pycrfsuite.Trainer(verbose=False)
for x, y in zip(X_train, y_train):
    trainer.append(x, y)
trainer.set_params({
    'c1': 1.0,
    'c2': 1e-3,
    'max_iterations': 50,
    'feature.possible_transitions': True
})
trainer.train('pos.crfsuite')
Step 8: Tag a New Sentence Using the Trained Model
- The trained CRF model is loaded using Tagger.
- A new sentence is tokenized and feature extraction is applied.
- CRF predicts POS tags for each word.
tagger = pycrfsuite.Tagger()
tagger.open('pos.crfsuite')
sentence = 'Geeksforgeeks is a best platform for students.'.split()
features = [word_features(sentence, i) for i in range(len(sentence))]
tags = tagger.tag(features)
print(list(zip(sentence, tags)))
Output:
[('Geeksforgeeks', 'MD'), ('is', 'VB'), ('a', 'DT'), ('best', 'JJ'), ('platform', 'NN'), ('for', 'NN'), ('students.', 'NNS')]
You can download full code from here
Applications
- POS Tagging: Assigns grammatical tags like noun/verb to each word in a sentence.
- Chunking: Groups words into meaningful phrases such as NP and VP.
- Text Segmentation: Detects sentence boundaries and splits text into units.
- Information Extraction: Extracts structured data from text.
- OCR: Improves character recognition by modeling neighbor relationships.
Advantages
- No Independence Assumption: Uses rich overlapping features unlike HMMs.
- Sequence-Level Prediction: Optimizes the entire label sequence for accuracy.
- Interpretable: Feature weights are easy to understand and debug.
- Flexible Features: Supports lexical, orthographic and contextual features.
Limitations
- Requires Feature Engineering: Needs manual feature design to work well.
- Slow Training: Optimization is computationally expensive on large data.
- Weak for Long Dependencies: Struggles with long-range contextual relations.
- Sensitive to Unknown Words: Performance drops with rare or unseen tokens.
- Outperformed by Neural Models: Modern LSTMs and Transformers give better results.
