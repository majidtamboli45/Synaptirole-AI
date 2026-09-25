# A Framework for NLP

> Source: https://www.geeksforgeeks.org/nlp/flair-a-framework-for-nlp/

FLAIR is a simple and powerful Python library for natural language processing (NLP). It helps you perform tasks like Named Entity Recognition, Part of Speech tagging and text classification using pre trained models and embeddings. With its easy to use interface and support for multiple languages FLAIR makes it quick to build smart NLP applications.
Key Features
- Contextual String Embeddings: FLAIR uses character level language models to produce context sensitive word representations. This means the same word can have different embeddings depending on its context, improving model understanding.
- Stackable Embeddings: You can combine multiple embeddings like GloVe, BERT, ELMo and Flair’s own embeddings. This flexibility helps boost model performance across diverse NLP tasks.
- Pre trained Models: FLAIR offers a wide range of ready to use models for NER, POS tagging, text classification in many languages. This saves time and effort in model training.
- Easy Model Training and Fine tuning: You can train your own models with just a few lines of code. It supports custom datasets making it ideal for domain specific or low resource NLP projects.
How to Install FLAIR?
You should have PyTorch >=1.1 and Python >=3.6 installed. To install PyTorch on anaconda run the below command:
conda install -c pytorch pytorch
pip install flair
Implementation
1. Flair Datatypes
Flair offers two types of objects:
- Sentence
- Tokens
import flair
from flair.data import Sentence
s= Sentence('GeeksforGeeks is Awesome.')
print(s)
Output:
Sentence: "GeeksforGeeks is Awesome ." [- Tokens: 4]
2. NER Tags
- This code uses the Flair NLP library to perform Named Entity Recognition (NER) on a given sentence.
- It loads a pre trained NER tagger applies it to the sentence and prints the detected named entities along with their labels and confidence scores.
import flair
from flair.data import Sentence
from flair.models import SequenceTagger
s = Sentence('GeeksforGeeks is Awesome.')
tagger_NER= SequenceTagger.load('ner')
tagger_NER.predict(s)
print(s)
print('The following NER tags are found:\n')
for entity in s.get_spans('ner'):
    print(entity)
Output:
3. Word Embeddings
Word embeddings give embeddings for each word of the text. As discussed earlier Flair supports many word embeddings including its own Flair Embeddings. Here we will see how to implement some of them.
1. Classic Word Embeddings: This class of word embeddings are static. In this, each distinct word is given only one pre-computed embedding. Most of the common word embeddings lie in this category including the GloVe embedding.
import flair
from flair.data import Sentence
from flair.embeddings import WordEmbeddings
GloVe_embedding = WordEmbeddings('glove')
s = Sentence('Geeks for Geeks helps me study.')
GloVe_embedding.embed(s)
for token in s:
    print(token)
    print(token.embedding)
Output:
Note: You can see here that the embeddings for the word 'Geeks' are the same for both the occurrences.
2. Flair Embedding: This works on the concept of contextual string embeddings. It captures latent syntactic semantic information. The word embeddings are contextualized by their surrounding words thus gives different embeddings for the same word depending on it's surrounding text.
import flair
from flair.data import Sentence
from flair.embeddings import FlairEmbeddings
forward_flair_embedding= FlairEmbeddings('news-forward-fast')
s = Sentence('Geeks for Geeks helps me study.')
forward_flair_embedding.embed(s)
for token in s:
    print(token)
    print(token.embedding)
Output:
Note: Here we see that the embeddings for the word Geeks are different for both the occurrences depending on the contextual information around them.
3. Stacked Embeddings: Using these embeddings you can combine different embeddings together. Let's see how to combine GloVe, forward and backward Flair embeddings:
import flair
from flair.data import Sentence
from flair.embeddings import FlairEmbeddings, WordEmbeddings
forward_flair_embedding= FlairEmbeddings('news-forward-fast')
backward_flair_embedding= FlairEmbeddings('news-backward-fast')
GloVe_embedding = WordEmbeddings('glove')
stacked_embeddings = StackedEmbeddings([forward_flair_embedding,
                                        backward_flair_embedding,
                                        GloVe_embedding,])
s = Sentence('Geeks for Geeks helps me study.')
stacked_embeddings.embed(s)
for token in s:
    print(token)
    print(token.embedding)
    
Output:
4. Document Embeddings:
The document embeddings offered in Flair are:
- Transformer Document Embeddings
- Sentence Transformer Document Embeddings
- Document RNN Embeddings
- Document Pool Embeddings
For Example : Let us do Document Pool Embeddings which is a very simple document embedding and it pooled over all the word embeddings and returns the average of all of them.
import flair
from flair.data import Sentence
from flair.embeddings import WordEmbeddings, DocumentPoolEmbeddings
GloVe_embedding = WordEmbeddings('glove')
doc_embeddings = DocumentPoolEmbeddings([GloVe_embedding])
s = Sentence('Geeks for Geeks helps me study.')
doc_embeddings.embed(s)
print(s.embedding)
Output:
5. Training a Text Classification Model using Flair:
Step 1: Train the Model
- We are going to use the 'TREC_6' dataset available in Flair. You can also use your own datasets as well.
- To train our model we will be using the Document RNN Embeddings which trains an RNN over all the word embeddings in a sentence. The word embeddings which we will be using are the GloVe and the forward flair embedding.
from flair.data import Corpus
from flair.datasets import TREC_6
from flair.embeddings import WordEmbeddings, FlairEmbeddings, DocumentRNNEmbeddings
from flair.models import TextClassifier
from flair.trainers import ModelTrainer
corpus = TREC_6()
label_Dictionary = corpus.make_label_dictionary()
word_embeddings = [WordEmbeddings('glove'),FlairEmbeddings('news-forward-fast')]
doc_embeddings = DocumentRNNEmbeddings(word_embeddings,hidden_size = 250)
text_classifier = TextClassifier(doc_embeddings,label_dictionary = label_Dictionary)
model_trainer = ModelTrainer(text_classifier,corpus)
model_trainer.train('resources/taggers/trec',learning_rate=0.1,mini_batch_size=40,anneal_factor=0.5,patience=5,max_epochs=200)
Output:
Step 2: Make Predictions
- This code uses the Flair library to load a pre trained text classifier model for question classification.
- It creates a Sentence object with the input text, runs the classifier to predict the question type and then prints the predicted labels for the sentence.
from flair.data import Sentence
from flair.models import TextClassifier
c = TextClassifier.load('resources/taggers/trec/final-model.pt')
s = Sentence('Who is the President of India ?')
c.predict(s)
print(s.labels)
Output:
[HUM (1.0)]
Applications
- Named Entity Recognition (NER): NER is the process of locating and classifying key information (entities) in text into predefined categories such as people, organizations, locations, dates and more.
- Part of Speech (POS) Tagging: POS tagging involves assigning each word in a sentence a grammatical category such as noun, verb, adjective etc. This helps machines understand the syntactic structure of sentences and is often a foundational step for other NLP tasks.
- Text Classification: Text classification categorizes text into predefined labels such as sentiment, topic or intent. It is widely used in sentiment analysis, email filtering and content moderation to automatically organize and interpret large amounts of text data.
- Dependency Parsing: Dependency parsing analyzes the grammatical structure of a sentence by establishing relationships between head words and their dependents.
