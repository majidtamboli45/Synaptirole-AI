# Poisson Distribution

> Source: https://www.geeksforgeeks.org/maths/poisson-distribution

The Poisson distribution is a discrete probability distribution that calculates the likelihood of a certain number of events occurring within a fixed interval of time, assuming the events occur independently.
Example: Emails per Hour
If you receive emails randomly at an average rate of 5 per hour (λ = 5), the Poisson distribution can tell you the probability of receiving 0 emails, exactly 3 emails, and so on.
To model this, the interval is imagined as divided into tiny subintervals where:
- No more than one event can occur.
- The probability of one event is proportional to the subinterval’s length.
- Events in different subintervals are independent.
It is characterized by a single parameter, λ (lambda), which represents the event's average occurrence rate in an interval(not a subinterval).
Shape of the Poisson Distribution
The shape of the Poisson distribution depends on the value of λ. As λ increases, the distribution shifts to the right and becomes more spread out.
Key Assumptions:
1. Events occur independently of each other.
2. The average rate of occurrence (λ) is constant over the given interval.
3. The number of events can be any non-negative integer.
Poisson Distribution Formula
Poisson distribution is characterized by a single parameter, lambda (λ), which represents the average rate of occurrence of the events. The probability mass function of the Poisson distribution is given by:
P (X = r) = \frac {e^{−λ}λ^r}{r!} 
Where,
- P(X = r) is the Probability of observing k Events
- e is the Base of the Natural Logarithm (approximately 2.71828)
- λ is the Average Rate of Occurrence of Events
- r is the Number of Events that occur
Recurrence Relation for Poisson Probabilities
In the Poisson distribution, there is a special recursive relationship that allows you to compute the probability of getting r events based on the probability of getting r−1 events. This relation is given by:
Example:
Calculate the value for P(X = 8) using the recurrence relation and the value for P(X = 7), where P(X = 7) = 0.0346, λ = 3 and r = 6.
Solution:
P(X = 7) =\frac{\lambda}{r}P(6) = \frac{3}{6} 0.345 = 0.1725 
Poisson Distribution Characteristics
Let's discuss some characteristics of Poisson Distributions here.
Expectation and Variance
In the Poisson distribution, both the Expectation(mean) and variance are equal and are denoted by the parameter λ (lambda). This property of equal mean and variance is a distinctive characteristic of the Poisson distribution and simplifies its statistical analysis.
Expectation(mean), E(X) = λ and
Variance, V(X) = λ
where
- λ = np, (n is the Number of Trials, p is the Probability of Success)
Standard Deviation of Poisson Distribution
Standard Deviation of a Poisson distribution is a measure of the amount of variability or dispersion in the distribution. Mathematically, it is given by:
σ = 
\sqrt {\lambda} 
where,
- λ (lambda) is the Average Rate of Occurrence of Events
- σ (sigma) is the Standard Deviation of the Distribution
Probability Mass Function and Cumulative Distribution Function
Probability Mass Function (PMF) describes the likelihood of observing a specific number of events in a fixed interval. It is given by:
PMF = \frac{(e^{-λ} × λ^{r})} {r!} , r=0,1,2,… 
where,
- e is the Base of the Natural Logarithm (approximately 2.71828)
- λ is the Parameter, which is also equal to the Mean, and Variance
- r is the Number of times an event occurs
Some properties of PMF are:
- P ( X = k ) ≥ 0 for all k.
- The sum of all probabilities over possible values of k is 1.
Example:
Suppose a hospital receives an average of λ = 4 emergency cases per hour. What is the probability that exactly 2 cases occur in an hour?
 Solution: 
Using the Poisson formula:
P (X = 2) = e-4 42 /2! = e-4 ✕ 16/2 = 0.0183 ✕ 16 /2 = 0.1465
Cumulative Distribution Function (CDF): gives the probability that the random variable is less than or equal to a certain value. It is expressed as:
where ⌊x⌋ denotes the greatest integer less than or equal to x.
Poisson Distribution Graph
The following illustration shows the Graph of the Poisson Distribution or the Poisson Distribution Curve.
The Poisson distribution is positively skewed (Skewness > 0) and leptokurtic (Kurtosis > 0), meaning it has a longer tail on the right side and heavier tails than the normal distribution. However, for large values of λ, it becomes increasingly symmetric and bell-shaped, resembling a normal distribution.
Note: Leptokurtic refers to a distribution that has a higher kurtosis than the normal distribution. Kurtosis measures the "tailedness" or sharpness of the peak of a frequency distribution curve.
The event with the highest probability is represented by the peak of the distribution—the mode.
- When λ is a non-integer, the mode is the closest integer smaller than λ.
- When λ is an integer, there are two modes: λ and λ−1.
When λ is low, the distribution is much more distributed on the right side of its peak than on its left (right-skewed).
As λ increases, the distribution starts to appear more and more similar to a normal distribution. When λ is 10 or greater, a normal distribution is a good approximation of the Poisson distribution.
Binomial Distribution vs Poisson Distribution
The key differences between the Poisson Distribution and the Binomial Distribution are listed in the following table:
| Binomial Distribution | Poisson Distribution | 
|---|---|
| Number of Trials: Fixed (n) | Number of Trials: Unlimited | 
| Outcomes are Success or Failure | Outcomes are Rare Events | 
| Probability of Success (p), 	Number of trials(n), Number of successes (x) | Average Event Rate (λ), r is the Number of Events that occur | 
| Mean μ = n ⨉ p | Mean μ = λ | 
| Variance σ2 = n ⨉ p ⨉ (1 - p) | Variance σ2 = λ | 
| Assumptions: Fixed number of trials, two possible outcomes, independent trials, constant probability | Assumptions: Probability of success is small, number of trials is large, mean remains constant. | 
| Example: Tossing a coin 5 times: Probability of getting exactly 2 heads | Example: A call center receives 3 calls/min: Probability of exactly 2 calls in a minute | 
➣Practice: Solved Examples
