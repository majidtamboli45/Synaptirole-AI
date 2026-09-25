# How to Reshape a Tensor in Tensorflow?

> Source: https://www.geeksforgeeks.org/deep-learning/how-to-reshape-a-tensor-in-tensorflow/

Tensor reshaping is the process of reshaping the order and total number of elements in tensors while only the shape is being changed. It is a fundamental operation in TensorFlow that allows you to change the shape of a tensor without changing its underlying data.
Using tf.reshape()
In TensorFlow, the tf.reshape() function is used to reshape tensors.
Syntax:
tf.reshape(tensor, shape, name=None)
Parameters:
tensor: The tensor which you want to change the shape of.
shape: The shape of the output tensor.
The name is an optional parameter that would allow you to set a name for the operation.
Datatypes In Tensorflow
A list of some commonly used data types in TensorFlow:
- tf.float16: 16-bit floating-point.
- tf.float32: 32-bit floating-point.
- tf.float64: 64-bit floating-point.
- tf.int8: 8-bit integer.
- tf.int16: 16-bit integer.
- tf.int32: 32-bit integer.
- tf.int64: 64-bit integer.
- tf.uint8: 8-bit unsigned integer.
- tf.bool: Boolean.
- tf.string: String.
These data types can be specified when creating tensors or operations using TensorFlow functions like tf.constant(), tf.Variable(), etc. By default, TensorFlow uses tf.float32 for floating-point numbers and tf.int32 for integers.
Importing Tensorflow
import tensorflow as tf
Initial Tensor Shape
- We will describe the initial tensor t1, with tf.constant with its values and shape usingtf.shape() .
- Displaying the shape using .numpy() for clarity.
t1 = tf.constant([[9, 7, 8],
                  [11, 4, 0]])
print('Tensor :\n', t1)
print('\nShape of Tensor:', tf.shape(t1).numpy())
Output:
Tensor :
tf.Tensor(
[[ 9 7 8]
[11 4 0]], shape=(2, 3), dtype=int32)
Shape of Tensor: [2 3]
Reshaping to a 1D Tensor
- TensorFlow provides the tf.reshape() function to reshape tensors.
- The second argument of tf.reshape() specifies the desired shape of the output tensor.
- In this case, [6] indicates that the output tensor should have a single dimension with 6 elements.
t2 = tf.reshape(t1, [6])
print('Tensor :\n', t2)
print('\nShape of Tensor:', tf.shape(t2).numpy())
Output:
Tensor :
tf.Tensor([ 9 7 8 11 4 0], shape=(6,), dtype=int32)
Shape of Tensor: [6]
Reshaping to a 2D Tensor
The code below reshapes the original tensor t2 into a 2D tensor with dimensions 1 row and 6 columns.
t3 = tf.reshape(t2, [1, 6])
print('Tensor :\n', t3)
print('\nShape of Tensor:', tf.shape(t3).numpy())
Output:
t3 = tf.reshape(t2, [1,6])
print('Tensor :\n',t3)
print('\nShape of Tensor:',tf.shape(t3).numpy())
- After reshaping, t2 will be a 2D tensor with 1 row and 6 columns.
- The elements of t1 will be arranged in this single row.
Using Transposition Operations to Reshape
We use permuted dimensions to control the arrangement of dimensions in the output tensor, allowing for flexibility in tensor transformations such as transposition.
- The original tensor t is defined as a 2D tensor with two rows and three columns, represented as a Python list of lists.
- Reshaping the tensor using tf.reshape() rearranges its elements to match a specified shape, resulting in a 3x2 tensor.
- Transposing the tensor with tf.transpose() changes the arrangement of dimensions. Here, theperm argument[1, 0] indicates that the rows and columns should be swapped, resulting in a transposed tensor.
- The reshaped and transposed tensors are converted to NumPy arrays using .numpy() for ease of printing and handling.
import tensorflow as tf
# Original tensor
t = tf.constant([[1, 2, 3],
                 [4, 5, 6]])
print('Original Tensor:')
print(t)
# Reshaping into a 3x2 tensor
reshaped_tensor = tf.reshape(t, [3, 2])
print("\nReshaped tensor:")
print(reshaped_tensor)
# Transposing with permuted dimensions
transposed_tensor = tf.transpose(t, perm=[1, 0])
print("\nTransposed tensor:")
print(transposed_tensor)
Output:
Original Tensor:
tf.Tensor(
[[1 2 3]
[4 5 6]], shape=(2, 3), dtype=int32)
Reshaped tensor:
tf.Tensor(
[[1 2]
[3 4]
[5 6]], shape=(3, 2), dtype=int32)
Transposed tensor:
tf.Tensor(
[[1 4]
[2 5]
[3 6]], shape=(3, 2), dtype=int32)
- This tensor represents a 3x2 structure where each row contains two elements.
- The original tensor was reshaped from a 2x3 structure to this 3x2 arrangement.
Using the special value -1 as shape
- tf.reshape(t, [-1]) uses TensorFlow'stf.reshape() function to reshape the input tensort .
- The [-1] argument indicates that the output tensor should be reshaped into a 1D tensor (vector) where TensorFlow infers the size of one dimension based on the total number of elements in the original tensor. In other words, it flattens the original 2D tensor into a 1D tensor.
t = tf.constant([[1, 2, 3],
                [4, 5, 6]])
# Reshape into a 1D tensor (flattened)
result = tf.reshape(t, [-1])
# Print the result
print('Flattened Tensor:\n',result) 
print('\n Original Tensor Shape:',tf.shape(t))  
print('Flattened Tensor Shape:',tf.shape(result))  
Output:
Flattened Tensor:
tf.Tensor([1 2 3 4 5 6], shape=(6,), dtype=int32)
Original Tensor Shape: tf.Tensor([2 3], shape=(2,), dtype=int32)
Flattened Tensor Shape: tf.Tensor([6], shape=(1,), dtype=int32)
