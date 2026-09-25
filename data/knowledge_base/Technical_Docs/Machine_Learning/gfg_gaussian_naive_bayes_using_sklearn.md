# Gaussian Naive Bayes using Sklearn

> Source: https://www.geeksforgeeks.org/machine-learning/gaussian-naive-bayes-using-sklearn/

In the world of machine learning, Gaussian Naive Bayes is a simple yet powerful algorithm used for classification tasks. It belongs to the Naive Bayes algorithm family, which uses Bayes' Theorem as its foundation. The goal of this post is to explain the Gaussian Naive Bayes classifier and offer a detailed implementation tutorial for Python users utilizing the Sklearn module.
A family of algorithms known as "naive Bayes classifiers" use the Bayes Theorem with the strong (naive) presumption that every feature in the dataset is unrelated to every other feature. Naive Bayes classifiers perform very well in a variety of real-world situations despite this simplicity. The Naive Bayes classifier is a probabilistic algorithm based on Bayes' theorem. It assumes that features are conditionally independent, given the class label. Despite its 'naive' assumption, Naive Bayes often performs well in various real-world scenarios.
Gaussian Naive Bayes
The probabilistic classification algorithm Gaussian Naive Bayes (GNB) is founded on the Bayes theorem. Given the class label, it is assumed that features follow a Gaussian distribution and are conditionally independent. For continuous data, GNB is especially helpful. The algorithm calculates the variance and mean of each feature for every class during training. During the prediction stage, it determines which class an instance is most likely to belong to by calculating the probability of each class. Text classification and spam filtering are just two of the many applications that can benefit from GNB's computational efficiency and ability to handle high-dimensional datasets.
Bayes’ Theorem
The Bayes Theorem allows us to calculate the probability of an event based on the likelihood of a previous occurrence. The theorem is expressed mathematically as:
P(A∣B)=\frac{P(B∣A)⋅P(A)}{P(B)} 
Where:
- ( P(A|B) ) is the probability of event A given that B is true.
- ( P(B|A) ) is the probability of event B given that A is true.
- ( P(A) ) and ( P(B) ) are the probabilities of observing A and B independently of each other.
The Gaussian Naive Bayes classifier is one of several algorithms available in machine learning that may be used to tackle a wide range of issues. This article uses the well-known Scikit-Learn package (Sklearn) to walk readers who are new to data science and machine learning through the basic ideas of Gaussian Naive Bayes. We will go over the fundamental ideas, important vocabulary, and useful examples to help you grasp.
Representation for Gaussian Naïve Bayes
Gaussian Naive Bayes (GNB) uses Gaussian (normal) distributions to represent the probability distribution of features within each class. Estimating the mean (μ) and variance (σ2 ) for every feature in every class is part of the representation for a dataset with m features and n classes.
Mathematically, the Gaussian distribution for a feature Xi in class  Cj is represented as follows:
Where,
- \mu_{c} is the mean feature X in class c.
- \sigma^2_c is the variance in class c.
Implementation of Gaussian Naive Bayes using Synthetic Dataset
Generating a Synthetic Dataset
We’ll start by creating a synthetic dataset suitable for classification. The make_classification function in Sklearn will be used to create a dataset with two features.
from sklearn.datasets import make_classification
import matplotlib.pyplot as plt
# Generate a synthetic dataset
X, y = make_classification(n_samples=100, n_features=2,
                           n_redundant=0, n_clusters_per_class=1,
                           random_state=42)
# Visualize the dataset
plt.scatter(X[:, 0], X[:, 1], c=y, cmap='viridis', edgecolor='k')
plt.title('Synthetic Dataset')
plt.xlabel('Feature 1')
plt.ylabel('Feature 2')
plt.show()
Output:
- The reason for our actions: To have a controlled environment where we know the precise attributes of the data, we create a synthetic dataset. This facilitates comprehension of the algorithm's behavior.
- How it works: To generate a dataset, we may define the amount of samples, features, and other parameters using the make_classification function.
- Gained outcome: The distribution of the synthetic dataset is displayed by a scatter plot, which uses various colors to represent the two classes of data.
Training the Gaussian Naive Bayes Model
Now, we’ll train the Gaussian Naive Bayes model using the synthetic dataset.
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
# Initialize the Gaussian Naive Bayes classifier
gnb = GaussianNB()
# Train the model
gnb.fit(X_train, y_train)
# Predict the labels for the test set
y_pred = gnb.predict(X_test)
# Calculate the accuracy
accuracy = accuracy_score(y_test, y_pred)
print(f'Accuracy: {accuracy}')
Output:
Accuracy: 0.9666666666666667
- The reason for our actions: Training the model allows us to learn the parameters that best fit our data.
- How it works: We use the train_test_split function to divide our data into training and testing sets. The GaussianNB class is used to initialize and train the model.
- Gained outcome: The accuracy score tells us how well our model performs on unseen data.
Implementation of Gaussian Naive Bayes on Census Income Dataset
Importing Libraries
import pandas as pd
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
The code performs Naive Bayes classification using scikit-learn and handles data using pandas. Labels are encoded, data is divided into training and testing sets, a Gaussian Naive Bayes classifier is trained, and the accuracy of the classifier is assessed.
Loading the Census Income Dataset
We’ll start by loading the Census Income dataset from the UCI Machine Learning Repository.
# Load the Census Income dataset
url = "https://archive.ics.uci.edu/ml/machine-learning-databases/adult/adult.data"
column_names = ['age', 'workclass', 'fnlwgt', 'education', 'education-num', 
                'marital-status', 'occupation','relationship', 'race', 
                'sex', 'capital-gain', 'capital-loss', 'hours-per-week',
                'native-country', 'income']
