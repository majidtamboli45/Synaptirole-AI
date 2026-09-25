# Cat & Dog Classification using Convolutional Neural Network in Python

> Source: https://www.geeksforgeeks.org/deep-learning/cat-dog-classification-using-convolutional-neural-network-in-python/

Convolutional Neural Networks (CNNs) are a type of deep learning model specifically designed for processing images. Unlike traditional neural networks CNNs uses convolutional layers to automatically and efficiently extract features such as edges, textures and patterns from images. This makes them highly effective for tasks like image classification, object detection and segmentation. In this article we will build a CNN-based classifier to distinguish between images of cats and dogs.
Implementing Cat and Dog Classification using CNN
By following these steps we will gain insights into how CNNs work, how to preprocess image data and how to train an efficient classification model with high accuracy.
1. Importing Libraries
We will import the required libraries such as Numpy, Pandas, Matplotlib, Scikit-learn, OpenCV, TensorFlow.
import matplotlib.pyplot as plt
import tensorflow as tf
import pandas as pd
import numpy as np
import warnings
warnings.filterwarnings('ignore')
from tensorflow import keras
from keras import layers
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Activation, Dropout, Flatten, Dense
from tensorflow.keras.layers import Conv2D, MaxPooling2D
from tensorflow.keras.utils import image_dataset_from_directory
from tensorflow.keras.preprocessing.image import ImageDataGenerator, load_img
from tensorflow.keras.preprocessing import image_dataset_from_directory
import os
import matplotlib.image as mpimg 
2. Importing Dataset
We will be using Kaggle dataset for this which is in the format of a zip file containing 2 folders : Cat and Dog. Further each folder contains 12500 images of respective animals. So to import and unzip the file and we can run the below code.
- The ZipFile module extracts dataset files from the zip archive.
- Extracted data is stored in the 'dog-vs-cat-classification' folder.
from zipfile import ZipFile
data_path = 'dog-vs-cat.zip'
with ZipFile(data_path, 'r') as zip:
    zip.extractall()
    print('The data set has been extracted.')
3. Visualizating the Data
We will try to understand and visualize some images which have been provided to us to build the classifier for each class. We extract image paths and loads them using Matplotlib and plot grid visualization using subplot().
- fig = plt.gcf() gets the current figure.
- fig.set_size_inches(16, 16) sets the figure size.
- cat_dir and dog_dir define paths to the cat and dog image directories.
- cat_names and dog_names list the image files in each directory.
- cat_images and dog_images select images based on pic_index.
- plt.subplot(4, 4, i+1) creates a 4x4 grid for images.
- sp.axis('Off') hides the axis.
- mpimg.imread(img_path) reads each image and plt.imshow(img) displays it.
- plt.show() shows the grid of images.
fig = plt.gcf()
fig.set_size_inches(16, 16)
cat_dir = os.path.join('dog-vs-cat-classification/cat')
dog_dir = os.path.join('dog-vs-cat-classification/dog')
cat_names = os.listdir(cat_dir)
dog_names = os.listdir(dog_dir)
pic_index = 210
cat_images = [os.path.join(cat_dir, fname)
              for fname in cat_names[pic_index-8:pic_index]]
dog_images = [os.path.join(dog_dir, fname)
              for fname in dog_names[pic_index-8:pic_index]]
for i, img_path in enumerate(cat_images + dog_images):
    sp = plt.subplot(4, 4, i+1)
    sp.axis('Off')
    img = mpimg.imread(img_path)
    plt.imshow(img)
plt.show()
Output :
4. Splitting Dataset
We split the dataset into training and validation sets.
- image_dataset_from_directory: is used for data augmentation and scaling images.
- The dataset is split into 90% training and 10% validation.
- target_size=(200, 200): Resizes images to 200x200 pixels.
- batch_size=32: Defines the number of images per batch.
base_dir = 'dog-vs-cat-classification'
train_datagen = image_dataset_from_directory(base_dir,
                                                  image_size=(200,200),
                                                  subset='training',
                                                  seed = 1,
                                                 validation_split=0.1,
                                                  batch_size= 32)
test_datagen = image_dataset_from_directory(base_dir,
                                                  image_size=(200,200),
                                                  subset='validation',
                                                  seed = 1,
                                                 validation_split=0.1,
                                                  batch_size= 32)
