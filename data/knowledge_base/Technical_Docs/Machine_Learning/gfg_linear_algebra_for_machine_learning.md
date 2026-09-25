# Linear Algebra For Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/ml-linear-algebra-operations/

Linear algebra is a core mathematical foundation for machine learning, as most datasets and models are represented using vectors and matrices. It allows efficient computation, data manipulation and optimization, making complex tasks manageable.
- Data in ML is represented as vectors (features) and matrices (datasets).
- Operations like dot product, matrix multiplication and transformations power ML algorithms.
- Key concepts such as eigenvalues, eigenvectors and decompositions simplify dimensionality reduction, optimization and training.
- Algorithms like PCA, SVD, regression, SVMs and neural networks rely heavily on linear algebra.
Fundamental Concepts
Linear algebra uses three basic types of mathematical objects: vectors, matrices and scalars. These are widely used in machine learning to represent data and perform calculations.
1. Vectors
A Vectors is an ordered list of numbers. In machine learning, vectors are commonly used to represent the features of a data point.
For example: 
2. Matrices
Matrices are ectangular arrangement of numbers in rows and columns. In machine learning, matrices are commonly used to store datasets, where rows represent data points and columns represent features.
Example: 
- Here, the matrix has 3 rows and 3 columns.
3. Scalars
Scalars are single numerical values, without direction, magnitude only. Scalars are just single numbers that can multiply vectors or matrices. In machine learning, they’re used to adjust things like the weights in a model or the learning rate during training
Example: Let's consider a scalar, k= 3 and a vector 
Scalar multiplication involves multiplying each component of the vector by the scalar. So, if we multiply the vector v by the scalar k= 3 we get:
Operations in Linear Algebra
Linear algebra provides several operations for working with vectors and matrices. These operations are widely used in machine learning for calculations, data processing and model computations.
Addition & Subtraction: To add or subtract two vectors or matrices, they must have the same dimensions. Add or subtract the corresponding elements.
Example: u = [ 2, −1, 4], v = [ 3, 0, −2]
Addition: u +v = [ 5, −1, 2]
Subtraction: u −v = [ −1, −1, 6]
Scalar Multiplication: Scalar multiplication means multiplying every element of a vector or matrix by the same number.
Example: 3⋅ [ 2, −1, 4] = [ 6, −3, 12]
Here, 3 is the scalar and each element of the vector is multiplied by 3.
Dot Product: The dot product multiplies corresponding elements of two vectors and then adds the results. It produces a single number.
Example: u⋅ v= u1v1+ u2v2+ u3v3
The dot product is widely used in machine learning for similarity calculations, projections and model computations.
Cross Product: The cross product is defined for 3D vectors. It produces a new vector that is perpendicular to both input vectors.
Example: u= [u1 , u2 , u3], v = [ v1 , v2 , v3 ]
the cross product is: u × v = [u2v3− u3v2, u3v1 −u1v3, u1v2−u2v1 ]
Linear Transformations
Linear transformations are basic operations in linear algebra that change vectors and matrices while keeping important properties like straight lines and proportionality. In machine learning, they are key for tasks like preparing data, creating features and training models. This section covers the definition, types and uses of linear transformations.
Definition: A transformation T is linear if it satisfies:
- Additivity: T(u+v) = T(u)+T(v)
- Homogeneity: T(kv) = k T(v)
Common Types in ML
- Scaling : Normalizing features so no single feature dominates.
- Rotation : Turning data, often used in computer vision and robotics.
Matrix Operations
Matrix operations are central to linear algebra and widely used in machine learning for data handling, transformations and model training. The most common ones are:
- Matrix Multiplication: Combines two matrices by taking the dot product of rows and columns. Used in feature transformations, parameter computation and neural network operations.
 Example:A = \begin{bmatrix} 2 & 1 \\ 1 & 2 \end{bmatrix}, \quad B = \begin{bmatrix} 3 & 0 \\ 1 & 2 \end{bmatrix}, \quad A \times B = \begin{bmatrix} 7 & 2 \\ 5 & 4 \end{bmatrix}
- Transpose: Flips a matrix across its diagonal (rows become columns). Denoted by AT.
- Inverse: The matrix A−1 satisfies A \cdot A^{-1} = I . Exists only if det(A) ≠ 0. Used in solving equations and optimization.
- Determinant: A scalar value indicating whether a matrix is invertible. If det(A) = 0, the matrix cannot be inverted.
Eigenvalues and Eigenvectors
Eigenvalues and eigenvectors describe how matrices transform space, making them fundamental in many ML algorithms.
- Eigenvalues (λ): Scalars showing how much a transformation stretches or compresses along a direction.
- Eigenvectors (v): Non-zero vectors that only scale (not change direction) under transformation.
Example: For 
solving det(A−λI) = 0 gives λ1 = 1,λ2 = 3.
- \lambda_1=1 \rightarrow v_1=\begin{bmatrix} 1 \\ -1 \end{bmatrix}
- \lambda_2=3 \rightarrow v_2=\begin{bmatrix} 1 \\ 1 \end{bmatrix}
Eigen Decomposition: 
- where Q holds eigenvectors and Λ is diagonal with eigenvalues.
Applications in ML:
- Dimensionality Reduction (PCA): Keeps directions with largest eigenvalues (most variance).
- Matrix Factorization (SVD, NMF): Breaks large datasets into smaller, structured parts for feature extraction.
Solving Linear Systems of Equations
Linear systems are common in machine learning for parameter estimation and optimization. Key methods include:
1. Gaussian Elimination: Transforms a matrix into row-echelon form using row operations. Steps:
- Forward Elimination -> make entries below diagonal zero
- Back Substitution -> solve variables from last row upward
- Pivoting -> swap rows to avoid division by zero
2. LU Decomposition: Splits a matrix into Lower (L) and Upper (U) triangular matrices. Solves systems efficiently using forward and back substitution.
3. QR Decomposition: Splits a matrix into Orthogonal (Q) and Upper triangular (R). Useful for least squares problems and eigenvalue computation.
Applications
Linear algebra powers many ML algorithms by enabling data manipulation, model representation and optimization. Key applications include:
- PCA (Principal Component Analysis): Reduces dimensionality by computing covariance, eigenvalues/eigenvectors and projecting data onto principal components.
- SVD (Singular Value Decomposition): Factorizes a matrix into A = UΣVT, used for dimensionality reduction, compression and noise filtering.
- Linear Regression: Models relationships via matrix form Y = Xβ+ ϵ, solved using the normal equation XTXβ = XTY.
- SVM (Support Vector Machines): Uses the kernel trick and optimization to find decision boundaries for classification and regression.
- Neural Networks: Depend on matrix multiplications, gradient descent and weight initialization for training deep models.
