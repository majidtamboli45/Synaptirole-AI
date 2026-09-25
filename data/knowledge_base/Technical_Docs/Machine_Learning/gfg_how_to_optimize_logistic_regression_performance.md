# How to Optimize Logistic Regression Performance

> Source: https://www.geeksforgeeks.org/machine-learning/how-to-optimize-logistic-regression-performance/

Logistic Regression is a widely employed algorithm for binary classification tasks. However, the performance of Logistic Regression models can be significantly impacted by the choice of hyperparameters, which can lead to suboptimal results if not properly tuned. Therefore, it is crucial to explore the various hyperparameters that influence the performance of Logistic Regression models and develop a systematic approach to tuning these parameters for enhanced accuracy and reliability.
In this article, we will understand hyperparameter tuning for Logistic Regression, providing a comprehensive overview of the key hyperparameters, their effects on model performance, and a practical implementation of hyperparameter tuning using the GridSearchCV technique on a breast cancer detection dataset.
Understanding Logistic Regression
Logistic Regression is commonly used to estimate the probability that an instance belongs to a particular class. In a Logistic Regression, model computes a weighted sum of input features plus a bias term but instead of outputting the result directly like Linear Regression model its output is obtained by applying the logistic function (also known as sigmoid function), representing the estimated probability of the instance belonging to the positive class.
GridSearchCV for Optimizing Logistic Regression Performance
GridSearchCV is a method provided by the scikit-learn library in Python, which is used to systematically work through multiple combinations of parameter tunes, cross-validating as it goes to determine which tune gives the best performance. This approach is particularly useful for hyperparameter tuning, ensuring that the model is optimized for the best combination of hyperparameters. Key Points About GridSearchCV
- Systematic Hyperparameter Search: GridSearchCV searches over a specified parameter grid, trying out all possible combinations of hyperparameters. For each combination, the model is trained and evaluated using cross-validation.
- Cross-Validation: By default, GridSearchCV uses k-fold cross-validation to evaluate the performance of each set of hyperparameters. This ensures that the results are reliable and not due to a particular random train-test split.
- Parameter Grid: You define a grid of hyperparameters to search through. For instance, you might specify different values for regularization strength, types of penalties, solvers, etc.
- Best Model Selection: After evaluating all the combinations, GridSearchCV selects the set of hyperparameters that provide the best cross-validated performance.
Hyperparameters in GridSearchCV
To Optimize the Performance of Logistic Regression hyperparameters can be tuned. Common best hyperparameters to optimize the Logistic Regression machine learning model are:
1. Penalty
The Parametric values used in this hyperparameter are:
- L1 Regularization( lasso regression): L1 regularization also known as lasso regression it is regularization technique which is used to reduce the values of the coefficients of the equation . This regularization technique is used as feature elimination method because it reduces the values of the coefficients exactly to zero .
- L2 Regularization: L2 regularization also known as Ridge regression it is a regularization technique which is used to reduce the values of the coefficients not exactly but nearly to zero.
- Elastic Net Regularization: Elastic Net regularization is a combination of both L1 and L2 regularization techniques. It adds both the L1 and L2 penalty terms to the loss function during training.
2. tol (tolerance)
It is the stopping criteria for gradient descent, the default value of this parameter is 1e-4 . If the value remains small then it fully depend on the number of iterations or if value is large then the gradient descent stopped early.
3. C (Inverse of Regularization)
This hyperparameter is very important when we are using regularization as it is the inverse of regularization , the default value is 1.0. Basically the variation of values are quite similar with the regularization techniques that is smaller the values stronger the regularization and larger the values less is the regularization.
4. Solver
Solvers are algorithms used to optimize the model's performance by finding the best-fit parameters that minimize the loss function. Each solver has different characteristics and is suited for different types of datasets and scenarios. The solvers are:
- lbfgs: A good default choice, suitable for small to medium-sized datasets.
- liblinear: Best suited for small datasets.
- newton-cg: Works well for both small and large datasets, particularly for multiclass classification problems.
- sag and saga: Faster for large datasets.
- newton-cholesky: Good for datasets with more samples than features, especially with one-hot encoded categorical features.
5. max_iter
The max_iter parameter specifies the maximum number of iterations that the solver is allowed to take in order to converge to a solution.
- This hyperparameter controls how long the solver will run before it stops. If the solver has not converged to a solution within the specified number of iterations, it will terminate the process.The default value for max_iter is 100.
- Usage Considerations:
  - If your model is not converging within 100 iterations, you might need to increase this number.
  - However, if the number is set too high, the training process might become unnecessarily long without significant gains in performance.
  - It's useful to monitor convergence behavior and adjust accordingly to balance training time and model performance.
