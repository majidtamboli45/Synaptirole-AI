# NLP Gensim Tutorial

> Source: https://www.geeksforgeeks.org/nlp/nlp-gensim-tutorial-complete-guide-for-beginners/

Gensim is an open-source Python library used for efficient text processing, topic modeling and vector-space modeling in NLP. It is designed for speed and memory efficiency, making it suitable for handling large text datasets.
- Supports Word2Vec, Doc2Vec and LDA
- Handles large datasets through streaming and incremental training
- Widely used for semantic analysis, topic discovery and text similarity tasks
1. Common Terminologies
Let us understand what some of the below mentioned terms mean before moving forward.
- Corpus: A corpus is a large and structured collection of text documents used for training or analyzing language models.
- Vector: A vector is the numerical representation of text data that helps machines process and understand language.
- Model: A model is a machine learning or statistical algorithm that learns patterns from data for prediction or analysis.
- Topic Modelling: Topic modeling is an unsupervised learning technique used to discover hidden topics within a collection of documents.
- Topic: A topic is a group of related words that frequently appear together and represent a common subject or idea.
2. Installation of NLP Gensim Library
First Install the library using the following command
pip install gensim
Now, import the library and check the version to verify installation.
import gensim
print(gensim.__version__)
3. Create a Corpus from a given Dataset
You need to follow these steps to create your corpus:
- Load your Dataset
- Preprocess the Dataset
- Create a Dictionary
- Create Bag of Words Corpus
3.1 Load your Dataset
You can have a .txt file as your dataset or you can also load datasets using the Gensim Downloader API. Here, we have loaded a text file.
import os
doc = open('sample_data.txt', encoding ='utf-8')
Gensim Downloader API: This is a module available in the Gensim library which is an API for downloading, getting information and loading datasets/models.
import gensim.downloader as api
info_datasets = api.info()
print(info_datasets)
dataset_info = api.info("text8")
dataset = api.load("text8")
word2vec_model = api.load('word2vec-google-news-300')
3.2 Preprocess the Dataset
Text preprocessing is used to clean and prepare text data for NLP tasks. The simple_preprocess() function tokenizes and normalizes the text by converting it into lowercase tokens and removing unwanted characters.
- Cleans and normalizes text data
- Converts text into tokens
- Removes punctuation and special characters
- Returns processed text as a list of tokens
import gensim
import os
from gensim.utils import simple_preprocess
doc = open('sample_data.txt', encoding ='utf-8')
tokenized =[]
for sentence in doc.read().split('.'):
  tokenized.append(simple_preprocess(sentence, deacc = True))
print(tokenized)
Output
3.3 Create a Dictionary
Now we have our preprocessed data which can be converted into a dictionary by using the corpora.Dictionary( ) function. This dictionary is a map for unique tokens.
from gensim import corpora
my_dictionary = corpora.Dictionary(tokenized)
print(my_dictionary)
Output
Saving Dictionary on Disk or as Text File: You can save/load your dictionary on the disk as well as a text file as mentioned below.
my_dictionary.save('my_dictionary.dict')
load_dict = corpora.Dictionary.load('my_dictionary.dict')
from gensim.test.utils import get_tmpfile
tmp_fname = get_tmpfile("dictionary")
my_dictionary.save_as_text(tmp_fname)
load_dict = corpora.Dictionary.load_from_text(tmp_fname)
3.4 Create Bag of Words Corpus
After creating the dictionary, the doc2bow() function is used to create a Bag of Words corpus. It converts words into IDs and counts how many times each word appears in a document.
BoW_corpus =[my_dictionary.doc2bow(doc, allow_update = True) for doc in tokenized]
print(BoW_corpus)
Output
Saving Corpus on Disk: Now, save/load the corpus
from gensim.corpora import MmCorpus
from gensim.test.utils import get_tmpfile
output_fname = get_tmpfile("BoW_corpus.mm")
MmCorpus.serialize(output_fname, BoW_corpus)
load_corpus = MmCorpus(output_fname)
4. Create a TFIDF matrix in Gensim
TF-IDF stands for Term Frequency – Inverse Document Frequency. It is used to identify important words in documents by reducing the importance of commonly occurring words across the corpus.
- Highlights important words in documents
- Reduces the weight of frequently occurring common words
- Helps identify meaningful keywords
- Commonly used in text analysis and information retrieval
4.1 Building a BOW corpus
You can build a TFIDF model using Gensim and the corpus you developed previously as:
from gensim import models
import numpy as np
word_weight =[]
for doc in BoW_corpus:
  for id, freq in doc:
    word_weight.append([my_dictionary[id], freq])
