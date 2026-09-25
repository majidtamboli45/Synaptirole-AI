# Alpha and Beta Test

> Source: https://www.geeksforgeeks.org/data-science/alpha-and-beta-test/

In the previous article, we discussed hypothesis testing which is the backbone of inferential statistics. We previously discussed the basic hypothesis testing including Null and Alternate Hypothesis, z-test, etc. Now, this discusses more Type I and Type II errors, level of significance (alpha), and Power(beta).
P-value
The p-value is defined as the probability of obtaining a result or more extreme than what was actually observed in the normal distribution. Generally, we take the level of significance=0.05, it means if the observed p-value is less than the level -of significance then, we reject the null hypothesis.
To calculate the p-value, we need the table of particular test statistics (t-test, z-test, f-test) and whether it is a one-tailed, or two-tailed test.
Alpha and Beta Test
|  | Null Hypothesis is TRUE | Null Hypothesis is FALSE | 
|---|---|---|
| Reject Null Hypothesis | Type I Error | Correct decision | 
| Fail to Reject the Null Hypothesis | Correct decision | Type II error | 
- Type I Error (Alpha): Now, if we reject the null hypothesis based on the level of significance p-value calculations, there is a possibility that the samples, in reality, belong to the same (null) distribution, and we incorrectly rejected it, this is called Type I error and it is denoted by alpha
- Type II Error (Beta): Now, on the basis of the level of significance and p-value, if we accept a sample that does not really belong to the same distribution then, it is referred to as Type II error
Power and Confidence Interval:
- Confidence Interval: The confidence interval is the region in which is we can confidently reject the null hypothesis. It is calculated by subtracting alpha and 1
- Power: Power is the probability of correctly rejecting the null hypothesis and accepting the Alternative Hypothesis (HA). Power can be calculated by subtracting beta from 1.
The higher the power makes lower the probability of making a Type II error. Lower power means a higher risk of performing a Type II error and vice-versa. Generally, 0.80 power is considered good enough. Power is also dependent on the following factors:
- Effect size: Effect size is simply the way of measuring the strength of the relationship between two variables. There are many ways of calculating effect sizes such as Pearson correlations for calculating correlations between two variables, Cohen's d test for measuring the difference between groups, or simply by calculating the difference between means of different groups.
- Sample Size: The number of observations that are included in the statistical sample.
- Significance: Level of significance used in the test (alpha).
Steps to Perform Power Analysis
- State the Null Hypothesis (H0) and Alternative Hypothesis (HA).
- State the alpha risk level (level of significance).
- Choose the appropriate statistical test.
- Decide the Effect size.
- Create sampling plans and determine the sample size. After that gather the sample.
- Calculate the test statistic by determining the p-value.
  - If p-value < alpha, then we reject the null hypothesis.
