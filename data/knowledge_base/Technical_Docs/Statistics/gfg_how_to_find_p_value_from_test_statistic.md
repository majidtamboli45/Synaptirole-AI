# How to Find p Value from Test Statistic

> Source: https://www.geeksforgeeks.org/maths/how-to-find-p-value-from-test-statistic

P-value (Probability Value) is the probability of obtaining the observed result, or a more extreme result, assuming that the null hypothesis (H0) is true.
- It helps determine whether the observed result is statistically significant.
- A smaller p-value provides stronger evidence against the null hypothesis.
The following formula helps calculate the p-value in statistical hypothesis testing:
Test Statistic
A test statistic measures how closely our data matches the distribution predicted by the null hypothesis of the statistical test you’re using.
Steps to Find p-value from Test Statistic
Step 1: State the Hypotheses
First, define the null hypothesis (H₀) and the alternative hypothesis (H₁) based on the problem.
Example:
- H₀: μ = 10 (The population mean is 10.)
- H₁: μ ≠ 10 (The population mean is not 10.)
Where,
- H₀ = Null hypothesis
- H₁ = Alternative hypothesis
- μ = Population mean
Step 2: Calculate the Test Statistic
Use the sample data to calculate the test statistic (t) using the following formula:
t = (x̄ − μ) / (s / √n)
Where,
- t = Test statistic
- x̄ = Sample mean
- μ = Population mean under the null hypothesis
- s = Sample standard deviation
- n = Sample size
Step 3: Find the P-value
After calculating the t-value, use a t-distribution table or statistical software to find the p-value.
- Calculate the degrees of freedom (df = n − 1).
- Find the corresponding p-value using the calculated t-value and df.
- For a one-tailed test, use the p-value directly.
- For a two-tailed test, multiply the one-tailed p-value by 2.
Step 4: Make the Decision
Compare the p-value with the significance level (α), which is usually 0.05.
- If p-value ≤ 0.05, reject the null hypothesis (H₀).
- If p-value > 0.05, fail to reject the null hypothesis (H₀).
This decision helps determine whether the result is statistically significant.
P-value Table
The table below summarizes the interpretation of p-values in hypothesis testing.
| P-value | Description | Decision / Interpretation | 
|---|---|---|
| P-value < 0.05 | Strong evidence against the null hypothesis. | Reject the null hypothesis (H₀). | 
| P-value = 0.05 | The result is at the significance level. | Decision depends on the chosen significance level (α). | 
| P-value > 0.05 | Weak evidence against the null hypothesis. | Fail to reject the null hypothesis (H₀). | 
| P-value is close to 0.05 | The result is considered marginal. | More data or further analysis may be required. | 
Practical Applications of p-value
- Hypothesis Testing: Helps determine whether the observed results are statistically significant and whether to reject the null hypothesis.
- Medical Research: Used to evaluate the effectiveness of new medicines, treatments, and clinical trials.
- Engineering: Helps test the reliability of systems, evaluate new designs, and validate experimental results.
- Business and Marketing: Used to compare strategies, analyze customer behavior, and make data-driven decisions.
- Quality Control: Helps monitor product quality, identify defects, and improve manufacturing processes.
Example 1: A researcher wants to test whether the population mean is greater than 80. The hypotheses are:
H₀: μ = 80
 H₁: μ > 80
The significance level is α = 0.05. A random sample of 36 observations is selected from a population with a known standard deviation of 18. The sample mean is found to be 86.
Using the p-value approach, determine whether the null hypothesis should be rejected or not rejected.
Solution:
Given,
- n = 36
- σ = 18
- x̄ = 86
- μ = 80
Step 1: Calculate the Standard Error
Standard Error = σ / √n
= 18 / √36
= 18 / 6
= 3
Step 2: Calculate the Test Statistic (Z)
Z = (x̄ − μ) / (σ / √n)
= (86 − 80) / 3
= 6 / 3
= 2.00
Step 3: Find the P-value
From the Z-table, P(Z > 2.00) = 0.0228
So, P-value = 0.0228
Step 4: Compare with the Significance Level
P-value = 0.0228
α = 0.05
Since 0.0228 < 0.05, we reject the null hypothesis (H₀).
Example 2: A statistical test gives a p-value of 0.12. If the significance level is 5% (α = 0.05), determine whether the null hypothesis should be rejected.
Solution:
Given,
- P-value = 0.12
- α = 0.05
Compare the p-value with the significance level.
Since 0.12 > 0.05, we fail to reject the null hypothesis (H₀).
Conclusion: There is not enough evidence to reject the null hypothesis. Therefore, the null hypothesis is accepted (or more precisely, failed to reject).
