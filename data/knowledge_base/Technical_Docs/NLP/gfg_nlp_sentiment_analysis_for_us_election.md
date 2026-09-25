# NLP Sentiment Analysis for US Election

> Source: https://www.geeksforgeeks.org/nlp/nlp-sentiment-analysis-for-us-election/

Natural Language Processing is a subfield of Artificial Intelligence that enables computers to understand, analyze, and manipulate human language. This article discusses the prediction of U.S. election results based on Sentiment Analysis using tweets.
What is Sentiment Analysis?
Sentiment analysis is a technique through which we can examine a text to figure out the sentiment such as the mood or mentality it represents. This technique is performed on textual data and classifies its sentiment as positive, negative, or neutral to assist businesses in tracking consumer needs and comprehending their needs accordingly.
It is a powerful technique with significant business implications such as predicting election results. We can forecast the outcome of the U.S. election by examining the sentiment behind the significant number of tweets by the general public toward participating candidates in the U.S. election.
Election Sentiment Analysis by Analyzing Tweets
Steps to be followed:
- Importing necessary libraries
- Loading datasets
- Data preprocessing
- Exploratory Data Analysis
- Sentiment Analysis
- Conclusion
Dataset: US Election 2020 Tweets | Kaggle
Dataset features:
- created_at: Date and time of tweet posted
- tweet_id: Tweet's unique ID
- tweet: Full tweet text
- likes: Number of likes
- retweet_count: Number of retweets
- source: Utility used to post the tweet
- user_id: User ID of tweet creator
- user_name: Username of tweet creator
- user_screen_name: Screen name of tweet creator
- user_description: Self-description by tweet creator
- user_join_date: Join date of tweet creator
- user_followers_count: Followers count on tweet creator
- user_location: Address was given on tweeter's profile
- lat: Latitude parsed from user_location
- long: Longitude parsed from user_location
- city: City parsed from user_location
- country: Country parsed from user_location
- state: State parsed from user_location
- state_code: State code parsed from user_location
- collected_at: Date and time tweet data was mined from Twitter
Let's begin with the implementation.
Installing/Importing necessary libraries
Install the following library
!pip install nltk
!pip install wordcloud
!pip install textblob
NLTK downloads
import nltk
nltk.download('omw-1.4')
nltk.download('stopwords')
nltk.download('wordnet')
Importing main libraries:
# Import Libraries
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import plotly.express as px
# Libraries for Sentiment Analysis
import re
import nltk
from nltk.corpus import stopwords
from nltk.corpus import wordnet
from nltk.stem import WordNetLemmatizer
from textblob import TextBlob
from wordcloud import WordCloud
# to avoid warnings
import warnings
warnings.filterwarnings('ignore')
- TextBlob: Used for tokenization as well as for finding the polarity and subjectivity of a text
- Regular expression (re): removes unnecessary symbols that do not provide any meaning such as @, comma, hashtags, *, etc.
- Natural Language Toolkit (nltk): removes stop words such as and, is, the, in, or, etc.
Importing datasets
After importing all the important libraries, load the dataset.
# reading datasets
trump = pd.read_csv("hashtag_donaldtrump.csv", lineterminator='\n')
print(trump.head(3))
Output:
            created_at      tweet_id  \
