# Feature Selection

> Source: https://www.geeksforgeeks.org/machine-learning/feature-selection-embedded-methods/

In machine learning, having too many features (also called variables or columns) can lead to complex models that are hard to understand and may not perform well. Feature selection helps us choose only the most important features, making models faster, simpler, and often more accurate.
There are three main types of feature selection methods:
- Filter methods
- Wrapper methods
- Embedded methods
What Are Embedded Methods?
Embedded methods combine the best parts of filter and wrapper methods. They choose important features as the model is being trained. This makes them faster than wrapper methods and often more accurate than filter methods.
These methods are usually part of the learning algorithm itself. Examples include decision trees, regularization methods like Lasso, and some types of linear models.
Why Use Embedded Methods?
- Built-in feature selection: No separate process is needed
- Efficient: Work during training
- Better accuracy: Consider feature importance with the model
- Fewer irrelevant features: Helps avoid overfitting
Common Embedded Methods
Let’s look at the most popular embedded methods used in machine learning.
1. Lasso Regression (L1 Regularization)
Lasso stands for Least Absolute Shrinkage and Selection Operator. It is a type of linear regression that uses L1 regularization, which can shrink some feature weights to zero. When a feature’s weight becomes zero, the model ignores it.
Formula:
\text{Loss} = \text{MSE} + \lambda \sum_{j=1}^{n} |w_j| 
Where:
- MSE is Mean Squared Error
- wj is the weight of feature
- \lambda is a tuning parameter (regularization strength)
When 
Python Code Example:
- Import libraries: Load Lasso , the California housing dataset, and utilities for splitting data and handling DataFrames.
- Load dataset: X contains features like house age, income, etc. y is the median house value.
- Split data: 70% training, 30% testing using train_test_split .
- Train Lasso model: Lasso regression with alpha=0.1 is trained on the data. Lasso automatically reduces coefficients of less important features to zero.
- Select important features: Features with non-zero coefficients are considered selected. The code prints them.
from sklearn.linear_model import Lasso
from sklearn.datasets import fetch_california_housing # Import California housing dataset
from sklearn.model_selection import train_test_split
import pandas as pd
california_housing = fetch_california_housing() # Load California housing dataset
X = pd.DataFrame(california_housing.data, columns=california_housing.feature_names)
y = california_housing.target # Use the target from the new dataset
# Train-test split
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
# Fit Lasso model
model = Lasso(alpha=0.1)
model.fit(X_train, y_train)
# Check selected features
selected_features = X.columns[model.coef_ != 0]
print("Selected Features:", selected_features.tolist())
Output
2. Ridge vs Lasso vs ElasticNet
- Ridge (L2 Regularization): Shrinks weights but doesn’t remove features.
- Lasso (L1): Shrinks and removes features.
- ElasticNet: Combines both L1 and L2.
ElasticNet Formula:
Useful when there are many correlated features.
3. Decision Trees and Tree-Based Models
Tree-based models like Decision Trees, Random Forests, and Gradient Boosting automatically rank features by importance.
How It Works:
- At each split, the model chooses the best feature.
- The more a feature is used, the more important it is.
4. Regularized Logistic Regression
Just like Lasso works for linear regression, it also works for classification using logistic regression.
Formula:
Used for binary classification with automatic feature selection.
5. Support Vector Machine (SVM) with L1 Penalty
SVMs can also be used with L1 regularization to remove irrelevant features. This is called L1-SVM. It's more advanced but helpful when features are many and irrelevant ones need to be removed.
Advantages of Embedded Methods
- Combine training and selection in one step
- Faster than wrapper methods
- Often more accurate than filter methods
- Help avoid overfitting by removing useless features
Limitations of Embedded Methods
- Model-dependent: Only work with certain algorithms
- Hard to interpret for black-box models like boosting or ensemble trees
- Regularization strength () needs tuning
