# Subword Tokenization in NLP

> Source: https://www.geeksforgeeks.org/nlp/subword-tokenization-in-nlp/

Natural Language Processing models often struggle to handle the wide variety of words in human language, especially within limited computing resources. Using traditional word-level tokenization seems like an ideal solution but it doesn’t work well for large vocabularies or complex languages. Subword tokenization is a better solution by breaking words into smaller parts, capturing both meaning and structure more efficiently.
Understanding the Vocabulary Problem
Traditional word tokenization creates a unique token for every distinct word form. Words like "run", "running", "ran" and "runner" would each occupy separate vocabulary slots despite their semantic relationship. Multiplying this across thousands of word families, technical terms and misspellings and our vocabulary can explode to millions of unique tokens.
This vocabulary explosion creates several problems:
- Memory overhead: Each token requires embedding parameters making models computationally expensive
- Out-of-vocabulary (OOV) issues: Rare or unseen words become impossible to process
- Poor generalization: Related word forms are treated as completely independent entities
Subword tokenization addresses these issues by breaking words into meaningful subunits. Frequent words remain intact, while rare words are broken down into more common subword pieces that the model has likely encountered before.
Implementing Subword Tokenization
Here we will see various Subword Tokenization metods:
1. Basic Tokenization
Let's start with a practical implementation to understand the progression from word-level to subword tokenization.
- Imports regex and collections.
- Defines preprocess_text() to lowercase and tokenize text, keeping words and punctuation.
- Processes a sample paragraph using this function.
- Prints the list of tokens and the number of unique ones.
import re
from collections import OrderedDict, defaultdict
def preprocess_text(text):
    """
    Clean and tokenize text, handling punctuation appropriately.
    Returns a list of tokens with lowercase normalization.
    """
    # Convert to lowercase and handle punctuation
    text = text.lower()
    
    # Split on whitespace and punctuation, keeping punctuation as separate tokens
    tokens = re.findall(r'\w+|[^\w\s]', text)
    
    return tokens
# Example text processing
sample_text = """GeeksforGeeks is a fantastic resource for geeks 
who are looking to enhance their programming skills, 
and if you're a geek who wants to become an expert programmer, 
then GeeksforGeeks is definitely the go-to place for geeks like you."""
word_tokens = preprocess_text(sample_text)
print("Word-level tokens:")
print(word_tokens)
print(f"Total unique tokens: {len(set(word_tokens))}")
Output:
Word-level tokens: 
['geeksforgeeks', 'is', 'a', 'fantastic', 'resource', 'for', 'geeks', 'who', 'are', 'looking', 'to', 'enhance', 'their', 'programming', 'skills', ',', 'and', 'if', 'you', "'", 're', 'a', 'geek', 'who', 'wants', 'to', 'become', 'an', 'expert', 'programmer', ',', 'then', 'geeksforgeeks', 'is', 'definitely', 'the', 'go', '-', 'to', 'place', 'for', 'geeks', 'like', 'you', '.'] 
Total unique tokens: 35
This preprocessing step creates clean tokens while preserving punctuation as separate elements. The output shows how a short paragraph generates large number of unique tokens, highlighting the vocabulary size challenge.
2. Character-Level Tokenization
Before implementing sophisticated subword algorithms, we need to understand character-level representation. This method involves creating a frequency dictionary where each word is represented as a sequence of characters separated by spaces.
- Defines a function create_char_vocabulary() that takes a list of word tokens.
- For each word, it splits the word into characters and joins them with spaces.
- It counts how many times each unique space-separated character sequence appears.
- The vocabulary is stored as an OrderedDict, sorted by frequency.
- Prints the top 10 most frequent character sequences.
def create_char_vocabulary(tokens):
    
    char_vocab = defaultdict(int)
    
    for token in tokens:
        # Convert each word to space-separated characters
        char_sequence = ' '.join(list(token))
        char_vocab[char_sequence] += 1
    
    return OrderedDict(sorted(char_vocab.items(), key=lambda x: x[1], reverse=True))
# Create character vocabulary from our tokens
char_vocab = create_char_vocabulary(word_tokens)
print("Character-level vocabulary (top 10):")
for i, (char_seq, freq) in enumerate(char_vocab.items()):
    if i < 10:
        print(f"'{char_seq}': {freq}")
    else:
        break
