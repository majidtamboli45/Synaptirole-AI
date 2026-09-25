# Detecting Covid

> Source: https://www.geeksforgeeks.org/machine-learning/detecting-covid-19-with-chest-x-ray/

COVID-19 pandemic is one of the biggest challenges for the healthcare system right now. It is a respiratory disease that affects our lungs and can cause lasting damage to the lungs that led to symptoms such as difficulty in breathing and in some cases pneumonia and respiratory failure. In this article, we will use X-ray data of lungs normal and COVID-positive patients and train a model to differentiate between them.
Dataset and Models Used:
The dataset used in this post is the winner of the Kaggle community award. The dataset is collected by researchers from Qatar and Bangladesh. This dataset contains 3 types of images:
- COVID-19 positive (219 images)
- Viral Pneumonia (1341 images)
- Normal X-ray (1345 images)
Therefore, we have to classify among these 3 different classes and we will use the softmax layer for classification.
These images have the size (1024, 1024) and 3 color channels. The authors of the dataset also trained a ResNet -34 model and achieved an accuracy of 98.5%.
Implementation:
- In this article, we will use the Xception model with the help of Keras API. This model obtained an ImageNet top-1 accuracy of 79% and a top-5 accuracy of 95%.
- First, we need to import the necessary modules.
import numpy as np
import matplotlib.pyplot as plt
import tensorflow as tf
from tensorflow.keras import Sequential
from keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.applications import InceptionResNetV2
from tensorflow.keras.preprocessing.image import ImageDataGenerator
from tensorflow.keras.applications.xception import Xception
from tensorflow.keras.layers import Dense,Flatten,  Input, Dropout
- Now, we will use Kaggle API to download the dataset to the system. First, we will require the API key, to do this just navigate to the profile section on Kaggle and download a JSON file containing our details for API, after that just upload this to colab or locate in the local jupyter environment.
# code
"""
Kaggle API setup
Credits: https://www.kaggle.com/general/74235
"""
# Install Kaggle module
!pip install kaggle
# Upload API details json file to colab
from google.colab import files
files.upload()
# create a Kaggle directory and move json files to there
! mkdir ~/.kaggle
! cp kaggle.json ~/.kaggle/
# change permissions of kaggle json file
! chmod 600 ~/.kaggle/kaggle.json
# Now we download our dataset with following command format :
"""
! kaggle datasets download -d user/dataset
 or
! kaggle competitions download -c 'name-of-competition' 
"""
! kaggle datasets download -d tawsifurrahman/covid19-radiography-database
- Now, we unzip the dataset into the desired folder.
! unzip covid19-radiography-database.zip -d /content/data
- Now we preprocessed the dataset, we reduce the image size from (1024, 1024) to (299,299) [the maximum size accepted by the Xception model], and we divide it into a batch size of 16.
# Load Xception model
base = Xception(weights="imagenet", input_shape =(299,299,3),include_top= False)
# set base model trainable to false
for layers in base.layers:
    layers.trainable=False