print(word_weight)
Output
4.2 Applying TF-IDF Model
tfIdf = models.TfidfModel(BoW_corpus, smartirs ='ntc')
weight_tfidf =[]
for doc in tfIdf[BoW_corpus]:
  for id, freq in doc:
    weight_tfidf.append([my_dictionary[id], np.around(freq, decimals = 3)])
print(weight_tfidf)  
Output
5. Creating Bigrams and Trigrams with Gensim
Some words frequently appear together and form a different meaning compared to their individual words. Gensim can identify these word combinations using bigrams and trigrams.
- Bigrams: Combination of two words
- Trigrams: Combination of three words
5.1 Loading Dataset using Gensim Downloader API
We will be building bigrams and trigrams using the text8 dataset here which can be downloaded using the Gensim downloader API.
import gensim.downloader as api
from gensim.models.phrases import Phrases
dataset = api.load("text8")
data =[]
for word in dataset:
  data.append(word)
5.2 Building Bigram using Phraser Model
Here, we are building a bigram using Phraser Model.
bigram_model = Phrases(data, min_count = 3, threshold = 10)
print(bigram_model[data[0]])  
5.3 Building Trigram using Phraser Model
To create a Trigram we simply pass the above obtained bigram model to the same function.
trigram_model = Phrases(bigram_model[data], threshold = 10)
print(trigram_model[bigram_model[data[0]]])
Output
6. Create Word2Vec model using Gensim
Machine learning models cannot process text directly, so words must be converted into numerical representations called word embeddings. Unlike CountVectorizer and TF-IDF, Word2Vec preserves relationships between words by mapping them into a vector space.
- Converts words into numerical vectors
- Preserves semantic relationships between words
- Supports mathematical operations on word vectors
- Pre-trained models like Word2Vec, GloVe and FastText can be loaded using Gensim
- Custom Word2Vec models can also be trained on datasets
6.1 Train the model
import gensim.downloader as api
from multiprocessing import cpu_count
from gensim.models.word2vec import Word2Vec
dataset = api.load("text8")
data = []
for word in dataset:
    data.append(word)
data_1 = data[:1200]
data_2 = data[1200:]
w2v_model = Word2Vec(
    data_1,
    min_count=0,
    workers=cpu_count()
)
print(w2v_model.wv['time'])
Output
You can also use the most_similar( ) function to find similar words to a given word.
print(w2v_model.wv.most_similar('time'))
w2v_model.save('Word2VecModel')
model = Word2Vec.load('Word2VecModel')
Output
6.2 Update the model
w2v_model.build_vocab(
    data_2,
    update=True
)
w2v_model.train(
    data_2,
    total_examples=w2v_model.corpus_count,
    epochs=w2v_model.epochs
)
print(w2v_model.wv['time'])
Output
7. Create Doc2Vec model using Gensim
Doc2Vec extends Word2Vec by generating vector representations for entire documents instead of individual words. It helps identify relationships and similarities between documents based on their content.
7.1 Train the model
Load the dataset, Define a function to list the tagged documents, and train the dataset.
import gensim
import gensim.downloader as api
from gensim.models import doc2vec
dataset = api.load("text8")
data =[]
for w in dataset:
  data.append(w)
