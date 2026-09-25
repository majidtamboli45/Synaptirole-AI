# Loss Function in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/loss-function-in-tensorflow/

Loss function compute errors between the predicted output and actual output. The optimizer then updates the model parameters based on the loss value to improve accuracy.
Mathematically, a loss function is represented as:
TensorFlow provides various loss functions under the tf.keras.losses module, which are widely used for different types of tasks such as regression, classification, and ranking.
Loss Functions for Regression
Regression problems involve continuous numerical predictions. Some commonly used loss functions include:
Mean Squared Error (MSE)
Mean Squared Error (MSE) calculates the average squared difference between the actual and predicted values. It is defined as:
TensorFlow implementation using tf.keras.losses.MeanSquaredError():
import tensorflow as tf
mse = tf.keras.losses.MeanSquaredError()
y_true = [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]
y_pred = [[1.1, 2.2, 3.3], [4.4, 5.5, 6.6]]
loss = mse(y_true, y_pred)
print("MSE Loss:", loss.numpy())
Output:
MSE Loss: 0.15166667
Mean Absolute Error (MAE)
Mean Absolute Error (MAE) computes the average absolute difference between the actual and predicted values:
TensorFlow implementation using tf.keras.losses.MeanAbsoluteError():
import tensorflow as tf
y_true = [[1.0, 2.0, 3.0], [4.0, 5.0, 6.0]]
y_pred = [[1.1, 2.2, 3.3], [4.4, 5.5, 6.6]]
mae = tf.keras.losses.MeanAbsoluteError()
loss = mae(y_true, y_pred)
print("MAE Loss:", loss.numpy())
Output:
MAE Loss: 0.35
Loss Functions for Classification
Classification problems involve categorical outputs. Common loss functions include:
Binary Crossentropy
Binary crossentropy is used for binary classification, this loss function measures the difference between two probability distributions:
TensorFlow implementation using tf.keras.losses.BinaryCrossentropy():
import tensorflow as tf 
bce = tf.keras.losses.BinaryCrossentropy()
y_true = [[0.0, 1.0], [1.0, 0.0]]
y_pred = [[0.1, 0.9], [0.8, 0.2]]
loss = bce(y_true, y_pred)
print("Binary Crossentropy Loss:", loss.numpy())
Output:
Binary Crossentropy Loss: 0.16425204
Categorical Crossentropy
Categorical Crossentropy is used for multi-class classification. Categorical crossentropy extends BCE for multiple classes:
TensorFlow implementation using tf.keras.losses.CategoricalCrossentropy():
import tensorflow as tf
cce = tf.keras.losses.CategoricalCrossentropy()
y_true = [[0, 1, 0], [0, 0, 1]]
y_pred = [[0.05, 0.95, 0.0], [0.1, 0.2, 0.7]]
loss = cce(y_true, y_pred)
print("Categorical Crossentropy Loss:", loss.numpy())
Output:
Categorical Crossentropy Loss: 0.20398414
Sparse Categorical Crossentropy
Sparse Categorical Crossentropy is used for classification tasks where labels are integers instead of one-hot encoded vectors.
TensorFlow implementation using tf.keras.losses.SparseCategoricalCrossentropy():
import tensorflow as tf
sparse_cce = tf.keras.losses.SparseCategoricalCrossentropy()
y_true = tf.constant([1, 2]) 
y_pred = tf.constant([[0.05, 0.95, 0.0], 
                      [0.1, 0.2, 0.7]])  # Probabilities for each class
loss = sparse_cce(y_true, y_pred)
print("Sparse Categorical Crossentropy Loss:", loss.numpy())
Output:
Sparse Categorical Crossentropy Loss: 0.2039842
Loss Functions for Specialized Tasks
TensorFlow also provides loss functions for specific use cases:
Huber Loss
Huber loss is the combination of MSE and MAE, useful for handling outliers. Huber loss for a single data point is defined as:
In TensorFlow, we can use tf.keras.losses.Huber() to implement Huber loss:
import tensorflow as tf
y_true = tf.constant([3.0, 5.0, 1.0, 6.0], dtype=tf.float32)
y_pred = tf.constant([2.5, 4.5, 1.5, 5.0], dtype=tf.float32)
# Define Huber loss
huber_loss = tf.keras.losses.Huber(delta=1.0)
loss = huber_loss(y_true, y_pred)
print("Huber Loss:", loss.numpy())
Output:
Huber Loss: 0.21875
Kullback-Leibler Divergence (KL Divergence)
KL Divergence measures how one probability distribution diverges from a second, expected probability distribution. It is commonly used in tasks involving probability distributions, such as classification or generative models.
KL Divergence between two probability distributions 
In TensorFlow, KL Divergence can be used with tf.keras.losses.KLDivergence():
import tensorflow as tf
p = tf.constant([0.1, 0.9], dtype=tf.float32)  
q = tf.constant([0.2, 0.8], dtype=tf.float32)  
# Define KL Divergence loss
kl_loss = tf.keras.losses.KLDivergence()
loss = kl_loss(p, q)
print("KL Divergence Loss:", loss.numpy())
Output:
KL Divergence Loss: 0.03669001
Loss functions are the backbone of deep learning model training, guiding optimization towards accurate predictions. TensorFlow provides a variety of built-in loss functions for different tasks:
- Regression: MeanSquaredError(), MeanAbsoluteError(), Huber()
- Classification: BinaryCrossentropy(), CategoricalCrossentropy(), SparseCategoricalCrossentropy()
- Other: KLDivergence(), CosineSimilarity(), etc.
Understanding and selecting the right loss function for your problem is crucial for achieving optimal performance.
