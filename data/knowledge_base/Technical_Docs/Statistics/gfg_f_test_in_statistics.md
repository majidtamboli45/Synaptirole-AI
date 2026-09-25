# F-Test in Statistics

> Source: https://www.geeksforgeeks.org/data-science/f-test

The F-test is a statistical hypothesis testing used to compare the variances of two independent samples. It helps determine whether the variability in two populations is significantly different. The F-test is widely used in hypothesis testing, ANOVA (Analysis of Variance) and statistical model comparison in data science and analytics.
To properly understand the F-test, it is important to first understand the F-distribution, since the test statistic follows this distribution.
F-distribution
The F-distribution is a continuous probability distribution that arises as the ratio of two independent chi-square distributed random variables divided by their respective degrees of freedom.
It is defined by two parameters:
- df1: degrees of freedom of the numerator
- df2: degrees of freedom of the denominator
Formula:
F = \frac{(X_1 / df_1)}{(X_2 / df_2)} 
where:
- X1 and X2 follow chi-square distributions
- df1 and df2 are their respective degrees of freedom
The F-statistic is always greater than or equal to 0 because it is a ratio of variances, and variance cannot be negative.
How the F-Test Works
The F-test compares two variances by forming their ratio. Depending on the research question, the test can be:
- Left-tailed
- Right-tailed
- Two-tailed
The F-test is applicable when:
- The populations are normally distributed
- Samples are random and independent
Hypothesis Testing Framework for F-test
For various hypothesis tests the F test formula is provided as follows:
1. Left Tailed Test
- Null Hypothesis: H_0 : \sigma_{1}^2 = \sigma_{2}^2
- Alternate Hypothesis: H_1:\sigma_{1}^2 < \sigma_{2}^2
- Decision-Making Standard: Reject H_0  if the F statistic is less than the critical value.
2. Right Tailed Test
- Null Hypothesis: H_0:\sigma_{1}^2 = \sigma_{2}^2
- Alternate Hypothesis: H_1: \sigma_{1}^2 > \sigma_{2}^2
- Decision-Making Standard: Reject H0 if the F statistic is greater than the critical value.
3. Two Tailed Test
- Null Hypothesis: H_0 : \sigma_{1}^2 = \sigma_{2}^2
- Alternate Hypothesis: H_1: \sigma_{1}^2 \neq \sigma_{2}^2
- Decision-Making Standard: Reject H0 if the F statistic falls in the rejection region.
F Test Statistics
The F test statistic or simply the F statistic is a value that is compared with the critical value to check if the null hypothesis should be rejected or not. The F test statistic formula is given below:
For large samples: 
F_{calc}=\frac{\sigma_{1}^{2}}{\sigma_{2}^{2}} For small samples: 
F_{calc}=\frac{s_{1}^{2}}{s_{2}^{2}} 
where:
- \sigma_{1}^{2} is the variance of the first population and\sigma_{2}^{2} is the variance of the second population.
- s_{1}^{2} is the variance of the first sample ands_{2}^{2} is the variance of the second sample.
Steps to Perform an F-Test
- Compute variances of both samples
- Define null and alternative hypotheses
- Calculate the F statistic
- Determine degrees of freedom
- Find the critical F value using significance level α
- Compare F statistic with critical value
Decision Rule
- If F_{calc} < F_{table} : Do not reject H0
- If F_{calc} > F_{table} : Reject H0
Example
Consider the following example In this we conduct a two-tailed F-Test on the following samples:
| Statistic | Sample 1 | Sample 2 | 
|---|---|---|
| Standard Deviation | 10.47 | 8.12 | 
| Sample Size | 41 | 21 | 
Step 1: Hypotheses
- H_0: \sigma_1^2 = \sigma_2^2
- H_1: \sigma_1^2 \neq \sigma_2^2
Step 2: Compute Variances
- s_1^2 = (10.47)^2 = 109.63
- s_2^2 = (8.12)^2 = 65.99
Step 3: Degrees of Freedom
- df_1 = 41 - 1 = 40
- df_2 = 21 - 1 = 20
Step 4: Critical Value
- Two-tailed test with α = 0.05:
- \alpha/2 = 0.025
- From the F-table: F_{table} = 2.287
Step 5: Decision
- 1.66 < 2.287
- Do not reject the null hypothesis. The variances of the two populations are statistically similar.
Python Implementation of F-Test
- Two samples are generated assuming normal distributions.
- Sample variances are computed using unbiased estimation (ddof=1).
- The F-statistic is calculated as the ratio of variances.
- Degrees of freedom are derived from sample sizes.
- The p-value is obtained using the F-distribution.
- Results are printed in a readable format.
import numpy as np
from scipy.stats import f
sample1 = np.random.normal(0, 10.47, 41)
sample2 = np.random.normal(0, 8.12, 21)
var1 = np.var(sample1, ddof=1)
var2 = np.var(sample2, ddof=1)
f_stat = var1 / var2
df1 = len(sample1) - 1
df2 = len(sample2) - 1
p_value = 2 * min(f.cdf(f_stat, df1, df2), 1 - f.cdf(f_stat, df1, df2))
print(f"F-statistic: {f_stat:.4f}")
print(f"P-value: {p_value:.4f}")
Output:
F-statistic: 1.2978 
P-value: 0.2697
Interpretation: Since the p-value > 0.05, we fail to reject the null hypothesis, indicating that the variances are statistically similar.
