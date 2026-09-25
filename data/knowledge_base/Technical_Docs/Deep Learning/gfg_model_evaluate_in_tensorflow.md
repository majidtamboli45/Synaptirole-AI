# model.evaluate() in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/model-evaluate-in-tensorflow/

The model.evaluate() function in TensorFlow is used to evaluate a trained model on a given dataset. It returns the loss value and any additional metrics specified during model compilation. model.evaluate() function allows us to assess how well the trained model generalizes to unseen data.
Syntax of model.evaluate()
model.evaluate(
    x=None,
    y=None,
    batch_size=None,
    verbose=1,
    sample_weight=None,
    steps=None,
    callbacks=None,
    return_dict=False,
    use_multiprocessing=False
)
Parameters:
- x: Input data. Can be a NumPy array, TensorFlow dataset, or generator.
- y: Target data (labels corresponding to x).
- batch_size: Number of samples per batch. If None, the batch size defaults to 32.
- verbose: Controls logging output (0 = silent, 1 = progress bar, 2 = one line per epoch).
- sample_weight: Optional weights for samples.
- steps: Number of batches to evaluate (only applicable if x is a generator).
- callbacks: List of callback functions to be applied during evaluation.
- return_dict: If True, returns a dictionary of metric values.
- use_multiprocessing: If True, uses multiple CPU processes for data loading.
The function returns:
- If return_dict=False: A scalar loss value or a list of values (loss + additional metrics).
- If return_dict=True: A dictionary containing loss and metrics.
Using model.evaluate() to evaluate Deep Learning Model
import tensorflow as tf
import numpy as np
from tensorflow import keras
(x_train, y_train), (x_test, y_test) = keras.datasets.mnist.load_data()
x_train, x_test = x_train / 255.0, x_test / 255.0 
model = keras.Sequential([
    keras.layers.Flatten(input_shape=(28, 28)),
    keras.layers.Dense(128, activation='relu'),
    keras.layers.Dense(10, activation='softmax')
])
model.compile(optimizer='adam',
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])
model.fit(x_train, y_train, epochs=5, batch_size=32)
loss, accuracy = model.evaluate(x_test, y_test, batch_size=32)
print(f"Test Loss: {loss:.4f}")
print(f"Test Accuracy: {accuracy:.4f}")
Output:
Test Loss: 0.0775
Test Accuracy: 0.9773
model.evaluate() function in TensorFlow provides a simple and effective way to assess model performance on test data. By understanding its parameters and return values, you can efficiently measure your model's accuracy, loss, and other metrics.
