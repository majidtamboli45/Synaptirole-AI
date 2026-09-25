# What is Silhouette Score

> Source: https://www.geeksforgeeks.org/machine-learning/what-is-silhouette-score/

The Silhouette Score is a metric used to evaluate the quality of clustering results. It measures how similar each data point is to its own cluster compared to other clusters, helping assess how well the data has been grouped. This score is widely used to evaluate clustering algorithms like K-Means.
How the Silhouette Score Works
The Silhouette Score measures how well each data point fits within its assigned cluster and how well-separated it is from other clusters. For each point, two key quantities are calculated:
- Intra-cluster distance (a_{i} ): This is the average distance between the data point and all other points in the same cluster. A smaller value indicates the point is closely aligned with its cluster.
- Nearest-cluster distance (b_{i} ): This is the average distance between the data point and all points in the nearest neighbouring cluster (the next best alternative). A larger value means the point is well-separated from other clusters.
Silhouette Distance and Score
The silhouette score for a data point combines these two distances to quantify clustering quality:
\text{Silhouette Score} = \frac{b_i - a_i}{\max(a_i, b_i)} 
- if a_{i} << b_{i} the point is much closer to its own cluster than others, indicating good clustering.
- if a_i \approx b_i the point lies between clusters, showing uncertainty.
- if a_{i} > b_{i} the point may be misclassified.
What the Silhouette Score Tells Us
The score ranges from -1 to +1:
- Close to +1: Point is well-matched to its cluster and far from others means excellent clustering.
- Around 0: Point is near cluster boundaries or clusters overlap.
- Close to -1: Point is likely assigned to the wrong cluster means poor clustering.
The image below compares K-Means clustering using 6 centroids vs. 4 centroids. The clustering with 4 centroids has a higher Silhouette Score (0.84), indicating better-defined clusters.
Calculating Silhouette Score with Python
In this example, we will create a synthetic dataset using random numbers and apply K-Means clustering. Then, we will calculate the Silhouette Score.
Step 1: Import necessary libraries
We need NumPy for generating random data, and scikit-learn for clustering and calculating the Silhouette Score.
import numpy as np
from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score
Step 2: Generate random data
We create three separate groups of data points, where each group represents one cluster. The data points are spread around different centers using the normal distribution.
np.random.seed(7)
x1 = np.random.normal(3, 1, (50, 2))  # Cluster 1 centered at 3
x2 = np.random.normal(7, 1, (50, 2))  # Cluster 2 centered at 7
x3 = np.random.normal(11, 1, (50, 2)) # Cluster 3 centered at 11
Step 3: Combine all clusters into one dataset
We merge all three groups into a single dataset to prepare it for clustering.
data = np.vstack((x1, x2, x3))
Step 4: Apply K-Means clustering
We create the K-Means model to form 3 clusters and assign each data point to one of the clusters.
model = KMeans(n_clusters=3, random_state=7)
predicted_labels = model.fit_predict(data)
Step 5: Calculate Silhouette Score
We calculate the Silhouette Score to evaluate how well the clustering worked.
silhouette_val = silhouette_score(data, predicted_labels)
print("Silhouette Score:", silhouette_val)
Output:
Silhouette Score: 0.6808642416167786
The Silhouette Score of 0.68 shows that the clustering worked well, with points fitting well into their own clusters and clearly separated from others. A score above 0.5 usually means good clustering, and values close to 1.0 indicate strong separation. Since the data was generated with clear cluster centers, this result is expected.
