# Dimensionality Reduction Techniques

> Source: https://www.geeksforgeeks.org/data-science/dimensionality-reduction-techniques/

Dimensionality reduction is the process of reducing the number of input variables in a dataset while retaining the most important information. It helps to improve model performance, reduces noise and makes complex data easier to visualize and interpret. In this article we will see various Dimensionality Reduction Techniques each designed to uncover hidden structures in high dimensional data.
Various Dimensionality Reduction Techniques
1. Principal Component Analysis (PCA)
- Principal Component Analysis (PCA) is a classic linear dimensionality reduction method that identifies the directions called principal components in which the data varies the most.
- It works by calculating the covariance matrix of the features and finding its eigenvectors and eigenvalues. The top k eigenvectors with the largest eigenvalues define the new axes that capture the most variance in the data.
- By projecting the original data onto these axes, PCA reduces the number of features while retaining as much information as possible. It’s fast, robust and especially effective when the dataset has linearly correlated features. However, it cannot capture complex non linear relationships.
2. Linear Discriminant Analysis (LDA)
- Linear Discriminant Analysis (LDA) is a supervised linear technique designed to find a feature subspace that best separates multiple classes. It does this by maximizing the ratio of between class variance to within class variance in the data, which leads to better class discrimination in the lower-dimensional space.
- It works under the assumption that each class is normally distributed with identical covariance matrices as it focuses on class separability.
- It is very popular in classification tasks like face recognition or handwriting recognition but it is not suitable for purely unsupervised settings.
3. t-Distributed Stochastic Neighbor Embedding (t-SNE)
- t-SNE is a non linear non linear manifold learning technique mainly used for visualization. It converts high dimensional pairwise distances into conditional probabilities that represent similarities between points.
- In the lower-dimensional space usually 2D or 3D it arranges points so that similar points stay close together while dissimilar ones stay apart.
- By minimizing the divergence between these probability distributions t-SNE reveals clusters and local structures that other techniques might miss. It works well for exploring patterns in embeddings but is computationally expensive and does not preserve global distances well.
4. Independent Component Analysis (ICA)
- Independent Component Analysis (ICA) is a linear technique that focuses on separating a multivariate signal into additive, statistically independent non Gaussian components.
- Unlike PCA which decorrelates data by finding orthogonal axes ICA goes further by maximizing statistical independence often using measures like kurtosis or negentropy.
- This makes it particularly useful for blind source separation problems like separating overlapping audio signals. ICA assumes the source signals are non gaussian and independent so it’s less effective when this isn’t true.
5. Non negative Matrix Factorization (NMF)
- NMF factorizes a non negative data matrix into two non negative lower rank matrices. This decomposition enforces a parts based representation because the components must add up not subtract from each other.
- This is useful when the data naturally has non negative features like pixel intensities or word counts.
- It has gained popularity in image processing, topic modeling and bioinformatics because it produces more interpretable results compared to methods like PCA which may mix positive and negative components.
6. FastICA
- FastICA is an optimized and faster version of ICA that uses a fixed point iteration scheme to efficiently find independent components. It’s widely used when standard ICA would be too slow specially for large datasets or realtime applications.
- It preserves the core idea of maximizing non Gaussianity to extract independent sources but improves convergence speed and stability. It’s commonly used in signal processing tasks like EEG analysis and audio source separation where quick and reliable separation is needed.
7. Isomap (Isometric Mapping)
- Isomap is a non linear algorithm that extends classical Multidimensional Scaling (MDS). Instead of preserving straight line distances, Isomap computes geodesic distances the shortest paths along the manifold surface using a neighborhood graph.
- Then, MDS is applied to these geodesic distances to generate a low dimensional embedding that maintains the intrinsic geometry of the data.
- Isomap is effective when the data lies on a smooth, non linear manifold but it can be sensitive to outliers and requires careful tuning of the neighborhood size.
8. Locally Linear Embedding (LLE)
- Locally Linear Embedding (LLE) is another non linear manifold learning method that preserves local relationships within the data. It assumes that each data point can be reconstructed as a linear combination of its nearest neighbors.
- The algorithm first finds these local reconstruction weights in the original space and then maps the data to a lower dimensional space while preserving the same weights.
- This approach unfolds complex manifolds revealing the underlying structure. LLE is sensitive to the neighborhood size parameter and doesn’t preserve global distances well, but it’s very good at capturing local geometry.
9. Manifold Learning
- Manifold Learning is a broader concept that includes methods like Isomap, LLE, Hessian LLE, Laplacian Eigenmaps, t-SNE and UMAP.
- The idea is that high dimensional data often lies on a smooth, lower dimensional manifold embedded in a higher dimensional space. These techniques aim to uncover and flatten this manifold, preserving either local or global geometric relationships.
- Manifold learning is particularly valuable for visualizing and exploring complex data structures that cannot be captured by linear methods like PCA.
10. Autoencoders
- Autoencoders are a type of unsupervised neural network architecture designed to learn an efficient, compressed representation called encodings of input data.
- They consist of two main parts: an encoder which maps the input data to a lower dimensional latent space and a decoder which reconstructs the original data from this compressed representation.
- The network is trained to minimize the difference between the input and the reconstruction forcing it to learn the most important features. Unlike linear methods like PCA, autoencoders can capture complex non linear relationships as they use multiple hidden layers and non linear activation functions.
11. Multidimensional Scaling (MDS)
- Multidimensional Scaling (MDS) is a dimensionality reduction technique that helps visualize the similarities or dissimilarities between data points.
- It works by taking a matrix of pairwise distances and finding a lower dimensional space like 2D or 3D where these distances are preserved as much as possible.
- Unlike PCA, which focuses on maximizing variance and assumes linearity, MDS is more flexible because it directly uses distances, making it useful for uncovering hidden structures, clusters or patterns in complex datasets.
With these techniques we can easily do dimensionality reduction to our dataset.
Advantages of Dimensionality Reduction Techniques
- Improves the performance of machine learning models.
- Reduces training time and computation cost.
- Helps in removing irrelevant or duplicate features.
- Makes data easier to visualize in 2D or 3D.
- Makes models less likely to overfit.
- Helps in storing and processing large datasets efficiently.
- Reveals hidden patterns or structure in complex data.