- Repeat the above steps a few times.
Examples
- Suppose there is two distribution representing the weights of two groups of people, the left representing people on diet and right representing people who take normal food.
- We take some samples from both the distribution and calculate their means.
- Here, our null hypothesis will be both samples are from the same distribution (no effect of diet plan) and the alternate hypothesis will be that both samples are from a different distribution.
- Now, we calculate the p-value from these samples.
- If our p-value is smaller than the level of significance then we correctly reject the null hypothesis that both these samples are from the same distribution.
- else, we don't reject the null hypothesis.
- Now, we repeat the above steps numerous times (i.e 1000, 10000), etc. and we calculate the probability of correctly rejecting the null hypothesis i.e. Power.
Implementation:
# Necessary Imports
import numpy as np
from statsmodels.stats.power import TTestIndPower
import matplotlib.pyplot as plt
# here effect size is taken as (u1-u2) /sd
effect_size = (60-50)/10
alpha = 0.05
samples =20
p_analysis = TTestIndPower()
power = p_analysis.solve_power(effect_size=effect_size, alpha=alpha, nobs1 = samples, ratio =1)
print("Power is ",power)
0.8689530131730794
Read More:
Solved Examples on Alpha and Beta test
Problem 1: A software company is preparing to release a new mobile app. They want to conduct alpha testing with 20 in-house employees. How many critical bugs should they aim to resolve before moving to beta testing if they want to reduce critical bugs by 90%?
Solution:
Let x be the initial number of critical bugs.
After alpha testing: 0.1x = 20 (10% of bugs remaining)
x = 20 / 0.1 = 200
They should aim to resolve 200 critical bugs during alpha testing.
Problem 2 : During beta testing of a web application, 500 users reported a total of 150 bugs. What percentage of users reported bugs?
Solution:
Percentage = (Number of users reporting bugs / Total users) × 100
Percentage = (150 / 500) × 100 = 30%
Problem 3 : An alpha test of a video game lasted for 2 weeks. If testers spent an average of 3 hours per day testing, how many total testing hours were accumulated?
Solution:
Total hours = Number of days × Hours per day
Total hours = 14 × 3 = 42 hours
Problem 4 : In a beta test, 1000 users were invited, but only 800 actively participated. What was the participation rate?
Solution:
Participation rate = (Active participants / Invited users) × 100
Participation rate = (800 / 1000) × 100 = 80%
Problem 5 : During alpha testing, 50 bugs were identified. If 30% were critical, 50% were major, and the rest were minor, how many bugs of each type were there?
Solution:
Critical bugs = 50 × 30% = 15
Major bugs = 50 × 50% = 25
Minor bugs = 50 - (15 + 25) = 10
Problem 6: A beta test lasted for 30 days. If the daily bug report rate decreased linearly from 20 on the first day to 5 on the last day, what was the total number of bugs reported?
Solution:
Average daily bug reports = (20 + 5) / 2 = 12.5
Total bugs = 12.5 × 30 = 375 bugs
Problem 7: During alpha testing, it took an average of 45 minutes to fix each bug. If 40 bugs were fixed, how many person-hours were spent on bug fixing?
Solution:
Total time = Number of bugs × Time per bug
Total time = 40 × 45 minutes = 1800 minutes = 30 hours
Problem 8 : In a beta test, 200 users tested a product for 10 days. If each user spent an average of 30 minutes per day, what was the total user testing time in hours?
Solution:
Total time = Users × Days × Time per day
Total time = 200 × 10 × 0.5 hours = 1000 hours
Problem 9 : An alpha test revealed that 25% of users experienced a specific error. If 60 users participated in the test, how many encountered the error?
Solution:
Users with error = Total users × Error percentage
Users with error = 60 × 25% = 15 users
Problem 10 : During beta testing, the crash rate of an app decreased from 10% to 2%. If 1000 users participated in the beta test, how many fewer users experienced crashes after the improvements?
Solution:
Initial crashes = 1000 × 10% = 100 users
Final crashes = 1000 × 2% = 20 users
Reduction in crashes = 100 - 20 = 80 users
Practice Problems - Alpha and Beta test
- A software company conducts alpha testing with 30 employees. If they identify 120 bugs, and 15% are critical, how many critical bugs were found?
- During a beta test, 1500 users were invited, and 1200 participated. What was the participation rate?
- An alpha test lasts for 10 days, with testers working 6 hours per day. If there are 8 testers, how many total testing hours were logged?
- In a beta test, 300 bugs were reported. If 40% were major, 35% were minor, and the rest were cosmetic, how many cosmetic bugs were there?
- A mobile app's crash rate during beta testing decreased from 8% to 3%. If 2000 users participated, how many fewer users experienced crashes after the improvement?
- During alpha testing, it takes an average of 30 minutes to fix each bug. If 50 bugs were fixed, how many person-hours were spent on bug fixing?
- A beta test runs for 21 days. If the daily bug report rate decreases linearly from 30 on the first day to 10 on the last day, what is the total number of bugs reported?
- In an alpha test with 40 participants, 30% reported a specific usability issue. How many participants encountered this issue?
- A beta test involves 500 users testing a product for 14 days. If each user spends an average of 45 minutes per day, what is the total user testing time in hours?
- During alpha testing, 80 bugs were identified and fixed. If the team's goal was to resolve 90% of all bugs before moving to beta, how many total bugs were estimated to be in the software initially?
Summary
Alpha and Beta testing are crucial phases in software development and product release cycles. Alpha testing is typically conducted internally by employees or a select group of users, focusing on identifying and resolving major bugs and issues. Beta testing involves a larger group of external users testing the product in real-world conditions. These testing phases help identify bugs, usability issues, and performance problems before the final release. The practice problems and examples provided cover various aspects of these testing phases, including bug tracking, user participation rates, testing duration, bug resolution times, and performance improvements. They demonstrate how quantitative analysis can be applied to evaluate the effectiveness of alpha and beta testing in improving software quality.
