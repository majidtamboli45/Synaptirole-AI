# Lasso vs Ridge vs Elastic Net

> Source: https://www.geeksforgeeks.org/machine-learning/lasso-vs-ridge-vs-elastic-net-ml/

Regularization methods like Lasso, Ridge and Elastic Net help improve linear regression models by preventing overfitting which address multicollinearity and helps in feature selection. These techniques increase the model’s accuracy and stability. In this article we will see explanation of how each technique works and their differences.
Ridge Regression (L2 Regularization)
Ridge regression is a technique used to address overfitting by adding a penalty to the model's complexity. It introduces an L2 penalty (also called L2 regularization) which is the sum of the squares of the model's coefficients. This penalty term reduces the size of large coefficients but keeps all features in the model. This prevents overfitting with correlated features.
Formula for Ridge Regression:
{Ridge Loss} = \sum_{i=1}^{m} (y_i - \hat{y}_i)^2 + \lambda \sum_{j=1}^{n} \beta_j^2 
where:
- The first term calculates the prediction error.
- The second term penalizes large coefficients controlled by \lambda .
Example: Let’s assume we are predicting house prices with features like size, location and number of rooms. The model might give coefficients like:
- \beta1 = 5 (Size coefficient)
- \beta2 = 3 (Number of rooms coefficient)
- \lambda = 0.1 (regularization strength).
The penalty term for Ridge would be calculated as:
This penalty shrinks the coefficients to reduce overfitting but does not remove any features.
Lasso Regression (L1 Regularization)
Lasso regression addresses overfitting by adding an L1 penalty i.e sum of absolute coefficients to the model's loss function. This encourages some coefficients to become exactly zero helps in effectively removing less important features. It also helps to simplify the model by selecting only the key features.
Formula for Lasso Regression:
{Lasso Loss} = \sum_{i=1}^{m} (y_i - \hat{y}_i)^2 + \lambda \sum_{j=1}^{n} |\beta_j| 
where:
- The first term calculates the prediction error.
- The second term encourages sparsity by shrinking some coefficients to zero.
Example: Let’s assume the same house price prediction example but now using Lasso. Assume:
- \beta1 = 5 (Size coefficient)
- \beta2 = 0 (Number of rooms coefficient is irrelevant and should be removed)
- \lambda = 0.1 (regularization strength).
The penalty term for Lasso would be:
Here Lasso forces 
Elastic Net Regression (L1 + L2 Regularization)
Elastic Net regression combines both L1 (Lasso) and L2 (Ridge) penalties to perform feature selection, manage multicollinearity and balancing coefficient shrinkage. This works well when there are many correlated features helps in avoiding the problem where Lasso might randomly pick one and ignore others.
Formula for Elastic Net Regression:
{Elastic Net Loss} = \sum_{i=1}^{m} (y_i - \hat{y}_i)^2 + \lambda_1 \sum_{j=1}^{n} |\beta_j| + \lambda_2 \sum_{j=1}^{n} \beta_j^2 
where:
- The first term calculates the prediction error.
- The second term applies the L1 penalty for feature selection.
- The third term applies the L2 penalty to handle multicollinearity.
It provides a more stable and generalizable model compared to using Lasso or Ridge alone.
Example: Let’s assume we are predicting house prices using Size and Number of Rooms. Assume:
- \beta1 = 5 (Size coefficient)
- \beta2 = 3 (Number of rooms coefficient)
- \lambda1 = 0.1 (L1 regularization).
- \lambda2 = 0.1 (L2 regularization).
The penalty term for Elastic Net would be:
This penalty shrinks both coefficients but because of the mixture of L1 and L2 it does not force any feature to zero unless absolutely necessary.
Lasso vs Ridge vs Elastic Net
Now lets see a tabular comparison between these three for better understanding.
| Features | Lasso Regression | Ridge Regression | Elastic Net Regression | 
|---|---|---|---|
| Penalty Type | L1 Penalty: Lasso uses the absolute values of coefficients. | L2 Penalty: Ridge uses the square of the coefficients. | L1 + L2 Penalty: Elastic Net uses both absolute and square penalties together. | 
| Effect on Coefficients | It completely removes unnecessary features by setting their coefficients to zero. | It makes all coefficients smaller but doesn’t set them to zero. | It removes some features and reduces others by balancing both. | 
| Best Use Case | It is best when we want to remove irrelevant features | It is good when all features matter but we want to reduce their impact | It is best for when we features are correlated and feature selection is needed | 
| Hyperparameters involved | Alpha: Controls how much regularization is applied. A higher alpha means more shrinkage. | Alpha: Similar to Lasso which helps in controlling the strength of regularization. | Alpha + L1_ratio: Two parameters. Alpha controls regularization strength and L1_ratio adjusts the balance between Lasso and Ridge. | 
| Bias and Variance | High bias, low variance | Low bias, high variance | Balance of bias and variance | 
| Strengths | It is great for automatically choosing important features. | It works well when features are related but shouldn’t be completely removed. | It combines Lasso’s feature selection and Ridge’s handling of correlations. | 
| Weaknesses | It can sometimes remove useful features if not tuned properly. | It keeps all features which may not help in high-dimensional data with irrelevant features. | It is a bit harder to tune due to having two parameters. | 
| Example | Imagine we have 100 features to predict house prices. It will set the coefficients of irrelevant features (like house color) to zero. | If we have 100 features it will reduce the impact of every feature but won’t completely remove any. | If we have features like “size” and “rooms” that are similar it will remove one and shrink the other. | 
Using the right regularization technique helps us to build models that are both accurate and easy to interpret.
