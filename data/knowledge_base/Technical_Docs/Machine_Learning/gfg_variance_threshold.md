# Variance Threshold

> Source: https://www.geeksforgeeks.org/machine-learning/variance-threshold/

Variance Threshold is a simple technique that removes all features whose variance does not meet a specified threshold. Variance in data represents how spread out the values of a feature are. Features with low variance (e.g., nearly constant values) contain little information because it remains almost constant across samples. Removing them helps reduce the noise and computational cost.
For example, if a column in your dataset has the same value for 99% of the rows, it contributes very little in distinguishing between data points and therefore may be safely removed.
Steps-by-step Working
The process of using the Variance Threshold method involves the following steps:
- Calculate variance for each feature in the dataset.
- Compare each variance to the predefined threshold.
- Discard features with variance below the threshold.
- Retain features with sufficient variability.
This technique is unsupervised, meaning it does not consider the target labels when selecting features. It's most effective as a first-pass filter before applying more complex methods.
Implementation with Scikit-learn
Python's scikit-learn library offers a straightforward implementation of Variance Threshold:
from sklearn.feature_selection import VarianceThreshold
import numpy as np
# Sample dataset: 5 samples, 4 features
X = np.array([
    [0, 2, 0, 3],
    [0, 1, 4, 3],
    [0, 1, 1, 3],
    [0, 1, 0, 3],
    [0, 1, 3, 3] ])
# Initialize VarianceThreshold
selector = VarianceThreshold()
# Fit and transform the data
X_sele = selector.fit_transform(X)
print("Original shape:", X.shape)
print("Reduced shape:", X_sele.shape)
Output:
Original shape: (5, 4)
Reduced shape: (5, 2)
In this example, two features are removed because their variance was zero or very low.
You can also specify a different threshold:
selector = VarianceThreshold(threshold=0.5)
This removes features with variance less than 0.5.
Use Cases and Applications
- Text Classification: High-dimensional sparse data (e.g., TF-IDF vectors) often contain many features with zero or low variance.
- Bioinformatics: Genomic data has thousands of gene expression levels, many of which vary little.
- Sensor Networks: Sensor readings may remain constant for long periods, introducing low-variance features.
In all these domains, applying Variance Threshold can reduce noise and computation time.
Advantages and Limitations
Advantages
- Simplicity: Very easy to understand and implement.
- Speed: Computationally efficient even on large datasets.
- Preprocessing Utility: Useful as a first step in the feature selection pipeline.
Limitations
- Ignores Target Variable: Cannot assess the relevance of a feature with respect to the output.
- Not Effective for All Low-Variance Features: Some low-variance features might still be important for classification.
- Fails with Redundant Features: Cannot detect multicollinearity or correlated features with high variance.
Best Practices and Tips
- Scale Your Data: Ensure features are scaled appropriately; otherwise, variance may be misleading.
- Visualize Before Selecting: Plot feature variance distribution before choosing a threshold.
- Combine with Other Methods: Use it with supervised feature selection techniques for better results.
- Domain Knowledge Matters: Retain important low-variance features if they're known to be significant.
