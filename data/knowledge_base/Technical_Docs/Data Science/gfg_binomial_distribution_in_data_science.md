# Binomial Distribution in Data Science

> Source: https://www.geeksforgeeks.org/data-science/mathematics-probability-distributions-set-4-binomial-distribution/

Binomial Distribution is used to calculate the probability of a specific number of successes in a fixed number of independent trials where each trial results in one of two outcomes: success or failure. It is used in various fields such as quality control, election predictions and medical tests to make decisions based on probability. In this article, we’ll see the more about Binomial Distribution and its core concepts.
Key Concepts of Binomial Distribution
1. Bernoulli Trial: A Bernoulli trial is an experiment that results in one of two outcomes: success or failure. The trials are independent means the outcome of one trial does not affect the others. Example: Tossing a coin where heads = success and tails = failure.
2. Number of Trials (n): This refers to the fixed number of trials performed in the experiment. For example if we flip a coin 5 times, n = 5.
3. Success Probability (p): The probability of success in each trial is denoted by p. This probability is constant across all trials. Example: For a fair coin the probability of heads (success) on each flip is p = 0.5.
4. Failure Probability (q): The probability of failure is denoted by q and it is calculated as q = 1− p. Since each trial results in either success or failure, we always have p + q =1. Example: For a fair coin, p=0.5 for heads so q = 1−0.5 = 0.5 for tails.
Binomial Distribution Formula
Binomial Distribution calculates the probability of getting exactly 
P(X = x) = \binom{n}{x} p^x (1 - p)^{n - x} 
Where:
- P(X=x) is the probability of getting exactlyx successes.
- n is the number of trials.
- x is the number of successes we want to calculate the probability for.
- p is the probability of success in each trial.
- \binom{n}{x} is the binomial coefficient which represents the number of ways to arrangex successes inn trials. It is calculated as:
Probability Mass Function (PMF)
The Probability Mass Function defines the probability of a specific number of successes occurring in the Binomial Distribution. It provides the likelihood of getting exactly x successes out of n trials. The formula for the PMF is as follows:
P(X = x) = \binom{n}{x} p^x (1 - p)^{n - x} 
This formula tells us the probability of achieving exactly x successes in n trials. The binomial coefficient 
Example: Tossing a Coin
Let’s say we flip a coin 4 times (n= 4) and want to know the probability of getting exactly 2 heads (successes). Since the probability of heads is p= 0.5 for a fair coin, the probability of tails (failure) is q = 1−p = 0.5.
- We calculate the probability using the PMF formula: P(X = 2) = \binom{4}{2} (0.5)^2 (0.5)^{4 - 2}
- First, calculate the binomial coefficient: \binom{4}{2} = \frac{4!}{(4 - 2)! 2!} = \frac{4 \times 3}{2 \times 1} = 6
- Now substitute the values into the PMF formula: P(X = 2) = 6 \times (0.5)^2 \times (0.5)^2 = 6 \times 0.25 \times 0.25 = 6 \times 0.0625 = 0.375
- Thus, the probability of getting exactly 2 heads in 4 tosses is 0.375 or 37.5%.
Cumulative Distribution Function (CDF)
The Cumulative Distribution Function (CDF) of the Binomial Distribution gives the probability of obtaining at most x successes in n trials. It’s the sum of the probabilities from 
The CDF is defined as:
F(x) = P(X \leq x) = \sum_{k=0}^{x} P(X = k) 
In simpler terms, the CDF tells us the cumulative probability of getting zero, one, two or more successes in n trials. It is helpful when we want to know the probability of getting a certain number of successes or fewer.
Example:
If we want to know the probability of getting 3 or fewer heads in 5 coin tosses (n=5) we would calculate 
P(X≤3) by summing the probabilities:P(X \leq 3) = P(X = 0) + P(X = 1) + P(X = 2) + P(X = 3) 
Expected Value of the Binomial Distribution
The expected value (mean) of a Binomial Distribution represents the average number of successes we expect after performing n trials. The expected value is calculated as:
E[X] = n \cdot p 
For example if we flip a fair coin 5 times, the expected number of heads would be:
So we would expect to get 2.5 heads on average after 5 flips of the coin.
Variance and Standard Deviation
1. Variance: The variance of a Binomial Distribution measures how much the number of successes varies from the expected value. It is given by:
\text{Var}[X] = n \cdot p \cdot (1 - p) 
2. Standard Deviation: The standard deviation is the square root of the variance which gives us a measure of how much the number of successes is likely to differ from the expected value on average:
\sigma = \sqrt{n \cdot p \cdot (1 - p)} 
Practical Example: Airline Ticket Sales
Let’s apply the Binomial Distribution in a real-life scenario. Consider an airline that sells 65 tickets for a flight with a capacity of 60 passengers. The probability that a passenger does not show up for the flight is q=0.1 means the probability that a passenger shows up is p=0.9. The airline wants to know the probability that 60 or fewer passengers will show up so they don’t need to reschedule tickets.
Step 1: Define Random Variable
Here the random variable X represents the number of passengers who show up. We need to calculate 
Step 2: Calculate Probability of More Than 60 Passengers
We first calculate the probability that more than 60 passengers show up which is: 
Step 3: Using Binomial Formula
Here we calculate the probabilities for X=61,62,…,65. We then subtract this from 1 to find 
Step 4: Result
After performing the calculation we find: 
After performing the calculation we find that the probability of 60 or fewer passengers showing up is approximately 79.09%. This means there is a 79.09% chance that the airline will not need to rebook any passengers.
Python Implementation for Binomial Distribution
Now let's implement the Binomial Distribution in Python to find the probabilities, visualize outcomes and calculate both the PMF and CDF. We’ll be using Numpy, SciPy and Matplotlib libraries for this.
import matplotlib.pyplot as plt
import numpy as np
from scipy.stats import binom
n = 10  
p = 0.5  
x = np.arange(0, n+1) 
pmf = binom.pmf(x, n, p)
plt.figure(figsize=(8, 6))
plt.bar(x, pmf, color='skyblue', edgecolor='black')
plt.title('Binomial Distribution PMF (n=10, p=0.5)', fontsize=14)
plt.xlabel('Number of successes (x)', fontsize=12)
plt.ylabel('Probability', fontsize=12)
plt.grid(axis='y', linestyle='--', alpha=0.7)
plt.show()
cdf = binom.cdf(x, n, p)
plt.figure(figsize=(8, 6))
plt.plot(x, cdf, color='purple', marker='o', linestyle='-', linewidth=2)
plt.title('Binomial Distribution CDF (n=10, p=0.5)', fontsize=14)
plt.xlabel('Number of successes (x)', fontsize=12)
plt.ylabel('Cumulative Probability', fontsize=12)
plt.grid(True)
plt.show()
probability_3_heads = binom.pmf(3, n, p)
print(f'Probability of exactly 3 heads: {probability_3_heads:.4f}')
Output:
Probability of exactly 3 heads: 0.1172
Applications of the Binomial Distribution
Binomial Distribution has numerous applications in real-life scenarios:
- Quality Control: In manufacturing the Binomial Distribution is used to model the number of defective items in a batch. For Example if a factory produces 100 items and has a 5% defect rate, the distribution can help estimate the probability of finding a certain number of defective items.
- Election Predictions: During elections it can model the probability of a candidate receiving a certain number of votes. If each voter’s decision is independent and the probability of voting for a particular candidate is known it can help to predict the likelihood of the candidate winning.
- Medical Testing: In medical testing it is useful for predicting the number of positive test results out of a fixed number of tests. If the probability of a test result being positive is known the distribution can be used to calculate the chances of a certain number of positive results.
- Customer Behavior: In retail, businesses can use the Binomial Distribution to model customer behaviors such as the probability that a customer will buy a product or the likelihood of a certain number of sales occurring in a fixed period.
Mastering the Binomial Distribution helps us with the tools to calculate probabilities in binary outcome scenarios helps in making it invaluable for decision-making across various fields.
