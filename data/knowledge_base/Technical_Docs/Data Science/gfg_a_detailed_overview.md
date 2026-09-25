# A Detailed Overview

> Source: https://www.geeksforgeeks.org/data-science/paired-t-test-a-detailed-overview/

Student’s t-test or t-test is the statistical method used to determine if there is a difference between the means of two samples. The test is often performed to find out if there is any sampling error or unlikeliness in the experiment. This t-test is further divided into 3 types based on your data and result need. The types are:
- One sample t-test: here the mean of a single population is compared against the known mean.
- Independent sample t-test: here the mean of two different populations is compared
- Paired sample t-test: here the mean of the same group or population is at separate times.
In this article we will be giving an overview of the paired t-test:
What is Paired t-test?
A paired t-test helps the data analytics to compare two means that are taken from the same data set to determine if the difference is zero. In the statistical procedure of Paired t-test also known as dependent sample t-test every data set say individual, unit or object is measured twice consequential providing the pairs of observation for paired t-Test. In simple words, this test is used to find if the mean of the dependent variable is the same in two same or related groups. For example: measuring the weight of a person before and after breakfast.
How does it work?
To conduct a paired t-test its essential for you to obey the following assumptions of paired t-test:
- The dependent variable for data should be continuous (must be divided into intervals or ratio level or intervals)
- The observation must be independent of each other that is a random sample of data should be done.
- The paired t-test can be only implemented to related sample or groups. The subject must be the same for each sample or group.
- The dependent variable data used in a paired t-test must be free from outliers.
- The dependent variable should be normally (approximately) distributed.
Following the assumptions will help you find a more reliable result.
Paired t-test formula:
Before jumping into the formula for paired t-test you must understand the hypotheses followed for this test. There are two competing hypotheses for paired t-test the null hypothesis and the alternative hypothesis.
The null hypothesis assumes the difference between the means of paired samples is equal to zero. On the contrary, the alternative hypothesis assumes the mean difference between the paired samples is not equal to zero. The alternative hypothesis further has an extension based on the low or high tail result.
The hypothesis can be represented as:
Null Hypothesis, H0: u1 = u2 or H0: u1 –u2 = 0
Alternative hypothesis, H1: u1 is not equal to u2 or H1: u1 – u2 is not equal to zero.
Here,
- U1 is the mean of variable 1
- U2 is the mean of variable 2 in the population
The Paired t-test can be calculated as follows:
t = m/(s/√n)
Where:
- m = mean
- s = standard deviation of the difference (d)
- n = size of d.
You can use Paired t-test calculator to get a quick result. Look for an online t-test calculator that offers you step-by-step solution while offing assured accurate result.
Paired test v/s unpaired t-test
The paired t-test is used to find if there is any significant difference between the means of two dependent samples in the population. On the other hand, the unpaired t-test ( one sample and Independent sample t-test) are used to determine if there is any significant mean difference between the two independent samples.
In the case of the paired sample, the relationship between the groups exists as the sample are taken from the same group under different seniors whereas the independent sample t-test compares the mean of two unrelated groups.
In paired t-test, the variance is assumed not to be equal and the null hypothesis is implemented while in the case of on paired t-test the variance between the samples is assumed to be equal.
FAQ:
Where you can implement paired t-test?
The paired t-test is often used to confirm the quality or impact of a product in the industrial or product field. It is used to test the same group twice after intervals. Some example that explains where you can use the Paired t-test in the real world is:
- Testing the quality of food product when freshly baked and then after a month.
- The testing immediate effect of a newly made drug on a group of people and then long term effect of the same group.
- Testing the pulse rate of a group before and after a marathon.
Which t-test you should use paired or unpaired?
If you follow the t-test assumption and instruction careful it will not be difficult to pick the right t-test for your data. Keep the data type in mind one doesn’t have many options between the paired and unpaired t-test implementation. For paired t-test, you must have a natural pair, created a matching pair or repeated measure.
