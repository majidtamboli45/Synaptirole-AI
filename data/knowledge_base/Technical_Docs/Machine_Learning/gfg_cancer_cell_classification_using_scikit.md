# Cancer cell classification using Scikit

> Source: https://www.geeksforgeeks.org/machine-learning/ml-cancer-cell-classification-using-scikit-learn/

Machine learning is used in solving real-world problems including medical diagnostics. One such application is classifying cancer cells based on their features and determining whether they are 'malignant' or 'benign'. In this article, we will use Scikit-learn to build a classifier for cancer cell detection.
Overview of the Dataset
The Breast Cancer Wisconsin (Diagnostic) dataset consists of:
- 569 instances (tumor samples)
- 30 attributes (features), including radius, texture, perimeter, and area of tumors
- Two classification labels:
  - 0 (Malignant) : Cancerous
  - 1 (Benign) : Non-cancerous
We will use these features to train and evaluate our machine learning model.
Implementing Cancer cell classification in Python
Below is the step-by-step implementation:
1. Importing Necessary Modules and Dataset
We will use numpy, matplotlib and scikit learn for this.
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
import pandas as pd
import matplotlib.pyplot as plt
2. Loading the Dataset into a Variable
For this project, we will use the Breast Cancer Wisconsin (Diagnostic) dataset which is available in Scikit-learn’s datasets module. We use the load_breast_cancer() function to load the dataset.
data = load_breast_cancer()
3. Exploring the Dataset
Before training the model let's examine the dataset. This helps us understand how the data is structured and labeled. We will use pandas module to create a dataframe to simplify this process. We will use df.sample() function to fetch some random records from the data.
df=pd.DataFrame(data.data,columns=data.feature_names)
df.sample(5)
Output:
To explore the data types of the columns in our dataset we will use the df.info() function. It will help us to understand the categorical and numerical columns in our dataset.
df.info()
Output:
To investigate the numerical columns we will use the df.describe() function. This function provides key summary statistics such as the mean, standard deviation, minimum and maximum values for each numerical column. It helps us understand the distribution and scale of the data which is crucial for preprocessing and model performance.
df.describe()
Output:
We must also analyze data.target to understand the distribution of malignant and benign cases as class imbalance can affect model performance.
df2=pd.DataFrame(data.target,columns=['target'])
df2.sample(5)
Output:
Plotting an pie chart will help us understand the distribution of the target values.
class_counts=df2["target"].value_counts()
plt.pie(class_counts, labels=class_counts.index, autopct='%1.2f%%', colors=['red', 'green'])
Output:
Usually this type of dataset is considered imbalanced. A common threshold is when the minority class constitutes less than 30% of the total samples. However in this case its almost 38% which is acceptable. Incases of imbalances we can use techniques like oversampling, undersampling or class weighting.
4. Splitting the Data into Training and Testing Sets
To evaluate our classifier we split the dataset into training and test sets using train_test_split(). Here 33% of the data is used for testing while the remaining 67% is used for training.
X_train, X_test, y_train, y_test = train_test_split(data.data, data.target, test_size=0.33, random_state=42)
5. Building and Training the Model
We use Naive Bayes algorithm which is effective for binary classification tasks. The fit() function trains the model on the training dataset.
model = GaussianNB()
model.fit(X_train, y_train)
Output:
6. Making Predictions
Now we use our trained model to predict the classification of cancer cells in the test set. The output is an array of 0s and 1s representing predicted tumor classifications.
y_pred = model.predict(X_test)
print(y_pred[:10])
Output:
[1, 0, 0, 1, 1, 0, 0, 0, 1, 1]
7. Evaluating Model Accuracy
To measure how well our model performs we will compare its predictions with the actual labels to calculate its accuracy. We will use accuracy_score from the sklearn.metrics library.
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy * 100:.2f}%")
Output:
Model Accuracy: 94.15%
This means our Naive Bayes classifier is 94.15% accurate in predicting whether a tumor is malignant or benign meaning our model is working fine and can be used for medical diagnostics.