def tagged_document(list_of_ListOfWords):
  for x, ListOfWords in enumerate(list_of_ListOfWords):
    yield doc2vec.TaggedDocument(ListOfWords, [x])
data_train = list(tagged_document(data))
print(data_train[:1])
Output
7.2 Update the model Code
Initialize the model, build the vocabulary, Train the Doc2Vec model and Analyze the output.
d2v_model = doc2vec.Doc2Vec(vector_size = 40, min_count = 2, epochs = 30)
d2v_model.build_vocab(data_train)
d2v_model.train(data_train, total_examples = d2v_model.corpus_count, epochs = d2v_model.epochs)
Analyze = d2v_model.infer_vector(['violent', 'means', 'to', 'destroy'])
print(Analyze)
Output
8. Topic Modelling
8.1 Illustration of NLP Topic-based Categorization
Topic modeling groups related words into meaningful topics based on their occurrence patterns in documents.
- Topic 1 represents words related to liquids or containers
- Topic 2 represents sports-related words
- Topic 3 represents vehicle-related words
| Topic 1 | Topic 2 | Topic 3 | 
|---|---|---|
| glass | bat | car | 
| cup | racquet | drive | 
| water | score | keys | 
| liquid | game | steering | 
Some of the Topic Modelling Techniques are:
8.2 Topic Modelling using LDA
Latent Dirichlet Allocation (LDA) is a topic modeling technique that treats each document as a mixture of multiple topics. The quality of generated topics depends on text preprocessing, selecting the optimal number of topics and tuning model parameters.
- Identifies hidden topics in documents
- Represents documents as combinations of topics
- Topic quality depends on preprocessing and parameter tuning
8.2.1 Prepare the Data 
Data preparation includes removing stopwords and performing lemmatization before training the LDA model.
- Removes unnecessary stopwords
- Applies lemmatization for word normalization
- Uses Gensim and NLTK for preprocessing tasks
pip install pattern
Now, we will import nltk and key components.
import nltk 
nltk.download('stopwords')
Here, we have pre-processed the data by removing stopwords and lemmatization.
import gensim
from gensim import corpora
from gensim.models import LdaModel, LdaMulticore
import gensim.downloader as api
from gensim.utils import simple_preprocess, lemmatize
import nltk
from nltk.corpus import stopwords
import re
import logging
logging.basicConfig(format ='%(asctime)s : %(levelname)s : %(message)s')
logging.root.setLevel(level = logging.INFO)
stop_words = stopwords.words('english')
stop_words = stop_words + ['subject', 'com', 'are', 'edu', 'would', 'could']
dataset = api.load("text8")
data = [w for w in dataset]
processed_data = []
for x, doc in enumerate(data[:100]):
    doc_out = []
    for word in doc:
        if word not in stop_words: 
            Lemmatized_Word = lemmatize(word, allowed_tags = re.compile('(NN|JJ|RB)'))
            if Lemmatized_Word:
                doc_out.append(Lemmatized_Word[0].split(b'/')[0].decode('utf-8'))
        else:
            continue
    processed_data.append(doc_out) 
