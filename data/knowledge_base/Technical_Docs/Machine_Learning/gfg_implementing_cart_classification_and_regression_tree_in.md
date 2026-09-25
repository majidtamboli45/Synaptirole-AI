# Implementing CART (Classification And Regression Tree) in Python

> Source: https://www.geeksforgeeks.org/machine-learning/implementing-cart-classification-and-regression-tree-in-python/

Classification and Regression Trees (CART) are a type of decision tree algorithm used in machine learning and statistics for predictive modeling. CART is versatile, used for both classification (predicting categorical outcomes) and regression (predicting continuous outcomes) tasks. Here we check the CART methodology, its implementation, and its applications in real-world scenarios.
Table of Content
Understanding CART
CART is a decision tree algorithm that splits a dataset into subsets based on the most significant variable. The goal is to create the purest subsets possible, where "pure" means that the subset contains only instances of a single class (for classification) or has minimal variance (for regression). The main types of CART are:
- Classification Trees: Used when the target variable is categorical. For example, predicting whether an email is spam or not.
- Regression Trees: Used when the target variable is continuous. For example, predicting house prices based on features like size and location.
Implementing CART for Classification: Step-By-Step Guide
CART builds a decision tree to make predictions. A decision tree is a flowchart-like structure where each branch represents a decision or test. The main steps which are include:
- Start with All Data: Begin with the entire dataset, where each data point has a known outcome (either a category or a numerical value).
- Find the Best Split: CART looks for the best way to split the data into subsets. The goal is to make each subset as similar as possible with respect to the target outcome. For classification, this means making subsets where most items belong to the same category. For regression, this means making subsets where the outcomes are as close to each other as possible.
- Repeat the Process: The process of splitting is repeated for each subset, creating branches and sub-branches in the tree. This continues until the subsets are pure enough (i.e., they are homogeneous) or the tree reaches a certain size limit.
- Make Predictions: Once the tree is built, we can use it to make predictions. To do this, we start at the top of the tree and follow the branches based on the values of our input data until we reach a leaf node. The value or category in the leaf node is the prediction.
Let's implement CART analysis using Python’s scikit-learn library.
Step 1: Importing Libraries
- Imports the NumPy library, which is used for numerical operations and array handling.
- Imports the Pandas library, used for data manipulation and analysis.
- load_iris function from scikit-learn, which provides access to the Iris dataset.
- train_test_split function, used to split data into training and test sets.
- Imports the DecisionTreeClassifier class, used to create and train a classification decision tree.
- The metrics functions to evaluate the performance of the model.
- Matplotlib’s pyplot module for data visualization.
- The tree module from scikit-learn, which contains functions to visualize decision trees.
import numpy as np
import pandas as pd
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import classification_report, accuracy_score
import matplotlib.pyplot as plt
from sklearn import tree
Step 2: Load the Dataset
- Loads the Iris dataset, which contains features and target values. The dataset is stored as a Bunch object, a dictionary-like structure.
- Extracts the feature matrix (input variables) from the dataset.
- Extracts the target vector (output labels) from the dataset.
- Converts the feature matrix into a Pandas DataFrame for easier manipulation. The columns are labeled with feature names.
- Adds a new column to the DataFrame with the species names corresponding to the target labels.
iris = load_iris()
X = iris.data  # Features
y = iris.target  # Target variable
# Convert to DataFrame for easier handling
iris_df = pd.DataFrame(data=iris.data, columns=iris.feature_names)
iris_df['species'] = iris.target_names[iris.target]
Step 3: Split the Data
- Splits the feature matrix and target vector into training and test sets.
  - X: Features to split.
  - y: Target values to split.
  - test_size=0.3: Specifies that 30% of the data should be used for testing, and the remaining 70% for training.
  - random_state=42: Sets a random seed for reproducibility, ensuring the same split every time the code is run.
- Variables holding the training and test data.
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
Step 4: Train the Classification Tree
- Creates an instance of the DecisionTreeClassifier with the Gini impurity criterion for splitting and a fixed random state for reproducibility.
- Trains the decision tree model using the training data.
clf = DecisionTreeClassifier(criterion='gini', random_state=42)
clf.fit(X_train, y_train)
Step 5: Make Predictions and Evaluate
- Uses the trained model to make predictions on the test set.
- Prints the accuracy of the model, which is the proportion of correct predictions.
- Prints a detailed classification report.
- Generates a report showing precision, recall, and F1-score for each class. target_names maps numeric labels to actual class names.
y_pred = clf.predict(X_test)
print("Accuracy Score:", accuracy_score(y_test, y_pred))
print("Classification Report:")
print(classification_report(y_test, y_pred, target_names=iris.target_names))
Output:
Accuracy Score: 1.0
Classification Report:
precision recall f1-score support
setosa 1.00 1.00 1.00 19
versicolor 1.00 1.00 1.00 13
virginica 1.00 1.00 1.00 13
accuracy 1.00 45
macro avg 1.00 1.00 1.00 45
weighted avg 1.00 1.00 1.00 45
Step 6: Visualize the Decision Tree
- Sets the size of the figure for visualization.
  - tree.plot_tree(clf, feature_names=iris.feature_names, class_names=iris.target_names, filled=True): Plots the decision tree.
  - clf: The trained decision tree model.
  - feature_names=iris.feature_names: Labels the feature names on the plot.
  - class_names=iris.target_names: Labels the class names on the plot.
  - filled=True: Colors the nodes based on the majority class in that node.
- plt.show(): Displays the plot.
plt.figure(figsize=(20,10))
tree.plot_tree(clf, feature_names=iris.feature_names, class_names=iris.target_names, filled=True)
plt.show()
Output:
Implementing CART for Regression
We will use the Diabetes dataset to demonstrate how to implement CART for a regression task.
Step 1: Import Libraries and Load Dataset
import numpy as np
from sklearn.datasets import load_diabetes
from sklearn.tree import DecisionTreeRegressor
from sklearn.model_selection import train_test_split
from sklearn.metrics import mean_squared_error, r2_score
# Load the Diabetes dataset
diabetes = load_diabetes()
X = diabetes.data  # Features
y = diabetes.target  # Target variable
Step 2: Split the Dataset
# Split dataset into training set and test set
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
Step 3: Create and Train the CART Model
# Create Decision Tree regressor object
tree_regressor = DecisionTreeRegressor(random_state=42)
# Train Decision Tree Regressor
tree_regressor.fit(X_train, y_train)
Step 4: Make Predictions and Evaluate the Model
# Predict the response for test dataset
y_pred = tree_regressor.predict(X_test)
# Model Evaluation
mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)
print("Mean Squared Error:", mse)
print("R^2 Score:", r2)
Output:
Mean Squared Error: 4976.797752808989
R^2 Score: 0.060653981041140725
Conclusion
CART analysis is a powerful tool in machine learning used to build predictive models through decision trees. By Knowing the break down of data into smaller, homogeneous subsets, CART helps in making accurate predictions for both categorical and numerical outcomes. Its simplicity and Useful features make it a popular choice for many real-world applications. By this we can better perform the role in data exploration, decision support, and predictive modeling.
