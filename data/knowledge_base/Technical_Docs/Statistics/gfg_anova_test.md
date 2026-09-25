# Anova Test

> Source: https://www.geeksforgeeks.org/maths/anova-formula

ANOVA (Analysis of Variance) is a statistical technique used to determine whether there is a significant difference between the means of three or more groups. It tests the null hypothesis that all group means are equal.
ANOVA works by comparing:
- Between-group variation – differences among the group means.
- Within-group variation – natural differences among observations within the same group.
Using the F-statistic, ANOVA evaluates whether the variation between groups is larger than the variation within groups. If it is, ANOVA indicates that at least one group mean is significantly different; otherwise, the observed differences are likely due to chance.
For example:
Compare test scores of students taught with 3 methods (Traditional, Online, Hybrid). ANOVA is used to determine if at least one teaching method yields significantly different average scores.
ANOVA Formula
The ANOVA formula is made up of numerous parts. The best way to tackle an ANOVA test problem is to organize the formulae inside an ANOVA table.
Here's a general structure of an ANOVA table:
where,
- F = ANOVA Coefficient
- MSB = Mean of the total of squares between groupings
- MSW = Mean total of squares within groupings
- MSE = Mean sum of squares due to error
- SST = total Sum of squares
- p = Total number of populations
- n = The total number of samples in a population
- SSW = Sum of squares within the groups
- SSB = Sum of squares between the groups
- SSE = Sum of squares due to error
- s = Standard deviation of the samples
- N = Total number of observations
Assumptions of ANOVA
These must be validated before analysis:
- Independence: Observations are randomly sampled, and groups are independent.
- Normality: Residuals (errors) are approximately normally distributed (checked via Q-Q plots or Shapiro-Wilk test).
- Homoscedasticity: Equal variances across groups (verified using Levene’s or Bartlett’s test).
ANOVA is robust to minor violations of normality and homoscedasticity with balanced sample sizes.
Calculating ANOVA
Compare plant growth under 3 fertilizers (A, B, and C):
- Fertilizer A: [10, 11, 12]
- Fertilizer B: [7, 8, 9]
- Fertilizer C: [4, 5, 6]
1. State Hypothesis
- Null Hypothesis (H0): μA = μB = μC
- Alternative Hypothesis (Ha): At least one μ differs.
2. Calculate Group means and Grand mean.
- Group Means: \bar X_A, \bar X_B, and \bar X_C
- Grand Mean: \overline{X}_{\text{grand}}
3. Compute Sum of Squares (SS):
SSB (Sum of Squares Between Groups): Accounts for variation due to the treatment or independent variable.
SSB = \sum n_i(\bar{X}_i - \bar{X}_{\text{grand}})^2 
SSE (Sum of Squares Error or Within Groups): Accounts for variation within groups (random error or residuals).
SSE = \sum ({x}_i - \bar{X})^2 SST (Total Sum of Squares): Accounts for total variation from overall mean.
SST = SSB + SSW
SSB = 3(11 − 8) + 3(8 − 8) + 3(5 − 8) = 3(9) + 3(0) + 3(9) = 54
SSE:
- Fertilizer A: (10 − 11) + (11 − 11) + (12 − 11) = 1 + 0 + 1 = 2
- Fertilizer B: (7 − 8) + (8 − 8) + (9 − = 1 + 0 + 1 = 2
- Fertilizer C: (4 − 5) + (5 − 5) + (6 − 5) = 1 + 0 + 1 = 2
SSW = 2 + 2 + 2 = 6 
SST = 54 + 6 = 60
4. Calculate Degrees of Freedom (df):
df1 (Between Groups) = k - 1, where k is number of groups.
df2 (Within Groups) = N - k, where N is the total observations.
df3 (Total) = N - 1.
- df1 = 3 - 1 = 2
- df2 = 9 - 3 = 6
- df3 = 9 - 1 = 8
5. Calculate Mean Squares (MS):
MSB (Mean Square Between Groups) = SSB / df1.
MSE (Mean Square Error) = SSE / df2.
- MSB = \frac{SSB}{df1} = \frac{54}{2} = 27
- MSW = \frac{SSW}{df2} = \frac{6}{6} = 1
6. F-statistic:
The F-statistic is calculated as the ratio of MSB to MSE:
F = \frac{MSB}{MSE} 
- F = \frac{27}{1} = 27
7. P-value:
The p-value is used to decide whether differences among groups are statistically significant. When the p-value is smaller than the significance level (α), the null hypothesis is rejected.
If F > Fcritical  → p < 0.05 : Null Hypothesis Rejected
Use the F-distribution table or software with the following: Numerator df1 = 2, Denominator df2 = 6, α = 0.05
Critical F-value, Fcritical: 5.14 (From F-distribution table)
F > Fcritical: 27 > 5.14 → p < 0.05; Reject null hypothesis
Types of ANOVA
ANOVA is mainly classified into two types based on the number of independent variables (factors) being studied.
1. One-Way ANOVA (or One-Factor)
One-Way ANOVA is used to compare the means of three or more groups when there is only one independent variable. It helps determine whether the differences among the group means are statistically significant.
Example: Comparing the average test scores of students taught using three different teaching methods.
2. Two-Way ANOVA (or Two-Factor)
Two-Way ANOVA is used when there are two independent variables. It evaluates the effect of each factor on the dependent variable and also determines whether the two factors interact with each other.
Example: Studying how students' test scores are affected by both the teaching method and the number of study hours.
➣Practice: Solved Examples
