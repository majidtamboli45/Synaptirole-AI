# Scikit Library in Python

> Source: https://www.geeksforgeeks.org/machine-learning/what-is-python-scikit-library/

Scikit-learn (also written as sklearn) is a popular open-source Python library for machine learning. Built on top of NumPy, SciPy and Matplotlib, it provides efficient tools for data analysis and predictive modeling. It offers simple and reusable functions to build models for tasks such as classification, regression, clustering and dimensionality reduction.
Key Features of Scikit-learn
Below are several key features of Scikit-learn that make data preparation, modeling and evaluation simple and efficient.
1. Data Preprocessing: Preparing data is an important step in any machine learning project. Scikit-learn simplifies this process with built-in tools for:
- Data Splitting: Divide data into training and testing sets.
- Feature Scaling: Normalize or standardize feature values.
- Feature Selection: Choose the most relevant features.
- Feature Extraction: Create new features from existing data.
2. Model Evaluation: helps you check how well your machine learning model predicts and performs on data.
- Metrics: Evaluate model performance (accuracy, precision, recall and F1-score).
- Model Selection: Tools for selecting the best model hyperparameters through techniques like grid search and randomized search.
3. Pipeline Support: Combine preprocessing and modeling steps efficiently.
4. Integration: Works seamlessly with Python libraries like NumPy, Pandas and Matplotlib.
5. Ease of Use: Simple, consistent and user-friendly API for all tasks.
Installing and Importing Scikit-learn
To install Scikit-learn, use Python's package manager pip with the following command:
pip install scikit-learn
Once installed, import Scikit-learn modules into a Python script or environment using the import statement. For example:
import sklearn
Machine Learning Techniques Supported by Scikit-learn
1. Supervised Learning
Supervised learning involves training models using labeled data, where the correct output is already known.
- Classification: Scikit-learn provides multiple algorithms to predict categorical outcomes, such as logistic regression, decision trees, random forests, support vector machines (SVMs) and gradient boosting.
- Regression: Regression models are used to predict continuous numerical values. Scikit-learn supports linear regression, support vector regression and decision tree regression.
Example: Logistic Regression Algorithm
Logistic Regression is a supervised machine learning algorithm used to predict categories (yes/no, spam/not spam, disease/no disease). It works by estimating the probability of an outcome and is simple, easy to interpret and effective for problems where classes can be separated.
This example uses Logistic Regression to classify flowers in the Iris dataset and check how accurately the model predicts their types.
import numpy as np
import matplotlib.pyplot as plt
from sklearn import datasets
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score, classification_report
iris = datasets.load_iris()
X = iris.data
y = iris.target
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)
log_reg = LogisticRegression()
log_reg.fit(X_train, y_train)
y_pred = log_reg.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)
Output
Accuracy: 1.0
2. Unsupervised Learning
Unsupervised learning works with unlabeled data to discover patterns and structure.
- Clustering: Scikit-learn offers clustering techniques to group similar data points, including K-means clustering, DBSCAN and hierarchical clustering.
- Dimensionality Reduction: To handle high-dimensional data efficiently, Scikit-learn provides techniques like principal component analysis (PCA).
Example: KMeans Algorithm
KMeans groups data into k clusters based on similarity. It is an unsupervised learning algorithm, ideal for tasks like customer segmentation, image compression and anomaly detection, especially when the underlying data structure is unknown.
This program demonstrates how to use KMeans clustering from Scikit-learn to group the Iris dataset into three clusters based on feature similarity.
from sklearn.datasets import load_iris
from sklearn.cluster import KMeans
iris = load_iris()
kmeans = KMeans(n_clusters=3)
kmeans.fit(iris.data)
cluster_labels = kmeans.labels_
print("Cluster Labels:", cluster_labels)
Output
Cluster Labels: [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1
 1 1 1 1 1 1 1 1 1 1 1 1 1 2 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
 0 0 0 2 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 0 2 2 2 2 0 2 2 2 2
 2 2 0 0 2 2 2 2 0 2 0 2 0 2 2 0 0 2 2 2 2 2 0 2 2 2 2 0 2 2 2 0 2 2 2 0 2
 2 0]
Advantages
- Simple and user-friendly interface for machine learning tasks.
- Offers a wide range of algorithms for various tasks like classification, regression, clustering and more.
- Provides tools for data preprocessing, including scaling, normalization and handling missing values.
- Offers metrics for evaluating model performance and techniques like cross-validation for robust assessment.
- Integrates well with other Python libraries like NumPy, Pandas and Matplotlib.
