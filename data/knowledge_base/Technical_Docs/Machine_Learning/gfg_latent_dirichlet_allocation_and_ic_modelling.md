# Latent Dirichlet Allocation and ic Modelling

> Source: https://www.geeksforgeeks.org/machine-learning/latent-dirichlet-allocation-and-topic-modelling/

Topic modelling is an NLP technique used to find hidden topics in large text collections. Latent Dirichlet Allocation (LDA) is a popular topic modeling method that groups documents based on similar word patterns without using labelled data.
- LDA is an unsupervised probabilistic model.
- Each document is represented as a mixture of topics.
- Each topic is represented as a distribution of words.
Components of Latent Dirichlet Allocation(LDA)
Probabilistic Generative Model
LDA assumes that each document is generated using a two-step random process:
- For each document, sample a distribution over topics (using a Dirichlet prior).
- For each word in the document, sample a topic from the document’s topic distribution, then sample a word from the selected topic’s word distribution.
Role of Dirichlet Distributions
The model uses Dirichlet distributions in two places:
- To model the diversity of topic proportions for each document (parameter α).
- To model the diversity of word proportions for each topic (parameter β).
LDA as a Mixture Model
Each document is viewed as a random mixture of topics and each topic as a mixture over words. For example, an article about sports might be a combination of topics like “teams,” “games,” and “scores.” LDA discovers these topics based on patterns in word usage across the corpus.
Bayesian Inference in LDA
LDA uses Bayesian inference to "reverse engineer" the hidden topics from the observed words in documents. Techniques like Gibbs sampling or variational Bayes are used to estimate the latent variables:
- The topic proportions in each document.
- The word probabilities in each topic.
Key Model Parameters
- \alpha : Controls per-document topic diversity (high α means documents have many topics).
- \beta : Controls per-topic word diversity (high β means topics use many different words).
Step-by-Step Implementation
Let's see the implementation of LDA topic modeling pipeline,
Step 1: Install and Import libraries
We install and import the required libraries,
- pandas: Loads, manipulates and inspects tabular data.
- numpy: Enables efficient numerical computations; sometimes useful for arrays.
- string: Helps remove punctuation during text cleaning.
- spacy: Processes text (tokenizes, tags, lemmatizes) for NLP tasks.
- nltk: Supplies English stopwords and other language tools.
- gensim: Performs topic modeling and creates bag-of-words matrices.
- matplotlib.pyplot: Creates charts and plots for data visualization.
!pip install --upgrade gensim pyLDAvis spacy pandas scikit-learn
import spacy.cli
spacy.cli.download("en_core_web_md")
import pandas as pd
import string
import spacy
import nltk
import gensim
from gensim import corpora
from gensim.models import CoherenceModel
import pyLDAvis.gensim_models as gensimvis
import pyLDAvis
from nltk.corpus import stopwords
import en_core_web_md
nltk.download('wordnet')
nltk.download('stopwords')
Step 2: Load Data
We load the dataset for operations,
- pd.read_csv('/content/mock_yelp.csv'): Loads Yelp-style reviews from a CSV into a pandas DataFrame.
- print(len(yelp_review)), groupby('business_id'): Quickly checks how many reviews, unique businesses and users are present.
yelp_review = pd.read_csv('/content/mock_yelp.csv')
print("Number of reviews:", len(yelp_review))
print("Unique businesses:", len(yelp_review.groupby('business_id')))
print("Unique users:", len(yelp_review.groupby('user_id')))
Output:
number of reviews:10 
Unique Business:5 
Unique User:5 
Step 3: Preprocess Text
3.1 Clean text: clean_text(text): Removes punctuation and digits, lowercases text and discards short/non-informative words. Ensures input text is standardized for modeling.
def clean_text(text):
    delete_dict = {sp_char: '' for sp_char in string.punctuation}
    delete_dict[' '] = ' '
    table = str.maketrans(delete_dict)
    text1 = text.translate(table)
    textArr = text1.split()
    text2 = ' '.join([w for w in textArr if not w.isdigit() and len(w) > 3])
    return text2.lower()
yelp_review['text'] = yelp_review['text'].apply(clean_text)
yelp_review['Num_words_text'] = yelp_review['text'].apply(
    lambda x: len(str(x).split()))
3.2 Remove Stopwards:
- Calls to nltk.download('stopwords') and stopwords.words('english'): Retrieves an extensive list of English stopwords.
- remove_stopwords(text): Filters these stopwords from reviews so only content-rich words remain.
stop_words = stopwords.words('english')
def remove_stopwords(text):
    textArr = text.split(' ')
    rem_text = " ".join([i for i in textArr if i not in stop_words])
    return rem_text
