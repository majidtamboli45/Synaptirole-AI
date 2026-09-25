# Stratified Sampling in Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/stratified-sampling-in-machine-learning/

Machine learning can be a challenge when data isn't balanced. Stratified sampling is a technique that ensures all the important groups within your data are fairly represented. In this tutorial, we will understand what is stratified sampling and how it is crucial that it leads to superior machine learning models.
What is Stratified Sampling?
Stratified sampling is a sampling technique used in statistics and machine learning to ensure that the distribution of samples across different classes or categories remains representative of the population.
The population is divided into distinct groups based on certain characteristics (such as age, gender, income level, etc.), and then samples are randomly selected from each group in proportion to their representation in the population. This helps to ensure that each subgroup is adequately represented in the sample, making the sample more representative of the entire population and reducing the potential for bias in the analysis.
The method is particularly useful when dealing with imbalanced datasets, where certain classes or categories are significantly more prevalent than others. The goal of stratified sampling is to maintain the proportions of different classes in the sample that closely reflect their proportions in the entire population.
Example of Stratified Sampling
If 99% of the emails are not spam, a simple random sample might only contain a few spam emails, making it difficult for the model to learn how to identify them effectively.
Here's how stratified sampling comes into role:
- Divide the Population into Strata: The first step is to identify relevant characteristics that divide the population into subgroups called strata. In our email example, the strata could be "spam" and "not spam" emails.
- Proportionate vs. Disproportionate Sampling: There are two main approaches to selecting samples from each stratum:
  - Proportionate Sampling: This ensures the sample reflects the proportion of each stratum in the entire population. Going back to our email example, if 1% of emails are spam, then a sample of 100 emails should ideally contain 1 spam email and 99 non-spam emails.
  - Disproportionate Sampling: This selects a fixed number of samples from each stratum regardless of its population size. This can be useful if you want to focus on a specific under-represented stratum like spam emails in our example, even if it means the sample doesn't perfectly reflect the population proportions.
- Random Sampling Within Each Stratum: Once you've defined the strata and chosen your sampling approach, you randomly select samples from each stratum. This ensures each subgroup is fairly represented in the final sample.
How Stratified Sampling Works?
Stratified sampling involves dividing the population into groups based on relevant characteristics, selecting samples from each group proportionately. Here's how it works:
- Class Distribution: First, we analyze the distribution of classes in the dataset. Each class represents a distinct category or label.
- Identify Strata: Determine characteristics defining subgroups in the population (e.g., age, income).
- Divide the Population: Split the population into distinct strata based on these characteristics.
- Determine Sample Size: Decide sample size for each stratum based on its proportion in the population.
- Random Sampling: Randomly select individuals from each stratum for the sample.
- Combine Samples: Merge the samples from each stratum for analysis.
Stratified sampling reduces bias and enhances result accuracy by ensuring fair representation of all subgroups.
Stratified Sampling in Machine Learning : Implementation
Stratified sampling ensures representative sampling of classes in a dataset, particularly in imbalanced datasets. When combined with k-fold cross-validation, it helps ensure that the performance evaluation of machine learning models remains consistent and unbiased across different folds of the dataset.
- Stratified k-fold Cross-Validation: Here, stratified sampling is applied within each fold of the k-fold cross-validation process. This ensures that each fold maintains the same class distribution as the original dataset. By doing so, the performance evaluation of the model across different folds remains consistent and unbiased.
- Stratified Sampling for Validation Set: Additionally, when performing k-fold cross-validation, it's common to use stratified sampling to create the initial partitions of the dataset into training and validation sets. This ensures that both the training and validation sets maintain similar class distributions, leading to more reliable model evaluation.
Hence ,we perform K-Fold Cross Validation with Stratified Sampling here using Scikit-Learn using Iris dataset. We're using a logistic regression classifier and evaluating its performance using 5-fold cross-validation with stratified sampling.
from sklearn.datasets import load_iris
from sklearn.model_selection import StratifiedKFold
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import accuracy_score
iris = load_iris()
X = iris.data
y = iris.target
classifier = LogisticRegression()
# Initialize Stratified K-Fold Cross Validator
skf = StratifiedKFold(n_splits=5)
accuracy_scores = []
# Perform Stratified K-Fold Cross Validation
for train_index, test_index in skf.split(X, y):
    X_train, X_test = X[train_index], X[test_index]
    y_train, y_test = y[train_index], y[test_index]
    
    classifier.fit(X_train, y_train)
    y_pred = classifier.predict(X_test)
    accuracy = accuracy_score(y_test, y_pred)
    accuracy_scores.append(accuracy)
average_accuracy = sum(accuracy_scores) / len(accuracy_scores)
print("Average Accuracy:", average_accuracy)
Output:
Average Accuracy: 0.9733333333333334
Benefits of Stratified Sampling in Machine Learning
- Reduces Bias: By guaranteeing each important subgroup is represented, stratified sampling reduces bias in the training data. This is crucial for machine learning models to learn accurate patterns from the data.
- Improves Model Performance on Imbalanced Datasets: In cases where some classes are rare (like spam emails), stratified sampling ensures the model has enough examples to learn from those classes effectively.
Limitations of Stratified Sampling
- Training and evaluating multiple times can be resource-intensive.
- May not fully address issues with highly imbalanced datasets.
- Excessive tuning based on cross-validation can lead to overfitting.
- Performance estimates may vary based on fold partitioning, especially with smaller datasets.
Conclusion
Stratified sampling is a key method for representative sampling, reducing bias and improving accuracy. Despite limitations, it empowers researchers to make informed decisions and drive innovation across various fields.
