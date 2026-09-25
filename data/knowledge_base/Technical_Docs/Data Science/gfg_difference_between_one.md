# Difference Between One

> Source: https://www.geeksforgeeks.org/data-science/difference-between-one-tailed-and-two-tailed-tests/

One and Two-Tailed Tests are ways to identify the relationship between the statistical variables. For checking the relationship between variables in a single direction (Left or Right direction), we use a one-tailed test. A two-tailed test is used to check whether the relations between variables are in any direction or not.
One-Tailed Test
A one-tailed test is based on a uni-directional hypothesis where the area of rejection is on only one side of the sampling distribution. It determines whether a particular population parameter is larger or smaller than the predefined parameter. It uses one single critical value to test the data.
Null Hypothesis (H0): where 
Alternative Hypothesis (H1):
- For a right-tailed test: H_1: \theta > \theta_0
- For a left-tailed test: H_1: \theta < \theta_0
Test Statistic: Depending on the type of test and the distribution, the test statistic is computed (Z-score for normal distribution).
Decision Rule: If the test statistic falls in the critical region, reject the null hypothesis in favor of the alternative hypothesis.
Example: Effect of participants of students in coding competition on their fear level.
- H0: There is no important effect of students in coding competition on their fear level.
The main intention is to check the decreased fear level when students participate in a coding competition.
Two-Tailed Test
A two-tailed test is also called a nondirectional hypothesis. For checking whether the sample is greater or less than a range of values, we use the two-tailed. It is used for null hypothesis testing.
Null Hypothesis (H0): where 
Alternative Hypothesis (H1): 
Test Statistic: Compute the test statistic as appropriate for the distribution (Z-score for normal distribution).
Decision Rule: If the test statistic falls in either tail of the distribution's critical region, reject the null hypothesis in favor of the alternative hypothesis.
Example: Effect of new bill pass on the loan of farmers.
- H0: There is no significant effect of the new bill passed on loans of farmers.
New bill passes can affect in both ways either increase or decrease the loan of farmers.
Difference Between One and Two-Tailed Test:
| One-Tailed Test | Two-Tailed Test | 
| A test of any statistical hypothesis, where the alternative hypothesis is one-tailed either right-tailed or left-tailed. | A test of a statistical hypothesis, where the alternative hypothesis is two-tailed. | 
| For one-tailed, we use either > or < sign for the alternative hypothesis. | For two-tailed, we use ≠ sign for the alternative hypothesis. | 
| When the alternative hypothesis specifies a direction then we use a one-tailed test. | If no direction is given then we will use a two-tailed test. | 
| Critical region lies entirely on either the right side or left side of the sampling distribution. | Critical region is given by the portion of the area lying in both the tails of the probability curve of the test statistic. | 
| Here, the Entire level of significance (α) i.e. 5% has either in the left tail or right tail. | It splits the level of significance (α) into half. | 
| Rejection region is either from the left side or right side of the sampling distribution. | Rejection region is from both sides i.e. left and right of the sampling distribution. | 
| It checks the relation between the variable in a singles direction. | It checks the relation between the variables in any direction. | 
| It is used to check whether the one mean is different from another mean or not. | It is used to check whether the two mean different from one another or not. |
