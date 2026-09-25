# Logistic Regression in Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/understanding-logistic-regression/

Logistic Regression is a supervised machine learning algorithm used for classification problems. Unlike linear regression, which predicts continuous values it predicts the probability that an input belongs to a specific class.
- It is used for binary classification where the output can be one of two possible categories such as Yes/No, True/False or 0/1.
- It uses sigmoid function to convert inputs into a probability value between 0 and 1.
Types
- Binomial Logistic Regression: Used when the dependent variable has only two possible categories, such as Yes/No, Pass/Fail, or 0/1. It is the most common type and is used for binary classification tasks.
- Multinomial Logistic Regression: Used when the dependent variable has three or more unordered categories. For example, classifying animals as cat, dog, or sheep. It extends logistic regression to handle multiple classes.
- Ordinal Logistic Regression: Used when the dependent variable has three or more categories with a natural order, such as Low, Medium, and High. It considers the ranking of categories during prediction.
Assumptions
- Independent Observations: Each data point should be independent of the others, meaning there should be no dependence between observations.
- Binary Dependent Variable: The target variable is typically binary and can take only two values, such as 0/1 or Yes/No. For multiclass problems, extensions such as Softmax-based logistic regression are used.
- Linearity of Log-Odds: The independent variables should have a linear relationship with the log-odds of the dependent variable.
- No Extreme Outliers: Extreme outliers can distort coefficient estimates and negatively affect model performance.
- Large Sample Size: A sufficiently large dataset helps produce more reliable and stable predictions.
Understanding Sigmoid Function
1. The sigmoid function is a key component of Logistic Regression that converts the model's raw output into a probability value between 0 and 1.
2. This function takes any real number and maps it into the range 0 to 1 forming an "S" shaped curve called the sigmoid curve or logistic curve. Because probabilities must lie between 0 and 1, the sigmoid function is perfect for this purpose.
3. In logistic regression, we use a threshold value usually 0.5 to decide the class label.
- If the sigmoid output is same or above the threshold, the input is classified as Class 1.
- If it is below the threshold, the input is classified as Class 0.
This approach helps to transform continuous input values into meaningful class predictions.
Working
Logistic regression computes a linear combination of input features (z = w·X + b) and passes it through a sigmoid function to produce a probability between 0 and 1. This probability is then used to assign the input to a class.
Suppose we have input features represented as a matrix:
 
 and the dependent variable is 