Output:
Character-level vocabulary (top 10): 
't o': 3 '
g e e k s f o r g e e k s': 2 
'is': 2 
'a': 2 
'f o r': 2 
'g e e k s': 2 
'w h o': 2 
',': 2 
'y o u': 2 
'f a n t a s t i c': 1
This character-level representation serves as the foundation for Byte-Pair Encoding. Each word is now a sequence of individual characters and we can observe which character combinations appear most frequently across our corpus.
3. Byte-Pair Encoding Implementation
Byte-Pair Encoding works on iteratively merging the most frequent pair of symbols until reaching a desired vocabulary size. This creates a data-driven subword segmentation that balances between character granularity and word-level meaning.
- Initial Vocabulary: Words are split into characters with their frequencies (e.g., "l o w e r": 2).
- Get Symbol Pairs: get_pairs counts how often each adjacent character pair appears.
- Merge Step: merge_vocab replaces the most frequent pair with a combined token.
- BPE Loop: Repeats merging the most common pair for a set number of times (5 here), updating the vocabulary each time.
- Final Output: Prints the updated vocabulary after all merges, showing how characters group into subword units.
from collections import Counter
# Step 1: Input vocabulary (word -> frequency)
vocab = {
    'l o w': 5,
    'l o w e r': 2,
    'n e w e s t': 6,
    'w i d e s t': 3
}
# Step 2: Find symbol pairs
def get_pairs(vocab):
    pairs = Counter()
    for word, freq in vocab.items():
        symbols = word.split()
        for i in range(len(symbols)-1):
            pairs[(symbols[i], symbols[i+1])] += freq
    return pairs
# Step 3: Merge most frequent pair
def merge_vocab(vocab, pair):
    new_vocab = {}
    old = ' '.join(pair)
    new = ''.join(pair)
    for word, freq in vocab.items():
        new_word = word.replace(old, new)
        new_vocab[new_word] = freq
    return new_vocab
# Step 4: Run BPE
num_merges = 5
for _ in range(num_merges):
    pairs = get_pairs(vocab)
    if not pairs: break
    most_common = pairs.most_common(1)[0][0]
    vocab = merge_vocab(vocab, most_common)
    print(f"Merged: {most_common} -> {''.join(most_common)}")
# Step 5: Final vocab
print("\nFinal Vocabulary:")
for word in vocab:
    print(word)
Output:
Merged: ('e', 's') -> es 
Merged: ('es', 't') -> est 
Merged: ('l', 'o') -> lo 
Merged: ('lo', 'w') -> low 
Merged: ('n', 'e') -> ne  
Final Vocabulary: 
low low e r 
ne w est 
w i d est
Advantages of BPE (Byte-Pair Encoding):
- Flexible vocabulary: It can learn useful subword patterns specific to a domain or dataset.
- Handles unknown words: New or rare words can be broken into smaller known parts like characters, so the model can still understand them.
- Efficient representation: It keeps the vocabulary size manageable while still capturing meaningful parts of words.
- Language-independent: Works well with different languages and writing systems.
Limitations of BPE:
- Dependent on training data: If the training text doesn’t represent real-world usage well, the subword splits may be poor.
- Not dynamic: Once trained, the BPE vocabulary doesn’t learn new patterns unless retrained.
- Inconsistent splits: The same word might be split differently depending on context.
- No understanding of grammar: BPE doesn’t know about grammar or word structure, it only uses frequency of character patterns.
Real-World Applications
- Subword tokenization is essential in transformer models like GPT, BERT and T5.
- GPT-2 uses Byte-Pair Encoding (BPE) on bytes, allowing it to process any Unicode text.
- BERT uses WordPiece, which selects subword units based on how likely they are to appear.
- Vocabulary size is compact (30k–50k tokens), making it efficient for memory and computation.
- It replaces huge word lists (with millions of entries) while still handling a wide variety of words.
Subword tokenization has become essential for multilingual models, where a single vocabulary must represent dozens of languages with different writing systems and morphological structures. By learning subword patterns across languages these models can achieve better cross-lingual transfer and handle code-switching scenarios.
