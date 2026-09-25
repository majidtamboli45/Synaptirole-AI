# Information Gain and Mutual Information for Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/information-gain-and-mutual-information-for-machine-learning/

Information Gain and Mutual Information are used to measure how much knowledge one variable provides about another. They help optimize feature selection, split decision boundaries and improve model accuracy by reducing uncertainty in predictions.
Need for Information-Based Metrics
Some common reasons why these measures are essential are:
- Identify attributes that most effectively reduce uncertainty in target predictions.
- Improve decision boundaries in tree-based models by choosing meaningful splits.
- Support feature selection in high-dimensional datasets such as text or genomics.
- Enhance model interpretability by showing which features influence outcomes most.
- Prevent overfitting by avoiding noisy or irrelevant feature usage.
Information Gain
Information Gain quantifies the reduction in entropy after splitting the data on a particular feature. Higher gain means a more useful split.
Formula
IG(S, A) = H(S) - \sum \frac{|S_v|}{|S|} H(S_v) 
Where:
- H(S) is the entropy before the split,
- H(S_v) is the entropy of each subset after splitting.
Properties
- Prefers attributes that produce pure child nodes.
- Works efficiently in decision tree algorithms like ID3 and C4.5.
- Slightly biased toward multi-valued attributes.
Implementation
Calculating information gain using iris dataset.
from sklearn.feature_selection import mutual_info_classif
from sklearn.datasets import load_iris
iris = load_iris()
X, y = iris.data, iris.target
info_gain = mutual_info_classif(X, y)
print("Information Gain for each feature:", info_gain)
Output:
Information Gain for each feature: [0.50576572 0.27875048 0.98425371 0.99358193]
Petal length and petal width are highly informative features compared to sepal length and sepal width for predicting the species of Iris flowers.
Mutual Information
Mutual Information measures how strongly two variables depend on each other. It works well for both linear and non-linear relationships.
Formula
I(X;Y) = \sum_{x,y} p(x,y) \log \frac{p(x,y)}{p(x)p(y)} 
Where:
- p(x, y) is the joint probability,
- p(x) and p(y) are marginal probabilities.
Properties
- Captures any form of dependency, not just linear.
- Stable in high-dimensional feature spaces.
- Robust against noise compared to correlation alone.
Implementation
Implementing Mutual Information using mutual_info_regression and generating data synthetically.
from sklearn.feature_selection import mutual_info_regression
import numpy as np
np.random.seed(0)
X = np.random.rand(100, 2)
y = X[:, 0] + np.sin(6 * np.pi * X[:, 1])
mutual_info = mutual_info_regression(X, y)
print("Mutual Information for each feature:", mutual_info)
Output:
Mutual Information for each feature: [0.42283584 0.54090791]
Higher Mutual Information values suggest a stronger relationship or dependency between the features and the target variable.
Information Gain Ratio
Information Gain Ratio normalizes Information Gain to reduce bias toward attributes with many values.
Formula
\mathrm{IGR} = \frac{IG(S, A)}{H(A)} 
Where:
- IG(S,A) is the Information Gain from splitting on attribute
- H(A) is the Entropy of attribute A, indicating how widely it splits the data.
- IGR is Normalized value to avoid bias toward attributes with many distinct values.
Properties
- Reduces multi-value splitting bias.
- Used in C4.5 algorithm for balanced decisions.
- Improves generalization across unseen data.
Implementation
Calculating IGR.
import numpy as np
def entropy(y):
    _, counts = np.unique(y, return_counts=True)
    p = counts / len(y)
    return -np.sum(p * np.log2(p))
def igr(y, x):
    values, counts = np.unique(x, return_counts=True)
    information_gain = entropy(y) - sum((c/len(x)) * entropy(y[x == v]) for v, c in zip(values, counts))
    
    p = counts / len(x)
    intrinsic_value = -np.sum(p * np.log2(p))
    
    return information_gain / intrinsic_value if intrinsic_value != 0 else 0
X = np.array(["Sunny", "Sunny", "Rain", "Rain", "Overcast"])
Y = np.array(["Play", "No", "No", "Play", "Play"])
print("IGR:", igr(Y, X))
Output:
IGR: 0.11232501392736335
An IGR of 0.1123 is considered low, the feature is not very informative for splitting the data compared to other possible features.
Information Gain Vs Mutual Information
Difference between information gain and mutual information:
| Criteria | Information Gain (IG) | Mutual Information (MI) | 
|---|---|---|
| Definition | Measures reduction in uncertainty of the target variable when a feature is known. | Measures how much knowing one variable reduces uncertainty about another. | 
| Focus | Individual feature importance | Mutual dependence and information exchange between variables | 
| Usage | Commonly used in decision trees for feature selection | Versatile application in feature selection, clustering and dimensionality reduction | 
| Interactions | Ignores feature interactions | Considers interactions between variables, capturing complex relationships | 
| Applicability | Effective for discrete features with clear categories | Suitable for both continuous and discrete variables, capturing linear and nonlinear relationships | 
| Computation | Simple to compute | Can be computationally intensive for large datasets or high-dimensional data |
