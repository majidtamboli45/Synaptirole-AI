# Voting Classifier using Sklearn

> Source: https://www.geeksforgeeks.org/machine-learning/ml-voting-classifier-using-sklearn/

A Voting Classifier is a ensemble learning technique that combines multiple individual models to make predictions. It predicts output based on majority decision of the models. Instead of using a single model to make predictions, a Voting Classifier trains multiple models and makes the final prediction by aggregating their results. It supports two types of votings :
1. Hard Voting
In hard voting each classifier casts a "vote" for a class. The class that gets the most votes is the final prediction. For example:
- Classifier 1 predicts: Class A
- Classifier 2 predicts: Class A
- Classifier 3 predicts: Class B
Here Class A gets two votes and Class B gets one vote so the final prediction is Class A.
2. Soft Voting
In soft voting instead of choosing the class with the most votes we take the average of the predicted probabilities for each class. The class with the highest average probability is the final prediction. For example suppose three models predict the following probabilities for two classes (A and B):
- Class A: [0.30, 0.47, 0.53]
- Class B: [0.20, 0.32, 0.40]
The average probability for Class A is 
Python Implementation of Voting Classifier
Step 1: Import Required Libraries
We first need to import the necessary libraries for classifier, dataset and model evaluation.
from sklearn.ensemble import VotingClassifier
from sklearn.linear_model import LogisticRegression
from sklearn.svm import SVC
from sklearn.tree import DecisionTreeClassifier
from sklearn.datasets import load_iris
from sklearn.metrics import accuracy_score
from sklearn.model_selection import train_test_split
Step 2: Load the Dataset
We will use the Iris dataset which is a popular dataset for classification tasks. The load_iris() function provides the dataset and we will extract features and labels.
iris = load_iris()
X = iris.data[:, :4]  
Y = iris.target  
Step 3: Split the Data into Training and Testing Sets
We need to divide the data into training and testing sets. We'll use 80% of the data for training and 20% for testing with the help of train_test_split() function.
X_train, X_test, y_train, y_test = train_test_split(X, Y, test_size=0.20, random_state=42)
Step 4: Create Ensemble of Models
We will create a list of different classifiers to combine into our Voting Classifier. Here we are using Logistic Regression, Support Vector Classifier (SVC) and Decision Tree Classifier.
models = [
    ('LR', LogisticRegression(solver='lbfgs', multi_class='multinomial', max_iter=200)),
    ('SVC', SVC(gamma='auto', probability=True)),
    ('DTC', DecisionTreeClassifier())
]
Step 5: Initialize and Train the Voting Classifier with Hard Voting
We will first create a Voting Classifier that uses Hard Voting. This mean each classifier will vote for a class and the class with the most votes wins. After initializing we will fit the classifier to the training data.
vot_hard = VotingClassifier(estimators=models, voting='hard')
vot_hard.fit(X_train, y_train)
Step 6: Making Predictions and Evaluating
We use the trained Hard Voting classifier to predict the test set and calculate the accuracy.
y_pred = vot_hard.predict(X_test)
score = accuracy_score(y_test, y_pred)
print("Hard Voting Accuracy: %d" % score)
Output:
Hard Voting Accuracy: 1
Step 7: Initialize and Train the Voting Classifier with Soft Voting
Next, we will create a Soft Voting classifier. Soft voting takes the average probability of each class from all the classifiers and selects the class with the highest average probability.
vot_soft = VotingClassifier(estimators=models, voting='soft')
vot_soft.fit(X_train, y_train)
Step 8: Making Predictions and Evaluating
Finally we will use the Soft Voting classifier to predict the test set and calculate its accuracy.
y_pred = vot_soft.predict(X_test)
score = accuracy_score(y_test, y_pred)
print("Soft Voting Accuracy: %d" % score)
Output:
Soft Voting Accuracy: 1
Both Hard and Soft Voting classifiers gave 100% accurate results. Hard Voting used majority votes while Soft Voting average prediction probabilities to make correct predictions.
