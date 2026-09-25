# Activation Function in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/activation-function-in-tensorflow/

Activation functions add non-linearity to deep learning models and allow them to learn complex patterns. TensorFlow’s tf.keras.activations module provides a variety of activation functions to use in different scenarios.
An activation function is a mathematical transformation applied to the output of a neural network layer. It helps in:
- Controlling the flow of information.
- Enabling networks to learn complex features.
List of Activation Functions in TensorFlow
Below are the activation functions provided by tf.keras.activations, along with their definitions and TensorFlow implementations.
1. ReLU (Rectified Linear Unit)
ReLU activation functions outputs the input directly if it is positive; otherwise, it will output zero. This helps mitigate the vanishing gradient problem and improves training efficiency.
Function: tf.keras.activations.relu(x)
Code Example:
import tensorflow as tf
# ReLU activation
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(32,)),
    tf.keras.layers.Dense(10, activation='softmax')
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
2. Sigmoid
Sigmoid function outputs values between 0 and 1, making it suitable for binary classification tasks. However, it is prone to the vanishing gradient problem, especially for deep networks.
Function: tf.keras.activations.sigmoid(x)
Code Example:
import tensorflow as tf
# Sigmoid activation
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='sigmoid', input_shape=(32,)),
    tf.keras.layers.Dense(1, activation='sigmoid')  # Used for binary classification
])
model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['accuracy'])
3. Tanh (Hyperbolic Tangent)
Tanh is similar to Sigmoid but outputs values between -1 and 1. This allows for both positive and negative outputs, making it better for hidden layers than Sigmoid. However, it still suffers from the vanishing gradient problem.
Function: tf.keras.activations.tanh(x)
Code Example:
import tensorflow as tf
# Tanh activation
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='tanh', input_shape=(32,)),
    tf.keras.layers.Dense(10, activation='softmax')
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
4. Softmax
Softmax is commonly used in the output layer of a neural network for multi-class classification. It converts the raw output (logits) into probabilities, with the sum of all probabilities equal to 1.
Function: tf.keras.activations.softmax(x)
Code Example:
import tensorflow as tf
# Softmax activation
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(32,)),
    tf.keras.layers.Dense(10, activation='softmax')  # For multi-class classification
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
5. Leaky ReLU
Leaky ReLU is a modified version of the ReLU function. It allows a small, non-zero output for negative input values, which can help avoid the "dying ReLU" problem, where neurons never activate.
Function: tf.keras.layers.LeakyReLU(alpha=0.3)
Code Example:
import tensorflow as tf
# Leaky ReLU activation
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, input_shape=(32,)),
    tf.keras.layers.LeakyReLU(alpha=0.3),  # Allows a small slope for negative values
    tf.keras.layers.Dense(10, activation='softmax')
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
6. ELU (Exponential Linear Unit)
ELU is similar to ReLU but has an exponential curve for negative values. It helps avoid the vanishing gradient problem and has better performance on deep neural networks.
Function: tf.keras.activations.elu(x, alpha=1.0)
Code Example:
import tensorflow as tf
# ELU activation
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='elu', input_shape=(32,)),
    tf.keras.layers.Dense(10, activation='softmax')
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
7. Swish
Swish is a newer activation function proposed by Google, which has shown better performance than ReLU and its variants in many cases. It is defined as 
Function: tf.keras.activations.swish(x)
Code Example:
import tensorflow as tf
# Swish activation
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='swish', input_shape=(32,)),
    tf.keras.layers.Dense(10, activation='softmax')
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
8. Softplus
Softplus is a smooth approximation of the ReLU function. It’s continuous and differentiable, which helps avoid issues like dead neurons. It outputs values between 0 and positive infinity.
Function: tf.keras.activations.softplus(x)
Code Example:
import tensorflow as tf
# Softplus activation
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='softplus', input_shape=(32,)),
    tf.keras.layers.Dense(10, activation='softmax')
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
TensorFlow provides a wide variety of activation functions, each suitable for different types of problems and model architectures. The choice of activation function can significantly affect the performance of the model, so understanding how each works is crucial for successful deep learning model design.
