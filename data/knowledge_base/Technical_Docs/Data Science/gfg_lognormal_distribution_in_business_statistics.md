# Lognormal Distribution in Business Statistics

> Source: https://www.geeksforgeeks.org/data-science/lognormal-distribution-in-business-statistics/

In business statistics, Lognormal Distribution is an important probability distribution model used to characterize data with positive values that show right-skewed patterns. It is widely applied in real-world scenarios such as stock prices, income distribution, resource reserves and social media metrics, making it valuable for risk assessment, portfolio optimization and decision-making in finance, economics and resource management.
- Lognormal distribution is a way to describe the likelihood of different values for a variable.
- A variable X follows a lognormal distribution if its natural logarithm, ln(X), follows a normal distribution.
- It is used to model variables that are always positive and tend to be right-skewed, unlike the symmetric normal distribution.
- If X has a lognormal distribution with parameters  \mu and\sigma it is denoted asX \sim \operatorname{LogN}(\mu, \sigma^2) where\mu and\sigma represent the mean and standard deviation of ln(X)
Probability Density Function (PDF) of Lognormal Distribution
The probability density function (PDF) for the lognormal distribution depends on two parameters, μ (mean) and σ (standard deviation), for x values greater than 0. When we take the logarithm of our lognormal data, μ represents the mean and σ is the standard deviation of this transformed data.
f(x)=\frac{1}{xσ√2π}e^\frac{-1}{2}(\frac{logx-μ}{σ})^2, for ~0<x<\infty 
Where:
- \mu represents the mean or the location parameter.
- \sigma represents the standard deviation or the shape parameter.
- x is the value for which is required to find the probability density.
- e is mathematical constants.
Lognormal Distribution Curve
- It is right-skewed, meaning it tilts to the right.
- The curve begins at zero, rises to its peak and then declines.
- The degree of skewness increases as the standard deviation (σ) rises, keeping the mean (μ) constant.
- μ represents the mean of natural logarithms of the data.
- σ represents the standard deviation of natural logarithms of the data.
- When σ is much larger than 1, the curve rises steeply at the start, peaks early and then falls rapidly, resembling an exponential curve.
- In this distribution, μ acts as more of a scale parameter, unlike the normal distribution where it serves as a location parameter.
Mean and Variance of Lognormal Distribution
Mean (\mu )
- The mean (\mu ) of a lognormal distribution is not simply the mean of the original data it is the mean of the natural logarithm of the data.
- Then, find the mean of these natural logarithms. Mathematically, \mu is the average of ln(x), where x represents the original data.
- This mean does not equal the median or mode of the original data, since the lognormal distribution is asymmetric
μ=e^{μ+{\frac{1}{2}σ^2}} 
Where:
- \mu represents the mean of the natural logarithm of the data.
- \sigma represents the standard deviation of the natural logarithm of the data.
- e is the mathematical constant approximately equal to 2.71828.
Variance (\sigma^{2} )
- The variance (\sigma^{2} ) of a lognormal distribution is similarly calculated from the natural logarithms of the data.
- The standard deviation of the natural logarithm of the data is \sigma . To get the variance, square this standard deviation that will result in\sigma^{2} .
- The variance formula involves both \sigma and\mu .
- The variance of the lognormal distribution helps describe how data points are dispersed around the mean of the natural logarithm of the data.
σ^2=(e^{σ^2}-1)e^{2μ+σ^2} 
Where:
- \sigma : represent standard deviation of the natural logarithm of the data.
- \mu : mean of the natural logarithm of the data.
- e: mathematical constant, approximately equal to 2.71828.
Examples of Lognormal Distribution
Example 1: The daily website visitors of a small blog follow a lognormal distribution where the underlying normal distribution (of ln X) has mean 
Solution:
To find the variance 
Var(X)=(e^{σ^2}-1)e^{2μ+σ^2} 
Accordng to the given information, we have:
- μ = 3.91
- σ = 0.1
putting these values in the formula we get,
Var(X)=(e^{0.1^2}-1)·e^{2(3.91)+0.1^2} Var(X)=(e^{0.01}-1)·e^{(2(3.91)+0.01)} Var(X)=(1.01005-1)·e^{7.83} {Var}(X)= 0.01005 \times 2520.5\approx 25.33 
The variance of daily website visitors is approximately 25.33
Example 2: The population of a village follows a lognormal distribution with a median population of 1,000 and a geometric standard deviation of 1.2. Calculate the mean (average) population of the village.
Solution:
For a lognormal distribution, the parameters μ and σ (of the underlying normal distribution of ln X) are derived from the median and geometric standard deviation as follows:
\mu=ln(median)=ln(1000)=6.908 \sigma=ln(geometric standard deviation)=ln(1.2)=0.182 
To find the mean E(X), we use the formula for the mean of a lognormal distribution:
E(X)=e^{μ}⋅\ e^{\frac{σ^2}{2}} 
Putting these values in the formula, we get:
E(X)=e^{6.908}⋅\ e^{\frac{0.182^2}{2}} E(X)=e^{6.908+0.01656} E(X)=e^{6.9246}\approx 1016.7 
The mean population of the village is approximately 1,016.7.
Applications
- Stock Prices and Asset Returns: Widely used in finance to model stock prices and asset returns, which often exhibit right-skewed patterns and cannot fall below zero.
- Income Distribution: Used in economics to model income distribution across populations, helping analysts understand how income is spread across different groups.
- Resource Reserves: Applied in mining and petroleum industries to model the distribution of natural resource reserves, such as oil, gas and mineral deposits.
- Online Reading and Engagement Time: The time users spend reading articles or engaging with online content often follows a lognormal distribution, useful for content creators and marketers.
- Social Media Comment Length: The length of comments on social media platforms can be modeled using a lognormal distribution, aiding content moderation and engagement analysis.
- Task Completion Times: Time taken to complete certain tasks, such as solving a Rubik's Cube, often follows a lognormal distribution, useful for performance analysis and prediction.
Difference Between Normal Distribution and Lognormal Distribution
Here we compare Normal Distribution and Lognormal Distribution
| Characteristic | Normal Distribution | Lognormal Distribution | 
|---|---|---|
| Shape | Symmetrical | Right-skewed | 
| Range of Values | From negative to positive | From zero to positive | 
| Parameter Interpretation | Mean (μ) and Standard Deviation (σ) | Mean of ln(x) (μ) and Standard Deviation of ln(x) (σ) | 
| Data Transformation | Not transformed | Natural logarithm transformation of data | 
| Applications | Common in many natural phenomena such as heights, weights, IQ scores | Used for data with positive values that exhibit right-skewed patterns, like income, stock prices and resource reserves | 
| Real-life Examples | Heights, weights, IQ scores | Stock returns, resource reserves, income distribution | 
| Probability Density Function | Symmetrical bell-shaped curve | Right-skewed, starts from zero and rises to a peak | 
| Mean and Variance | Define the central tendency and spread of data | Define the central tendency and spread of the natural logarithm of the data | 
| Common Parameter Values | μ (mean) and σ (standard deviation) | μ and σ represent parameters of the natural logarithm of the data |
