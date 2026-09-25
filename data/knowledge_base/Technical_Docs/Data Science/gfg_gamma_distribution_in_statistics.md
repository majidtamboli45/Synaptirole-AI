# Gamma Distribution in Statistics

> Source: https://www.geeksforgeeks.org/data-science/gamma-distribution/

Gamma distribution is a type of probability distribution that is defined for non-negative real numbers and is used to model the waiting time until a specific event occurs in a Poisson process or the time between events in a Poisson process.
Gamma distribution can take on different forms, making it suitable for a range of applications. From engineering and finance to Bayesian statistics and queuing theory, the Gamma distribution plays a crucial role in understanding and predicting the behavior of processes governed by random events.
In this article, we will discuss Gamma Distribution, its probability density function, Mean and Variance of Gamma Distribution, and its examples.
What is Gamma Distribution
Gamma distribution is a continuous probability distribution that is widely used in statistics and various fields such as engineering, finance, and natural sciences. It is particularly effective for modeling the time until an event occurs, especially when the event is part of a process that happens at a constant rate ( Poisson process), such as waiting times, and the life span of Mechanical parts.
To properly understand gamma distribution It is necessary to understand the gamma function.
Gamma Distribution Function
Gamma Function is a special mathematical function that provides the normalization constants used in the probability density function. The gamma function allows the distribution to integrate into one over its positive support, making it a valid probability distribution for modeling positive random variables. An understanding of the gamma function is important for understanding the properties and applications of the gamma distribution.
The gamma function depicted by Γ(α), is an extension of the factorial function. The values of the gamma function for non-integer arguments generally cannot be expressed in simple, closed forms. The gamma distribution is written as Gamma (α,λ)
Γ(α)=\int_0^∞y^{\alpha-1}e^{-y}dy,for~\alpha>0 
Gamma Distribution Formula - Probability Density Function (PDF)
The Gamma Distribution is defined by two parameters: the shape parameter k (also denoted as 
f_X(x)=\frac{\lambda^\alpha}{Γ(\alpha)}x^{\alpha-1}e^{-\lambda x},for~x>0 
Gamma Distribution Mean and Variance
The mean of a random variable is a measure of its central tendency while variance measures the spread or dispersion of a random variable. It tells us how much the values of a random variable deviate from its mean.
1. The mean of the Gamma distribution is 
2. The variance of Gamma Distribution is 
Special Case 1: Exponential Distribution
Gamma with \alpha=1 
The PDF of the exponential distribution is:
f_X(x)=\lambda{e}^{-\lambda{x}},x>0 
Mean and Variance
- The mean of the exponential distribution is \mu=\frac{1}{\lambda}
- The variance is \sigma^2=\frac{1}{\lambda^2}
F_X(x)=^x\int_0\lambda{e^{-\lambda{t}}}dt=1-e^{-\lambda{x}} 
Examples of Exponential Distribution
Example 1: Consider a scenario where the waiting time for a customer to complete a transaction at a bank's ATM follows an exponential distribution with a scale parameter (λ) of 5 minutes. We want to find the probability that a customer will take less than 3 minutes to complete the transaction.
Solution:
The formula to determine the probability of a customer taking less than 3 minutes to complete the transaction will be: 
F_X(x)=^x\int_0\lambda{e^{-\lambda{t}}}dt In this case, λ = 5, and we want to find P(X < 3), where X is the random variable representing the waiting time.
P(X < 3) = 
^3\int_05e^{-5x}dx P(X < 3) = 
[-e^{-5x}]^3_0 P(X < 3) = 0.99
Therefore, the probability that the customer will take less than 3 minutes to complete the transaction is 0.99.
Example 2: Suppose the claims at a life insurance company's 24-hour call centre occur at a 4-per-hour rate. What is the probability that the next call arrives after more than 2 hours?
Solution:
The number of claims (X), in an hour can be expressed as a Poisson distribution with mean as 
\lambda=4 . We need to determine the probability of the next call arriving after more than 2 hours. For this, we will use the following formula:F_X(x)=^x\int_0\lambda{e^{-\lambda{t}}}dt P(X > 2) = 
^\infin\int_{2}4e^{-4x}dx P(X > 2) = 
[-e^{-4x}]^\infin_{2} P(X > 2) = 0.0003
Therefore, the probability that the next call will arrive after 2 hours is 0.0003.
Special Case 2: Chi-Square Distribution with Parameter "Degrees of Freedom"
Gamma with \alpha=\frac{\nu}{2}  , where \nu  is a positive integer, and \lambda=\frac{1}{2} 
The PDF of the chi-square distribution with v degrees of freedom is:
f_x(x)=\frac{(\frac{1}{2})^{\frac{1}{2}\nu}}{Γ(\frac{1}{2}\nu)}x^{\frac{1}{2}\nu-1}e^{\frac{-1}{2}x},x>0 
Mean and Variance
- The mean of the chi-square distribution is \mu=\nu
- The variance of chi-square distribution is σ2 = 2\nu
Note: A 
\chi^2 variable with\nu=2 is same as an exponential variable with mean 2.
Examples of Chi-Square Distribution
Example 1: Suppose we have a sample of 20 individuals, and we want to examine the distribution of their ages. If the ages follow a chi-square distribution with 15 degrees of freedom, find the probability that the total age of the sample is less than 30 years.
Solution:
The PDF of the chi-square distribution is given by, 
f_x(x)=\frac{(\frac{1}{2})^{\frac{1}{2}v}}{Γ(\frac{1}{2}v)}x^{\frac{1}{2}v-1}e^{\frac{-1}{2}x} In this question, we have to determine the probability that the total age of the taken sample is less than 30 years. For this, we will use the Gamma Distribution table.
Degree of freedom; i.e., 
\nu = 15, and we have to determine P(X < 30).
P(X < 30) = 0.9881
Example 2: Consider a study where the number of defects in a batch of products follows a chi-square distribution with 8 degrees of freedom. Find the probability that the number of defects is less than 12.
Solution:
The PDF of the chi-square distribution is given by, 
f_x(x)=\frac{(\frac{1}{2})^{\frac{1}{2}v}}{Γ(\frac{1}{2}v)}x^{\frac{1}{2}v-1}e^{\frac{-1}{2}x} In this question, we have to determine the probability that the number of defects is less than 30 years. For this, we will use the Gamma Distribution table.
Degree of freedom; i.e., 
\nu = 8, and we have to determine P(X < 12).
P(X < 12) = 0.8488
Also Read,
Conclusion
Gamma distribution is a powerful and flexible tool in probability and statistics, particularly useful for modeling processes where events occur independently over time. Its ability to generalize the exponential distribution and its connection to other important distributions, such as the Chi-squared distribution, make it valuable in fields ranging from engineering and finance to biology and environmental science. Whether it's predicting waiting times, assessing reliability, or managing risks, the Gamma distribution provides crucial insights into the behavior of complex systems
