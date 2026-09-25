# Feature Selection using Filter Methods

> Source: https://www.geeksforgeeks.org/machine-learning/feature-selection-filter-methods/

Filter methods are feature selection techniques that evaluate the relevance of features based on statistical measures without involving a machine learning model. They help reduce dimensionality, improve model performance, and eliminate irrelevant or redundant features.
- Evaluates each feature independently using statistical measures.
- Measures the relationship between features and the target variable to determine their importance.
- Assigns a score or rank to every feature based on relevance.
- Selects the top-ranked features and removes irrelevant or redundant ones before model training.
To learn about other feature selection techniques, refer: Feature Selection Techniques in Machine Learning
Common Filter Methods
1. Variance Thresholding
Variance Threshold removes features with very low variance, as they contribute little useful information to the learning process. Features with almost constant values are typically discarded.
Formula:
\text{Variance}(X) = \frac{1}{N}\sum_{i=1}^{N}(x_i-\mu)^2 
2. Correlation Coefficient
The Correlation Coefficient measures the strength and direction of the relationship between a feature and the target variable. Features with higher absolute correlation values are generally considered more relevant.
Formula (Pearson Correlation):
r = \frac{\sum (x_i-\bar{x})(y_i-\bar{y})}{\sqrt{\sum (x_i-\bar{x})^2 \sum (y_i-\bar{y})^2}} 
- Values close to 1 indicate a strong positive relationship.
- Values close to -1 indicate a strong negative relationship.
- Values close to 0 indicate little or no relationship.
3. Chi-Squared Test (χ²)
The Chi-Square test evaluates the dependency between categorical features and the target variable. Features with higher Chi-Square scores are considered more important.
- Higher values indicate a stronger relationship between the feature and the target variable.
- Commonly used for classification tasks involving categorical data.
Formula:
\chi^2 = \sum \frac{(O-E)^2}{E} 
Where 
4. Mutual Information (MI)
Mutual Information measures how much information a feature provides about the target variable. It can capture both linear and non-linear relationships.
- Higher values indicate that the feature contains more useful information about the target.
- A value of 0 indicates independence between the feature and target.
Formula:
MI(X,Y)=\sum_{x,y} p(x,y)\log\left(\frac{p(x,y)}{p(x)p(y)}\right) 
5. F-test (ANOVA)
ANOVA (Analysis of Variance) measures whether the mean values of a feature differ significantly across target classes. Features with higher F-scores are generally more discriminative.
- Higher F-scores indicate greater separation between classes.
- Commonly used for classification problems with numerical features.
Formula:
F = \frac{\text{Variance Between Groups}}{\text{Variance Within Groups}} 
Implementation of Filter Methods
1. Import Required Libraries
- Import pandas and scikit learn.
- Imports different filter-based feature selection techniques.
import pandas as pd
from sklearn.datasets import load_breast_cancer
from sklearn.feature_selection import (
    VarianceThreshold,
    SelectKBest,
    chi2,
    mutual_info_classif,
    f_classif
)
2. Load the Dataset
- Loads the Breast Cancer dataset.
- Separates features and target variable.
- Displays the dataset dimensions.
data = load_breast_cancer()
X = pd.DataFrame(
    data.data,
    columns=data.feature_names
)
y = pd.Series(
    data.target
)
3. Apply Variance Threshold
- Removes features with very low variance.
- Retains features containing useful variation.
variance_selector = VarianceThreshold(
    threshold=0.1
)
X_variance = variance_selector.fit_transform(X)
print(
    "Features after Variance Threshold:",
    X_variance.shape[1]
)
Output:
Features after Variance Threshold: 11
4. Apply Correlation-Based Feature Selection
- Calculates the correlation between each feature and the target variable.
- Uses absolute values to consider both positive and negative correlations.
- Selects the top 10 features with the highest correlation scores.
correlation_scores = X.corrwith(y)
top_features = (
    correlation_scores
    .abs()
    .sort_values(
        ascending=False
    )
    .head(10)
)
print(
    "Top Features (Correlation):"
)
print(top_features.index.tolist())
Output:
Top Features (Correlation):
['worst concave points', 'worst perimeter', 'mean concave points', 'worst radius', 'mean perimeter', 'worst area', 'mean radius', 'mean area', 'mean concavity', 'worst concavity']
5. Apply Chi-Square Test
- Computes Chi-Square scores for all features.
- Selects the top 10 most relevant features.
chi_selector = SelectKBest(
    score_func=chi2,
    k=10
)
X_chi = chi_selector.fit_transform(
    X,
    y
)
print(
    "Selected Features (Chi-Square):",
    X_chi.shape[1]
)
Output:
Selected Features (Chi-Square): 10
6. Apply Mutual Information
- Measures how much information each feature contributes.
- Selects the top informative features.
mi_selector = SelectKBest(
    score_func=mutual_info_classif,
    k=10
)
X_mi = mi_selector.fit_transform(
    X,
    y
)
print(
    "Selected Features (Mutual Information):",
    X_mi.shape[1]
)
Output:
Selected Features (Mutual Information): 10
7. Apply ANOVA F-Test
- Calculates F-scores for all features.
- Selects features with the strongest relationship to the target variable.
anova_selector = SelectKBest(
    score_func=f_classif,
    k=10
)
X_anova = anova_selector.fit_transform(
    X,
    y
)
print(
    "Selected Features (ANOVA):",
    X_anova.shape[1]
)
Output:
Selected Features (ANOVA): 10
Download full code from here
Advantages
- Fast and computationally efficient.
- Easy to implement and interpret.
- Works well with high-dimensional datasets.
- Independent of machine learning algorithms.
- Helps reduce overfitting by removing irrelevant features.
Limitations
- Evaluates each feature independently.
- May ignore interactions between features.
- Selected features may not always produce the best model performance.
- Some methods are limited to specific data types or tasks.
