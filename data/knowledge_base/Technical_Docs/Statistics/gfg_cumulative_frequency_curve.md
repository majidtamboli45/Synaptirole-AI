# Cumulative Frequency Curve

> Source: https://www.geeksforgeeks.org/maths/cumulative-frequency-curve

Cumulative frequency is the running total of the frequencies in a frequency distribution. It is obtained by adding the frequency of the current class to the frequencies of all preceding classes.
A Cumulative Frequency Curve, also called an Ogive, is the graphical representation of cumulative frequencies.
| Class Interval | Frequency | Cumulative Frequency | 
|---|---|---|
| 0–10 | 2 | 2 | 
| 10–20 | 4 | 2 + 4 = 6 | 
| 20–30 | 5 | 2 + 4 + 5 = 11 | 
So, the cumulative frequencies are 2, 6, and 11.
Types of Cumulative Frequency Curves
There are two types of ogives:
1. Less Than Ogive
In a less-than ogive, cumulative frequencies are obtained by adding the frequencies from the beginning up to the current class.
Example:
| Class Interval | Frequency | Less Than CF | Upper Limit | 
|---|---|---|---|
| 5–10 | 2 | 2 | 10 | 
| 10–15 | 4 | 6 | 15 | 
| 15–20 | 5 | 11 | 20 | 
Steps to Draw
- Calculate less than cumulative frequencies.
- Take upper class limits on the x-axis.
- Take cumulative frequencies on the y-axis.
- Plot the points.
- Join them smoothly to obtain the Less Than Ogive.
Finding Median
- Let total frequency be N.
- Find N/2.
- Mark N/2 on the y-axis.
- Draw a horizontal line to the curve.
- From the intersection point, draw a perpendicular to the x-axis.
- The corresponding x-value gives the median.
2. More Than Ogive
In a more than ogive, cumulative frequencies are obtained from the highest class downward.
Example:
| Class Interval | Frequency | More Than CF | Lower Limit | 
|---|---|---|---|
| 5–10 | 20 | 20 | 5 | 
| 10–15 | 4 | 16 | 10 | 
| 15–20 | 5 | 11 | 15 | 
Steps to Draw
- Calculate more than cumulative frequencies.
- Take lower class limits on the x-axis.
- Take cumulative frequencies on the y-axis.
- Plot the points.
- Join them smoothly to obtain the More Than Ogive.
Finding Median
When both less-than and more-than ogives are drawn on the same graph:
- Let the curves intersect at point P.
- Draw a perpendicular from P to the x-axis.
- The corresponding x-value gives the median.
Solved Problems
Question 1. Following is the age distribution of group students. Now, draw the cumulative frequency curve of less than type and find the median value.
| Age (in years) | Frequency | 
|---|---|
| 4-5 | 36 | 
| 5-6 | 42 | 
| 6-7 | 52 | 
| 7-8 | 60 | 
| 8-9 | 68 | 
| 9-10 | 84 | 
| 10-11 | 96 | 
| 11-12 | 82 | 
| 12-13 | 66 | 
| 13-14 | 48 | 
| 14-15 | 50 | 
| 15-16 | 16 | 
Solution:
For the given table, we have to prepare the more than series as shown below:
Age (in years)
c.f.
Less than 5
36
Less than 6
78
Less than 7
130
Less than 8
190
Less than 9
258
Less than 10
342
Less than 11
438
Less than 12
520
Less than 13
586
Less than 14
634
Less than 15
684
Less than 16
700
On a graph paper, take the scale
Along the x-axis: 5 small div. = 1.
Along the y-axis: 1 small div. = 10.
And, plot all the points A(5, 36), B(6, 78), C(7, 130), D(8, 190), E(9, 258), F(10, 342), G(11, 438),
H(12, 520), I(13, 586), J(14, 634), K(15, 684) and L(16, 700).
Join these points successively with a freehand, we will get the cumulative frequency curve or an ogive.
Here, N = 700 ⇒ N/2 = 350
Take a point P(0, 350) on the y-axis and draw PQ|| x-axis, meeting the curve at Q. Draw QM 1 x-axis, intersecting x-axis at M. Then, OM = 10 units.
Hence, median = 10.
Question 2. For the given frequency distribution, draw a cumulative frequency graph of more than type and find the median value.
| Class Interval | 0-10 | 10-20 | 20-30 | 30-40 | 40-50 | 50-60 | 60-70 | 
|---|---|---|---|---|---|---|---|
| Frequency | 5 | 15 | 20 | 23 | 17 | 11 | 9 | 
Solution:
For the given table, we have to prepare the more than series as shown below:
More than 60
9
More than 50
20
More than 40
37
More than 30
60
More than 20
80
More than 10
95
More than 5
100
Scale: Along the x-axis, 10 small div. = 5.
Along the y-axis, 1 small div.= 1.
Plot all the points A(5, 100), B(10, 95), C(20, 80), D(30, 60), E(40, 37), F(50, 20) and G(60, 9).
Join AB, BC, CD, DE, EF and FG with a freehand, and we will get the required curve, as shown in below figure.
Here, N = 100
⇒ N/2 = 50
From P(0, 50) draw PQ || x-axis, meeting the curve at Q. Draw QM ⊥ OZ, meeting x-axis at M. Clearly, OM = 35 units
Hence, median = 35.
Question 3. The following table gives the production yield of rice of 100 farms of a village:
| Production (kg/hectare) | 40-45 | 45-50 | 50-55 | 55-60 | 60-65 | 65-70 | 
|---|---|---|---|---|---|---|
| Number of farms | 4 | 6 | 16 | 20 | 30 | 24 | 
Draw a cumulative frequency graph of more than type.
Solution:
For the given table, we have to prepare the more than series as shown below:
More than 65
24
More than 60
54
More than 55
74
More than 50
90
More than 45
96
More than 40
100
Scale: Along the x-axis, 1 small div.= 1
Along the y-axis, 1 small div. = 1
On a graph paper, plot all the points A(40, 100), B(45, 96), C(50, 90), D(55, 74), E(60, 54) and F(65, 24).
Join AB, BC, CD, DE and EF with a free hand, and we will get a More Than Ogive.
Question 4. During the medical checkup of 35 students of a college, their weights were recorded as follows:
| Weight (in kg) | 38-40 | 40-42 | 42-44 | 44-46 | 46-48 | 48-50 | 50-52 | 
|---|---|---|---|---|---|---|---|
| No. of Students | 3 | 2 | 4 | 5 | 14 | 4 | 3 | 
Draw a less-than and a more-than type ogive from the given data. Hence, find the median weight from the graph.
Solution:
(i) Less than Series:
For the given table, we have to prepare the less than series as shown below:
Weight (in kg)
Number of Students
Less than 40
3
Less than 42
5
Less than 44
9
Less than 46
14
Less than 48
28
Less than 50
32
Less than 52
35
Scale: Along the x-axis, 5 small div. = 1 kg.
Along the y-axis, 10 small div.= 5 kg.
Plot all the points A(40, 3), B(42, 5), C(44, 9), D(46, 14), E(48, 28), F(50, 32) and G(52, 35).
Join AB, BC, CD, DE, EF and FG with a free hand to get the curve 'Less Than Series'.
(ii) More than Series:
For the given table, we have to prepare the more than series as shown below:
Weight (in kg)
Number of Students
More than 38
35
More than 40
32
More than 42
30
More than 44
26
More than 46
21
More than 48
7
More than 50
3
Now plot the points on the same graph: P(38,35), Q(40, 32), R(42, 30), S(44, 26), T(46, 21), U(48, 7) and V(50,3)
and join PQ, QR, RS, ST, TU and UV with a free hand to get 'More Than Series'.
The two curves intersect at the point L. Draw LM ⊥ OX.
Hence, median weight = OM = 46.5 kg.
Practice Problems
- Draw a less-than cumulative frequency graph for the following data and find the median:Class Interval Frequency 10-20 8 20-30 12 30-40 15 40-50 10
- Create a cumulative frequency table and graph for the following data:Class Interval Frequency 0-5 7 5-10 13 10-15 15
- For the age distribution of students in a class, create a less-than cumulative frequency graph.
- Construct a cumulative frequency curve for the given weight distribution of 50 students.
- Draw both less-than- and more-than cumulative frequency curves for the following height distribution.
