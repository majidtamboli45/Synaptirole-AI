# Affinity Propagation

> Source: https://www.geeksforgeeks.org/machine-learning/affinity-propagation/

Affinity Propagation (AP) is a clustering algorithm that automatically identifies clusters and their exemplars (representative points) without requiring you to specify the number of clusters in advance. Unlike methods such as K-Means, Affinity Propagation determines cluster centers by iteratively exchanging “messages” between data points to identify the most suitable exemplars.
Suppose a dataset of fruits with features like color, size and weight. Affinity Propagation can group similar fruits:
- Apples with apples
- Bananas with bananas
Note: The algorithm does not require prior labels, it clusters purely based on similarity.
Working
1. Similarity Computation
It starts with a similarity matrix s, where S(i,j) represents the similarity between points xi and xj .
By default, similarity is calculated as negative squared Euclidean distance:
S(i,j) = -\|x_i - x_j\|^2 
Diagonal elements S(i,i) are called preferences, indicating how likely each point is to be chosen as an exemplar. A higher preference is more likely to become a cluster centre.
2. Responsibility Update
The responsibility matrix 
r(i,k) \leftarrow s(i,k) - \max_{k' \neq k} \{ a(i,k') + s(i,k') \} 
A high 
3. Availability Update
The availability matrix 
For 
a(i,k) \leftarrow \min \Big( 0, \; r(k,k) + \sum_{i' \neq \{i,k\}} \max \big(0, r(i',k)\big) \Big) 
For 
a(k, k) \leftarrow \sum_{i' \neq k} \max(0, \; r(i', k)) 
Responsibility reflects a candidate’s suitability; availability reflects the support from other points.
4. Iterative Updates and Convergence
Exemplars are points where:
r(i,i) + a(i,i) > 0 
Each point is then assigned to its nearest exemplar, forming clusters.
Visualizing the Process
In Affinity Propagation, messages are passed between data points in two main steps:
Responsibility (Left Side): These messages shows how each data point communicates with its candidate exemplars. Each point sends responsibility messages to suggest how suitable it is to be chosen as an exemplar.
Availability (Right Side): These messages reflect how appropriate it is for each data point to choose its corresponding exemplar considering the support from other points. Essentially, these messages show how much support the candidate exemplars have.
Key Parameters Influencing Clustering
There are mainly two parameters that influence the process of clustering.
1. Preference
- Controls the number of exemplars (cluster centers).
- Higher preference → more exemplars → more clusters.
- Lower preference → fewer exemplars → fewer clusters.
- Choosing the right preference is important to balance under and over-clustering.
2. Damping Factor
- Helps stabilize the algorithm by limiting the update size between iterations.
- Without damping, the algorithm may oscillate or fail to converge.
- Typical values are between 0.5 and 1.0, with higher values slowing convergence but increasing stability.
Step-by-step implementation
Here we will see its step by step working:
1. Importing required libraries
At first we will import all required Python libraries like NumPy, Matplotlib, Seaborn, Pandas and Scikit learn.
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.cluster import AffinityPropagation
from sklearn import metrics
from sklearn.preprocessing import StandardScaler
import seaborn as sns
from itertools import cycle
2. Dataset loading and Pre-Processing
Now we load the dataset for clustering. After that we will use to Standard Scaler to prepare the dataset for Affinity propagation.
You can download the dataset from here.
data = pd.read_csv('/content/Mall_Customers-.csv').dropna().drop('CustomerID', axis=1)
features = ['Annual Income (k$)', 'Spending Score (1-100)']
X = data[features]
scaler = StandardScaler()
X_std = scaler.fit_transform(X)
3. Exploratory Data Analysis
Exploratory Data Analysis (EDA) helps us to gain deeper insights about the dataset which is very important in clustering algorithm implementation.Visualizing correlation matrix will help us to understand how the features are correlated to each other.
correlation_matrix = data.corr(numeric_only=True)
plt.figure(figsize=(7, 7))
sns.heatmap(correlation_matrix, annot=True, cmap="coolwarm", fmt=".2f",square=True)
plt.title("Correlation Matrix")
plt.show()
Output:
So from it we can see that we can only select these three features. And as you can see we have only selected two features in our code of Data loading subsection.
4. Pairwise Feature Scatter Plots
This plot grid shows scatter plots and histograms for every pair of features. It helps us understand feature distribution, relationships between variables and overall data patterns in a single view.
sns.pairplot(data, palette="Set1", hue="Genre", diag_kind="kde", height=2)
plt.suptitle("Pairwise Feature Scatter Plots", y=1.02)
plt.show()
Output:
5. Affinity Propagation Clustering and Performance Evaluation
We now apply Affinity Propagation by setting its key parameters:
- preference: Controls how likely a point is to become an exemplar and affects the number of clusters.
- max_iter: Maximum number of iterations allowed.
- convergence_iter: Number of stable iterations needed before the algorithm stops.
- random_state: Ensures consistent results across runs.
- damping: Slows updates to avoid oscillation; a value like 0.9 increases stability but slows convergence.
Preference = [-50, -40, -30, -20, -10]
silhouette_scores = []
for preference in Preference:
    model = AffinityPropagation(preference=preference, random_state=42)
    model.fit(X_std)
    
    # Evaluate only if more than one cluster is found
    if len(np.unique(model.labels_)) > 1:
        score = metrics.silhouette_score(X_std, model.labels_)
        silhouette_scores.append(score)
    else:
        silhouette_scores.append(np.nan)
