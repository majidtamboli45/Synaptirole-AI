# Confidence Interval

> Source: https://www.geeksforgeeks.org/data-science/confidence-interval/

A Confidence Interval (CI) is a range of values that contains the true value of something we are trying to measure like the average height of students or average income of a population.
Instead of saying: “The average height is 165 cm.”
We can say: “We are 95% confident the average height is between 160 cm and 170 cm.”
Interpreting Confidence Intervals
Let's say we take a sample of 50 students and calculate a 95% confidence interval for their average height which turns out to be 160–170 cm. This means If we repeatedly take similar samples 95% of those intervals would contain the true average height of all students in the population.
Confidence level tells us how sure we are that the true value is within a calculated range. If we have to repeat the sampling process many times we expect that a certain percentage of those intervals will include the true value.
| Confidence Level | Meaning | 
|---|---|
| 90% | 90 out of 100 intervals will include the true value | 
| 95% | 95 out of 100 intervals will include the true value (most commonly used) | 
| 99% | 99 out of 100 intervals will include the true value (more conservative) | 
Formula
\text{Confidence Level} = 1 - \alpha 
Where 
Why are Confidence Intervals Important in Data Science?
- They helps to measure uncertainty in predictions and estimates.
- Through this data scientists finds the reliable results instead of just giving a single number.
- They are widely used in A/B testing, machine learning, and survey analysis.
Steps for Constructing a Confidence Interval
To calculate a confidence interval follow these simple 4 steps:
Step 1: Identify the sample problem.
Define the population parameter you want to estimate e.g., mean height of students. Choose the right statistic such as the sample mean.
Step 2: Select a confidence level.
In this step we select the confidence level some common choices are 90%, 95% or 99%. It represents how sure we are about our estimate.
Step 3: Find the margin of error.
To find the Margin of Error, you use the formula:
Margin of Error = Critical Value × Standard Error
- Critical Value: Found using Z-tables (for large samples) or T-tables (for small samples).
- Standard Error (SE): Measures how much the sample mean varies.
SE = \frac{\text{Standard Deviation}}{\sqrt{n}} 
Combine these to get your Margin of Error the amount you add/subtract from your estimate to create a range.
Step 4: Specify the confidence interval.
To find a Confidence Interval, we use this formula:
Confidence Interval = Point Estimate ± Margin of Error
- The Point Estimate is usually your sample mean.
- Adding and subtracting the margin of error gives the range where the true value is likely to be.
Types of Confidence Intervals
Some of the common types of Confidence Intervals are:
1. Confidence Interval for the Mean of Normally Distributed Data
When we want to find the mean of a population based on a sample we use this method.
- If the sample size is small (less than 30) we use the T-distribution .
- If the sample size is large (more than 30) then we use the Z-distribution.
2. Confidence Interval for Proportions
This type is used when estimating population proportions like the percentage of people who like a product. Here we use the sample proportion, the standard error and the critical Z-value to calculate the interval. It gives us the idea where the real value could fall based on sample data.
3. Confidence Interval for Non-Normally Distributed Data
If your data isn’t normally distributed (doesn’t follow a bell curve), use bootstrap methods:
- Randomly resample the data many times
- Calculate intervals from these resamples
This gives a good estimate even if the data is skewed or irregular.
For Calculating Confidence Interval
To calculate a confidence interval you need two key statistics:
- Mean (\mu ): Average of all sample values
- Standard Deviation (\sigma ): Shows how much values vary from the mean
Once you have these you can calculate the confidence interval either using t-distribution or z-distribution depend on the sample size whether the population standard deviation is known.
A) Using t-distribution
Used when:
- Sample size is small
- Population standard deviation is unknown
Example:
Sample size = 10
Mean weight = 240 kg
Std deviation = 25 kg
Confidence Level = 95%
Step-by-Step Process:
- Degrees of Freedom (df): For t-distribution we first calculate the degrees of freedom:  df= n−1= 10−1= 9
- Significance Level (α): The confidence level (CL) is 95% so the significance level is: \alpha = \frac{1 - \text{CL}}{2} = \frac{1 - 0.95}{2} = 0.025
- Find t-value from t-distribution table: From the t-table for df = 9 and α = 0.025 the t-value is 2.262 which can be find using the below table.
| (df)/(α) | 0.1 | 0.05 | 0.025 | . . | 
|---|---|---|---|---|
| ∞ | 1.282 | 1.645 | 1.960 | . . | 
| 1 | 3.078 | 6.314 | 12.706 | . . | 
| 2 | 1.886 | 2.920 | 4.303 | . . | 
| : | : | : | : | . . | 
| 8 | 1.397 | 1.860 | 2.306 | . . | 
| 9 | 1.383 | 1.833 | 2.262 | . . | 
- Apply t-value in the formula: The formula for the confidence interval is: \mu \pm t \left( \frac{\sigma}{\sqrt{n}} \right) Using the values:240 \pm 2.262 \times \left(\frac{25}{\sqrt{10}}\right)
- The confidence interval becomes: (222.117,257.883)
Therefore we are 95% confident that the true mean weight of UFC fighters is between 222.117 kg and 257.883 kg.
This can be calculated using Python’s scipy and math library to find the t-value and perform the necessary calculations. The stats module provides various statistical functions, probability distributions, and statistical tests.
import scipy.stats as stats
import math
mean = 240
std = 25
n = 10
df = n - 1
alpha = 0.025
t = stats.t.ppf(1 - alpha, df)
moe = t * (std / math.sqrt(n))
lower = mean - moe
upper = mean + moe
print(f"Confidence Interval: ({lower:.2f}, {upper:.2f})")
Output:
Confidence Interval: (222.1160773511857, 257.8839226488143)
B) Using Z-distribution
Used when:
- Sample size is large
- Population standard deviation is known
Consider the following example. A random sample of 50 adult females was taken and their RBC count is measured. The sample mean is 4.63 and the standard deviation of RBC count is 0.54. Construct a 95% confidence interval estimate for the true mean RBC count in adult females.
Step-by-Step Process:
- Find the mean and standard deviation given in the problem.
- Find the z-value for the confidence level: For a 95% confidence interval the z-value is 1.960.
- Apply z-value in the formula: \mu \pm z\left(\frac{\sigma}{\sqrt{n}}\right)
Using the values: some common values in the table given below:
| Confidence Interval | z-value | 
|---|---|
| 90% | 1.645 | 
| 95% | 1.960 | 
| 99% | 2.576 | 
The confidence interval becomes: (4.480,4.780)
Therefore we are 95% confident that the true mean RBC count for adult females is between 4.480 and 4.780.
Now let's do the implementation of it using Python. But before its implementation we should have some basic knowledge about numpy and scipy.
from scipy import stats
import numpy as np
mean = 4.63
std_dev = 0.54
n = 50
z = 1.960
se = std_dev / np.sqrt(n)
moe = z * se
lower = mean - moe
upper = mean + moe
print(f"Confidence Interval: ({lower:.3f}, {upper:.3f})")
Output:
Confidence Interval: (4.480, 4.780)
Some Key Takeaways from Confidence Interval are:
- Confidence Intervals are essential in data science to find the uncertainty of estimates and make predictions more reliable.
- t-distribution is used for small sample sizes (n < 30) while z-distribution is used for large sample sizes (n > 30).
- Confidence intervals help to make data-driven decisions by providing a range instead of a single point estimate. This is especially important in A/B testing, market research and machine learning.
