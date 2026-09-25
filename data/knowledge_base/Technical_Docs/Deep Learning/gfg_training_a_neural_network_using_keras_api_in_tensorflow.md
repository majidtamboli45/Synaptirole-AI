# Training a Neural Network using Keras API in Tensorflow

> Source: https://www.geeksforgeeks.org/deep-learning/training-a-neural-network-using-keras-api-in-tensorflow/

In the field of machine learning and deep learning has been significantly transformed by tools like TensorFlow and Keras. TensorFlow, developed by Google, is an open-source platform that provides a comprehensive ecosystem for machine learning. Keras, now fully integrated into TensorFlow, offers a user-friendly, high-level API for building and training neural networks. This article will guide you through the process of training a neural network using the Keras API within TensorFlow.
Pre requisite:
pip install tensorflow
Step By Step Implementation of Training a Neural Network using Keras API in Tensorflow
Training a neural network involves several steps, including data preprocessing, model building, compiling, training, and evaluating the model. Here’s a step-by-step guide using Keras API in TensorFlow.
Step 1: Import Libraries
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Conv2D, MaxPooling2D, Flatten, Dropout
from tensorflow.keras.optimizers import Adam
Step 2: Prepare the Data
Load and preprocess the dataset. For demonstration, we’ll use the MNIST dataset:
from tensorflow.keras.datasets import mnist
# Load data
(x_train, y_train), (x_test, y_test) = mnist.load_data()
# Preprocess data
x_train = x_train.reshape(-1, 28, 28, 1).astype('float32') / 255.0
x_test = x_test.reshape(-1, 28, 28, 1).astype('float32') / 255.0
# One-hot encode the labels
y_train = tf.keras.utils.to_categorical(y_train, 10)
y_test = tf.keras.utils.to_categorical(y_test, 10)
Step 3: Build the Model
Define the architecture of the neural network:
model = Sequential([
    Conv2D(32, kernel_size=(3, 3), activation='relu', input_shape=(28, 28, 1)),
    MaxPooling2D(pool_size=(2, 2)),
    Conv2D(64, kernel_size=(3, 3), activation='relu'),
    MaxPooling2D(pool_size=(2, 2)),
    Conv2D(128, kernel_size=(3, 3), activation='relu'),
    MaxPooling2D(pool_size=(2, 2)),
    Flatten(),
    Dense(128, activation='relu'),
    Dropout(0.5),
    Dense(10, activation='softmax')
])
Step 4: Compile the Model
Compile the model with an optimizer, loss function, and metrics:
model.compile(optimizer=Adam(),
              loss='categorical_crossentropy',
              metrics=['accuracy'])
Step 5: Train the Model
Train the model using the training data:
model.fit(x_train, y_train, epochs=10, batch_size=128, validation_split=0.2)
Step 6: Evaluate the Model
Evaluate the model using the test data to check its performance:
test_loss, test_accuracy = model.evaluate(x_test, y_test)
print(f'Test accuracy: {test_accuracy}')
Output:
Test accuracy: 0.78
In conclusion, the integration of TensorFlow and Keras has significantly streamlined the process of training neural networks, making it more accessible to both beginners and experienced practitioners in the field of machine learning and deep learning.
With TensorFlow providing a robust open-source platform and Keras offering a user-friendly interface through its high-level API, developers can efficiently build, train, and evaluate neural network models.
Through the step-by-step implementation outlined in this guide, we've seen how to preprocess data, define the neural network architecture, compile the model with appropriate parameters, train the model using training data, and evaluate its performance using test data.
However, it's essential to note that achieving high accuracy in model evaluation, as demonstrated by the test accuracy of 0.78 in this example, often requires experimentation with various architectures, hyperparameters, and optimization techniques. Continuous learning and experimentation are key to refining models and pushing the boundaries of what is achievable in the field of machine learning.
