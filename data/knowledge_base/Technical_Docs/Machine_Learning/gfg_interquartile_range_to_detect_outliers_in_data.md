# Interquartile Range to Detect Outliers in Data

> Source: https://www.geeksforgeeks.org/machine-learning/interquartile-range-to-detect-outliers-in-data/

Outliers are observations that deviate significantly from the overall pattern of a dataset and this deviation can lead to poor results in analysis. Interquartile Range (IQR) is a technique that detects outliers by measuring the variability in a dataset. In this article we will learn about it.
Detecting Outlier with IQR
IQR is used to measure variability by dividing a data set into quartiles. The data is sorted in ascending order and then we split it into 4 equal parts. The values Q1 (25th percentile), Q2 (50th percentile or median) and Q3 (75th percentile) separate dataset in 4 equal parts.
If a dataset has 2n or 2n+1 data points, then
- Q2 = median of the dataset.
- Q1 = median of n smallest data points.
- Q3 = median of n highest data points.
The IQR is calculated as: IQR=Q3−Q1 = Q3 - Q1
Data points that fall below Q1−1.5×IQR or above Q3+1.5×IQR are considered outliers.
Example:
Assume the below data:
6, 2, 1, 5, 4, 3, 50.
If these values represent the number of chapatis eaten in lunch then 50 is clearly an outlier. Let’s use Python to detect it.
Step 1: Import necessary libraries.
import numpy as np 
import seaborn as sns
Step 2: Sorting data in ascending order.
data = [6, 2, 3, 4, 5, 1, 50]
sort_data = np.sort(data)
sort_data
Output:
array([ 1,  2,  3,  4,  5,  6, 50])
Step 3: Calculating Q1, Q2, Q3 and IQR.
Q1 = np.percentile(data, 25, interpolation = 'midpoint') 
Q2 = np.percentile(data, 50, interpolation = 'midpoint') 
Q3 = np.percentile(data, 75, interpolation = 'midpoint') 
print('Q1 25 percentile of the given data is, ', Q1)
print('Q1 50 percentile of the given data is, ', Q2)
print('Q1 75 percentile of the given data is, ', Q3)
IQR = Q3 - Q1 
print('Interquartile range is', IQR)
Output:
Q1 25 percentile of the given data is, 2.5
Q1 50 percentile of the given data is, 4.0
Q1 75 percentile of the given data is, 5.5
Interquartile range is 3.0
Step 4: Find the lower and upper limits.
low_lim = Q1 - 1.5 * IQR
up_lim = Q3 + 1.5 * IQR
print('low_limit is', low_lim)
print('up_limit is', up_lim)
Output:
low_limit is -2.0
up_limit is 10.0
Step 5: Identify the outliers.
outlier =[]
for x in data:
    if ((x> up_lim) or (x<low_lim)):
         outlier.append(x)
print(' outlier in the dataset is', outlier)
Output:
 outlier in the dataset is [50]
Step 6: Plot the box plot to highlight outliers.
sns.boxplot(data)
This method along with visualizing data through box plots ensures more reliable and robust data preprocessing.
