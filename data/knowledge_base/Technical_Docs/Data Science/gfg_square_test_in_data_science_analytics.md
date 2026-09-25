# square test in Data Science & Data Analytics

> Source: https://www.geeksforgeeks.org/data-science/chi-square-test-in-data-science-and-data-analytics/

Chi-Square test helps us determine if there is a significant relationship between two categorical variables. It is a non-parametric statistical test meaning it doesn’t follow normal distribution.
The Chi-square test compares the observed frequencies (actual data) to the expected frequencies (what we would expect if there was no relationship). This helps identify which features are important for predicting the target variable in machine learning models.
Formula for Chi-square test
Chi-square statistic is calculated as:
\chi^2 = \sum \frac{(O_i - E_i)^2}{E_i} 
where,
- c is degree of freedom
- O_{i} is the observed frequency in cell{i}
- E_{i} is the expected frequency in cell{i}
Often used with non-normally distributed data. Before we jump into calculations. let's understand some important terms:
- Observed Values (O): Actual counts from the data.
- Expected Values (E): Counts expected if variables are independent.
- Contingency Table: A table showing counts of two categorical variables.
- Degrees of Freedom (df): Number of independent values, helps find critical values.
Types of Chi-Square test
The two main types are the chi-square test for independence and the chi-square goodness-of-fit test.
1. Chi-Square Test for Independence: This test is used whether there is a significant relationship between two categorical variables.
- This test is applied when we have counts of values for two nominal or categorical variables.
- To conduct this test two requirements must be met: independence of observations and a relatively large sample size.
- We test if shopping preference (Electronics, Clothing, Books) is related to payment method (Credit Card, Debit Card, PayPal). The null hypothesis assumes no relationship between them.
2. Chi-Square Goodness-of-Fit Test: The Chi-Square Goodness-of-Fit test is used to check if a variable follows a specific expected pattern or distribution.
- This test is used with counts of categorical data to see if the observed values match what we expect based on a hypothesis. It helps determine if the data represents the whole population well.
- For example, when testing if a six-sided die is fair, the null hypothesis assumes each face has an equal chance of landing face up meaning the die is unbiased and all sides occur equally often.
Steps to perform Chi-square test
Step 1: Define Your Hypotheses
- Null Hypothesis (H₀): The two variables are independent (no relationship).
- Alternative Hypothesis (H₁): The two variables are related (there is a relationship).
Step 2: Create a Contingency Table: This is simply a table that displays the frequency distribution of the two categorical variables.
Step 3: Calculate Expected Values: To find the expected value for each cell use this formula:
E_{i} = \frac{(Row\ Total \times Column\ Total)}{Grand\ Total} 
Step 4: Compute the Chi-Square Statistic: Now use the Chi-Square formula:
\chi^2 = \sum \frac{(O_{i} - E_{i})^2}{E_{i}} 
where:
- Oi = Observed value
- Ei = Expected value
If the observed and expected values are very different the Chi-Square value will be high which indicate a strong relationship.
Step 5: Compare with the Critical Value:
- If \chi^2 > critical value → Reject H₀ (There is a relationship).
- If \chi^2 < critical value → Fail to reject H₀ (No relationship).
Uses of the Chi-Square Test
The Chi-Square Test helps us find relationships or differences between categories. Its main uses are:
- Feature Selection in Machine Learning: It helps decide if a categorical feature (like color or product type) is important for predicting the target (like sales or satisfaction), improving model performance.
- Testing Independence: It checks if two categorical variables are related or independent. For example, whether age or gender affects product preferences.
- Assessing Model Fit: It helps check if a model’s predicted categories match the actual data, which is useful to improve classification models.
Example: Income Level vs Subscription Status
Let us examine a dataset with features including "income level" (low, medium, high) and "subscription status" (subscribed, not subscribed) indicate whether a customer subscribed to a service. The goal is to determine if this feature is relevant for predicting subscription status.
Step 1: Make Hypothesis
- Null hypothesis: No significant association between features
- Alternate Hypothesis: There is a significant association between features.
Step 2: Contingency table
| Income Level | Subscribed | Not subscribed | Row Total | 
|---|---|---|---|
| Low | 20 | 30 | 50 | 
| Medium | 40 | 25 | 65 | 
| High | 10 | 15 | 25 | 
| Column Total | 70 | 70 | 140 | 
Step 3: Now calculate the expected frequencies
For example the expected frequency for "Low Income" and "Subscribed" would be:
- As Total count for each row R_i is 70 and each columnC_j is 70 and Total number of observations are 140.
- Low Income, subscribed=(50 \times 70) \div140 = 25
Similarly we can find expected frequencies for other aspects as well:
|  | Subscribed | Not Subscribed | 
|---|---|---|
| Low Income | 25 | 25 | 
| Medium Income | 32.5 | 32.5 | 
| High Income | 12.5 | 12.5 | 
Step 4: Calculate the Chi-Square Statistic
Let's summarize the observed and expected values into a table and calculate the Chi-Square value:
|  | Subscribed (O) | Not Subscribed (O) | Subscribed (E) | Not Subscribed (E) | 
|---|---|---|---|---|
| Low Income | 20 | 30 | 25 | 25 | 
| Medium Income | 40 | 25 | 32.5 | 32.5 | 
| High Income | 10 | 15 | 12.5 | 12.5 | 
Now using the formula specified in equation 1 we can get our chi-square statistic values in the following manner:
Step 5: Degrees of Freedom
Step 6: Interpretations
Now compare the calculated 
Before its implementation we should have some basic knowledge about numpy, matplotlib and scipy.
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as stats
df = 2
alpha = 0.05
critical_value = stats.chi2.ppf(1 - alpha, df)
critical_value
Output:
5.991464547107979
For df = 2 and significance level 
- Since 6.462 > 5.991, we reject the null hypothesis.
- Conclusion: There is a significant association between income level and subscription status.
Visualizing Chi-Square Distribution
import numpy as np
import matplotlib.pyplot as plt
import scipy.stats as stats
df = 2
alpha = 0.05
c_val = stats.chi2.ppf(1 - alpha, df)
cal_chi_s = 3.747
x = np.linspace(0, 10, 1000)
y = stats.chi2.pdf(x, df)
plt.plot(x, y, label='Chi-Square Distribution (df=2)')
plt.fill_between(x, y, where=(x > c_val), color='red', alpha=0.5, label='Critical Region')
plt.axvline(cal_chi_s, color='blue', linestyle='dashed', label='Calculated Chi-Square')
plt.axvline(c_val, color='green', linestyle='dashed', label='Critical Value')
plt.title('Chi-Square Distribution and Critical Region')
plt.xlabel('Chi-Square Value')
plt.ylabel('Probability Density Function')
plt.legend()
plt.show()
Output:
In this example The green dashed line represents the critical value the threshold beyond which you would reject the null hypothesis.
- The red dashed line represents the critical value (5.991) for a significance level of 0.05 with 2 degrees of freedom.
- The shaded area to the right of the critical value represents the rejection region.
If the calculated Chi-Square statistic falls within this shaded area then you would reject the null hypothesis.