0 2020-10-15 00:00:01 1.316529e+18
1 2020-10-15 00:00:01 1.316529e+18
2 2020-10-15 00:00:02 1.316529e+18
tweet likes retweet_count \
0 #Elecciones2020 | En #Florida: #JoeBiden dice ... 0.0 0.0
1 Usa 2020, Trump contro Facebook e Twitter: cop... 26.0 9.0
2 #Trump: As a student I used to hear for years,... 2.0 1.0
source user_id user_name user_screen_name \
0 TweetDeck 360666534.0 El Sol Latino News elsollatinonews
1 Social Mediaset 331617619.0 Tgcom24 MediasetTgcom24
2 Twitter Web App 8436472.0 snarke snarke
user_description ... \
0 ???? Noticias de interés para latinos de la costa... ...
1 Profilo ufficiale di Tgcom24: tutte le notizie... ...
2 Will mock for food! Freelance writer, blogger,... ...
user_followers_count user_location lat long \
0 1860.0 Philadelphia, PA / Miami, FL 25.774270 -80.193660
1 1067661.0 NaN NaN NaN
2 1185.0 Portland 45.520247 -122.674195
city country continent state state_code \
0 NaN United States of America North America Florida FL
1 NaN NaN NaN NaN NaN
2 Portland United States of America North America Oregon OR
collected_at
0 2020-10-21 00:00:00
1 2020-10-21 00:00:00.373216530
2 2020-10-21 00:00:00.746433060
[3 rows x 21 columns]
Let's have a look at all the features in this dataset.
# Display all the columns in the DataFrame
print(trump.columns)
Output:
Index(['created_at', 'tweet_id', 'tweet', 'likes', 'retweet_count', 'source',
'user_id', 'user_name', 'user_screen_name', 'user_description',
'user_join_date', 'user_followers_count', 'user_location', 'lat',
'long', 'city', 'country', 'continent', 'state', 'state_code',
'collected_at'],
dtype='object')
Both, Donald Trump and Joe Biden datasets have same column features and format.
biden = pd.read_csv("hashtag_joebiden.csv", lineterminator='\n')
print(biden.head(2))
Output:
            created_at      tweet_id  \
