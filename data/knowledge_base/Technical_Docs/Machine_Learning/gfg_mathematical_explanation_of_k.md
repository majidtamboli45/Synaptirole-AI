# Mathematical explanation of K

> Source: https://www.geeksforgeeks.org/machine-learning/mathematical-explanation-of-k-nearest-neighbour/

KNN stands for K-nearest neighbour is a popular algorithm in Supervised Learning commonly used for classification tasks. It works by classifying data based on its similarity to neighboring data points. The core idea of KNN is straightforward when a new data point is introduced the algorithm finds its K nearest neighbors and assigns the most frequent class from these neighbors to the new point.
Working of K-Nearest Neighbour
KNN algorithm stores all available cases and classifies new data based on the majority class of its nearest neighbors. Value of K in KNN refers to the number of nearest neighbors to consider when performing classification.
K parameter is critical because:
- If K is too small, the model may be sensitive to noise in the dataset.
- If K is too large, the classification might be too generalized, and nuances in the data may be overlooked.
Distance between data points is measured using a distance metric, such as Euclidean distance, to find the nearest neighbors.
How do we choose K?
Choosing the right value for K is crucial:
- A commonly used rule of thumb is to select K ≈ sqrt(n), where n is the number of data points in the dataset.
- If n is even adjust K to be odd by adding or subtracting 1 to avoid ties in majority voting.
Let’s dive deeper into an example of KNN to make the concept clearer. Below is a data that includes age, gender and the class of sports people play.
| NAME | AGE | GENDER | CLASS OF SPORTS | 
| Ajay | 32 | 0 | Football | 
| Mark | 40 | 0 | Neither | 
| Sara | 16 | 1 | Cricket | 
| Zaira | 34 | 1 | Cricket | 
| Sachin | 55 | 0 | Neither | 
| Rahul | 40 | 0 | Cricket | 
| Pooja | 20 | 1 | Neither | 
| Smith | 15 | 0 | Cricket | 
| Laxmi | 55 | 1 | Football | 
| Michael | 15 | 0 | Football | 
Here male is denoted with numeric value 0 and female with 1. Let’s find in which class of people Angelina will lie whose k factor is 3 and age is 5. So we have to find out the distance using Euclidean distance formula:
  
To calculate the distance between Angelina and other individuals in the dataset:
Here, Angelina has:
- Age = 5
- Gender = 1 (female)
1. Distance between Angelina and Ajay (age = 32, gender = 0):
d = \sqrt{(5 - 32)^2 + (1 - 0)^2} = \sqrt{729 + 1} = \sqrt{730} = 27.02 
2. Distance between Angelina and Mark (age = 40, gender = 0):
d = \sqrt{(5 - 40)^2 + (1 - 0)^2} = \sqrt{1225 + 1} = \sqrt{1226} = 35.01 
3. Distance between Angelina and Sara (age = 16, gender = 1):
d = \sqrt{(5 - 16)^2 + (1 - 1)^2} = \sqrt{121 + 0} = \sqrt{121} = 11.00 
4. Distance between Angelina and Zaira (age = 34, gender = 1):
d = \sqrt{(5 - 34)^2 + (1 - 1)^2} = \sqrt{841 + 0} = \sqrt{841} = 29.00 
5. Distance between Angelina and Sachin (age = 55, gender = 0):
d = \sqrt{(5 - 55)^2 + (1 - 0)^2} = \sqrt{2500 + 1} = \sqrt{2501} = 50.01 
6. Distance between Angelina and Rahul (age = 40, gender = 0):
d = \sqrt{(5 - 40)^2 + (1 - 0)^2} = \sqrt{1225 + 1} = \sqrt{1226} = 35.01 
7. Distance between Angelina and Pooja (age = 20, gender = 1):
d = \sqrt{(5 - 20)^2 + (1 - 1)^2} = \sqrt{225 + 0} = \sqrt{225} = 15.00 
8. Distance between Angelina and Smith (age = 15, gender = 0):
d = \sqrt{(5 - 15)^2 + (1 - 0)^2} = \sqrt{100 + 1} = \sqrt{101} = 10.05 
9. Distance between Angelina and Laxmi (age = 55, gender = 1):
d = \sqrt{(5 - 55)^2 + (1 - 1)^2} = \sqrt{2500 + 0} = \sqrt{2500} = 50.00 
10. Distance between Angelina and Michael (age = 15, gender = 0):
d = \sqrt{(5 - 15)^2 + (1 - 0)^2} = \sqrt{100 + 1} = \sqrt{101} = 10.05 
| Distance between Angelina and | Distance | 
| Ajay | 27.02 | 
| Mark | 35.01 | 
| Sara | 11.00 | 
| Zaira | 29.00 | 
| Sachin | 50.01 | 
| Rahul | 35.01 | 
| Pooja | 15.00 | 
| Smith | 10.05 | 
| Laxmi | 50.00 | 
| Michael | 10.05 | 
K-Nearest Neighbors (K = 3): 3 nearest neighbors to Angelina are:
- Smith (Cricket)- 10.5
- Michael (Football)- 10.05
- Sara (Cricket)- 11
So according to KNN algorithm classifying based on Majority Vote, Angelina will be in the class of people who like cricket.
This example illustrates the working of KNN and how it classifies data based on the majority class of its nearest neighbors. By calculating the distance between data points, KNN helps in making predictions about new data. The importance of selecting the right value of K and handling categorical data appropriately (such as converting gender to numeric values) cannot be overstated in ensuring accurate classification results.
