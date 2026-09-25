# Music Recommendation System Using Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/music-recommendation-system-using-machine-learning/

When did we see a video on youtube let's say it was funny then the next time you open your youtube app you get recommendations of some funny videos in your feed ever thought about how? This is nothing but an application of Machine Learning using which recommender systems are built to provide personalized experience and increase customer engagement.
In this article, we will walk through the process of building a content-based music recommendation system using machine learning. The system recommends songs similar to a given input song based on metadata such as genre, artist name and track name. We will use the "TCC CEDs Music Dataset" which contains metadata about songs, including their genres, artists and lyrics.
Step 1: Importing Libraries & Dataset
Python libraries make it very easy for us to handle the data and perform typical and complex tasks with a single line of code.
- Pandas- This library helps to load the data frame in a 2D array format and has multiple functions to perform analysis tasks in one go.
- Numpy - Numpy arrays are very fast and can perform large computations in a very short time.
- Matplotlib/Seaborn - This library is used to draw visualizations.
- Sklearn - This module contains multiple libraries having pre-implemented functions to perform tasks from data preprocessing to model development and evaluation.
import pandas as pd
import numpy as np
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
import matplotlib.pyplot as plt
import seaborn as sns
The dataset we are going to use contains data about songs released in the span of around 100 years. Along with some general information about songs some scientific measures of sound are also provided like loudness, acoustics, speechiness, and so on.
data = pd.read_csv('/content/tcc_ceds_music.csv')  
data.head()
Output:
Step 2: Exploratory Data Analysis (EDA)
Before building the recommendation system, we perform exploratory data analysis (EDA) to gain insights into the dataset.
Distribution of Songs by Genre
We visualize the top 10 genres in the dataset to understand the diversity of songs.
plt.figure(figsize=(10, 6))
sns.countplot(y='genre', data=data, order=data['genre'].value_counts().index[:10])
plt.title('Top 10 Genres')
plt.xlabel('Count')
plt.ylabel('Genre')
plt.show()
Output:
Top Artists by Song Count
We identify the most popular artists based on the number of songs they have in the dataset.
top_artists = data.groupby('artist_name').size().sort_values(ascending=False).head(10)
plt.figure(figsize=(10, 6))
sns.barplot(x=top_artists.values, y=top_artists.index, palette='viridis')
plt.title('Top 10 Artists by Number of Songs')
plt.xlabel('Number of Songs')
plt.ylabel('Artist Name')
plt.show()
Output:
Step 3: Preprocessing the Data
To build the recommendation system, we preprocess the data by combining relevant features and converting them into numerical vectors.
Combine Features
We concatenate the genre, artist_name, and track_name columns into a single feature called combined_features. 
data['combined_features'] = (
    data['genre'].fillna('') + ' ' +
    data['artist_name'].fillna('') + ' ' +
    data['track_name'].fillna('')
)
Vectorize Text Data
We use TF-IDF Vectorization to convert the combined features into numerical vectors.
tfidf = TfidfVectorizer(stop_words='english')
tfidf_matrix = tfidf.fit_transform(data['combined_features'])
Compute Similarity Scores
We compute the cosine similarity between songs based on their vectorized features.
cosine_sim = cosine_similarity(tfidf_matrix, tfidf_matrix)
def get_recommendations(song_title, data, cosine_sim, top_n=10):
    # Get the index of the song that matches the title
    idx = data[data['track_name'] == song_title].index
    if len(idx) == 0:
        print("Song not found in the dataset.")
        return
    
    idx = idx[0]
    sim_scores = list(enumerate(cosine_sim[idx]))
    sim_scores = sorted(sim_scores, key=lambda x: x[1], reverse=True)
    sim_scores = sim_scores[1:top_n+1]  
    song_indices = [i[0] for i in sim_scores]
    recommendations = data.iloc[song_indices]
    return recommendations
Explanation :
- The function retrieves the index of the input song.
- It computes similarity scores for all songs and sorts them in descending order.
- It returns the top-N most similar songs.
Step 4: Generate Recommendations
We use the get_recommendations function to recommend songs similar to a specific input song (e.g., 'cry').
recommended_songs = get_recommendations('cry', data, cosine_sim, top_n=10)
print(recommended_songs[['track_name', 'artist_name', 'genre']])
Output:
Step 5: Visualize Recommendations
Finally, we visualize the recommended songs using a bar chart.
plt.figure(figsize=(10, 6))
sns.barplot(y='track_name', x='artist_name', data=recommended_songs, palette='coolwarm')
plt.title('Recommended Songs Similar to "Cry"')
plt.xlabel('Artist Name')
plt.ylabel('Song Name')
plt.show()
Output:
Although this model requires a lot of changes before it can be used in any real-world music app or website. But this is just an overview of how recommendation systems are built and used.
Dataset Link : click here
Google Colab : click here
