# Hyperparameter Optimization Based on Bayesian Optimization

> Source: https://www.geeksforgeeks.org/machine-learning/hyperparameter-optimization-based-on-bayesian-optimization/

In this article we explore what is hyperparameter optimization and how can we use Bayesian Optimization to tune hyperparameters in various machine learning models to obtain better prediction accuracy. Before we dive into the how's of implementing Bayesian Optimization, let us learn what is meant by hyperparameters and hyperparameter optimization.
Hyperparameters
Machine/deep learning models consist of two types of parameters: model parameters and hyperparameters. Hyperparameters are external configuration variables set by us to operate machine model training. They are parameters that define the details of learning process. Examples of hyperparameters include number of nodes and layers in neural networks, learning rates, epochs etc. They have major impact on the accuracy and efficiency of the training model and hence they need to be defined in such a way so as to get the best results. This leads us to the topic of hyperparameter optimization.
Hyperparameter Optimization
Hyperparameter optimization or tuning is the process of selecting optimal values for a machine learning model's hyperparameters. Its job is to find a tuple of hyperparameters that gives an optimal model with enhanced accuracy/prediction. It minimizes the loss function on a given data obtained from the objective function that uses a particular tuple of hyperparameters.
There are various techniques that can be used to tune hyperparameters:
- Grid Search
- Random Search
- Bayesian Optimization
- Tree Prazen Estimators
- Genetic Algorithms
- Metaheuristic based Algorithms
We are now going to dive deep into what bayesian optimization is and how it can be used with machine learning models for optimization.
Bayesian Optimization
Bayesian Optimization is an automated optimization technique designed to find optimal hyperparameters by treating the search process as an optimization problem. It aims to maximize an objective function f(x), particularly beneficial for functions that are computationally expensive to evaluate and are treated as "black boxes," where their internal structure is unknown.
One of the key features of Bayesian Optimization is its ability to consider previous evaluations when selecting the next set of hyperparameter combinations. This is achieved through the use of a probabilistic model, which estimates the probability of an objective function's result given a set of hyperparameters:
P ( score | hyperparameters)
This model is called a "surrogate" for the objective function and is represented by P(y | x). The Bayesian Optimization algorithm involves several steps:
- Build a Probability Model: Develop a probability model of the objective function based on past evaluations.
- Find Optimal Hyperparameters: Identify hyperparameters that perform best according to the probability model.
- Apply Hyperparameters: Apply the selected hyperparameters to the actual objective function and evaluate its performance.
- Update Probability Model: Update the probability model with the latest results.
- Repeat: Iterate steps 2-4 until reaching the maximum number of iterations or time limit.
The surrogate model begins with a prior distribution f(x), representing initial beliefs or knowledge about the parameters of the model before observing any data. As more evaluations are conducted, the surrogate model learns from the data, updating its beliefs according to Bayes' rule to form a posterior distribution.
Sampling points in the search space is facilitated by acquisition functions, which balance exploitation and exploration. Exploitation involves sampling where the surrogate model predicts a high objective value, while exploration entails sampling at locations with high uncertainty. Popular acquisition functions include Maximum Probability of Improvement (MPI), Expected Improvement (EI), and Upper Confidence Bound (UCB).
Bayesian Optimization is efficient because it intelligently selects the next set of hyperparameters, reducing the number of calls made to the objective function. Surrogate models such as Gaussian processes, Random Forest Regression, and Tree-Structured Parzen Estimators (TPE) are commonly used in Bayesian Optimization due to their effectiveness.
Hyperparameter Optimization Based on Bayesian Optimization
In this section we are going to learn how to use the BayesSearchCV model provided in the scikit-optimize library to improve the results of Support Vector Classifier on Breast Cancer Dataset. For implementing bayesian optimization, we are going to use scikit-optimize library.
Install the scikit-optimize library using the following command:
pip install scikit-optimize
Import Packages
We have imported various important libraries like numpy, pandas, train_test_split and also the breast_cancer dataset which is essentially the popular Wisconsin breast cancer dataset from the sklearn library.
import numpy as np
import pandas as pd
import gc
import warnings
import matplotlib.pyplot as plt
from sklearn.datasets import load_breast_cancer
from sklearn.model_selection import train_test_split, cross_val_score
from sklearn.svm import SVC
from sklearn.preprocessing import StandardScaler
from sklearn.metrics import confusion_matrix, make_scorer, accuracy_score, recall_score, f1_score
from datetime import timedelta
import time
from skopt import BayesSearchCV
Load the Dataset and Extract Train Test Split
Sometimes dual coefficients or intercepts are not finite and this arises generally in SVMs and leads to the model running for an indefinite amount of time. To address this issue prepocessing of data is necessary. Here we have used the Scaling technique to normalize the data so that they have a similar range.
X, y = load_breast_cancer(return_X_y=True)
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, stratify=y, random_state=1234)
scaler = StandardScaler()
# Fit the scaler on training data and transform both training and test data
X_train = scaler.fit_transform(X_train)
X_test = scaler.transform(X_test)
Training a Machine Learning Model
start_time = time.time()
svc_model = SVC(kernel="rbf")
svc_model.fit(X_train, y_train)
elapsed_time_secs = time.time() - start_time
msg = "Execution took: %s secs (Wall clock time)" % timedelta(seconds=round(elapsed_time_secs))
svc_pred = svc_model.predict(X_test)
print("Train Accuracy", accuracy_score(y_train, svc_model.predict(X_train)))
print("Test Accuracy", accuracy_score(y_test, svc_model.predict(X_test)))
print('\n')
print("Train Recall Score", recall_score(y_train, svc_model.predict(X_train)))
print("Test Recall Score", recall_score(y_test, svc_model.predict(X_test)))
print('\n')
print("Train F1 Score", f1_score(y_train, svc_model.predict(X_train)))
print("Test F1 Score", f1_score(y_test, svc_model.predict(X_test)))
Output:
Train Accuracy 0.9912087912087912
Test Accuracy 0.9473684210526315
Train Recall Score 1.0
Test Recall Score 1.0
Train F1 Score 0.9931740614334471
Test F1 Score 0.9565217391304348
Here we have fit the SVC model using "rbf" kernel and obtain the accuracy of 91.6% and also print other performance metrics like execution time, f1_score, recall etc. We observe that there is a slight scope of improvement.
Define Hyperparameter Search Space
We have specified the hyperparameters we want to optimize for SVM. Common hyperparameters include the choice of kernel (linear, polynomial, radial basis function, etc.), the regularization parameter (C), and the kernel coefficient (gamma).
param_space = {
    'C': (1e-6, 1e+6, 'log-uniform'),
    'gamma': (1e-6, 1e+1, 'log-uniform'),
    'degree': (1, 8),  # integer valued parameter
    'kernel': ['linear', 'poly', 'rbf'],  # categorical parameter
}
Bayesian Optimization
Initialize Bayesian Optimization
We have defined the Bayesian optimization process, including the objective function, search space, acquisition function, and any other necessary parameters.
# Initialize Bayesian Optimization
opt = BayesSearchCV(
    SVC(),
    param_space,
    n_iter=32,
    cv=3
)
Run Bayesian Optimization
opt.fit(X_train, y_train)
print("val. score: %s" % opt.best_score_)
print("test score: %s" % opt.score(X_test, y_test))
# Get best hyperparameters
best_params = opt.best_params_
print("Best Parameters:", best_params)
Output:
val. score: 0.9780411293133496
test score: 0.956140350877193
Best Parameters: OrderedDict([('C', 0.3317383202555499), ('degree', 8), ('gamma', 2.8889304722800495), ('kernel', 'linear')])
Here, we have fit the bayesian optimization model with our train and test split and compared the best score and accuracy of the model. The best set of hyperparameters happen to be: [('C', 0.3317383202555499), ('degree', 8), ('gamma', 2.8889304722800495), ('kernel', 'linear')].
Implementing SVM with Best Hyperparameters
# Get best hyperparameters
best_params = opt.best_params_
# Create an SVM classifier with the best parameters
best_svc_model = SVC(**best_params)
# Fit the classifier on the training data
best_svc_model.fit(X_train, y_train)
# Predict on the test data
best_svc_pred = best_svc_model.predict(X_test)
# Evaluate the performance of the model
print("Train Accuracy with best parameters:", accuracy_score(y_train, best_svc_model.predict(X_train)))
print("Test Accuracy with best parameters:", accuracy_score(y_test, best_svc_pred))
print('\n')
print("Train Recall Score with best parameters:", recall_score(y_train, best_svc_model.predict(X_train)))
print("Test Recall Score with best parameters:", recall_score(y_test, best_svc_pred))
print('\n')
print("Train F1 Score with best parameters:", f1_score(y_train, best_svc_model.predict(X_train)))
print("Test F1 Score with best parameters:", f1_score(y_test, best_svc_pred))
Output:
Train Accuracy with best parameters: 0.9868131868131869
Test Accuracy with best parameters: 0.9912280701754386
Train Recall Score with best parameters: 1.0
Test Recall Score with best parameters: 1.0
Train F1 Score with best parameters: 0.9895833333333333
Test F1 Score with best parameters: 0.993103448275862
