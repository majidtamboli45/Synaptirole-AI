# Customer Churn Analysis Prediction

> Source: https://www.geeksforgeeks.org/machine-learning/python-customer-churn-analysis-prediction/

Customer churn occurs when a customer stops using a company’s service lead to revenue loss. Analyzing churn helps businesses understand why customers leave and how to improve retention. High churn rates can affect revenue and business growth. By analyzing churn patterns businesses can take proactive steps to retain customers.
In this guide we will explore the Telco Customer Churn dataset to predict churn effectively.
1. Importing Libraries and Dataset
Loading the Dataset
We start by importing the necessary Python libraries and loading the Telco Customer Churn dataset. This dataset contains various customer details such as service plans, usage behavior and churn status. You can download the dataset from here.
import numpy as np
import pandas as pd
# give you file path here
dataset = pd.read_csv('/filename')
dataset.head()
Output:
Understanding the Dataset
To gain insights into the dataset we first check for missing values and understand its structure. The dataset includes features such as:
print(dataset.isnull().sum())
print(dataset.describe())
Output:
- tenure – The number of months a customer has stayed with the company.
- InternetService – The type of internet service the customer has DSL, Fiber optic or None.
- PaymentMethod– The method the customer uses for payments.
- Churn – The target variable i.e Yes for customer churned and No for customer stayed.
Analyzing Churn Distribution
We check the number of churners and non-churners to understand the balance of the dataset.
import seaborn as sns
import matplotlib.pyplot as plt
print(dataset['Churn'].value_counts())
sns.countplot(x='Churn', data=dataset, palette='coolwarm')
plt.title('Churn Distribution')
plt.xlabel('Churn (0 = No, 1 = Yes)')
plt.ylabel('Count')
plt.show()
Output:
2. Data Preprocessing
Handling Missing and Incorrect Values
Before processing we ensure that all numerical columns contain valid values. The TotalCharges column sometimes has empty spaces which need to be converted to numerical values.
- pd.to_numeric(dataset['TotalCharges'], errors='coerce') converts the TotalCharges column to numerical format. If any value is not convertible (e.g., empty spaces), it replaces it with NaN.
- .fillna(dataset['TotalCharges'].median(), inplace=True) replaces missing values (NaN) with the median of the column to maintain consistency in numerical values.
dataset['TotalCharges'] = pd.to_numeric(dataset['TotalCharges'], errors='coerce')
dataset['TotalCharges'].fillna(dataset['TotalCharges'].median(), inplace=True)
Handling Categorical Variables
Some features like State, International Plan and Voice Mail Plan are categorical and must be converted into numerical values for model training.
- LabelEncoder() converts categorical values into numerical form. Each unique category is assigned a numeric label.
- The loop iterates through each categorical column and applies fit_transform() to encode categorical variables into numbers.
from sklearn.preprocessing import LabelEncoder
labelencoder = LabelEncoder()
categorical_cols = ['gender', 'Partner', 'Dependents', 'PhoneService', 'MultipleLines', 'InternetService', 
                    'OnlineSecurity', 'OnlineBackup', 'DeviceProtection', 'TechSupport', 'StreamingTV', 
                    'StreamingMovies', 'Contract', 'PaperlessBilling', 'PaymentMethod', 'Churn']
for col in categorical_cols:
    dataset[col] = labelencoder.fit_transform(dataset[col])
Feature Selection and Splitting Data
We separate the features (X) and target variable (y) and split the dataset into training and testing sets.
- X = dataset.drop(['customerID', 'Churn'], axis=1) removes the customerID (irrelevant for prediction) and Churn column (target variable).
- y = dataset['Churn'] defines y as the target variable, which we want to predict.
- train_test_split() splits data into 80% training and 20% testing for model evaluation.
from sklearn.model_selection import train_test_split
X = dataset.drop(['customerID', 'Churn'], axis=1)
y = dataset['Churn']
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=0)
Feature Scaling
Since features are on different scales we apply standardization to improve model performance. It prevents models from being biased toward larger numerical values and improves convergence speed in optimization algorithms like gradient descent
- StandardScaler(): Standardizes data by transforming it to have a mean of 0 and a standard deviation of 1 ensuring all features are on a similar scale.
- fit_transform(X_train): Fits the scaler to the training data and transforms it.
- transform(X_test): Transforms the test data using the same scaling parameters.
from sklearn.preprocessing import StandardScaler
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)
3. Model Training and Prediction
For training our model we use Random Forest Classifier. It is an ensemble learning method that combines the results of multiple decision trees to make a final prediction.
from sklearn.ensemble import RandomForestClassifier
clf = RandomForestClassifier()
clf.fit(X_train, y_train)
y_pred = clf.predict(X_test)
Output:
4. Model Evaluation
Accuracy Score
To measure model performance we calculate accuracy using the accuracy_score function.
from sklearn.metrics import accuracy_score
accuracy = accuracy_score(y_test, y_pred)
print(f"Model Accuracy: {accuracy:.2f}")
Output:
Model Accuracy: 0.78
Confusion Matrix and Performance Metrics
We evaluate precision, recall and accuracy using a confusion matrix.
from sklearn.metrics import confusion_matrix, ConfusionMatrixDisplay
cm = confusion_matrix(y_test, y_pred)
disp = ConfusionMatrixDisplay(confusion_matrix=cm, display_labels=["No Churn", "Churn"])
disp.plot(cmap="coolwarm")
plt.title('Confusion Matrix')
plt.show()
Output:
Confusion matrix shows how well the model predicts customer churn. It correctly identifies 924 non-churners and 181 churners. However 117 non-churners are wrongly classified as churners and 187 churners are missed. The high number of missed churners suggests the model may need further tuning.
