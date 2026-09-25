# Descriptive Statistics

> Source: https://www.geeksforgeeks.org/maths/descriptive-statistics

Descriptive statistics is a branch of statistics that focuses on summarizing and organizing data so it can be easily understood and interpreted. It helps in describing the main features of a dataset, either numerically or graphically, without making conclusions beyond the data itself (that is done in inferential statistics).
Descriptive statistics is divided into the following categories:
- Measures of Central Tendency (such as mean, median, mode)
- Measures of Dispersion (such as range, variance, standard deviation)
- Distribution shape (including skewness and kurtosis)
Additionally, graphical representations like charts, graphs, and tables are commonly used to visualize and interpret the data.
Measures of Central Tendency
The central tendency is defined as a statistical measure that may be used to describe a complete distribution or dataset with a single value, known as a measure of central tendency. Each measure of central tendency (mean, median, and mode) describes a different aspect of the data distribution and may give different insights depending on the dataset.
There are three main measures of central tendency: Mean, median, and mode.
Mean
The mean is the sum of all the components in a group or collection divided by the number of items in that group or collection. The mean of a data collection is typically represented as x̄ (pronounced "x bar").
The formula for calculating the mean of ungrouped data, which expresses it as a measure, is given as follows:
For a series of observations:
x̄ = Σx / n
where,
- x̄ = Mean Value of Provided Dataset
- Σx = Sum of All Terms
- n = Number of Terms
Example: Weights of 7 girls in kg are 54, 32, 45, 61, 20, 66, and 50. Determine the mean weight for the provided data collection.
Mean = Σx/n
= (54 + 32 + 45 + 61 + 20 + 66 + 50)/7
= 328 / 7
= 46.85
Thus, the group's mean weight is 46.85 kg.
Median
The median of a data set is the value of the middle-most observation obtained after organizing the data in ascending order, which is one of the measures of central tendency. The median formula may be used to compute the median for many types of data, such as grouped and ungrouped data.
Ungrouped Data Median (n is odd): [(n + 1)/2]th term
Ungrouped Data Median (n is even): [(n / 2)th term + ((n / 2) + 1)th term]/2
Where: n = Number of Terms
Example: Weights of 7 girls in kg are 54, 32, 45, 61, 20, 66, and 50. Determine the median weight for the provided collection of data.
Arrange the provided data collection in ascending order: 20, 32, 45, 50, 54, 61, 66
Median = [(n + 1) / 2]th term
= [(7 + 1) / 2]th term
= 4th term
= 50
Thus, group's median weight is 50 kg.
Mode
Mode is one of the measures of central tendency, defined as the value that appears the most frequently in the provided data, i.e., the observation with the highest frequency is known as the mode of the data. The mode formulae provided below can be used to compute the mode for ungrouped data.
Mode of Ungrouped Data: Most Repeated Observation in Dataset
Measures of Variability (Dispersion)
If the variability of data within an experiment must be established, absolute measures of variability should be employed. These metrics often reflect differences in the data collection in terms of the average deviations of the observations. The most prevalent absolute measurements of deviation are mentioned below
Range
The range represents the spread of your data from the lowest to the highest value in the distribution. It is the most straightforward measure of variability to compute. To get the range, subtract the data set's lowest and highest values.
Range = Highest Value – Lowest Value
Example: Calculate the range of the following data series: 5, 13, 32, 42, 15, 84
Arrange the provided data series in ascending order: 5, 13, 15, 32, 42, 84
Range = H - L
= 84 - 5
= 79
So, the range is 79.
Standard Deviation
Standard deviation (𝝈 or SD) represents the average level of variability in your dataset. It represents the average deviation of each score from the mean. The higher the standard deviation, the more varied the dataset is.
s = \sqrt{\frac{1}{n-1} \sum_{i=1}^n (X_i - \bar{X})^2} 
To calculate standard deviation, follow these six steps:
Step 1: Make a list of each score and calculate the mean. 
Step 2: Calculate deviation from the mean by subtracting the mean from each score.
Step 3: Square each of these differences.
Step 4: Sum up all squared variances.
Step 5: Divide the total of squared variances by N-1.
Step 6: Find the square root of the number that you discovered.
Example: Calculate the standard deviation of the following data series: 5, 13, 32, 42, 15, 84.
Solution:
Series
Deviation from Mean
Squared Deviation
5
5-31.83 = -26.83
719.85
13
13-31.83 = -18.83
354.57
32
32-31.83 = 0.17
0.0289
42
42-31.83 = 10.17
103.43
15
15-31.83 = -16.83
283.25
84
84-31.83 = 52.17
2721.71
Mean = 191/6 = 31.83
sum = 0
Sum = 4182.84
Squared deviation / N-1 => 4182.84 / 5 = 836.57
Standard deviation = √836.57 = 28.92
So, the standard deviation is 28.92
Variance
Variance is calculated as the average of squared departures from the mean. Variance measures the degree of dispersion in a data collection. The symbol for variance is 𝛔2. To calculate the variance,
\sigma^2 = \frac{1}{N} \sum_{i=1}^N (X_i - \mu)^2 
The more scattered the data, the larger the variance about the mean. Variance is the square of the standard deviation.
Example: Calculate the variance of the following data series: 5, 13, 32, 42, 15, 84.
First we have to calculate the standard deviation, which is done above.
SD = 28.92
s2 = (SD)2 = (28.92)2 = 836.57
So, the variance is 836.57
Mean Deviation
Mean deviation is used to find the average of the absolute values of the data about the mean, median, or mode. Mean deviation is sometimes also known as absolute deviation. The formula for mean deviation is given as follows:
Mean Deviation = 
\frac{1}{n} \sum_{i=1}^{n} \left| X_i - \mu \right| 
where,
- μ is the central value.
Example: Calculate the mean deviation for the numbers 3, 5, 7, 9, 11
To find the mean of the numbers 3, 5, 7, 9, and 11:
Mean = (3 + 5 + 7 + 9 + 11) ÷ 5 = 35 ÷ 5 = 7
Next, we calculate the absolute deviations from the mean:
- For 3: |3 − 7| = 4
- For 5: |5 − 7| = 2
- For 7: |7 − 7| = 0
- For 9: |9 − 7| = 2
- For 11: |11 − 7| = 4
So the absolute deviations are: 4, 2, 0, 2, 4
Now, the mean deviation is the average of these absolute deviations:
Mean Deviation = (4 + 2 + 0 + 2 + 4) ÷ 5 = 12 ÷ 5 = 2.4
Quartile Deviation
Quartile deviation is half of the difference between the third and first quartiles. The formula for quartile deviation is given as follows:
Quartile Deviation = (Q3 − Q1)/2
where,
- Q3 is the third quartile.
- Q1 is the first quartile.
Other measures of dispersion include the relative measures, also known as the coefficients of dispersion.
Example: Calculate the Quartile Deviation for the numbers 3, 5, 7, 9, and 11.
Q1 (25th Percentile) and Q3 (75th Percentile):
Data: [3, 5, 7, 9, 11] (5 points, median = 7)
Q1: Median of first half = Median of [3, 5] = 4
Q3: Median of second half = Median of [9, 11] = 10
Calculate Quartile Deviation: 
QD = \frac{Q3 - Q1}{2} = \frac{10-4}{2} = 3 The middle 50% of data spans 6 units (Q3 - Q1), so the average spread is 3 units.
Measures of Frequency Distribution
A frequency distribution table is a powerful way to summarize how data points are distributed across different categories or intervals. Helps identify patterns, outliers, and the overall structure of the dataset. It is often the first step in understanding the dataset before applying more advanced analytical methods or creating visualizations like histograms or pie charts.
Frequency Distribution Table Includes measures like
- Data intervals or categories
- Frequency counts
- Relative frequencies (percentages)
- Cumulative frequencies when needed
Applications
- Business and Economics: Useful for analyzing sales data, market trends, and customer behavior. They are used to generate averages, medians and standard deviations in order to better evaluate product performance, pricing strategies, and financial metrics.
- Healthcare: Used to analyze patient data such as demographics, medical histories and treatment outcomes. They assist healthcare workers in determining illness prevalence, assessing treatment efficacy, and identifying risk factors.
- Education: Useful in education since they summarize student performance on tests and examinations. They assist instructors in assessing instructional techniques, identifying areas for improvement, and monitoring student growth over time.
- Market Research: Used to analyze customer preferences, product demand and market trends. They enable businesses to make educated decisions about product development, advertising campaigns, and market segmentation.
- Finance and investment: Used to analyze stock market data, portfolio performance and risk management. They assist investors in determining investment possibilities, tracking asset values and evaluating financial instruments.
➣Practice: Solved Examples
