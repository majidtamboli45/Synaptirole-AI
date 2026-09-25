# Processing with Sklearn using Standard and Minmax scaler

> Source: https://www.geeksforgeeks.org/machine-learning/data-pre-processing-wit-sklearn-using-standard-and-minmax-scaler/

Data preprocessing is one of the most important steps in any machine learning pipeline. Raw data often comes with different scales, units and distributions, which can lead to poor performance of models. Algorithms such as Gradient Descent methods, K-Nearest Neighbors (KNN), Linear Regression and Logistic Regression are particularly sensitive to the scale of input features. To handle this, feature scaling is applied. We will explore two of the most used scaling techniques provided by scikit-learn:
- StandardScaler: Standardizes features to zero mean and unit variance.
- MinMaxScaler: Rescales features to a specific range (default [0,1]).
1. StandardScaler
The StandardScaler transforms data such that each feature has:
- A mean of 0
- A standard deviation of 1
This process is called standardization (or Z-score normalization). Unlike simple rescaling, it changes the distribution of the feature so that values are measured in terms of their distance (in standard deviations) from the mean. This is particularly useful when:
- The dataset follows (or approximately follows) a normal distribution.
- Algorithms assume standardized input (e.g., Linear Regression, Logistic Regression, PCA).
Formula:
z=\frac{x-\mu}{\sigma} 
Where:
- z = standardized value
- x = original feature value
- \mu = mean of the feature
- \sigma = standard deviation of the feature
Example:
from sklearn.preprocessing import StandardScaler
data = [[11, 2], [3, 7], [0, 10], [11, 8]]
scaler = StandardScaler()
scaled_data = scaler.fit_transform(data)
print(scaled_data)
Output:
Advantages
- Useful when features follow a Gaussian (normal) distribution.
- Works well with algorithms assuming data is centered (Linear/Logistic Regression, PCA, SVM).
- Less affected by outliers compared to MinMaxScaler.
Disadvantages
- Does not preserve original distribution of data (values become relative to mean/std).
- If the data is not close to normal distribution, results may not be optimal.
- Still sensitive to extreme outliers (though less than MinMaxScaler).
2. MinMaxScaler
The MinMaxScaler rescales features to a fixed range, usually [0,1]. Unlike standardization, it does not change the distribution shape of the data; it only shifts and scales values so that the minimum feature value maps to the lower bound and the maximum maps to the upper bound.
This is useful when:
- Data does not follow a normal distribution.
- A bounded range is required (e.g., inputs for Neural Networks, image pixel values).
Formula:
First normalize to zero-one scale:
x_{std} = \frac{x - x_{\min}}{x_{\max} - x_{\min}} 
Then scale to the desired feature range (min,max)(min, max)(min,max):
x_{scaled} = x_{std} \times (max - min) + min 
Where:
- x = original feature value
- x_{min},x_{max} = minimum & maximum values of the feature
- min, max = desired output range (default: [0,1])
Example:
from sklearn.preprocessing import MinMaxScaler
data = [[11, 2], [3, 7], [0, 10], [11, 8]]
scaler = MinMaxScaler()
scaled_data = scaler.fit_transform(data)
print(scaled_data)
Output:
Applications
Feature scaling is used in:
- Gradient Descent Optimization: Prevents slow convergence due to large feature differences.
- K-Nearest Neighbors (KNN): Ensures fair distance calculations.
- Principal Component Analysis (PCA): Equalizes feature contribution to variance.
- Support Vector Machines (SVM): Improves margin calculation in kernel space.
- Neural Networks: Keeps inputs in a manageable range, leading to stable training.
Advantages
- Preserves the original distribution shape of the data.
- Ensures all values fall within a bounded range ([0,1] by default).
- Works well for algorithms where absolute scale matters (e.g., KNN, Neural Networks).
Disadvantages
- Highly sensitive to outliers one extreme value can skew scaling.
- Does not standardize variance; features may still differ in spread.
- If training and test data ranges differ, results may be inconsistent.
