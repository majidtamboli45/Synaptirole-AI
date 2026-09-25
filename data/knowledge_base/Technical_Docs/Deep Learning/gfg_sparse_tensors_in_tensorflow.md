# Sparse tensors in Tensorflow

> Source: https://www.geeksforgeeks.org/deep-learning/sparse-tensors-in-tensorflow/

Imagine you are working with a massive dataset which is represented by multi-dimensional arrays called tensors. In simple terms, tensors are the building blocks of mathematical operations on the data. However, sometimes, tensors can have majority of values as zero. Such a tensor with a lot of zero values is called as sparse tensor.
Sparse tensors are mostly encountered in the fields of computer vision and natural language processing. These can be pretty overwhelming at times. Therefore, in this article we will be discussing various aspect related to sparse tensors. You will have the following concepts cleared when you read this article:
Table of Content
What are Sparse Tensors?
Sparse tensor is a term specifically defining those vectors which have a multitude of zero values. Unlike other tensors which holds majority non-zero values, sparse vectors have different approach. Sparse vector smartly optimizes the storage and computation by keeping track of non-zero values only. Hence, they are idea for the scenarios of sparsity.
For example, you have a gigantic chessboard which has most of its squares empty (zero values). A sparse vector is like a clever agent which focuses more on the pieces (non-zero values) and their precise positions. It doesn't bother about the empty squares and thereby, reduces storage requirements and computational load associated with unnecessary zero values.
In TensorFlow, you can represent a sparse tensor by using tf.sparse.SparseTensor object. They are currently encoded using the coordinate list (COO) format. It neatly organizes the non-zero values, their corresponding indices, and the overall shape of the tensor. A special thing about sparse tensor is that it maintains the essence of the data while discarding the noise. Thus, we finally have an efficient way of storing and processing large datasets.
How to create Sparse Tensors in TensorFlow?
There are two ways to create a sparse tensor. Both of the ways are discussed in detail with an example below:
By Directly Specifying Indices and Values
As we discussed earlier, you can represent sparse tensor by the tf.sparse.SparseTensor object. Now, we will see how we can create sparse tensors in TensorFlow. When you are creating a sparse tensor, you need to specify the following three components:
- Values: These are the non-zero values, represented in 1D tensor.
- Indices: These are the indices of the non-zero values in the tensor, represented in 2D tensor.
- Dense Shape: It specifies the overall shape of the tensor in 1D tensor.
import tensorflow as tf
# Define non-zero values and their indices
values = tf.constant([41, 30], dtype=tf.int32)
indices = tf.constant([[1, 2], [3, 3]], dtype=tf.int64)
dense_shape = tf.constant([4, 8], dtype=tf.int64)
# Create a sparse tensor
sparse_tensor = tf.sparse.SparseTensor(indices=indices, values=values, dense_shape=dense_shape)
# Print the sparse tensor
print(sparse_tensor)
Output:
SparseTensor(indices=tf.Tensor(
[[1 2]
[3 3]], shape=(2, 2), dtype=int64), values=tf.Tensor([41 30], shape=(2,), dtype=int32), dense_shape=tf.Tensor([4 8], shape=(2,), dtype=int64))
The above code shows that we have created a sparse tensor using with two non-zero values 41 and 30 which are at indices (1, 2) and (3, 3), respectively. The tf.sparse.SparseTensor constructor is then used to create the sparse tensor by providing the values, indices, and dense_shape. When we print the sparse vector we get the structure of indices, values, and dense_shape.
Creating from Dense Tensor
In case you are working on a large dataset, basically comprising all tensors. However, you notice that most of the values in the tensor are zero. Then, you can use tf.sparse module to work with sparse tensors. Here, you will have to choose tf.sparse.from_dense method.
import tensorflow as tf
# Create a dense tensor
dense_tensor = tf.constant([[1, 0, 0], [0, 0, 2], [0, 3, 0]], dtype=tf.float32)
# Convert the dense tensor to a sparse tensor
sparse_tensor = tf.sparse.from_dense(dense_tensor)
# Print the dense and sparse tensors
print("Dense Tensor:")
print(dense_tensor)
print("\nSparse Tensor:")
print(sparse_tensor)
Output:
Dense Tensor:
tf.Tensor(
[[1. 0. 0.]
[0. 0. 2.]
[0. 3. 0.]], shape=(3, 3), dtype=float32)
Sparse Tensor:
SparseTensor(indices=tf.Tensor(
[[0 0]
[1 2]
[2 1]], shape=(3, 2), dtype=int64), values=tf.Tensor([1. 2. 3.], shape=(3,), dtype=float32), dense_shape=tf.Tensor([3 3], shape=(2,), dtype=int64))
In the above code, we have our dense tensor stored in the dense_tensor variable. Then we simply use tf.sparse.from_dense method with dense_tensor and get our sparse tensor. You can see both the dense and the sparse vector in the output.
How to manipulate sparse tensors?
You can manipulate sparse tensors in multiple ways using different methods. It is completely at you discretion what operation you want to do with your tensor. We will see different ways we can manipulate the sparse tensors in TensorFlow.
There is a package called tf.sparse package which consist of all the tools and methods that allow us to perform arithmetic manipulations, matrix multiplications, concatenation, and more. Let us discuss few of them.
Arithmetic Manipulations
Traditional arithmetic manipulations are not directly applicable on sparse tensors. Therefore, to add sparse tensors of same shape we use tf.sparse.add function. You can study the code give below. It shows two sparse tensors which are added and the result is stored in the result_sparse_tensor variable.
import tensorflow as tf
# Create two sparse tensors
sparse_tensor1 = tf.sparse.SparseTensor(indices=[[0, 3], [2, 4]],
                      values=[10, 20],
                      dense_shape=[5, 5])
