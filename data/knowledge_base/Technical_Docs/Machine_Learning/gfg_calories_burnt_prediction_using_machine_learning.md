# Calories Burnt Prediction using Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/calories-burnt-prediction-using-machine-learning/

In this article, we will learn how to develop a machine learning model using Python which can predict the number of calories a person has burnt during a workout based on some biological measures.
Importing Libraries and Dataset
Python libraries make it easy for us to handle the data and perform typical and complex tasks with a single line of code.
- Pandas - This library helps to load the data frame in a 2D array format and has multiple functions to perform analysis tasks in one go.
- Numpy - Numpy arrays are very fast and can perform large computations in a very short time.
- Matplotlib/Seaborn - This library is used to draw visualizations.
- Sklearn - This module contains multiple libraries are having pre-implemented functions to perform tasks from data preprocessing to model development and evaluation.
- XGBoost - This contains the eXtreme Gradient Boosting machine learning algorithm which is one of the algorithms which helps us to achieve high accuracy on predictions.
Refer to the links given below for the dataset used in the article:
To proceed with the model, you need to merge both the datasets. Refer to link below to see how to merge two datasets.
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sb
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn import metrics
from sklearn.svm import SVC
from xgboost import XGBRegressor
from sklearn.linear_model import LinearRegression, Lasso, Ridge
from sklearn.ensemble import RandomForestRegressor
import warnings
warnings.filterwarnings('ignore')
Now let's load the dataset into the panda's data frame and print its first five rows.
df = pd.read_csv('calories.csv')
df.head()
Output:
Now let's check the size of the dataset.
df.shape
Output:
(15000, 9)
Let's check which column of the dataset contains which type of data.
df.info()
Output:
Now we will check the descriptive statistical measures of the data.
df.describe()
Output:
Exploratory Data Analysis
EDA is an approach to analyzing the data using visual techniques. It is used to discover trends, and patterns, or to check assumptions with the help of statistical summaries and graphical representations.
sb.scatterplot(x='Height', y='Weight', data=df) 
plt.show()
# This code is modified by Susobhan Akhuli
Output:
So, we have a kind of linear relationship between these two features which is quite obvious.
features = ['Age', 'Height', 'Weight', 'Duration']
plt.subplots(figsize=(15, 10))
for i, col in enumerate(features):
    plt.subplot(2, 2, i + 1)
    x = df.sample(1000)
    sb.scatterplot(x=col, y='Calories', data=x)
plt.tight_layout()
plt.show()
# This code is modified by Susobhan Akhuli
Output:
As expected higher is the duration of the workout higher will be the calories burnt. But except for that, we cannot observe any such relation between calories burnt and height or weight features.
Here we can observe some real-life observations:
- The average height of the boys is higher than girls.
- Also, the weight of the girls is lower than that of the boys.
- For the same average duration of workout calories burnt by men is higher than that of women.
features = df.select_dtypes(include='float').columns
plt.subplots(figsize=(15, 10))
for i, col in enumerate(features):
    plt.subplot(2, 3, i + 1)
    sb.distplot(df[col])
plt.tight_layout()
plt.show()
Output:
The distribution of the continuous features follows close to normal distribution except for some features like Body_Temp and Calories.
df.replace({'male': 0, 'female': 1},
           inplace=True)
df.head()
Output:
plt.figure(figsize=(8, 8))
sb.heatmap(df.corr() > 0.9,
           annot=True,
           cbar=False)
plt.show()
Output:
Here we have a serious problem of data leakage as there is a feature that is highly correlated with the target column which is calories.
to_remove = ['Weight', 'Duration']
df.drop(to_remove, axis=1, inplace=True)
Model Training
Now we will separate the features and target variables and split them into training and testing data by using which we will select the model which is performing best on the validation data.
features = df.drop(['User_ID', 'Calories'], axis=1)
target = df['Calories'].values
X_train, X_val,\
    Y_train, Y_val = train_test_split(features, target,
                                      test_size=0.1,
                                      random_state=22)
X_train.shape, X_val.shape
Output:
((13500, 5), (1500, 5))
Now, let's normalize the data to obtain stable and fast training.
# Normalizing the features for stable and fast training.
scaler = StandardScaler()
X_train = scaler.fit_transform(X_train)
X_val = scaler.transform(X_val)
Now let's train some state-of-the-art machine learning models and compare them which fit better with our data.
from sklearn.metrics import mean_absolute_error as mae
models = [LinearRegression(), XGBRegressor(),
          Lasso(), RandomForestRegressor(), Ridge()]
for i in range(5):
    models[i].fit(X_train, Y_train)
    print(f'{models[i]} : ')
    train_preds = models[i].predict(X_train)
    print('Training Error : ', mae(Y_train, train_preds))
    val_preds = models[i].predict(X_val)
    print('Validation Error : ', mae(Y_val, val_preds))
    print()
Output:
LinearRegression() : 
Training Error :  17.893463692619434
Validation Error :  18.007896272831253
XGBRegressor(base_score=None, booster=None, callbacks=None,
             colsample_bylevel=None, colsample_bynode=None,
             colsample_bytree=None, device=None, early_stopping_rounds=None,
             enable_categorical=False, eval_metric=None, feature_types=None,
             gamma=None, grow_policy=None, importance_type=None,
             interaction_constraints=None, learning_rate=None, max_bin=None,
             max_cat_threshold=None, max_cat_to_onehot=None,
             max_delta_step=None, max_depth=None, max_leaves=None,
             min_child_weight=None, missing=nan, monotone_constraints=None,
             multi_strategy=None, n_estimators=None, n_jobs=None,
             num_parallel_tree=None, random_state=None, ...) : 
Training Error :  7.89463304294701
Validation Error :  10.12050432946533
Lasso() : 
Training Error :  17.915089584958036
Validation Error :  17.995033362288662
RandomForestRegressor() : 
Training Error :  3.9877936746031746
Validation Error :  10.451300301587302
Ridge() : 
Training Error :  17.893530494767777
Validation Error :  18.00781790803129
Out of all the above models, we have trained RandomForestRegressor and the XGB model's performance is the same as their MAE for the validation data is same.
Get the Complete notebook:
Notebook: click here.
Dataset: click here.
