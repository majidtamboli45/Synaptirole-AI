# tf.keras.callbacks.Callback

> Source: https://www.geeksforgeeks.org/deep-learning/tf-keras-callbacks-callback-tensorflow-callbacks/

TensorFlow Callbacks are a powerful tool for enhancing the training process of neural networks. These callbacks provide the ability to monitor and modify the behavior of the model during training, evaluation, or inference. In this article, we will explore what callbacks are, how to implement them, and some common types of callbacks provided by TensorFlow.
Table of Content
What are TensorFlow Callbacks?
Callbacks are functions or blocks of code that are executed at specific stages of the training process. They allow you to interact with the model at various points such as:
- At the start and end of an epoch
- Before and after a batch is processed
- At the start and end of training
These interactions can be used to implement custom behavior such as early stopping, learning rate scheduling, saving model checkpoints, logging metrics, and more.
Common TensorFlow Callbacks
TensorFlow provides several built-in callbacks that can be very useful:
- EarlyStopping: Stops training when a monitored metric has stopped improving.
early_stopping = tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=3)
- ModelCheckpoint: Saves the model at specified intervals.
model_checkpoint = tf.keras.callbacks.ModelCheckpoint(filepath='model.h5', save_best_only=True)
- LearningRateScheduler: Schedules changes to the learning rate during training.
def scheduler(epoch, lr):
if epoch < 10:
return lr
else:
return lr * tf.math.exp(-0.1)
lr_scheduler = tf.keras.callbacks.LearningRateScheduler(scheduler)
- TensorBoard: Logs data for visualization in TensorBoard.
tensorboard = tf.keras.callbacks.TensorBoard(log_dir='./logs')
Custom Callbacks
While the built-in callbacks are very useful, there are times when you need more control. This is where custom callbacks come in handy. You can create a custom callback by subclassing tf.keras.callbacks.Callback and overriding any of the following methods:
- on_epoch_begin
- on_epoch_end
- on_batch_begin
- on_batch_end
- on_train_begin
- on_train_end
Effective Training with TensorFlow Callbacks
To implement TensorFlow callbacks, we will be following these steps:
Step 1: Import Libraries and Load the Data
First, import the necessary libraries from TensorFlow and Keras. Then , load the MNIST dataset, which includes handwritten digits, and normalize the pixel values to be between 0 and 1.
import tensorflow as tf
from tensorflow.keras.datasets import mnist
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten
# Load the MNIST dataset
(x_train, y_train), (x_test, y_test) = mnist.load_data()
# Normalize the data
x_train, x_test = x_train / 255.0, x_test / 255.0
Step 2: Define the Model Architecture and Compile the Model
Create a Sequential model with a flattening layer to convert the 2D images into 1D arrays, followed by a dense layer with ReLU activation, and an output layer with softmax activation for classification.
Compile the model using the Adam optimizer, sparse categorical cross-entropy loss function, and accuracy as a metric.
# Define the model
model = Sequential([
Flatten(input_shape=(28, 28)),
Dense(128, activation='relu'),
Dense(10, activation='softmax')
])
# Compile the model
model.compile(optimizer='adam',
loss='sparse_categorical_crossentropy',
metrics=['accuracy'])
Step 3: Define the Callbacks
Define the callbacks that will be used during the training process. In this example, we use EarlyStopping to stop training when the validation loss does not improve for three consecutive epochs and ModelCheckpoint to save the model whenever the validation loss improves.
# Define the callbacks
early_stopping = tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=3, restore_best_weights=True)
model_checkpoint = tf.keras.callbacks.ModelCheckpoint(filepath='best_model.h5', save_best_only=True, monitor='val_loss')
Step 4: Train the Model with Callbacks
Train the model using the fit method, and include the callbacks in the training process. This will ensure that the callbacks are invoked at the appropriate times during training.
# Train the model with callbacks
model.fit(x_train, y_train,
epochs=20,
validation_split=0.2,
callbacks=[early_stopping, model_checkpoint])
Complete Code to Train with TensorFlow Callbacks
import tensorflow as tf
from tensorflow.keras.datasets import mnist
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, Flatten
# Load the MNIST dataset
(x_train, y_train), (x_test, y_test) = mnist.load_data()
# Normalize the data
x_train, x_test = x_train / 255.0, x_test / 255.0
# Define the model
model = Sequential([
    Flatten(input_shape=(28, 28)),
    Dense(128, activation='relu'),
    Dense(10, activation='softmax')
])
# Compile the model
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])
# Define the callbacks
early_stopping = tf.keras.callbacks.EarlyStopping(monitor='val_loss', patience=3, restore_best_weights=True)
model_checkpoint = tf.keras.callbacks.ModelCheckpoint(filepath='best_model.h5', save_best_only=True, monitor='val_loss')
# Train the model with callbacks
model.fit(x_train, y_train,
          epochs=20,
          validation_split=0.2,
          callbacks=[early_stopping, model_checkpoint])
# Evaluate the model
test_loss, test_acc = model.evaluate(x_test, y_test)
print(f'Test accuracy: {test_acc}')
Output:
Epoch 1/20
1500/1500 [==============================] - 6s 3ms/step - loss: 0.2850 - accuracy: 0.9193 - val_loss: 0.1637 - val_accuracy: 0.9512
Epoch 2/20
1500/1500 [==============================] - 7s 4ms/step - loss: 0.1269 - accuracy: 0.9627 - val_loss: 0.1152 - val_accuracy: 0.9657
Epoch 3/20
1500/1500 [==============================] - 5s 3ms/step - loss: 0.0869 - accuracy: 0.9745 - val_loss: 0.1004 - val_accuracy: 0.9702
Epoch 4/20
1500/1500 [==============================] - 6s 4ms/step - loss: 0.0642 - accuracy: 0.9808 - val_loss: 0.1016 - val_accuracy: 0.9700
Epoch 5/20
1500/1500 [==============================] - 6s 4ms/step - loss: 0.0496 - accuracy: 0.9855 - val_loss: 0.0887 - val_accuracy: 0.9748
Epoch 6/20
1500/1500 [==============================] - 5s 4ms/step - loss: 0.0388 - accuracy: 0.9879 - val_loss: 0.0933 - val_accuracy: 0.9736
Epoch 7/20
1500/1500 [==============================] - 7s 5ms/step - loss: 0.0309 - accuracy: 0.9907 - val_loss: 0.0991 - val_accuracy: 0.9715
Epoch 8/20
1500/1500 [==============================] - 5s 4ms/step - loss: 0.0239 - accuracy: 0.9928 - val_loss: 0.0905 - val_accuracy: 0.9754
313/313 [==============================] - 1s 2ms/step - loss: 0.0786 - accuracy: 0.9768
Test accuracy: 0.9768000245094299
The training process involved training a neural network on the MNIST dataset for up to 20 epochs. ach epoch corresponds to a full pass through the training data. For each epoch, the number of steps (batches of data processed) is indicated. In this case, there are 1500 steps per epoch.
The training stopped early after the 8th epoch because the validation loss did not improve significantly for 3 consecutive epochs. This is controlled by the EarlyStopping callback to prevent overfitting. The final evaluation on the test data shows a test loss of 0.0786 and a test accuracy of 0.9768 (97.68%). This indicates that the model generalizes well to new, unseen data.
Conclusion
TensorFlow callbacks are an essential part of model training, allowing for enhanced control and monitoring. Whether you use built-in callbacks or create custom ones, they can significantly improve the efficiency and effectiveness of your training process.
