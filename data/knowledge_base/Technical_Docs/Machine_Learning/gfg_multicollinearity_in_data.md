# Multicollinearity in Data

> Source: https://www.geeksforgeeks.org/machine-learning/multicollinearity-in-data/

Multicollinearity happens when two or more predictor(independent) variables in a model are closely related to each other. Because they give similar information, it becomes difficult to know how each one affects the result, this is a common problem in multiple linear regression and can make the model’s results less reliable. It can change the effects of independent variables a lot even with small changes in data. Detecting and fixing multicollinearity is important to make models more accurate and easier to understand.
Different Kinds of Multicollinearity
Multicollinearity can take different forms depending on how predictor variables relate to each other. Understanding these types helps in identifying and handling multicollinearity effectively:
1. Perfect Multicollinearity
This occurs when one predictor variable is an exact linear combination of one or more other predictors. For example if Variable C = 2 × Variable A + Variable B then Variable C can be perfectly predicted using A and B. This causes serious problems because the regression model cannot distinguish the individual effects of these variables which makes it impossible to find their coefficients uniquely.
2. Imperfect (or Near) Multicollinearity
This occurs when predictors are highly correlated but not perfectly. For example height and weight have a strong positive correlation but are not exactly dependent. This can lead to unstable coefficient estimates where small changes in data cause large swings in the regression coefficients which makes the model less reliable.
3. Structural Multicollinearity
This type arises from how variables are created or defined. When new variables are formed by combining existing ones they become correlated. For example if total income is calculated by adding salary, bonuses and investment returns these individual components will be strongly related to total income and to each other.
4. Data-based Multicollinearity
This happens naturally due to the nature of the data or how it was collected, in observational studies where researchers have little control over variables. For example years of education and age increase together which creates multicollinearity just because of the relationship in the population.
Problems with Multicollinearity
There are various problems which occurs with the multicollinear data which are as follows:
- Unstable Coefficients: When independent variables are highly correlated, small changes in the data can cause large fluctuations in the regression coefficients. This instability makes the model’s results unreliable.
- Reduced Interpretability: It makes it difficult to understand how each predictor affects the dependent variable. Since correlated variables are providing similar information, it's challenging to find the individual contribution of each predictor.
- Less Reliable Predictions: High multicollinearity can lead to standard errors which makes model’s predictions less reliable. As a result, the model may not give results well to new unseen data and can give wrong results.
- Risk of Overfitting: The model may fit the training data too closely by capturing random noise which decrease its ability to work well on new data.
Real Life Case Study
Imagine a company wants to understand how advertising spending affects sales. They notice that advertising budgets are related to store sizes, smaller stores get more advertising money while bigger stores get less. Because advertising and store size are connected this causes multicollinearity in their data. This makes it hard to tell how each factor impacts sales individually. To fix this the company can design better studies to reduce multicollinearity.
Causes of Multicollinearity
Multicollinearity happens when predictor variables in a model are related to each other and this can happen for several reasons:
- Natural Relationships in Data: Sometimes variables are naturally connected. For example in a study about houses, the size of a house and the number of rooms increase together. This means these variables will be closely related in the data.
- Creating New Variables from Others: If we make new variables by combining or adding existing ones they become linked by design. For example total income might be made by adding salary and bonus so these variables are related.
- Small or Limited Data: When there isn’t enough data, the relationships between variables may look stronger than they really are. This can also cause multicollinearity.
- Incorrect Coding of Variables: Sometimes when turning categories into numbers (like yes/no into 0/1) if done wrong, it can cause variables to be related unexpectedly.
Understanding these causes helps us find and fix multicollinearity to improve our models.
Detecting Multicollinearity
Detecting multicollinearity is the first step to ensure our model’s reliability. Various methods help to identify if predictor variables are highly related:
1. Variance Inflation Factor (VIF) : VIF is a used to detect and measure multicollinearity in multiple linear regression. It shows how much the variance of a regression coefficient increases due to correlation with other predictor variables.
VIF is calculated as:
VIF_i = \frac{1}{1 - R_i^2} 
where 
2. Correlation Matrix: Correlation matrix shows the correlation coefficients between every pair of variables. High absolute values (close to 1 or -1) shows strong relationships. Such pairs are likely sources of multicollinearity.
3. Pairwise Scatter Plots: Plotting variables against each other lets us visually check their relationships. Strong linear patterns suggest high correlation. Although this method takes time with many variables.
Ways to Handle Multicollinearity
Multicollinearity can make models less reliable but there are several ways to fix or reduce it:
- Remove Redundant Variables: If two or more predictor variables are highly correlated, one of them can be dropped. This helps in reducing redundancy and makes the model more stable. For example if "height" and "weight" are highly correlated we might drop one to prevent multicollinearity.
- Combine Variables: When variables are strongly related they can be combined into a single feature. This approach can reduce multicollinearity and simplify the model. For example instead of keeping "total income from salary" and "total income from business" we can combine them into "total income".
- Regularization Techniques: Methods like Ridge or Lasso regression can be used to reduce multicollinearity by penalizing the coefficients of correlated predictors. These methods shrink the coefficients helps in reducing their impact and improving model stability. Ridge tends to shrink coefficients evenly while Lasso can set some coefficients to zero.
- Collect More Data: Increasing the size of the dataset can sometimes reduce multicollinearity as it helps in stabilizing the relationships between variables. With more data points the patterns between predictors and the target become clearer which reduces the chance of overfitting and multicollinearity.
- Principal Component Analysis (PCA): PCA is a dimensionality reduction technique that can be used to transform the correlated predictor variables into a smaller set of uncorrelated variables. By using PCA we can remove multicollinearity while preserving the important information from the original variables.
Impact of Multicollinearity on Other Machine Learning Models
Multicollinearity is well-known in linear regression but it can also impact other machine learning models in different ways:
- Decision Trees: It doesn’t affect decision trees much because they pick features that give the best splits. However if we have highly correlated features, the tree might become complex and can overfit.
- Random Forests: Random forests are a bunch of decision trees. They can handle correlated features but too many can lead to overfitting. This makes the model more complex and reduces its ability to make general predictions.
- Support Vector Machines (SVM): In linear SVM if features are highly correlated the model might not be able to properly find the best boundary between classes which makes it less accurate.
- K-Nearest Neighbors (KNN): KNN relies on measuring distances between points. When features are correlated the distances may become misleading which causes the model to misclassify some data points.
- Neural Networks: Neural networks can also struggle with multicollinearity, when features are highly correlated the network struggle with learning the correct patterns and takes longer time to train the model and still fail to make accurate predictions.
