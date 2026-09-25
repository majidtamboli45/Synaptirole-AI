# Probability Density Estimation & Maximum Likelihood Estimation

> Source: https://www.geeksforgeeks.org/machine-learning/probability-density-estimation-maximum-likelihood-estimation/

Probability density and maximum likelihood estimation (MLE) are key ideas in statistics that help us make sense of data.
Probability Density Function (PDF) tells us how likely different outcomes are for a continuous variable, while Maximum Likelihood Estimation helps us find the best-fitting model for the data we observe.
In this article, we will understand the concepts of probability density, PDF(probability density function), parametric density estimation, maximum likelihood estimation, etc. in detail.
What is Probability Density
Probability Density is a concept in probability theory that is used to describe the likelihood of a continuous random variable taking on a specific value within a given range. It is represented by a Probability Density Function (PDF), a mathematical function specifying how the probability of the variable is distributed across different values.
Assume a random variable x that has a probability distribution p(x). The relationship between the outcomes of a random variable and its probability is referred to as the Probability density.
Probability Density Function (PDF)
Probability Density Function (PDF) is a mathematical function that describes the likelihood of a continuous random variable from a sub-sample space falling within a particular range of values and not just one value. It tells the likelihood of the range of values in the random variable sub-space being the same as that of the whole sample. It provides a way to model and visualize how probability is distributed over a range of possible outcomes for a continuous variable.
By definition, if X is any continuous random variable, then the function f(x) is called a probability density function if:
P(a \leq X \leq b) = \int_{a}^{b}f(x)dx where,
a -> lower limit
b -> upper limit
X -> continuous random variable
f(x) -> probability density function
Steps Involved:
- Step 1 - Create a histogram for the random set of observations to understand the density of the random sample.
- Step 2 - Create the probability density function and fit it on the random sample. Observe how it fits the histogram plot.
- Step 3 - Now iterate steps 1 and 2 in the following manner:
  - Calculate the distribution parameters.
  - Calculate the Probability Density Function for the random sample distribution.
  - Observe the resulting Probability Density Function against the data.
  - Transform the data to until it best fits the distribution.
Most of the histogram of the different random sample after fitting should match the histogram plot of the whole population.
Density Estimation: It is the process of finding out the density of the whole population by examining a random sample of data from that population. One of the best ways to achieve a density estimate is by using a histogram plot.
Parametric Density Estimation
Parametric Density Estimation is a statistical technique used to estimate the probability distribution of a dataset by assuming that the data follows a specific distribution with a set of parameters.
A normal distribution has two given parameters, mean and standard deviation. We calculate the sample mean and standard deviation of the random sample taken from this population to estimate the density of the random sample. The reason it is termed as 'parametric' is due to the fact that the relation between the observations and its probability can be different based on the values of the two parameters.
Now, it is important to understand that the mean and standard deviation of this random sample is not going to be the same as that of the whole population due to its small size. A sample plot for parametric density estimation is shown below.
Non-parametric Density Estimation
Non-Parametric Density Estimation is a statistical method used to estimate the probability distribution of a dataset without assuming that the data follows any specific parametric distribution
In some cases, the Probability Density Function may not fit the random sample as it doesn't follow a normal distribution (i.e instead of one peak there are multiple peaks in the graph). Here, instead of using distribution parameters like mean and standard deviation, a particular algorithm is used to estimate the probability distribution. Thus, it is known as a 'nonparametric density estimation'.
One of the most common nonparametric approach is known as Kernel Density Estimation. In this, the objective is to calculate the unknown density fh(x) using the equation given below:
where,
K -> kernel (non-negative function)
h -> bandwidth (smoothing parameter, h > 0)
Kh -> scaled kernel 
fh(x) -> density (to calculate)
n -> no. of samples in random sample.
A sample plot for nonparametric density estimation is given below.
Problems with Probability Distribution Estimation
Probability Distribution Estimation relies on finding the best PDF and determining its parameters accurately. But the random data sample that we consider, is very small. Hence, it becomes very difficult to determine what parameters and what probability distribution function to use. To tackle this problem, Maximum Likelihood Estimation is used.
What is Maximum Likelihood Estimation?
Maximum Likelihood Estimation is a method of determining the parameters (mean, standard deviation, etc) of normally distributed random sample data or a method of finding the best fitting Probability Density Function over the random sample data. This is done by maximizing the likelihood function so that the PDF fitted over the random sample. Another way to look at it is that Maximum Likelihood Estimation function gives the mean, the standard deviation of the random sample is most similar to that of the whole sample.
NOTE: Maximum Likelihood Estimation assumes that all Probability Density Functions are a likely candidate to being the best fitting curve. Hence, it is computationally expensive method.
Intuition:
The above figure shows multiple attempts at fitting the Parametric Density Estimation bell curve over the random sample data. Red bell curves indicate poorly fitted Probability Density Function and the green bell curve shows the best fitting Parametric Density Estimation over the data. We obtained the optimum bell curve by checking the values in Maximum Likelihood Estimate plot corresponding to each Parametric Density Estimation.
As observed in Fig 1, the red plots poorly fit the normal distribution, hence their 'maximum likelihood estimate' is also lower. The green PDF curve has the maximum likelihood estimate as it fits the data perfectly. This is how the maximum likelihood estimate method works.
Mathematics Involved
In the intuition, we discussed the role that Likelihood value plays in determining the optimum PDF curve. Let us understand the math involved in Maximum Likelihood Estimation Method.
We calculate Likelihood based on conditional probabilities. See the equation given below.
where, 
L -> Likelihood value
F -> Probability distribution function
P -> Probability 
X1, X2, ... Xn -> random sample of size n taken from the whole population. 
x1, x2, ... xn -> values that these random sample (Xi) takes when determining the PDF.
Π -> product from 1 to n.
In the above-given equation, we are trying to determine the likelihood value by calculating the joint probability of each Xi taking a specific value xi involved in a particular PDF. Now, since we are looking for the maximum likelihood value, we differentiate the likelihood function w.r.t P and set it to 0 as given below.
This way, we can obtain the PDF curve that has the maximum likelihood of fit over the random sample data.
But, if you observe carefully, differentiating L w.r.t P is not an easy task as all the probabilities in the likelihood function is a product. Hence, the calculation becomes computationally expensive. To solve this, we take the log of the Likelihood function L.
Log Likelihood
Taking the log of likelihood function gives the same result as before due to the increasing nature of Log function. But now, it becomes less computational due to the property of logarithm: 
Thus, the equation becomes:
Now, we can easily differentiate log L wrt P and obtain the desired result. For any doubt/query, comment below.
Conclusion
Probability Density and Maximum Likelihood Estimation (MLE) are essential tools for effectively analyzing and interpreting continuous data. The Probability Density Function (PDF) offers a clear visualization of how data points are distributed, while maximum likelihood estimation provides a robust method for estimating the parameters that best describe that distribution. Together, these tools empower statisticians and data scientists to build accurate models, make informed predictions, and draw meaningful insights from complex datasets.
