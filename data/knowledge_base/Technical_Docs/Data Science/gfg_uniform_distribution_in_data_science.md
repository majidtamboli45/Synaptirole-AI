# Uniform Distribution in Data Science

> Source: https://www.geeksforgeeks.org/data-science/mathematics-probability-distributions-set-1/

Uniform Distribution also known as the Rectangular Distribution is a type of Continuous Probability Distribution where all outcomes in a given interval are equally likely. Unlike Normal Distribution which have varying probabilities across their range, Uniform Distribution has a constant probability density throughout the interval which results in a "flat" distribution.
Key Concepts of the Uniform Distribution
1. Events and Interval
Uniform Distribution applies to events that are equally likely within a fixed interval [a,b]. This interval can represent time, space or any continuous measurement. The events within this interval are random and independent but they all have the same likelihood of occurring.
Example: If a fair die is rolled each side (1 to 6) is equally likely to appear which represents a discrete uniform distribution. In contrast, a continuous uniform distribution could model the outcome of a randomly chosen time within a 24-hour day where every moment has the same probability.
2. Probability Density Function (PDF)
PDF for a Uniform Distribution is a constant value across the entire interval [a,b]. This is because every point in the interval is equally likely to be chosen. Formula for the Uniform PDF is:
f(x) = \frac{1}{b - a}, \quad a \leq x \leq b 
For any x outside the interval [a,b] the PDF is zero:
Example: For a uniform distribution on the interval [0,25] the PDF is:
This means every value between 0 and 25 has the same probability of occurring.
3. Cumulative Distribution Function (CDF)
CDF provides the probability that the random variable is less than or equal to a specific value x. For a Uniform Distribution, the CDF is calculated as the cumulative sum of the PDF over the range from a to x and its formula is:
F(x) = \begin{cases} 0, & \text{if} \ x < a \\\frac{x - a}{b - a}, & \text{if} \ a \leq x \leq b \\1, & \text{if} \ x > b\end{cases} 
Example: For a Uniform Distribution between a = 0 and b = 25 the CDF is:
This shows that for any value of x, the probability that X ≤ x is simply the proportion of the interval up to x.
Properties of the Uniform Distribution
1. Expected Value (Mean)
The expected value of a Uniform Distribution represents the central tendency of the distribution. It is the average of the lower and upper bounds of the interval which is calculated as:
E[X] = \frac{a + b}{2} 
Example: For a Uniform Distribution with a=0 and b=25, the expected value is:
This means the average value of the random variable X is 12.5.
2. Variance
The variance of the Uniform Distribution measures the spread of values around the mean and its formula is:
Var(X) = \frac{(b - a)^2}{12} 
Example: For a=0 and b=25, the variance is:
This tells us how much the values are expected to deviate from the mean.
3. Standard Deviation
The standard deviation is the square root of the variance and provides a measure of the dispersion of the distribution. The formula for the standard deviation is:
\sigma = \sqrt{Var(X)} = \frac{b - a}{\sqrt{12}} 
Example: For a=0 and b=25:
Example: Uniform Distribution in Copper Wire
Let’s apply the Uniform Distribution to a real-world scenario. Suppose the current measured in a piece of copper wire is uniformly distributed over the interval [0,25]. We can calculate the PDF, mean, variance, standard deviation and CDF.
1. PDF: 
2. Expected Value: 
3. Variance: 
4. Standard Deviation: 
5. CDF: 
Python Implementation for Uniform Distribution
Here we implement the Uniform Distribution in Python and we will be using NumPy and Matplotlib libraries to and visualize random samples from a uniform distribution.
import numpy as np
import matplotlib.pyplot as plt
a = 0  
b = 25  
samples = np.random.uniform(a, b, 1000)
plt.hist(samples, bins=30, density=True, alpha=0.6, color='g')
x = np.linspace(a, b, 1000)
plt.plot(x, np.ones_like(x) / (b - a), 'r-', lw=2)
plt.title('Uniform Distribution PDF')
plt.xlabel('X')
plt.ylabel('Probability Density')
plt.show()
Output:
Applications of the Uniform Distribution
Uniform Distribution is used in various real-world scenarios where all outcomes within a specific interval are equally likely, some common applications include:
- Random Sampling: In simulations, random numbers are drawn from a Uniform Distribution to simulate random behavior.
- Quality Control: In manufacturing, they models variations in product measurements when there’s no systematic bias.
- Lottery and Gaming: The distribution is used to model random number selection in lottery games or shuffling cards.
- Random Time Intervals: If an event is equally likely to occur at any moment within a given time frame this can model the time of occurrence.
Mastering the Uniform Distribution helps us with a tool for modeling scenarios where each outcome within a specified range is equally likely and it provides a solid foundation for applications in random sampling, quality control and simulations.