census_data = pd.read_csv(url, names=column_names)
# Display the first few rows of the dataset
print(census_data.head())
Output:
   age          workclass  fnlwgt   education  education-num  \
0 39 State-gov 77516 Bachelors 13
1 50 Self-emp-not-inc 83311 Bachelors 13
2 38 Private 215646 HS-grad 9
3 53 Private 234721 11th 7
4 28 Private 338409 Bachelors 13
marital-status occupation relationship race sex \
0 Never-married Adm-clerical Not-in-family White Male
1 Married-civ-spouse Exec-managerial Husband White Male
2 Divorced Handlers-cleaners Not-in-family White Male
3 Married-civ-spouse Handlers-cleaners Husband Black Male
4 Married-civ-spouse Prof-specialty Wife Black Female
capital-gain capital-loss hours-per-week native-country income
0 2174 0 40 United-States <=50K
1 0 0 13 United-States <=50K
2 0 0 40 United-States <=50K
3 0 0 40 United-States <=50K
4 0 0 40 Cuba <=50K
- The reason for our actions: The Census Income dataset contains a mix of continuous and categorical data, making it a good fit for Gaussian Naive Bayes after appropriate preprocessing.
- How it works: We use the pandas library to load the dataset from the URL into a DataFrame.
- Gained outcome: The first few rows of the dataset are displayed to give us an idea of the data structure.
Preprocessing the Data
Before we can train our model, we need to preprocess the data. This includes converting categorical variables into numerical values and normalizing the continuous variables.
from sklearn.preprocessing import LabelEncoder
# Convert categorical variables to numerical values
le = LabelEncoder()
categorical_features = ['workclass', 'education', 'marital-status',
                        'occupation', 'relationship', 'race', 'sex',
                        'native-country', 'income']
for feature in categorical_features:
    census_data[feature] = le.fit_transform(census_data[feature])
# Normalize continuous variables
census_data[
  ['age', 'fnlwgt', 'education-num', 'capital-gain', 
             'capital-loss', 'hours-per-week']] = census_data[
  ['age', 'fnlwgt','education-num', 'capital-gain', 'capital-loss',
   'hours-per-week']].apply(lambda x: (x - x.min()) / (x.max() - x.min()))
# Display the preprocessed data
print(census_data.head())
Output:
        age  workclass    fnlwgt  education  education-num  marital-status  \
0 0.301370 7 0.044302 9 0.800000 4
1 0.452055 6 0.048238 9 0.800000 2
2 0.287671 4 0.138113 11 0.533333 0
3 0.493151 4 0.151068 1 0.400000 2
4 0.150685 4 0.221488 9 0.800000 2
occupation relationship race sex capital-gain capital-loss \
0 1 1 4 1 0.02174 0.0
1 4 0 4 1 0.00000 0.0
2 6 1 4 1 0.00000 0.0
3 6 0 2 1 0.00000 0.0
4 10 5 2 0 0.00000 0.0
hours-per-week native-country income
0 0.397959 39 0
1 0.122449 39 0
2 0.397959 39 0
3 0.397959 39 0
4 0.397959 5 0
- The reason for our actions: Preprocessing is essential to ensure that the model receives data in a format it can work with effectively.
- How it works: We use LabelEncoder to encode categorical features and normalization to scale continuous features.
- Gained outcome: The preprocessed data is now ready for training.
Training the Gaussian Naive Bayes Model
With our data preprocessed, we can now train the Gaussian Naive Bayes model.
from sklearn.model_selection import train_test_split
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score
# Extract features and labels
X = census_data.drop('income', axis=1)
y = census_data['income']
# Split the dataset into training and testing sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
# Initialize the Gaussian Naive Bayes classifier
gnb = GaussianNB()
# Train the model
gnb.fit(X_train, y_train)
# Predict the labels for the test set
y_pred = gnb.predict(X_test)
# Calculate the accuracy
accuracy = accuracy_score(y_test, y_pred)
print(f'Accuracy: {accuracy}')
Output:
Accuracy: 0.8086805200122837
- The reason for our actions: Training the model allows us to learn the parameters that best fit our data.
- How it works: We use the train_test_split function to divide our data into training and testing sets. The GaussianNB class is used to initialize and train the model.
- Gained outcome: The accuracy score tells us how well our model performs on unseen data.
This example shows how to use the Census Income dataset to apply Gaussian Naive Bayes. You may use this approach to forecast income levels based on employment and demographic characteristics by following these steps.
Conclusion
In this article, we've introduced the Gaussian Naive Bayes classifier and demonstrated its implementation using Scikit-Learn. Understanding the basics of this algorithm, key terminologies, and following the provided steps will empower you to apply Gaussian Naive Bayes to your own projects. As you continue your journey into machine learning, this knowledge will serve as a valuable foundation for more advanced concepts and techniques.
