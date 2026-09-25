# Statistics Practice Questions (Basic)

> Source: https://www.geeksforgeeks.org/maths/statistics-practice-questions-basic

Statistics is the branch of mathematics that deals with collecting, organizing, analyzing, interpreting, and presenting data.
- It helps us make sense of complex data and draw meaningful conclusions for decision-making or predictions.
Question 1: If the marks scored by the students in a class test out of 50 are,
| Marks | 0-10 | 10-20 | 20-30 | 30-40 | 40-50 | 
|---|---|---|---|---|---|
| Number of Students | 5 | 8 | 9 | 6 | 3 | 
a) What is the class interval of 20 - 30 ?
b) How many students scored in the range of 20 - 40?
Solution:
a) Class interval  = Upper limit - Lower limit
      Class interval of 20-30  = 30 - 20 = 10
b) The number of students scored in range of 20 - 40 = frequency of class 20 - 30 + frequency of class 30 - 40
      The number of students scored in range of 20 - 40 = 9 + 6  = 15
Question 2: Calculate the average of the following numbers: 6, 8, 2, 3, 12, 14.
Solution:
Mean = Sum of all given observations/ Total number of observations
Total number of observations = 6
Mean = 6 + 8 + 2 + 3 + 12 + 14 / 6 = 45/6 = 7.5
Thus, the Mean of 6, 8, 2, 3, 12, 14 is 7.5
Question 3: Find the mean of the first 10 even numbers.
Solution:
Sum of first n even numbers = n × (n + 1)
Sum of first  10 even numbers = 10 × ( 10 + 1) = 10 × 11 = 110
Mean of first 10 even numbers = 110 / 10 = 11
Thus, the mean of first 10 even numbers is 11.
Questions 4: The following are the monthly salaries (in $1000s) of 15 employees in a company:
                         30, 45, 25, 35, 40, 50, 60, 55, 45, 50, 25, 35, 40, 45, 50.
                         Find the median salary.
Solution:
Sort the data: [25, 25, 30, 35, 35, 40, 40, 45, 45, 45, 50, 50, 50, 55, 60].
Total number of elements (N) = 15 (odd).
Median = 
\frac{N}{2}^{th}\ term = 45.
Question 5: The following table represents the marks obtained by students in a test. Find the median of the marks.
| Class Interval | Frequency | 
|---|---|
| 0–20 | 5 | 
| 20–40 | 8 | 
| 40–60 | 12 | 
| 60–80 | 15 | 
| 80–100 | 10 | 
Solution:
Calculate the cumulative frequency:
Class Interval Frequency Cumulative Frequency 0–20 5 5 20–40 8 13 40–60 12 25 60–80 15 40 80–100 10 50 Total frequency (N) = 50.
Median class = class where 
Median class = 40 – 60.
\frac{N}{2}^{th} observation\frac{50}{2} = 25 exists.
Median = 
L + \left( \frac{\frac{N}{2} - F}{f} \right) \cdot h Where:
L = 40 (lower boundary of the median class),
N=50 ( total number of observations ) 
F = 13 ( cumulative frequency before the median class ),
f = 12 (frequency of the median class),
h=20 (class width).
Substituting the values:
Median = 
Median = 
40 + \left( \frac{25 - 13}{12} \right) \cdot 20 40 + \left( \frac{12}{12} \right) \cdot 20 = 40 + 20 = 60 
Question 6: The following table shows the marks scored by students in a test. Calculate the mean using the assumed mean method.
| Class Interval | Frequency | 
|---|---|
| 10–20 | 5 | 
| 20–30 | 8 | 
| 30–40 | 12 | 
| 40–50 | 15 | 
| 50–60 | 10 | 
Solution:
Choose A=35 (assumed mean).
Calculate di = xi − A , where xi is the class midpoint.
Class Interval Frequency (fi) Midpoint (xi) di=xi − A fi⋅di 10–20 5 15 −20 −100 20–30 8 25 −10 −80 30–40 12 35 0 0 40–50 15 45 10 150 50–60 10 55 20 200 
- ∑fi = 50
- ∑fidi = 170
For assumed mean method :
Mean 
( \bar x) = A + \frac{\sum f_i \ d_i}{\sum f_i} Mean = 
35 + \frac{170}{50} = 35 + 3.4 = 38.4 
Question 7: The following table shows the daily wages of workers in a factory. Use the assumed mean method to calculate the mean daily wage.
| Wages (in ₹) | Frequency | 
|---|---|
| 50–60 | 6 | 
| 60–70 | 10 | 
| 70–80 | 20 | 
| 80–90 | 12 | 
| 90–100 | 8 | 
Solution:
Assume A = 75 (from the midpoint of the central class, 70–80).
Find the midpoints (xi):
Class Interval Frequency (fi) Midpoint (xi) di=xi−A fi⋅di 50–60 6 55 −20-20−20 −120-120−120 60–70 10 65 −10-10−10 −100-100−100 70–80 20 75 000 000 80–90 12 85 101010 120120120 90–100 8 95 202020 160160160 Apply the formula for the mean:
Mean =  
A + \frac{\sum f_i d_i}{\sum f_i} Substitute the values:
- ∑fi = 56
- ∑fidi=60
Mean = 
75 + \frac{60}{56}  = 75 + 1.07 = 76.07
Question 8: Find the mode of the following dataset representing the number of hours studied by students in a week:
                       6, 8, 9, 6, 7, 8, 6, 9, 7, 8, 8, 6, 7, 8, 9
