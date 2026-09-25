# Regression Metrics

> Source: https://www.geeksforgeeks.org/machine-learning/regression-metrics/

Regression is a supervised learning technique used to model and analyze the relationship between input variables (features) and a continuous output variable (target). The primary objective of a regression model is to make accurate numerical predictions.
- They quantify the prediction error of regression models
- Different metrics emphasize different error characteristics
- Some metrics penalize large errors more than small ones
- Metric selection depends on problem requirements and data nature
- They help in model selection and optimization
Types of Regression Metrics
1. Mean Absolute Error (MAE)
Mean Absolute Error measures the average absolute difference between actual and predicted values. It treats all errors equally, regardless of their direction and provides results in the same unit as the target variable, making it easy to interpret.
\mathrm{MAE} = \frac{1}{n}\sum_{i=1}^{n}\left| y_i - \hat{y}_i \right| 
Where:
- n = total number of observations
- y_i  = actual value
- \hat y _i  = predicted value
Implementation:
from sklearn.metrics import mean_absolute_error
from sklearn.datasets import load_diabetes
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
data = load_diabetes()
X = data.data
y = data.target
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
model = LinearRegression()
model.fit(X_train, y_train)
y_pred = model.predict(X_test)
mae = mean_absolute_error(y_test, y_pred)
print("MAE:", mae)
Output:
MAE: 42.79409467959994
2. Mean Squared Error (MSE)
Mean Squared Error calculates the average of squared differences between actual and predicted values. By squaring errors, it penalizes larger mistakes more strongly, making it sensitive to outliers.
\mathrm{MSE} = \frac{1}{n}\sum_{i=1}^{n}\left( y_i - \hat{y}_i \right)^2 
Where:
- n = number of observations
- y_i  = actual value
- \hat y_i  = predicted value
Implementation:
from sklearn.metrics import mean_squared_error
mse = mean_squared_error(y_test, y_pred)
print("MSE:", mse)
Output:
MSE: 2900.193628493482
3. Root Mean Squared Error (RMSE)
Root Mean Squared Error is the square root of MSE. It maintains the strong penalty for large errors while converting the result back to the original unit of the target variable, improving interpretability.
\mathrm{RMSE} = \sqrt{\frac{1}{n}\sum_{i=1}^{n}\left( y_i - \hat{y}_i \right)^2} 
Where:
- n = number of observations
- y_i  = actual value
- \hat y_i  = predicted value
Implementation:
import numpy as np
from sklearn.metrics import mean_squared_error
rmse = np.sqrt(mean_squared_error(y_test, y_pred))
print("RMSE:", rmse)
Output:
RMSE: 53.85344583676593
4. R-squared (R² Score)
R-squared represents the proportion of variance in the target variable that is explained by the regression model. It provides insight into how well the model captures underlying data patterns.
R^2 = 1 - \frac{\sum_{i=1}^{n}\left( y_i - \hat{y}_i \right)^2}{\sum_{i=1}^{n}\left( y_i - \bar{y} \right)^2} 
Where:
- \bar y = mean of actual values
- Numerator = residual sum of squares
- Denominator = total sum of squares
Implementation:
from sklearn.metrics import r2_score
r2 = r2_score(y_test, y_pred)
print("R² Score:", r2)
Output:
R² Score: 0.4526027629719195
5. Mean Absolute Percentage Error (MAPE)
Mean Absolute Percentage Error expresses prediction error as a percentage of the actual values. It is intuitive and scale-independent but becomes unreliable when actual values are close to zero.
\mathrm{MAPE} = \frac{100}{n}\sum_{i=1}^{n}\left|\frac{y_i - \hat{y}_i}{y_i}\right| 
Where,
- n : total number of observations
- y_i : actual value
- \hat y_i : predicted value
Implementation:
import numpy as np
mape = np.mean(np.abs((y_test - y_pred) / y_test)) * 100
print("MAPE:", mape)
Output:
MAPE: 37.49982636756113
Interpreting the Results
- Mean Absolute Error (MAE): 42.79: An MAE of 42.79 indicates that, on average, the model’s predictions deviate from the actual values by approximately 42.79 units.
- Mean Squared Error (MSE): 2900.19: An MSE of 2900.19 shows that the average of the squared prediction errors is 2900.19, meaning the model incurs some large errors that are heavily penalized.
- R-squared (R²): 0.45: An R² value of 0.45 indicates that the model explains approximately 45% of the variance in the target variable, reflecting moderate predictive capability.
- Root Mean Squared Error (RMSE): 53.85: An RMSE of 53.85 suggests that the model’s predictions typically differ from the actual values by about 53.85 units, in the same scale as the target variable.
- Mean Absolute Percentage Error (MAPE): 37.50%: A MAPE of 37.50% implies that, on average, the model’s predictions are 37.5% away from the true values, indicating limited percentage-level accuracy.