sparse_tensor2 = tf.sparse.SparseTensor(indices=[[1, 2], [4, 2]],
                      values=[30, 40],
                      dense_shape=[5, 5])
# Add sparse tensors
result_sparse_tensor = tf.sparse.add(sparse_tensor1, sparse_tensor2)
# Print the result
print(result_sparse_tensor)
Output:
SparseTensor(indices=tf.Tensor(
[[0 3]
[1 2]
[2 4]
[4 2]], shape=(4, 2), dtype=int64), values=tf.Tensor([10 30 20 40], shape=(4,), dtype=int32), dense_shape=tf.Tensor([5 5], shape=(2,), dtype=int64))
Sparse-Dense Matrix Multiplication
If you want to multiply a sparse tensor and a dense tensor you can use tf.sparse.sparse_dense_matmul method as given below.
import tensorflow as tf
# Define a sparse tensor
sparse_indices = tf.constant([[0, 2], [1, 0], [1, 2], [2, 1]], dtype=tf.int64)
sparse_values = tf.constant([1.0, 2.0, 3.0, 4.0], dtype=tf.float32)
sparse_shape = tf.constant([3, 3], dtype=tf.int64)
sparse_tensor = tf.sparse.SparseTensor(indices=sparse_indices, values=sparse_values, dense_shape=sparse_shape)
# Define a dense matrix
dense_matrix = tf.constant([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0], [7.0, 8.0, 9.0]], dtype=tf.float32)
# Perform sparse-dense matrix multiplication
result_dense_matrix = tf.sparse.sparse_dense_matmul(sparse_tensor, dense_matrix)
# Print the result
print("Sparse Tensor:")
print(sparse_tensor)
print("\nDense Matrix:")
print(dense_matrix)
print("\nResult of Sparse-Dense Matrix Multiplication:")
print(result_dense_matrix)
Output:
Sparse Tensor:
SparseTensor(indices=tf.Tensor(
[[0 2]
[1 0]
[1 2]
[2 1]], shape=(4, 2), dtype=int64), values=tf.Tensor([1. 2. 3. 4.], shape=(4,), dtype=float32), dense_shape=tf.Tensor([3 3], shape=(2,), dtype=int64))
Dense Matrix:
tf.Tensor(
[[1. 2. 3.]
[4. 5. 6.]
[7. 8. 9.]], shape=(3, 3), dtype=float32)
Result of Sparse-Dense Matrix Multiplication:
tf.Tensor(
[[ 7. 8. 9.]
[23. 28. 33.]
[16. 20. 24.]], shape=(3, 3), dtype=float32)
Concatenation
In order to concatenate two sparse tensors, you can use tf.sparse.concat method. Check the example given below that concatenates two sparse tensors.
import tensorflow as tf
# Create two sparse tensors
sparse_indices1 = tf.constant([[0, 1], [1, 0], [2, 2]], dtype=tf.int64)
sparse_values1 = tf.constant([9, 2, 5], dtype=tf.int32)
sparse_shape1 = tf.constant([3, 3], dtype=tf.int64)
sparse_tensor1 = tf.sparse.SparseTensor(indices=sparse_indices1, values=sparse_values1, dense_shape=sparse_shape1)
sparse_indices2 = tf.constant([[3, 1], [4, 0]], dtype=tf.int64)
sparse_values2 = tf.constant([6, 8], dtype=tf.int32)
sparse_shape2 = tf.constant([5, 3], dtype=tf.int64)
sparse_tensor2 = tf.sparse.SparseTensor(indices=sparse_indices2, values=sparse_values2, dense_shape=sparse_shape2)
# Concatenate sparse tensors vertically
result_sparse_tensor = tf.sparse.concat(axis=0, sp_inputs=[sparse_tensor1, sparse_tensor2])
# Print the result
print("Sparse Tensor 1:")
print(sparse_tensor1)
print("\nSparse Tensor 2:")
print(sparse_tensor2)
print("\nResult of Concatenation:")
print(result_sparse_tensor)
Output:
Sparse Tensor 1:
SparseTensor(indices=tf.Tensor(
[[0 1]
[1 0]
[2 2]], shape=(3, 2), dtype=int64), values=tf.Tensor([9 2 5], shape=(3,), dtype=int32), dense_shape=tf.Tensor([3 3], shape=(2,), dtype=int64))
Sparse Tensor 2:
SparseTensor(indices=tf.Tensor(
[[3 1]
[4 0]], shape=(2, 2), dtype=int64), values=tf.Tensor([6 8], shape=(2,), dtype=int32), dense_shape=tf.Tensor([5 3], shape=(2,), dtype=int64))
Result of Concatenation:
SparseTensor(indices=tf.Tensor(
[[0 1]
[1 0]
[2 2]
[6 1]
[7 0]], shape=(5, 2), dtype=int64), values=tf.Tensor([9 2 5 6 8], shape=(5,), dtype=int32), dense_shape=tf.Tensor([8 3], shape=(2,), dtype=int64))
Slicing
It is very easy to slice a sparse tensor. You simply need to use tf.sparse.slice function like give below in the code.
import tensorflow as tf
# Create a sparse tensor
sparse_indices = tf.constant([[0, 1], [1, 0], [2, 2], [2, 3]], dtype=tf.int64)
sparse_values = tf.constant([7, 14, 12, 11], dtype=tf.int32)
sparse_shape = tf.constant([3, 4], dtype=tf.int64)
sparse_tensor = tf.sparse.SparseTensor(indices=sparse_indices, values=sparse_values, dense_shape=sparse_shape)
# Print the original sparse tensor
print("Original Sparse Tensor:")
print(sparse_tensor)
# Slice the sparse tensor
sliced_sparse_tensor = tf.sparse.slice(sparse_tensor, start=[1, 0], size=[2, 3])
# Print the sliced sparse tensor
print("\nSliced Sparse Tensor:")
print(sliced_sparse_tensor)
Output:
Original Sparse Tensor:
SparseTensor(indices=tf.Tensor(
[[0 1]
[1 0]
[2 2]
[2 3]], shape=(4, 2), dtype=int64), values=tf.Tensor([ 7 14 12 11], shape=(4,), dtype=int32), dense_shape=tf.Tensor([3 4], shape=(2,), dtype=int64))
Sliced Sparse Tensor:
SparseTensor(indices=tf.Tensor(
[[0 0]
[1 2]], shape=(2, 2), dtype=int64), values=tf.Tensor([14 12], shape=(2,), dtype=int32), dense_shape=tf.Tensor([2 3], shape=(2,), dtype=int64))
Elementwise Operations
If you want to perform elementwise operations on nonzero values in sparse tensors (TensorFlow 2.4 and higher), you can use tf.sparse.map_values to do the same.
import tensorflow as tf
# Create a sparse tensor
sparse_indices = tf.constant([[0, 1], [1, 0], [2, 2], [2, 3]], dtype=tf.int64)
sparse_values = tf.constant([21,11,13, 8], dtype=tf.int32)
sparse_shape = tf.constant([3, 4], dtype=tf.int64)
sparse_tensor = tf.sparse.SparseTensor(indices=sparse_indices, values=sparse_values, dense_shape=sparse_shape)
# Print the original sparse tensor
print("Original Sparse Tensor:")
print(sparse_tensor)
# Define an elementwise operation function
def elementwise_operation(value):
    return value * 2
