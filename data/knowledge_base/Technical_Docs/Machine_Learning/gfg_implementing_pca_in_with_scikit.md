# Implementing PCA in Python with scikit

> Source: https://www.geeksforgeeks.org/machine-learning/implementing-pca-in-python-with-scikit-learn/

Principal Component Analysis (PCA) is a dimensionality reduction technique. It transform high-dimensional data into a smaller number of dimensions called principal components and keeps important information in the data. In this article, we will learn about how we implement PCA in Python using scikit-learn. Here are the steps:
Step 1: Import necessary libraries
We import all the libraries needed like numpy , pandas, matplotlib, seaborn and scikit learn.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import StandardScaler
from sklearn.decomposition import PCA
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import confusion_matrix, classification_report
Step 2: Load the Data
We will use breast cancer dataset. This dataset has 569 data items with 30 input attributes. There are two output classes-benign and malignant. This reads the dataset file and displays the first 5 rows. You can download the dataset from here.
df = pd.read_csv('data.csv')
df.head()
Output:
Step 3: Data Cleaning and Preprocessing
It drops unnecessary columns like id, Unnamed: 32 and converts diagnosis column: Malignant to 1 and Benign to 0.
df.drop(['id', 'Unnamed: 32'], axis=1, inplace=True)
df['diagnosis'] = df['diagnosis'].map({'M': 1, 'B': 0})
Step 4: Separate Features and Target
In this separate features X contains input features (30 columns) and y contains the target labels (0 or 1)
X = df.drop('diagnosis', axis=1)
y = df['diagnosis']
Step 5: Standardize the Data
StandardScaler transforms features so they all have a mean = 0 and standard deviation = 1 which helps PCA to treat all features equally.
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
print(X_scaled[:2])
Output:
Step 6: Apply PCA Algorithm
It reduces the data to 2 principal components. PCA finds combinations of original features that explain the most variation in the data.
pca = PCA(n_components=2)
X_pca = pca.fit_transform(X_scaled)
print(X_pca[:2])
Output:
[[ 9.19283683 1.94858307] 
 [ 2.3878018 -3.76817174]]
We reduce 30 features to 2 components. Each row now has 2 values (PC1, PC2) instead of 30. These components contain the most variation from original data.
Step 7: Explained Variance
It tells how much information each principal component holds.
print("Explained variance:", pca.explained_variance_ratio_)
print("Cumulative:", np.cumsum(pca.explained_variance_ratio_))
Output:
- Explained variance: [0.44272026 0.18971182]
- Cumulative: [0.44272026 0.63243208]
PC1 explains 44% of data and PC2 explains 19%. Combined these 2 components explain 63% of all data variation.
Step 8: Visualization Before vs After PCA
First plot shows original scaled data using first 2 features and second plot shows reduced data using PCA's 2 components. Colors represent diagnosis Benign or Malignant.
plt.figure(figsize=(8,6))
plt.scatter(X_scaled[:, 0], X_scaled[:, 1], c=y, cmap='coolwarm', edgecolor='k')
plt.xlabel("Feature 1")
plt.ylabel("Feature 2")
plt.title("Original Data (First Two Features)")
plt.colorbar(label="Diagnosis")
plt.show()
plt.figure(figsize=(8,6))
plt.scatter(X_pca[:, 0], X_pca[:, 1], c=y, cmap='coolwarm', edgecolor='k')
plt.xlabel("Principal Component 1")
plt.ylabel("Principal Component 2")
plt.title("PCA Transformed Data")
plt.colorbar(label="Diagnosis")
plt.show()
Output:
Step 9: Train a Model on PCA Data
It splits PCA data into training and test sets. Train a Logistic Regression model to classify tumors and predicts and evaluate the model.
X_train, X_test, y_train, y_test = train_test_split(X_pca, y, test_size=0.2, random_state=42)
model = LogisticRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
print(classification_report(y_test, y_pred))
Output:
Step 10: Confusion Matrix
It shows how many predictions were correct or incorrect and helps to visualize true vs. false predictions.
cm = confusion_matrix(y_test, y_pred)
sns.heatmap(cm, annot=True, fmt='d', cmap='Blues',
            xticklabels=['Benign', 'Malignant'],
            yticklabels=['Benign', 'Malignant'])
plt.xlabel('Predicted')
plt.ylabel('Actual')
plt.title('Confusion Matrix')
plt.show()
Output:
Step 11: Reconstruct Data and Check Information Loss
PCA reduces data size but some information is lost. This step converts reduced data back to its original shape and measures how much data was lost in the reduction process.
X_reconstructed = pca.inverse_transform(X_pca)
reconstruction_loss = np.mean((X_scaled - X_reconstructed) ** 2)
print(f"Reconstruction Loss: {reconstruction_loss:.4f}")
Output:
Reconstruction Loss: 0.3676
As shows how much info was lost during PCA. A loss of 0.3676 means PCA with 2 components retains good structure.
Complete Code: click here
