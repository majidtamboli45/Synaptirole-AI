# Multicollinearity in Regression Analysis

> Source: https://www.geeksforgeeks.org/machine-learning/multicollinearity-in-regression-analysis/

Multicollinearity occurs when two or more independent variables in a regression model are highly correlated with each other. In other words, multicollinearity exists when there are linear relationships among the independent variables, this causes issues in regression analysis because it does not follow the assumption of independence among predictors. In this article, we will see what the causes are and how to detect and mitigate multicollinearity.
Causes of Multicollinearity in Regression Analysis
The typical causes of multicollinearity in regression analysis include:
- Correlation Among Predictor Variables: Multicollinearity often occurs when predictor variables in a regression model exhibit a high correlation with one another. This situation arises when one predictor variable can be accurately predicted from the others, complicating the estimation of individual predictor effects within the model.
- Overparameterization of the Model: Introducing too many predictor variables closer to the number of observations can also lead to multicollinearity. More predictors can cause redundancy and increase the variance of the coefficient estimates.
- Data Collection Issues: Problems in the data collection process can also introduce multicollinearity. For instance, if certain variables are measured with exceptional precision or are inherently interconnected, it can lead to multicollinearity in the regression model.
Detecting Multicollinearity in Regression Analysis
Detecting multicollinearity involves examining various diagnostic tools to assess the degree of correlation among predictor variables. Here are some common methods:
- Correlation Matrices: This involves calculating the correlation coefficients between pairs of predictor variables. High correlation coefficients (close to +1 or -1) indicate strong linear relationships between variables, which may suggest multicollinearity.
- Variance Inflation Factors (VIFs): VIF measures how much the variance of an estimated regression coefficient is inflated due to multicollinearity. A VIF greater than 10 (some use 5) is often considered indicative of multicollinearity, suggesting that the variance of the coefficient estimate is inflated by at least 10 times compared to what it would be if the predictors were uncorrelated.
By using these methods, analysts can assess the presence and severity of multicollinearity in their regression models and take appropriate steps to address it, such as removing highly correlated variables or using regularization techniques.
To see how you can detect multicollinearity you can : Click Here
Effects of Multicollinearity in Regression Analysis
Multicollinearity can have several adverse effects on regression analysis:
- Impact on Regression Coefficients: Multicollinearity can lead to unstable estimates of the regression coefficients. When predictor variables are highly correlated, it becomes difficult for the model to distinguish the individual effects of each variable on the dependent variable. As a result, the estimated coefficients may be imprecise or even have unexpected signs. For instance, a variable that should have a positive effect may appear to have a negative effect due to multicollinearity.
- Increased Standard Errors: Multicollinearity inflates the standard errors of the regression coefficients. This means that the estimated coefficients become less precise, and the confidence intervals around them widen. As a result, it becomes more challenging to determine whether the estimated coefficients are statistically significant or not.
- Degraded Interpretability: Multicollinearity makes it difficult to interpret the coefficients of the regression model accurately. Since the coefficients reflect the partial effect of each predictor variable on the dependent variable, multicollinearity may cause these effects to be obscured or distorted. Consequently, it becomes harder to draw meaningful conclusions about the relationships between the predictor variables and the dependent variable.
Overall, multicollinearity undermines the reliability and interpretability of regression analysis, making it essential to detect and address multicollinearity before drawing conclusions from the regression results. This may involve removing highly correlated variables, using regularization techniques, or collecting additional data to reduce multicollinearity.
How to mitigate Multicollinearity In Regression Analysis?
Mitigating multicollinearity in regression analysis is crucial for ensuring that your models provide reliable and interpretable results. Here are some effective strategies you can consider to address this issue:
- Remove Highly Correlated Predictors: Start by identifying and removing predictors that are highly correlated with each other. This can be determined through correlation matrices or Variance Inflation Factor (VIF) scores. Removing some of these variables can reduce multicollinearity without significantly impacting the model's accuracy.
- Principal Component Analysis (PCA): PCA can be used to transform the original correlated variables into a new set of uncorrelated variables (principal components). These principal components then serve as the predictors in your regression model. This technique is useful when you have many correlated variables.
- Ridge Regression: This is a regularization method that introduces a penalty term (L2 norm) to the regression model. The penalty term is proportional to the square of the magnitude of the coefficients, which helps reduce their size and the impact of multicollinearity. Ridge regression is particularly useful when you want to keep all variables in the model but need to control for multicollinearity.
- Increase Sample Size: If feasible, increasing the sample size can help reduce multicollinearity by providing more data points that can help distinguish the independent effects of correlated predictors.
Code Implementation of Mitigating Multicollinearity in Regression Analysis
- At first we create a dataset where the predictors ?1, ?2, and ?3 exhibit multicollinearity
- Then we use the Variance Inflation Factor (VIF) to quantify the severity of multicollinearity. High VIF values (typically VIF > 5 or 10) indicate significant multicollinearity among the predictors, confirming that specialized techniques like Ridge regression may be necessary.
- Ridge regression is applied as a technique to mitigate the issues caused by multicollinearity in a regression model. It is introduced with an alpha parameter set to 100, which controls the strength of the regularization.
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression, Ridge
from sklearn.metrics import mean_squared_error, r2_score
from statsmodels.stats.outliers_influence import variance_inflation_factor
# Generating a sample dataset with multicollinearity
np.random.seed(0)
size = 300  # Increased sample size for better effect of Ridge regression
# Generate predictors X1, X2, and X3 where X2 is highly correlated with X1 and X3 is somewhat correlated with both
X1 = np.random.normal(0, 1, size)
X2 = X1 + np.random.normal(0, 0.1, size)  # X2 is highly correlated with X1
X3 = 0.5 * X1 + 0.5 * X2 + np.random.normal(0, 0.1, size)  # X3 is correlated with X1 and X2
# Generate a response variable with some noise
Y = 2 * X1 + 3 * X2 + 1.5 * X3 + np.random.normal(0, 1, size)
# Combine into a DataFrame
df = pd.DataFrame({'X1': X1, 'X2': X2, 'X3': X3, 'Y': Y})
# Calculating VIFs to show multicollinearity
vif_data = pd.DataFrame()
vif_data["feature"] = df.columns[:-1]
vif_data["VIF"] = [variance_inflation_factor(df.values, i) for i in range(df.shape[1] - 1)]
# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(df[['X1', 'X2', 'X3']], df['Y'], test_size=0.2, random_state=42)
# Fit a standard linear regression model
lr_model = LinearRegression()
lr_model.fit(X_train, y_train)
y_pred_lr = lr_model.predict(X_test)
# Fit a Ridge regression model with a higher alpha for a better effect on multicollinearity
ridge_model = Ridge(alpha=100)
ridge_model.fit(X_train, y_train)
y_pred_ridge = ridge_model.predict(X_test)
# Calculate the performance
mse_lr = mean_squared_error(y_test, y_pred_lr)
r2_lr = r2_score(y_test, y_pred_lr)
mse_ridge = mean_squared_error(y_test, y_pred_ridge)
r2_ridge = r2_score(y_test, y_pred_ridge)
# Output the results
print("Variance Inflation Factor (VIF):")
print(vif_data)
print("\nLinear Regression - MSE: {:.2f}, R2: {:.3f}".format(mse_lr, r2_lr))
print("Ridge Regression - MSE: {:.2f}, R2: {:.3f}".format(mse_ridge, r2_ridge))
Output:
Variance Inflation Factor (VIF):
feature VIF
0 X1 119.686869
1 X2 157.409395
2 X3 111.435351
Linear Regression - MSE: 2.86, R2: 0.85
Ridge Regression - MSE: 1.98, R2: 0.965
The results show that Ridge regression significantly mitigates the effects of multicollinearity compared to standard linear regression. High Variance Inflation Factor (VIF) scores—119.69 for X1, 157.41 for X2, and 111.44 for X3—indicate strong multicollinearity among the predictors, which generally leads to unstable coefficient estimates in traditional regression models.
Conclusion
In conclusion, multicollinearity poses significant challenges in regression analysis by impacting the stability, accuracy, and interpretability of the model estimates. It arises mainly due to high correlations among predictor variables, overparameterization of the model, and certain data collection issues. The mitigation of multicollinearity is equally important, involving strategies such as removing highly correlated predictors, utilizing regularization techniques like Ridge Regression, and increasing the sample size when possible. Overall, understanding and addressing multicollinearity is essential for anyone involved in statistical modeling and data analysis. By carefully considering the structure of the data and the relationships among variables, analysts can improve the robustness of their regression models, leading to more meaningful insights and decisions based on their analyses.
