# Nearest Neighbors from Scratch using Python

> Source: https://www.geeksforgeeks.org/machine-learning/implementation-of-k-nearest-neighbors-from-scratch-using-python/

Instance-Based Learning
K Nearest Neighbors Classification is one of the classification techniques based on instance-based learning. Models based on instance-based learning to generalize beyond the training examples. To do so, they store the training examples first. When it encounters a new instance (or test example), then they instantly build a relationship between stored training examples and this new instant to assign a target function value for this new instance. Instance-based methods are sometimes called lazy learning methods because they postponed learning until the new instance is encountered for prediction.
Instead of estimating the hypothetical function (or target function) once for the entire space, these methods will estimate it locally and differently for each new instance to be predicted.
K-Nearest Neighbors Classifier Learning
Basic Assumption:
- All instances correspond to points in the n-dimensional space where n represents the number of features in any instance.
- The nearest neighbors of an instance are defined in terms of the Euclidean distance.
An instance can be represented by < x1, x2, .............., xn >.
Euclidean distance between two instances xa and xb is given by d( xa, xb ) :
How does it work?
K-Nearest Neighbors Classifier first stores the training examples. During prediction, when it encounters a new instance (or test example) to predict, it finds the K number of training instances nearest to this new instance. Then assigns the most common class among the K-Nearest training instances to this test instance.
The optimal choice for K is by validating errors on test data. K can also be chosen by the square root of m, where m is the number of examples in the dataset.
In the above figure, "+" denotes training instances labelled with 1. "-" denotes training instances with 0. Here we classified for the test instance xt as the most common class among K-Nearest training instances to it. Here we choose K = 3, so xt is classified as "-" or 0.
Pseudocode:
- Store all training examples.
- Repeat steps 3, 4, and 5 for each test example.
- Find the K number of training examples nearest to the current test example.
- y_pred for current test example = most common class among K-Nearest training instances.
- Go to step 2.
Implementation:
Diabetes Dataset used in this implementation can be downloaded from link.
It has 8 features columns like i.e "Age", "Glucose" e.t.c, and the target variable “Outcome” for 108 patients. So in this, we will create a link Neighbors Classifier model to predict the presence of diabetes or not for patients with such information.
# Importing libraries
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from scipy.stats import mode
from sklearn.neighbors import KNeighborsClassifier
# K Nearest Neighbors Classification
class K_Nearest_Neighbors_Classifier() : 
    
    def __init__( self, K ) :
        
        self.K = K
        
    # Function to store training set
        
    def fit( self, X_train, Y_train ) :
        
        self.X_train = X_train
        
        self.Y_train = Y_train
        
        # no_of_training_examples, no_of_features
        
        self.m, self.n = X_train.shape
    
    # Function for prediction
        
    def predict( self, X_test ) :
        
        self.X_test = X_test
        
        # no_of_test_examples, no_of_features
        
        self.m_test, self.n = X_test.shape
        
        # initialize Y_predict
        
        Y_predict = np.zeros( self.m_test )
        
        for i in range( self.m_test ) :
            
            x = self.X_test[i]
            
            # find the K nearest neighbors from current test example
            
            neighbors = np.zeros( self.K )
            
            neighbors = self.find_neighbors( x )
            
            # most frequent class in K neighbors
            
            Y_predict[i] = mode( neighbors )[0][0]    
            
        return Y_predict
    
    # Function to find the K nearest neighbors to current test example
          
    def find_neighbors( self, x ) :
        
        # calculate all the euclidean distances between current 
        # test example x and training set X_train
        
        euclidean_distances = np.zeros( self.m )
        
        for i in range( self.m ) :
            
            d = self.euclidean( x, self.X_train[i] )
            
            euclidean_distances[i] = d
        
        # sort Y_train according to euclidean_distance_array and 
        # store into Y_train_sorted
        
        inds = euclidean_distances.argsort()
        
        Y_train_sorted = self.Y_train[inds]
        
        return Y_train_sorted[:self.K]
    
    # Function to calculate euclidean distance
            
    def euclidean( self, x, x_train ) :
        
        return np.sqrt( np.sum( np.square( x - x_train ) ) )
# Driver code
def main() :
    
    # Importing dataset
    
    df = pd.read_csv( "diabetes.csv" )
    X = df.iloc[:,:-1].values
    Y = df.iloc[:,-1:].values
    
    # Splitting dataset into train and test set
    X_train, X_test, Y_train, Y_test = train_test_split( 
      X, Y, test_size = 1/3, random_state = 0 )
    
    # Model training
    
    model = K_Nearest_Neighbors_Classifier( K = 3 )
    
    model.fit( X_train, Y_train )
    
    model1 = KNeighborsClassifier( n_neighbors = 3 )
    
    model1.fit( X_train, Y_train )
    
    # Prediction on test set
    Y_pred = model.predict( X_test )
    
    Y_pred1 = model1.predict( X_test )
    
    # measure performance
    
    correctly_classified = 0
    
    correctly_classified1 = 0
    
    # counter
    
    count = 0
    
    for count in range( np.size( Y_pred ) ) :
        
        if Y_test[count] == Y_pred[count] :
            
            correctly_classified = correctly_classified + 1
        
        if Y_test[count] == Y_pred1[count] :
            
            correctly_classified1 = correctly_classified1 + 1
            
        count = count + 1
        
    print( "Accuracy on test set by our model       :  ", ( 
      correctly_classified / count ) * 100 )
    print( "Accuracy on test set by sklearn model   :  ", ( 
      correctly_classified1 / count ) * 100 )
    
    
