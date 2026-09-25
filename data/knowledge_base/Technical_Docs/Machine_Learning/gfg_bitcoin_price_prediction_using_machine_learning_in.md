# Bitcoin Price Prediction using Machine Learning in Python

> Source: https://www.geeksforgeeks.org/machine-learning/bitcoin-price-prediction-using-machine-learning-in-python/

Machine learning proves immensely helpful in many industries in automating tasks that earlier required human labor one such application of ML is predicting whether a particular trade will be profitable or not.
In this article, we will learn how to predict a signal that indicates whether buying a particular stock will be helpful or not by using ML.
Let's start by importing some libraries which will be used for various purposes which will be explained later in this article.
Importing Libraries
Python libraries make it very easy for us to handle the data and perform typical and complex tasks with a single line of code.
- Pandas - This library helps to load the data frame in a 2D array format and has multiple functions to perform analysis tasks in one go.
- Numpy - Numpy arrays are very fast and can perform large computations in a very short time.
- Matplotlib/Seaborn - This library is used to draw visualizations.
- Sklearn - This module contains multiple libraries having pre-implemented functions to perform tasks from data preprocessing to model development and evaluation.
- XGBoost - This contains the eXtreme Gradient Boosting machine learning algorithm which is one of the algorithms which helps us to achieve high accuracy on predictions.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sn
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from xgboost import XGBClassifier
from sklearn import metrics
import warnings
warnings.filterwarnings('ignore')
Importing Dataset
The dataset we will use here to perform the analysis and build a predictive model is Bitcoin Price data. We will use OHLC('Open', 'High', 'Low', 'Close') data from 17th July 2014 to 29th December 2022 which is for 8 years for the Bitcoin price.
Dataset: click here.
df = pd.read_csv('bitcoin.csv')
df.head()
Output:
df.shape
Output:
(2713, 7)
From this, we got to know that there are 2904 rows of data available and for each row, we have 7 different features or columns.
df.describe()
Output:
df.info()
Output:
Exploratory Data Analysis
EDA is an approach to analyzing the data using visual techniques. It is used to discover trends, and patterns, or to check assumptions with the help of statistical summaries and graphical representations.
While performing the EDA of the Bitcoin Price data we will analyze how prices of the cryptocurrency have moved over the period of time and how the end of the quarters affects the prices of the currency.
plt.figure(figsize=(15, 5))
plt.plot(df['Close'])
plt.title('Bitcoin Close price.', fontsize=15)
plt.ylabel('Price in dollars.')
plt.show()
Output:
The prices of the Bitcoin stocks are showing an upward trend as depicted by the plot of the closing price of the stocks.
df[df['Close'] == df['Adj Close']].shape, df.shape
Output:
((2713, 7), (2713, 7))
From here we can conclude that all the rows of columns 'Close' and 'Adj Close' have the same data. So, having redundant data in the dataset is not going to help so, we'll drop this column before further analysis.
df = df.drop(['Adj Close'], axis=1)
Now let's draw the distribution plot for the continuous features given in the dataset but before moving further let's check for the null values if any are present in the data frame.
df.isnull().sum()
Output:
This implies that there are no null values in the data set provided.
features = ['Open', 'High', 'Low', 'Close']
plt.subplots(figsize=(20,10))
for i, col in enumerate(features):
  plt.subplot(2,2,i+1)
  sn.distplot(df[col])
plt.show()
Output:
plt.subplots(figsize=(20,10))
for i, col in enumerate(features):
  plt.subplot(2,2,i+1)
  sn.boxplot(df[col], orient='h')
