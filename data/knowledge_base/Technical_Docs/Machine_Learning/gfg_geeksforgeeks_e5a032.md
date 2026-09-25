# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/machine-learning/adjusted-r-squared/

In regression analysis, R-squared (R²) is commonly used to measure how well a model explains the variation in the data. However, a major limitation of R² is that it always increases as more variables are added to the model, even if those variables are not useful. To address this, Adjusted R-Squared was developed it modifies the R² value by accounting for the number of predictors, giving a more reliable indication of how well the model actually fits the data.
What is R-Squared?
Before understanding Adjusted R-squared, let’s briefly discuss R-squared. R-squared measures the proportion of the variance in the dependent variable that is predictable from the independent variables.
R^2 = 1 - \frac{SS_{\text{res}}}{SS_{\text{tot}}} 
Where:
- SS_{\text{res}} = Sum of squared residuals (errors)
- SS_{\text{tot}} = Total sum of squares
R-squared values range from 0 to 1. A value of 0 means the model explains none of the variability, while a value of 1 means it explains all of it.
The Problem with R-Squared
The main issue with R-squared is that it always goes up when you add more variables to the model, even if those variables don’t actually help. This can lead to overfitting, where the model looks good on training data but performs poorly on new data.
What is Adjusted R-Squared?
Adjusted R-squared is a modified version of R-squared that adjusts for the number of predictors in the model. It gives a more accurate picture of how well your model is performing.
Adjusted R-Squared Formula:
\text{Adjusted } R^2 = 1 - \left(1 - R^2\right) \cdot \frac{n - 1}{n - k - 1} 
Where:
- n = number of observations
- k = number of independent variables (predictors)
- R2 = the original R-squared
This formula penalizes the addition of new variables that do not improve the model.
Why is Adjusted R-Squared Better?
- It accounts for the number of predictors, reducing the chance of overfitting.
- It can decrease if new variables don’t add value, unlike R-squared.
- It gives a more honest measure of model performance.
Example - Suppose you are trying to predict a student's final exam score based on the number of hours studied, attendance, and whether they take notes in class. Create two models:
- Model A: Uses only hours studied.
- Model B: Uses hours studied, attendance, and note-taking.
Model B might have a higher R-squared, but if attendance and note-taking don't actually help much, the Adjusted R-squared could be lower than expected. This would indicate that the extra predictors are not improving the model significantly.
Implementation in Python
Here is a simple example using Python and statsmodels to compute Adjusted R-squared:
import statsmodels.api as sm
import pandas as pd
# Sample data
data = {
    'Hours_Studied': [2, 3, 4, 5, 6],
    'Attendance': [80, 85, 88, 90, 95],
    'Final_Score': [70, 75, 78, 85, 90]
}
df = pd.DataFrame(data)
X = df[['Hours_Studied', 'Attendance']]
X = sm.add_constant(X)  # adds the intercept
y = df['Final_Score']
model = sm.OLS(y, X).fit()
print("R-squared:", model.rsquared)
print("Adjusted R-squared:", model.rsquared_adj)
Output
R-squared: 0.9882979345854545
Adjusted R-squared: 0.9765958691709089
When to Use Adjusted R-Squared
- You are comparing models with different numbers of predictors.
- You want to check if adding new variables improves the model.
- You need a fairer evaluation of model performance.
Limitations of Adjusted R-Squared
- It can still be influenced by outliers.
- It only applies to linear regression models.
- It doesn’t tell you if your predictors are useful on their own.
