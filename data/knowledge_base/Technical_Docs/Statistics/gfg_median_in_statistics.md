# Median in Statistics

> Source: https://www.geeksforgeeks.org/maths/median

The median is the middle value of the dataset when arranged in ascending or descending order.
- If the dataset has an odd number of values, the median is the middle value.
- If the dataset has an even number of values, the median is the average of the two middle values.
Example: Suppose we have the heights of 5 friends as 167 cm, 169 cm, 171 cm, 174 cm, 179 cm. When arranged in order, the middle value is 171 cm, so the median height is 171 cm.
Median divides the data into two equal halves. It shows the middle point of a data set and gives a better idea of the “typical” value, especially when the data has very high or very low values.
Why is the median useful?
- Not affected by outliers (unlike mean).
- Shows the central position of data.
- Useful for skewed distributions (e.g., incomes, house prices).
- Helps in ranking and comparing data sets.
Various examples of the median are the following:
Example 1: Median salary of five friends, where the individual salary of each friend is,
- 74,000,
- 82,000,
- 75,000,
- 96,000,
- 88,000.
First arranged in ascending order 74,000, 75,000, 82,000, 88,000, and 96,000 then by observing the data we get the median salary as 82,000.
Example 2: Median Age of a Group- Consider a group of people's ages: 25, 30, 27, 22, 35, and 40.
First, arrange the ages in ascending order: 22, 25, 27, 30, 35, 40. The median age is the middle value, which is 30 in this case.
Median of Ungrouped Data
The median formula is calculated by two methods.
1. Median Formula (When n is Odd)
If the number of values (n value) in the data set is odd, then the formula to calculate the median is,
2. Median Formula (When n is Even)
If the number of values (n value) in the data set is even, then the formula to calculate the median is
Median of Grouped Data
Grouped data is the data where the class interval frequency and cumulative frequency of the data are given. The median of the grouped data is calculated using the formula,
\text{Median} = l + \left(\frac{\frac{n}{2} - cf}{f}\right) \times h 
where,
- l is the Lower Limit of the Median Class
- n is the Number of Observations
- f is Frequency of Median Class
- h is Class Size
- cf is the Cumulative Frequency of Class Preceding Median Class
Example: Find the Median of the following data.
If the marks scored by the students in a class test out of 50 are,
| Marks | 0-10 | 10-20 | 20-30 | 30-40 | 40-50 | 
|---|---|---|---|---|---|
| Number of Students | 5 | 8 | 6 | 6 | 5 | 
Solution:
For finding the Median we have to build a table with cumulative frequency as,
Marks 0-10 10-20 20-30 30-40 40-50 Number of Students 5 8 6 6 5 Cumulative Frequency 0+5 = 5 5+8 = 13 13+6 = 19 19+6 = 25 25+5 = 30 n = ∑fi = 5+8+6+6+5 = 30(even)
n/2 = 30/2 = 15
Median Class = 20-30
Now using the formula,
Median = l + [(n/2 – cf) / f]×h
Comparing with the given data we get,
- l = 20
- n = 30
- f = 6
- h = 10
- cf = 13
Median = 20 + [(15 - 13)/6] × 10
= 20 + (2/6) x 10
= 60/3 + 10/3
= 20 + 3.3333 = 23.33 (approx)
Thus, the median mark of the class test is 23.33
Steps to find Median
To find the median of the data, we can use the steps discussed below.
Step 1: Arrange the given data in ascending or descending order.
Step 2: Count the number of data values(n)
Step 3: Use the formula to find the median if n is even, or the median formula when n is odd, accordingly based on the value of n from step 2.
Step 4: Simplify to get the required median.
Example: Find the median of given data set 30, 40, 10, 20, and 50
Solution:
Median of the data 30, 40, 10, 20, and 50 is,
Step 1: Order the given data in ascending order as:
10, 20, 30, 40, 50
Step 2: Check if n (number of terms of data set) is even or odd and find the median of the data with respective ‘n’ value.
Step 3: Here, n = 5 (odd)
Median = [(n + 1)/2]th term
Median = [(5 + 1)/2]th term = 33r term = 30
Thus, the median is 30.
➢Practice: Solved Examples