0 2020-10-15 00:00:01 1.316529e+18
1 2020-10-15 00:00:18 1.316529e+18
2 2020-10-15 00:00:20 1.316529e+18
tweet likes retweet_count \
0 #Elecciones2020 | En #Florida: #JoeBiden dice ... 0.0 0.0
1 #HunterBiden #HunterBidenEmails #JoeBiden #Joe... 0.0 0.0
2 @IslandGirlPRV @BradBeauregardJ @MeidasTouch T... 0.0 0.0
source user_id user_name user_screen_name \
0 TweetDeck 3.606665e+08 El Sol Latino News elsollatinonews
1 Twitter for iPad 8.099044e+08 Cheri A. ???????? Biloximeemaw
2 Twitter Web App 3.494182e+09 Flag Waver Flag_Wavers
user_description ... \
0 ???? Noticias de interés para latinos de la costa... ...
1 Locked and loaded Meemaw. Love God, my family ... ...
2 NaN ...
user_followers_count user_location lat long \
0 1860.0 Philadelphia, PA / Miami, FL 25.774270 -80.193660
1 6628.0 NaN NaN NaN
2 1536.0 Golden Valley Arizona 46.304036 -109.171431
city country continent state state_code \
0 NaN United States of America North America Florida FL
1 NaN NaN NaN NaN NaN
2 NaN United States of America North America Montana MT
collected_at
0 2020-10-21 00:00:00
1 2020-10-21 00:00:00.517827283
2 2020-10-21 00:00:01.035654566
[3 rows x 21 columns]
Data Assessment:
for example, studying the shape of data and what it tells, checking variables and their data types
print(trump.shape)
print(biden.shape)
Output:
(970919, 21)
(776886, 21)
From the output obtained, we can observe that the general public across different nations has tweeted more about Donald Trump as compared to Joe Biden, it can be good or bad!
Let's check the Trump data info
# Getting trump dataset information
trump.info()
Output:
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 970919 entries, 0 to 970918
Data columns (total 21 columns):
# Column Non-Null Count Dtype
--- ------ -------------- -----
0 created_at 970919 non-null object
1 tweet_id 970919 non-null float64
2 tweet 970919 non-null object
3 likes 970919 non-null float64
4 retweet_count 970919 non-null float64
5 source 970043 non-null object
6 user_id 970919 non-null float64
7 user_name 970903 non-null object
8 user_screen_name 970919 non-null object
9 user_description 869653 non-null object
10 user_join_date 970919 non-null object
11 user_followers_count 970919 non-null float64
12 user_location 675966 non-null object
13 lat 445719 non-null float64
14 long 445719 non-null float64
15 city 227187 non-null object
16 country 442748 non-null object
17 continent 442765 non-null object
18 state 320620 non-null object
19 state_code 300425 non-null object
20 collected_at 970919 non-null object
dtypes: float64(7), object(14)
memory usage: 155.6+ MB
Let's check the Biden data info
# Getting biden dataset information
biden.info()
Output:
<class 'pandas.core.frame.DataFrame'>
RangeIndex: 776886 entries, 0 to 776885
Data columns (total 21 columns):
# Column Non-Null Count Dtype
--- ------ -------------- -----
0 created_at 776886 non-null object
1 tweet_id 776886 non-null float64
2 tweet 776886 non-null object
3 likes 776886 non-null float64
4 retweet_count 776886 non-null float64
5 source 776173 non-null object
6 user_id 776886 non-null float64
7 user_name 776868 non-null object
8 user_screen_name 776886 non-null object
9 user_description 694880 non-null object
10 user_join_date 776886 non-null object
11 user_followers_count 776886 non-null float64
12 user_location 543095 non-null object
13 lat 355293 non-null float64
14 long 355293 non-null float64
15 city 186872 non-null object
16 country 353779 non-null object
17 continent 353797 non-null object
18 state 260195 non-null object
19 state_code 244609 non-null object
20 collected_at 776886 non-null object
dtypes: float64(7), object(14)
memory usage: 124.5+ MB
Data Preprocessing
Data Processing basically refers to the cleaning, transforming, and integrating of data in order to make it ready for analysis.
It is the most important step in an analysis to achieve accurate results with increased quality and reliability as the raw data can be inconsistent or incomplete in formatting.
This process involves tasks such as:
Performing data integration and transformation:
After data cleaning, it is preferable to convert it into formats that are easy to read and understand by software applications and algorithms. You can integrate and transform your data using the following way:
- Condensing datasets to reduce the total amount of data by concatenating both datasets for easier analysis using the pandas' concat function.
# creating a new column 'candidate' todifferentiate
# between tweets of Trump and Biden upon concatination
trump['candidate'] = 'trump'
# biden dataframe
biden['candidate'] = 'biden'
# combining the dataframes
data = pd.concat([trump, biden])
# FInal data shape
print('Final Data Shape :', data.shape)
# View the first 2 rows
print("\nFirst 2 rows:")
print(data.head(3))
Output:
Final Data Shape : (1747805, 22)
First 2 rows:
created_at tweet_id \
0 2020-10-15 00:00:01 1.316529e+18
1 2020-10-15 00:00:01 1.316529e+18
2 2020-10-15 00:00:02 1.316529e+18
tweet likes retweet_count \
0 #Elecciones2020 | En #Florida: #JoeBiden dice ... 0.0 0.0
1 Usa 2020, Trump contro Facebook e Twitter: cop... 26.0 9.0
2 #Trump: As a student I used to hear for years,... 2.0 1.0
source user_id user_name user_screen_name \
0 TweetDeck 360666534.0 El Sol Latino News elsollatinonews
1 Social Mediaset 331617619.0 Tgcom24 MediasetTgcom24
2 Twitter Web App 8436472.0 snarke snarke
user_description ... \
0 ???? Noticias de interés para latinos de la costa... ...
1 Profilo ufficiale di Tgcom24: tutte le notizie... ...
2 Will mock for food! Freelance writer, blogger,... ...
user_location lat long city \
0 Philadelphia, PA / Miami, FL 25.774270 -80.193660 NaN
1 NaN NaN NaN NaN
2 Portland 45.520247 -122.674195 Portland
country continent state state_code \
0 United States of America North America Florida FL
1 NaN NaN NaN NaN
2 United States of America North America Oregon OR
collected_at candidate
0 2020-10-21 00:00:00 trump
1 2020-10-21 00:00:00.373216530 trump
2 2020-10-21 00:00:00.746433060 trump
[3 rows x 22 columns]
Data Cleaning:
Dropping missing values
# dropping null values if they exist
data.dropna(inplace=True)
Check the unique Country name where the mostly tweet are generated
data['country'].value_counts()
Output:
country
United States of America 332495
United States 61905
United Kingdom 58051
India 40091
Germany 35379
...
Mali 2
Northern Mariana Islands 1
Saint Lucia 1
Lesotho 1
East Timor 1
Name: count, Length: 189, dtype: int64
An important thing to note while exploring the data is that "United States of America" and "US" in the country column are treated as different nations in the dataset which is a major problem. Therefore, we can assign a common term "US" to treat it as one country.
data['country'] = data['country'].replace({'United States of America': "US",
                                           'United States': "US"})
