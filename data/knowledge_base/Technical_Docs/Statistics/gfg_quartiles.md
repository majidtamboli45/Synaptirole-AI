# Quartiles

> Source: https://www.geeksforgeeks.org/maths/quartile-formula

Quartiles divide a data set into four equal parts, each containing 25% of the data. They help to understand the spread and center of the data. As an important concept in statistics, quartiles are used to analyze large data sets by highlighting values near the middle. This method is particularly useful for identifying outliers and comparing different data sets.
Quartiles are values that split lists of datasets into quarters, resulting in lower, middle, and upper segments.
Lower or First Quartile (Q1)
- Quartile 1 lies between the starting term and the middle term.
- This is the median of the lower half of the data set.
- It is also known as the 25th percentile because it marks the point where 25% of the data is below it.
Median or Second Quartile (Q2)
- Quartile 2 lies between the starting terms and the last terms, i.e., the Middle term.
- This is the median of the entire data set.
- It is also known as the 50th percentile, as it divides the data into two halves.
Upper or Third Quartile
- Quartile 3 lies between quartile 2 and the last term.
- This is the median of the upper half of the data set.
- It is also known as the 75th percentile because it marks the point where 75% of the data is below it.
Quartile Formula
As mentioned above, Quartile divides the data into 4 equal parts. There is a separate formula for finding each quartile value, and the steps to obtain the quartile formula are as shown below as follows:
Step 1: Sort the given data in ascending order.
Step 2: Find respective quartile values/terms as per need from the below formulae.
- First Quartile =
\frac{(n + 1)}{4} \text{\small th term} - Second Quartile =
\frac{(n + 1)}{2} \text{\small th term} - Third Quartile =
\frac{3(n + 1)}{4} \text{\small th term} Where n is the total number of values in the dataset.
Example: Find the Q1, Q2, and Q3 of the given dataset: 3, 5, 7, 8, 10, 11, 3, 1, 1, 11.
Solution:
Arrange the dataset in ascending or descending order, depending on your preference. We will arrange the data in ascending order: 1, 3, 3, 5, 7, 8, 10, 11, 11
Cut the list into Quarters: (n = number of terms)
- Quartile 1 (Q1) = [(n + 1)/4] th Term = [( 9+ 1) / 4] = 2.25 term [Rounds off to 3 term] = 3
- Quartile 2 (Q2) = [(n + 1)/2 ] th Term = [{9 + 1)/2] = 5 th Term = 7
- Quartile 3 (Q3) = [3(n + 1)/4 ] th Term = [3 (10 + 1)/4] th Term = 7.5 th Term [Rounds off to 8 th Term] = 11
In the chart, the continuous variable is plotted against the independent variable, and the data is divided into quartiles.
Generalized Formula for Quartile
The generalized formula for the quartile is,
\bold{\text{Quartile}_r = l_1 + ( i\cdot \frac{n}{4} - c_f) \cdot \frac{(l_2-l_1)}{f}} 
Where,
- Quartiler indicates rth quartile,
- l1, l2 are the lower and upper limit value that contains the ith quartile,
- f is the frequency count,
- cf is the cumulative frequency of the class preceding the quartile class.
Using this generalized formula, the first and third quartiles can be calculated as:
\bold{\text{Q}_1 = l_1 + ( \frac{n}{4} - c_f) \cdot \frac{(l_2-l_1)}{f}} 
\bold{\text{Q}_3 = l_1 + ( \frac{3n}{4} - c_f) \cdot \frac{(l_2-l_1)}{f}} 
Interquartile Range
Interquartile Range is the distance between the first quartile and the third quartile. It is also known as a mid-spread. It helps us to calculate variation for the data, which is divided into quartiles. The formula for calculating the Interquartile range is given by,
Interquartile Range (IQR) = Q3 - Q1
Where,
- Q3 is the third/upper quartile, and
- Q1 is the first/lower quartile.
IQR is used for:
- Identify Outliers: Since the IQR focuses on the middle 50% of the data, any values that fall below Q1 - 1.5*IQR or above Q3 + 1.5*IQR are typically considered outliers.
- Measure Variability: It helps in understanding the spread of data around the median, giving us a better sense of data distribution than the range which can be influenced by outliers.
- Statistical Analysis: The IQR is often used in boxplots to visualize the spread and detect outliers. It is also useful for comparing different datasets, especially when the data contains outliers.
Note: Outliers are data points that significantly differ from the majority of the data, often appearing as extreme values far from the rest.
Quartile Deviation
Quartile Deviation is defined as half of the distance between the first quartile and the third quartile. It is also known as the semi-interquartile range. The formula for quartile deviation is given by,
Quartile Deviation = (Q3 - Q1)/2
Quartile vs Percentile
The key differences between Quartile and Percentile are given as follows:
| Quartile | Percentile | 
|---|---|
| A quartile is a type of quantile that divides a data set into four equal parts | A percentile is a type of quantile that divides a data set into 100 equal parts | 
| Quartiles divide a dataset into four parts:  | Percentiles divide a dataset into 100 parts, with each percentile representing 1% of the data. | 
| Quartiles are calculated by dividing the data set into four equal parts, with each part containing 25% of the data. | Percentiles are calculated by dividing the data set into 100 equal parts, with each part containing 1% of the data. a | 
| Quartiles are often represented as Q, Q2, and Q3. | Percentiles are often represented as P1, P2, P3, and so on up to P99 | 
| Quartiles are useful for identifying the spread and distribution of data, particularly in box plots and histograms. | Percentiles are useful for comparing an individual data point to the rest of the data set and for identifying extreme values or outliers. | 
➢Practice: Solved Examples
