# Build a Deep Learning based Medical Diagnoser

> Source: https://www.geeksforgeeks.org/deep-learning/build-a-deep-learning-based-medical-diagnoser/

Imagine getting the disease predictions and medication prescriptions in seconds with the help of artificial intelligence (AI). This dream can become a reality with the power of deep learning. Deep learning is a type of artificial intelligence that can learn on its own by analyzing vast amounts of data.
In the field of medicine, Deep Learning can be used to train models to predict diseases and recommend medications based on a patient's symptoms.
This article will explore how Deep Learning can be used to build a medical diagnosis model.
Deep Learning has already shown remarkable success in many industries by helping us to automate the processes. Now let's try to use this technology in the field of medicine. We will build a deep learning model that will be trained on Patient's Problems which will be textual data, then our model will give the predicted Disease and will recommend Medicine to treat the patient's problem as an output.
This is clearly an application of Recurrent Neural Network (RNN). This is because we need a model that will store the information from the previous text and use it later to predict the output. Hence, we will use the Long Short-Term Memory (LSTM) algorithm with Tensorflow to train our model.
Long Short-Term Memory (LSTM) Networks
When dealing with textual data, such as patient symptoms, a specific type of deep learning architecture called a Long Short-Term Memory (LSTM) network is often used. LSTM networks are well-suited for tasks involving sequences of data, as they can learn long-term dependencies between elements in the sequence.
For example, consider a patient describing their symptoms as " I've experienced a loss of appetite and don't enjoy food anymore, followed by fatigue and muscle weakness." An LSTM network can understand the importance of the order of these symptoms ("loss of appetite" followed by "fatigue and muscle weakness") to make an accurate diagnosis.
Implementation: Medical Diagnosis with LSTM
Building a deep learning model for medical diagnosis requires a large dataset of labeled medical data. The dataset used in this tutorial includes:
- Patient Symptoms: Textual descriptions of the patient's symptoms.
- Diagnoses: The confirmed diseases for each patient.
- Medications: The prescribed medications for each patient's condition.
The deep learning model is built using TensorFlow, a popular open-source library for machine learning. The model architecture utilizes an LSTM layer to process the sequence of tokens representing the patient's symptoms. The output of the LSTM layer is then fed into two separate dense layers, one for predicting the disease and another for predicting the medication.
Importing Libraries
First, we will import all the necessary libraries for handling data. 'Tokenizer' from tensorflow will be used for text tokenization, 'pad_sequences' will be used for sequence padding. 'to_categorical' will be used for converting labels to binary class matrices, and 'LabelEncoder' from scikit-learn will be used for encoding text labels as integers.
import pandas as pd
import numpy as np
from tensorflow.keras.preprocessing.text import Tokenizer
from tensorflow.keras.preprocessing.sequence import pad_sequences
from tensorflow.keras.utils import to_categorical
from sklearn.preprocessing import LabelEncoder
from tensorflow.keras.models import Model
from tensorflow.keras.layers import Input, Embedding, LSTM, Dense
Loading the Dataset
data = pd.read_csv('https://raw.githubusercontent.com/adil200/Medical-Diagnoser/main/medical_data.csv')
data.head()
Output:
    Patient_Problem    Disease    Prescription