Exploratory Data Analysis
Exploratory Data Analysis (EDA) is a method used to analyze and investigate data sets and summarize their main characteristics, often employing data visualization methods.
Tweets for Candidates
So, here we check the number of tweets received for each of them using a bar graph.
# Group the data by 'candidate' and count the
# number of tweets for each candidate
tweets_count = data.groupby('candidate')['tweet'].count().reset_index()
# Interactive bar chart
fig = px.bar(tweets_count, x='candidate', y='tweet', color='candidate',
             color_discrete_map={'Trump': 'pink', 'Biden': 'blue'},
             labels={'candidate': 'Candidates', 'tweet': 'Number of Tweets'},
             title='Tweets for Candidates')
# Show the chart
fig.show()
Output:
Interpretation: Upon studying the graph, we can say that Donald Trump is the most tweeted about by the general public as compared to Joe Biden.
Comparison of Likes
# Interactive bar chart
likes_comparison = data.groupby('candidate')['likes'].sum().reset_index()
fig = px.bar(likes_comparison, x='candidate', y='likes', color='candidate',
             color_discrete_map={'Trump': 'blue', 'Biden': 'green'},
             labels={'candidate': 'Candidate', 'likes': 'Total Likes'},
             title='Comparison of Likes')
# Update the layout with a black theme
fig.update_layout(plot_bgcolor='black',
                  paper_bgcolor='black', font_color='white')
# Show the chart
fig.show()
Output:
Interpretation: The public has tweeted the most about Donald Trump however the number of likes are high for Joe Biden which definitely indicates liking towards Biden.
Top10 Country-wise tweets Counts
So, let's find out the top 10 countries that are most active in tweeting during the elections.
# Top10 Countrywise tweets Counts
top10countries = data.groupby('country')['tweet'].count(
).sort_values(ascending=False).reset_index().head(10)
# top10countries
# Interactive bar chart
fig = px.bar(top10countries, x='country', y='tweet',
             template='plotly_dark',
             color_discrete_sequence=px.colors.qualitative.Dark24_r,
             title='Top10 Countrywise tweets Counts')
# To view the graph
fig.show()
Output:
Tweet Counts for Each Candidate in the Top 10 Countries
Now, let us find out the number of tweets done for each candidate by all the countries.
# the number of tweets done for each
# candidate by all the countries.
tweet_df = data.groupby(['country', 'candidate'])[
    'tweet'].count().reset_index()
# Candidate for top 10 country tweet
tweeters = tweet_df[tweet_df['country'].isin(top10countries.country)]
# Plot for tweet counts for each candidate
# in the top 10 countries
fig = px.bar(tweeters, x='country', y='tweet', color='candidate',
             labels={'country': 'Country', 'tweet': 'Number of Tweets',
                     'candidate': 'Candidate'},
             title='Tweet Counts for Each Candidate in the Top 10 Countries',
             template='plotly_dark',
             barmode='group')
# Show the chart
fig.show()
Output:
Interpretation: All the countries are tweeting the most about Trump. However, India is talking more about Joe Biden.
Sentiment Analysis for prediction of election results
We shall only take into account US citizens' opinions here, as they are a crucial deciding factor in who becomes the US president.
def clean(text):
    # Remove URLs
    text = re.sub(r'https?://\S+|www\.\S+', '', str(text))
    # Convert text to lowercase
    text = text.lower()
    # Replace anything other than alphabets a-z with a space
    text = re.sub('[^a-z]', ' ', text)
    # Split the text into single words
    text = text.split()
    # Initialize WordNetLemmatizer
    lm = WordNetLemmatizer()
    # Lemmatize words and remove stopwords
    text = [lm.lemmatize(word) for word in text if word not in set(
        stopwords.words('english'))]
    # Join the words back into a sentence
    text = ' '.join(word for word in text)
    return text
Get polarity, subjectivity, and Analysis
Now, let's create a function to get polarity, subjectivity, and Analysis function to fetch sentiments from the data.
def getpolarity(text):
    return TextBlob(text).sentiment.polarity
def getsubjectivity(text):
    return TextBlob(text).sentiment.subjectivity
def getAnalysis(score):
    if score < 0:
        return 'negative'
    elif score == 0:
        return 'neutral'
    else:
        return 'positive'
