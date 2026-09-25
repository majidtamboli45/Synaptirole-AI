# OOB Errors for Random Forests in Scikit Learn

> Source: https://www.geeksforgeeks.org/machine-learning/oob-errors-for-random-forests-in-scikit-learn/

A random forest is an ensemble machine-learning model that is composed of multiple decision trees. A decision tree is a model that makes predictions by learning a series of simple decision rules based on the features of the data. A random forest combines the predictions of multiple decision trees to make more accurate and robust predictions.
Random Forests are often used for classification and regression tasks. In classification, the goal is to predict the class label (e.g., "cat" or "dog") of each sample in the dataset. In regression, the goal is to predict a continuous target variable (e.g., the price of a house) based on the features of the data.
Random forests are popular because they are easy to train, can handle high-dimensional data, and are highly accurate. They also have the ability to handle missing values and can handle imbalanced datasets, where some classes are more prevalent than others.
To train a random forest, you need to specify the number of decision trees to use (the n_estimators parameter) and the maximum depth of each tree (the max_depth parameter). Other hyperparameters, such as the minimum number of samples required to split a node and the minimum number of samples required at a leaf node, can also be specified.
Once the random forest is trained, you can use it to make predictions on new data. To make a prediction, the random forest uses the predictions of the individual decision trees and combines them using a majority vote or an averaging technique.
What is the difference between the OOB Score and the Validation score?
OOB (out-of-bag) score is a performance metric for a machine learning model, specifically for ensemble models such as random forests. It is calculated using the samples that are not used in the training of the model, which is called out-of-bag samples. These samples are used to provide an unbiased estimate of the model's performance, which is known as the OOB score.
The validation score, on the other hand, is the performance of the model on a validation dataset. This dataset is different from the training dataset and is used to evaluate the model's performance after it has been trained on the training dataset.
In summary, the OOB score is calculated using out-of-bag samples and is a measure of the model's performance on unseen data. The validation score, on the other hand, is a measure of the model's performance on a validation dataset, which is a set of samples that the model has not seen during training.
OOB (out-of-bag) Errors
OOB (out-of-bag) errors are an estimate of the performance of a random forest classifier or regressor on unseen data. In scikit-learn, the OOB error can be obtained using the oob_score_ attribute of the random forest classifier or regressor.
The OOB error is computed using the samples that were not included in the training of the individual trees. This is different from the error computed using the usual training and validation sets, which are used to tune the hyperparameters of the random forest.
The OOB error can be useful for evaluating the performance of the random forest on unseen data. It is not always a reliable estimate of the generalization error of the model, but it can provide a useful indication of how well the model is performing.
Implementation of OOB Errors for Random Forests
To compute the OOB error, the samples that are not used in the training of an individual tree are known as "out-of-bag" samples. These samples are not used in the training of the tree, but they are used to compute the OOB error for that tree. The OOB error for the entire random forest is computed by averaging the OOB errors of the individual trees.
To install NumPy and scikit-learn, you can use the following commands:
pip install numpy
pip install scikit-learn
These commands will install the latest versions of NumPy and scikit-learn from the Python Package Index (PyPI). To use the oob_score_ attribute, you must set the oob_score parameter to True when creating the random forest classifier or regressor.
# Create a random forest classifier
# with the OOB score enabled
clf = RandomForestClassifier(n_estimators=100,
                             oob_score=True,
                             random_state=0)
Once the random forest classifier or regressor is trained on the data, the oob_score_ attribute will contain the OOB error. For example:
# Fit the classifier to the data
clf.fit(X, y)
# Obtain the OOB error
oob_error = 1 - clf.oob_score_
Here is the complete code of how to obtain the OOB error of a random forest classifier in scikit-learn:
import numpy as np
from sklearn.ensemble import RandomForestClassifier
from sklearn.datasets import make_classification
# Generate random data
X, y = make_classification(n_samples=1000,
                           n_features=10,
                           n_informative=5,
                           n_classes=2,
                           random_state=0)
# Create a random forest
# classifier and fit it to the data
clf = RandomForestClassifier(n_estimators=100,
                             oob_score=True,
                             random_state=0)
clf.fit(X, y)
# Obtain the OOB error
oob_error = 1 - clf.oob_score_
# Print the OOB error
print(f'OOB error: {oob_error:.3f}')
Output:
OOB error: 0.044
This code will create a random forest classifier, fit it to the data, and obtain the OOB error using the oob_score_ attribute. The oob_score_ attribute will only be available if the oob_score parameter was set to True when creating the classifier.
What are some of the use cases of the OOB error?
One of the main use cases of the OOB error is to evaluate the performance of an ensemble model, such as a random forest. Because the OOB error is calculated using out-of-bag samples, which are samples that are not used in the training of the model, it provides an unbiased estimate of the model's performance.
Another use case of the OOB error is to tune the hyperparameters of a model. By using the OOB error as a performance metric, the hyperparameters of the model can be adjusted to improve its performance on unseen data.
Additionally, the OOB error can be used to diagnose whether a model is overfitting or underfitting. If the OOB error is significantly higher than the validation score, it may indicate that the model is overfitting and not generalizing well to unseen data. On the other hand, if the OOB error is significantly lower than the validation score, it may indicate that the model is underfitting and not learning the underlying patterns in the data.
Overall, the OOB error is a useful tool for evaluating the performance of an ensemble model and for diagnosing issues such as overfitting and underfitting.
