# Automatic differentiation in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/automatic-differentiation-in-tensorflow/

In this post, we'll go over the concepts underlying TensorFlow's automated differentiation and provide helpful, step-by-step instructions and screenshots to demonstrate how to utilize it.
Automatic differentiation (AD) is a fundamental technique in machine learning, particularly in frameworks like TensorFlow. It is crucial for model optimization techniques like gradient descent since it improves the efficiency of function gradient computation. Complex model creation and training are made simpler by AD's easy integration into TensorFlow's computational network, which eliminates the need for manual gradient computation.
Key Concepts of Automatic differentiation in TensorFlow
- Computational Graph: TensorFlow uses a directed graph to represent computations; nodes stand for operations, and edges for the flow of tensors or data. Automatic differentiation and efficient calculation are made possible by this graph.
- Gradients: Gradients show how quickly a function changes its arguments. Gradients are essential in machine learning because they allow models to be optimized by changing parameters to minimize a specified loss function.
- Gradient Tape: The tf.GradientTape context manager in TensorFlow is used to log actions for automatic differentiation. It watches tensors and operations performed within its context to compute gradients about the monitored tensors.
- Gradient Descent: By modifying parameters in the direction of the function's gradient's steepest descent, an optimization technique known as gradient descent is utilized to reduce a function iteratively.
Implementation of Automatic Differentiation (AD)
Simple Mathematical Functions with Automatic Differentiation in TensorFlow
TensorFlow's Automatic Differentiation (AD) feature enables you to automatically calculate the gradients of mathematical functions concerning their inputs. Here's a quick example showing how to use TensorFlow's AD capabilities to calculate the gradient of a mathematical function:
import tensorflow as tf
# Define a simple mathematical function
def func(x):
    return x**2 + 5*x + 3
# Define the input variable
x = tf.Variable(2.0)
# Use GradientTape to compute the gradient
with tf.GradientTape() as tape:
    y = func(x)
# Get the gradient of y with respect to x
grad = tape.gradient(y, x)
print("Function value:", y.numpy())
print("Gradient:", grad.numpy())
Output:
Function value: 15.0
Gradient: 9.0
In this example, we defined a simple quadratic function func(x) and computed its gradient at x = 2.0 using TensorFlow's GradientTape.
Training Neural Network Using TensorFlow's AD Capabilities
TensorFlow's AD capabilities are widely used in training neural networks. Here's an example of training a simple neural network using TensorFlow's built-in AD capabilities:
import tensorflow as tf
# Generate some random data
X = tf.random.normal((100, 1))
y = 3*X + tf.random.normal((100, 1))
# Define a simple neural network
model = tf.keras.Sequential([
    tf.keras.layers.Dense(1)
])
# Compile the model
model.compile(optimizer='sgd', loss='mse')
# Train the model using AD for gradient computation
model.fit(X, y, epochs=10, verbose=0)
# Print the trained weights
print("Trained weights:", model.layers[0].get_weights()[0])
In this example, we created a simple neural network with one dense layer and trained it on randomly generated data using TensorFlow's automatic differentiation capabilities.
Comparison of Manual Gradient Computation vs TensorFlow AD
Let's compare the manual computation of gradients with TensorFlow's automatic differentiation using a simple mathematical function:
import tensorflow as tf
# Define a simple mathematical function
def func(x):
    return x**2 + 5*x + 3
# Define the input variable
x = tf.Variable(2.0)
# Manual gradient computation
with tf.GradientTape() as tape:
    y = func(x)
manual_grad = 2*x + 5
# Automatic differentiation
with tf.GradientTape() as tape:
    y = func(x)
auto_grad = tape.gradient(y, x)
print("Manual Gradient:", manual_grad.numpy())
print("Automatic Gradient:", auto_grad.numpy())
Output:
Manual Gradient: 9.0
Automatic Gradient: 9.0
In this example, we computed the gradient of the function func(x) both manually and using TensorFlow's automatic differentiation capabilities. As you can see, both methods produce the same result. Automatic differentiation simplifies the process and reduces the likelihood of errors compared to manual computation.
Basic Usage of tf.GradientTape:
- A key component of TensorFlow's automatic differentiation method is the tf.GradientTape context manager.
- Gradients with regard to monitored tensors can be computed since it observes tensors and operations that fall under its purview.
- Developers can easily incorporate automatic differentiation into TensorFlow workflows by using tf.GradientTape, which makes machine learning model training and optimization easier.
import tensorflow as tf
# Define a simple function
def simple_function(x):
    return x ** 2
# Define the input variable
x = tf.constant(3.0)
# Use tf.GradientTape to compute the gradient
with tf.GradientTape() as tape:
    # Monitor the input variable
    tape.watch(x)
    # Compute the function value
    y = simple_function(x)
# Compute the gradient
dy_dx = tape.gradient(y, x)
print("Function value:", y.numpy())
print("Gradient:", dy_dx.numpy())
Output:
Function value: 9.0
Gradient: 6.0
Advanced Automatic Differentiation using Custom Gradients:
- Advanced tools for automatic differentiation, like custom gradients and higher-order derivatives, are available in TensorFlow beyond its basic usage.
- These features make it possible to use more complex optimization strategies and give developers the flexibility to customize gradient computation to meet particular needs.
- The speed and adaptability of TensorFlow models can be further improved by developers by investigating sophisticated automatic differentiation features.
import tensorflow as tf
# Define a function for which you want to compute gradients
def custom_function(x):
    return tf.square(x)
# Define the gradient of the custom function
@tf.custom_gradient
def custom_function_with_gradient(x):
    # Forward pass
    y = custom_function(x)
    # Define gradient function
    def grad(dy):
        return 2 * x * dy  # Gradient of x^2 is 2x
    return y, grad
# Example usage
x = tf.constant(3.0)
with tf.GradientTape() as tape:
    tape.watch(x)
    y = custom_function_with_gradient(x)
# Compute gradients
grad = tape.gradient(y, x)
print("Function output:", y.numpy())
print("Gradient:", grad.numpy())
Output:
Function value: 9.0
Gradient: 6.0
Conclusion
In machine learning, automatic differentiation is a very useful tool, especially in frameworks such as TensorFlow. TensorFlow streamlines gradient computation for optimization tasks by smoothly incorporating automatic differentiation into the computational network. This post has shown you how to take full advantage of TensorFlow's automatic differentiation features by providing clear examples and helpful instructions. TensorFlow's AD features offer a strong basis for developing state-of-the-art machine learning solutions, whether neural network training or sophisticated model optimization.