yelp_review['text'] = yelp_review['text'].apply(remove_stopwords)
3.3 Lemmatization(nouns, adjectives):
- spacy.cli.download("en_core_web_md"): Downloads spaCy’s medium English model with vocabulary and grammatical info.
- en_core_web_md.load(disable=['parser', 'ner']): Loads the model for fast lemmatization, ignoring other NLP features to speed up code.
- lemmatization(texts, allowed_postags=['NOUN', 'ADJ']): Converts all reviews into lists of base-form words (lemmas), only keeping nouns and adjectives, which are most useful for discovering themes.
nlp = en_core_web_md.load(disable=['parser', 'ner'])
def lemmatization(texts, allowed_postags=['NOUN', 'ADJ']):
    output = []
    for sent in texts:
        doc = nlp(sent)
        output.append(
            [token.lemma_ for token in doc if token.pos_ in allowed_postags])
    return output
text_list = yelp_review['text'].tolist()
tokenized_reviews = lemmatization(text_list)
Step 4: Create Document-Term Matrix
We create the Document-Term Matrix,
- corpora.Dictionary(tokenized_reviews): Creates an ID-to-word mapping from tokenized reviews.
- [dictionary.doc2bow(rev) for rev in tokenized_reviews]: Builds a bag-of-words matrix needed for LDA input.
dictionary = corpora.Dictionary(tokenized_reviews)
if len(dictionary) > 0:
    doc_term_matrix = [dictionary.doc2bow(rev) for rev in tokenized_reviews]
else:
    doc_term_matrix = []
Step 5: Fit LDA Model
We prepare the LDA Model,
- Instantiates LdaModel from gensim using the corpus and dictionary.
- Parameters like num_topics, passes and iterations control how many topics to find and how thoroughly to search for them.
- print(lda_model.print_topics()): Outputs the top words and their weights for each detected topic.
if doc_term_matrix:
    LDA = gensim.models.ldamodel.LdaModel
    lda_model = LDA(
        corpus=doc_term_matrix,
        id2word=dictionary,
        num_topics=10,
        random_state=100,
        chunksize=1000,
        passes=50,
        iterations=100
    )
    print(lda_model.print_topics())
else:
    print("Document term matrix is empty, cannot build LDA model.")
Output:
Step 6: Model Evaluation
We evaluate the results of model,
- lda_model.log_perplexity(...): Measures how well the model fits the data (lower is better for perplexity).
- CoherenceModel(...): Calculates topic coherence, indicating the interpretability and meaningfulness of the topics (higher is better).
total_docs = len(doc_term_matrix)
if total_docs > 0:
    print('\nPerplexity:', lda_model.log_perplexity(
        doc_term_matrix, total_docs=total_docs))
    coherence_model_lda = CoherenceModel(
        model=lda_model,
        texts=tokenized_reviews,
        dictionary=dictionary,
        coherence='c_v'
    )
    coherence_lda = coherence_model_lda.get_coherence()
    print('Coherence:', coherence_lda)
else:
    print("No documents to evaluate coherence or perplexity.")
Output:
Perplexity:  -5.0528945582253595 
Coherence:  0.48202029896063986
Step 7: Visualize
- pyLDAvis.gensim_models.prepare(...): Prepares topic and term distributions for visualization using LDA results.
- pyLDAvis.enable_notebook(): Ensures the visualization will display interactively in Colab/Jupyter.
- vis_data: Containing the topic maps and relevance charts for interactive exploration.
if total_docs > 0:
    pyLDAvis.enable_notebook()
    vis_data = gensimvis.prepare(lda_model, doc_term_matrix, dictionary)
    vis_data
    pyLDAvis.save_html(vis_data, 'lda_visualization.html')
else:
    print("No documents for visualization.")
Output:
The result can also be download from here.
Applications
- Automatically groups similar documents such as news articles, reviews and research papers based on common topics.
- Recommends related articles, books, products or videos by identifying topic similarity.
- Helps summarize large collections of text by highlighting important topics and keywords.
- Improves search systems by finding documents based on topic relevance instead of only exact keywords.
Advantages
- Produces understandable topics with important related words.
- Works efficiently on large collections of text data.
- Can be used in different domains like text analysis, genetics, and image processing.
- Helps improve personalized recommendations based on user interests and topic preferences.
Limitations
- Ignores word order and grammar because it uses the bag-of-words approach.
- Some topics may be difficult to understand or may appear too broad or unclear.
- The number of topics must be chosen manually before training.
- Results depend heavily on preprocessing steps like stopword removal and text cleaning.
