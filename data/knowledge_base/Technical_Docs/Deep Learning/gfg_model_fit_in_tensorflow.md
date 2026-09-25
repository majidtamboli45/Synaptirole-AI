# model.fit() in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/model-fit-in-tensorflow/

In TensorFlow,model.fit() function is used to train a machine learning model for a fixed number of epochs (iterations over the entire dataset). During training, the model adjusts its internal parameters (weights and biases) to minimize the loss function using optimization techniques like Gradient Descent.
Syntax of model.fit()
model.fit(
    x=None,
    y=None,
    batch_size=None,
    epochs=1,
    verbose=1,
    validation_data=None,
    validation_split=0.0,
    callbacks=None,
    shuffle=True,
)
Parameters:
- x (input data): The input data for training. This can be a NumPy array, TensorFlow dataset, or any other valid tensor-like object.
- y (target data): The labels or target data corresponding to the input data x.
- batch_size: Number of samples per gradient update. It determines the size of each mini-batch for training.
- epochs: The number of times to iterate over the entire dataset. This defines how many times the model will learn from the data.
- verbose: Controls the verbosity of the training process:
  - 0: No output.
  - 1: Progress bar.
  - 2: One line per epoch.
- validation_data: Data used for evaluating the model performance during training, typically a tuple (x_val, y_val).
- validation_split: Fraction of the training data to be used for validation (e.g., 0.2 means 20% of data will be used for validation).
- callbacks: A list of callback functions that are executed at various stages of training, such as EarlyStopping or ModelCheckpoint.
- shuffle: Whether to shuffle the training data before each epoch to improve generalization.
How Does model.fit() Work?
The function works by repeatedly passing the data through the model in batches. In each iteration (epoch), the model performs the following steps:
- Forward Pass: The input data is passed through the model, and predictions are made.
- Loss Calculation: The model compares the predictions to the true values (targets/labels) and calculates a loss using a predefined loss function.
- Backward Pass: The model computes gradients for all parameters by using the backpropagation algorithm.
- Weight Update: The model updates its weights using an optimization algorithm (like Stochastic Gradient Descent or Adam).
- Repeat: This process is repeated for the specified number of epochs, gradually improving the model's accuracy.
How to use model.fit() in TensorFlow?
Here’s a simple example demonstrating how to use model.fit() in TensorFlow. The model will train for 5 epochs, the training data is processed data is used for validation.
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.datasets import mnist
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train = x_train.reshape(-1, 28*28).astype('float32') / 255
x_test = x_test.reshape(-1, 28*28).astype('float32') / 255
# Build a Model
model = Sequential([
    Dense(128, activation='relu', input_shape=(28*28,)),
    Dense(10, activation='softmax')
])
model.compile(optimizer='adam', loss='sparse_categorical_crossentropy', metrics=['accuracy'])
# Train the model
model.fit(x_train, y_train, epochs=5, batch_size=32, validation_split=0.2, verbose=1)
Output:
Epoch 1/5
1500/1500 ━━━━━━━━━━━━━━━━━━━━ 12s 7ms/step - accuracy: 0.8581 - loss: 0.4902 - val_accuracy: 0.9554 - val_loss: 0.1595
Epoch 2/5
1500/1500 ━━━━━━━━━━━━━━━━━━━━ 10s 6ms/step - accuracy: 0.9597 - loss: 0.1401 - val_accuracy: 0.9675 - val_loss: 0.1117
Epoch 3/5
1500/1500 ━━━━━━━━━━━━━━━━━━━━ 11s 7ms/step - accuracy: 0.9715 - loss: 0.0949 - val_accuracy: 0.9713 - val_loss: 0.1021
Epoch 4/5
1500/1500 ━━━━━━━━━━━━━━━━━━━━ 8s 5ms/step - accuracy: 0.9801 - loss: 0.0678 - val_accuracy: 0.9735 - val_loss: 0.0941
Epoch 5/5
1500/1500 ━━━━━━━━━━━━━━━━━━━━ 9s 4ms/step - accuracy: 0.9856 - loss: 0.0493 - val_accuracy: 0.9714 - val_loss: 0.0971
<keras.src.callbacks.history.History at 0x78568fbbe990>
Additional Considerations
- Early Stopping: You can use callbacks like EarlyStopping to stop training if the model performance doesn’t improve over a set number of epochs, preventing overfitting.
from tensorflow.keras.callbacks import EarlyStopping
early_stopping = EarlyStopping(monitor='val_loss', patience=3)
model.fit(x_train, y_train, epochs=50, validation_data=(x_test, y_test), callbacks=[early_stopping])
- Model Checkpoint: You can save the best model during training using ModelCheckpoint.
from tensorflow.keras.callbacks import ModelCheckpoint
checkpoint = ModelCheckpoint('best_model.h5', save_best_only=True)
model.fit(x_train, y_train, epochs=50, validation_data=(x_test, y_test), callbacks=[checkpoint])
model.fit() is an essential part of the deep learning workflow, as it is the process through which the model learns patterns from data. It facilitates the training of the model by managing data batches, loss functions, optimizers, and validation data, and it integrates seamlessly with TensorFlow's high-level APIs.
