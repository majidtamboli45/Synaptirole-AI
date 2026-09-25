# Customer Segmentation using Unsupervised Machine Learning in Python

> Source: https://www.geeksforgeeks.org/machine-learning/customer-segmentation-using-unsupervised-machine-learning-in-python/

Customer Segmentation involves grouping customers based on shared characteristics, behaviors and preferences. By segmenting customers, businesses can tailor their strategies and target specific groups more effectively and enhance overall market value. Today we will use Unsupervised Machine Learning to perform Customer Segmentation in Python.
Step 1: Import Libraries
We’ll start by importing the necessary libraries like Pandas, Numpy, Matplotlib, Seaborn and Sklearn.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb
from sklearn.preprocessing import StandardScaler, LabelEncoder
from sklearn.cluster import KMeans
import warnings
warnings.filterwarnings('ignore')
Step 2: Load the Dataset
Load the dataset containing customer details such as marital status, income, number of items purchased, types of items purchased and more. You can download the dataset from here.
df = pd.read_csv('new.csv')
df.head()
Output:
To check the shape of the dataset we can use data.shape method.
df.shape
Output:
(2240, 29)
Step 3: Data Preprocessing
To get the information of the dataset like checking the null values, count of values, etc. we will use .info() method.
df.info()
Output:
df.describe().T
Output:
To check the null values in the dataset.
for col in df.columns:
    temp = df[col].isnull().sum()
    if temp > 0:
        print(f'Column {col} contains {temp} null values.')
Output:
Column Income contains 24 null values.
Now, once we have the count of the null values and we know the values are very less we can drop them as it will not affect the dataset much.
df = df.dropna()
print("Total values in the dataset after removing the null values:", len(df))
Output:
Total values in the dataset after removing the null values: 2216
To find the total number of unique values in each column we can use data.unique() method.
df.nunique()
Output:
Here we can observe that there are columns which contain single values in the whole column so, they have no relevance in the model development.
Also dataset has a column Dt_Customer which contains the date column, we can convert into 3 columns i.e. day, month, year.
parts = df["Dt_Customer"].str.split("-", n=3, expand=True)
df["day"] = parts[0].astype('int')
df["month"] = parts[1].astype('int')
df["year"] = parts[2].astype('int')
Now we have all the important features, we can now drop features like Z_CostContact, Z_Revenue, Dt_Customer.
df.drop(['Z_CostContact', 'Z_Revenue', 'Dt_Customer'],
        axis=1,
        inplace=True)
Step 4: Data Visualization and Analysis
Data visualization is the graphical representation of information and data in a pictorial or graphical format. Here we will be using bar plot and count plot for better visualization.
floats, objects = [], []
for col in df.columns:
    if df[col].dtype == object:
        objects.append(col)
    elif df[col].dtype == float:
        floats.append(col)
print(objects)
print(floats)
Output:
['Education', 'Marital_Status', 'Accepted'] 
['Income']
To get the count plot for the columns of the datatype - object, refer the code below.
plt.subplots(figsize=(15, 10))
for i, col in enumerate(objects):
    plt.subplot(2, 2, i + 1)
    sb.countplot(df[col])
plt.show()
Output:
Let's check the value_counts of the Marital_Status of the data.
df['Marital_Status'].value_counts()
Output:
Now lets see the comparison of the features with respect to the values of the responses.
plt.subplots(figsize=(15, 10))
for i, col in enumerate(objects):
    plt.subplot(2, 2, i + 1)
    df_melted = df.melt(id_vars=[col], value_vars=['Response'], var_name='hue')
    sb.countplot(x=col, hue='value', data=df_melted)
plt.show()
Output:
Label Encoding is used to convert the categorical values into the numerical values so that model can understand it.
for col in df.columns:
    if df[col].dtype == object:
        le = LabelEncoder()
        df[col] = le.fit_transform(df[col])
Heatmap is the best way to visualize the correlation among the different features of dataset. Let's give it the value of 0.8
plt.figure(figsize=(15, 15))
sb.heatmap(df.corr() > 0.8, annot=True, cbar=False)
plt.show()
Output:
Standardization is the method of feature scaling which is an integral part of feature engineering. It scales down the data and making it easier for the machine learning model to learn from it. It reduces the mean to ‘0’ and the standard deviation to ‘1’.
scaler = StandardScaler()
data = scaler.fit_transform(df)
Step 5: Segmentation
We will be using T-distributed Stochastic Neighbor Embedding. It helps in visualizing high-dimensional data. It converts similarities between data points to joint probabilities and tries to minimize the values to low-dimensional embedding.
from sklearn.manifold import TSNE
model = TSNE(n_components=2, random_state=0)
tsne_data = model.fit_transform(df)
plt.figure(figsize=(7, 7))
plt.scatter(tsne_data[:, 0], tsne_data[:, 1])
plt.show()
Output:
There are certainly some clusters which are clearly visual from the 2-D representation of the given data. KMeans Clustering can also be used to cluster the different points in a plane.
error = []
for n_clusters in range(1, 21):
    model = KMeans(init='k-means++',
                   n_clusters=n_clusters,
                   max_iter=500,
                   random_state=22)
    model.fit(df)
    error.append(model.inertia_)
Here inertia is nothing but the sum of squared distances within the clusters.
plt.figure(figsize=(10, 5))
sb.lineplot(x=range(1, 21), y=error)
sb.scatterplot(x=range(1, 21), y=error)
plt.show()
Output:
Here by using the elbow method we can say that k = 6 is the optimal number of clusters that should be made as after k = 6 the value of the inertia is not decreasing drastically.
model = KMeans(init='k-means++',
               n_clusters=5,
               max_iter=500,
               random_state=22)
segments = model.fit_predict(df)
Scatterplot will be used to see all the 6 clusters formed by KMeans Clustering.
plt.figure(figsize=(7, 7))
df_tsne = pd.DataFrame({'x': tsne_data[:, 0], 'y': tsne_data[:, 1], 'segment': segments})
sb.scatterplot(x='x', y='y', hue='segment', data=df_tsne)
plt.show()
Output:
Here we can see that we have divide customers into 5 clusters and based on these clusters we can target customers with same purchasing behaviour much better. We can give personalised ads and can make informed decision about business for better growth.
