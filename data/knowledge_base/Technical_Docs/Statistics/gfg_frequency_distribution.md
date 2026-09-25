# Frequency Distribution

> Source: https://www.geeksforgeeks.org/maths/frequency-distribution

A frequency distribution is a method for organizing data and determining how often each value occurs.
- It shows how many times each value or range of values occurs in a dataset.
- Instead of examining raw, scattered numbers, this approach presents data in a structured table or graph, making patterns, trends, and comparisons easy to identify.
Frequency distributions allow even nontechnical readers, such as founders or investors, to interpret large datasets efficiently. Today, they are considered a core component of data analysis, statistics, and data visualization.
Frequency Distribution Graphs
To represent a frequency distribution, various methods are available, including histograms, Bar Graphs, Frequency Polygons, and Pie Charts.
| Graph Type | Description | Use Cases | 
|---|---|---|
| Histogram | Represents the frequency of each interval of continuous data using bars of equal width. | Continuous data distribution analysis. | 
| Bar Graph | Represents the frequency of each interval using bars of equal width; it can also represent discrete data. | Comparing discrete data categories. | 
| Frequency Polygon | Connects midpoints of class frequencies using lines, similar to a histogram but without bars. | Comparing various datasets. | 
| Pie Chart | Circular graph showing data as slices of a circle, indicating the proportional size of each slice relative to the whole dataset. | Showing relative sizes of data portions. | 
Frequency Distribution Table
A frequency distribution table is a way to organize and present data in a tabular form, which helps us summarize a large dataset into a concise table.
In the frequency distribution table, there are two columns: one representing the data either in the form of a range or an individual data set, and the other column showing the frequency of each interval or individual.
For example, let's say we have a dataset of students' test scores in a class.
| Test Score | Frequency | 
|---|---|
| 0-20 | 6 | 
| 20-40 | 12 | 
| 40-60 | 22 | 
| 60-80 | 15 | 
| 80-100 | 5 | 
Types of Frequency Distribution
There are four types of frequency distribution:
1. Grouped Frequency Distribution
In a Grouped Frequency Distribution, observations are divided between different intervals known as class intervals, and then their frequencies are counted for each class interval. This Frequency Distribution is used mostly when the data set is very large.
Example: Make the Frequency Distribution Table for the ungrouped data given as follows:
23, 27, 21, 14, 43, 37, 38, 41, 55, 11, 35, 15, 21, 24, 57, 35, 29, 10, 39, 42, 27, 17, 45, 52, 31, 36, 39, 38, 43, 46, 32, 37, 25
Solution:
As there are observations in between 10 and 57, we can choose class intervals as 10-20, 20-30, 30-40, 40-50, and 50-60. In these class intervals, all the observations are covered and for each interval, there are different frequency which we can count for each interval.
Thus, the Frequency Distribution Table for the given data is as follows:
Class Interval Frequency 10 - 20
5
20 - 30
8
30 - 40
12
40 - 50
6
50 - 60
3
2. Ungrouped Frequency Distribution
In an Ungrouped Frequency Distribution, all distinct observations are mentioned and counted individually. This Frequency Distribution is often used when the given dataset is small.
Example: Make the Frequency Distribution Table for the ungrouped data given as follows:
10, 20, 15, 25, 30, 10, 15, 10, 25, 20, 15, 10, 30, 25
Solution:
As unique observations in the given data are only 10, 15, 20, 25, and 30 with each having a different frequency.
Thus, the Frequency Distribution Table of the given data is as follows:
Value Frequency 10
4
15
3
20
2
25
3
30
2
3. Relative Frequency Distribution
This distribution displays the proportion or percentage of observations in each interval or class. It is useful for comparing different data sets or for analyzing the distribution of data within a set.
Relative Frequency is given by:
Example: Make the Relative Frequency Distribution Table for the following data:
| Score Range | 0-20 | 21-40 | 41-60 | 61-80 | 81-100 | 
|---|---|---|---|---|---|
| Frequency | 5 | 10 | 20 | 10 | 5 | 
Solution:
To Create the Relative Frequency Distribution table, we need to calculate Relative Frequency for each class interval. Thus Relative Frequency Distribution table is given as follows:
Score Range Frequency Relative Frequency 0-20
5
5/50 = 0.10
21-40
10
10/50 = 0.20
41-60
20
20/50 = 0.40
61-80
10
10/50 = 0.20
81-100
5
5/50 = 0.10
Total
50
1.00
4. Cumulative Frequency Distribution
A cumulative frequency distribution shows the total number of observations up to and including a certain value or class. It helps in understanding how values accumulate across a dataset:
- Less than Type: We sum all the frequencies before the current interval.
- More than Type: We sum all the frequencies after the current interval.
Example: The table below gives the values of runs scored by Virat Kohli in the last 25 T-20 matches. Represent the data in the form of a less-than-type cumulative frequency distribution:
| 45 | 34 | 50 | 75 | 22 | 
| 56 | 63 | 70 | 49 | 33 | 
| 0 | 8 | 14 | 39 | 86 | 
| 92 | 88 | 70 | 56 | 50 | 
| 57 | 45 | 42 | 12 | 39 | 
Solution:
Since there are a lot of distinct values, we'll express this in the form of grouped distributions with intervals like 0-10, 10-20 and so. First let's represent the data in the form of grouped frequency distribution.
Runs Frequency 0-10
2
10-20
2
20-30
1
30-40
4
40-50
4
50-60
5
60-70
1
70-80
3
80-90
2
90-100
1
Now we will convert this frequency distribution into cumulative frequency distribution by summing up the values of current interval and all the previous intervals.
Runs scored by Virat Kohli Cumulative Frequency Less than 10
2
Less than 20
4
Less than 30
5
Less than 40
9
Less than 50
13
Less than 60
18
Less than 70
19
Less than 80
22
Less than 90
24
Less than 100
25
This table represents the cumulative frequency distribution of less than type.
Runs scored by Virat Kohli
Cumulative Frequency
More than 0
25
More than 10
23
More than 20
21
More than 30
20
More than 40
16
More than 50
12
More than 60
7
More than 70
6
More than 80
3
More than 90
1
This table represents the cumulative frequency distribution of more than type.
We can plot both the type of cumulative frequency distribution to make the Cumulative Frequency Curve.
Frequency Distribution Curve
A frequency distribution curve, also known as a frequency curve, is a graphical representation of a data set's frequency distribution. It is used to visualize the distribution and frequency of values or observations within a dataset.
1. Normal Distribution: Symmetrical and bell-shaped; data concentrated around the mean.
2. Skewed Distribution: Not symmetric; can be positively skewed (right-tailed) or negatively skewed (left-tailed).
3. Bimodal Distribution: Two distinct peaks or modes in the frequency distribution, suggesting data from different populations.
4. Multimodal Distribution: More than two distinct peaks or modes in the frequency distribution.
5. Uniform Distribution: All values or intervals have roughly the same frequency, resulting in a flat, constant distribution.
6. Exponential Distribution: The rapid drop-off in frequency as values increase, resembling an exponential function.
7. Log-Normal Distribution: The logarithm of the data follows a normal distribution, often used for multiplicative data, positively skewed.
Frequency Distribution Formula
Various formulas can be learned in the context of Frequency Distribution; one such formula is the coefficient of variation. This formula for Frequency Distribution is discussed below in detail.
Frequency (f) = Number of times a value occurs
Coefficient of Variation
We can use mean and standard deviation to describe the dispersion in the values. But sometimes, comparing the two series or frequency distributions becomes a little hard, as sometimes both have different units.
The coefficient of Variation is defined as,
\bold{\frac{\sigma}{\bar{x}} \times 100} Where,
- σ represents the standard deviation
\bold{\bar{x}} represents the mean of the observations
Note: Data with a greater C.V. is said to be more variable than the other. The series having lesser C.V. is said to be more consistent than the other.
Comparing Two Frequency Distributions with the Same Mean
We have two frequency distributions. Let's say that 
The Coefficient of Variation(CV) is calculated as follows
- C.V. of the first series = \frac{\sigma_1}{\bar{x}_1} \times 100
- C.V. of second series = \frac{\sigma_2}{\bar{x}_2} \times 100
We are given that both series have the same mean, i.e., 
So, now CVs for both series are,
C.V. of the first series = 
\frac{\sigma_1}{\bar{x}} \times 100 C.V. of the second series = 
\frac{\sigma_2}{\bar{x}} \times 100 
Notice that now, both series can be compared with the value of the standard deviation only. Therefore, we can say that for two series with the same mean, the series with a larger deviation can be considered more variable than the other one.
➢Practice: Solved Examples
