# Bag of words (BoW) model in NLP

> Source: https://www.geeksforgeeks.org/nlp/bag-of-words-bow-model-in-nlp/

In Natural Language Processing (NLP), text data must be converted into numerical form so that machine learning algorithms can process it. The Bag of Words (BoW) model is a simple and commonly used method for this purpose.
- Converts text (sentence, paragraph, or document) into a collection of words
- Counts how often each word appears in the text
- Ignores word order and grammar, focusing only on frequency
Key Components
- Vocabulary: It is a list of all unique words from the entire dataset. Each word in the vocabulary corresponds to a feature in the model.
- Document Representation: Each document is represented as a vector where each element shows the frequency of the words from the vocabulary in that document. The frequency of each word is used as a feature for the model.
Implementation
Let's see how to implement the BoW model using Python. Here we will be using NLTK, Heapq, Matplotlib, Word cloud, Numpy and Seaborn libraries for this implementation.
Step 1: Preprocessing the Text
Before applying the BoW model, we need to preprocess the text. This includes:
- Converting the text to lowercase
- Removing non-word characters
- Removing extra spaces
import nltk
import re
import pandas as pd
from nltk.corpus import stopwords
text = """Beans. I was trying to explain to somebody as we were flying in, that's corn.
         That's beans. And they were very impressed at my agricultural knowledge. 
         Please give it up for Amaury once again for that outstanding introduction. 
         I have a bunch of good friends here today, including somebody who I served with, 
         who is one of the finest senators in the country, and we're lucky to have him, 
         your Senator, Dick Durbin is here. I also noticed, by the way, 
         former Governor Edgar here, who I haven't seen in a long time, and 
         somehow he has not aged and I have. And it's great to see you, Governor. 
         I want to thank President Killeen and everybody at the U of I System for 
         making it possible for me to be here today. And I am deeply honored at the Paul 
         Douglas Award that is being given to me. He is somebody who set the path for so 
         much outstanding public service here in Illinois. Now, I want to start by 
         addressing the elephant in the room. I know people are still wondering why 
         I didn't speak at the commencement."""
dataset = nltk.sent_tokenize(text)
for i in range(len(dataset)):
    dataset[i] = dataset[i].lower()
    dataset[i] = re.sub(r'\W', ' ', dataset[i])
    dataset[i] = re.sub(r'\s+', ' ', dataset[i])
for i, sentence in enumerate(dataset):
    print(f"Sentence {i+1}: {sentence}")
Output:
Step 2: Counting Word Frequencies
In this step, we count the frequency of each word in the preprocessed text. We will store these counts in a pandas DataFrame to view them easily in a tabular format.
- We initialize a dictionary to hold our word counts.
- Then, we tokenize each sentence into words.
- For each word, we check if it exists in our dictionary. If it does, we increment its count. If it doesn’t, we add it to the dictionary with a count of 1.
word2count = {}
for data in dataset:
    words = nltk.word_tokenize(data)
    for word in words:
        if word not in word2count:
            word2count[word] = 1
        else:
            word2count[word] += 1
stop_words = set(stopwords.words('english'))
filtered_word2count = {word: count for word, count in word2count.items() if word not in stop_words}
word_freq_df = pd.DataFrame(list(filtered_word2count.items()), columns=['Word', 'Frequency'])
word_freq_df = word_freq_df.sort_values(by='Frequency', ascending=False)
print(word_freq_df)
Output:
Step 3: Selecting the Most Frequent Words
Now that we have counted the word frequencies, we will select the top N most frequent words (e.g top 10) to be used in the BoW model. We can visualize these frequent words using a bar chart to understand the distribution of words in our dataset.
import heapq
import matplotlib.pyplot as plt
freq_words = heapq.nlargest(10, word2count, key=word2count.get)
print(f"Top 10 frequent words: {freq_words}")
top_words = sorted(word2count.items(), key=lambda x: x[1], reverse=True)[:10]
words, counts = zip(*top_words)
plt.figure(figsize=(10, 6))
plt.bar(words, counts, color='skyblue')
plt.xticks(rotation=45)
plt.title('Top 10 Most Frequent Words')
plt.xlabel('Words')
plt.ylabel('Frequency')
plt.show()
Output:
Step 4: Building the Bag of Words (BoW) Model
Now we will build the Bag of Words (BoW) model. This model is represented as a binary matrix where each row corresponds to a sentence and each column represents one of the top N frequent words. A 1 in the matrix shows that the word is present in the sentence and a 0 shows its absence.
We will use a heatmap to visualize this binary matrix where green shows the presence of a word (1) and red shows its absence (0).
import numpy as np
import seaborn as sns
X = []
for data in dataset:
    vector = []
    for word in freq_words:
        if word in nltk.word_tokenize(data):
            vector.append(1)
        else:
            vector.append(0)
    X.append(vector)
X = np.asarray(X)
plt.figure(figsize=(10, 6))
sns.heatmap(X, cmap='RdYlGn', cbar=False, annot=True, fmt="d", xticklabels=freq_words, yticklabels=[f"Sentence {i+1}" for i in range(len(dataset))])
plt.title('Bag of Words Matrix')
plt.xlabel('Frequent Words')
plt.ylabel('Sentences')
plt.show()
Output:
Step 5: Visualizing Word Frequencies with a Word Cloud
Finally, we can create a Word Cloud to visually represent the word frequencies. In a word cloud, the size of each word is proportional to its frequency which makes it easy to identify the most common words at a glance.
from wordcloud import WordCloud
wordcloud = WordCloud(width=800, height=400, background_color='white').generate_from_frequencies(word2count)
plt.figure(figsize=(10, 6))
plt.imshow(wordcloud, interpolation='bilinear')
plt.axis("off")
plt.title("Word Cloud of Frequent Words")
plt.show()
Output:
Advantages
- Simplicity: It is easy to implement and computationally efficient.
- Versatility: It can be used for various NLP tasks such as text classification, sentiment analysis and document clustering.
- Interpretability: The resulting vectors are interpretable which makes it easy to understand which words are most important in a document.
Limitations
- Loss of Context: It ignores word order and context which means it might miss important relationships between words.
- Sparsity: When working with large datasets, most word vectors will be sparse (containing mostly zeros) which can lead to inefficiency.
- Limited Semantic Understanding: The model doesn’t capture the meaning of words which can be important for some NLP tasks.
