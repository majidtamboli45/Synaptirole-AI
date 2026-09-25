# Classification Metrics using Sklearn

> Source: https://www.geeksforgeeks.org/machine-learning/sklearn-classification-metrics/

Machine learning classification is a powerful tool that helps us make predictions and decisions based on data. Whether it's determining whether an email is spam or not, diagnosing diseases from medical images, or predicting customer churn, classification algorithms are at the heart of many real-world applications. However, the mere creation of a classification model is not enough; we need to assess its performance. Scikit-Learn, a popular machine-learning library in Python, provides a wide array of classification metrics to help us do just that.
In this article, we will explore the essential classification metrics available in Scikit-Learn, understand the concepts behind them, and learn how to use them effectively to evaluate the performance of our classification models.
Classification Metrics
Classification is the process of categorizing data or objects based on their traits or properties into specified groupings or categories. Classification is a type of supervised learning approach in machine learning in which an algorithm is trained on a labelled dataset to predict the class or category of fresh, unseen data. The primary goal of classification is to create a model capable of properly assigning a label or category to a new observation based on its properties.
To check the accuracy of classifications, we use the different-different metrics. Some of them are discussed below:
Confusion Matrix:
A confusion matrix is a table that summarizes the performance of a classification algorithm. It consists of four metrics:
True Positives (TP), True Negatives (TN), False Positives (FP), and False Negatives (FN).
- True Positives (TP): True Positives are the cases where the model correctly predicted the positive class (e.g., a disease is present) when it was indeed present in the actual data. In medical diagnostics, this would mean correctly identifying individuals with a disease.
or Simply Said The number of correctly predicted positive instances.
- True Negatives (TN): True Negatives are the cases where the model correctly predicted the negative class (e.g., no disease) when it was indeed not present in the actual data. In the context of email classification, this would mean correctly identifying non-spam emails.
or Simply Said The number of correctly predicted negative instances.
- False Positives (FP): False Positives occur when the model incorrectly predicts the positive class when it is not present in the actual data. In medical diagnostics, this means diagnosing a disease when it is not there, leading to unnecessary stress and cost.
or Simply Said The number of incorrectly predicted positive instances.
- False Negatives (FN): False Negatives happen when the model incorrectly predicts the negative class when it is, in fact, the positive class. In email classification, this would mean mistakenly classifying a spam email as non-spam, potentially causing the user to miss important messages.
or Simply Said The number of incorrectly predicted negative instances.
The confusion matrix is often represented as:
|  | Predicted Negative (0) | Predicted Positive (1) | 
|---|---|---|
| Actual Negative (0) | TN | FP | 
| Actual Positive (1) | FN | TP | 
Accuracy
Accuracy is a fundamental metric used to evaluate the performance of classification models. It measures the proportion of correctly predicted instances (both true positives and true negatives) among all instances in the dataset.
The formula for accuracy is as follows:
Accuracy = ( TP+TN  ) / ( TP+TN+FP+FN ) Where:
TP (True Positives)      : The number of correctly predicted positive instances.
TN (True Negatives) : The number of correctly predicted negative instances.
FP (False Positives) : The number of incorrectly predicted positive instances.
FN (False Negatives) : The number of incorrectly predicted negative instances.
However, accuracy may be misleading when dealing with imbalanced datasets, where one class significantly outweighs the other.
Strengths of Accuracy:
- Easy Interpretation: Accuracy is easy to understand and interpret. It is expressed as a percentage, making it accessible to both technical and non-technical stakeholders.
- Suitable for Balanced Datasets: Accuracy is a reliable metric when dealing with balanced datasets, where each class has roughly equal representation. In such cases, it provides an accurate reflection of model performance.
Limitations of Accuracy:
- Imbalanced Datasets: Accuracy can be misleading when dealing with imbalanced datasets, where one class significantly outnumbers the other. In imbalanced scenarios, a model that predicts the majority class for all instances can achieve a high accuracy simply because it correctly predicts the dominant class. This can lead to a false sense of model effectiveness.
- Misleading in Critical Applications: In some applications, the cost of false positives and false negatives may vary significantly. Accuracy treats all types of errors equally, which may not be suitable for situations where the consequences of different types of errors differ. For instance, in medical diagnostics, a false negative (missed disease) could be life-threatening, whereas a false positive (unnecessary treatment) might have less severe consequences.
When to Use Accuracy
Accuracy is a valuable metric in scenarios where class balance is not a concern and the cost of misclassification errors is relatively equal for all classes. It is commonly used as a starting point for evaluating models but should be complemented with other metrics, such as precision, recall, F1-score, and the analysis of a confusion matrix, to gain a more comprehensive understanding of a model's performance, especially in imbalanced or critical applications.
Precision
Precision is a critical metric used to assess the quality of positive predictions made by a classification model. It quantifies the proportion of true positive predictions (correctly predicted positive instances) among all instances predicted as positive, whether they are true positives or false positives.
The formula for precision is as follows:
Precision = TP / ( TP+FP )
Precision provides insights into the model's ability to make accurate positive predictions, making it particularly valuable in situations where the cost or consequences of false positive errors are high.
Significance of Precision:
- Medical Diagnoses: In medical diagnostics, precision is of utmost importance. When a model is used to detect diseases, a high precision ensures that a positive diagnosis is reliable, reducing the chances of unnecessary stress, follow-up tests, or treatments for patients.
- Spam Detection: In email classification, precision is essential to ensure that emails classified as spam are indeed spam. False positives (legitimate emails marked as spam) can lead to important messages being missed, making precision crucial for user experience.
Recall (Sensitivity)
Recall, also known as sensitivity or true positive rate, is a fundamental classification metric that assesses a model's ability to correctly identify all positive instances within a dataset. It quantifies the proportion of true positive predictions (correctly predicted positive instances) among all instances that are actually positive.
The formula for recall is as follows:
Recall = TP / TP + FN
Significance of Recall:
- Medical Diagnostics: In medical diagnosis, recall is paramount. A high recall ensures that the model can effectively identify all cases of a disease, minimizing the risk of missing critical diagnoses. False negatives (missed cases) can have severe consequences in healthcare.
- Security and Anomaly Detection: In cybersecurity and anomaly detection, recall is crucial for detecting security threats or unusual behaviors. Missing even a single critical threat can lead to significant security breaches.
F1-Score
The F1-Score is a widely used classification metric that combines both precision and recall into a single value. It provides a balanced assessment of a model's performance, especially when there is an imbalance between the classes being predicted. The F1-Score is calculated using the harmonic mean of precision and recall and is represented by the following formula:
F1-Score = 2× ( ( Precision * Recall ) / ( Precision + Recall ) ) Significance of the F1-Score:
- Handling Class Imbalance: The F1-Score is particularly valuable when dealing with imbalanced datasets, where one class significantly outnumbers the other. In such scenarios, a model might achieve high accuracy by simply predicting the majority class most of the time, but the F1-Score considers both false positives and false negatives, providing a more accurate measure of overall model performance.
- Balancing Precision and Recall: By taking the harmonic mean of precision and recall, the F1-Score finds a balance between the two metrics. This balance is crucial when making decisions in applications where the cost or consequences of false positives and false negatives differ.
- Single Metric for Model Evaluation: The F1-Score condenses two important aspects of a model's performance into a single value, making it convenient for model selection, hyperparameter tuning, and comparing different models.
Threshold Consideration
It's important to note that the F1-Score depends on the threshold used for classification. Changing the threshold can impact both precision and recall, consequently affecting the F1-Score. Therefore, when comparing F1-Scores across models or making threshold decisions, it's essential to consider the specific context and priorities of the problem.
Use Cases
The F1-Score is widely used in various domains and applications, including:
- Information Retrieval: In search engines, where both precision (relevance) and recall (comprehensiveness) are essential for delivering high-quality search results.
- Medical Testing: When diagnosing diseases or medical conditions, where a balance between correctly identifying positive cases and minimizing false alarms is crucial.
ROC Curve
Receiver Operating Characteristic (ROC) Curve:
The Receiver Operating Characteristic (ROC) curve is a graphical representation of a classification model's ability to distinguish between positive and negative classes at various classification thresholds. It plots the True Positive Rate (TPR), also known as recall or sensitivity, against the False Positive Rate (FPR), which is calculated as 1−Specificity.
The ROC curve visually illustrates how the model's performance changes as the threshold for classifying an instance as positive varies.
In the ROC curve:
- The x-axis represents the False Positive Rate (FPR), which measures the proportion of negative instances incorrectly classified as positive.
- The y-axis represents the True Positive Rate (TPR), which measures the proportion of positive instances correctly classified as positive.\
- A typical ROC curve looks like an ascending curve, moving from the bottom-left corner to the top-right corner of the plot. The ideal ROC curve would be a right-angle (90-degree) curve from the bottom-left corner to the top-left corner, indicating perfect discrimination between positive and negative instances at all thresholds.
Area Under the ROC Curve (AUC):
The Area Under the ROC Curve (AUC) quantifies the overall performance of a classification model. It measures the area under the ROC curve, ranging from 0 to 1, where:
- An AUC of 0.5 indicates that the model's performance is equivalent to random guessing.
- An AUC of 1.0 indicates perfect discrimination, where the model can perfectly distinguish between positive and negative instances at all thresholds.
- The AUC provides a single scalar value that summarizes the model's ability to rank positive instances higher than negative instances, regardless of the specific threshold chosen for classification. Higher AUC values indicate better model performance.
Significance of ROC Curve and AUC
- Model Comparison: ROC- AUC enable the comparison of multiple classification models to determine which one performs better. A model with a higher AUC is generally more effective at distinguishing between classes.
- Threshold Selection: ROC curves help in choosing an appropriate classification threshold based on the specific application's requirements. You can select a threshold that balances TPR and FPR according to the desired trade-off between true positives and false positives.
- Imbalanced Datasets: ROC curves and AUC are particularly useful when dealing with imbalanced datasets, where one class significantly outnumbers the other. These metrics provide a more comprehensive evaluation of model performance beyond accuracy.
Limitations
While ROC curves and AUC are powerful tools for model evaluation, they do not provide insight into the specific consequences or costs associated with false positives and false negatives. Therefore, they are often used in conjunction with other metrics like precision, recall, and the F1-Score to gain a more complete understanding of a model's performance.
Implementation of Classification Metrics
Now, let's walk through the steps of using Scikit-Learn to evaluate a classification model
Import Necessary Libraries
# importing Libraries
from sklearn.metrics import confusion_matrix, accuracy_score, precision_score, recall_score, f1_score, roc_curve, auc
The code imports the necessary libraries and functions from scikit-learn to carry out several classification model evaluation tasks, including computing an F1 score, an accuracy matrix, a precision matrix, a recall matrix, and ROC curve metrics. An evaluation of a binary classification model's effectiveness and quality can be aided by these indicators.
Make Predictions
# True labels
y_true = [0, 1, 1, 0, 1, 0, 0, 1, 1, 0]  
# Predicted labels
y_pred = [0, 1, 0, 0, 1, 1, 0, 1, 1, 1]  
This code defines two lists: y_pred, which is a list of predicted class labels, and y_true, which is a list of the actual class labels. These lists include the actual and anticipated binary classification results for a given collection of data points, enabling the assessment of model performance and measures like recall, accuracy, and precision.
Calculate Metrics
# Confusion Matrix
cm = confusion_matrix(y_true, y_pred)
# Accuracy
accuracy = accuracy_score(y_true, y_pred)
# Precision
precision = precision_score(y_true, y_pred)
# Recall
recall = recall_score(y_true, y_pred)
# F1-Score
f1 = f1_score(y_true, y_pred)
# ROC Curve and AUC
fpr, tpr, thresholds = roc_curve(y_true, y_pred)
roc_auc = auc(fpr, tpr)
print("Confusion Matrix:")
print(cm)
print("Accuracy:", accuracy)
print("Precision:", precision)
print("Recall:", recall)
print("F1-Score:", f1)
print("ROC AUC:", roc_auc)
Output:
Confusion Matrix:
[[3 2]
[1 4]]
Accuracy: 0.7
Precision: 0.6666666666666666
Recall: 0.8
F1-Score: 0.7272727272727272
ROC AUC: 0.7000000000000001
An evaluation of a binary classification model's performance is conducted using the following snippet of code. It starts by creating a confusion matrix, which shows true positives, false positives, true negatives, and false negatives in a visual manner. Then, it calculates important metrics such as accuracy, precision, recall, and the F1-score to evaluate how well the model classifies objects correctly. The algorithm also constructs a ROC curve (Receiver Operating Characteristic) and computes the ROC AUC, a measure of the model's capability to distinguish between positive and negative classes. Together, these measures offer insightful information about the model's overall performance, assisting in evaluating and enhancing its categorization abilities.
Plotting ROC-AUC Curve
You can use matplotlib to plot the ROC curve and display the AUC. Here's how you can do it:
import matplotlib.pyplot as plt
# Plot ROC curve
plt.figure()
# Plot the ROC curve with a label displaying the ROC AUC score
plt.plot(fpr, tpr, color='darkorange', lw=2,
         label='ROC curve (area = %0.2f)' % roc_auc)
