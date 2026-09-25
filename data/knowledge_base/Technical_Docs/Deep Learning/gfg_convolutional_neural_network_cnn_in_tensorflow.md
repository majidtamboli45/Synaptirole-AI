# Convolutional Neural Network (CNN) in Tensorflow

> Source: https://www.geeksforgeeks.org/deep-learning/convolutional-neural-network-cnn-in-tensorflow/

Convolutional Neural Networks (CNNs) are a class of deep learning models widely used in computer vision to process and analyze image data. They are designed to automatically detect patterns and structures in images without manual feature engineering.
- Uses convolution layers to detect features like edges, textures, and shapes.
- Applies pooling layers to reduce image size while retaining important information.
- Easily implemented and trained using TensorFlow for vision-based tasks.
Implementation
1. Importing Libraries
We will import
- matplotlib for visualizing images and results
- tensorflow used for building and training CNN models
import tensorflow as tf
from tensorflow.keras import layers, models
from tensorflow.keras.datasets import cifar10
from tensorflow.keras.utils import to_categorical
import matplotlib.pyplot as plt
2. Loading and Preprocessing the Dataset
Using CIFAR-10 dataset, a popular benchmark for image classification in computer vision. It contains 60,000 color images (32×32 pixels) across10 classes, with 6,000 images per class.
- Normalization: Pixel values (0–255) are scaled to 0–1 by dividing by 255 for better training stability.
- to_categorical(): Converts class labels into one-hot encoded vectors for multi-class classification.
(train_images, train_labels), (test_images, test_labels) = cifar10.load_data()
train_images, test_images = train_images / 255.0, test_images / 255.0
train_labels = to_categorical(train_labels, 10)
test_labels = to_categorical(test_labels, 10)
3. Defining the CNN Model
- Conv2D: Applies 32 filters of size (3×3) to extract image features.
- models.Sequential(): Builds a model as a stack of layers in order.
- MaxPool2D: Reduces feature map size while keeping important information.
- Flatten: Converts 2D feature maps into a 1D vector.
- Dense: Fully connected layer with 128 neurons using ReLU activation.
model = models.Sequential([
    layers.Conv2D(32, (3, 3), activation='relu', input_shape=(32, 32, 3)),
    layers.MaxPooling2D(pool_size=(2, 2)),
    layers.Flatten(),
    layers.Dense(128, activation='relu'),
    layers.Dense(10, activation='softmax')
])
4. Compiling the Model
- Adam optimizer: Optimizes model by adaptively adjusting learning rates using gradient moments.
- Categorical cross entropy: Measures loss for multi-class classification tasks.
- metrics=['accuracy']: Tracks model accuracy during training and evaluation.
model.compile(optimizer='adam',
              loss='categorical_crossentropy',
              metrics=['accuracy'])
5. Training the Model
- The model will process 64 images at a time before updating the weights.
- The model will train for 10 iterations over the entire dataset.
- The test set evaluates model performance on unseen data after each epoch.
history = model.fit(train_images, train_labels, epochs=10, batch_size=64, validation_data=(test_images, test_labels))
Output:
6. Evaluating the Model
test_loss, test_acc = model.evaluate(test_images, test_labels)
print(f"Test accuracy: {test_acc * 100:.2f}%")
Output:
Test accuracy: 70.05%
Test accuracy is 70% which is good for simple CNN model we can increase its accuracy further by optimizing the model based on our task.
7. Plotting Training History
plt.plot(history.history['accuracy'], label='Training Accuracy')
plt.plot(history.history['val_accuracy'], label='Validation Accuracy')
plt.title('Model Accuracy')
plt.xlabel('Epoch')
plt.ylabel('Accuracy')
plt.legend(loc='lower right')
plt.show()
plt.plot(history.history['loss'], label='Training Loss')
plt.plot(history.history['val_loss'], label='Validation Loss')
plt.title('Model Loss')
plt.xlabel('Epoch')
plt.ylabel('Loss')
plt.legend(loc='upper right')
plt.show()
Output:
Training accuracy increases steadily, showing the model is learning effectively. Validation accuracy fluctuates initially but stabilizes later, indicating good generalization. A small gap between training and validation accuracy suggests room for improvement.
Advantages
- Automatically learns features from images without manual feature engineering.
- Highly effective for image classification and computer vision tasks.
- Captures spatial patterns like edges, shapes, and textures efficiently.
Limitations
- Requires large datasets for good performance.
- Computationally expensive and needs high processing power.
- Prone to overfitting if not properly regularized.