Donald Trump tweet sentiment analysis
Note: We are considering the data of only, the United States of America because that will be a major factor in predicting the results.
trump_tweets = data[data['candidate'] == 'trump']
# taking only U.S. country data
trump_tweets = trump_tweets.loc[trump_tweets.country == 'US']
trump_tweets = trump_tweets[['tweet']]
print(trump_tweets.head())
Output:
                                               tweet
0 #Elecciones2020 | En #Florida: #JoeBiden dice ...
2 #Trump: As a student I used to hear for years,...
4 You get a tie! And you get a tie! #Trump ‘s ra...
5 @CLady62 Her 15 minutes were over long time ag...
7 @DeeviousDenise @realDonaldTrump @nypost There...
Now, we apply the clean function to get cleaned text from tweets.
trump_tweets['cleantext'] = trump_tweets['tweet'].apply(clean)
print(trump_tweets.head())
Output:
                                           cleantext  
0 elecciones en florida joebiden dice que donald...
2 trump student used hear year ten year heard ch...
4 get tie get tie trump rally iowa
5 clady minute long time ago omarosa never repre...
7 deeviousdenise realdonaldtrump nypost many unl...
Subjectivity
To know if the sentence is subjective or objective. Subjective means sentence refers to a personal opinion and not facts whereas objective means facts
Now, obtaining subjectivity for Trump's tweets.
trump_tweets['subjectivity'] = trump_tweets['cleantext'].apply(getsubjectivity)
Polarity
It is represented by a float value that lies between -1 and 1, where 1 = positive sentiment, -1 = negative sentiment
Getting the polarity of the data now.
trump_tweets['polarity'] = trump_tweets['cleantext'].apply(getpolarity)
Sentiments
Now, classifying the sentiments as positive, negative or neutral.
trump_tweets['analysis'] = trump_tweets['polarity'].apply(getAnalysis)
trump_tweets.head()
Output:
                                           cleantext  subjectivity  polarity  \
0 elecciones en florida joebiden dice que donald... 0.000000 0.000000
2 trump student used hear year ten year heard ch... 0.333333 0.333333
4 get tie get tie trump rally iowa 0.000000 0.000000
5 clady minute long time ago omarosa never repre... 0.416667 -0.108333
7 deeviousdenise realdonaldtrump nypost many unl... 0.533333 0.050000
analysis
0 neutral
2 positive
4 neutral
5 negative
7 positive
Let's see the distribution of positive, negative and neutral sentiments.
# how much data is positive/negetive/neutral
plt.style.use('dark_background')  # Adding black theme
# Define colors for each bar
colors = ['orange', 'blue', 'red']
plt.figure(figsize=(7, 5))
(trump_tweets.analysis.value_counts(normalize=True) * 100).plot.bar(color=colors)
plt.ylabel("%age of tweets")
plt.title("Distribution of Sentiments towards Trump")
plt.show()
Output:
Now, plotting Word Cloud to quickly identify the most important themes or topics in the text and understand the overall sentiment or tone of the tweets.
!pip install wordcloud
import matplotlib.pyplot as plt
from wordcloud import WordCloud, STOPWORDS
def word_cloud(wd_list): 
	stopwords = set(STOPWORDS)
	all_words = ' '.join(wd_list)
	wordcloud = WordCloud(background_color='black', 
						stopwords=stopwords, 
						width=1600, height=800, max_words=100, max_font_size=200, 
						colormap="viridis").generate(all_words) 
	plt.figure(figsize=(12, 10)) 
	plt.axis('off') 
	plt.imshow(wordcloud) 
word_cloud(trump_tweets['cleantext'][:5000])
# This code is modified by Susobhan Akhuli
Output:
Joe Biden's Twitter sentiment analysis
biden_tweets = data[data['candidate'] == 'biden']
biden_tweets = biden_tweets.loc[biden_tweets.country == 'US']
biden_tweets = biden_tweets[['tweet']]
biden_tweets
Output:
                                                tweet
