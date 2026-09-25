# Through Rate Prediction using Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/click-through-rate-prediction/

Predicting the click-through Rate (CTR) is crucial for optimizing online advertising campaigns. By accurately estimating the likelihood of a user clicking on an ad, businesses can make informed decisions about ad placement and design, ultimately maximizing their return on investment (ROI).
In this article, we will explore how to use the eXtreme Gradient Boosting (XGBoost) algorithm, a popular and powerful machine learning technique, to predict CTR. We will start by understanding the basics of CTR prediction and then delve into implementing a CTR prediction model using XGBoost in Python.
What is Click-Through Rate?
Click-Through Rate is calculated as the number of clicks an ad receives divided by the number of times the ad is shown (impressions), expressed as a percentage. The CTR prediction task involves modeling the likelihood of a click based on ad characteristics, user profile data, and contextual features.
Why XGBoost for Click-Through Rate Prediction?
XGBoost is an ensemble learning method, meaning it builds a strong predictive model by combining multiple weak models, typically decision trees, in a sequential manner. It iteratively trains new models to correct errors made by previous models, with each new model focusing on the residuals or errors of the previous models.
XGBoost is a popular choice for CTR prediction because of several key features:
- Gradient Boosting Framework: XGBoost is based on the gradient boosting framework, which builds models sequentially to correct the residuals of previous models.
- Regularization: It incorporates both L1 and L2 regularization, which helps prevent overfitting—a common issue with standard boosting techniques.
- Scalability and Efficiency: XGBoost is highly scalable and can handle large datasets efficiently, thanks to its parallel processing and tree pruning methods.
- Handling Sparse Data: XGBoost can handle sparse data from one-hot encoding of categorical variables without extensive memory consumption.
- Flexibility: It can be used for both regression and classification tasks and allows for custom optimization objectives and evaluation criteria.
Predicting Click-Through Rate with XGBoost
This section discusses the steps to predict the click-through rate with the help of the XGBoost algorithm. The dataset contains 10 columns, with 9 of them representing an instance of a data record as features. We will be predicting the "Clicked on Ad" column, which represents if the visitor clicks on the ad.
Follow the steps given below to create a click-through rate prediction model using the XGBoost algorithm:
Step 1: Import Necessary Libraries
- In this step, you will be importing the necessary libraries that you can use to predict the click-through rate.
- It includes data manipulation libraries such as pandas and numpy, LabelEncoder to encode the categorical features into numerical value, train_test_split to split the dataset into training and test sets, XGBoost library to leverage its powers to predict the clicks, and accuracy_score to measure how our model performs.
import pandas as pd
import numpy as np
from sklearn.preprocessing import LabelEncoder
from sklearn.model_selection import train_test_split
from xgboost import XGBClassifier as xgb
from sklearn.metrics import accuracy_score
Step 2: Reading Data and Performing Basic Analysis
data = pd.read_csv("ad_10000records.csv")
print(data.head())
Output:
         Daily Time Spent on Site     Age              Area Income                Daily Internet Usage  \
0 62.26 32. 69481.85 172.83
1 41.73 31.0 61840.26 207.17
2 44.40 30.0 57877.15 172.83
3 59.88 28.0 56180.93 207.17
4 49.21 30.0 54324.73 201.58
Ad Topic Line City Gender \
0 Decentralized real-time circuit Lisafort Male
1 Optional full-range projection West Angelabury Male
2 Total 5thgeneration standardization Reyesfurt Female
3 Balanced empowering success New Michael Female
4 Total 5thgeneration standardization West Richard Female
Country Timestamp Clicked on Ad
0 Svalbard & Jan Mayen Islands 2016-06-09 21:43:05 0
1 Singapore 2016-01-16 17:56:05 0
2 Guadeloupe 2016-06-29 10:50:45 0
3 Zambia 2016-06-21 14:32:32 0
4 Qatar 2016-07-21 10:54:35 1
In the above output, "Clicked on Ad" column, 0 represents the users not clicking on the ad, and 1 represents the user who click on the ads. Let's look at the total value counts of the combined 0's and 1's and check for the click through rate.
print(data["Clicked on Ad"].value_counts())
# Click through rate
click_through_rate = 4917 / 10000 * 100
print(f"The click through rate is: {click_through_rate}%")
Output:
0    5083
1 4917
The click through rate is: 49.17%
From the above information, we get 49.17% of the total visitors clicking on the ads. After this step we can transform the "Gender" column into numeric values so that the data can be fit in the machine learning model.
Step 3: Data Preprocessing
This encodes the "Gender" variable into numeric values.
le = LabelEncoder()
data["Gender"] = le.fit_transform(data["Gender"])
In this step, you will be splitting the dataset into feature and target set and then again splitting it into training and test dataset to train and test your model on.
# Taking the first seven columns of the dataset as features
x=data.iloc[:,0:7]
# Dropping the Categorical Variables
x=x.drop(['Ad Topic Line','City'],axis=1)
# Assigning the final variable as the target variable
y=data.iloc[:,9]
# Using train test split to split the dataset
x_train,x_test,y_train,y_test=train_test_split(x,y,test_size=0.2,random_state=42)
Step 4: Defining & Training a XGBoost Classifier Model
In this step, you create your XGBClassifier model and train it on the training dataset created in the previous step.
# XGBoostClassifier model
model = xgb(random_state=42)
# Training the model
model.fit(x_train, y_train)
Output:
Step 5: Predicting & Checking Accuracy of the Model
Finally, you will be predicting the model's performance on the test dataset and check its accuracy against the original values.
# Predicting test dataset values with the model
y_pred = model.predict(x_test)
# Accuracy check of the model prediction
print("The model accuracy is", accuracy_score(y_test,y_pred))
Output:
The model accuracy is 0.81
So, the model is accurate almost 81% of the times.
Conclusion
The article highlights the importance of click-through rate and how you can predict the visitor behavior on the basis of a few features. Having a good knowledge of how advertisement works is essential for any business to flourish and click-through rate is an essential metric. With the help of proper monitoring and analysis of CTR, you can get knowledgable insights about you business and how you can work on ad campaign to increase revenue.
