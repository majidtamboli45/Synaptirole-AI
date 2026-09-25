# Local Outlier Factor

> Source: https://www.geeksforgeeks.org/machine-learning/local-outlier-factor/

Local outlier factor (LOF) is an algorithm used for Unsupervised outlier detection. It produces an anomaly score for outliers in the data set. It does this by measuring the local density deviation of a given data point with respect to the data points near it.
Working of LOF
Local density is calculated by estimating distances between data points that are neighbours i.e k-nearest neighbors. For each data point, local density can be calculated by comparing these we can check which data points have similar densities and which have a lesser density than its neighbors. The ones with the lesser densities are considered as the outliers.
1. k-Distance and k-Nearest Neighbours
k-distance refers to the distance between a point and its k-th nearest neighbour. It helps define the local neighbourhood of a point by finding the closest k data points. Here is an image that represents the k-distances of various neighbours in the cluster of a point:
2. Reachability Distance
This distance is then used to calculate the reachability distance. It is defined as the maximum of the distance between two points and the k-distance of that point. Refer to the following equation where B is the point in the center and A is a point near to it.
\text{reachability-distance}_k(A, B) = \max \{ k\text{-distance}(B),\ d(A, B) \} 
Here is an image which represents reachability distance of a point to various neighbors:
As seen in the image above, for points inside the circle the k-distance is considered and for points outside the cluster, the distance between points is considered. Now, reachability distances to all of the k-nearest neighbours of a point are calculated to determine the Local Reachability Density (LRD) of that point.
3. Local Reachability Density (LRD)
The local reachability density is a measure of the density of k-nearest points around a point. It is calculated by taking the inverse of the sum of all of the reachability distances from the k-nearest neighboring points.
\text{lrd}_k(A) := \frac{1}{\left( \frac{\sum_{B \in N_k(A)} \text{reachability-distance}_k(A, B)}{|N_k(A)|} \right)} 
The closer the points are, the distance is lesser and the density is more.
4. Local Outlier Factor (LOF)
The calculation of Local outlier factor (LOF) is done by taking the ratio of the average of the LRDs of k-number of neighbors of a point and the LRD of that point. Here is the equation for LOF:
\text{LOF}_k(A) = \frac{\sum_{B \in N_k(A)} \text{lrd}_k(B)}{|N_k(A)| \cdot \text{lrd}_k(A)} 
So, if the density of the neighbors and the points are almost equal we can say they are quite similar; if the density of the neighbors is lesser than the density of the point we can say the point is an inlier i.e. inside the cluster, and if the density of the neighbors is more than the density of the point we can say that the point is an outlier.
Refer to the following illustration:
- LOF ~ 1: Similar data point
- LOF < 1: Similar data point which is inside the density cluster
- LOF > 1: Outlier
Here is an image of the plot of LOF on a data set:
Advantages
- Sometimes it gets tricky to determine outliers. A point that is at a small distance from a dense cluster might be considered as an outlier but a point that is at a farther distance from a wider spread cluster might be considered an inlier. LOR solves this issue as the outliers in local areas are also determined.
- The method used in LOF can be applied in many other fields to solve problems of detecting outliers like geographic data, video streams, etc.
- The LOF can be used to implement a different dissimilarity function as well and it outperform many other algorithms of anomaly detection.
Disadvantages
- LOF score is not always same so that it determines whether a point is an outlier or not. It might vary for different data sets.
- In higher dimensions, the LOF algorithm detection accuracy gets affected.
- As LOF score can be any number that the ratio produces, it might be a confusing to understand the differences of inliers and outliers based on it.
