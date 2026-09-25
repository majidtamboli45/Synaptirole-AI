# Practice Questions on Statistics

> Source: https://www.geeksforgeeks.org/maths/practice-questions-on-statistics-advanced

Statistics is the branch of mathematics that deals with collecting, organizing, analyzing, and interpreting data. It helps us understand information, identify patterns, and make better decisions based on facts and numerical evidence.
Question 1: Find the variance and standard deviation of the following dataset: 6, 8, 10, 12, 14
Solution:
Calculate the mean:
Mean 
(\bar{x}) = \frac{\sum x_i}{N} = \frac{6 + 8 + 10 + 12 + 14}{5} = 10 Compute squared deviations:
(x_i - \bar{x})^2 = (6-10)^2, (8-10)^2, (10-10)^2, (12-10)^2, (14-10)^2 = 16, 4, 0, 4, 16 Variance =
\frac{\sum(x_i - \bar{x})^2}{N} = 16+4+0+4+16 / 5 =8
Standard Deviation = 
\sqrt{\text{Variance}} = \sqrt{8} = 2.83 Variance = 8, Standard Deviation = 2.83
Question 2: Find the variance and standard deviation for the following grouped data:
| Class Interval | Frequency | 
|---|---|
| 10–20 | 5 | 
| 20–30 | 7 | 
| 30–40 | 8 | 
| 40–50 | 10 | 
| 50–60 | 5 | 
Solution:
Compute midpoints (xi): xi=15, 25, 35, 45, 55
Compute mean
(\bar{x}) = \frac{\sum f_i x_i}{\sum f_i} = \frac{5(15) + 7(25) + 8(35) + 10(45) + 5(55)}{35} = \frac{1275}{35} = 36.43 Compute 
(x_i - \bar{x})^2 andf_i (x_i - \bar{x})^2 :
xi fi x_i - \bar{x} (x_i - \bar{x})^2 f_i (x_i - \bar{x})^2 15 5 -21.43 459.26 2296.3 25 7 -11.43 130.67 914.69 35 8 -1.43 2.04 16.33 45 10 8.57 73.45 734.5 55 5 18.57 344.79 1723.95 \sum f_i (x_i - \bar{x})^2 = 5685.77 
- Variance:
Variance =\frac{\sum f_i (x_i - \bar{x})^2}{\sum f_i} = \frac{5685.77}{35} = 162. 
- Standard Deviation:
SD =\sqrt{\text{Variance}} = \sqrt{162.45} = 12.74 
Question 3: The mean of a dataset is 50 and its standard deviation is 5. Calculate the coefficient of variation.
Solution:
Coefficient of Variation (CV) = 
\frac{\text{SD}}{\text{Mean}} \times 100 = \frac{5}{50} \times 100 = 10\% 
Question 4 : Find the combined standard deviation of two groups of students which have the following data:
- Group A: n_1 = 5, \bar{x}_1 = 10, \text{SD}_1 = 2
- Group B: n_2 = 10, \bar{x}_2 = 15, \text{SD}_2 = 3
Solution:
Combined mean: 
\bar{x}_c = \frac{n_1 \bar{x}_1 + n_2 \bar{x}_2}{n_1 + n_2} = \frac{5(10) + 10(15)}{15} = \frac{200}{15} = 13.33 Combined variance: 
\sigma_c^2 = \frac{n_1(\sigma_1^2 + (\bar{x}_1 - \bar{x}_c)^2) + n_2(\sigma_2^2 + (\bar{x}_2 - \bar{x}_c)^2)}{n_1 + n_2} \sigma_c^2 = \frac{5(2^2 + (10 - 13.33)^2) + 10(3^2 + (15 - 13.33)^2)}{15} \sigma_c^2 = \frac{5(4 + 11.11) + 10(9 + 2.78)}{15} = \frac{109.45}{15} = 7.3 Combined standard deviation: 
\sigma_c = \sqrt{\sigma_c^2} = \sqrt{7.3} = 2.7 
Question 5: Find the quartile deviation for the dataset: 5, 7, 8, 10, 12, 15, 18
Solution:
Arrange data in ascending order
Q_1 = \frac{\text{(n+1)} \cdot 1}{4} \text{th value} = \frac{8}{4} = 2\text{nd value} = 7 Q_3 = \frac{\text{(n+1)} \cdot 3}{4} \text{th value} = \frac{24}{4} = 6\text{th value} = 15 Quartile Deviation:
QD= (Q3−Q1)/2 = (15−7)/2 = 4
Question 6: Find the mean deviation about the mean for the dataset: 3, 6, 9, 12, 15.
Solution:
Mean: 
\bar{x} = \frac{\sum x_i}{N} = \frac{3 + 6 + 9 + 12 + 15}{5} = 9 Deviations: 
|x_i - \bar{x}| = |3 - 9|, |6 - 9|, |9 - 9|, |12 - 9|, |15 - 9| = 6, 3, 0, 3, 6 Mean Deviation: 
\text{MD} = \frac{\sum |x_i - \bar{x}|}{N} = \frac{6 + 3 + 0 + 3 + 6}{5} = 3.6 
Question 7: Find the variance for the sample: 5, 7, 9, 11, 13
Solution:
Mean: 
\bar{x} = \frac{5 + 7 + 9 + 11 + 13}{5} = 9 Variance:  
= \frac{\sum (x_i - \bar{x})^2}{n - 1} = \frac{(5-9)^2 + (7-9)^2 + (9-9)^2 + (11-9)^2 + (13-9)^2}{5-1} = \frac{16 + 4 + 0 + 4 + 16}{4} = 10 
Question 8: Find the Z-score for x = 80 if the dataset has a mean of 50 and a standard deviation of 15.
Solution:
Given,
x = 80
mean
Standard deviation 
\mu = 50\sigma = 15
Z = 
\frac{x - \mu}{\sigma} = \frac{80 - 50}{15} = \frac{30}{15} = 2 
Question 9 : Find the range and interquartile range (IQR) for the following dataset: 8, 12, 16, 20, 24, 28, 32, 36
Solution:
Range = 
\text{Max} - \text{Min} = 36 - 8 = 28 Quartiles:
Q1 = 
Q3 =
\text{Median of first half} = \text{Median of } [8, 12, 16, 20] = 14 \text{Median of second half} = \text{Median of } [24, 28, 32, 36] = 30 IQR = Q3 - Q1 = 30 - 14 = 16
Question 10: Find the percentile rank of x=18 in the dataset: 10, 12, 15, 18, 20, 25
Solution:
P = 
\frac{\text{Number of values below } x}{\text{Total number of values}} \times 100 = \frac{3}{6} \times 100 = 50 
Unsolved Questions
Question 1: A dataset contains the following values: 4, 7, 9, 10, 12, 14, 15, 18, 20, 25. Find the variance, standard deviation, and coefficient of variation.
Question 2: Calculate the Pearson correlation coefficient and interpret the result. the following paired data:
X = [1, 2, 3, 4, 5], Y = [2, 4, 6, 8, 10]
Question 3: Find the combined standard deviation for two groups of students with the following details:
- Group A: n1 = 8, \bar{x}_1 = 20, \sigma_1 = 5
- Group B: n2 = 12, \bar{x}_2 = 25, \sigma_2 = 7
Question 4: Calculate the quartile deviation for the following dataset: 5, 8, 12, 15, 18, 22, 25, 28, 30, 35.
Question 5: Find the mean deviation about the mean for the dataset: 10, 12, 14, 16, 18, 20, 22, 24.
Question 6: In a sample of size 7 with values 6, 8, 10, 12, 14, 16, 18 calculate the Z-score for x = 16.
Question 7: For a grouped dataset with the following details, find the coefficient of variation:
| Class Interval | Frequency (fi) | 
|---|---|
| 0–5 | 3 | 
| 5–10 | 5 | 
| 10–15 | 4 | 
| 15–20 | 6 | 
| 20–25 | 2 | 
Question 8: A dataset has a mean of 505050 and a standard deviation of 101010.
- Calculate the coefficient of variation.
- Find the Z-scores for x = 40 and x = 70.
Question 9 : For a dataset 3, 6, 9, 12, 15, 18, 21:
- Compute the variance.
- Compute the standard deviation.
- Calculate the mean deviation about the mean.
