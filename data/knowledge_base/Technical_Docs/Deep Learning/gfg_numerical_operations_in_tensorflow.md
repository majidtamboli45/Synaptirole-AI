# Numerical Operations in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/numerical-operations-in-tensorflow/

TensorFlow is an open-source machine-learning library developed by Google. TensorFlow is used to build and train deep learning models as it facilitates the creation of computational graphs and efficient execution on various hardware platforms. Here, we will learn some of the basic Numerical operations available in TensorFlow and how they can be used.
TensorFlow Numerical Operations
TensorFlow, empowers users with a robust set of numerical operations, forming the backbone of its computational capabilities. These operations, executed on tensors, the fundamental data structures in TensorFlow, facilitate complex mathematical computations essential for machine learning tasks.
TensorFlow excels in handling a diverse range of numerical operations, including but not limited to matrix multiplications, element-wise operations, and various mathematical transformations.
Tensors
TensorFlow represents data using tensors, represented as tf.Tensor objects. which are multidimensional arrays. Tensors can hold numbers (scalars), vectors (single-dimensional arrays), matrices (two-dimensional arrays), or even higher-dimensional data structures. 
Mathematical Operations with Tensors
TensorFlow provides a plethora of mathematical operations for manipulating tensors. The numerical operations include addition, subtraction, multiplication, division, and more. Here's an overview of some common mathematical operations along with their implementations:
Here, tf.constant() is used for defining tensors.
- tf.add is used to perform element-wise addition on tensorsa andb .
- tf.subtract is used for element-wise subtraction.
- tf.multiply performs element-wise multiplication.
- tf.divide is used for element-wise division.
import tensorflow as tf
a = tf.constant([3, 3, 3])
b = tf.constant([2, 2, 2])  # Define tensors
sum_result = tf.add(a, b) # Addition
diff_result = tf.subtract(a, b) # Subtraction
quot_result = tf.divide(a, b) # Division
prod_result = tf.multiply(a, b) # Multiplication
print("Sum of Tensors",sum_result)
print("Difference of tensors",diff_result)
print("Quotient of Tensor",quot_result)
print("Product of tensors ",prod_result)
Output:
Sum of Tensors tf.Tensor([5 5 5], shape=(3,), dtype=int32)
Difference of tensors tf.Tensor([1 1 1], shape=(3,), dtype=int32)
Quotient of Tensor tf.Tensor([1.5 1.5 1.5], shape=(3,), dtype=float64)
Product of tensors  tf.Tensor([6 6 6], shape=(3,), dtype=int32)
Element-wise Operations with Tensors
Element-wise operators in tensors are operations that are applied individually to each element of the tensors. These operators perform functions such as addition, subtraction, multiplication, division, etc., on corresponding elements of the tensors. As a result of the operation, a new tensor is created with the same shape as the original tensors.
import tensorflow as tf
# Define tensors
a = tf.constant([3, 5, 7], dtype=tf.float32)
b = tf.constant([2, 6, 4], dtype=tf.float32)
# Check shapes
if a.shape != b.shape:
    raise ValueError("Tensors 'a' and 'b' must have the same shape.")
# Check data types
if a.dtype != b.dtype:
    raise ValueError("Tensors 'a' and 'b' must have the same data type.")
Performing shape and data type checks in TensorFlow is important to ensure compatibility between tensors, maintain data integrity, and prevent errors or unexpected behavior. These checks catch inconsistencies early in the code and allow for graceful error handling.
Implementation code for element-wise operations.
- tf.minimum computes element-wise minimum of two tensors.
- tf.maximum computes element-wise maximum.
- tf.abs computes element-wise absolute value.
- tf.math.log computes element-wise natural logarithm.
- tf.exp computes element-wise exponential.
# Element-wise operations
min_result = tf.minimum(a, b)
max_result = tf.maximum(a, b)
abs_result = tf.abs(a)
log_result = tf.math.log(tf.maximum(a, 1e-8))  # Ensure positive values for logarithm
exp_result = tf.exp(a)
print("Minimum:", min_result)
print("Maximum:", max_result)
print("Absolute value:", abs_result)
print("Logarithm:", log_result)
print("Exponential:", exp_result)
Output:
Minimum: tf.Tensor([2. 5. 4.], shape=(3,), dtype=float32)
Maximum: tf.Tensor([3. 6. 7.], shape=(3,), dtype=float32)
Absolute value: tf.Tensor([3. 5. 7.], shape=(3,), dtype=float32)
Logarithm: tf.Tensor([1.0986123 1.609438  1.9459101], shape=(3,), dtype=float32)
Exponential: tf.Tensor([  20.085537  148.41316  1096.6332  ], shape=(3,), dtype=float32)
Aggregations and Statistics Operations with Tensors
TensorFlow provides several aggregation functions for statistical analysis using .reduce(). Reduction operations in TensorFlow involve performing operations across specific axes of a tensor, reducing the dimensionality of the tensor in the process.
For implementation, the below code demonstrates how to calculate the mean along columns. The axis parameter specifies the axis along which the operations are performed.
- tf.reduce_mean is used to compute the mean along a specified axis (axis=0 means column-wise).
import tensorflow as tf
x = tf.constant([[1, 2, 3], [4, 5, 6]])
mean_result = tf.reduce_mean(x, axis=0)
print(mean_result)
Output:
tf.Tensor([2 3 4], shape=(3,), dtype=int32)
Logical AND and OR operations
tf.reduce_all and tf.reduce_any: Compute the logical AND and OR operations, respectively, across elements along a specified axis or axes.
import tensorflow as tf
x = tf.constant([[True, False, True], [False, True, True]])
all_result = tf.reduce_all(x, axis=1)
any_result = tf.reduce_any(x, axis=0)
print(all_result)
print(any_result)
Output:
tf.Tensor([False False], shape=(2,), dtype=bool)
tf.Tensor([ True  True  True], shape=(3,), dtype=bool)
log-space operations
tf.math.reduce_logsumexp: Computes the logarithm of the sum of exponentials of elements along a specified axis or axes. This is useful for numerical stability in log-space operations.
import tensorflow as tf
x = tf.constant([[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]])
logsumexp_result = tf.math.reduce_logsumexp(x, axis=1)
print(logsumexp_result)
Output:
tf.Tensor([3.407606 6.407606], shape=(2,), dtype=float32)
Automatic Differentiation with Tensors
Automatic differentiation is a key feature of TensorFlow, enabling efficient computation of gradients for optimization algorithms such as gradient descent. TensorFlow's computational graph framework automatically computes derivatives of expressions with respect to their inputs. Here's a simple example demonstrating automatic differentiation: tf.gradient()
import tensorflow as tf
# Define a variable
x = tf.Variable(3.0)
# Define a function
def compute_gradient(x):
    with tf.GradientTape() as tape:
        y = x**2
    return tape.gradient(y, x)
# Compute the gradient
gradient = compute_gradient(x)  # Output: 6.0
print(gradient)
Output:
tf.Tensor(6.0, shape=(), dtype=float32)
Conclusion
In conclusion, TensorFlow's numerical functions provide powerful tools for data manipulation, mathematical operations, random number generation, and automatic differentiation, empowering developers to build and train sophisticated machine learning models efficiently.