6. Verbose
The verbose parameter controls the verbosity of the training process, which determines whether to display detailed logs and progress information during model training.
- This hyperparameter is used to give feedback to the user during the training process. If set, it provides insight into the model's progress and can help in diagnosing issues during training. To enable verbosity, set verbose to 1 (or a higher integer for more detailed output).
- Usage Considerations:
  - Verbose = 0: No output (silent mode).
  - Verbose = 1: Displays basic information about the training process.
  - Verbose > 1: Provides more detailed logs, which can be helpful for debugging but may produce a lot of output.
  - Verbose output is especially useful for long training sessions to ensure the model is progressing and to identify potential issues early.
7. n_jobs
The n_jobs parameter specifies the number of CPU cores to be used during the computation.
- This hyperparameter is used to parallelize the training process, potentially speeding up the computation by utilizing multiple CPU cores.
- Value:
  - n_jobs = -1: Utilizes all available CPU cores.
  - n_jobs > 0: Specifies the exact number of cores to be used.
  - n_jobs = 1: (default) Does not use parallel processing (single core).
- Usage Considerations:
  - Setting n_jobs to -1 is beneficial for large datasets or computationally intensive tasks, as it can significantly reduce training time by leveraging all available resources.
  - Be mindful of the computing environment. Using all cores can sometimes affect other processes running on the same machine.
  - On shared or cloud environments, ensure that using all cores complies with resource allocation policies.
- Setting 
Optimizing Logistic Regression Performance with GridSearchCV
Below is the implementation of above discussed hyperparameters on the dataset of Breast Cancer Detection.
Step 1: Loading the required libraries
import pandas as pd
import numpy as np
# Implementing a simple logistic Regression Model
from sklearn.linear_model import LogisticRegression
Step 2: Splitting the dataset into training and testing
y = df['diagnosis']
x = df.drop(['id','diagnosis','Unnamed: 32'],axis=1)
from sklearn.model_selection import train_test_split
X_train,X_test,Y_train,Y_test = train_test_split(x,y,test_size=0.2,random_state=2)
Step 3: After splitting the dataset implement the logistic regression model on the training data
log_model = LogisticRegression()
log_model.fit(X_train,Y_train)
Step 4 : Now in this step we check the model accuracy on unseen data using accuracy_score metrics
model_accuracy  = accuracy_score(y_pred,Y_test)
print("The Accuracy of simple logistic regression without hyperparmeter:",model_accuracy)
Output:
The Accuracy of simple logistic regression without hyperparmeter: 0.9298245614035088
Without applying hyperparameters the model accuracy is 92%. Now applying the hyperparameters using GridSearchCV technique which is used to find the best possible hyperparameter combination that help to tune the model are implemented below:
Step 1: Creating a Parameter Grid for Hyperparameter Tuning in Logistic Regression
In the first step of hyperparameter tuning there will be created a parameter grid to define the hyperparameters that are used to tune the Logistic Regression model performance.
param_grid = [
    {'penalty':['l1','l2','elasticnet','none'],
    'C' : np.logspace(-4,4,20),
    'solver': ['lbfgs','newton-cg','liblinear','sag','saga'],
    'max_iter'  : [100,1000,2500,5000]
}
]
Step 2: Get Best Possible Combination of Hyperparameters
In the next step we will use GridSearchCV technique to find the best possible combination of hyperparameters to improve the performance of the model -
from sklearn.model_selection import GridSearchCV
clf = GridSearchCV(log_model,param_grid = param_grid, cv = 3, verbose=True,n_jobs=-1)
clf
Output:
GridSearchCV
GridSearchCV(cv=3, estimator=LogisticRegression(), n_jobs=-1,
param_grid=[{'C': array([1.00000000e-04, 2.63665090e-04, 6.95192796e-04, 1.83298071e-03,
4.83293024e-03, 1.27427499e-02, 3.35981829e-02, 8.85866790e-02,
2.33572147e-01, 6.15848211e-01, 1.62377674e+00, 4.28133240e+00,
1.12883789e+01, 2.97635144e+01, 7.84759970e+01, 2.06913808e+02,
5.45559478e+02, 1.43844989e+03, 3.79269019e+03, 1.00000000e+04]),
'max_iter': [100, 1000, 2500, 5000],
'penalty': ['l1', 'l2', 'elasticnet', 'none'],
'solver': ['lbfgs', 'newton-cg', 'liblinear', 'sag',
'saga']}],
verbose=True)
estimator: LogisticRegression
LogisticRegression()
LogisticRegression
LogisticRegression()
Step 3: Apply Best Hyperparameters to Logostic Regression
In this step we will fit the best hyperameter tune logisitic Regression model on training data.
best_clf = clf.fit(x,y)
best_clf.best_estimator_
Output:
LogisticRegression
LogisticRegression(C=0.0001, penalty='none', solver='newton-cg')
Step 4: Validating the model
After testing the model on unseen data we check the accuracy of the model using score method -
print(f'Accuracy - : {best_clf.score(x,y):.3f}')
Output:
Accuracy - : 0.988
As we can see with use hyperparameters and gridsearch CV we are able to optimize logistic regression model from 92% to 98%.