plt.plot(Preference, silhouette_scores, marker='o')
plt.title('Preference vs Silhouette Score')
plt.xlabel('Preference')
plt.ylabel('Silhouette Score')
plt.grid()
plt.show()
Output:
Here -30 resulting in higher value of preference parameter is the optimal preference.
6. Applying Affinity Propagation Clustering
We will apply Affinity Propagation to group the data points into clusters.
af = AffinityPropagation(preference=-30, max_iter=50, damping=0.7,
                         random_state=42, convergence_iter=20).fit(X_std)
cluster_labels = af.labels_
print("Cluster labels:", cluster_labels)
Output:
7. Evaluating its Performance
We will evaluate its performance using Silhouette Score.
silhouette_score = metrics.silhouette_score(X_std, cluster_labels)
print(f"Silhouette Score: {silhouette_score:.4f}")
Output:
Silhouette Score: 0.5529643053885619
Silhouette Score of 0.5529 represents a reasonably good degree of separation between the clusters. TA silhouette score > 0 indicates some separation between clusters, but not necessarily no overlap. Values closer to 1 represent better clustering.
8. Visualizing Clusters
We will create a plot where clustering effect can be visualized.
plt.figure(figsize=(8, 6))
colors = cycle('bgrcmyk')
n_clusters_ = len(af.cluster_centers_indices_)
cluster_centers_indices = af.cluster_centers_indices_
labels = af.labels_
for k, col in zip(range(n_clusters_), colors):
    class_members = labels == k
    cluster_center = X.iloc[cluster_centers_indices[k]]
    plt.plot(X.iloc[class_members, 0], X.iloc[class_members, 1], col + '.')
    plt.plot(cluster_center[0], cluster_center[1], 'o',
             markerfacecolor=col, markeredgecolor='k', markersize=14)
    for x in X.iloc[class_members].values:
        plt.plot([cluster_center[0], x[0]], [cluster_center[1], x[1]], col, alpha=0.3)
plt.title(f'Affinity Propagation Clustering\nEstimated number of clusters: {n_clusters_}')
plt.xlabel('Annual Income (k$)')
plt.ylabel('Spending Score (1-100)')
plt.grid(True)
plt.show()
Output:
Applying Affinity Propagation resulted in 5 distinct and well-separated clusters, clearly segmenting the customers based on their income and spending scores
You can download the complete code from here .
Benefits
- Automatic cluster detection: Finds both number of clusters and centers without pre-specifying them.
- Robust to noise and outliers: Works well even with noisy data.
- Handles non-spherical clusters: Unlike K-Means, AP is not restricted to spherical clusters.
- Scalability: Suitable for moderately large datasets, but requires O(n2) memory for the similarity matrix.
Applications
- Image and Video Analysis: Used for object recognition, image segmentation and video summarization by grouping similar regions or objects.
- Natural Language Processing: Helps in document clustering, topic grouping and sentiment analysis by identifying similar text patterns.
- Bioinformatics: Applied to gene expression data, protein structure grouping and interaction network clustering to find meaningful biological patterns.
- Social Network Analysis: Identifies communities in networks by clustering users based on their connections.
- Market Segmentation: Groups customers by behavior, preferences or demographics to support targeted marketing.
