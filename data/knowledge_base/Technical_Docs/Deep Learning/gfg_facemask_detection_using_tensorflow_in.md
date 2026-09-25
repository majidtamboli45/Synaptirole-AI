# FaceMask Detection using TensorFlow in Python

> Source: https://www.geeksforgeeks.org/deep-learning/facemask-detection-using-tensorflow-in-python/

In this article, we’ll discuss our two-phase COVID-19 face mask detector, detailing how our computer vision/deep learning pipeline will be implemented.
We’ll use this Python script to train a face mask detector and review the results. Given the trained COVID-19 face mask detector, we’ll proceed to implement two more additional Python scripts used to:
- Detect COVID-19 face masks in images
- Detect face masks in real-time video streams
Flow Chart of FaceMask Detection System
In order to train a custom face mask detector, we need to break our project into two distinct phases, each with its own respective sub-steps (as shown by Figure 1 above):
- Training: Here we’ll focus on loading our face mask detection dataset from disk, training a model (using Keras/TensorFlow) on this dataset, and then serializing the face mask detector to disk
- Deployment: Once the face mask detector is trained, we can then move on to loading the mask detector, performing face detection, and then classifying each face as with_mask or without_mask.
We will use these images to build a CNN model using TensorFlow to detect if you are wearing a face mask by using the webcam of your PC. Additionally, you can also use your phone’s camera to do the same!
Stepwise Implementation
Step 1: Data Visualization
In the first step, let us visualize the total number of images in our dataset in both categories. We can see that there are 690 images in the ‘yes’ class and 686 images in the ‘no’ class.
The number of images with facemask labelled 'yes': 690 
The number of images with facemask labelled 'no': 686
Step 2: Data Augmentation
In the next step, we augment our dataset to include more number of images for our training. In this step of data augmentation, we rotate and flip each of the images in our dataset. We see that, after data augmentation, we have a total of 2751 images with 1380 images in the ‘yes’ class and ‘1371’ images in the ‘no’ class.
Number of examples: 2751 
Percentage of positive examples: 50.163576881134134%, number of pos examples: 1380 
Percentage of negative examples: 49.836423118865866%, number of neg examples: 1371
Step 3: Splitting the data
In this step, we split our data into the training set which will contain the images on which the CNN model will be trained and the test set with the images on which our model will be tested. In this, we take split_size =0.8, which means that 80% of the total images will go to the training set and the remaining 20% of the images will go to the test set.
The number of images with facemask in the training set labelled 'yes': 1104
The number of images with facemask in the test set labelled 'yes': 276
The number of images without facemask in the training set labelled 'no': 1096
The number of images without facemask in the test set labelled 'no': 275
After splitting, we see that the desired percentage of images has been distributed to both the training set and the test set as mentioned above.
Step 4: Building the Model
In the next step, we build our Sequential CNN model with various layers such as Conv2D, MaxPooling2D, Flatten, Dropout and Dense. In the last Dense layer, we use the ‘softmax’ function to output a vector that gives the probability of each of the two classes.
model = tf.keras.models.Sequential([
    tf.keras.layers.Conv2D(100, (3, 3), activation='relu',
                           input_shape=(150, 150, 3)),
    tf.keras.layers.MaxPooling2D(2, 2),
    tf.keras.layers.Conv2D(100, (3, 3), activation='relu'),
    tf.keras.layers.MaxPooling2D(2, 2),
    tf.keras.layers.Flatten(),
    tf.keras.layers.Dropout(0.5),
    tf.keras.layers.Dense(50, activation='relu'),
    tf.keras.layers.Dense(2, activation='softmax')
])
model.compile(optimizer='adam', loss='binary_crossentropy', metrics=['acc'])
Here, we use the ‘adam’ optimizer and ‘binary_crossentropy’ as our loss function as there are only two classes. Additionally, you can even use the MobileNetV2 for better accuracy.
Step 5: Pre-Training the CNN model
After building our model, let us create the ‘train_generator’ and ‘validation_generator’ to fit them to our model in the next step. We see that there are a total of 2200 images in the training set and 551 images in the test set.
Found 2200 images belonging to 2 classes. 
Found 551 images belonging to 2 classes.
Step 6: Training the CNN model
This step is the main step where we fit our images in the training set and the test set to our Sequential model we built using keras library. I have trained the model for 30 epochs (iterations). However, we can train for more number of epochs to attain higher accuracy test there occurs over-fitting.
history = model.fit_generator(train_generator,
                             epochs=30,
                             validation_data=validation_generator,
                             callbacks=[checkpoint])
