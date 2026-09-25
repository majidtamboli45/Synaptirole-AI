# Vectors for ML

> Source: https://www.geeksforgeeks.org/data-science/vectors-for-ml/

Vectors are used to represent data in numerical form so that machine learning algorithms can process, analyze, and learn from it effectively. They help convert real world information into a structured format that machines can understand.
- A vector is a mathematical object with magnitude and direction
- It is an ordered list of numbers, where each number represents a feature
- Also called components or elements of a data point
- Widely used in classification, regression, clustering and deep learning
- Forms the foundation of many machine learning algorithms
Example: A 2D vector can be written as
v = (x1, x2)
Code to Create and Print a Vector in NumPy
import numpy as np
vector = np.array([170, 65])
print("Vector:", vector)
Output
Vector: [170  65]
Scalars, Vectors and Matrices
- Scalars: Any single value from our dataset would represent a scalar like integers or floating-point numbers, employed in mathematical computation.
- Vectors: Vectors are one-dimensional number arrays that hold several values in a linear sequence.
- Matrices: Matrices are two-dimensional arrays of multiple vectors that are placed in rows and columns.
These mathematical structures play an essential role in machine learning models, facilitating effective calculations and data representation.
import numpy as np
mat = np.array([[1, 2, 3], 
                   [4, 5, 6], 
                   [7, 8, 9]])
print("Matrix:")
print(mat)
Output
Matrix:
[[1 2 3]
 [4 5 6]
 [7 8 9]]
Vectors in Machine Learning Models
Vectors are used at various points in machine learning models:
- Input: All data such as images, text or sensor readings must be converted into numerical form. These numbers are organized as vectors so models can process them efficiently.
- Model: Machine learning models, especially neural networks, rely on vector and matrix operations. Linear algebra operations like multiplication help update model parameters and improve accuracy.
- Outputs: Model outputs can be numbers, categories or vectors. In tasks like NLP or recommendations, output vectors are used for similarity, clustering or further predictions.
Types of Vectors
1. Row and Column Vectors
- A row vector is a one-dimensional array represented in a row format: (x1, x2, x3)
- A column vector is a one-dimensional array represented in a column notation:
\begin{bmatrix}x_1 \\x_2 \\x_3 \\\vdots \\x_n\end{bmatrix} 
2. Zero Vector
A vector with all elements as zero. Example:
v= (0, 0, 0)
Zero vectors are useful when solving optimization problems and are the origin in vector space.
3. Unit Vector
A vector of magnitude 1. It is frequently used to denote direction:
\mathbf{u} = \frac{\mathbf{v}}{\|\mathbf{v}\|} 
where 
4. Sparse and Dense Vectors
- Sparse Vectors consist primarily of zeros and are employed in text analysis and recommendation systems.
- Dense Vectors consist primarily of non-zero values and are employed in image processing and deep learning.
Importance of Vectors in Machine Learning
1. Feature Representation
Vectors are used to represent data points in numerical form. For example, in natural language processing (NLP), words are translated into word vectors by techniques such as Word2Vec or TF-IDF.
2. Distance and Similarity Measures
Similarity between data points is typically calculated in machine learning by vector distance measures like:
- Euclidean Distance: Quantitative measure of straight-line distance between two points.
- Cosine Similarity: Quantifies the cosine of the angle between two vectors to ascertain similarity.
3. Transformations and Projections
Vectors enable mathematical transformations such as rotation, scaling and translation. These are employed in methods such as Principal Component Analysis (PCA) to project datasets into lower dimensions.
Vector Operations
1. Vector Addition and Subtraction
import numpy as np
a = np.array([2, 3])
b = np.array([1, 4])
add = a + b
sub = a - b
print("Addition:", add)
print("Subtraction:", sub)
Output
Addition: [3 7]
Subtraction: [ 1 -1]
2. Scalar Multiplication
import numpy as np
a = np.array([1, 2, 3])
scalar = 3
res = scalar * a
print("Scalar Multiplication:", res)
Output
Scalar Multiplication: [3 6 9]
3. Dot Product
import numpy as np
a = np.array([1, 2, 3])
b = np.array([4, 5, 6])
prod = np.dot(a, b)
print("Dot Product:", prod)
Output
Dot Product: 32
4. Cross Product
import numpy as np
c = np.array([1, 2, 3])
d = np.array([4, 5, 6])
prod = np.cross(c, d)
print("Cross Product:", prod)
Output
Cross Product: [-3  6 -3]
Application
- Linear regression models relationships using vectors for features, weights, and bias.
- SVMs use vectors to find the optimal hyperplane for classification.
- Neural networks represent weights, activations, and gradients as vectors.
- K-Means clusters data points based on vector distances.
- Word embeddings map words to vectors to capture meaning.
- Sentence and document embeddings represent text as vectors for deeper understanding.
