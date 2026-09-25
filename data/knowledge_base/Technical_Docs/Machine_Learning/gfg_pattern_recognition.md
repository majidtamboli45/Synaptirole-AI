# Pattern Recognition

> Source: https://www.geeksforgeeks.org/machine-learning/pattern-recognition-introduction/

In this digital world, patterns can be found all around us. They can be seen physically in the colors of the clothing or the rhythm of the speech, or mathematically through the algorithms. In computer science, patterns are represented using vector feature values. And these patterns play an important role in understanding this world. Thus, the ability to identify these patterns becomes essential. This is where pattern recognition comes into play.
In this article, we will be familiarizing ourselves with the concept of pattern recognition. We will look for ways we can apply pattern recognition in our lives to solve our problems.
What is Pattern Recognition?
Pattern Recognition is the process of using machine learning algorithms to recognize patterns. It means sorting data into categories by analyzing the patterns present in the data. One of the main benefits of pattern recognition is that it can be used in many different areas.
In a typical pattern recognition application, the raw data is processed and converted into a form that a machine can use. Pattern recognition involves classifying and clustering patterns.
- Classification: Classification is when we teach a system to put things into categories. We do this by showing the system examples with known labels (like "apple" or "orange") so it can learn and label new things. This is part of supervised learning, where we give the system the answers to learn from.
- Clustering: Clustering is when the system groups similar things together without any labels. It looks at the data and tries to find natural groups. This is part of unsupervised learning, where the system learns by itself without knowing the answers beforehand.
Pattern recognition possesses the following features:
- A pattern recognition system should recognize familiar patterns quickly and accurately.
- Recognize and classify unfamiliar objects.
- Accurately recognize shapes and objects from different angles.
- Identify patterns and objects even when partly hidden.
Training and Learning in Pattern Recognition
Learning is a phenomenon through which a system gets trained and becomes adaptable to give accurate results. The entire dataset is divided into two categories, one of which is used in training the model, i.e., Training set, and the other that is used in testing the model after training, i.e., Testing set.
- Training set: The training set is used to build a model. It consists of a set of images that are used to train the system. Training rules and algorithms are used to give relevant information on how to associate input data with output decisions. Generally, 80% of the data in the dataset is taken for training data.
- Testing set: Testing data is used to test the system. It is the set of data that is used to verify whether the system is producing the correct output after being trained or not. Generally, 20% of the data in the dataset is used for testing.
Example of Pattern Recognition
While talking about various types of balls, a description of a ball is a pattern. In the case balls are considered as patterns, the classes could be football, cricket ball, table tennis ball, etc. Given a new pattern, the class of the pattern would be determined. The choice of features and representation of patterns is a very important step in pattern classification.
An obvious representation of a pattern will be a vector. Each element of the vector can represent one feature of the pattern. The first element of the vector will contain the value of the first feature for the pattern being considered.
While representing spherical objects, (25, 1) may be represented as a spherical object with 25 units of weight and 1 unit of diameter. The class label can form a part of the vector. If spherical objects belong to class 1, the vector would be (25, 1, 1), where the first element represents the weight of the object, the second element, the diameter of the object, and the third element represents the class of the object.
Advantages and Disadvantages of Pattern Recognition
| Advantages | Disadvantages | 
|---|---|
| Solves classification problems | Syntactic pattern recognition is complex and slow | 
| Detects fake biometrics | Requires a larger dataset for better accuracy | 
| Helps visually impaired recognize cloth patterns | Cannot explain why a particular object is recognized | 
| Assists in speaker diarization | May struggle with noisy or incomplete data | 
| Recognizes objects from different angles | Can be computationally expensive | 
| Useful in image and speech recognition | Performance depends on the quality of the training data | 
| Enhances decision-making through clustering | Requires careful feature selection and preprocessing | 
| Enables automation in various fields (e.g. medicine) | Difficult to adapt to completely new or unseen patterns | 
Applications of Pattern Recognition
| Application | Description | 
|---|---|
| Image Processing | Pattern recognition is used to give machines the ability to recognize human features in image processing. | 
| Computer Vision | Used to extract meaningful features from image/video samples for applications like biological and biomedical imaging. | 
| Seismic Analysis | Helps in discovering, imaging, and interpreting temporal patterns in seismic recordings. | 
| Radar Signal Classification | Used in radar signal classification for applications like AP mine detection and identification. | 
| Speech Recognition | Pattern recognition is used in speech recognition algorithms to handle larger units instead of phonemes. | 
| Fingerprint Identification | Widely used in biometric systems for fingerprint matching and identification. | 
| Medical Diagnosis | Pattern recognition is used to analyze medical images and assist in diagnosing diseases like cancer. | 
| Autonomous Vehicles | Applied in self-driving cars to recognize obstacles, road signs, and pedestrians for navigation. | 
Python Implementation for Pattern Recognition
Imagine we have a dataset containing information about apples and oranges. The features of each fruit are its color (red or yellow) and its shape (round or oval). We can represent each fruit using a list of strings, e.g,. ['red', 'round'] for a red, round fruit.
Our goal is to write a function that can predict whether a given fruit is an apple or an orange. To do this, we will use a simple pattern recognition algorithm called k-nearest neighbors (k-NN).
Importing Libraries
from collections import Counter
import math
Defining Functions
- Function to calculate Euclidean distance:
def euclidean_distance(fruit1, fruit2):
    color_map = {'red': 0, 'yellow': 1}
    shape_map = {'round': 0, 'oval': 1}
    
    fruit1_encoded = [color_map[fruit1[0]], shape_map[fruit1[1]]]
    fruit2_encoded = [color_map[fruit2[0]], shape_map[fruit2[1]]]
    
    return math.sqrt(sum((f1 - f2) ** 2 for f1, f2 in zip(fruit1_encoded, fruit2_encoded)))
- Function to find the nearest neighbour:
def find_nearest_neighbors(test_fruit, training_data, k=5):
    distances = []
    
    for fruit in training_data:
        distance = euclidean_distance(test_fruit, fruit[:-1])
        distances.append((distance, fruit))
    
    distances.sort(key=lambda x: x[0])
    nearest_neighbors = [neighbor[1] for neighbor in distances[:k]]
    
    return nearest_neighbors
- Function to make the prediction:
def predict(fruit):
    num_apples = sum([1 for f in training_data if f[-1] == 'apple'])
    num_oranges = sum([1 for f in training_data if f[-1] == 'orange'])
    nearest_neighbors = find_nearest_neighbors(fruit, training_data, k=3)
    
    num_apples_nn = sum([1 for nn in nearest_neighbors if nn[-1] == 'apple'])
    num_oranges_nn = sum([1 for nn in nearest_neighbors if nn[-1] == 'orange'])
    if num_apples_nn > num_oranges_nn:
        return 'apple'
    else:
        return 'orange'
Creating the training data
 
training_data = [
    ['red', 'round', 'apple'],
    ['red', 'oval', 'apple'],
    ['yellow', 'round', 'orange'],
    ['yellow', 'oval', 'orange']
]
Making the Predictions
test_fruit = ['red', 'round']
print(predict(test_fruit))
Output:
apple
