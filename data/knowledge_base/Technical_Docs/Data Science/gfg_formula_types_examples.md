# Formula, Types, Examples

> Source: https://www.geeksforgeeks.org/data-science/z-test/

A Z-test is a type of hypothesis test that compares the sample’s average to the population’s average and calculates the Z-score and tells us how much the sample average is different from the population average by looking at how much the data normally varies.
It is particularly useful when the sample size is large >30. It is also known as Z-Statistics and its formula is:
\text{Z-Score} = \frac{\bar{x} - \mu}{\sigma / \sqrt{n}} 
where:
- \bar{x} : mean of the sample.
- \mu : mean of the population.
- \sigma : Standard deviation of the population.
- n : Sample size
Let's understand with the help of example The average family annual income in India is 200k with a standard deviation of 5k and the average family annual income in Delhi is 300k. Then Z-Score for Delhi will be.
\begin{aligned}\text{Z-Score} &= \frac{\bar{x}-\mu}{\sigma / \sqrt{n}} \\&= \frac{300-200}{5 / \sqrt{n}} \\&= \frac{100}{5 / \sqrt{n}} \\&= 20\sqrt{n}\end{aligned} 
This indicates that the average family's annual income in Delhi is 20 standard deviations above the mean of the population (India).
For a z-test to provide reliable results these assumptions must be met:
- Normal Distribution: The population from which the sample is drawn should be approximately normally distributed.
- Equal Variance: The samples being compared should have the same variance.
- Independence: All data points should be independent of one another.
Steps to perform Z-test
1. First we identify the null and alternate hypotheses.
2. Then we determine the level of significance (
3. Next we find the critical value of Z in the z-test.
4. Then we calculate the z-test statistics using the formula :
Z=\frac{(\overline{x}- \mu)}{\left ( \sigma /\sqrt{n} \right )} 
Where:
- \bar{x} : mean of the sample.
- \mu : mean of the population.
- \sigma : Standard deviation of the population.
- n : sample size.
5. Now we compare with the hypothesis and decide whether to reject or not reject the null hypothesis.
Type of Z-test
There are mainly two types of Z-tests. Let's understand them one by one:
1. One Sample Z test
A one-sample Z-test is used to determine if the mean of a single sample is significantly different from a known population mean. Use it when:
- The population standard deviation is known.
- The sample size is large (usually n>30).
- The data is approximately normally distributed.
Suppose a company claims that their new smartphone has an average battery life of 12 hours. A consumer group tests 100 phones and finds an average battery life of 11.8 hours with a known population standard deviation of 0.5 hours.
Step 1: Hypotheses
- H_0 : \mu = 12 :
- H_1 : \mu\neq 12
Step 2: Calculate the Z-Score
We can calculate Z-score using the formula:
z = \frac{x - \mu}{\frac{\sigma}{\sqrt{n}}} 
Where: 
After putting the value we get:
z = \frac{11.8- 12}{\frac{0.5}{\sqrt{100}}} = -4 
Step 3: Decision
Since 
Now let's implement this in Python using the Statsmodels and Numpy Library:
import numpy as np
from statsmodels.stats.weightstats import ztest
data = np.random.normal(loc=11.8, scale=0.5, size=100)
population_mean = 12
population_std_dev = 0.5
z_statistic, p_value = ztest(data, value=population_mean)
print(f"Z-Statistic: {z_statistic:.4f}")
print(f"P-Value: {p_value:.4f}")
alpha = 0.05
if p_value < alpha:
    print("Reject the null hypothesis: The average battery life is different from 12 hours.")
else:
    print("Fail to reject the null hypothesis: The average battery life is not significantly different from 12 hours.")
Output:
Z-Statistic: -560128131373970.2500 
P-Value: 0.0000 
Reject the null hypothesis: The average battery life is different from 12 hour
2. Two-sampled z-test
In this test we have provided 2 normally distributed and independent populations and we have drawn samples at random from both populations. Here we consider 
- H_{0} : \mu_{1} -\mu_{2} = 0 and alternative hypothesis
- H_{1} : \mu_{1} - \mu_{2} \ne 0
and the formula for calculating the z-test score:
Z = \frac{\left ( \overline{X_{1}} - \overline{X_{2}} \right ) - \left ( \mu_{1} - \mu_{2} \right )}{\sqrt{\frac{\sigma_{1}^2}{n_{1}} + \frac{\sigma_{2}^2}{n_{2}}}} 
where 
Example: There are two groups of students preparing for a competition: Group A and Group B. Group A has studied offline classes, while Group B has studied online classes. After the examination the score of each student comes. Now we want to determine whether the online or offline classes are better.
- Group A: Sample size n1 = 50, Sample mean \bar{x}_1 = 75 , Population standard deviation\sigma_1 = 10
- Group B: Sample size n2 = 60, Sample mean  \bar{x}_2 = 80 , Population standard deviation\sigma_2 = 12
Assuming a 5% significance level perform a two-sample z-test to determine if there is a significant difference between the online and offline classes.
Solution:
Step 1: Null & Alternate Hypothesis
- Null Hypothesis: There is no significant difference between the mean score between the online and offline classes\mu_1 -\mu_2 = 0
- Alternate Hypothesis: There is a significant difference in the mean scores between the online and offline classes.\mu_1 -\mu_2 \neq 0
Step 2: Significance Level
- Significance Level: 5% \alpha = 0.05
Step 3: Z-Score
Step 4: Check to Critical Z-Score value in the Z-Table for alpha/2 = 0.025
- Critical Z-Score = 1.96
Step 5: Compare with the absolute Z-Score value
- absolute(Z-Score) > Critical Z-Score
- So we reject the null hypothesis and there is a significant difference between the online and offline classes.
Now we will implement the two sampled z-test using numpy and scipy.
import numpy as np
import scipy.stats as stats
n1 = 50
x1 = 75
sigma1 = 10
n2 = 60
x2 = 80
sigma2 = 12
D = 0
alpha = 0.05
z_score = ((x1 - x2) - D) / np.sqrt((sigma1**2 / n1) + (sigma2**2 / n2))
print("Z-Score:", np.abs(z_score))
z_critical = stats.norm.ppf(1 - alpha/2)
print("Critical Z-Score:", z_critical)
if np.abs(z_score) > z_critical:
    print("Reject the null hypothesis.")
else:
    print("Fail to reject the null hypothesis.")
Output:
Z-Score: 2.3836564731139807
Critical Z-Score: 1.959963984540054
Reject the null hypothesis.
So, There is a significant difference between the online and offline classes.
The Z-Table
Solved examples
Problem 1: A company claims that the average battery life of their new smartphone is 12 hours. A consumer group tests 100 phones and finds the average battery life to be 11.8 hours with a population standard deviation of 0.5 hours. At a 5% significance level, is there evidence to refute the company's claim?
Solution:
Step 1: State the hypotheses
H_0: \mu = 12 \quad (\text{null hypothesis}) \\H_1: \mu \neq 12 \quad (\text{alternative hypothesis}) Step 2: Calculate the Z-score
Z = \frac{\bar{x} - \mu}{\frac{\sigma}{\sqrt{n}}} \\= \frac{11.8 - 12}{\frac{0.5}{\sqrt{100}}} \\= \frac{-0.2}{0.05} \\= -4 Step 3: Find the critical value (two-tailed test at 5% significance)
Z_{0.025} = \pm 1.96 Step 4: Compare Z-score with critical value
|-4| > 1.96, so we reject the null hypothesis.
Conclusion: There is sufficient evidence to refute the company's claim about battery life.
Problem 2: A researcher wants to compare the effectiveness of two different medications for reducing blood pressure. Medication A is tested on 50 patients, resulting in a mean reduction of 15 mmHg with a standard deviation of 3 mmHg. Medication B is tested on 60 patients, resulting in a mean reduction of 13 mmHg with a standard deviation of 4 mmHg. At a 1% significance level, is there a significant difference between the two medications?
Solution:
Step 1: State the hypotheses
H_0: \mu_1 - \mu_2 = 0 \quad (\text{null hypothesis}) \\H_1: \mu_1 - \mu_2 \neq 0 \quad (\text{alternative hypothesis}) Step 2: Calculate the Z-score
Z = \frac{\bar{x}_1 - \bar{x}_2}{\sqrt{\frac{\sigma_1^2}{n_1} + \frac{\sigma_2^2}{n_2}}} \\= \frac{15 - 13}{\sqrt{\frac{3^2}{50} + \frac{4^2}{60}}} \\= \frac{2}{\sqrt{0.18 + 0.2667}} \\= \frac{2}{0.6455} \\= 3.10 Step 3: Find the critical value (two-tailed test at 1% significance)
Z_{0.005} = \pm 2.576 Step 4: Compare Z-score with critical value
3.10 > 2.576, so we reject the null hypothesis.