# Apply elementwise operation to nonzero values
result_sparse_tensor = tf.sparse.map_values(elementwise_operation, sparse_tensor)
# Print the result
print("\nResult of Elementwise Operation:")
print(result_sparse_tensor)
Output:
Original Sparse Tensor:
SparseTensor(indices=tf.Tensor(
[[0 1]
[1 0]
[2 2]
[2 3]], shape=(4, 2), dtype=int64), values=tf.Tensor([21 11 13 8], shape=(4,), dtype=int32), dense_shape=tf.Tensor([3 4], shape=(2,), dtype=int64))
Result of Elementwise Operation:
SparseTensor(indices=tf.Tensor(
[[0 1]
[1 0]
[2 2]
[2 3]], shape=(4, 2), dtype=int64), values=tf.Tensor([42 22 26 16], shape=(4,), dtype=int32), dense_shape=tf.Tensor([3 4], shape=(2,), dtype=int64))
Handling Sparse Tensors: Distinguishing Zero vs Missing Values
Thus, you would have understood so far that Sparse tensors in TensorFlow offer a powerful mechanism for efficiently managing datasets with a large number of zero values. But in some cases, you need to distinguish between explicit zero values and missing values becomes crucial for accurate data representation.
Therefore, now we will understand how we can handle sparse tensors while maintaining this distinction.
Representing Missing Values
In most of the operations, sparse tensors are designed to treat explicit zeros and missing values as identical. But, at some point you might need to differentiate between them in some cases. For example, if you have a tensor of score and some of the values are missing and can have any floating-point value between -Inf and +Inf. Thus, using a sparse tensor to represent missing data instead of zero allows to encode this information accurately.
Operations Consideration
As we mentioned earlier, sparse tensors treat explicit zeros values and missing values as the same for most of the operations on tf.sparse.SparseTensors. However, if you use tf.sparse.reduce_max , it will not treat missing value as zero.
import tensorflow as tf
# Create a sparse tensor with explicit zeros and missing values
sparse_indices = tf.constant([[0, 0], [1, 1], [2, 2]], dtype=tf.int64)
sparse_values = tf.constant([0.0, 0.0, 3.0], dtype=tf.float32)
sparse_shape = tf.constant([3, 3], dtype=tf.int64)
sparse_tensor = tf.sparse.SparseTensor(indices=sparse_indices, values=sparse_values, dense_shape=sparse_shape)
# Reduce max, treating missing values as zeros
result_max = tf.sparse.reduce_max(sparse_tensor)
# Print the result
print("Result of reduce_max:", result_max.numpy())
Output:
Result of reduce_max: 3.0
Explicit Zeros and Missing Data
You should know while creating sparse tensors that certain operations, like tf.sparse.reduce_max, do not differentiate between explicit zeros and missing values. Therefore, encoding this information appropriately during data preprocessing is crucial for accurate representation.
Therefore, when you understand intricacies of sparse tensor handling you can tailor your data representation to specific use cases. This nuanced approach allows you to encode unknown or absent data, contributing to more accurate and meaningful analyses.
