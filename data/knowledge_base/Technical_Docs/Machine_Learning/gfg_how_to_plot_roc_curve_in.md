# How to plot ROC curve in Python

> Source: https://www.geeksforgeeks.org/machine-learning/how-to-plot-roc-curve-in-python/

The Receiver Operating Characteristic (ROC) curve is a fundamental tool in the field of machine learning for evaluating the performance of classification models. In this context, we'll explore the ROC curve and its associated metrics using the breast cancer dataset, a widely used dataset for binary classification tasks.
What is the ROC Curve?
The ROC curve stands for Receiver Operating Characteristics Curve and is an evaluation metric for classification tasks and it is a probability curve that plots sensitivity and specificity. So, we can say that the ROC Curve can also be defined as the evaluation metric that plots the sensitivity against the false positive rate. The ROC curve plots two different parameters given below:
- True positive rate
- False positive rate
The ROC Curve can also defined as a graphical representation that shows the performance or behavior of a classification model at all different threshold levels. The ROC Curve is a tool used for binary classification in machine learning. While learning about the ROC Curve we need to be familiar with the terms specificity and sensitivity.
- Specificity: It is defined as the proportion of negative instances that were predicted correctly as negative values. In other terms, the true negative is also called the specificity. The false positive rate can be found using the specificity by subtracting one from it.
- Sensitivity: The true positive rate is defined as the rate of positive instances that were predicted correctly to be positive. The true positive rate is a synonym for "True positive rate".The sensitivity is also called recall and these terms are often interchangeable. The formula for TPR is as follows,
 TPR = TP/(TP+FN)
where, TPR = True positive rate, TP = True positive, FN = False negative.
False positive rate: On the other side, false positive rate can be defined as the rate of negative instances that were predicted incorrectly to be positive. In other terms, the false positive can also be called "1-specificity".
FPR=FP/(FP+TN)
where, FPR = False positive rate, FP= False positive, TN= True negative.
The ROC Curve is often comparable with the precision and recall curve but it is different because it plots the true positive rate (which is also called recall) against the false positive rate.
The curve is plotted by finding the values of TPR and FPR at distinct threshold values and we don't plot the probabilities but we plot the scores. So the probability of the positive class is taken as the score here.
Types of ROC Curve
There are two types of ROC Curves:
- Parametric ROC Curve: The parametric method plots the curve using maximum likelihood estimation. This type of ROC Curve is also smooth and plots any sensivitiy and specificity, but it has drawbacks like actual data can be discarded. The computation of this method is complex.
- Non-Parametric ROC Curve: The non-parametric method does not need any assumptions about the data distributions. It gives unbiased estimates and plot passes through all the data points. The computation of this method is simple.
We need to evaluate a logistic regression model with distinct classification thresholds to find the points to plot on the ROC curve as the Logistic regression model is a very common model used in binary classification tasks.
ROC Curve in Python
Let's implement roc curve in python using breast cancer in-built dataset. The breast cancer dataset is a commonly used dataset in machine learning, for binary classification tasks.
Step 1: Importing the required libraries
In scikit-learn, the roc_curve function is used to compute Receiver Operating Characteristic (ROC) curve points. On the other hand, the auc function calculates the Area Under the Curve (AUC) from the ROC curve. 
AUC is a scalar value representing the area under the ROC curve quantifing the classifier's ability to distinguish between positive and negative examples across all possible classification thresholds.
import matplotlib.pyplot as plt
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import roc_curve, auc
Step 2: Loading the dataset
data = load_breast_cancer()
X = data.data
y = data.target # Split the data into features (X) and target variable (y)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=42)
Step 3: Training and testing the model
# Train a logistic regression model
model = LogisticRegression() 
model.fit(X_train, y_train)
# Predict probabilities on the test set
y_pred_proba = model.predict_proba(X_test)[:, 1] 
Step 4: Plot the ROC Curve
- The roc_curve function is used to calculate the False Positive Rates (FPR), True Positive Rates (TPR), and corresponding thresholds with true labels and the predicted probabilities of belonging to the positive class as inputs.
- plt.plot([0, 1], [0, 1], 'k--', label='No Skill') is used to plot a diagonal dashed line representing a classifier with no discriminative power (random guessing).
# Calculate ROC curve
fpr, tpr, thresholds = roc_curve(y_test, y_pred_proba) 
roc_auc = auc(fpr, tpr)
# Plot the ROC curve
plt.figure()  
plt.plot(fpr, tpr, label='ROC curve (area = %0.2f)' % roc_auc)
plt.plot([0, 1], [0, 1], 'k--', label='No Skill')
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
plt.title('ROC Curve for Breast Cancer Classification')
plt.legend()
plt.show()
Output:
The dashed line represents the ROC Curve for the classifier. The AUC as 1.00, signifies perfect classification, meaning the model can distinguish malignant from benign tumors flawlessly at any threshold.
How Ideal Curve looks like?
An ideal ROC curve would be as close as possible to the upper left corner of the plot, indicating high TPR (correctly identifying true positives) with low FPR (incorrectly identifying false positives). The closer the curve is to the diagonal baseline, the worse the classifier's performance.
The AUC score provides a quantitative measure of the classifier's performance, with a value of 1 indicating perfect classification and a value of 0.5 indicating no better than random guessing.
Advantages of ROC Curve
- Threshold-independent: The ROC Curve provides an all-inclusive view of a model's performance across distinct classification thresholds, and they are threshold-independent.
- Performance Comparison: The ROC Curve is not dependent on the class imbalance in our data, and it helps to compare the performances of various models on the same data sets.
- Clear and precise: The ROC Curve gives a detailed visualization for distinguishing between normal and abnormal test results.
- Visual representation: It also shows the sensitivity and specificity at all threshold values, so the data does not need to be grouped to plot the graph.
Disadvantages of ROC Curve
- Can be perplexing: The ROC Curve can be confusing and doesn't give a clear idea as it is based on the binary classification and there are only two outcomes yes or no or have similar responses like is there or not there depending on the data given.
- Not Smooth: The ROC Curve for larger samples may not be smooth because the ROC Curve appears to be jagged for smaller sample sizes.
- Can be deceptive: The ROC Curve can be very deceptive sometimes and it can't be used for complex situations that is where more than two classes are involved.
- Suitability: The ROC Curve may be suitable for binary classification, but it may not be suitable for multiclass classification tasks. They are also robust to the class imbalance in the data.
Conclusion
The ROC Curve is an analytical tool used in classification tasks that plots the true positive rate and false positive rate. It is also considered to be the best diagnostic test method as it shows the best cut-off value for diagnostic performance.
