# Intercluster and Intracluster Distance

> Source: https://www.geeksforgeeks.org/machine-learning/ml-intercluster-and-intracluster-distance/

The aim of the clustering process is to discover overall distribution patterns and interesting correlations among the data attributes. It is the task of grouping a set of objects in such a way that objects in the same group are more similar to each other than to those in other groups. Cluster analysis itself is not one specific algorithm, but the general task to be solved. It can be achieved by various algorithms that differ significantly in their understanding of what constitutes a cluster and how to efficiently find them. Popular notions of clusters include groups with small distances between cluster members, dense areas of the data space, intervals or particular statistical distributions. Here, we will discuss about the distance between the objects of the different clusters and the objects of the same clusters. We have two type of distance:
- Inter-cluster Distance
- Intra-cluster Distance
Let S and T are clusters formed using partition U. d(x, y) is the distance between two objects x and y belonging to S and T respectively. d(x, y) is calculated using well-known distance calculating methods such as Euclidean, Manhattan and Chebychev. |S| and |T| are the number of objects in clusters S and T respectively.
Inter-Cluster Distance
Intercluster distance is the distance between two objects belonging to two different clusters. It is of 5 types -
- Single Linkage Distance : The single linkage distance is the closest distance between two objects belonging to two different clusters defined as - \delta_{1}(S, T)=\min \left\{\begin{array}{c} d(x, y) \\ x \in S, y \in T \end{array}\right\}
- Complete Linkage Distance :  The complete linkage distance is the distance between two most remote objects belonging to two different clusters defined as - \delta_{2}(S, T)=\max \left\{\begin{array}{c} d(x, y) \\ x \in S, y \in T \end{array}\right\}
- Average Linkage Distance :  The average linkage distance is the average distance between all the objects belonging to two different clusters defined as -  \delta_{3}(S, T)=\frac{1}{|S||T|} \sum_{x \in S \atop y \in T} d(x, y)
- Centroid Linkage Distance :  The centroid linkage distance is the distance between the centers vs and vt of two clusters S and T respectively, defined as - \delta_{4}(S, T)=d\left(\mathcal{v}_{s}, v_{t}\right) where,v_{s}=\frac{1}{|S|} \sum_{\mathrm{x} \in \mathrm{S}} \mathrm{x}, v_{t}=\frac{1}{|\mathrm{~T}|} \sum_{\mathrm{y} \in \mathrm{T}} \mathrm{y}
- Average Centroid Linkage Distance :  The average centroid linkage distance is the distance between the center of a cluster and all the objects belonging to a different cluster, defined as - \delta_{5}(\mathrm{~S}, \mathrm{~T})=\frac{1}{|\mathrm{~S}|+|\mathrm{T}|}\left\{\sum_{\mathrm{x} \in \mathrm{S}} \mathrm{d}(\mathrm{x}, \mathrm{vt})+\sum_{\mathrm{y} \in \mathrm{T}} \mathrm{d}(\mathrm{y}, \mathrm{vs})\right\}
Intra-CLuster Distance
Intracluster distance is the distance between two objects belonging to same cluster. It is of 3 types -
- Complete Diameter Distance : The complete diameter distance is the distance between two most remote objects belonging to the same cluster defined as - \Delta_{1}(S)=\max \{d(x, y)\}
- Average Diameter Distance : The average diameter distance is the average distance between all the objects belonging to the same cluster defined as -  \Delta_{2}(S)=\frac{1}{|S| \cdot(|S|-1)} \sum_{x, y \atop x \neq y}\{d(x, y)\}
- Centroid Diameter Distance : The centroid diameter distance is double average distance between all of the objects and the cluster center of s defined as - \Delta_{3}(S)=2\left\{\frac{\sum_{x \in S} d(x, \bar{v})}{|S|}\right\} where,\overline{\mathrm{v}}=\frac{1}{|S|} \sum_{\mathrm{x} \in \mathrm{S}} \mathrm{x}
Note: If a clustering algorithm makes clusters so that the Intercluster distance between different clusters is more and Intracluster distance of same cluster is less, then we can tell that it is a good clustering algorithm.
Here clustering algorithm in fig 3 is better than fig 2 and fig 1 as in fig 3 Intercluster distance is more and Intracluster distance is less.