print(processed_data[0][:10])
Output
8.2.2 Create Dictionary and Corpus 
The processed data will now be used to create the dictionary and corpus. 
dict = corpora.Dictionary(processed_data)
Corpus = [dict.doc2bow(l) for l in processed_data]
8.2.3 Train LDA model 
We will be training the LDA model with 5 topics using the dictionary and corpus created previously. Here the LdaModel( ) function is used but you can also use the LdaMulticore( ) function as it allows parallel processing. 
LDA_model = LdaModel(corpus = LDA_corpus, num_topics = 5)
LDA_model.save('LDA_model.model')
print(LDA_model.print_topics(-1))
Output
8.2.4 Interpret the Output 
The LDA model majorly gives us information regarding 3 things: 
- Topics in the document
- What topic each word belongs to
- Phi value: Probability of a word to lie in a particular topic. For a given word, sum of the phi values give the number of times that word occurred in the document.
LDA_model.get_term_topics('fire')
bow_list =['time', 'space', 'car']
bow = LDA_model.id2word.doc2bow(bow_list) 
doc_topics, word_topics, phi_values = LDA_model.get_document_topics(bow, per_word_topics = True)
8.3 Topic Modelling using LSI
To create the model with LSI just follow the steps same as with LDA. The only difference will be while training the model. Use the LsiModel( ) function instead of the LdaMulticore( ) or LdaModel( ). We trained the model using LSI and then printed the topics.
LSI_model = LsiModel(corpus = Corpus, id2word = dct, num_topics = 7, decay = 0.5)
print(LSI_model.print_topics(-1))
9. Compute Similarity Matrices
Similarity matrices are used in NLP to measure how closely related two text documents or vectors are. Cosine similarity compares vectors based on the angle between them, while soft cosine similarity also considers relationships between similar words using word embeddings.
- Soft cosine similarity considers semantic similarity between words
- Values closer to 1 indicate higher similarity
- Word embeddings like Word2Vec are used for soft cosine similarity
- Commonly used in text analysis and information retrieval
import gensim.downloader as api
from gensim.similarities import SparseTermSimilarityMatrix, WordEmbeddingSimilarityIndex, SoftCosineSimilarity
from gensim import corpora
s1 = 'Afghanistan is an Asian country and capital is Kabul'.split()
s2 = 'India is an Asian country and capital is Delhi'.split()
s3 = 'Greece is a European country and capital is Athens'.split()
word2vec_model = api.load('word2vec-google-news-300')
documents = [s1, s2, s3]
dictionary = corpora.Dictionary(documents)
corpus = [dictionary.doc2bow(doc) for doc in documents]
similarity_index = WordEmbeddingSimilarityIndex(word2vec_model)
similarity_matrix = SparseTermSimilarityMatrix(similarity_index, dictionary)
soft_cosine_index = SoftCosineSimilarity(corpus, similarity_matrix, num_best=3)
query = dictionary.doc2bow(s1)
similarities = soft_cosine_index[query]
for i, sim in enumerate(similarities):
    print(f"Similarity between s1 and document {sim[0]+1}: {sim[1]:.4f}")
Output
100%|██████████| 14/14 [00:11<00:00, 1.23it/s]Similarity between s1 and document 1: 1.0000
Similarity between s1 and document 2: 0.8372
Similarity between s1 and document 3: 0.7568
Some of the similarity and distance metrics which can be calculated for this word embedding model are mentioned below:
print(
    word2vec_model.wv.doesnt_match(
        ['india', 'bhutan', 'china', 'mango']
    )
)
word2vec_model.wv.distance('man', 'woman')
word2vec_model.wv.distances(
    'king',
    ['queen', 'man', 'woman']
)
word2vec_model.wv.cosine_similarities(
    word2vec_model.wv['queen'],
    [
        word2vec_model.wv['king'],
        word2vec_model.wv['woman']
    ]
)
word2vec_model.wv.words_closer_than(
    w1='queen',
    w2='kingdom'
)
word2vec_model.wv.most_similar(
    positive='king',
    topn=5
)
word2vec_model.wv.most_similar_cosmul(
    positive='queen',
    topn=5
)
10. Text Summarization using Gensim
Gensim provides the summarize() function for automatic text summarization using the TextRank algorithm. It extracts the most important sentences from a document to generate a shorter summary.
- Uses the TextRank summarization technique
- Automatically identifies important sentences
- No need for manual tokenization or sentence splitting
- Useful for summarizing large text documents
from gensim.summarization import summarize, keywords
import os
text = " ".join((l for l in open('sample_data.txt', encoding ='utf-8')))
print(summarize(text, word_count = 25))
Output
11. Extracting Important Keywords from Text
You can get the Important keywords from the paragraph.
print(keywords(text))
Output
Gensim library comes most handy while working on language processing.
