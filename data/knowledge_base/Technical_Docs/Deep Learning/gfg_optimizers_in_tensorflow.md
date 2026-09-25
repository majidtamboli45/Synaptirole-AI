# Optimizers in Tensorflow

> Source: https://www.geeksforgeeks.org/deep-learning/optimizers-in-tensorflow/

Optimizers adjust weights of the model based on the gradient of loss function, aiming to minimize the loss and improve model accuracy. In TensorFlow, optimizers are available through tf.keras.optimizers. You can use these optimizers in your models by specifying them when compiling the model.
Here's a brief overview of the most commonly used optimizers in TensorFlow:
1. SGD (Stochastic Gradient Descent)
Stochastic Gradient Descent (SGD) updates the model parameters using the gradient of the loss function with respect to the weights. It is efficient, but can be slow, especially in complex models, due to noisy gradients and small updates.
Syntax: tf.keras.optimizers.SGD(learning_rate=0.01, momentum=0.0, nesterov=False)
SGD can be implemented in TensorFlow using tf.keras.optimizers.SGD():
import tensorflow as tf
model = tf.keras.Sequential([tf.keras.layers.Dense(1)])
# Compile the model with SGD optimizer
model.compile(optimizer=tf.keras.optimizers.SGD(learning_rate=0.01, momentum=0.9), loss='mse')
model.fit(x_train, y_train)
2. Adam (Adaptive Moment Estimation)
Adam combines the advantages of two other extensions of SGD: AdaGrad and RMSProp.
It computes adaptive learning rates for each parameter by considering both first and second moments of the gradients. Adam is one of the most popular optimizers due to its efficient handling of sparse gradients and non-stationary objectives.
tf.keras.optimizers.Adam(learning_rate=0.001, beta_1=0.9, beta_2=0.999, epsilon=1e-07)
Implementing Adam in Tensorflow using tf.keras.optimizers():
import tensorflow as tf
model = tf.keras.Sequential([tf.keras.layers.Dense(1)])
# Compile the model with Adam optimizer
model.compile(optimizer=tf.keras.optimizers.Adam(learning_rate=0.001), loss='mse')
model.fit(x_train, y_train)
3. RMSprop (Root Mean Square Propagation)
RMSprop is an adaptive learning rate method, that divides the learning rate by an exponentially decaying average of squared gradients. This optimizer is effective for handling non-stationary objectives and is often used for training RNNs.
tf.keras.optimizers.RMSprop(learning_rate=0.001, rho=0.9, epsilon=1e-07)
RMSprop can be implemented in TensorFlow using tf.keras.optimizers.RMSprop():
import tensorflow as tf
model = tf.keras.Sequential([tf.keras.layers.Dense(1)])
# Compile the model with RMSprop optimizer
model.compile(optimizer=tf.keras.optimizers.RMSprop(learning_rate=0.001), loss='mse')
model.fit(x_train, y_train)
4. Adagrad
Adagrad adapts the learning rate to the parameters by scaling it inversely with respect to the square root of the sum of all historical squared gradients. This helps in improving performance for sparse data. However, the learning rate tends to shrink too much over time, causing the optimizer to stop making updates.
tf.keras.optimizers.Adagrad(learning_rate=0.001, epsilon=1e-07)
Adagrad can be implemented in TensorFlow using tf.keras.optimizers.Adagrad():
import tensorflow as tf
model = tf.keras.Sequential([tf.keras.layers.Dense(1)])
# Compile the model with Adagrad optimizer
model.compile(optimizer=tf.keras.optimizers.Adagrad(learning_rate=0.01), loss='mse')
model.fit(x_train, y_train)
5. Adadelta
Adadelta is an extension of Adagrad. It addresses the problem of excessively diminishing learning rates. It uses a moving window of gradient updates, helping the model learn effectively even with sparse data.
tf.keras.optimizers.Adadelta(learning_rate=1.0, rho=0.95, epsilon=1e-07)
Adadelta can be implemented using tf.keras.optimizer.Adadelta():
import tensorflow as tf
model = tf.keras.Sequential([tf.keras.layers.Dense(1)])
# Compile the model with Adadelta optimizer
model.compile(optimizer=tf.keras.optimizers.Adadelta(learning_rate=1.0), loss='mse')
model.fit(x_train, y_train)
6. FTRL (Follow The Regularized Leader)
FTRL is an optimization algorithm particularly suited for problems with sparse data, such as those found in large-scale linear models. It maintains two accumulators to track gradients and updates them efficiently.
tf.keras.optimizers.Ftrl(learning_rate=0.1, learning_rate_power=-0.5, l1_regularization_strength=0.0, l2_regularization_strength=0.0)
Code Example of FTRL using tf.keras.optimizers.Ftrl():
import tensorflow as tf
model = tf.keras.Sequential([tf.keras.layers.Dense(1)])
# Compile the model with FTRL optimizer
model.compile(optimizer=tf.keras.optimizers.Ftrl(learning_rate=0.01), loss='mse')
model.fit(x_train, y_train)
7. Nadam (Nesterov-accelerated Adaptive Moment Estimation)
Nadam combines Adam and Nesterov accelerated gradient. It calculates gradients using momentum and adapts the learning rate for each parameter, with an additional Nesterov momentum term.
tf.keras.optimizers.Nadam(learning_rate=0.001, beta_1=0.9, beta_2=0.999, epsilon=1e-07)
Nadam can be implemented using tf.keras.optimizers.Nadam():
import tensorflow as tf
model = tf.keras.Sequential([tf.keras.layers.Dense(1)])
# Compile the model with Nadam optimizer
model.compile(optimizer=tf.keras.optimizers.Nadam(learning_rate=0.001), loss='mse')
model.fit(x_train, y_train)
Optimizers like Adam and SGD are commonly used for general-purpose tasks, while others like Adagrad and Adadelta are more specialized for sparse data or particular scenarios. Selecting the right optimizer helps in speeding up convergence, improving model accuracy, and enhancing overall performance.
