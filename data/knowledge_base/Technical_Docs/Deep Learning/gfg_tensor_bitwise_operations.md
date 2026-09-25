# Tensor Bitwise operations

> Source: https://www.geeksforgeeks.org/deep-learning/tensor-bitwise-operations/

Tensor bitwise operations in Python involve performing logical operations at the bit level on tensors, which are multi-dimensional arrays widely used in machine learning and deep learning frameworks like TensorFlow and PyTorch. These operations enable the manipulation of binary data efficiently, essential for tasks such as image processing, cryptography, and data compression. In this article, we are going to explore the tensor bitwise operations in TensorFlow.
Tensor Bitwise Operations
Here's a brief overview of some common bitwise operations and how they can be applied to tensors in TensorFlow:
- Bitwise AND (&): Performs the AND operation between corresponding bits of two tensors.
- Bitwise OR (|): Performs the OR operation between corresponding bits of two tensors.
- Bitwise XOR (^): Performs the XOR (exclusive OR) operation between corresponding bits of two tensors.
- Bitwise Inversion: Performs unary operation that flips each bit of its operand. .
- Shift Operations (<< and >>): Shifts the bits of the tensor left or right by a specified number of positions.
Bitwise AND Operation
In the following code snippet, we have demonstrated how to perform a bitwise AND operation between two TensorFlow tensors containing integer values. The resulting tensor contains the bitwise AND of corresponding elements from the input tensors.
The tf.bitwise.bitwise_and() function used in the code performs a bitwise AND operation element-wise between two TensorFlow tensors
import tensorflow as tf
# Define tensors
tensor1 = tf.constant([5, 3, 7])  # Binary: 101, 011, 111
tensor2 = tf.constant([3, 1, 5])  # Binary: 011, 001, 101
# Bitwise AND operation
result_and = tf.bitwise.bitwise_and(tensor1, tensor2)
print("Result of Bitwise AND Operation:")
print(result_and.numpy())  # Output: [1, 1, 5]
Output:
Result of Bitwise AND Operation:
[1 1 5]
Bitwise OR with Shifting
The following code performs a bitwise OR operation between two TensorFlow tensors followed by a left shift operation by 2 bits on the resulting tensor. The resulting tensor contains the bitwise OR of corresponding elements from the input tensors, followed by a left shift by 2 bits.
The tf.bitwise.bitwise_or() function is applied to tensor1 and tensor2 to perform a bitwise OR operation between corresponding elements.
The tf.bitwise.left_shift() function is applied to the result of the bitwise OR operation (result_or).
import tensorflow as tf
# Define tensors
tensor1 = tf.constant([5, 3, 7])  # Binary: 101, 011, 111
tensor2 = tf.constant([3, 1, 5])  # Binary: 011, 001, 101
# Bitwise OR operation
result_or = tf.bitwise.bitwise_or(tensor1, tensor2)
# Bitwise shift left by 2 bits
result_shifted = tf.bitwise.left_shift(result_or, 2)
print("Result of Bitwise OR and Shift Operation:")
print(result_shifted.numpy())  # Output: [40, 28, 120]
Output:
Result of Bitwise OR and Shift Operation:
[28 12 28]
Bitwise XOR with Bit Counting
The code performs a bitwise XOR operation between two TensorFlow tensors followed by counting the number of set bits (1s) in each element of the resulting tensor. The output represents the count of set bits in each element after performing the bitwise XOR operation.
The tf.bitwise.bitwise_xor() function is applied to tensor1 and tensor2 to perform a bitwise XOR operation between corresponding elements.
import tensorflow as tf
# Define tensors
tensor1 = tf.constant([5, 3, 7])  # Binary: 101, 011, 111
tensor2 = tf.constant([3, 1, 5])  # Binary: 011, 001, 101
# Bitwise XOR operation
result_xor = tf.bitwise.bitwise_xor(tensor1, tensor2)
# Count number of set bits (1s)
count_bits = tf.math.count_nonzero(result_xor, axis=-1)
print("Result of Bitwise XOR and Counting Set Bits:")
print(count_bits.numpy())  # Output: [2, 3, 1]
Output:
Result of Bitwise XOR and Counting Set Bits:
3
Bitwise Invert Operation
The provided code utilizes TensorFlow to invert the bits of a given tensor of uint8 data type and prints both the original and inverted tensors. For each element in the input tensor, tf.bitwise.invert() computes the complement of that element, swapping each 0 bit to 1 and each 1 bit to 0, regardless of the data type of the tensor.
import tensorflow as tf
# Create a sample tensor
tensor = tf.constant([1, 2, 3, 4, 5], dtype=tf.uint8)
# Invert the bits of the tensor
inverted_tensor = tf.bitwise.invert(tensor)
# Print the original and inverted tensors
print("Original tensor:", tensor.numpy())
print("Inverted tensor:", inverted_tensor.numpy())
Output:
Result of Bitwise NOT Operation:
[-6 -4 -8]
Left and right shift operations
The code performs left and right shift operations by 1 bit on a TensorFlow tensor, shifting the binary representation of each element in the tensor to the left or right by one position. The resulting tensors contain the elements of the original tensor after the specified shift operations.
- tf.bitwise.left_shift() function: Performs a left shift operation on the bits of a tensor. This operation shifts the bits of each element in the tensor to the left by a specified number of positions, padding the right side with zeros.
- tf.bitwise.right_shift() function: Performs a right shift operation on the bits of a tensor. This operation shifts the bits of each element in the tensor to the right by a specified number of positions, padding the left side with zeros (for unsigned types) or the sign bit (for signed types).
import tensorflow as tf
# Define a tensor
tensor = tf.constant([5, 3, 7])  # Binary: 101, 011, 111
# Left shift by 1 bit
result_left_shift = tf.bitwise.left_shift(tensor, 1)
print("Result of Left Shift Operation:")
print(result_left_shift.numpy())  # Output: [10  6 14]
# Right shift by 1 bit
result_right_shift = tf.bitwise.right_shift(tensor, 1)
print("\nResult of Right Shift Operation:")
print(result_right_shift.numpy())  # Output: [2 1 3]
Output:
Result of Left Shift Operation:
[10 6 14]
Result of Right Shift Operation:
[2 1 3]
