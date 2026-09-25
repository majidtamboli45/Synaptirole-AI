# Introduction to Stemming

> Source: https://www.geeksforgeeks.org/machine-learning/introduction-to-stemming/

Stemming is a text preprocessing technique in NLP that reduces words to their root or base form by removing prefixes and suffixes. It helps simplify and standardize text, making text analysis and processing more efficient.
- Simplifies words into a common root form
- Improves text processing and analysis efficiency
- Commonly used in text classification and information retrieval
- Helps reduce redundancy in text data
- May sometimes reduce readability or produce inaccurate root words
Types of Stemmer in NLTK
Python's NLTK (Natural Language Toolkit) provides various stemming algorithms each suitable for different scenarios and languages. Lets see an overview of some of the most commonly used stemmers:
1. Porter's Stemmer
Porter's Stemmeris one of the most widely used stemming algorithms in NLP. It removes common suffixes from English words using a set of predefined rules to produce root forms.
- Simple, fast and efficient stemming algorithm
- Removes common suffixes from words
- Mainly designed for the English language
- Widely used in text preprocessing tasks
- Stemmed words may not always be meaningful dictionary words
Example
- 'agreed' → 'agree'
- Rule: If the word has a suffix EED (with at least one vowel and consonant) remove the suffix and change it to EE.
Advantages
- Very fast and efficient.
- Commonly used for tasks like information retrieval and text mining.
Limitations
- Outputs may not always be real words.
- Limited to English words.
Now lets implement Porter's Stemmer in Python, here we will be using NLTK library.
from nltk.stem import PorterStemmer
porter_stemmer = PorterStemmer()
words = ["running", "jumps", "happily", "running", "happily"]
stemmed_words = [porter_stemmer.stem(word) for word in words]
print("Original words:", words)
print("Stemmed words:", stemmed_words)
Output:
2. Snowball Stemmer
Snowball Stemmer is an improved version of Porter’s Stemmer, also known as Porter2. It is faster, more aggressive, and supports multiple languages for stemming tasks.
- Improved and faster version of Porter’s Stemmer
- Removes suffixes more effectively
- Supports multiple languages
- Commonly used for multilingual text processing
- Produces more consistent stemming results
Example
- 'running' → 'run'
- 'quickly' → 'quick'
Advantages
- More efficient than Porter Stemmer.
- Supports multiple languages.
Limitations
- More aggressive which might lead to over-stemming.
Now lets implement Snowball Stemmer in Python, here we will be using NLTK library.
from nltk.stem import SnowballStemmer
stemmer = SnowballStemmer(language='english')
words_to_stem = ['running', 'jumped', 'happily', 'quickly', 'foxes']
stemmed_words = [stemmer.stem(word) for word in words_to_stem]
print("Original words:", words_to_stem)
print("Stemmed words:", stemmed_words)
Output:
3. Lancaster Stemmer
Lancaster Stemmer is a fast and aggressive stemming algorithm that reduces words to very short root forms using iterative rule-based processing.
- Faster and more aggressive than many other stemmers
- Applies rules repeatedly to reduce words
- Can produce very short or distorted stems
- Useful for applications requiring fast text processing
- May reduce accuracy due to over-stemming
Example
- 'running' → 'run'
- 'happily' → 'happy'
Advantages
- Very fast.
- Good for smaller datasets or quick preprocessing.
Limitations
- Aggressive which can result in over-stemming.
- Less efficient than Snowball in larger datasets.
Now lets implement Lancaster Stemmer in Python, here we will be using NLTK library.
from nltk.stem import LancasterStemmer
stemmer = LancasterStemmer()
words_to_stem = ['running', 'jumped', 'happily', 'quickly', 'foxes']
stemmed_words = [stemmer.stem(word) for word in words_to_stem]
print("Original words:", words_to_stem)
print("Stemmed words:", stemmed_words)
Output:
4. Regexp Stemmer
Regexp Stemmer is a flexible stemming algorithm that uses regular expressions (regex) to remove word suffixes based on custom rules.
- Allows custom stemming rules using regex
- Useful for domain-specific text processing
- Provides flexible and rule-based stemming
- Requires manual rule creation
- Can be slower for large datasets
Example
- 'running' → 'runn'
- Custom rule: r'ing$' removes the suffix ing.
Advantages
- Highly customizable using regular expressions.
- Suitable for domain-specific tasks.
Limitations
- Requires manual rule definition.
- Can be computationally expensive for large datasets.
Now let's implement Regexp Stemmer in Python, here we will be using NLTK library.
from nltk.stem import RegexpStemmer
custom_rule = r'ing$'
regexp_stemmer = RegexpStemmer(custom_rule)
word = 'running'
stemmed_word = regexp_stemmer.stem(word)
print(f'Original Word: {word}')
print(f'Stemmed Word: {stemmed_word}')
Output:
5. Krovetz Stemmer
Krovetz Stemmer is a linguistically aware stemming algorithm developed by Robert Krovetz. It focuses on preserving the actual meaning of words while converting them into their root forms.
- Preserves linguistic meaning more accurately
- Handles plural and tense conversions effectively
- Produces more meaningful root words
- Slower compared to many other stemmers
- May be less efficient for very large datasets
Example
- 'children' → 'child'
- 'running' → 'run'
Advantages
- More accurate, as it preserves linguistic meaning.
- Works well with both singular/plural and past/present tense conversions.
Limitations
- May be inefficient with large corpora.
- Slower compared to other stemmers.
Note: The Krovetz Stemmer is not natively available in the NLTK library, unlike other stemmers such as Porter, Snowball or Lancaster.
Stemming vs. Lemmatization
Let's see the tabular difference between Stemming and Lemmatization for better understanding:
| Feature | Stemming | Lemmatization | 
|---|---|---|
| Output | Reduces words to their root form, which may not be a valid word | Reduces words to their base form (lemma), producing a meaningful word | 
| Approach | Uses simple rule-based methods | Considers meaning and context of the word | 
| Processing Speed | Faster and simpler process | More accurate but computationally heavier | 
| Part of Speech (POS) | Does not consider part of speech | Uses part of speech and context | 
| Context Awareness | No context is considered | Considers the context and part of speech | 
| Output Validity | May generate non-dictionary words | Produces valid dictionary words | 
| Example | Better → Bet | Better → Good | 
Advantages
- Normalizes different word forms into a common root
- Reduces text dimensionality and improves efficiency
- Enhances search and information retrieval performance
- Simplifies processing of large text datasets
- Improves machine learning and text analysis tasks
Applications
- Improves search engine and information retrieval results
- Reduces feature space in text classification tasks
- Helps group similar documents in document clustering
- Enhances sentiment analysis by handling word variations
- Improves efficiency in processing large text datasets
Limitations
- Over-stemming may reduce words too aggressively and change their meaning
- Under-stemming may fail to group related words into the same root form
- Ignores context and semantic meaning of words
- Can affect accuracy in tasks like sentiment analysis
- Different stemmers may produce different results for the same word