if __name__ == "__main__" : 
    
    main()
Output :
Accuracy on test set by our model       :   63.888888888888886
Accuracy on test set by sklearn model   :   63.888888888888886
The accuracy achieved by our model and sklearn is equal which indicates the correct implementation of our model.
Note: Above Implementation is for model creation from scratch, not to improve the accuracy of the diabetes dataset.
K Nearest Neighbors Regression:
K Nearest Neighbors Regression first stores the training examples. During prediction, when it encounters a new instance ( or test example ) to predict, it finds the K number of training instances nearest to this new instance. Then predicts the target value for this instance by calculating the mean of the target values of these nearest neighbors.
The optimal choice for K is by validating errors on test data. K can also be chosen by the square root of m, where m is the number of examples in the dataset.
Pseudocode :
- Store all training examples.
- Repeat steps 3, 4, and 5 for each test example.
- Find the K number of training examples nearest to the current test example.
- y_pred for current test example = mean of the true target values of these K neighbors.
- Go to step 2.
Implementation:
Dataset used in this implementation can be downloaded from link
It has 2 columns — “YearsExperience” and “Salary” for 30 employees in a company. So in this, we will create a K Nearest Neighbors Regression model to learn the correlation between the number of years of experience of each employee and their respective salary.
The model, we created predicts the same value as the sklearn model predicts for the test set.
# Importing libraries
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.neighbors import KNeighborsRegressor
# K Nearest Neighbors Regression
class K_Nearest_Neighbors_Regressor() : 
    
    def __init__( self, K ) :
        
        self.K = K
        
    # Function to store training set
        
    def fit( self, X_train, Y_train ) :
        
        self.X_train = X_train
        
        self.Y_train = Y_train
        
        # no_of_training_examples, no_of_features
        
        self.m, self.n = X_train.shape
    
    # Function for prediction
        
    def predict( self, X_test ) :
        
        self.X_test = X_test
        
        # no_of_test_examples, no_of_features
        
        self.m_test, self.n = X_test.shape
        
        # initialize Y_predict
        
        Y_predict = np.zeros( self.m_test )
        
        for i in range( self.m_test ) :
            
            x = self.X_test[i]
            
            # find the K nearest neighbors from current test example
            
            neighbors = np.zeros( self.K )
            
            neighbors = self.find_neighbors( x )
            
            # calculate the mean of K nearest neighbors
            
            Y_predict[i] = np.mean( neighbors )
            
        return Y_predict
    
    # Function to find the K nearest neighbors to current test example
          
    def find_neighbors( self, x ) :
        
        # calculate all the euclidean distances between current test
        # example x and training set X_train
        
        euclidean_distances = np.zeros( self.m )
        
        for i in range( self.m ) :
            
            d = self.euclidean( x, self.X_train[i] )
            
            euclidean_distances[i] = d
        
        # sort Y_train according to euclidean_distance_array and 
        # store into Y_train_sorted
        
        inds = euclidean_distances.argsort()
        
        Y_train_sorted = self.Y_train[inds]
        
        return Y_train_sorted[:self.K]
    
    # Function to calculate euclidean distance
            
    def euclidean( self, x, x_train ) :
        
        return np.sqrt( np.sum( np.square( x - x_train ) ) )
 
# Driver code
def main() :
    
    # Importing dataset
    
    df = pd.read_csv( "salary_data.csv" )
    X = df.iloc[:,:-1].values
    Y = df.iloc[:,1].values
    
    # Splitting dataset into train and test set
    X_train, X_test, Y_train, Y_test = train_test_split( 
      X, Y, test_size = 1/3, random_state = 0 )
    
    # Model training
    
    model = K_Nearest_Neighbors_Regressor( K = 3 )
    model.fit( X_train, Y_train )
    
    model1 = KNeighborsRegressor( n_neighbors = 3 )
    
    model1.fit( X_train, Y_train )
    
    # Prediction on test set
    Y_pred = model.predict( X_test )
    
    Y_pred1 =  model1.predict( X_test )
    
    print( "Predicted values by our model     :  ", np.round( Y_pred[:3], 2 ) ) 
    
    print( "Predicted values by sklearn model :  ", np.round( Y_pred1[:3], 2 ) )
    
    print( "Real values                       :  ", Y_test[:3] )
if __name__ == "__main__" : 
    
    main()
Output :
Predicted values by our model     :   [ 43024.33 113755.33  58419.  ]
Predicted values by sklearn model :   [ 43024.33 113755.33  58419.  ]
Real values                       :   [ 37731 122391  57081]
Disadvantage: Instance Learning models are computationally very costly because all the computations are done during prediction. It also considers all the training examples for the prediction of every test example.