Output :
Found 25000 files belonging to 2 classes.
Using 22500 files for training.
Found 25000 files belonging to 2 classes.
Using 2500 files for validation.
5. Model Architecture
The model will contain the following Layers:
- Conv2D layers: extract image features like edges, shapes and textures.
- MaxPooling2D: reduces image dimensions while retaining important information.
- BatchNormalization: helps stabilize training and speed up convergence.
- Dropout layers: prevent overfitting.
- sigmoid activation: outputs a binary classification as Cat or Dog.
We can see the models architecture using model.summary() function.
model = tf.keras.models.Sequential([
    layers.Conv2D(32, (3, 3), activation='relu', input_shape=(200, 200, 3)),
    layers.MaxPooling2D(2, 2),
    layers.Conv2D(64, (3, 3), activation='relu'),
    layers.MaxPooling2D(2, 2),
    layers.Conv2D(64, (3, 3), activation='relu'),
    layers.MaxPooling2D(2, 2),
    layers.Conv2D(64, (3, 3), activation='relu'),
    layers.MaxPooling2D(2, 2),
    layers.Flatten(),
    layers.Dense(512, activation='relu'),
    layers.BatchNormalization(),
    layers.Dense(512, activation='relu'),
    layers.Dropout(0.1),
    layers.BatchNormalization(),
    layers.Dense(512, activation='relu'),
    layers.Dropout(0.2),
    layers.BatchNormalization(),
    layers.Dense(1, activation='sigmoid')
])
model.summary()
Output :
7. Model Compilation and Training
Now we will compile and train our model. We used Binary Crossentropy Loss Function for binary classification problems with Adam optimizer.
- model.compile(loss='binary_crossentropy', optimizer='adam', metrics=['accuracy']) compiles the model with binary cross-entropy loss, Adam optimizer and accuracy as the metric.
- history = model.fit(train_datagen, epochs=10, validation_data=test_datagen) trains the model for 10 epochs using the training data and validates it using the test data.
model.compile(
    loss='binary_crossentropy',
    optimizer='adam',
    metrics=['accuracy']
)
history = model.fit(train_datagen,
          epochs=10,
          validation_data=test_datagen)
Output :
The model is working fine with epochs = 10 but we can fine tune hyperparameter for better results.
8. Model Evaluation
Let’s visualize the training and validation accuracy with each epoch.
- history_df = pd.DataFrame(history.history) converts the training history into a DataFrame.
- history_df.loc[:, ['loss', 'val_loss']].plot() plots the training and validation loss.
- history_df.loc[:, ['accuracy', 'val_accuracy']].plot() plots the training and validation accuracy.
history_df = pd.DataFrame(history.history)
history_df.loc[:, ['loss', 'val_loss']].plot()
history_df.loc[:, ['accuracy', 'val_accuracy']].plot()
plt.show()
Output :
The loss graph shows fluctuating training and validation losses with a spike in validation loss around epoch 3 showing potential overfitting. The accuracy graph reveals that training accuracy improves steadily. Validation accuracy fluctuates indicating that the model may not be generalizing well.
8. Model Testing and Prediction
Let's check the model for random images.
- img = image.load_img(image_path, target_size=(200, 200)) loads the image and resizes it to 200x200 pixels.
- plt.imshow(img) displays the image.
- img = image.img_to_array(img) converts the image to a NumPy array.
- img = np.expand_dims(img, axis=0) adds an extra dimension for batch processing.
- result = model.predict(img) makes a prediction using the model.
def predict_image(image_path):
    img = image.load_img(image_path, target_size=(200, 200))
    plt.imshow(img)
    img = image.img_to_array(img)
    img = np.expand_dims(img, axis=0)
    result = model.predict(img)
    print("Dog" if result >= 0.5 else "Cat")
    
predict_image('dog-vs-cat-classification/cat/cat.320.jpg')
predict_image('dog-vs-cat-classification/dog/dog.5510.jpg')
Output:
We can see that our model is able to predict images correctly, hence our CNN model to predict cats and dogs in images is working fine. For better performance we can use Transfer Learning and perform hyperparameter tuning.
