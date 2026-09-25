# Train a model using CatBoost

> Source: https://www.geeksforgeeks.org/machine-learning/train-a-model-using-catboost/

CatBoost (Categorical Boosting) is a gradient boosting algorithm developed by Yandex for solving classification, regression, and ranking problems. It builds an ensemble of decision trees sequentially, where each new tree learns to correct the errors made by the previous ones.
- Handles categorical features automatically, reducing the need for manual encoding techniques.
- Uses ordered boosting, which minimizes prediction bias and helps prevent overfitting.
- Requires minimal data preprocessing, allowing faster model development.
- Delivers high accuracy on structured and tabular datasets with default hyperparameters.
Working
1. Load and Prepare the Dataset
- The training dataset is loaded, and the input features and target variable are identified.
- CatBoost can automatically process categorical features, reducing the need for extensive preprocessing.
2. Initialize the CatBoost Model
- A CatBoost model is created by specifying hyperparameters such as the number of boosting iterations, learning rate, tree depth, and loss function.
- These parameters control how the model learns from the data.
3. Build the First Decision Tree
- The algorithm starts by constructing an initial decision tree using the training data.
- This tree makes the first set of predictions for all training samples.
4. Calculate Prediction Errors
- The predictions made by the current model are compared with the actual target values to calculate the prediction error.
- The objective is to minimize this error during subsequent iterations.
5. Train New Trees Sequentially
- A new decision tree is trained to correct the errors made by the previous trees.
- Each new tree focuses more on samples that were difficult to predict, gradually improving the overall model performance.
6. Apply Ordered Boosting
- Instead of using standard gradient boosting, CatBoost employs ordered boosting, where each prediction is made using only information available before that sample.
- This reduces target leakage and helps prevent overfitting.
7. Update the Model
- The predictions from the newly created tree are combined with the existing ensemble using the specified learning rate.
- This process continues until the desired number of boosting iterations is completed.
8. Make Predictions
- After training, the final CatBoost model combines the predictions from all decision trees to generate accurate predictions for unseen data.
Implementation Using CatBoost
Step 1: Import Required Libraries
- First, import the libraries required for data manipulation, visualization, model training, and evaluation.
- The Breast Cancer dataset is loaded directly from Scikit-learn, while CatBoost is used as the classification algorithm.
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.metrics import (
    accuracy_score,
    classification_report,
    confusion_matrix
)
from catboost import CatBoostClassifier
from catboost import CatBoostClassifier
Step 2: Load the Dataset
Load the Breast Cancer Wisconsin dataset from Scikit-learn and convert it into a Pandas DataFrame for easier analysis and preprocessing.
# Load dataset
data = load_breast_cancer()
df = pd.DataFrame(data.data, columns=data.feature_names)
df["target"] = data.target
df.head()
Step 3: Perform Exploratory Data Analysis (EDA)
Before training the model, it is important to understand the dataset by examining its structure, checking for missing values, viewing summary statistics, and visualizing important patterns.
print(df.info())
print(df.isnull().sum())
print(df.describe())
plt.figure(figsize=(6,6))
A. Visualize Target Distribution
plt.figure(figsize=(6,6))
df["target"].value_counts().plot(
    kind="pie",
    autopct="%1.1f%%",
    labels=["Benign","Malignant"]
)
plt.title("Target Distribution")
plt.ylabel("")
plt.show()
Output:
B. Correlation Heatmap
plt.figure(figsize=(14, 12))
sns.heatmap(
    df.corr(),
    cmap="coolwarm",
    linewidths=0.5
)
plt.title("Correlation Heatmap")
plt.show()
Output:
C. Feature Distribution
features = [
    "mean radius",
    "mean texture",
    "mean perimeter",
    "mean area"
]
df[features].hist(
    figsize=(10,8),
    bins=20
)
plt.suptitle("Distribution of Important Features")
plt.tight_layout()
plt.show()
Step 4: Data Preprocessing
Separate the input features from the target variable. The model uses the feature values to predict whether a tumor is benign or malignant.
X = df.drop("target", axis=1)
y = df["target"]
Step 5: Split the Dataset
Split the dataset into training and testing sets. The training set is used to train the model, while the testing set is reserved for evaluating its performance on unseen data.
X_train, X_test, y_train, y_test = train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)
Step 6: Initialize the CatBoost Model
Create the CatBoost classifier by specifying the number of boosting iterations, learning rate, tree depth, and evaluation metric.
model = CatBoostClassifier(
    iterations=300,
    learning_rate=0.1,
    depth=6,
    loss_function="Logloss",
    eval_metric="Accuracy",
    random_seed=42,
    verbose=100
)
Step 7: Train the Model
Train the CatBoost classifier using the training dataset. During training, CatBoost sequentially builds decision trees that reduce prediction errors.
model.fit(X_train, y_train)
Output:
0: learn: 0.9362637
100: learn: 1.0000000
200: learn: 1.0000000
299: learn: 1.0000000
Step 8: Make Predictions
Use the trained CatBoost model to predict the class labels for the testing dataset.\
y_pred = model.predict(X_test)
Step 9: Evaluate the Model
Evaluate the trained model using classification metrics and a confusion matrix.
accuracy = accuracy_score(y_test, y_pred)
print("Accuracy:", accuracy)
print(classification_report(y_test, y_pred))
print(confusion_matrix(y_test, y_pred))
Output:
Accuracy: 0.9649122807017544
Step 10: Display Feature Importance
CatBoost provides feature importance scores that indicate how much each feature contributes to the model's predictions.
importance = model.get_feature_importance()
feature_importance = pd.DataFrame({
    "Feature": X.columns,
    "Importance": importance
})
feature_importance = feature_importance.sort_values(
    by="Importance",
    ascending=False
)
print(feature_importance.head(10))
Output:
You can downlaod the code from here.
Important Hyperparameters of CatBoost
| Hyperparameter | Description | 
|---|---|
| iterations | Specifies the number of boosting rounds (trees) to build. Increasing the value may improve accuracy but also increases training time. | 
| learning_rate | Controls the contribution of each tree to the final model. Smaller values generally require more iterations but often produce better generalization. | 
| depth | Determines the maximum depth of each decision tree. Larger depths allow the model to capture more complex patterns but may increase overfitting. | 
| loss_function | Defines the optimization objective such as Logloss for binary classification or RMSE for regression tasks. | 
| eval_metric | Specifies the metric used to evaluate model performance during training, such as Accuracy, AUC, or F1-score. | 
| l2_leaf_reg | Applies L2 regularization to leaf values, helping reduce overfitting and improve model generalization. | 
| random_seed | Sets the random seed to ensure reproducible training results. | 
| verbose | Controls how frequently the training progress is displayed during model fitting. | 
Applications
- Healthcare: Predicts diseases, diagnoses medical conditions, and assists in patient risk assessment using clinical data.
- Finance: Detects fraudulent transactions, evaluates credit risk, and predicts loan defaults.
- Customer Analytics: Performs customer churn prediction, customer segmentation, and lifetime value estimation.
- E-commerce: Powers product recommendation systems, demand forecasting, and sales prediction.
- Marketing: Predicts customer responses to campaigns and improves targeted advertising.
- Manufacturing: Supports predictive maintenance, quality inspection, and equipment failure prediction.
- Education: Predicts student performance, placement outcomes, and learning success using academic records.
Advantages
- Handles categorical features directly without requiring manual encoding.
- Delivers high prediction accuracy on structured and tabular datasets.
- Reduces overfitting through ordered boosting and effective regularization.
- Requires minimal data preprocessing, making model development faster.
- Handles missing values automatically during training.
- Supports both classification and regression problems.
- Provides feature importance scores to improve model interpretability.
- Offers GPU acceleration for faster training on large datasets.
Limitations
- Training can be slower than simpler algorithms on very large datasets.
- Uses more memory than some traditional machine learning models.
- Performance depends on selecting appropriate hyperparameters.
- Less suitable for unstructured data such as images, audio, or raw text without additional preprocessing.
- Large numbers of boosting iterations can increase training time.
- Model interpretation is more difficult than a single decision tree.
- GPU acceleration may not provide significant benefits for small datasets.