0 Constant fatigue and muscle weakness, struggli... Chronic Fatigue Syndrome Cognitive behavioral therapy, graded exercise ...
1 Frequent severe migraines, sensitivity to ligh... Migraine with Aura Prescription triptans, avoid triggers like bri...
2 Sudden weight gain and feeling cold, especiall... Hypothyroidism Levothyroxine to regulate thyroid hormone levels.
3 High fever, sore throat, and swollen lymph nod... Mononucleosis Rest and hydration, ibuprofen for pain.
4 Excessive thirst and frequent urination, dry m... Diabetes Mellitus Insulin therapy and lifestyle changes.
Data Preprocessing and Preparation
Before using medical data in a deep learning model, it needs to be preprocessed to ensure the model can understand it. Preprocessing steps often include:
- Text Tokenization: Converting textual data into sequences of numbers that the model can process.
- Padding Sequences: Making all sequences the same length by adding padding characters at the beginning or end of shorter sequences.
- Label Encoding: Converting categorical variables, such as disease names and medication names, into numerical labels.
Tokenizing and Sequencing Text Data
tokenizer = Tokenizer(num_words=5000, oov_token="<OOV>")
tokenizer.fit_on_texts(data['Patient_Problem'])
sequences = tokenizer.texts_to_sequences(data['Patient_Problem'])
A 'tokenizer' variable is created to convert the textual data into sequences of integers. It only considers the top 5,000 words in the dataset in order to reduce the complexity. If the model encounters any out-of-vocabulary words during the training process then it will be replaced with the '<OOV>' token.
Padding Sequences
In order to make the input sequences have the same length, the code finds the longest sequence and pads all other sequences with zeros at the end ('post' padding) to match this sentence.
max_length = max(len(x) for x in sequences)
padded_sequences = pad_sequences(sequences, maxlen=max_length, padding='post')
Encoding the Labels and Converting them to Categorical
We will encode the 'Disease' and 'Prescription' columns as integers. Then the integer-encoded labels are converted into binary class matrices.
# Encoding the labels
label_encoder_disease = LabelEncoder()
label_encoder_prescription = LabelEncoder()
disease_labels = label_encoder_disease.fit_transform(data['Disease'])
prescription_labels = label_encoder_prescription.fit_transform(data['Prescription'])
# Converting labels to categorical
disease_labels_categorical = to_categorical(disease_labels)
prescription_labels_categorical = to_categorical(prescription_labels)
Combining Labels into a Multi-label Target Variable
Finally, now we will stack the binary class matrices together to form a single multi-label target variable 'Y'. This allows the model to predict both 'Disease' and 'Prescription' from the patient's problem.
Y = np.hstack((disease_labels_categorical, prescription_labels_categorical))
Model Building
Now, we will build the model using the LSTM and Sequential algorithm from TensorFlow. This model will learn from our preprocessed dataset to predict diseases based on patient symptoms.
Defining Model Architecture
We will use the 'Model' and 'Input' to define the model architecture, and 'Embedding' to convert the integer sequences into dense vectors of fixed size. We will use 'Dense' for output layers that make predictions.
input_layer = Input(shape=(max_length,))
embedding = Embedding(input_dim=5000, output_dim=64)(input_layer)
lstm_layer = LSTM(64)(embedding)
disease_output = Dense(len(label_encoder_disease.classes_), activation='softmax', 
name='disease_output')(lstm_layer)
prescription_output = Dense(len(label_encoder_prescription.classes_), 
activation='softmax', name='prescription_output')(lstm_layer)
The model firstly have, an input layer that can handle sequences up to a certain length. Then there's an embedding layer that turns the numbers into vectors. After that, there's an LSTM layer that looks at the order of things, and finally, two dense layers that predict diseases and prescriptions using a softmax function for classification.
Compiling the model
model = Model(inputs=input_layer, outputs=[disease_output, prescription_output])
model.compile(
    loss={'disease_output': 'categorical_crossentropy', 
    'prescription_output': 'categorical_crossentropy'},
    optimizer='adam',
    metrics={'disease_output': ['accuracy'], 'prescription_output': ['accuracy']}
)
model.summary()
Output:
Model: "model"
__________________________________________________________________________________________________
Layer (type) Output Shape Param # Connected to
==================================================================================================
input_1 (InputLayer) [(None, 17)] 0 []
embedding (Embedding) (None, 17, 64) 320000 ['input_1[0][0]']
lstm (LSTM) (None, 64) 33024 ['embedding[0][0]']
disease_output (Dense) (None, 178) 11570 ['lstm[0][0]']
prescription_output (Dense (None, 388) 25220 ['lstm[0][0]']
)
==================================================================================================
Total params: 389814 (1.49 MB)
Trainable params: 389814 (1.49 MB)
Non-trainable params: 0 (0.00 Byte)
Training the model
model.fit(padded_sequences, {'disease_output': disease_labels_categorical, 'prescription_output':
      prescription_labels_categorical}, epochs=100, batch_size=32)
