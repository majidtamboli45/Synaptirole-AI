# Bagging vs Boosting in Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/bagging-vs-boosting-in-machine-learning/

Bagging and Boosting are both ensemble learning techniques used to improve model performance by combining multiple models. The main difference is that:
- Bagging reduces variance by training models independently.
- Boosting reduces bias by training models sequentially, focusing on previous errors.
Understanding Bagging
Bagging (Bootstrap Aggregating) aims to reduce model variance by training multiple models on different random subsets of the dataset. These subsets are created using bootstrapping, where data points are sampled with replacement.
Each model is trained independently, and their predictions are combined using voting for classification or averaging for regression. As models are trained independently, Bagging works well with high-variance models like decision trees.
- Uses random sampling with replacement
- Trains models independently
- Combines predictions using voting or averaging
- Reduces overfitting
- Used in Random Forest, Credit risk prediction and Medical diagnosis systems
Understanding Boosting
Boosting focuses on improving model accuracy by training models sequentially. Each new model pays more attention to the data points that were misclassified by previous models. Over time, the ensemble becomes better at handling difficult cases.
Boosting is effective for reducing bias and works well even with weak learners.
- Trains models sequentially
- Gives more weight to misclassified samples
- Combines models using weighted voting
- Reduces bias
- Used in Fraud detection
Difference Between Bagging and Boosting
Now lets see a tabular difference between Bagging and Boosting:
| Feature | Bagging | Boosting | 
|---|---|---|
| Training style | Trains independent models | Trains sequential models | 
| Main goal | Reduce variance | Reduce bias | 
| Handling errors | All samples treated equally | Focuses on misclassified samples | 
| Overfitting | It is less sesitive to overfitting | More prone to overfitting | 
| Parallel training | Yes it supports parallel computing | No it does not supports parallel computing | 
| Sensitivity to noise | It is not affected by noise and outliers | Sensitive to noise and outliers | 
When to Use Which Technique
- Use Bagging when your model is overfitting and has high variance, especially with decision trees.
- Use Boosting when your model underfits and you want higher accuracy by learning complex patterns.