# Plot a dashed diagonal line for reference
plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
# Set the x and y-axis limits
plt.xlim([0.0, 1.0])
plt.ylim([0.0, 1.05])
# Label the x and y-axes
plt.xlabel('False Positive Rate')
plt.ylabel('True Positive Rate')
# Set the title of the plot
plt.title('Receiver Operating Characteristic')
# Add a legend to the plot
plt.legend(loc='lower right')
# Display the ROC curve plot
plt.show()
Output:
In this code segment, the Receiver Operating Characteristic (ROC) curve for a binary classification model is created and displayed using Matplotlib. As the classification threshold changes, the ROC curve illustrates the trade-off between the true positive rate (sensitivity) and false positive rate. Additionally, it computes and presents the ROC AUC (Area Under the Curve), which is used to measure the model's discriminatory strength and evaluate how well it can distinguish between positive and negative classes. The ROC curve, a dashed diagonal line used to symbolize guesswork, is displayed in the plot, which also has labels and a legend for easy comprehension.
Conclusion
Finally, Scikit-Learn provides a comprehensive set of classification metrics that enable us to assess the performance of our machine learning models accurately. Understanding and using these metrics is crucial for building and deploying robust and reliable classification models in various domains. We've examined a wide range of tools and methods for assessing the effectiveness of classification model performance in our investigation of scikit-learn's classification metrics. Particularly in cases involving binary classification, these measures offer crucial insights into how successfully a model is making predictions.
We've discussed basic metrics like recall and precision, which rate how well a model can reduce false positives and false negatives, respectively. Accuracy quantifies how accurately a model is overall. We've also talked about the F1-score, which achieves a compromise between recall and precision. We also discussed the Receiver Operating Characteristic (ROC) curve and its Area Under the Curve (ROC AUC) as tools for evaluating a model's capacity to distinguish between classes. By utilizing these tools, practitioners may decide with confidence which model to use, how to adjust its parameters, and how well it performs overall, thereby improving the accuracy and dependability of their categorization models.
