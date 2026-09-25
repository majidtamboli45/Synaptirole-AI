# Z score for Outlier Detection

> Source: https://www.geeksforgeeks.org/machine-learning/z-score-for-outlier-detection-python/

Outlier detection is an important task in data as identifying outliers can help us to understand the data better and improve the accuracy of our models. One common technique for detecting outliers is Z score. It is a statistical measurement that describes how far a data point is from the mean, expressed in terms of standard deviations. It helps us to identify if a data point is relatively higher or lower than the mean and how far it deviates from the average value.
Z-Score Formula:
Z = \frac{X - \mu}{\sigma} 
Where:
- X = Value of the data point
- μ = Mean of the data
- σ = Standard deviation of the data
Interpretation of Z-Score
Outlier can be detected using Z-scores as follows:
- A Z-score of 0 shows that the data point is exactly at the mean.
- A positive Z-score shows that the data point is above the mean.
- A negative Z-score shows that the data point is below the mean.
Commonly, data points with a Z-score greater than 3 or less than -3 are considered outliers as they lie more than 3 standard deviations away from the mean. This threshold can be adjusted based on the dataset and the specific needs of the analysis.
Why Use Z-Score for Outlier Detection?
Z-Score is useful for detecting outliers in normal distribution, as it highlights data points that lie far from the mean. A normal distributionis shown below and it is estimated that 68% of the data points lie between +/- 1 standard deviation. 95% of the data points lie between +/- 2 standard deviation 99.7% of the data points lie between +/- 3 standard deviation
For example, in a survey, it was asked how many children a person had. Suppose the data obtained from people is
1, 2, 2, 2, 3, 1, 1, 15, 2, 2, 2, 3, 1, 1, 2
Here, the value 15 is clearly an outlier as it deviates significantly from the other data points. The Z-Score for this data point will be much higher than the rest, showing it as an anomaly.
Lets see why it works so well:
- Simple Calculation: It’s easy to calculate using just the mean and standard deviation.
- Standardized Measure: Z-Score standardizes the data which makes it easier to detect anomalies across different datasets with varying units or scales.
- Identifying Extremes: Find outliers which are the data points that lie far from the mean. Since Z-Score measures how far a data point is from the mean, it’s perfect for identifying extremes in the data.
Steps for Z-Score Based Outlier Detection in Python
Let’s see the steps of detecting outliers using the Z-Score method in Python.
Step 1: Importing Necessary Libraries
We will be importing numpy, pandas, scipy and matplotlib for calculating the Z-Score and visualizing the outliers.
import numpy as np
import pandas as pd
from scipy.stats import zscore
import matplotlib.pyplot as plt
Step 2: Creating the Dataset
For this example, we will use sample data and convert this into a pandas DataFrame.
data = [5, 2, 4.5, 4, 3, 2, 6, 20, 9, 2.5, 3.5, 4.75, 6.5, 2.5, 8, 1]
df = pd.DataFrame(data, columns=['Value'])
Step 3: Calculating the Z-Scores
Now, we calculate the Z-scores for this dataset using the z-score function from scipy.stats.
df['Z-score'] = zscore(df['Value'])
print(df)
Output:
This give us the Z-Score for each data point in the dataset.
Step 4: Identifying Outliers
Next, we'll identify the data points that have a Z-score greater than 3 or less than -3 which are commonly considered outliers.
outliers = df[df['Z-score'].abs() > 3]
print(outliers)
Output:
Step 5: Visualizing the Data
To better understand the outliers, let’s create a scatter plot to visualize the dataset and highlight the outliers.
plt.figure(figsize=(10, 6))
plt.scatter(df['Value'].index, df['Z-score'], label='Data Points')
plt.scatter(outliers['Value'].index, outliers['Z-score'], color='red', label='Outlier')
plt.xlabel('Index Value')
plt.ylabel('Z-score')
plt.title('Scatter Plot of Value vs. Z-score')
plt.legend()
plt.grid(True)
plt.show()
Output:
In this case, the value 20 is an outlier because its Z-score is significantly higher than the rest of the values in the dataset.
Best Practices for Using Z-Score for Outlier Detection
While Z-Score is effective, there are a few important considerations:
- Assumption of Normal Distribution: Z-Score works best when the data follows a normal distribution. If our data is skewed, other methods like IQR (Interquartile Range) might be more appropriate.
- Threshold Selection: The threshold of 3 is commonly used but it can be adjusted depending on the data and the application.
- Handle Multiple Outliers: In large datasets, there might be several outliers. It’s important to decide whether to remove them or investigate further.
By applying the Z-score method, we can quickly identify and deal with outliers which improves the accuracy of our data analysis and statistical models.
