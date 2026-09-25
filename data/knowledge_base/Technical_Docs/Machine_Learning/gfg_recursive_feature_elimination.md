# Recursive Feature Elimination

> Source: https://www.geeksforgeeks.org/machine-learning/recursive-feature-elimination/

RFE works by iteratively eliminating the least relevant features according to a model's performance, finally choosing the most informative subset. This method is model-agnostic and can be applied to linear models, support vector machines, decision trees, and so on.
Recursive Feature Elimination (RFE) is a greedy optimization technique applied to decrease the number of input features by repeatedly fitting a model and eliminating the weakest feature(s) until the specified number of features is obtained.
Process Overview:
- Train a model on the full set of features.
- Rank features based on importance (e.g., weights, coefficients).
- Remove the least important feature(s).
- Repeat the process on the reduced feature set.
The final output is a ranking of features and the subset that provides the best predictive performance.
Why Use RFE?
RFE is especially helpful when:
- The dataset contains a large number of features.
- You suspect many features are redundant or irrelevant.
- You want to improve training speed and model generalization.
RFE can improve model performance by:
- Eliminating noisy or uninformative features.
- Reducing variance in predictions.
- Making models easier to interpret.
Implementation Using scikit-learn
- RFE Initialization: RFE() takes Logistic Regression as the model and n_features_to_select= 2, which means we are to retain the first 2 highest-importance features.
- Feature Selection: RFE recursively orders features by importance and drops the smallest-importance feature until 2 features are left.
- Model Training: The model is trained with the selected features (X_train_rfe) and tested against the test set (X_test_rfe).
- Performance Evaluation: The accuracy of the model is computed after the feature selection process.
from sklearn.datasets import load_breast_cancer
from sklearn.linear_model import LogisticRegression
from sklearn.feature_selection import RFE
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
data = load_breast_cancer()
X, y = data.data, data.target
# Split dataset
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
# Define the base model
model = LogisticRegression(max_iter=5000)
# Apply RFE
rfe = RFE(estimator=model, n_features_to_select=10)
rfe.fit(X_train, y_train)
# Predict and evaluate
y_pred = rfe.predict(X_test)
print("Selected features:", rfe.support_)
print("Test Accuracy:", accuracy_score(y_test, y_pred))
Output:
Applications of RFE
RFE is widely used in various domains:
- Healthcare: To identify the most relevant biomarkers or clinical variables.
- Finance: To reduce dimensionality in stock price prediction or credit scoring.
- Text classification: To select the most important n-grams or TF-IDF terms.
- Computer vision: To select discriminative image features in object recognition.
Limitations and Considerations
While RFE is powerful, it has some limitations:
- Computational Cost: It can be slow on very large datasets or when using complex models.
- Dependency on the base model: Feature rankings depend heavily on the model used.
- Risk of overfitting: If not cross-validated properly, it can overfit during feature selection.
Best Practices
- Use cross-validation in conjunction with RFE (e.g., RFECV in scikit-learn).
- Choose a simple, interpretable base model for faster and more transparent feature selection.
- Standardize or normalize your data before applying RFE, especially with linear models.
Related Articles
