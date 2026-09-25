# Feature Selection

> Source: https://www.geeksforgeeks.org/machine-learning/wrapper-methods-feature-selection/

Feature selection is a key step in the machine learning pipeline. It involves choosing a subset of relevant features (also called variables or predictors) from your dataset to build efficient and accurate models. While there are many approaches to feature selection, wrapper methods are one of the most powerful and model-specific techniques.
What are Wrapper Methods?
Wrapper methods are a category of feature selection techniques that evaluate subsets of features by training a machine learning model and measuring its performance. They treat the model as a black box and use it to find the combination of features that leads to the best prediction performance.
Instead of selecting features based on statistical tests (as in filter methods), wrapper methods test multiple combinations of features and choose the best-performing one.
How Do Wrapper Methods Work?
- Select a subset of features.
- Train a model using those features.
- Evaluate model performance (e.g., accuracy, precision, RMSE).
- Repeat the process with different combinations of features.
- Choose the subset that results in the best model performance.
Types of Wrapper Methods
There are three common strategies for implementing wrapper methods:
1. Forward Selection
- Starts with no features.
- Adds one feature at a time.
- At each step, it adds the feature that improves model performance the most.
- Stops when adding more features does not improve the model.
Example use case: When you expect only a few features to be useful and want a quick way to build up a model.
2. Backward Elimination
- Starts with all features.
- Removes one feature at a time.
- At each step, it removes the feature that contributes the least to the model.
- Stops when removing more features degrades performance.
Example use case: When you suspect some features are redundant or irrelevant and want to simplify the model.
3. Recursive Feature Elimination (RFE)
- A combination of backward elimination with a recursive approach.
- Ranks all the features based on their importance.
- Recursively removes the least important ones and retrains the model.
- Continues until the desired number of features is reached.
Example use case: Widely used with support vector machines and linear models for model interpretability.
Evaluation Metrics Used
When evaluating each subset of features, wrapper methods rely on metrics like:
- Accuracy for classification problems
- Mean Squared Error (MSE) or Root Mean Squared Error (RMSE) for regression
- Cross-validation score for more reliable performance evaluation
The choice of metric should match your problem type and business goal.
Practical Example
Here’s how RFE is used in Python with scikit-learn:
from sklearn.feature_selection import RFE
from sklearn.linear_model import LogisticRegression
from sklearn.datasets import load_iris
# Load sample dataset
X, y = load_iris(return_X_y=True)
# Choose a model
model = LogisticRegression()
# Apply RFE
rfe = RFE(estimator=model, n_features_to_select=2)
rfe.fit(X, y)
# Print selected features
print("Selected features:", rfe.support_)
print("Feature ranking:", rfe.ranking_)
Output
Selected features: [False False True True]
Feature ranking: [3 2 1 1]
When to Use Wrapper Methods
Wrapper methods are ideal when:
- You want high accuracy and are okay with higher computation time.
- You’re working with a moderate number of features (e.g., 10–50).
- You want a feature set tailored specifically to a certain model.
- Your dataset has strong feature interactions that simpler methods might miss.
Tips for Using Wrapper Methods
- Always use cross-validation to avoid overfitting.
- Scale your data (e.g., StandardScaler) before feature selection, especially for distance-based models.
- Use early stopping or set a maximum number of iterations to reduce computation time.
- Consider hybrid approaches, such as applying a filter method first to reduce the number of features before using a wrapper.
Advantages
- Higher Accuracy: Can result in better performance because they consider interactions between features and the model.
- Model-Specific Optimization: Tailors the selected features for the specific algorithm being used.
- Useful for Small Datasets: Can perform well when the number of features is small to moderate.
Disadvantages
- Computationally Expensive: Since the model is retrained multiple times, it can take a long time, especially with large datasets.
- Prone to Overfitting: May overfit the training data if not combined with cross-validation.
- Not Suitable for Very High-Dimensional Data: Struggles when the number of features is much larger than the number of samples.
