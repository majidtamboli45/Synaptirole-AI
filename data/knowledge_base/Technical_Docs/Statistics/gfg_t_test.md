# T-test

> Source: https://www.geeksforgeeks.org/data-science/t-test

The t-test is used to compare the averages of two groups to see if they are significantly different from each other. Suppose you want to compare the test scores of two groups of students:
- Group 1: 30 students who studied with Method A.
- Group 2: 30 students who studied with Method B.
We use a t-test to check if there is a significant difference in the average test scores between the two.
In a t-test, we start by assuming that both groups have the same average (this is called the null hypothesis). Then, we use the test to check if the difference we see is real or just due to chance. If it is not due to chance, we conclude that the groups are actually different.
Assumptions in T-test
- Independence: The observations within each group must be independent of each other means that the value of one observation should not influence the value of another observation.
- Normality: The data within each group should be approximately normally distributed i.e., the data within each group being compared should resemble a normal bell-shaped distribution.
- Homogeneity of Variances: The variances of the two groups being compared should be equal. This assumption ensures that the groups have a similar spread of values.
- Absence of Outliers: There should be no outliers in the data as outliers can influence the results especially when sample sizes are small.
Types of T-tests
There are three types of t-tests and they are categorized as dependent and independent t-tests.
1. One sample T-test
One sample t-test is used for comparison of the sample mean of the data to a particularly given value. We can use this when the population standard deviation is unknown and the data is approximately normally distributed. It can be calculated as:.
Example: The weights of 25 obese people were taken before enrolling them into the nutrition camp. The population mean weight is found to be 45 kg before starting the camp. After finishing the camp for the same 25 people the sample mean was found to be 75 with a standard deviation of 25. Did the fitness camp work?
Python Implementation
Before its implementation we should have some basic knowledge about numpy and scipy.
import scipy.stats as stats
import numpy as np
popu_mean = 45
s_mean = 75
s_std = 25
s_size = 25
t_stat = (s_mean - popu_mean) / (s_std / np.sqrt(s_size))
df = s_size - 1
alpha = 0.05
cr_t = stats.t.ppf(1 - alpha, df)
p_v = 1 - stats.t.cdf(t_stat, df)
print("T-Statistic:", t_stat)
print("Critical t-value:", cr_t)
print("P-Value:", p_v)
print('With T-value :')
if t_stat > cr_t:
    print("Significant difference. Camp had effect.")
else:
    print("No significant difference. Camp had no effect.")
print('With P-value :')
if p_v < alpha:
    print("Significant difference. Camp had effect.")
else:
    print("No significant difference. Camp had no effect.")
Output:
T-Statistic: 6.0
Critical t-value: 1.7108820799094275
P-Value: 1.703654035845048e-06
With T-value :
Significant difference. Camp had effect.
With P-value :
No significant difference. Camp had no effect.
Interpretation
- T-value (6.0) is much greater than the critical t-value (1.71), so we reject the null hypothesis.
- The P-value (0.0000017) is much smaller than 0.05, also indicating a significant result.
The fitness camp had a significant effect on participants weights, causing a measurable change.
2. Independent sample T-test
An Independent sample t-test commonly known as an unpaired sample t-test is used to find out if the differences found between two groups is actually significant or just a random occurrence. We can use this when:
- the population mean or standard deviation is unknown. (information about the population is unknown)
- the two samples are separate/independent. For i.e. boys and girls (the two are independent of each other)
It can be calculated using:
Let's Take a example to understand
Researchers want to see if two teaching methods, A and B, produce different exam scores. Samples for both methods are collected independently.
Sample A (Teaching Method A): 78,84,92,88,75,80,85,90,87,79,78,84,92,88,75,80,85,90,87,79
Sample B (Teaching Method B): 82,88,75,90,78,85,88,77,92,80,82,88,75,90,78,85,88,77,92,80
Python Implementation
from scipy import stats
import numpy as np
A = np.array([78,84,92,88,75,80,85,90,87,79,78,84,92,88,75,80,85,90,87,79])
B = np.array([82,88,75,90,78,85,88,77,92,80,82,88,75,90,78,85,88,77,92,80])
t_val, p_val = stats.ttest_ind(A, B)
alpha = 0.05
df = len(A)+len(B)-2
crit_t = stats.t.ppf(1 - alpha/2, df)
print("T-value:", t_val)
print("P-Value:", p_val)
print("Critical t-value:", crit_t)
print('T-test Result:')
if np.abs(t_val) >crit_t:
    print('Significant difference found.')
else:
    print('No significant difference.')
print('P-test Result:')
if p_val < alpha:
    print('Fail to reject H0. No strong evidence of difference.')
else:
    print('Reject H0. Significant difference found.')
Output:
T-value: -0.008275847896130646
P-Value: 0.9934425963209128
Critical t-value: 2.0280940009804502
T-test Result:
No significant difference.
P-test Result:
Fail to reject H0. No strong evidence of difference.
Interpretation
- T-value (0.989) is less than the critical t-value (2.1009), so we fail to reject the null hypothesis.
- P-value (0.336) is greater than 0.05, meaning no significant difference.
There is no statistically significant difference between exam scores of Teaching Method A and Teaching Method B.
3. Paired Two-sample T-test
Paired sample t-test also known as dependent sample t-test is used to find out if the difference in the mean of two samples is 0. The test is done on dependent samples usually focusing on a particular group of people or things. In this each entity is measured twice resulting in a pair of observations.
We can use this when:
- Two similar samples are given. [i.e. Scores obtained in English and Math (both subjects)]
- The dependent variable data is continuous.
- The observations are independent of one another.
- The dependent variable is approximately normally distributed.
It can be calculated using
Example Problem
Consider the following example. Scores (out of 25) of the subjects Math1 and Math2 are taken for a sample of 10 students. We have to perform the paired sample t-test for this data.
Math1: 4, 4, 7, 16, 20, 11, 13, 9, 11, 15
Math2: 15, 16, 14, 14, 22, 22, 23, 18, 18, 19
Python Implementation
from scipy import stats
import numpy as np
A = np.array([4, 4, 7, 16, 20, 11, 13, 9, 11, 15])
B = np.array([15, 16, 14, 14, 22, 22, 23, 18, 18, 19])
t_val, p_val = stats.ttest_rel(A, B)
alpha = 0.05
df = len(A)-1
c_t = stats.t.ppf(1 - alpha/2, df)
print("T-value:", t_val)
print("P-Value:", p_val)
print("Critical t-value:", c_t)
print('T-test:')
if np.abs(t_val) >c_t:
    print('Significant difference found.')
else:
    print('No significant difference.')
print('P-test:')
if p_val < alpha:
    print('Reject H0')
else:
    print('Fail to reject H0')
Output:
T-value: -4.953488372093023
P-Value: 0.0007875235561560145
Critical t-value: 2.2621571628540993
T-test:
Significant difference found.
P-test:
Fail to reject H0
Interpretation
- T-value is very close to 0 and much less than the critical t-value, so we fail to reject the null hypothesis.
- The P-value is much greater than 0.05, indicating no significant difference.
There is a significant difference between Math1 and Math2 scores. The difference is unlikely due to chance.
