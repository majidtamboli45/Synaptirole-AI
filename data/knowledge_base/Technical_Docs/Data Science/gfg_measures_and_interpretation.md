# Measures and Interpretation

> Source: https://www.geeksforgeeks.org/data-science/skewness-measures-and-interpretation/

Skewness is a key statistical measure that shows how data is spread out in a dataset. It tells us if the data points are skewed to the left (negative skew) or to the right (positive skew) in relation to the mean. It is important because it helps us to understand the shape of the data distribution which is important for accurate data analysis and helps in identifying outliers and finding the best statistical methods to use for analysis. In this article, we will see skewness, different types of skewness and its core concepts.
Types of Skewness
Skewness describes the direction and degree of asymmetry in a dataset’s distribution. Various types are as follows:
1. Positive Skewness (Right Skew)
In a positively skewed distribution, the right tail is longer than the left which means most data points are on the left with a few large values pulling the distribution to the right.
Relationship:
Mean > Median > Mode
Examples: Income distribution, exam scores and stock market returns.
2. Negative Skewness (Left Skew)
In a negatively skewed distribution, the left tail is longer which means most data points are on the right with a few smaller values pulling the distribution to the left.
Relationship:
Mean < Median < Mode
Examples: Test scores on easy exams, age at retirement and gestational age at birth.
3. Zero Skewness (Symmetrical Distribution)
Zero skewness shows a perfectly symmetrical distribution where the mean, median and mode are equal. In a symmetrical distribution, the data points are evenly distributed around the central point.
Relationship:
Mean = Median = Mode
Example: A perfectly balanced dataset with equal frequencies of all values.
Tests of Skewness
There are several ways to find the skewness of a dataset which can help to find whether the data is positively skewed, negatively skewed or roughly symmetric. Below are some common methods used to measure skewness:
1. Visual Inspection
This is the simplest and quickest method for assessing skewness by creating a histogram or a density plot of the given data.
- If the plot has a long tail on the right, the data is positively skewed (right-skewed).
- If the plot has a long tail on the left, the data is negatively skewed (left-skewed).
- If the plot is roughly symmetric, the data has no skewness (zero skew).
2. Skewness Coefficient (Pearson's First Coefficient of Skewness)
This is a numerical measure of skewness based on the relationship between the mean and mode. It helps us to find if the data is skewed when the mean and mode are not equal.
Formula : 
Skewness = Mean - Mode 
- Positive Skew: If the mean is greater than the mode, the skewness is positive.
- Negative Skew: If the mean is smaller than the mode, the skewness is negative.
- Zero Skew: If the mean is equal to the mode, the skewness is zero which indicates a symmetric distribution.
3. Skewness Based on Quartiles
This method checks the distances between the quartiles to find skewness. If the quartiles are not equidistant, it suggests skewness:
- The third quartile (Q3) minus the median (Me) should ideally be equal to the median (Me) minus the first quartile (Q1) in a symmetric distribution.
- If this condition is not met, it shows either a positive or negative skew which depends on which side is longer.
Measurement of Skewness
Skewness is measured using different techniques to quantify the degree of asymmetry in a dataset's distribution. Below are three common methods to measure skewness:
1. Karl Pearson's Measure
Karl Pearson's Measure uses the mean, median and standard deviation of the given data to measure the asymmetry of the distribution. It provides a dimensionless number that helps to quantify how skewed the data is.
Formula:
- With respect to Mean and Median:
S_k = \frac{3\times(\bar{X} - M)}{σ} - With respect to Mean and Mode:
S_k = \frac{(\bar{X} - Mode)}{σ} 
Where:
- S_k is Karl Pearson's skewness coefficient
- \bar{X} = Mean of the dataset
- M = Median of the dataset
- \sigma = Standard deviation of the dataset
Interpretation:
- Skewness = 0: The distribution is symmetric means the mean, median and mode are equal.
- Skewness > 0: The distribution is positively skewed (right-skewed) with the tail on the right side longer than the left.
- Skewness < 0: The distribution is negatively skewed (left-skewed) with the tail on the left side longer than the right.
Example: Calculate Pearson's skewness coefficient for a dataset of exam scores: 85, 88, 92, 94, 96, 98, 100, 100, 100, 100.
Solution:
Step 1: Calculation of Mean
Mean(\bar{X})=\frac{85+88+92+94+96+98+100+100+100+100}{10}=\frac{953}{10}=95.3 Step 2: Calculation of Median
Since there are 10 data points, the median is the average of the 5th and 6th values when sorted in ascending order:
Median=\frac{(96+98)}{2}=\frac{194}{2}=97 Step 3: Calculation of standard deviation.
σ^2=\frac{Σ(xi-μ)^2}N=\frac{(85-95.3)^2+...+(100-95.3)^2}{10} =\frac{268.1}{10} =26.81 Thus 
σ=√26.81 σ = ~5. Step 4: Calculation of mode
It is clear from the data set that 100 is the most frequently occurring value in the data. Hence mode of given data is 100.
Step 5: Substitute the values in the formulae
1. With respect to Mean and Median
S_k=\frac{3 (\bar{X}-M)}{σ}=\frac{(3\times(95.3-97))}5=\frac{-5.1}5 S_k = -1.02 2. With respect to Mean and Mode
S_k=\frac{(\bar{X}-Mode)}{σ}=\frac{(95.3-100)}{5} S_k = -0.94 Since the skewness coefficient (
S_k ) is negative which shows a slight negative skewness in the distribution of exam scores. This means that the tail of the distribution is slightly longer on the left side and most of the scores are concentrated on the right side of the mean.
2. Bowley's Measure
Bowley’s Skewness Coefficient is another method for calculating skewness based on quartiles (Q1, Q2, Q3). Unlike Karl Pearson’s measure it does not rely on the mean or standard deviation which makes it useful for data that might not follow a normal distribution. It’s calculated using the first quartile (Q1), the second quartile (Q2 or median) and the third quartile (Q3).
Formula:
B= \frac{Q_3+Q_1-2Q_2}{Q_3-Q_1} 
Where:
- Q1 = First quartile (25th percentile)
- Q2 = Second quartile (50th percentile or median)
- Q3 = Third quartile (75th percentile)
Interpretation:
- B = 0: The distribution is perfectly symmetric (no skewness).
- B < 0: The distribution is negatively skewed (left-skewed) with the tail on the left side longer.
- B > 0: The distribution is positively skewed (right-skewed) with the tail on the right side longer.
Example: Calculate Bowley's Measure of Skewness for the following dataset representing the ages of a group of people in a sample: 20, 24, 28, 32, 35, 40, 42, 45, 50.
Solution:
Step 1: Calculate the median (Q2)
Q_2= 35 (the middle value)
Step 2: Calculate the first quartile (Q1)
To find Q1 lets consider the values to the left of the median: 20, 24, 28, 32
Q_1=\frac{24+28}{2}=26 Step 3: Calculate the third quartile (Q3)
To find Q3 lets consider the values to the right of the median: 40, 42, 45, 50.
Q_3=\frac{42+45}{2}=43.5 Step 4: Substitute the above values in the formula
B=\frac{Q_1+Q_3-2Q_2}{Q_3-Q_1}=\frac{26+43.5-2\times35}{43.5-26} B = -0.02 Since B < 0, this shows a negatively skewed (left-skewed) distribution means the tail is longer on the left side.
3. Kelly's Measure
Kelly’s Skewness Measure calculates skewness by comparing certain percentiles in the data which typically the 10th, 50th (median) and 90th percentiles. This measure is useful when dealing with datasets that are not normally distributed or when other skewness measures may not be as effective.
Formula:
\text{Skewness} = \frac{P_{90} + P_{10} - 2P_{50}}{P_{90} - P_{10}} 
Where:
- P_{90} = 90th percentile
- P_{50} = 50th percentile (Median)
- P_{10} = 10th percentile
Interpretation:
- SKL > 0: Positive skew means the right tail is longer or heavier.
- SKL < 0: Negative skew means the left tail is longer or heavier.
- SKL ≈ 0: The distribution is symmetric shows little or no skewness.
Example: Calculate Kelly's Coefficient of Skewness for the following data:5, 7, 8, 9, 10, 12, 15, 16, 18, 20.
Solution:
Step 1: Find the 10th Percentile
To find the 10th percentile, we need to rank the data in ascending order and find the value below which 10% of the data falls. In this dataset, the 10th percentile corresponds to the value at position 1 since 10% of 10 data points is 1. So, the 10th percentile is 5.
P_{10} = 5 Step 2: Find the 50th Percentile (Median)
Since there are 10 data points, the median is the average of the 5th and 6th values when sorted in ascending order
Median=\frac{10+12}{2}=\frac{22}{2}=11 P_{50} = 11 Step 3: Find the 90th Percentile
To find the 90th percentile we need to identify the value below which 90% of the data falls. In this dataset, the 90th percentile corresponds to the value at position 9 since 90% of 10 data points is 9. So the 90th percentile is 18.
P_{90} = 18 Step 4: Substitute the values in the formula.
SK_L = \frac{18+5-2\times11}{18-5} SK_L = 0.07 Since SKL > 0, this shows a slight positive skew (right-skewed) means the distribution has a longer tail on the right side.
Interpretation of Skewness
Interpreting skewness involves understanding both the direction (left or right) and the magnitude (degree of skew) of the data distribution.
Direction of Skewness
1. Negative Skewness (Left Skewed): If the skewness is negative, it shows that the distribution is skewed to the left. In a left-skewed distribution:
- The tail on the left side (the smaller values) is longer and contains outliers.
- The majority of data points are concentrated on the right side.
- The mean is less than the median.
2. Positive Skewness (Right Skewed): A positive skewness shows that the distribution is skewed to the right. In a right-skewed distribution:
- The tail on the right side (the larger values) is longer and may contain outliers.
- Most data points are concentrated on the left side.
- The mean is greater than the median.
3. Zero Skewness (Symmetric): A skewness value close to zero suggests a symmetric distribution where the data is evenly distributed on both sides of the mean. This means there is no skewness.
Magnitude of Skewness
The magnitude of skewness gives us information about how extreme the skewness is:
- Skewness close to 0 (between -0.5 and 0.5): The distribution is approximately symmetric.
- Skewness below -1: Strong left skewness (negative skew) with a long tail on the left side.
- Skewness above 1: Strong right skewness (positive skew) with a long tail on the right side.
Handling Skewness in Data
When working with skewed data, it's important to understand how to handle skewness effectively. Skewed data can impact the accuracy of statistical analyses and predictions. There are various methods to handle skewness depending on the nature of the data and the analysis we want to perform. Let's see how we can handle skewness:
1. Data Transformation
- Log Transformation: It is useful for right-skewed data, compressing high values to create a more symmetric distribution.
- Square Root/Cube Root: It helps reduce positive skew, especially for count data.
- Box-Cox Transformation: A flexible method for handling both positive and negative skew.
2. Removing Outliers
Outliers can cause skewness, so removing them may improve symmetry:
- Z-score: It identify and remove data points with z-scores beyond ±3.
- IQR Method: It remove data points beyond 1.5 times the interquartile range.
3. Non-Parametric Tests
When transformations aren't effective, consider non-parametric tests like the Mann-Whitney U Test or Kruskal-Wallis Test which do not assume normal distribution and focus on medians rather than means.
4. Machine Learning Models
Some models handle skewed data better:
- Tree-based Models: Decision trees and random forests are less sensitive to skewness.
- Generalized Linear Models (GLM): Use appropriate link functions to model skewed data effectively.
Difference between Dispersion and Skewness
While dispersion and skewness may seem similar but they measure different aspects of data distribution. Dispersion refers to the extent to which data points are spread out from the central value (mean or median). It gives us an understanding of how varied the data is.
Now let's see a tabular differences for better understanding:
| Dispersion | Skewness | 
|---|---|
| Measures the spread of data around the central value (mean, median). | Measures the shape of the distribution and direction (left or right). | 
| Variance, standard deviation, range, interquartile range (IQR). | Pearson's coefficient of skewness, moment skewness, Q-Q plots. | 
| Dispersion affects the mean’s interpretation but is not directly related. | Skewness shows the relationship between the mean and median. | 
| High dispersion means data points are spread out widely. | Positive skew: Right tail longer. Negative skew: Left tail longer. Zero skew: Symmetric. | 
| Helps understand the variability of data. | Helps identify the shape and asymmetry of data. | 
| Test scores spread, stock price variability, age range. | Income distribution (right-skewed), exam scores (left/right-skewed). | 
By mastering the concept of skewness and understanding its measurement we can easily assess data distributions, make informed decisions and apply the right techniques to our analyses.