base.summary()
Downloading data from 
https://storage.googleapis.com/tensorflow/keras-applications/xception/
xception_weights_tf_dim_ordering_tf_kernels_notop.h5
83689472/83683744 [==============================] - 1s 0us/step
Model: "xception"
__________________________________________________________________________________________________
Layer (type)                    Output Shape         Param #     Connected to                     
==================================================================================================
input_1 (InputLayer)            [(None, 299, 299, 3) 0                                            
__________________________________________________________________________________________________
block1_conv1 (Conv2D)           (None, 149, 149, 32) 864         input_1[0][0]                    
__________________________________________________________________________________________________
block1_conv1_bn (BatchNormaliza (None, 149, 149, 32) 128         block1_conv1[0][0]               
__________________________________________________________________________________________________
block1_conv1_act (Activation)   (None, 149, 149, 32) 0           block1_conv1_bn[0][0]            
__________________________________________________________________________________________________
block1_conv2 (Conv2D)           (None, 147, 147, 64) 18432       block1_conv1_act[0][0]           
__________________________________________________________________________________________________
block1_conv2_bn (BatchNormaliza (None, 147, 147, 64) 256         block1_conv2[0][0]               
__________________________________________________________________________________________________
block1_conv2_act (Activation)   (None, 147, 147, 64) 0           block1_conv2_bn[0][0]            
__________________________________________________________________________________________________
block2_sepconv1 (SeparableConv2 (None, 147, 147, 128 8768        block1_conv2_act[0][0]           
__________________________________________________________________________________________________
block2_sepconv1_bn (BatchNormal (None, 147, 147, 128 512         block2_sepconv1[0][0]            
__________________________________________________________________________________________________
block2_sepconv2_act (Activation (None, 147, 147, 128 0           block2_sepconv1_bn[0][0]         
__________________________________________________________________________________________________
block2_sepconv2 (SeparableConv2 (None, 147, 147, 128 17536       block2_sepconv2_act[0][0]        
__________________________________________________________________________________________________
block2_sepconv2_bn (BatchNormal (None, 147, 147, 128 512         block2_sepconv2[0][0]            
__________________________________________________________________________________________________
conv2d (Conv2D)                 (None, 74, 74, 128)  8192        block1_conv2_act[0][0]           
__________________________________________________________________________________________________
block2_pool (MaxPooling2D)      (None, 74, 74, 128)  0           block2_sepconv2_bn[0][0]         
__________________________________________________________________________________________________
batch_normalization (BatchNorma (None, 74, 74, 128)  512         conv2d[0][0]                     
__________________________________________________________________________________________________
add (Add)                       (None, 74, 74, 128)  0           block2_pool[0][0]                
                                                                 batch_normalization[0][0]        
__________________________________________________________________________________________________
block3_sepconv1_act (Activation (None, 74, 74, 128)  0           add[0][0]                        
__________________________________________________________________________________________________
block3_sepconv1 (SeparableConv2 (None, 74, 74, 256)  33920       block3_sepconv1_act[0][0]        
__________________________________________________________________________________________________
block3_sepconv1_bn (BatchNormal (None, 74, 74, 256)  1024        block3_sepconv1[0][0]            
__________________________________________________________________________________________________
block3_sepconv2_act (Activation (None, 74, 74, 256)  0           block3_sepconv1_bn[0][0]         
__________________________________________________________________________________________________
block3_sepconv2 (SeparableConv2 (None, 74, 74, 256)  67840       block3_sepconv2_act[0][0]        
__________________________________________________________________________________________________
block3_sepconv2_bn (BatchNormal (None, 74, 74, 256)  1024        block3_sepconv2[0][0]            
__________________________________________________________________________________________________
conv2d_1 (Conv2D)               (None, 37, 37, 256)  32768       add[0][0]                        
__________________________________________________________________________________________________
block3_pool (MaxPooling2D)      (None, 37, 37, 256)  0           block3_sepconv2_bn[0][0]         
__________________________________________________________________________________________________
batch_normalization_1 (BatchNor (None, 37, 37, 256)  1024        conv2d_1[0][0]                   
__________________________________________________________________________________________________
.............
(Trimmed model Summary)
==================================================================================================
Total params: 20,861,480
Trainable params: 0
Non-trainable params: 20,861,480
________________________________________________________________________
- Now, we apply some data augmentation on the dataset and prepare it for training. After that, we plot some training images. We will split the dataset in such a way that we have 75% data for training and 25% for the test/validation.
# Define augmentation
train_datagen = ImageDataGenerator(
        rescale=1./255,
        shear_range=0.2,
        zoom_range=0.2,
        validation_split=0.25,
        horizontal_flip =True
        )
# apply augmentations on dataset
train =train_datagen.flow_from_directory(
    "data/",
    target_size=(299, 299),
    batch_size=batch_size,
    class_mode='categorical',
    subset='training')
val =train_datagen.flow_from_directory(
    "data/",
    target_size=(299, 299),
    batch_size=batch_size,
    class_mode='categorical',
    subset='validation')
class_names=['covid-19','normal','pneumonia']
# code to plot images
def plotImages(images_arr, labels):
    fig, axes = plt.subplots(12, 4, figsize=(20,80))
    axes = axes.flatten()
    label=0
    for img, ax in zip( images_arr, axes):
        ax.imshow(img)
        ax.set_title(class_names[np.argmax(labels[label])])
        label=label+1
    plt.show()
# append a batch of images from each category (COVID-19, Normal, Viral_Pneumonia)
images = [train[34][0][0] for i in range(16)]
images = images + [train[5][0][0] for i in range(16)]
images = images + [train[0][0][0] for i in range(16)]
# append the batch of labels
labels=[]
labels = [train[34][1][0] for i in range(16)]
labels=  labels + [train[5][1][0] for i in range(16)]
labels=  labels + [train[0][1][0] for i in range(16)]
# plot images with labels
plotImages(images,labels)
Now, we define our model, First, we will import our base model i.e Xception (we use imagenet pretrained weights) in our sequential model, flatten the top layer and apply a dense layer (fully connected layer) and a softmax classification layer to classify among 3 classes. To prevent the model from overfitting we will also add some dropout layers.
# Define our complete models
model = Sequential()
model.add(Input(shape =(299,299,3)))
model.add(base)
model.add(Dropout(0.2))
model.add(Flatten())
model.add(Dropout(0.2))
model.add(Dense(16))
model.add(Dense(3,activation='softmax'))
model.summary()
Model: "sequential"
_________________________________________________________________
Layer (type)                 Output Shape              Param #   
=================================================================
xception (Functional)        (None, 10, 10, 2048)      20861480  
_________________________________________________________________
dropout (Dropout)            (None, 10, 10, 2048)      0         
_________________________________________________________________
flatten (Flatten)            (None, 204800)            0         
_________________________________________________________________
dropout_1 (Dropout)          (None, 204800)            0         
_________________________________________________________________
dense (Dense)                (None, 16)                3276816   
_________________________________________________________________
dense_1 (Dense)              (None, 3)                 51        
=================================================================
Total params: 24,138,347
Trainable params: 3,276,867
Non-trainable params: 20,861,480
_________________________________________________________________
Now we will compile and train the model, we use Adam Optimizer with a 0.001 learning rate. We will train the model for 30 epochs.
# import adam optimizer
from tensorflow.keras.optimizers import Adam
# compile model(define metrics and loss)
model.compile(
    optimizer=Adam(learning_rate=1e-3),
    loss="categorical_crossentropy",
    metrics=["accuracy"],
)
# train model for 30 epoch
model.fit_generator(train,epochs=30,validation_data=val)
# save model
model.save('epoch_30.h5')
Epoch 1/30
137/137 [==============================] - 121s 886ms/step - 
loss: 5.7757 - accuracy: 0.8528 - val_loss: 3.4022 - val_accuracy: 0.8966
Epoch 2/30
137/137 [==============================] - 119s 867ms/step - 
loss: 3.3137 - accuracy: 0.9028 - val_loss: 2.0748 - val_accuracy: 0.9228
Epoch 3/30
137/137 [==============================] - 119s 866ms/step - 
loss: 2.2811 - accuracy: 0.9161 - val_loss: 2.2661 - val_accuracy: 0.9186
Epoch 4/30
137/137 [==============================] - 119s 867ms/step - 
loss: 1.6122 - accuracy: 0.9339 - val_loss: 3.8654 - val_accuracy: 0.8648
Epoch 5/30
137/137 [==============================] - 120s 877ms/step - 
loss: 1.0704 - accuracy: 0.9440 - val_loss: 1.6559 - val_accuracy: 0.9214
Epoch 6/30
137/137 [==============================] - 120s 875ms/step - 
loss: 0.7675 - accuracy: 0.9509 - val_loss: 1.3920 - val_accuracy: 0.9255
Epoch 7/30
137/137 [==============================] - 120s 872ms/step - 
loss: 0.5744 - accuracy: 0.9509 - val_loss: 1.2669 - val_accuracy: 0.9021
Epoch 8/30
137/137 [==============================] - 119s 872ms/step - 
loss: 0.4065 - accuracy: 0.9528 - val_loss: 1.1800 - val_accuracy: 0.9145
Epoch 9/30
137/137 [==============================] - 118s 864ms/step - 
loss: 0.2160 - accuracy: 0.9638 - val_loss: 0.7624 - val_accuracy: 0.9379
Epoch 10/30
137/137 [==============================] - 119s 865ms/step - 
loss: 0.2552 - accuracy: 0.9606 - val_loss: 0.4897 - val_accuracy: 0.9421
Epoch 11/30
137/137 [==============================] - 118s 864ms/step - 
loss: 0.2015 - accuracy: 0.9651 - val_loss: 0.4510 - val_accuracy: 0.9476
Epoch 12/30
137/137 [==============================] - 121s 880ms/step - 
loss: 0.1473 - accuracy: 0.9725 - val_loss: 0.3458 - val_accuracy: 0.9352
Epoch 13/30
137/137 [==============================] - 121s 880ms/step - 
loss: 0.1534 - accuracy: 0.9656 - val_loss: 0.5945 - val_accuracy: 0.9297
Epoch 14/30
137/137 [==============================] - 120s 876ms/step - 
loss: 0.1315 - accuracy: 0.9734 - val_loss: 0.4655 - val_accuracy: 0.9407
Epoch 15/30
137/137 [==============================] - 121s 882ms/step - 
loss: 0.1127 - accuracy: 0.9661 - val_loss: 0.3728 - val_accuracy: 0.9186
Epoch 16/30
137/137 [==============================] - 121s 882ms/step - 
loss: 0.1198 - accuracy: 0.9716 - val_loss: 0.4312 - val_accuracy: 0.9476
Epoch 17/30
137/137 [==============================] - 120s 875ms/step - 
loss: 0.1046 - accuracy: 0.9771 - val_loss: 0.4035 - val_accuracy: 0.9393
Epoch 18/30
137/137 [==============================] - 119s 870ms/step - 
loss: 0.0872 - accuracy: 0.9761 - val_loss: 0.8248 - val_accuracy: 0.9145
Epoch 19/30
137/137 [==============================] - 120s 874ms/step - 
loss: 0.1116 - accuracy: 0.9752 - val_loss: 0.3309 - val_accuracy: 0.9393
Epoch 20/30
137/137 [==============================] - 120s 877ms/step - 
loss: 0.1261 - accuracy: 0.9729 - val_loss: 0.5384 - val_accuracy: 0.8924
Epoch 21/30
137/137 [==============================] - 119s 869ms/step - 
loss: 0.0840 - accuracy: 0.9748 - val_loss: 0.5690 - val_accuracy: 0.9366
Epoch 22/30
137/137 [==============================] - 119s 868ms/step - 
loss: 0.0942 - accuracy: 0.9761 - val_loss: 0.3517 - val_accuracy: 0.9448
Epoch 23/30
137/137 [==============================] - 120s 876ms/step - 
loss: 0.1207 - accuracy: 0.9656 - val_loss: 0.2871 - val_accuracy: 0.9434
Epoch 24/30
137/137 [==============================] - 118s 864ms/step - 
loss: 0.0959 - accuracy: 0.9729 - val_loss: 0.4589 - val_accuracy: 0.9366
Epoch 25/30
137/137 [==============================] - 119s 867ms/step - 
loss: 0.0945 - accuracy: 0.9748 - val_loss: 0.3964 - val_accuracy: 0.9490
Epoch 26/30
137/137 [==============================] - 119s 871ms/step - 
loss: 0.1039 - accuracy: 0.9761 - val_loss: 0.3048 - val_accuracy: 0.9393
Epoch 27/30
137/137 [==============================] - 119s 866ms/step - 
loss: 0.0905 - accuracy: 0.9739 - val_loss: 0.3308 - val_accuracy: 0.9407
Epoch 28/30
137/137 [==============================] - 120s 873ms/step - 
loss: 0.0757 - accuracy: 0.9766 - val_loss: 0.1871 - val_accuracy: 0.9517
Epoch 29/30
137/137 [==============================] - 119s 871ms/step - 
loss: 0.1012 - accuracy: 0.9688 - val_loss: 0.7361 - val_accuracy: 0.9297
Epoch 30/30
137/137 [==============================] - 120s 874ms/step - 
loss: 0.0713 - accuracy: 0.9780 - val_loss: 0.3497 - val_accuracy: 0.9434
Results and Conclusion: We have obtained an accuracy on 97.8% on training set and 94.3% on validation set in just 30 epochs on Xception model, which is close to the 98.3% accuracy as reported by the authors of paper.
