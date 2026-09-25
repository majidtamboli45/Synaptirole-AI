# Pneumonia Detection using Deep Learning

> Source: https://www.geeksforgeeks.org/deep-learning/pneumonia-detection-using-deep-learning/

Pneumonia which is a dangerous disease that may occur in one or both lungs usually caused by viruses, fungi or bacteria. We will detect this lung disease based on the x-rays we have. Chest X-rays dataset is taken from Kaggle which contain various x-rays images differentiated by two categories "Pneumonia" and "Normal". We will be creating a deep learning model which will actually tell us whether the person is having pneumonia disease or not having pneumonia.
Tools and Technologies
VGG16: It is an easy and broadly used Convolutional Neural Network (CNN) Architecture used for ImageNet which is a huge visible database mission utilized in visual object recognition software research.
Transfer learning (TL): It is a technique in deep learning that focuses on taking a pre-trained neural network and storing knowledge gained while solving one problem and applying it to new different datasets. In this article, knowledge gained while learning to recognize 1000 different classes in ImageNet could apply when trying to recognize the disease.
Model architecture
Modules Required
- Keras: It is a Python module for deep learning that runs on the top of TensorFlow library. It was created to make implementing deep learning models as easy and fast as possible for research and development. Being the fact that Keras runs on top of Keras we have to install TensorFlow first. To install this library, type the following commands in IDE/terminal.
!pip install tensorflow !pip install keras
- SciPy: SciPy is a free and open-source Python module used for technical and scientific computing. As we require Image Transformations in this article we have to install SciPy module. To install this library, type the following command in IDE/terminal.
!pip install scipy
- glob: In Python, the glob module is used to retrieve files/pathnames matching a specified pattern. To find how many classes are present in our train dataset folder we use this module in this article.
!pip install glob2
Stepwise Implementation
Step 1: Download the dataset from this url. The dataset contains Test, Train, Validation folders. We will use test and train datasets for training our model. Then we will verify our model using the validation dataset.
Step 2: Import all the necessary modules that are available in keras like ImageDataGenerator, Model, Dense, Flatten and all. We will be creating a generic code which means that we just have to change the library name then our code will automatically work with respect to VGG16, VGG19 and resnet50.
from keras.models import Model
from keras.layers import Flatten,Dense
from keras.applications.vgg16 import VGG16
import matplotlib.pyplot as plot
from glob import glob
Step 3: After this, we will provide our image size i.e 224 x 224 this is a fixed-size for VGG16 architecture. 3 signifies that we are working with RGB type of images. Then we will provide our training and testing data path.
IMAGESHAPE = [224, 224, 3] 
training_data = 'chest_xray/train'
testing_data = 'chest_xray/test' 
Step 4: Now, we will import our VGG16 model. While importing we will use the weights of the imageNet & include_top=False signifies that we do not want to classify 1000 different categories present in imageNet our problem is all about two categories Pneumonia and Normal that's why we are just dropping the first and last layers then we will just design our own layers and add it into VGG16.
vgg_model = VGG16(input_shape=IMAGESHAPE, weights='imagenet', include_top=False)
Step 5: After importing VGG16 model, we have to make this important change. By using the for loop iterating over all layers and setting the trainable as False, so that all the layers would not be trained.
for each_layer in vgg_model.layers:
    each_layer.trainable = False
Step 6: We will try to see how many classes are present in our train dataset to understand how many output labels we should have.
classes = glob('chest_xray/train/*') 
Step 7: As we deleted the first and the last columns in the previous step, We will just make a flattened layer and finally we just add our last layer with a softmax activation function. len(classes) indicate how many categories we have in our output layer.
flatten_layer = Flatten()(vgg_model.output)
prediction = Dense(len(classes), activation='softmax')(flatten_layer)
Step 8: Now we will combine the VGG output and prediction, this all together will create a model. When we check the model summary we can observe that the last layer have only two categories.
final_model = Model(inputs=vgg_model.input, outputs=prediction) 
final_model.summary()
Output
Step 9: Now we will compile our model using adam optimizer and optimization metric as accuracy.
final_model.compile( 
  loss='categorical_crossentropy',
  optimizer='adam',
  metrics=['accuracy']
)
Step 10: After compiling the model, we have to import our dataset to Keras using ImageDataGenerator in Keras. For creating additional features we use metrics like rescale, shear_range, zoom_range these will help us in the training and testing phases.
from tensorflow.keras.preprocessing.image import ImageDataGenerator
train_datagen = ImageDataGenerator(rescale = 1./255,
								shear_range = 0.2,
								zoom_range = 0.2,
								horizontal_flip = True)
