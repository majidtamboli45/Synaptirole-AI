# Difference Between Agglomerative clustering and Divisive clustering

> Source: https://www.geeksforgeeks.org/machine-learning/difference-between-agglomerative-clustering-and-divisive-clustering/

Agglomerative and divisive clustering are two main types of hierarchical clustering methods. Agglomerative clustering is a bottom-up approach where each data point starts as its own cluster and similar ones are merged step by step.
Divisive clustering is top-down, starting with all data in one cluster and splitting it into smaller groups based on differences.
Agglomerative Clustering
Agglomerative clustering is a bottom-up approach where each data point starts as its own individual cluster. The algorithm iteratively merges the most similar pairs of clusters until all the data points belong to a single cluster. It’s widely used due to its simplicity and efficiency in many clustering tasks.
Key steps in agglomerative clustering:
- Treat each data point as a separate cluster.
- Calculate the similarity (distance) between all pairs of clusters.
- Merge the two most similar clusters.
- Repeat steps 2-3 until all points belong to a single cluster.
This method can be computationally expensive especially for large datasets. The algorithm needs to compute the distance between every pair of points leading to a time complexity of 
It can be implemented using Scikit learn and SciPy library of python. Here’s a simple implementation of agglomerative clustering using randomly generated data in Python with Scipy:
import numpy as np
import matplotlib.pyplot as plt
from scipy.cluster.hierarchy import dendrogram, linkage
data = np.random.randn(50, 2)
Z = linkage(data, 'ward')
# Plot dendrogram
plt.figure(figsize=(10, 7))
dendrogram(Z)
plt.title("Agglomerative Clustering Dendrogram")
plt.show()
Output:
Divisive Clustering
Divisive clustering on the other hand, is a top-down approach. It starts with all data points in a single cluster and recursively splits the clusters into smaller sub-clusters based on their dissimilarity until each data point is in its own individual cluster. This approach is more computationally intensive as it require splitting the data rather than merging it.
Key steps in divisive clustering:
- Start with a single cluster containing all the data points.
- Split the cluster into two sub-clusters based on their dissimilarity.
- Recursively apply the same process to the resulting sub-clusters.
- Repeat until each data point is in its own cluster.
Divisive clustering’s complexity can vary depending on the implementation it generally requires more computational power due to the recursive splitting process. However because it operates on sub-clusters it can sometimes reduce the computational cost when compared to agglomerative clustering on very large datasets. It is more complex to implement and require a choice of splitting criteria.
Difference between Agglomerative clustering and Divisive clustering
| Parameters | Agglomerative Clustering | Divisive Clustering | 
|---|---|---|
| Approach | Bottom-up: Starts with individual points and merges them. | Top-down: Starts with all data in one cluster and splits. | 
| Complexity Level | More computationally expensive due to pairwise distance calculations. | Less computationally expensive but requires careful cluster splitting. | 
| Handling Outliers | Better at handling outliers, as outliers can be absorbed into larger clusters. | Outliers may lead to inefficient splitting and suboptimal results. | 
| Interpretability | More interpretable due to clear cluster merging in the dendrogram. | Can be harder to interpret due to recursive splitting decisions. | 
| Implementation | Scikit-learn provides multiple linkage methods such as "ward," "complete," "average," and "single." | Not widely implemented in major libraries like Scikit-learn and SciPy. | 
| Example Applications | Image segmentation, customer segmentation, document clustering, etc. | Less common but can be used in hierarchical data analysis. | 
Both agglomerative and divisive clustering are hierarchical clustering techniques with their own strengths and weaknesses. Agglomerative clustering is more commonly used due to its simplicity and efficiency while divisive clustering may be useful in specific applications where a top-down approach is preferred. Understanding these methods and their differences will help in selecting the appropriate technique for a given clustering task.
