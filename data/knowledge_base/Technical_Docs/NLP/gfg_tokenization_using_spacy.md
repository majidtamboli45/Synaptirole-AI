# Tokenization Using Spacy

> Source: https://www.geeksforgeeks.org/nlp/tokenization-using-spacy-library/

Tokenization is a preprocessing step in NLP where text is divided into smaller units called tokens such as words, punctuation marks or special characters. This makes text easier for machines to process and analyze.
Let's see an example:
- Sentence: “I love natural language processing!”
- After tokenization: ["I", "love", "natural", "language", "processing", "!"]
Features of SpaCy Tokenizer
- Performs fast and efficient tokenization on large text datasets
- Treats punctuation marks as separate tokens for accurate text processing
- Supports language-specific tokenization rules and grammar patterns
- Correctly handles spaces, newlines, URLs, hashtags, and email addresses
- Allows customization through user-defined tokenization rules
Implementation
Here, we’ll see how to implement tokenization using SpaCy.
1. Blank Model Tokenization
In this method, SpaCy’s blank model spacy.blank("en") is used to perform basic tokenization without pre-trained NLP components such as POS tagging or named entity recognition.
- Initializes a minimal NLP pipeline
- Performs basic text tokenization
- Does not include pre-trained language processing features
import spacy
nlp = spacy.blank("en")
doc = nlp("GeeksforGeeks is a one stop\
learning destination for geeks")
for token in doc:
    print(token)
Output:
2. Displaying the Pipeline Components
In this step, the pre-trained en_core_web_sm model is loaded to access SpaCy’s NLP components. The pipeline components can then be displayed to view the available processing modules.
- Loads the pre-trained SpaCy model
- Displays available NLP pipeline components
- Includes components for tasks like tagging and parsing
nlp = spacy.load("en_core_web_sm")
nlp.pipe_names
Output:
['tok2vec', 'tagger', 'parser', 'attribute_ruler', 'lemmatizer', 'ner']
3. Tokenization with Part-of-Speech Tagging and Lemmatization
In this step, text is processed to perform tokenization, identify part-of-speech tags and extract the lemmatized form of each token.
- Splits text into tokens
- Assigns grammatical POS tags
- Extracts root or dictionary forms of words
import spacy
nlp = spacy.load("en_core_web_sm")
doc = nlp("If you want to be an excellent programmer \
, be consistent to practice daily on GFG.")
for token in doc:
    print(token, " | ",
          spacy.explain(token.pos_),
          " | ", token.lemma_)
Output:
Download full code from here
Advantages
- Provides fast and efficient tokenization for large text datasets
- Offers accurate tokenization using pre-trained NLP models
- Simple and user-friendly API for easy implementation
- Supports integration with tasks like lemmatization, parsing and NER
- Useful for building custom NLP pipelines and applications
Limitations
- Pre-trained models may require high memory usage
- Domain-specific text may need additional fine-tuning
- Performance can vary for languages with limited linguistic resources
- Large models may not suit memory constrained environments
