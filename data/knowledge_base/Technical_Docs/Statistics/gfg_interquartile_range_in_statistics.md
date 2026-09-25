# Interquartile Range in Statistics

> Source: https://www.geeksforgeeks.org/maths/interquartile-range

The Interquartile Range (IQR) tells us how spread out the middle 50% of the data is. It is less affected by extreme values and gives a better idea of how tightly or loosely the central data points are grouped. It is calculated using the first quartile (Q1) and third quartile (Q3).
- Focuses only on the central portion of the data.
- Not affected much by outliers, unlike the full range.
- Gives a clear view of how values are arranged around the median.
Quartiles
Quartiles divide the dataset into four equal parts:
- Q1 (First Quartile): Separates the lowest 25% of the data
- Q2 (Second Quartile / Median): Middle value of the dataset
- Q3 (Third Quartile): Separates the highest 25% of the data
The IQR captures the range between Q1 and Q3, representing the middle 50% of the distribution.
Formula of IQR
The data is sorted in ascending order and split into 4 equal parts: Q1, Q2, Q3, called first, second, and third quartiles, respectively, in the given data.
The IQR is simply the difference between the third quartile (Q3) and the first quartile (Q1), which is calculated as:
\text{Interquartile Range = Upper Quartile (Q3)– Lower Quartile(Q1)} 
It tells us how spread out the central 50% of the data is, which helps to gauge the data's variability without being influenced by outliers.
How to Calculate the Interquartile Range
Step 1: Sort the data in ascending order
Step 2: Find the median (Q2)
Step 3: Split the dataset into two halves
- Q1 = median of lower half
- Q3 = median of upper half
Step 4: Calculate IQR
IQR = Q3 - Q1
Example
Dataset: 77, 85, 92, 64, 78, 95, 82
Sort the data: 64, 77, 78, 82, 85, 92, 95
Median (Q2) = 82
Lower half = 64, 77, 78
- Q1 is the median of the lower half (64, 77, 78) which is 77.
Upper half = 85, 92, 95
- Q3 is the median of the upper half (85, 92, 95) which is 92.
IQR = 92 - 77 = 15
So the IQR for this dataset is 15.
Understanding Semi Interquartile Range (SIQR)
Semi interquartile range is also known as the Quartile deviation is a measure of how spread out the middle 50% of the data is. It is useful for datasets with skewed distributions and is not affected much by extreme values or outliers.
- SIQR is half of the Interquartile Range (IQR).
- It provides insight into how data is distributed around a central point (the median).
- Extreme values have little impact on the SIQR helps in making it ideal for datasets with outliers.
How to Find Semi Interquartile Range
The semi interquartile range is calculated by the following steps:-
1. Find Q1: Identify the first quartile (Q1) from the data.
2. Find Q3: Identify the third quartile (Q3) from the data.
3. Subtract Q1 from Q3: IQR=Q3−Q1
4. Divide by 2: SIQR is half of the IQR:
Formula:
\text{SIQR} = \frac{1}{2} \times (Q_3 - Q_1) 
Interquartile Range Median (IQR Median)
The IQR Median is the median of the interquartile range which provides a measure of the central tendency for the middle 50% of our data. It minimizes the impact of extreme values helps in providing a more accurate reflection of the data's central distribution.
Relationship between Median and IQR:
- The Median (Q2) is the middle value of the dataset helps in splitting it into two equal parts.
- The IQR represents the range of values that lie between Q1 (25th percentile) and Q3 (75th percentile) capturing the middle 50% of the data.
When dealing with skewed distributions it’s better to use the median (Q2) for central tendency and IQR for variability as these are less affected by extreme outliers.
Applications of the Interquartile Range (IQR)
The Interquartile Range (IQR) has a variety of applications across different fields which includes:
- Outlier Detection: IQR is used in finance, healthcare and quality control to detect outliers. Data points that fall outside the range Q_1 - 1.5 \times IQR \quad \text{to} \quad Q_3 + 1.5 \times IQR are considered outliers.
- Measure of Variability for Skewed Distributions: Unlike the range, IQR is not sensitive to extreme values or outliers. It is useful for measuring variability in skewed datasets helps in providing a better representation of spread.
- Data Summary and Comparison: It acts as a tool for summarizing data when the dataset is non-normally distributed. It provides a focused view of the data's central 50% which offers valuable insights into data spread and central tendency.
- Predictive Data Analysis: IQR can be applied in predictive analytics where understanding the distribution of data plays an important role in model accuracy and prediction reliability.
- Central Tendency: While the mean can be skewed by extreme values, it focuses on the central 50% of the data which provides a clearer understanding of its true distribution.
Solved Examples on IQR
Example 1: You are given a dataset of the ages of students in a classroom: 18, 19, 20, 21, 22, 35, 13, 23,find the Interquartile Range ?
Solution:
- Arrange in ascending order: 13, 18, 19, 20, 21, 22, 23, 35
- Count the given values i.e is 8 so median is average of two numbers median =20+21/2 = 20.5
- Lower half is 13, 18, 19, 20
- Median of the lower half (Q1)= (18+ 19) / 2 = 18.5
- Upper half is 21, 22, 23, 35
- Median of the Upper half (Q3)= (22+ 23) / 2 = 22.5
- Finally
IQR = Q3 - Q1 = 22.5-18.5 = 4
Example 2: The age of a group of young gymnasts are 4, 5, 6, 3, 12, 14, 15, 13 Find the interquartile range and the semi-interquartile range?
Solution:
- Arrange in ascending order: 3, 4, 5, 6, 12, 13, 14, 15
- Count the given values i.e is 8 so median is average of two numbers median = 6+12/2 = 9
- Median of the lower half (Q1)= 4 + 5/2 = 4.5
- Upper half is 13, 14, 15
- Median of the Upper half (Q3) = 13 + 14/2 = 13.5
IQR = Q3 - Q1 = 13.5 - 4.5 = 9
Semi Interquartile Range = IQR/2 = 9.5/2 = 4.5 .
Practice Questions IQR
Question 1: Calculate the Interquartile Range for the following dataset: 12, 15, 20, 25, 30, 35, 40, 45?
Question 2: A dataset of temperatures in degrees Celsius for a week is given as follows: 18, 22, 20, 25, 19, 28, 17. Find the Interquartile Range?
Question 3: You have a dataset of the heights (in inches) of a group of individuals: 62, 67, 71, 68, 70, 75, 61, 66, 69, 70. Determine the Interquartile Range of heights?
