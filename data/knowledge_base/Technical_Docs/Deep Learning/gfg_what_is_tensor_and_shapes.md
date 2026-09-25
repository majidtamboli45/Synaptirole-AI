# What is Tensor and Tensor Shapes?

> Source: https://www.geeksforgeeks.org/deep-learning/what-is-tensor-and-tensor-shapes/

Tensors are multidimensional arrays, fundamental to TensorFlow's operations and computations. Understanding key concepts like tensor shape, size, rank, and dimension is crucial for effectively using TensorFlow in machine learning projects.
In this article, we are going to understand tensor and its properties.
What are Tensors?
In TensorFlow, tensors are the basic building blocks used to represent data. A tensor can be thought of as a multi-dimensional array, similar to a matrix but with an arbitrary number of dimensions. Tensors can hold various data types, including integers, floating-point numbers, and strings.
Tensors are important in deep learning frameworks like TensorFlow and PyTorch. The tensors are responsible to provide insights into the structure, dimensions, and size of the tensors. The properties of tensor includes Shape, Rank, Axis and Size.
What is Tensor Shape?
Tensor shape refers to the layout or structure of a tensor, which defines the number of dimensions and the size of each dimension in the tensor. It describes how many elements are along each axis of the tensor.
import tensorflow as tf 
# Create a tensor
tensor = tf.constant([[1, 2, 3], [4, 5, 6]])
# Get the shape of the tensor
shape = tensor.shape
print('Tensor: ', tensor)
print('Tensor shape: ', shape)
Output:
Tensor shape: (2, 3)
Tensor shape is crucial in TensorFlow as determines how the data is organized and how operations can be applied to the tensor. TensorFlow provides methods to get and manipulate the shape of a tensor, allowing developers to work with tensors effectively in machine learning models and other numerical computations.
What is Tensor Size?
Tensor size refers to the total number of elements in a tensor. It is the product of all the dimensions (sizes) of the tensor. In other words, it represents the total amount of data stored in the tensor.
import tensorflow as tf
tensor = tf.constant([[1, 2, 3], [4, 5, 6]])
# Get the size of the tensor
size = tf.size(tensor)
print("Tensor size: ", size)
Output:
Tensor size: tf.Tensor(6, shape=(), dtype=int32)
What is Tensor Rank?
Tensor rank, also known as the tensor's number of dimensions, is a fundamental concept in TensorFlow. It indicates the number of dimensions present in a tensor.
Here's a brief overview of tensor rank:
- Rank 0: Scalars. Tensors of rank 0 represent single values.
- Rank 1: Vectors. Tensors of rank 1 have one dimension and represent arrays of values.
- Rank 2: Matrices. Tensors of rank 2 have two dimensions and represent 2D arrays of values.
- Rank 3 and above: Tensors of rank 3 or higher have three or more dimensions and represent higher-dimensional arrays of values.
import tensorflow as tf
# Create tensors of different ranks
scalar = tf.constant(5)  # Rank 0 tensor (scalar)
vector = tf.constant([1, 2, 3])  # Rank 1 tensor (vector)
matrix = tf.constant([[1, 2], [3, 4]])  # Rank 2 tensor (matrix)
tensor_3d = tf.constant([[[1, 2], [3, 4]], [[5, 6], [7, 8]]])  # Rank 3 tensor (3D)
# Get the rank of tensors
rank_scalar = tf.rank(scalar)
rank_vector = tf.rank(vector)
rank_matrix = tf.rank(matrix)
rank_3d = tf.rank(tensor_3d)
print('Rank of scalar:', rank_scalar.numpy())
print('Rank of vector:', rank_vector.numpy())
print('Rank of matrix:', rank_matrix.numpy())
print('Rank of 3D tensor:', rank_3d.numpy())
Output:
Rank of scalar: 0
Rank of vector: 1
Rank of matrix: 2
Rank of 3D tensor: 3
What is Tensor Dimension?
Tensor dimension refers to the length along a particular axis of a tensor. In simpler terms, it is the size or extent of a tensor along a specific direction. Each axis of a tensor corresponds to a dimension, and the number of dimensions in a tensor is its rank.
import tensorflow as tf
tensor = tf.constant([[1, 2, 3], [4, 5, 6]])
shape = tensor.shape
# Get the length of the first dimension
dim1_length = shape[0]
# Get the length of the second dimension
dim2_length = shape[1]
print('Tensor shape:', shape)
print('Length of first dimension:', dim1_length)
print('Length of second dimension:', dim2_length)
Output:
Tensor shape: (2, 3)
Length of first dimension: 2
Length of second dimension: 3