6 In 2020, #NYPost is being #censorship #CENSORE...
17 Comments on this? "Do Democrats Understand how...
25 @RealJamesWoods #BidenCrimeFamily #JoeBiden #H...
29 Come on @ABC PLEASE DO THE RIGHT THING. Move t...
34 #realDonaldTrump addresses #JoeBiden and #Hunt...
Similarly, we apply all the functions for Joe Biden now.
biden_tweets['cleantext']=biden_tweets['tweet'].apply(clean)
biden_tweets.head()
Output:
                                            cleantext  subjectivity  polarity  \
0 elecciones en florida joebiden dice que donald... 0.000000 0.00000
2 islandgirlprv bradbeauregardj meidastouch bide... 0.000000 0.00000
4 censorship hunterbiden biden bidenemails biden... 0.000000 0.00000
6 nypost censorship censored twitter manipulate ... 0.678571 -0.14881
11 fbi allegedly obtained hunter biden computer d... 0.100000 -0.10000
analysis
0 neutral
2 neutral
4 neutral
6 negative
11 negative
Similarly, repeating the steps for Joe Biden analysis.
biden_tweets['subjectivity'] = biden_tweets['cleantext'].apply(getsubjectivity)
biden_tweets['polarity'] = biden_tweets['cleantext'].apply(getpolarity)
biden_tweets['analysis'] = biden_tweets['polarity'].apply(getAnalysis)
biden_tweets.head()
Output:
                                            cleantext  subjectivity  polarity  \
0 elecciones en florida joebiden dice que donald... 0.000000 0.00000
2 islandgirlprv bradbeauregardj meidastouch bide... 0.000000 0.00000
4 censorship hunterbiden biden bidenemails biden... 0.000000 0.00000
6 nypost censorship censored twitter manipulate ... 0.678571 -0.14881
11 fbi allegedly obtained hunter biden computer d... 0.100000 -0.10000
analysis
0 neutral
2 neutral
4 neutral
6 negative
11 negative
Now, we find out the distribution of sentiments in the dataset to know which sentiment holds the most values and how it will affect the election results.
# how much data is positive/negetive/neutral
plt.style.use('dark_background')
# Define colors for each bar
colors = ['orange', 'green', 'red']
plt.figure(figsize=(7, 5))
(biden_tweets.analysis.value_counts(normalize=True) * 100).plot.bar(color=colors)
plt.ylabel("%age of tweets")
plt.title("Distribution of Sentiments towards Biden")
plt.show()
Output:
Now, plotting the Word Cloud for the Joe Biden dataset.
word_cloud(biden_tweets['cleantext'][:5000])
Output:
let us now analyze the sentiments to predict the results for Donald Trump
trump_tweets.analysis.value_counts(normalize=True)*100
# This code is modified by Susobhan Akhuli
Output:
analysis
neutral 43.225032
positive 33.994645
negative 22.780323
Name: proportion, dtype: float64
Now, analyze tweets for Joe Biden
biden_tweets.analysis.value_counts(normalize=True)*100
# This code is modified by Susobhan Akhuli
Output:
analysis
neutral 46.832508
positive 36.438166
negative 16.729326
Name: proportion, dtype: float64
favorably
Get the complete notebook link here:
Colab Link : click here.
Dataset Link : click here.
Conclusion:
let's analyze what each sentiment's percentage represents and its implications on the result.
Positive Sentiment: Positive tweets about Biden outnumber positive tweets about Trump: Biden's tweets have a higher percentage of positive feelings (36.43%) than Trump's ( 33.99%). This shows that Twitter users are responding more favorably to Biden.
Neutral Sentiment: Trump receives more neutral sentiments: In contrast, Trump receives slightly more neutral sentiments (43.22%) in comparison to Biden (46.83%) in his tweets. This may indicate that Trump's tweets are more likely to be seen as neutral or impersonal, leading to a higher neutral sentiment rate.
Negative Sentiment: Trump gets more unfavorable reactions: While both candidates have received criticism, Trump's tweets have a greater percentage of unfavorable reactions (22.78%) than Biden's (16.79%). This implies that there may have been more opposition to Trump's tweets on Twitter.
With respect to the U.S. voters, it was highlighted a lot of times that Trump was the most talked about and tweeted about among people however, Trump has received more negative comments as compared to Joe Biden. As a result, Joe Biden won the 2020 elections which is a proven fact. However, overall, the competition was close as shown by the data.