testing_datagen = ImageDataGenerator(rescale =1. / 255)
# This code is modified by Susobhan Akhuli
Step 11: Now we will insert the images using flow_from_directory() function. Make sure that here we have to pass the same image size as we initiated earlier. Batch size 4 indicates that at once 4 images will be given for training. Class_mode is Categorical i.e either Pneumonia or Not Pneumonia.
training_set = train_datagen.flow_from_directory('chest_xray/train', 
                                                 target_size = (224, 224),
                                                 batch_size = 4,
                                                 class_mode = 'categorical')
Step 12: Similarly, we will do the same for the test dataset what we did for the train dataset.
test_set = testing_datagen.flow_from_directory('chest_xray/test',
                                               target_size = (224, 224),
                                               batch_size = 4,
                                               class_mode = 'categorical')
Step 13: Finally, we are fitting the model using fit_generator() function and passing all the necessary details regarding our training and testing dataset as arguments. This will take some time to execute.
fitted_model = final_model.fit(
training_set,
validation_data=test_set,
epochs=5,
steps_per_epoch=len(training_set),
validation_steps=len(test_set)
)
# This code is modified by Susobhan Akhuli
Output
Epoch 1/5 /usr/local/lib/python3.10/dist-packages/keras/src/trainers/data_adapters/py_dataset_adapter.py:122: UserWarning: Your `PyDataset` class should call `super().__init__(**kwargs)` in its constructor. `**kwargs` can include `workers`, `use_multiprocessing`, `max_queue_size`. Do not pass these arguments to `fit()`, as they will be ignored. self._warn_if_super_not_called() 1308/1308 ━━━━━━━━━━━━━━━━━━━━ 3717s 3s/step - accuracy: 0.8830 - loss: 0.4416 - val_accuracy: 0.8542 - val_loss: 0.9806 Epoch 2/5 1308/1308 ━━━━━━━━━━━━━━━━━━━━ 0s 66us/step - accuracy: 0.0000e+00 - loss: 0.0000e+00 Epoch 3/5 /usr/lib/python3.10/contextlib.py:153: UserWarning: Your input ran out of data; interrupting training. Make sure that your dataset or generator can generate at least `steps_per_epoch * epochs` batches. You may need to use the `.repeat()` function when building your dataset. self.gen.throw(typ, value, traceback) 1308/1308 ━━━━━━━━━━━━━━━━━━━━ 3666s 3s/step - accuracy: 0.9452 - loss: 0.2152 - val_accuracy: 0.8846 - val_loss: 0.6164 Epoch 4/5 1308/1308 ━━━━━━━━━━━━━━━━━━━━ 5s 4ms/step - accuracy: 0.0000e+00 - loss: 0.0000e+00 Epoch 5/5 1308/1308 ━━━━━━━━━━━━━━━━━━━━ 3727s 3s/step - accuracy: 0.9532 - loss: 0.2214 - val_accuracy: 0.7628 - val_loss: 1.9244
Step 14: Create a model file and store this model. So that we don't need to train the model every time we gave input.
final_model.save('our_model.h5')
Step 15: Load the model that we created. Now read an image and preprocess the image finally we check what output our model is giving using model.predict() function.
from keras.preprocessing import image
from keras.models import load_model
from keras.applications.vgg16 import preprocess_input
import numpy as np
model=load_model('our_model.h5') #Loading our model
img = image.load_img('/content/chest_xray/test/PNEUMONIA/person100_bacteria_480.jpeg',target_size=(224,224))
imagee=image.img_to_array(img) #Converting the X-Ray into pixels
imagee=np.expand_dims(imagee, axis=0)
img_data=preprocess_input(imagee)
prediction=model.predict(img_data)
if prediction[0][0]>prediction[0][1]: #Printing the prediction of model.
	print('Person is safe.')
else:
	print('Person is affected with Pneumonia.')
print(f'Predictions: {prediction}')
# This code is modified by Susobhan Akhuli
Output
1/1 ━━━━━━━━━━━━━━━━━━━━ 1s 779ms/step Person is affected with Pneumonia. Predictions: [[0. 1.]]
Full Code Execution Output:
You can download the source code and dataset from here:
- Dataset: Pneumonia Detection Dataset
- Source Code: Pneumonia Detection using Deep Learning
