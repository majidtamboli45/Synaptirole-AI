# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/nlp/n-gram-in-nlp/

N-gram is a contiguous sequence of 'N' items like words or characters from text or speech. The items can be letters, words or base pairs according to the application. The value of ’N’ determines the order of the N-gram. They are fundamental concept used in various NLP tasks such as language modeling, text classification, machine translation and more.
N-grams can be of various types based on the value of 'n':
- Unigrams (1-grams) are single words
- Bigrams (2-grams) are pairs of consecutive words
- Trigrams (3-grams) are triplets of consecutive words
Here in the above image we can see unigram, bigrams and trigrams doing partitioning of sentences to form n-grams.
N-grams in NLP are used for:
- Capturing Context and Semantics: N-grams help us understand how words work together in a sentence. By analyzing small word combinations they provide insight into the meaning and flow of language making text interpretation more accurate.
- Improving Language Models: In tools like translation systems or voice assistants N-grams help create smarter models that can better guess what comes next in a sentence, leading to more natural and accurate responses.
- Enhancing Text Prediction: They are widely used in predictive typing. By analyzing the words you've already typed they help suggest what you're likely to type next making writing faster and more intuitive.
- Information Retrieval: When searching for information they helps to find and rank documents by recognizing important word patterns. This makes search engines more effective at delivering relevant results.
Implementation of N-grams
- text.split(): Splits the text into a list of words (tokens).
- [tuple(tokens[i:i + n]) for i in range(len(tokens) - n + 1)]: Generates n-grams by creating tuples of consecutive words.
- return ngrams: Returns the list of generated n-grams.
def generate_ngrams(text, n):
    tokens = text.split()
    ngrams = [tuple(tokens[i:i + n]) for i in range(len(tokens) - n + 1)]
    return ngrams
text = "Geeks for Geeks Community"
unigrams = generate_ngrams(text, 1)
bigrams = generate_ngrams(text, 2)
trigrams = generate_ngrams(text, 3)
print("Unigrams:", unigrams)
print("Bigrams:", bigrams)
print("Trigrams:", trigrams)
Output
Unigrams: [('Geeks',), ('for',), ('Geeks',), ('Community',)]
Bigrams: [('Geeks', 'for'), ('for', 'Geeks'), ('Geeks', 'Community')]
Trigrams: [('Geeks', 'for', 'Geeks'), ('for', 'Geeks', 'Community')]
Laplace Smoothing for N-grams
When working with N-grams, one of the major challenges is data sparsity especially with higher-order N-grams like 4-grams or 5-grams. As the value of N increases the number of possible N-grams grows exponentially and many of them may not appear in the training data resulting in zero probabilities for unseen sequences.
To resolve this we use Laplace Smoothing also known as Additive Smoothing. It adds a constant (typically 1) to each count ensuring that no N-gram has a zero probability even if it was not seen in the training set.
The formula for Laplace smoothing is follows:
Where
- count is the frequency of a particular N-gram in dataset.
- total N-grams is the number of N-grams in the dataset.
- vocab size is the total number of unique words.
This formula ensures that even N-grams that never appeared in the training data will have a non-zero probability.
Code Example for Laplace Smoothing:
- Counter(ngrams): Counts the occurrences of each n-gram in the list.
- {ngram: (count + 1) / (len(ngrams) + vocab_size) for ngram, count in ngram_counts.items()}: Applies Laplace smoothing by adding 1 to each count and normalizing it with the total number of n-grams and vocabulary size.
- return smoothed_ngrams: Returns the dictionary of smoothed n-grams.
from collections import Counter
def laplace_smoothing(ngrams, vocab_size):
    ngram_counts = Counter(ngrams)
    smoothed_ngrams = {ngram: (count + 1) / (len(ngrams) + vocab_size)
                       for ngram, count in ngram_counts.items()}
    return smoothed_ngrams
ngrams = [('Geeks', 'for'), ('for', 'Geeks'), ('Geeks', 'Community')]
vocab_size = 5
smoothed_ngrams = laplace_smoothing(ngrams, vocab_size)
print("Smoothed N-grams:", smoothed_ngrams)
Output
Smoothed N-grams: {('Geeks', 'for'): 0.25, ('for', 'Geeks'): 0.25, ('Geeks', 'Community'): 0.25}
Comparison Table: N-grams vs. Other NLP models:
Here we would be comparing N-gram models with various other NLP models like HMM, RNN or Transformer-based Models.
| Feature / Aspect | N-gram Models | HMM (Hidden Markov Model) | RNN (Recurrent Neural Network) | Transformer-based Models | 
|---|---|---|---|---|
| Context Window | Fixed-size (N words) | Limited, depends on state transitions | Flexible (remembers previous states) | Very large (Global attention) | 
| Semantic Understanding | Very limited | Weak | Moderate | Good | 
| Data Efficiency | Good with small data | Good with small data | Needs more data | Needs large data | 
| Speed and Simplicity | Fast and simple | Moderate | Slower than N-grams | Slow | 
| Interpretability | Easy to understand | Moderate | Hard to interpret | Black-box | 
| Use Cases | Basic NLP tasks | POS tagging, sequence labeling | Language modeling, sequence labeling | Translation, summarization, QA | 
Applications of N-grams
- Language Modelling: They predict the next word in a sentence based on the previous words helping generate relevant text in tasks like text generation, chatbots and autocomplete systems.
- Text Prediction: In predictive typing they suggest the next word based on recent input, improving typing speed and user experience in apps like mobile keyboards and messaging tools.
- Sentiment and Text Classification: N-grams capture word sequences to classify text into categories or sentiments making it easier to identify tone and topics like sports or politics.
- Plagiarism Detection: By comparing N-grams in documents systems can spot similar patterns helping detect copied or reworded content.
- Speech Recognition: In speech-to-text systems they predict the next word hence enhancing transcription accuracy with contextually correct sequences.
Advantages of N-grams in NLP
- Simple and Easy to Implement: They are simple to understand and implement and they require minimal computational resources. They are suitable for baseline modeling and quick prototyping.
- Low Computational Overhead: They are computationally lightweight and easy to scale when compared to neural approaches which makes them suitable for systems with limited processing power or for tasks which require rapid prototyping.
- Preservation of Local Word Order: They capture short-range dependencies between words by preserving their immediate sequence which is beneficial in modeling syntactic and patterns such as negation ("not good") or phrasal constructs ("New York City").
- Strong Baseline Performance: They are simple yet they often provide competitive baselines for a range of tasks including text classification, sentiment analysis, information retrieval and topic detection.
Challenges and Limitations
Despite their benefits N-grams also has some challenges like:
- Data sparsity: With larger N-grams it becomes less likely to find repeated instances of the same sequence leading to sparse data.
- Lack of semantic understanding: While N-grams are good at recognizing patterns they lack the understanding of context beyond the sequences they were trained on.
- Lack of long-range context: They only consider nearby words and ignore broader sentence meaning.
