# Squared Distributions

> Source: https://www.geeksforgeeks.org/data-science/chi-squared-distributions/

The Chi-Squared distribution (also chi-square or χ²-distribution) represents the distribution of the sum of the squares of k independent standard normal random variables. If Z1, Z2, . . ., Zk are independent standard normal random variables, the Chi-Squared variable is: 
The Chi-Squared distribution is parameterised by the degrees of freedom (df), which corresponds to the number of independent random variables being summed.
- The chi-square distribution is actually a series of distributions that vary in shape according to their degrees of freedom. As the degrees of freedom increase, the distribution becomes more symmetric and approaches a normal distribution.
- The chi-square test is a hypothesis test designed to test for a statistically significant relationship between nominal and ordinal variables organized in a bivariate table. In other words, it tells us whether two variables are independent of one another.
Probability Density function (PDF) of Chi-Squared Distribution
The PDF of a Chi-Squared distribution with k degrees of freedom is:
where Γ is the Gamma function.
Properties of Chi-Squared Distribution
Some of the common properties of Chi-Squared Distribution are discussed below:
Non-Negativity
The Chi-Squared distribution is defined only for non-negative values (
Degrees of Freedom
The shape of the Chi-Squared distribution depends on the number of degrees of freedom (k).
- For small k, the distribution is positively skewed.
- As k→∞ the distribution approaches a normal distribution (via the Central Limit Theorem).
Mean
The mean of the Chi-Squared distribution is equal to its degrees of freedom: Mean = k
Variance
The variance of the Chi-Squared distribution is twice its degrees of freedom: Variance = 2k
Standard Deviation (SD)
The standard deviation of the Chi-Squared distribution is the square root of the variance, so: 
Skewness
The skewness decreases as the degrees of freedom increase: Skewness = 
- For small k, the distribution is heavily skewed to the right.
- As k increases, the skewness approaches 0.
Kurtosis (Excess)
The kurtosis (excess) of the Chi-Squared distribution is: Excess Kurtosis = 12/k
- This shows that the distribution becomes less peaked as k increases.
Additive Property
If 
Moment-Generating Function (MGF)
The MGF of a Chi-Squared random variable with k degrees of freedom is: 
Chi-Square Distribution with 1 Degree of Freedom
The 
X = Z^2 \quad \text{follows a} \quad \chi^2(1) \text{ distribution.} 
Since squaring a standard normal variable always results in a non-negative value, the 
Chi-Squared Distributions in R Language
R is a popular high level programming language used for statistical analysis. It is open-source programming language as it has a huge community and users can contribute to the development as well. It has vast number of packages which allows the data miners to perform statistical analysis and data visualizations in an interactive manner.
R has 4 built in functions for chi-square distribution.
dchisq() function
The dchisq() function calculates the probability density of a chi-squared distribution. It can compute cumulative probabilities with lower.tail = TRUE for the left tail or lower.tail = FALSE for the right tail.
Syntax:
dchisq (x, df, ncp = 0, log= FALSE)
where x= vector of quantiles.
p= vector of probabilities.
n= number of observations 
df= degrees of freedam
ncp= non-centrality parameter (non-negative).
log.p– logical; if TRUE, probabilities p are given as log(p).
lower.tail= this is a logical value, if TRUE (default),probabilities are 
P[X \leq x] , otherwise P[X>x].
pchisq() function
The pchisq() function gives the cumulative distribution function (CDF) for the chi-squared distribution. The dchisq(x, df) function calculates the probability density of a chi-squared distribution for a value x with df degrees of freedom. It can also be used to determine the area under the chi-squared curve for specified intervals with a given number of degrees of freedom.
Syntax:
pchisq(q, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
qchisq() function
The qchisq() function returns the quantile function for the chi-squared distribution. When the non-centrality parameter (ncp) is set to 0, it computes for the central chi-squared distribution. This method gives the value of x at the qth percentile, where lower.tail = TRUE corresponds to the cumulative probability up to x.
syntax:
qchisq(p, df, ncp = 0, lower.tail = TRUE, log.p = FALSE)
rchisq() function:
The rchisq(n, df) function generates n random numbers from the chi-square distribution with df degrees of freedom. It is used to produce random deviates from the chi-square distribution.
Syntax:
rchisq (n, df, ncp = 0)
read more about Chi-Squared Distributions in R.
Chi-squared Distributions
Non-Central Chi-Square distribution
The non-central chi-square distribution is a generalization of the chi-square distribution, often used in power analyses. It introduces an additional parameter, λ known as the non-central parameter. This parameter shifts the distribution's peak to the right and increases the variance as λ increases.
The λ parameter influences the mean of the normal distributions that make up the chi-square distribution. For instance, a non-central chi-square distribution with λ=2 and k=3 can be generated by squaring and summing values from three normal distributions, each with a mean of 2 and a variance of 1.
Generalized Chi-squared Distribution
The Generalized Chi-squared Distribution is a more flexible version of the standard Chi-squared distribution. It's based on a mathematical expression called a quadratic form, which looks like z′Az.
Here’s what each part means:
- z is a vector of random variables that follow a Gaussian distribution (i.e., they are normally distributed) with a mean of zero.
- A is a matrix that helps define how the variables in z are related to each other (i.e., it defines their covariance or how they vary together).
- z′Az represents a mathematical operation where you multiply the vector z by the matrix A and then by the vector z again. This produces a single number, which is the value from the distribution.
In simpler terms, the generalized chi-squared distribution describes how a set of correlated normal variables behave when combined in a specific way. This allows for more complex scenarios than the basic chi-squared distribution.
Read More,
