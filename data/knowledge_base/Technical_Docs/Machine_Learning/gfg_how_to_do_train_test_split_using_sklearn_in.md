# How To Do Train Test Split Using Sklearn In Python

> Source: https://www.geeksforgeeks.org/machine-learning/how-to-do-train-test-split-using-sklearn-in-python/

In this article, let's learn how to do a train test split using Sklearn in Python.
Train Test Split Using Sklearn
The train_test_split() method is used to split our data into train and test sets.
First, we need to divide our data into features (X) and labels (y). The dataframe gets divided into X_train,X_test , y_train and y_test. X_train and y_train sets are used for training and fitting the model. The X_test and y_test sets are used for testing the model if it's predicting the right outputs/labels. we can explicitly test the size of the train and test sets. It is suggested to keep our train sets larger than the test sets.
Train set: The training dataset is a set of data that was utilized to fit the model. The dataset on which the model is trained. This data is seen and learned by the model.
Test set: The test dataset is a subset of the training dataset that is utilized to give an accurate evaluation of a final model fit.
validation set: A validation dataset is a sample of data from your model's training set that is used to estimate model performance while tuning the model's hyperparameters.
by default, 25% of our data is test set and 75% data goes into training tests.
Syntax: sklearn.model_selection.train_test_split()
parameters:
- *arrays: sequence of indexables. Lists, numpy arrays, scipy-sparse matrices, and pandas dataframes are all valid inputs.
- test_size: int or float, by default None. If float, it should be between 0.0 and 1.0 and represent the percentage of the dataset to test split. If int is used, it refers to the total number of test samples. If the value is None, the complement of the train size is used. It will be set to 0.25 if train size is also None.
- train_size: int or float, by default None.
- random_state : int,by default None. Controls how the data is shuffled before the split is implemented. For repeatable output across several function calls, pass an int.
- shuffle: boolean object , by default True. Whether or not the data should be shuffled before splitting. Stratify must be None if shuffle=False.
- stratify: array-like object , by default it is None. If None is selected, the data is stratified using these as class labels.
returns: splitting: list
Example 1:
The numpy, pandas, and scikit-learn packages are imported. The CSV file is imported. X contains the features and y is the labels. we split the dataframe into X and y and perform train test split on them. random_state acts like a numpy seed, it is used for data reproducibility. test_size is given as 0.25 , it means 25% of our data goes into our test size. 1-test_size is our train size, we don't need to specify that. shuffle =True, shuffles our data before spilling. The X_train and X_test sets are used to fit and train our model and the test sets are used for testing and validating.
To access the CSV file click here.
# import packages
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
# importing data
df = pd.read_csv('headbrain1.csv')
# head of the data
print(df.head())
X= df['Head Size(cm^3)']
y=df['Brain Weight(grams)']
# using the train test split function
X_train, X_test,
y_train, y_test = train_test_split(X,y ,
                                   random_state=104, 
                                   test_size=0.25, 
                                   shuffle=True)
# printing out train and test sets
print('X_train : ')
print(X_train.head())
print('')
print('X_test : ')
print(X_test.head())
print('')
print('y_train : ')
print(y_train.head())
print('')
print('y_test : ')
print(y_test.head())
Output:
   Head Size(cm^3)  Brain Weight(grams)
0             4512                 1530
1             3738                 1297
2             4261                 1335
3             3777                 1282
4             4177                 1590
X_train : 
99     3478
52     4270
184    3479
139    3171
107    3399
Name: Head Size(cm^3), dtype: int64
(177,)
X_test : 
66     3415
113    3594
135    3436
227    4204
68     4430
Name: Head Size(cm^3), dtype: int64
(60,)
y_train : 
99     1270
52     1335
184    1160
139    1127
107    1226
Name: Brain Weight(grams), dtype: int64
(177,)
y_test : 
66     1310
113    1290
135    1235
227    1380
68     1510
Name: Brain Weight(grams), dtype: int64
(60,)
Example 2:
In this example, the same steps are followed, instead of specifying the test_size we specify the train_size. test_size is 1-train_size. 80% of the data is train set, so 20% of our data is our test set. If we don't specify the sizes of test and train sets by default test_size will be 0.25. X_train and y_train have the same shape and indexes, as y_train is the label for X_train features. same goes with X_test and y_test.
# import packages
import numpy as np
import pandas as pd
from sklearn.model_selection import train_test_split
# importing data
df = pd.read_csv('headbrain1.csv')
print(df.shape)
# head of the data
print(df.head())
X= df['Head Size(cm^3)']
y=df['Brain Weight(grams)']
# using the train test split function
X_train, X_test, y_train, 
y_test = train_test_split(X,y , 
                          random_state=104,
                          train_size=0.8, shuffle=True)
# printing out train and test sets
print('X_train : ')
print(X_train.head())
print(X_train.shape)
print('')
print('X_test : ')
print(X_test.head())
print(X_test.shape)
print('')
print('y_train : ')
print(y_train.head())
print(y_train.shape)
print('')
print('y_test : ')
print(y_test.head())
print(y_test.shape)
Output:
(237, 2)
   Head Size(cm^3)  Brain Weight(grams)
0             4512                 1530
1             3738                 1297
2             4261                 1335
3             3777                 1282
4             4177                 1590
X_train : 
110    3695
164    3497
58     3935
199    3297
182    4005
Name: Head Size(cm^3), dtype: int64
(189,)
X_test : 
66     3415
113    3594
135    3436
227    4204
68     4430
Name: Head Size(cm^3), dtype: int64
(48,)
y_train : 
110    1310
164    1280
58     1330
199    1220
182    1280
Name: Brain Weight(grams), dtype: int64
(189,)
y_test : 
66     1310
113    1290
135    1235
227    1380
68     1510
Name: Brain Weight(grams), dtype: int64
(48,)