plt.show()
Output:
There are so many outliers in the data which means that the prices of the stock have varied hugely in a very short period of time. Let's check this with the help of a barplot.
Feature Engineering
Feature Engineering helps to derive some valuable features from the existing ones. These extra features sometimes help in increasing the performance of the model significantly and certainly help to gain deeper insights into the data.
splitted = df['Date'].str.split('-', expand=True)
df['year'] = splitted[0].astype('int')
df['month'] = splitted[1].astype('int')
df['day'] = splitted[2].astype('int')
# Convert the 'Date' column to datetime objects
df['Date'] = pd.to_datetime(df['Date']) 
df.head()
# This code is modified by Susobhan Akhuli
Output:
Now we have three more columns namely 'day', 'month' and 'year' all these three have been derived from the 'Date' column which was initially provided in the data.
data_grouped = df.groupby('year').mean()
plt.subplots(figsize=(20,10))
for i, col in enumerate(['Open', 'High', 'Low', 'Close']):
  plt.subplot(2,2,i+1)
  data_grouped[col].plot.bar()
plt.show()
Output:
Here we can observe why there are so many outliers in the data as the prices of bitcoin have exploded in the year 2021.
df['is_quarter_end'] = np.where(df['month']%3==0,1,0)
df.head()
Output:
df['open-close']  = df['Open'] - df['Close']
df['low-high']  = df['Low'] - df['High']
df['target'] = np.where(df['Close'].shift(-1) > df['Close'], 1, 0)
Above we have added some more columns which will help in the training of our model. We have added the target feature which is a signal whether to buy or not we will train our model to predict this only. But before proceeding let's check whether the target is balanced or not using a pie chart.
plt.pie(df['target'].value_counts().values, 
        labels=[0, 1], autopct='%1.1f%%')
plt.show()
Output:
When we add features to our dataset we have to ensure that there are no highly correlated features as they do not help in the learning process of the algorithm.
plt.figure(figsize=(10, 10))
sn.heatmap(df.corr() > 0.9, annot=True, cbar=False)
plt.show()
Output:
From the above heatmap, we can say that there is a high correlation between OHLC which is pretty obvious, and the added features are not highly correlated with each other or previously provided features which means that we are good to go and build our model.
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
# Assuming df is already defined
features = df[['open-close', 'low-high', 'is_quarter_end']]
target = df['target']
# Scaling the features
scaler = StandardScaler()
features = scaler.fit_transform(features)
# Split the data into training and validation (test) sets
X_train, X_valid, Y_train, Y_valid = train_test_split(features, target, test_size=0.3, random_state=42)
# 'test_size=0.3' means 30% of the data will be used for testing, and 70% for training
After selecting the features to train the model on we should normalize the data because normalized data leads to stable and fast training of the model. After that whole data has been split into two parts with a 70/30 ratio so, that we can evaluate the performance of our model on unseen data.
Model Development and Evaluation
Now is the time to train some state-of-the-art machine learning models(Logistic Regression, Support Vector Machine, XGBClassifier), and then based on their performance on the training and validation data we will choose which ML model is serving the purpose at hand better.
For the evaluation metric, we will use the ROC-AUC curve but why this is because instead of predicting the hard probability that is 0 or 1 we would like it to predict soft probabilities that are continuous values between 0 to 1. And with soft probabilities, the ROC-AUC curve is generally used to measure the accuracy of the predictions.
models = [LogisticRegression(), SVC(kernel='poly', probability=True), XGBClassifier()]
for i in range(3):
  models[i].fit(X_train, Y_train)
  print(f'{models[i]} : ')
  print('Training Accuracy : ', metrics.roc_auc_score(Y_train, models[i].predict_proba(X_train)[:,1]))
  print('Validation Accuracy : ', metrics.roc_auc_score(Y_valid, models[i].predict_proba(X_valid)[:,1]))
  print()
Output:
Among the three models, we have trained XGBClassifier has the highest performance but it is pruned to overfitting as the difference between the training and the validation accuracy is too high. But in the case of the Logistic Regression, this is not the case.
Now let's plot a confusion matrix for the validation data.
from sklearn.metrics import ConfusionMatrixDisplay
ConfusionMatrixDisplay.from_estimator(models[0], X_valid, Y_valid, cmap='Blues')
plt.show()
Output:
We can see that our model is working fine.
You can download source code from here.
