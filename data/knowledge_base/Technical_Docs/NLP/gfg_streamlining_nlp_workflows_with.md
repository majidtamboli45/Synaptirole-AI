# Streamlining NLP Workflows with Python

> Source: https://www.geeksforgeeks.org/nlp/introduction-to-pynlpl-streamlining-nlp-workflows-with-python/

The pyNLPl library, also known as pineapple, is an advanced Python library for Natural Language Processing (NLP). It offers a wide range of functionalities, from handling and analyzing texts to processing them, making it a valuable tool for NLP engineers. This library can perform simple NLP tasks, such as extracting n-grams, as well as advanced tasks, such as building a simple language model. Additionally, it includes advanced data types and algorithms, making it suitable for working with large text datasets.
In this article, we will first explore the benefits of using the pyNLPl library and the modules it provides. Then, we will cover how to install this library on our systems. Next, we will understand tasks such as tokenization and obtaining linguistic statistics. By the end of this article, you will be able to use the pyNLPl library in your projects.
Understanding PyNLP
The pyNLPl library offers a range of features that make it an excellent choice for NLP projects, potentially eliminating the need for multiple other libraries. Here are a few benefits of using the pyNLPl library:
- pyNLPl provides a streamlined workflow, allowing us to easily iterate through various models and techniques. This enables quick model development and optimization without spending excessive time on it.
- The library simplifies the complexity of NLP tasks. It allows for easy execution of tasks like tokenization, text preprocessing, and statistics extraction with minimal code.
- pyNLPl has a modular design, making it highly extensible. This means we can easily integrate custom modules and other libraries into pyNLPl, allowing us to leverage additional functionalities.
- pyNLPl provides a consistent interface for all tasks, making it easier to learn and understand the code. This consistency reduces the time and effort required to familiarize oneself with the code.
Now let’s explore a few main modules of the pyNLPl library:
- pynlpl.formats.folia: This is an extensive module, which is used for reading and manipulating documents in FoLiA format. FoLiA is a document format used for Linguistic Annotations.
- pynlpl.formats.fql: This module is built on top of the folio module. This module is used for FoLiA Query Language(FQL).
- pynlpl.datatypes: This module gives additional data types like patterns, tries, and priority queues.
- pynlpl.lm.lm: This module is used to build a simple language model and also to read ARPA language model data.
- pynlpl.evaluation: This module is used for evaluating our simple language model. It has parameters like a confusion matrix, class evaluation, and many more.
- pynlpl.statistics: This module is used for creating frequency lists, computing Levenshtein distance, and getting some common linguistic statistics. We will learn how to execute these all in the upcoming sections.
- pynlpl.formats.moses: This module is used for reading Moses phrase-translation tables.
- pynlpl.search: This module has various searching algorithms such as Breadth-first search, depth-first search, hill climbing, etc.
- pynlpl.textprocessors: Using this model we can create a tokenizer and we can extract n-grams from sentences. We will see how to implement this in the next section.
Installation
Here are the few different ways to install pyNLPl library:
Via Terminal/Command Prompt
pip install pynlpl
Example - Streamlining NLP Workflows with Python
Now let’s see how to perform different NLP tasks using the pyNLPl library:
Tokenization
Tokenization is an important step when building chatbots or any generative AI applications. In this step, we split a large paragraph into sentences or words. This step allows us to handle data more efficiently. Now let’s see how to perform this task using pyNLPl library.
We will first import the necessary modules such as `Tokenizer` from pynlpl.textprocessors and `StringIO` from `io`. Then we will add a string into a variable named 'text'. We will then convert this string into a stream using the `StringIO` function. Then, we create a `Tokenizer` object with this stream as input. For each sentence in the tokenizer, we will iterate over its tokens and add them to our 'tokens' list. At the end, we will print our 'tokens' list, which will contain all the tokens from our original text.
from pynlpl.textprocessors import Tokenizer
from io import StringIO
text = "Hello, world! This is a GeeksForGeeks."
stream = StringIO(text)
tokenizer = Tokenizer(stream)
tokens = []
for sentence in tokenizer:
    for token in sentence:
        tokens.append(token)
print("Tokens:", tokens)
Output:
Tokens: [['Hello', ',', 'world', '!'], ['This', 'is', 'a', 'GeeksForGeeks', '.']]
ngrams
N-grams are continuous sequences of n-words from a sentence. They are widely used in NLP and computational linguistics. A unigram consists of a single word, a bigram is a pair of consecutive words, and a trigram is a sequence of three consecutive words. Using n-grams, our model can understand the context of a sentence, which is very important for tasks like language modeling.
Now, let's see how to generate n-grams using the pyNLPl library. We will first import the necessary module, like `Windower` from `pynlpl.textprocessors`. Then, we will define a string and split it into tokens. We will set `n` to be 2, which means we want to generate bigrams. After that, we will create a `Windower` object, passing our tokens and `n` as arguments. The `Windower` object will generate n-grams from the tokens. Finally, we will print the generated n-grams.
from pynlpl.textprocessors import Windower
text = "This is a example of ngrams."
tokens = text.split()
n = 2  # size of n-grams
windower = Windower(tokens, n)
ngrams = list(windower)
print(f"{n}-grams:")
print(ngrams)
Output:
2-grams:
[('<begin>', 'This'), ('This', 'is'), ('is', 'a'), ('a', 'example'), ('example', 'of'), ('of', 'ngrams.'), ('ngrams.', '<end>')]
Statistics
FrequencyList
We can use the `FrequencyList` function of the statistics module to count the frequency of words in a list. This is useful in NLP tasks like identifying the most common words in a dataset. Here’s how to use this function:
We will first import the `FrequencyList` function from `pynlpl.statistics`. Then, we will create a list of strings. We will then create a `FrequencyList` object, passing our list as an argument. This object will compute the frequency of each unique token in our list. To display the frequency of each token, we will iterate over our `FrequencyList` object and print each token and its corresponding count. Additionally, we can get the total number of tokens and the frequency of a specific token by accessing the `total` attribute and using indexing, respectively. Finally, we can use the save function to save the list in a text file.
from pynlpl.statistics import FrequencyList
tokens = ["apple", "banana", "apple", "orange", "banana", "banana"]
freq_list = FrequencyList(tokens)
for token, count in freq_list:
    print(f"{token}: {count}")
print("Total tokens:", freq_list.total)
print("Frequency of 'banana':", freq_list["banana"])
freq_list.save("frequency_list.txt")
Output:
banana: 3
apple: 2
orange: 1
Total tokens: 6
Frequency of 'banana': 3
Computing Levenshtein Distance
In NLP, Levenshtein distance measures the minimum number of single-character edits required to change one string into another. This can include insertions, deletions, or substitutions. Here’s how to calculate the Levenshtein distance using the pyNLPl library:
We will first import the `levenshtein` function from the `pynlpl.statistics` module. We will then define two strings, 'kitten' and 'sitting', and compute the Levenshtein distance between them using the `levenshtein` function. We will print the result.
from pynlpl.statistics import levenshtein
s1 = "kitten"
s2 = "sitting"
distance = levenshtein(s1, s2)
print(f"Levenshtein distance between '{s1}' and '{s2}': {distance}")
Output:
Levenshtein distance between 'kitten' and 'sitting': 3
Conclusion
In this article, we have explored the features and significance of the pyNLPl library. We have covered the main modules it offers, learned how to install the library, and executed various NLP tasks such as tokenization, generating n-grams, and performing statistical calculations. With this basic understanding of pyNLPl, you are now equipped to utilize it in your next NLP project.