Solution:
Organize the data and count the frequency of each value:
Hours Studied Frequency 6 4 7 3 8 5 9 3 Identify the mode:
The mode is the value with the highest frequency.
Mode = 8 (Frequency: 5)
Question 9: Find the mode for the following frequency distribution of students' marks:
| Marks Interval | Frequency | 
|---|---|
| 10–20 | 3 | 
| 20–30 | 7 | 
| 30–40 | 12 | 
| 40–50 | 18 | 
| 50–60 | 10 | 
| 60–70 | 5 | 
Solution:
Identify the modal class: The class with the highest frequency is 40–5040–5040–50, so it is the modal class.
Mode = 
L + \left( \frac{f_m - f_1}{2f_m - f_1 - f_2} \right) \cdot h Where:
- L = 40 (lower boundary of the modal class),
- fm = 18 (frequency of the modal class),
- f1 = 12 (frequency of the class before modal class),
- f2 = 10 (frequency of the class after modal class),
- h=10 (class width).
Mode = 
40 + \left( \frac{18 - 12}{2(18) - 12 - 10} \right) \cdot 10 Mode = 
40 + \left( \frac{6}{36 - 22} \right) \cdot 10 Mode = 
40 + \left( \frac{6}{14} \right) \cdot 10 Mode = 40 + 4.29 = 44.29
Question 10: A dataset is positively skewed. If the mode is 40 and the median is 45, find the mean using the relationship between mean, median, and mode.
Solution:
Using the formula: Mode = 3(Median) − 2(Mean)
Mode = 3(45)−2(40)= 135 − 80 = 55
Practice Questions
Question 1: The following table represents the heights (in cm) of a group of students:
| Height (cm) | Frequency | 
|---|---|
| 140–150 | 5 | 
| 150–160 | 12 | 
| 160–170 | 8 | 
| 170–180 | 10 | 
Find the class width of the intervals.
Question 2: Given the following raw data:
                      35, 40, 42, 45, 50, 52, 55, 60, 65, 68, 70, 72
                      Find the frequency of the values ranging from 40 to 60. 
Question 3: The following data represents the marks scored by students in a test:
| Marks Interval | Frequency | 
|---|---|
| 10–20 | 5 | 
| 20–30 | 7 | 
| 30–40 | 8 | 
| 40–50 | 10 | 
| 50–60 | 5 | 
Calculate the mean using the direct method.
Question 4: The wages of workers in a factory are shown below. Use the assumed mean method to calculate the mean wage:
| Wages ( ₹) | Frequency | 
|---|---|
| 200–300 | 6 | 
| 300–400 | 8 | 
| 400–500 | 15 | 
| 500–600 | 10 | 
| 600–700 | 5 | 
Question 5: The following data represents the monthly expenses (in $) of 12 families: 450, 500, 550, 600, 620, 700, 720, 750, 800, 850, 900, 950. Find the median of the dataset.
Question 6: The table below shows the marks obtained by students in a class:
| Marks Interval | Frequency | 
|---|---|
| 10–20 | 4 | 
| 20–30 | 8 | 
| 30–40 | 10 | 
| 40–50 | 15 | 
| 50–60 | 12 | 
Find the mode using the formula for grouped data.
Question 7: The following table represents the number of hours students spent studying:
| Hours Studied | Frequency | 
|---|---|
| 0–2 | 4 | 
| 2–4 | 6 | 
| 4–6 | 10 | 
| 6–8 | 8 | 
| 8–10 | 5 | 
Find the median using the formula for grouped data.
Question 8: The following dataset represents the number of books borrowed by students in a week: 2, 3, 5, 3, 4, 3, 2, 5, 3, 2, 4, 5, 3, 3, 4. Find the mode of the dataset.
Question 9: The mean and median of a dataset are given as 25 and 22, respectively. Use the relationship between mean, median, and mode to calculate the mode.
Question 10: Given the frequency distribution below, answer the following questions:
- a) What is the total frequency?
- b) Identify the modal class.
- c) Calculate the median class.
| Class Interval | Frequency | 
|---|---|
| 0–10 | 6 | 
| 10–20 | 12 | 
| 20–30 | 18 | 
| 30–40 | 14 | 
| 40–50 | 10 | 
Answer key
- 10
- 7
- 35.86
- 450
- 710
- 46.25
- 5.3
- 3
- 16
- a) 60
b) 20-30
c) 30-40
