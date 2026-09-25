# A/B Testing using Python

> Source: https://www.geeksforgeeks.org/data-science/a-b-testing-using-python/

A/B testing is a way to compare two versions of something to find out which one works better. In this you divide people into two groups, show them different versions and then measure which version performs better based on a specific goal. Suppose you're sending out two different email subject lines to people and you want to see which one gets more people to open the email.
- Group A: Gets an email with the subject "50% Off This Weekend!"
- Group B: Gets an email with the subject "Special Deal Just for You!"
After sending count how many people open each email. If more people open the email from Group B you can decide that the second subject line is better. As you can see, Option B works better than Option A because more people responded to it (25% compared to 17%).
When to Use A/B Test
- Not Getting Good Results: If something in your campaign isn’t working well, try out different versions with A/B testing to find what needs fixing.
- Starting Something New: Before launching a new page or message, test a couple of versions to see which one works better.
Key terminologies used in A/B Testing
To understand more about A/B testing first you have to learn these concepts:
1. Hypothesis Testing
Before you start any A/B test you need to come up with a hypothesis. Think of it as a smart guess about what you believe will happen in the experiment. For example if you’re testing two versions of a website button then your hypothesis would be: “I think changing the color of the button from blue to green will make more people click it. A clear hypothesis gives your test direction.
2. Randomization
Next we need to make sure the users are split into two groups: the control group and the experimental group. This is where randomization comes in. The control group (A) will see the original version of what you're testing. The experimental group (B) will see the new or changed version. It is done to avoid bias in test results.
3. Sample Size
Sample size means how many people you need to include in your test. You want enough people to get reliable results but not too many that it wastes resources. The more people you test the more accurate your results will be.
4. Performance Metrics
Now that your test is set up you need to decide what you’re measuring. These are called performance metrics or KPIs (Key Performance Indicators). These are the things you’ll look at to see if your changes worked. Some common performance metrics include:
- Conversion Rate: It is like how many people took the action you wanted like buying a product, signing up for a newsletter.
- Average Order Value: How much on average people spend during a transaction.
- User Retention: It shows how many people come back to use your product after their first visit.
They help you measure success. Without them you wouldn’t know if the change you made actually improved anything.
5. Statistical Analysis
Finally once you’ve collected the data from your test you need to analyze it to see if the changes you made were really effective. This is done using statistical methods.
Types of A/B Tests
1. One-Sample A/B Test (Single Model Comparison)
- One-Sample A/B test is used to compare a new model (test) against a baseline model (control). You can test whether the performance of the new model is significantly better than the old one.
- Example: A company wants to test a new version of its customer churn prediction model against the existing model.
2. Two-Sample A/B Test (Comparing Two Models)
- In this test you compare the performance of two different models to see if one outperforms the other.
- Example: You might test two recommendation algorithms (A and B) to see which one produces better user engagement or conversion rates.
Steps to Conduct an A/B Test
Let’s take a real-world example to understand A/B Testing. Suppose you are working for an e-commerce company that wants to improve user engagement by testing a new machine learning–based recommendation system against their current rule-based system. The goal is to determine whether the new model actually improves engagement before fully implementing it.
Step 1: Define Your Hypothesis
Before running the A/B test you must clearly define what you are testing and how success will be measured.
- Good Hypothesis: "The new ML-based recommendation system will increase the click-through rate (CTR) by at least 15% compared to the existing rule-based system."
- Bad Hypothesis: "The new recommendation system might work better."
Step 2: Set Up Control and Test Groups
A/B testing requires splitting users into two groups randomly:
- Control Group: Users who see recommendations from the existing rule-based system.
- Test Group: Users who see recommendations from the new ML-based system.
The groups must be of similar size to ensure statistical validity.
Step 3: Collect Data
Once the A/B test is live we need to track key performance indicators (KPIs) that help us measure the impact of the change. Common KPIs include:
- Click-Through Rate (CTR): It measure user engagement by calculating the percentage of users who click on recommended items. The formula of CTR is:
CTR= \frac{\text{Number of Clicks}}{\text{Number of Impressions}} 
 Example: If 1,000 users see recommendations and 150 click on them then CTR is:
\frac{150}{1000} = 15\% 
- Conversion Rate (CR): Measures how many users make a purchase after clicking a recommendation.
CR= \frac{\text{Number of Purchases}}{\text{Number of Clicks}} 
- Bounce Rate: The percentage of users who leave without interacting.
Data collection should run long enough to capture a representative sample of user behavior.
Step 4: Analyze the Results Using Python
Once we have collected sufficient data we need to analyze whether the observed differences between the control and test groups are statistically significant.
Key statistical measures used:
- Average Performance: It compare CTR between groups.
- Confidence Interval (CI): Confidence Interval indicates the range within which the true effect likely falls.
- Statistical Significance (p-value): Statistical Significance determines if the difference is due to chance.
Before its implementation we should have some basic knowledge about numpy and scipy.
!pip install numpy scipy
import numpy as np
import scipy.stats as stats
cc = 1200  # control clicks
ci = 10000  # control impressions
tc = 1500  # test clicks
ti = 10000  # test impressions
ctr_c = cc / ci
ctr_t = tc / ti
table = np.array([[cc, ci - cc],
                  [tc, ti - tc]])
chi2, p, _, _ = stats.chi2_contingency(table)
print(f"Control CTR: {ctr_c:.2%}")
print(f"Test CTR: {ctr_t:.2%}")
print(f"Chi-Square Test p-value: {p:.5f}")
if p < 0.05:
    print("The difference is statistically significant.Implement the new recommendation system.")
else:
    print("No significant difference. Further testing needed.")
Output:
Control CTR: 12.00% 
Test CTR: 15.00% 
Chi-Square Test p-value: 0.00000 
The difference is statistically significant. Implement the new recommendation system.
Step 5: Make a Decision
After analyzing the results there are two possible outcomes:
1. If the test group performs significantly better (p < 0.05):
- The ML-based recommendation system should replace the existing rule-based system.
- Deploy the new model for all users.
2. If results are inconclusive (p > 0.05):
- The observed difference may be due to randomness.
- Further testing or model improvements may be needed.
Tools for A/B Testing
Several tools make running A/B tests easier and more effective:
- Google Optimize: A free tool that integrates with Google Analytics. Great for basic A/B testing and audience targeting within the Google ecosystem.
- Optimizely: A premium platform offering advanced features like multivariate testing, cross-channel experiments and real-time results. Ideal for large-scale, complex testing needs.
- VWO (Visual Website Optimizer): Another paid tool combining A/B testing with extras like heatmaps and session recordings for deeper user insights and improved conversions.
Mistakes to Avoid in A/B Testing
- Wrong Hypothesis: If your guess about what to change is wrong, the test is less likely to work.
- Testing Too Much at Once: Do not test many things together it is hard to know what caused the result.
- Stopping Too Early: Let the test run fully so the results are reliable.
- Ignoring External Factors: Run tests during similar times to avoid outside influences like holidays or sales.