then, apply the multi-linear function to the input variables X.
Here 
At this stage, 
Now we use the sigmoid function where the input will be z and we find the probability between 0 and 1. i.e. predicted y.
As shown above the sigmoid function converts the continuous variable data into the probability i.e between 0 and 1.
- \sigma(z) tends towards 1 asz\rightarrow\infty
- \sigma(z) tends towards 0 asz\rightarrow-\infty
- \sigma(z) is always bounded between 0 and 1
where the probability of being a class can be measured as:
Logistic Regression Equation and Odds
It models the odds of the dependent event occurring which is the ratio of the probability of the event to the probability of it not occurring:
Taking the natural logarithm of the odds gives the log-odds or logit:
then the final logistic regression equation will be:
This formula represents the probability of the input belonging to Class 1.
Likelihood Function for Logistic Regression
The goal is to find weights 
For each data point 
- for y=1 , predicted probabilities will be: p(X;b,w) =p(x)
- for y=0 The predicted probabilities will be: 1-p(X;b,w) =1-p(x)
Taking natural logs on both sides:
This is known as the log-likelihood function.
Gradient of the log-likelihood function
To find the best 
Terminologies Used
- Independent Variables: These are the input features or predictor variables used to make predictions about the dependent variable.
- Dependent Variable: This is the target variable that we aim to predict. In logistic regression, the dependent variable is categorical.
- Logistic Function: This function transforms the independent variables into a probability between 0 and 1 which represents the likelihood that the dependent variable is either 0 or 1.
- Odds: This is the ratio of the probability of an event happening to the probability of it not happening. It differs from probability because probability is the ratio of occurrences to total possibilities.
- Log-Odds (Logit): The natural logarithm of the odds. In logistic regression, the log-odds are modeled as a linear combination of the independent variables and the intercept.
- Coefficient: These are the parameters estimated by the logistic regression model which shows how strongly the independent variables affect the dependent variable.
- Intercept: The constant term in the logistic regression model which represents the log-odds when all independent variables are equal to zero.
- Maximum Likelihood Estimation (MLE): This method is used to estimate the coefficients of the logistic regression model by maximizing the likelihood of observing the given data.
Implementation
Logistic regression can be implemented in Python for the following two types:
1. Binomial Logistic regression:
In binomial logistic regression, the target variable can only have two possible values such as "0" or "1", "pass" or "fail". The sigmoid function is used for prediction.
We will be using Scikit-learn library for this and shows how to use the breast cancer dataset to implement a Logistic Regression model for classification.
from sklearn.datasets import load_breast_cancer
from sklearn.linear_model import LogisticRegression
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
X, y = load_breast_cancer(return_X_y=True)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.20, random_state=23)
clf = LogisticRegression(max_iter=10000, random_state=0)
clf.fit(X_train, y_train)
acc = accuracy_score(y_test, clf.predict(X_test)) * 100
print(f"Logistic Regression model accuracy: {acc:.2f}%")
Output:
Logistic Regression model accuracy (in %): 96.49%
This code uses logistic regression to classify whether a sample from the breast cancer dataset is malignant or benign.
2. Multinomial Logistic Regression:
Target variable can have 3 or more possible types which are not ordered i.e types have no quantitative significance like “disease A” vs “disease B” vs “disease C”.
In this case, the softmax function is used in place of the sigmoid function. Softmax function for K classes will be:
Here 
Then the probability for class 
Below is an example of implementing multinomial logistic regression using the Digits dataset from scikit-learn:
from sklearn.model_selection import train_test_split
from sklearn import datasets, linear_model, metrics
digits = datasets.load_digits()
X = digits.data
y = digits.target
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=1)
reg = linear_model.LogisticRegression(max_iter=10000, random_state=0)
reg.fit(X_train, y_train)
y_pred = reg.predict(X_test)
print(f"Logistic Regression model accuracy: {metrics.accuracy_score(y_test, y_pred) * 100:.2f}%")
Output:
Logistic Regression model accuracy: 96.66%
This model is used to predict one of 10 digits (0-9) based on the image features.
Evaluation Metrics for Logistic Regression
Evaluating the logistic regression model helps assess its performance and ensure it generalizes well to new, unseen data. The following metrics are commonly used:
1. Accuracy: Accuracy provides the proportion of correctly classified instances.
Accuracy = \frac{True \, Positives + True \, Negatives}{Total} 
2. Precision: Precision focuses on the accuracy of positive predictions.
Precision = \frac{True \, Positives }{True\, Positives + False \, Positives} 
3. Recall (Sensitivity or True Positive Rate): Recall measures the proportion of correctly predicted positive instances among all actual positive instances.
Recall = \frac{ True \, Positives}{True\, Positives + False \, Negatives} 
4. F1 Score: F1 score is the harmonic mean of precision and recall.
F1 \, Score = 2 * \frac{Precision * Recall}{Precision + Recall} 
5. Area Under the Receiver Operating Characteristic Curve (AUC-ROC): The ROC curve plots the true positive rate against the false positive rate at various thresholds. AUC-ROC measures the area under this curve which provides an aggregate measure of a model's performance across different classification thresholds.
6. Area Under the Precision-Recall Curve (AUC-PR): Similar to AUC-ROC, AUC-PR measures the area under the precision-recall curve helps in providing a summary of a model's performance across different precision-recall trade-offs.
Differences Between Linear and Logistic Regression
| Aspect | Linear Regression | Logistic Regression | 
|---|---|---|
| Definition | Linear regression is used to predict the continuous dependent variable using a given set of independent variables. | Logistic regression is used to predict the categorical dependent variable using a given set of independent variables. | 
| Problem Type | It is used for solving regression problem. | It is used for solving classification problems. | 
| Output Type | In this we predict the value of continuous variables. | In this we predict values of categorical variables. | 
| Curve/Model Fitting | In this we find best fit line. | In this we find S-Curve. | 
| Estimation Method | Least square estimation method is used for estimation of accuracy. | Maximum likelihood estimation method is used for estimation of accuracy. | 
| Output Example | The output must be continuous value such as price, age etc. | Output must be categorical value such as 0 or 1, Yes or No, etc. |
