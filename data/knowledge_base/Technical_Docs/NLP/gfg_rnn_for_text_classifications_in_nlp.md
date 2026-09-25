# RNN for Text Classifications in NLP

> Source: https://www.geeksforgeeks.org/nlp/rnn-for-text-classifications-in-nlp/

Recurrent Neural Networks (RNNs) are neural networks designed to process sequential data such as text. They remember information from previous words, making them effective for text classification tasks.
- Learns contextual relationships between words.
- Processes text of varying lengths.
- Suitable for tasks such as sentiment analysis, spam detection, and topic classification.
Use of RNNs for Text Classification
Recurrent Neural Networks (RNNs) are designed to capture the dependencies and context within sequential data which makes them ideal for language-related tasks. They can remember information from previous inputs which helps them understand the context of words. RNNs are especially good for these tasks because they:
- Capture Context: They remember what happened before, helping us understand how the meaning of one word relates to the words around it.
- Handle Sequential Data: Since text is sequential, they are a natural fit for processing it.
- Work with Variable-Length Inputs: Text data comes in different lengths and they can process sequences of any size.
Implementing
Let's see the steps required to implement an RNN model for sentiment analysis using the IMDB movie review dataset.
1. Importing Required Libraries
We need to import necessary libraries such as TensorFlow for model building, NumPy for handling numerical operations and Matplotlib for visualizations.
import tensorflow as tf
import tensorflow_datasets as tfds
import numpy as np
import matplotlib.pyplot as plt
2. Loading the IMDB Dataset
The IMDB dataset contains movie reviews, labeled as positive or negative. We load the dataset and separate it into training and testing datasets. Batching the data into smaller chunks improves efficiency during training.
dataset = tfds.load('imdb_reviews', as_supervised=True)
train_dataset, test_dataset = dataset['train'], dataset['test']
batch_size = 32
train_dataset = train_dataset.shuffle(10000)
train_dataset = train_dataset.batch(batch_size)
test_dataset = test_dataset.batch(batch_size)
3. Printing Sample Review and Label
We print a sample review and its corresponding label (0 for negative, 1 for positive) to understand the structure of the dataset.
example, label = next(iter(train_dataset))
print('Text:\n', example.numpy()[0])
print('\nLabel: ', label.numpy()[0])
Output:
4. Text Vectorization
To convert the text into a numerical form, we use TensorFlow's text vectorization layer which tokenizes the text and converts each word into a sequence of integers. This prepares the text data for the neural network. We can also see in the example below how we can encode and decode the sample review into a vector of integers.
encoder = tf.keras.layers.TextVectorization(max_tokens=10000)
encoder.adapt(train_dataset.map(lambda text, _: text))
vocabulary = np.array(encoder.get_vocabulary())
original_text = example.numpy()[0]
encoded_text = encoder(original_text).numpy()
decoded_text = ' '.join(vocabulary[encoded_text])
print('original: ', original_text)
print('encoded: ', encoded_text)
print('decoded: ', decoded_text)
Output:
5. Building the Model
We define the architecture of the RNN. This consists of the following layers:
- TextVectorization Layer: Converts text into tokenized integers.
- Embedding Layer: Converts tokens into dense vector representations.
- Bidirectional LSTM Layers: Processes the sequence in both forward and backward directions.
- Dense Layers: For final classification into positive or negative sentiment.
model = tf.keras.Sequential([
    tf.keras.layers.InputLayer(input_shape=(1,), dtype=tf.string), 
    encoder, 
    tf.keras.layers.Embedding(len(encoder.get_vocabulary()), 64, mask_zero=True),  
    tf.keras.layers.Bidirectional(tf.keras.layers.LSTM(64, return_sequences=True)), 
    tf.keras.layers.Bidirectional(tf.keras.layers.LSTM(32)), 
    tf.keras.layers.Dense(64, activation='relu'),  
    tf.keras.layers.Dense(1)  
])
model.summary()
Output:
6. Compiling the Model
Now, we compile the model. The binary cross-entropy loss function is used since this is a binary classification task (positive or negative sentiment). We also specify the Adam optimizer and track accuracy as the evaluation metric.
model.compile(
    loss=tf.keras.losses.BinaryCrossentropy(from_logits=True),  
    optimizer=tf.keras.optimizers.Adam(),  
    metrics=['accuracy'] 
)
7. Training the Model
Next, we train the model using the training dataset for 5 epochs and validate it on the test dataset to evaluate its performance on unseen data.
history = model.fit(
    train_dataset, 
    epochs=5,
    validation_data=test_dataset,
)
Output:
8. Visualizing the Results
To visualize the performance of the model, we plot the training and validation accuracy and loss across epochs.
history_dict = history.history
acc = history_dict['accuracy']
val_acc = history_dict['val_accuracy']
loss = history_dict['loss']
val_loss = history_dict['val_loss']
plt.figure(figsize=(8, 4))
plt.subplot(1, 2, 1)
plt.plot(acc)
plt.plot(val_acc)
plt.title('Training and Validation Accuracy')
plt.xlabel('Epochs')
plt.ylabel('Accuracy')
plt.legend(['Accuracy', 'Validation Accuracy'])
plt.subplot(1, 2, 2)
plt.plot(loss)
plt.plot(val_loss)
plt.title('Training and Validation Loss')
plt.xlabel('Epochs')
plt.ylabel('Loss')
plt.legend(['Loss', 'Validation Loss'])
plt.show()
Output:
Here we visualized the training and validation accuracy as well as the training and validation loss over epochs. It extracts accuracy and loss values from the training history (history_dict). Here the left subplot displays accuracy trends and the right subplot shows loss trends over epochs.
9. Testing the Trained Model
Finally, we test the trained model with a random movie review. The model predicts whether the review is positive or negative based on its learned patterns.
sample_text = (
    '''The movie by GeeksforGeeks was so good and the animation are so dope. 
    I would recommend my friends to watch it.'''
)
sample_text_tensor = tf.constant([sample_text], dtype=tf.string)
predictions = model.predict(sample_text_tensor)
print("Prediction probability:", predictions[0])
if predictions[0] > 0.5:
    print('The review is positive')
else:
    print('The review is negative')
Output:
Here for the sample text the review is Positive which is true so we can say that our model is working fine.
Advantages
- Captures relationships between words by considering their order and context.
- Effectively processes sequential text where the order of words is important.
- Handles text sequences of varying lengths without requiring a fixed input size.
Disadvantages
- May struggle to learn long-term dependencies due to the vanishing gradient problem.
- Processes text sequentially, resulting in slower training than parallel models.
- Performance can be affected by changes in the order of words within a sentence.
