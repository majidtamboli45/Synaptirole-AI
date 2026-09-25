# Rest strategy for Multi

> Source: https://www.geeksforgeeks.org/machine-learning/one-vs-rest-strategy-for-multi-class-classification/

Prerequisite: Getting Started with Classification/
Classification is perhaps the most common Machine Learning task. Before we jump into what One-vs-Rest (OVR) classifiers are and how they work, you may follow the link below and get a brief overview of what classification is and how it is useful.
In general, there are two types of classification algorithms:
            python3 
     
 Output: 
- Binary classification algorithms.
- Multi-class classification algorithms.
- Logistic Regression
- Support Vector Machines (SVM)
- Perceptron Models
- Problem 1 : Banana vs [Orange, Apple]
- Problem 2 : Orange vs [Banana, Apple]
- Problem 3 : Apple vs [Banana, Orange]
from sklearn.datasets import load_wine
from sklearn.multiclass import OneVsRestClassifier
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report
from sklearn.model_selection import train_test_split
import warnings
 
''' 
We are ignoring warnings because of a peculiar fact about this
dataset. The 3rd label, 'Label2' is never predicted and so the python 
interpreter throws a warning. However, this can safely be ignored because 
we are not concerned if a certain label is predicted or not 
'''
warnings.filterwarnings('ignore')
 
# Loading the dataset
dataset = load_wine()
X = dataset.data
y = dataset.target
 
# Splitting the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size = 0.1, random_state = 13)
 
# Creating the SVM model
model = OneVsRestClassifier(SVC())
 
# Fitting the model with training data
model.fit(X_train, y_train)
 
# Making a prediction on the test set
prediction = model.predict(X_test)
 
# Evaluating the model
print(f"Test Set Accuracy : {accuracy_score(
    y_test, prediction) * 100} %\n\n")
print(f"Classification Report : \n\n{classification_report(
    y_test, prediction)}")
Test Set Accuracy : 66.66666666666666 %
Classification Report : 
              precision    recall  f1-score   support
           0       0.62      1.00      0.77         5
           1       0.70      0.88      0.78         8
   micro avg       0.67      0.92      0.77        13
   macro avg       0.66      0.94      0.77        13
weighted avg       0.67      0.92      0.77        13
We get a test set accuracy of approximately 66.667%. This is not bad for this dataset. This dataset is notorious for being difficult to classify and the benchmark accuracy is 62.4 +- 0.4 %. So, our result is actually quite good.
Conclusion: 
Now that you know how to use the One-vs-Rest heuristic method for performing multi-class classification with binary classifiers, you can try using it next time you have to perform some multi-class classification task.