Output:
Epoch 1/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 4s 16ms/step - disease_output_accuracy: 0.0169 - loss: 11.1439 - prescription_output_accuracy: 0.0000e+00
Epoch 2/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 1s 18ms/step - disease_output_accuracy: 0.0328 - loss: 11.1217 - prescription_output_accuracy: 9.6315e-04
Epoch 3/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.0390 - loss: 11.0659 - prescription_output_accuracy: 0.0062
Epoch 4/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.0394 - loss: 10.9113 - prescription_output_accuracy: 0.0127
Epoch 5/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.0267 - loss: 10.8870 - prescription_output_accuracy: 0.0129
Epoch 6/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.0488 - loss: 10.6987 - prescription_output_accuracy: 0.0157
Epoch 7/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 20ms/step - disease_output_accuracy: 0.0545 - loss: 10.5998 - prescription_output_accuracy: 0.0198
Epoch 8/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.0547 - loss: 10.4252 - prescription_output_accuracy: 0.0140
Epoch 9/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.0447 - loss: 10.1998 - prescription_output_accuracy: 0.0218
Epoch 10/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.0510 - loss: 9.9972 - prescription_output_accuracy: 0.0244
Epoch 11/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.0642 - loss: 9.9596 - prescription_output_accuracy: 0.0108
Epoch 12/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.0657 - loss: 9.7060 - prescription_output_accuracy: 0.0216
Epoch 13/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 20ms/step - disease_output_accuracy: 0.0950 - loss: 9.4994 - prescription_output_accuracy: 0.0337
Epoch 14/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 20ms/step - disease_output_accuracy: 0.0736 - loss: 9.3619 - prescription_output_accuracy: 0.0319
Epoch 15/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.1212 - loss: 9.1634 - prescription_output_accuracy: 0.0256
Epoch 16/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.1134 - loss: 8.9788 - prescription_output_accuracy: 0.0382
Epoch 17/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.1726 - loss: 8.7072 - prescription_output_accuracy: 0.0389
Epoch 18/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.1612 - loss: 8.5948 - prescription_output_accuracy: 0.0426
Epoch 19/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.1462 - loss: 8.4305 - prescription_output_accuracy: 0.0591
Epoch 20/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 14ms/step - disease_output_accuracy: 0.1654 - loss: 8.2718 - prescription_output_accuracy: 0.0543
Epoch 21/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.1520 - loss: 8.1102 - prescription_output_accuracy: 0.0641
Epoch 22/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.1666 - loss: 7.8406 - prescription_output_accuracy: 0.0803
Epoch 23/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.2102 - loss: 7.8073 - prescription_output_accuracy: 0.0673
Epoch 24/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.1897 - loss: 7.7105 - prescription_output_accuracy: 0.0643
Epoch 25/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 32ms/step - disease_output_accuracy: 0.2143 - loss: 7.4825 - prescription_output_accuracy: 0.1228
Epoch 26/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 1s 25ms/step - disease_output_accuracy: 0.2050 - loss: 7.4104 - prescription_output_accuracy: 0.0743
Epoch 27/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 1s 23ms/step - disease_output_accuracy: 0.2047 - loss: 7.2648 - prescription_output_accuracy: 0.1039
Epoch 28/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 1s 30ms/step - disease_output_accuracy: 0.2623 - loss: 7.0158 - prescription_output_accuracy: 0.1286
Epoch 29/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 1s 26ms/step - disease_output_accuracy: 0.2295 - loss: 7.0629 - prescription_output_accuracy: 0.1121
Epoch 30/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.2369 - loss: 6.8870 - prescription_output_accuracy: 0.1284
Epoch 31/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.2527 - loss: 6.9511 - prescription_output_accuracy: 0.0866
Epoch 32/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.2524 - loss: 6.9966 - prescription_output_accuracy: 0.0792
Epoch 33/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 22ms/step - disease_output_accuracy: 0.2389 - loss: 6.9723 - prescription_output_accuracy: 0.1038
Epoch 34/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.2334 - loss: 6.8079 - prescription_output_accuracy: 0.1314
Epoch 35/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.2769 - loss: 6.6426 - prescription_output_accuracy: 0.1426
Epoch 36/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.3090 - loss: 6.4967 - prescription_output_accuracy: 0.1233
Epoch 37/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 20ms/step - disease_output_accuracy: 0.3381 - loss: 6.3587 - prescription_output_accuracy: 0.1636
Epoch 38/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.3133 - loss: 6.3493 - prescription_output_accuracy: 0.1202
Epoch 39/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.3509 - loss: 6.1761 - prescription_output_accuracy: 0.2130
Epoch 40/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.3480 - loss: 6.0895 - prescription_output_accuracy: 0.1509
Epoch 41/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.3166 - loss: 6.1104 - prescription_output_accuracy: 0.1897
Epoch 42/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.3671 - loss: 5.9962 - prescription_output_accuracy: 0.1662
Epoch 43/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.3790 - loss: 5.9013 - prescription_output_accuracy: 0.2095
Epoch 44/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 21ms/step - disease_output_accuracy: 0.3464 - loss: 5.8207 - prescription_output_accuracy: 0.1925
Epoch 45/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 1s 18ms/step - disease_output_accuracy: 0.3833 - loss: 5.7969 - prescription_output_accuracy: 0.2169
Epoch 46/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.3898 - loss: 5.7397 - prescription_output_accuracy: 0.2518
Epoch 47/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 21ms/step - disease_output_accuracy: 0.3588 - loss: 5.7032 - prescription_output_accuracy: 0.2455
Epoch 48/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.4086 - loss: 5.6786 - prescription_output_accuracy: 0.2623
Epoch 49/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.3751 - loss: 5.5839 - prescription_output_accuracy: 0.2350
Epoch 50/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 24ms/step - disease_output_accuracy: 0.3788 - loss: 5.5476 - prescription_output_accuracy: 0.2419
Epoch 51/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 1s 17ms/step - disease_output_accuracy: 0.3873 - loss: 5.5021 - prescription_output_accuracy: 0.2593
Epoch 52/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.3926 - loss: 5.4432 - prescription_output_accuracy: 0.2741
Epoch 53/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.4062 - loss: 5.4243 - prescription_output_accuracy: 0.2419
Epoch 54/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.3726 - loss: 5.4812 - prescription_output_accuracy: 0.2326
Epoch 55/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.4155 - loss: 5.4757 - prescription_output_accuracy: 0.2056
Epoch 56/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.3574 - loss: 5.5398 - prescription_output_accuracy: 0.2220
Epoch 57/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.3774 - loss: 5.4526 - prescription_output_accuracy: 0.2400
Epoch 58/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.3545 - loss: 5.4810 - prescription_output_accuracy: 0.2070
Epoch 59/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.3998 - loss: 5.4105 - prescription_output_accuracy: 0.2723
Epoch 60/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.3675 - loss: 5.4822 - prescription_output_accuracy: 0.2203
Epoch 61/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.3871 - loss: 5.3228 - prescription_output_accuracy: 0.2061
Epoch 62/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 23ms/step - disease_output_accuracy: 0.4284 - loss: 5.2232 - prescription_output_accuracy: 0.2408
Epoch 63/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 1s 28ms/step - disease_output_accuracy: 0.4099 - loss: 5.2078 - prescription_output_accuracy: 0.2614
Epoch 64/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 28ms/step - disease_output_accuracy: 0.4335 - loss: 5.0646 - prescription_output_accuracy: 0.2926
Epoch 65/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 29ms/step - disease_output_accuracy: 0.4768 - loss: 4.9195 - prescription_output_accuracy: 0.3000
Epoch 66/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 30ms/step - disease_output_accuracy: 0.4674 - loss: 4.8225 - prescription_output_accuracy: 0.2740
Epoch 67/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 30ms/step - disease_output_accuracy: 0.4962 - loss: 4.7486 - prescription_output_accuracy: 0.3581
Epoch 68/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 28ms/step - disease_output_accuracy: 0.4879 - loss: 4.7440 - prescription_output_accuracy: 0.3459
Epoch 69/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 34ms/step - disease_output_accuracy: 0.4477 - loss: 4.7548 - prescription_output_accuracy: 0.3209
Epoch 70/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.5074 - loss: 4.6481 - prescription_output_accuracy: 0.3581
Epoch 71/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.5423 - loss: 4.5574 - prescription_output_accuracy: 0.3697
Epoch 72/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.5277 - loss: 4.4967 - prescription_output_accuracy: 0.3878
Epoch 73/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 14ms/step - disease_output_accuracy: 0.5203 - loss: 4.5209 - prescription_output_accuracy: 0.3974
Epoch 74/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.5177 - loss: 4.4607 - prescription_output_accuracy: 0.3984
Epoch 75/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.5852 - loss: 4.3962 - prescription_output_accuracy: 0.4016
Epoch 76/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.5893 - loss: 4.3392 - prescription_output_accuracy: 0.4112
Epoch 77/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.5292 - loss: 4.3762 - prescription_output_accuracy: 0.3921
Epoch 78/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.6244 - loss: 4.2463 - prescription_output_accuracy: 0.4211
Epoch 79/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.5820 - loss: 4.2640 - prescription_output_accuracy: 0.4267
Epoch 80/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.5821 - loss: 4.3311 - prescription_output_accuracy: 0.3850
Epoch 81/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.5580 - loss: 4.3382 - prescription_output_accuracy: 0.4069
Epoch 82/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.6028 - loss: 4.1515 - prescription_output_accuracy: 0.4155
Epoch 83/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.5816 - loss: 4.2686 - prescription_output_accuracy: 0.3947
Epoch 84/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.5776 - loss: 4.3082 - prescription_output_accuracy: 0.3610
Epoch 85/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.5071 - loss: 4.4120 - prescription_output_accuracy: 0.3510
Epoch 86/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 18ms/step - disease_output_accuracy: 0.5474 - loss: 4.3219 - prescription_output_accuracy: 0.3606
Epoch 87/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.5321 - loss: 4.3172 - prescription_output_accuracy: 0.3811
Epoch 88/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.5784 - loss: 4.2209 - prescription_output_accuracy: 0.3612
Epoch 89/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.5827 - loss: 4.1577 - prescription_output_accuracy: 0.3952
Epoch 90/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.5748 - loss: 4.1415 - prescription_output_accuracy: 0.4185
Epoch 91/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.5709 - loss: 4.1667 - prescription_output_accuracy: 0.3940
Epoch 92/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 14ms/step - disease_output_accuracy: 0.5664 - loss: 4.1296 - prescription_output_accuracy: 0.4211
Epoch 93/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - disease_output_accuracy: 0.5743 - loss: 3.9836 - prescription_output_accuracy: 0.4481
Epoch 94/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 14ms/step - disease_output_accuracy: 0.5750 - loss: 4.0402 - prescription_output_accuracy: 0.3970
Epoch 95/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.5955 - loss: 3.9254 - prescription_output_accuracy: 0.4377
Epoch 96/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - disease_output_accuracy: 0.6021 - loss: 3.8867 - prescription_output_accuracy: 0.4857
Epoch 97/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 14ms/step - disease_output_accuracy: 0.5774 - loss: 3.9449 - prescription_output_accuracy: 0.4230
Epoch 98/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 14ms/step - disease_output_accuracy: 0.6033 - loss: 3.8135 - prescription_output_accuracy: 0.3966
Epoch 99/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 15ms/step - disease_output_accuracy: 0.5550 - loss: 4.0198 - prescription_output_accuracy: 0.3578
Epoch 100/100
13/13 ━━━━━━━━━━━━━━━━━━━━ 0s 19ms/step - disease_output_accuracy: 0.5820 - loss: 3.8840 - prescription_output_accuracy: 0.4336
<keras.src.callbacks.history.History at 0x7b79ffe83a00>
Making Predictions
The model is used to make predictions for new patients:
- Pre-processed the patient's symptoms by performing tokenization and padding.
- Feed the pre-processed data into the trained model.
- The model predicts the disease and medication based on the patient's symptoms.
- The predicted disease and medication will be presented.
def make_prediction(patient_problem):
    # Preprocessing the input
    sequence = tokenizer.texts_to_sequences([patient_problem])
    padded_sequence = pad_sequences(sequence, maxlen=max_length, padding='post')
    
    # Making prediction
    prediction = model.predict(padded_sequence)
    
    # Decoding the prediction
    disease_index = np.argmax(prediction[0], axis=1)[0]
    prescription_index = np.argmax(prediction[1], axis=1)[0]
    
    disease_predicted = label_encoder_disease.inverse_transform([disease_index])[0]
    prescription_predicted = label_encoder_prescription.inverse_transform([prescription_index])[0]
    
    print(f"Predicted Disease: {disease_predicted}")
    print(f"Suggested Prescription: {prescription_predicted}")
patient_input = "I've experienced a loss of appetite and don't enjoy food anymore."
make_prediction(patient_input)
Output:
1/1 [==============================] - 0s 443ms/step
Predicted Disease: Depression
Suggested Prescription: Antidepressants; eating nutrient-rich foods.
Get the complete notebook and dataset link here:
Notebook link : click here.
Dataset Link: click here
Conclusion
Adding deep learning to medical diagnostics is a game-changer in healthcare.The model is trained on the preprocessed dataset, iteratively adjusting its internal parameters to improve its accuracy in predicting diseases and medications based on patient symptoms.
In addition, these fancy models can find new patterns in big datasets, which could help us better understand tricky medical conditions. The future looks bright as we use AI to bring together technology and human knowledge for the benefit of patient health and medical research.
