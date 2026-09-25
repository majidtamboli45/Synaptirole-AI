# Statistics Formulas

> Source: https://www.geeksforgeeks.org/maths/statistics-formulas

Statistics is the branch of mathematics that involves collecting, analyzing, interpreting, presenting, and organizing data.
Formulas cover key concepts like mean, median, mode, standard deviation, and other essential measures.
Measure of Central Tendency
These formulas help describe the center or typical value of a dataset.
| Statistic | Formula | Description of Variables | 
|---|---|---|
| Mean |  | X is each value in the dataset. | 
| Median | The middle value when the data is ordered | Data is sorted, and the middle value is identified | 
| Mode | Value that appears most frequently | Data points analyzed for frequency | 
| Variance |  | xi : individual score, xˉ: sample mean, n: sample size | 
| Standard Deviation |  | xi: individual score, xˉ: sample mean, n: sample size | 
Mean
Mean is one of the measures of central tendency. It finds the average value for the given data/observations. Arithmetic mean is defined as the sum of all the numbers in the data divided by the total count of numbers.
The formula for finding the mean is given by,
Where ∑X is summation of all observations.
n represents total count of all numbers/observations.
Sample Mean
The sample mean is the average of a subset of the population.
\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i 
Population Mean
The population mean is the average of all the data points in the entire population.
\mu = \frac{1}{N} \sum_{i=1}^{N} x_i 
Arithmetic Mean
The arithmetic mean is the most common type of average. It is calculated by adding all the values and dividing by the number of values.
General Form:\bar{x} = \frac{\sum x_i}{n} 
Expanded Form:\bar{x} = \frac{x_1 + x_2 + x_3 + \cdots + x_n}{n} 
Geometric Mean
The geometric mean is used when dealing with multiplicative relationships, such as growth rates or ratios. It is calculated by multiplying all values and then taking the nth root.
General Form:
Expanded Form:
\text{GM} = \left( \prod_{i=1}^n x_i \right)^{\frac{1}{n}} \text{GM} = \sqrt[n]{x_1 \cdot x_2 \cdot x_3 \cdot \cdots \cdot x_n} 
Weighted Mean
The weighted mean is used when different data points contribute unequally. Each value is multiplied by a weight, and the sum is divided by the total of weights.
General Form:
Expanded Form:
\bar{x}_w = \frac{\sum w_i x_i}{\sum w_i} \bar{x}_w = \frac{w_1 x_1 + w_2 x_2 + \cdots + w_n x_n}{w_1 + w_2 + \cdots + w_n} 
Harmonic Mean
The harmonic mean is useful for rates (e.g., speed, ratios) and is calculated as the reciprocal of the average of reciprocals.
General Form:
Expanded Form:
\text{HM} = \frac{n}{\sum \frac{1}{x_i}} \text{HM} = \frac{n}{\frac{1}{x_1} + \frac{1}{x_2} + \cdots + \frac{1}{x_n}} 
Median
Median is also one of the measures of central tendency. It gives the middle value in the given ordered data. The formula for finding the median is given by,
Median = [(n + 1)/2]th term
- Where n is the total count of numbers/observations.
- The above formula is applicable only when n is odd.
If n is even then median is calculated by the formula
Median = [(n/2)th term + [(n/2) + 1]th term]/2
Note: The above formulas can be applied only when the data is ordered. So, before calculating the median, the data should be ordered either in ascending or descending order.
Mode
Mode specifies the most repeated element in the given data. It specifies the value that occurs most often.
Mode = Value(s) that appear most often in the data
To find the mode in a grouped frequency distribution. This formula is especially helpful when data is organized into class intervals, and you're trying to determine the most frequent value (mode) within those intervals.
\text{Mode} = L + \left( \frac{f_m - f_1}{2f_m - f_1 - f_2} \right) \times h 
Range
The range is a simple measure of dispersion or spread in a dataset. It tells us how far apart the highest and lowest values are:
Range = H − L
Mid Range = (H + L) /2
Variance
Variance measures the variability of the given data from the mean. It is the expectation of the squared deviation of a random variable from its sample mean. Standard deviation is the square root of variance. The formula for calculating variance is given by,
Variance (σ2) = 
\frac{∑(x - \bar{x})^2}{n} 
- Where x is the observation given
- \bar{x} is the mean of the given data
- n represents the total count of observations.
Sample Variance
Sample variance estimates how much the sample data varies and is used to estimate the population variance.
s^2 = \frac{1}{n-1} \sum_{i=1}^{n} (x_i - \bar{x})^2 
Population Variance
Population variance, denoted as σ², measures how spread out the data points are in a population around the population mean
\sigma^2 = \frac{1}{N} \sum_{i=1}^{N} (x_i - \mu)^2 
Standard Deviation
Standard deviation measures the amount of variation/dispersion of a set of values. Dispersion tells how much data is spread out. A lower standard deviation indicates that the data is close to the center. The higher value of standard deviation represents that the data spread is more.
Standard Deviation (σ) = 
\sqrt{\frac{∑(x-\bar{x})^2}{n}} Standard Deviation = √{Variance}
Sample Standard Deviation
The sample standard deviation is the square root of the sample variance.
s = \sqrt{\frac{1}{n - 1} \sum_{i=1}^{n} (x_i - \bar{x})^2} 
Population Standard Deviation
The population standard deviation is the square root of the population variance.
\sigma = \sqrt{\frac{1}{N} \sum_{i=1}^{N} (x_i - \mu)^2} 
Coefficient of Variation
The Coefficient of Variation is a relative measure of dispersion that expresses the standard deviation as a percentage of the mean. It’s useful for comparing the degree of variation between datasets with different units or widely different means.
For Sample: 
CV = s / 
\bar{x} × 100
For Population: 
CV = σ / μ × 100
Mean Absolute Deviation (MAD)
The Mean Absolute Deviation (MAD) is a measure of the average distance between each data point and the mean of the dataset.
\text{MAD} = \frac{1}{n} \sum_{i=1}^{n} |x_i - \bar{x}| 
The Mean Absolute Deviation (MAD) formula can be applied to both sample data and population data, and the steps are similar for both.
For Sample:
\text{MAD}_{\text{sample}} = \frac{1}{n} \sum_{i=1}^{n} |x_i - \bar{x}| 
For Population:
\text{MAD}_{\text{population}} = \frac{1}{N} \sum_{i=1}^{N} |x_i - \mu| 
Average Deviation (AD)
The Average Deviation (AD), also known as the Mean Absolute Deviation (MAD) in some contexts, measures the average of the absolute differences between each data point and the mean of the dataset. It’s used to describe the spread or dispersion of data around the central point.
The only difference between sample and population Average Deviation is whether you use the sample mean or the population mean.
For Sample:
\text{AD}_{\text{sample}} = \frac{1}{n} \sum_{i=1}^{n} |x_i - \bar{x}| For Population:
\text{AD}_{\text{population}} = \frac{1}{N} \sum_{i=1}^{N} |x_i - \mu| 
Quartile
In statistics, quartiles are a type of quantiles which divide the number of data points into four parts, or quarters, of more-or-less equal size.
To find the position of a quartile in a dataset of size n, use the formula:
Q_k = \left( \frac{k(n + 1)}{4} \right)^{\text{th}} \text{ term} 
Qk is the kth quartile (e.g., k = 1, 2, 3)
Q_1 = \left( \frac{1(n + 1)}{4} \right)^{\text{th}} \text{ term} Q_3 = \left( \frac{3(n + 1)}{4} \right)^{\text{th}} \text{ term} 
Percentile
A percentile is a statistical measure that indicates the relative standing of a value within a dataset. It tells you the percentage of data points below a specific value.
To find the position of the kth percentile in an ordered dataset of size n, use:
P_k = \left( \frac{k(n + 1)}{100} \right)^{\text{th}} \text{ term} 
Decile
A decile is a statistical measure that divides a dataset into ten equal parts. Each decile represents 10% of the ordered data. Deciles are used to understand the distribution and dispersion of data more granularly than quartiles.
There are 9 deciles (D₁ to D₉).
D_k = \left( \frac{k(n + 1)}{10} \right)^{\text{th}} \text{ term} 
Octile
An octile divides a dataset into eight equal parts. It is similar to quartiles and deciles but provides even more detailed division. Each octile represents 12.5% of the data.
There are 7 octile boundaries: O1 through O7.
O_k = \left( \frac{k(n + 1)}{8} \right)^{\text{th}} \text{ term} 
Interquartile Range (IQR)
The Interquartile Range (IQR) is a measure of statistical dispersion that shows the range within which the middle 50% of the data lies. It is widely used to detect variability and outliers in a dataset.
IQR = Q3 - Q1
Quartile Deviation
The Quartile Deviation (also called the semi-interquartile range) is a measure of spread that focuses on the middle 50% of a dataset. It represents half of the interquartile range (IQR) and gives an idea of the variability around the median.
Quartile Deviation = Q3 - Q1 /2
Solved Question on Statistics
Question 1: Find the mean for the given data: 10, 20, 60, 40, 25, 35
Solution:
Given data,
10, 20, 60, 40, 25, 35
n = 6
Arithmetic mean (
= (10 + 20 + 60 + 40 + 25 + 35)/6
= 190/6
= 31.66
\bar{x} ) = ∑x/n
Mean for the given data is 31.66
Question 2: Find the median for the given data: 10, 20, 60, 40, 25, 35.
Solution:
Given data is not ordered. So in order to calculate median value the data should be ordered.
Here the given data is ordered in ascending order.
10, 20, 25, 35, 40, 60
n = 6
n is even, median formula is,
Median = [(n/2)th term + [(n/2) + 1]th term ]/2
= [(6/2)th term + [(6/2) + 1]th term]/2
= (3rd term + 4th term)/2
= (25 + 35)/2
= 30
Median for the given data is 30.
Question 3: Find the median for the given data: 10, 20, 60, 40, 25, 35, 50.
Solution:
Given data is not ordered. So in order to calculate median value the data should be ordered.
Here the given data is ordered in ascending order:
10, 20, 25, 35, 40, 50, 60
n = 7
n is odd, median formula is,
Median = [(n + 1)/2]th term
= [(7 + 1)/2]th term
= 4th term
= 35
Median for the given data is 35.
Question 4: Find the mode for the data 1, 2, 2, 2, 3, 3, 4.
Solution:
Here the most repeated value is 2 which occurred three times.
So the mode for the given data is 2.
Question 5: Find the variance for the data 1, 2, 5, 4, 8, 4.
Solution:
Given data: 1, 2, 5, 4, 8, 4
n = 6
Arithmetic mean (
= (1 + 2 + 5 + 4 + 8 + 4)/6
= 24/6
= 4
\bar{x} ) = ∑x/n\bar{x} = 4
Variance (σ2) = 
= [(1 - 4)2 + (2 - 4)2 + (5 - 4)2 + (4 - 4)2 + (8 - 4)2 + (4 - 4)2]/6
= (9 + 4 + 1 + 0 + 16 + 0)/6
= 30/6
= 5
\frac{∑(x-\bar{x})^2}{n} Variance for the given data is 5.
Question 6: Find the variance for the data 1, 2, 5, 4, 8.
Solution:
Given data, 1, 2, 5, 4, 8
n = 5
Arithmetic mean (
= (1 + 2 + 5 + 4 + 8)/5
= 20/5
= 4
\bar{x} ) = ∑x/n\bar{x} = 4
Standard Deviation (σ) =
\sqrt{\frac{∑(x-\bar{x})^2}{n}} = \sqrt{\frac{(1-4)^2+(2-4)^2+(5-4)^2+(4-4)^2+(8-4)^2}{5}} = \sqrt{\frac{9+4+1+0+16}{5}} = \sqrt{\frac{30}{5}} = √6
Standard deviation for the given data is 2.45
Question 7: Find Quartiles 7, 9, 12, 15, 18, 20, 22, 25, 30.
Solution:
Using Quartile Formula 
Q_k = \left( \frac{k(n + 1)}{4} \right)^{\text{th}} \text{ term} For Q1 position 
Q1 = 9 + 0.5 (12 − 9) = 9+1.5 = 10.5
For Q2 position 
Q2 = 5th value = 18
For Q2 position = 
Q3 = 22 + 0.5(25 − 22) = 22+1.5 = 23.5
= \left( \frac{1(n + 1)}{4} \right)^{\text{th}} = \left( \frac{1(9 + 1)}{4} \right)^{\text{th}} = \frac{10}{4} = 2.5th= \left( \frac{2(n + 1)}{4} \right)^{\text{th}} = \left( \frac{2(9 + 1)}{4} \right)^{\text{th}} = \frac{20}{4} = 5th= \left( \frac{3(n + 1)}{4} \right)^{\text{th}} = \left( \frac{3(9 + 1)}{4} \right)^{\text{th}} = \frac{30}{4} = 7.5th
Question 8 : Find Value at 30th Percentile (P30) Dataset: 4, 6, 7, 9, 10, 13, 15, 18, 20, 22 (n = 10).
Using Percentile Formula
P = 30
3rd = 7, 4th = 9
Interpolate:
P30 = 7 + 0.3(9 − 7) = 7 + 0.6 = 7.6
P_k = \left( \frac{k(n + 1)}{100} \right)^{\text{th}} \text{ term} P_k = \left( \frac{30(10 + 1)}{100} \right)^{\text{th}}= \left( \frac{330}{100} \right)^{\text{th}} = 3.3rdvalue