>>Epoch 30/30
220/220 [==============================] - 231s 1s/step - loss: 0.0368 - acc: 0.9886 - val_loss: 0.1072 - val_acc: 0.9619
We see that after the 30th epoch, our model has an accuracy of 98.86% with the training set and an accuracy of 96.19% with the test set. This implies that it is well trained without any over-fitting.
Step 7: Labeling the Information
After building the model, we label two probabilities for our results. [‘0’ as ‘without_mask’ and ‘1’ as ‘with_mask’]. I am also setting the boundary rectangle color using the RGB values.[‘RED’ for ‘without_mask’ and ‘GREEN’ for ‘with_mask]
labels_dict={0:'without_mask',1:'with_mask'} 
color_dict={0:(0,0,255),1:(0,255,0)}
Step 8: Importing the Face detection Program
After this, we intend to use it to detect if we are wearing a face mask using our PC’s webcam. For this, first, we need to implement face detection. In this, we are using the Haar Feature-based Cascade Classifiers to detect the facial features.
face_clsfr=cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
This cascade classifier is designed by OpenCV to detect the frontal face by training thousands of images. The .xml file for the same needs to be downloaded and used in detecting the face. We have uploaded the file to the GitHub repository.
Step 9: Detecting the Faces with and without Masks
In the last step, we use the OpenCV library to run an infinite loop to use our web camera in which we detect the face using the Cascade Classifier. The code webcam = cv2.VideoCapture(0) denotes the usage of webcam.
The model will predict the possibility of each of the two classes ([without_mask, with_mask]). Based on the higher probability, the label will be chosen and displayed around our faces.
main.py
# import the necessary packages
from tensorflow.keras.applications.mobilenet_v2 import preprocess_input
from tensorflow.keras.preprocessing.image import img_to_array
from tensorflow.keras.models import load_model
from imutils.video import VideoStream
import numpy as np
import imutils
import time
import cv2
import os
def detect_and_predict_mask(frame, faceNet, maskNet):
  
    # grab the dimensions of the frame and 
    # then construct a blob from it
    (h, w) = frame.shape[:2]
    blob = cv2.dnn.blobFromImage(frame, 1.0, (224, 224),
                                 (104.0, 177.0, 123.0))
    # pass the blob through the network 
    # and obtain the face detections
    faceNet.setInput(blob)
    detections = faceNet.forward()
    print(detections.shape)
    # initialize our list of faces, their
    # corresponding locations, and the list
    # of predictions from our face mask network
    faces = []
    locs = []
    preds = []
    # loop over the detections
    for i in range(0, detections.shape[2]):
      
        # extract the confidence (i.e.,
        # probability) associated with
        # the detection
        confidence = detections[0, 0, i, 2]
        # filter out weak detections by 
        # ensuring the confidence is
        # greater than the minimum confidence
        if confidence > 0.5:
          
            # compute the (x, y)-coordinates
            # of the bounding box for
            # the object
            box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
            (startX, startY, endX, endY) = box.astype("int")
            # ensure the bounding boxes fall 
            # within the dimensions of
            # the frame
            (startX, startY) = (max(0, startX), max(0, startY))
            (endX, endY) = (min(w - 1, endX), min(h - 1, endY))
            # extract the face ROI, convert it
            # from BGR to RGB channel
            # ordering, resize it to 224x224, 
            # and preprocess it
            face = frame[startY:endY, startX:endX]
            face = cv2.cvtColor(face, cv2.COLOR_BGR2RGB)
            face = cv2.resize(face, (224, 224))
            face = img_to_array(face)
            face = preprocess_input(face)
            # add the face and bounding boxes 
            # to their respective lists
            faces.append(face)
            locs.append((startX, startY, endX, endY))
    # only make a predictions if at least one
    # face was detected
    if len(faces) > 0:
      
        # for faster inference we'll make 
        # batch predictions on *all*
        # faces at the same time rather 
        # than one-by-one predictions
        # in the above `for` loop
        faces = np.array(faces, dtype="float32")
        preds = maskNet.predict(faces, batch_size=32)
    # return a 2-tuple of the face locations
    # and their corresponding locations
    return (locs, preds)
# load our serialized face detector model from disk
prototxtPath = r"face_detector\deploy.prototxt"
weightsPath = r"face_detector\res10_300x300_ssd_iter_140000.caffemodel"
faceNet = cv2.dnn.readNet(prototxtPath, weightsPath)
# load the face mask detector model from disk
maskNet = load_model("mask_detector.model")
# initialize the video stream
print("[INFO] starting video stream...")
vs = VideoStream(src=0).start()
# loop over the frames from the video stream
while True:
    # grab the frame from the threaded 
    # video stream and resize it
    # to have a maximum width of 400 pixels
    frame = vs.read()
    frame = imutils.resize(frame, width=400)
    # detect faces in the frame and 
    # determine if they are wearing a
    # face mask or not
    (locs, preds) = detect_and_predict_mask(frame, faceNet, maskNet)
    # loop over the detected face 
    # locations and their corresponding
    # locations
    for (box, pred) in zip(locs, preds):
      
        # unpack the bounding box and predictions
        (startX, startY, endX, endY) = box
        (mask, withoutMask) = pred
        # determine the class label and 
        # color we'll use to draw
        # the bounding box and text
        label = "Mask" if mask > withoutMask else "No Mask"
        color = (0, 255, 0) if label == "Mask" else (0, 0, 255)
        # include the probability in the label
        label = "{}: {:.2f}%".format(label, max(mask, withoutMask) * 100)
        # display the label and bounding box 
        # rectangle on the output frame
        cv2.putText(frame, label, (startX, startY - 10),
                    cv2.FONT_HERSHEY_SIMPLEX, 0.45, color, 2)
        cv2.rectangle(frame, (startX, startY), (endX, endY), color, 2)
    # show the output frame
    cv2.imshow("Frame", frame)
    key = cv2.waitKey(1) & 0xFF
    # if the `q` key was pressed, break from the loop
    if key == ord("q"):
        break
# do a bit of cleanup
cv2.destroyAllWindows()
vs.stop()
Output:
