# Forward Feature Selection in Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/forward-feature-selection-in-machine-learning/

In machine learning, choosing the right features is just as important as choosing the right model. Good features can boost model performance, reduce overfitting and make the results easy to interpret. One popular method for selecting useful features is Forward Feature Selection.
What Is Forward Feature Selection?
Forward Feature Selection is a greedy search algorithm used to find the most useful subset of features for your model. The idea is to start with no features and then add one feature at a time that improves the model performance the most.
At each step:
- A new feature is added to the current set.
- A model is trained using the current feature set.
- The performance of the model is evaluated (e.g., using accuracy or RMSE).
- The feature that gives the best improvement is kept.
- This process continues until no further improvement is seen or a set number of features is selected.
Step-by-Step Process
1. Start with an empty feature set.
2. Evaluate all features one at a time by training the model with just one feature.
3. Select the feature that gives the best model performance.
4. Add that feature to the feature set.
5. Repeat steps 2–4, this time adding one more feature to the already selected ones.
6. Stop when:
- A set number of features is reached,
- Adding more features doesn’t improve performance, or
- Performance starts to decrease (optional early stopping).
Why Use Forward Feature Selection?
- Helps improve model accuracy by selecting only the most relevant features.
- Reduces overfitting by excluding unnecessary data.
- Makes models faster and easier to interpret.
- Especially helpful for small datasets.
Implementation with scikit-learn
- Loads the Iris dataset (features X, labels y).
- Splits data into 70% training and 30% testing sets.
- Defines a Logistic Regression model.
- Uses forward sequential feature selection to pick the best 2 features.
- Fits the feature selector on the training data.
- Prints which features were selected (True means selected).
from sklearn.datasets import load_iris
from sklearn.linear_model import LogisticRegression
from sklearn.feature_selection import SequentialFeatureSelector
from sklearn.model_selection import train_test_split
# Load sample data
X, y = load_iris(return_X_y=True)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3)
# Define model
model = LogisticRegression(max_iter=1000)
# Forward selection
sfs = SequentialFeatureSelector(model, n_features_to_select=2, direction='forward')
sfs.fit(X_train, y_train)
# Selected features
print("Selected features:", sfs.get_support())
Output
Selected features: [False False True True]
Use Cases
- Medical diagnosis: Select the most important health indicators.
- Finance: Choose key financial ratios for risk analysis.
- Marketing: Identify customer traits that affect purchasing behavior.
- Image classification: Choose essential features when using hand-crafted inputs.
Advantages
- Simple to understand and implement
- Improves model performance by reducing noise
- Works with any machine learning model
- Avoids using irrelevant or redundant features
Disadvantages
- Computationally expensive with large datasets or many features
- Greedy approach may miss the best combination of features
- Not ideal for highly correlated features can pick similar ones
