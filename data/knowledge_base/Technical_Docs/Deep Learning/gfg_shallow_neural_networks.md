# Shallow Neural Networks

> Source: https://www.geeksforgeeks.org/deep-learning/shallow-neural-networks/

Neural networks represent the backbone of modern artificial intelligence, helping machines mimic human decision-making processes. While deep neural networks, with their multiple layers, are often in the spotlight for complex tasks, shallow neural networks play a crucial role, especially in scenarios where simpler models are more effective or interpretable.
This article delves into shallow neural networks, exploring their structure, functionality, applications, and how they compare to their deeper counterparts.
What is a Shallow Neural Network?
A shallow neural network refers to a neural network that consists of only one hidden layer between the input and output layers. This structure is simpler compared to deep neural networks that feature multiple hidden layers. Despite their simplicity, shallow networks are powerful tools capable of approximating any function, given sufficient neurons in the hidden layer—a property known as the universal approximation theorem.
Components of a Shallow Neural Network
- Input Layer: This is where the network receives its input data. Each neuron in this layer represents a feature of the input dataset.
- Hidden Layer: The single hidden layer in a shallow network transforms the inputs into something that the output layer can use. The neurons in this layer apply a set of weights to the inputs and pass them through an activation function to introduce non-linearity to the process.
- Output Layer: The final layer produces the output of the network. For regression tasks, this might be a single neuron; for classification, it could be multiple neurons corresponding to the classes.
How Do Shallow Neural Networks Work?
The functionality of shallow neural networks hinges on the transformation of inputs through the hidden layer to produce outputs. Here's a step-by-step breakdown:
- Weighted Sum: Each neuron in the hidden layer calculates a weighted sum of the inputs.
- Activation Function: The weighted sums are passed through an activation function (such as Sigmoid, Tanh, or ReLU) to introduce non-linearity, enabling the network to learn complex patterns.
- Output Generation: The output layer integrates the signals from the hidden layer, often through another set of weights, to produce the final output.
Training Shallow Neural Networks
Training a shallow neural network typically involves:
- Forward Propagation: Calculating the output for a given input by passing it through the layers of the network.
- Loss Calculation: Determining how far the network's output is from the actual desired output using a loss function.
- Backpropagation: Calculating the gradient of the loss function with respect to each weight in the network, which informs how the weights should be adjusted to minimize the loss.
- Weight Update: Adjusting the weights using an optimization algorithm like gradient descent.
Training Shallow Neural Network for Binary Classification
We will use a synthetic dataset generated using sklearn to illustrate how to build and train this network. Let's create a shallow neural network that will classify data points into two categories.
Step 1: Importing Libraries
import numpy as np
from sklearn.datasets import make_moons
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.optimizers import Adam
Step 2: Generating and Preprocessing Data
# Generate synthetic data
X, y = make_moons(n_samples=1000, noise=0.2, random_state=42)
# Split the dataset into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
# Scale the features
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)
Step 3: Building the Shallow Neural Network
# Initialize the model
model = Sequential()
# Add the hidden layer with 10 neurons and ReLU activation function
model.add(Dense(10, input_shape=(2,), activation='relu'))
# Add the output layer with sigmoid activation function for binary classification
model.add(Dense(1, activation='sigmoid'))
# Compile the model
model.compile(optimizer=Adam(learning_rate=0.01), loss='binary_crossentropy', metrics=['accuracy'])
Step 4: Training the Model
# Train the model
history = model.fit(X_train_scaled, y_train, epochs=100, verbose=1, validation_data=(X_test_scaled, y_test))
Step 5: Evaluating the Model
# Evaluate the model on test data
results = model.evaluate(X_test_scaled, y_test)
print(f"Test Loss: {results[0]}, Test Accuracy: {results[1]}")
Complete Code
# Import necessary libraries
import numpy as np
from sklearn.datasets import make_moons
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.optimizers import Adam
# Generate synthetic data
X, y = make_moons(n_samples=1000, noise=0.2, random_state=42)
# Split the dataset into training and test sets
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.3, random_state=42)
# Scale the features
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)
# Initialize the model
model = Sequential()
# Add the hidden layer with 10 neurons and ReLU activation function
model.add(Dense(10, input_shape=(2,), activation='relu'))
# Add the output layer with sigmoid activation function for binary classification
model.add(Dense(1, activation='sigmoid'))
# Compile the model with Adam optimizer, binary cross-entropy loss, and accuracy metric
model.compile(optimizer=Adam(learning_rate=0.01), loss='binary_crossentropy', metrics=['accuracy'])
# Train the model
history = model.fit(X_train_scaled, y_train, epochs=100, verbose=1, validation_data=(X_test_scaled, y_test))
# Evaluate the model on test data
results = model.evaluate(X_test_scaled, y_test)
print(f"Test Loss: {results[0]}, Test Accuracy: {results[1]}")
Output:
Epoch 1/100
22/22 ━━━━━━━━━━━━━━━━━━━━ 5s 32ms/step - accuracy: 0.7090 - loss: 0.6329 - val_accuracy: 0.8567 - val_loss: 0.4021
Epoch 2/100
22/22 ━━━━━━━━━━━━━━━━━━━━ 0s 16ms/step - accuracy: 0.8171 - loss: 0.3935 - val_accuracy: 0.8700 - val_loss: 0.2982
Epoch 3/100
22/22 ━━━━━━━━━━━━━━━━━━━━ 0s 17ms/step - accuracy: 0.8608 - loss: 0.3103 - val_accuracy: 0.8733 - val_loss: 0.2787
. . .
Epoch 98/100
22/22 ━━━━━━━━━━━━━━━━━━━━ 0s 4ms/step - accuracy: 0.9775 - loss: 0.0639 - val_accuracy: 0.9733 - val_loss: 0.0602
Epoch 99/100
22/22 ━━━━━━━━━━━━━━━━━━━━ 0s 4ms/step - accuracy: 0.9651 - loss: 0.0840 - val_accuracy: 0.9700 - val_loss: 0.0588
Epoch 100/100
22/22 ━━━━━━━━━━━━━━━━━━━━ 0s 3ms/step - accuracy: 0.9740 - loss: 0.0646 - val_accuracy: 0.9733 - val_loss: 0.0623
10/10 ━━━━━━━━━━━━━━━━━━━━ 0s 2ms/step - accuracy: 0.9842 - loss: 0.0445
Test Loss: 0.06233325973153114, Test Accuracy: 0.9733333587646484
Comparing Shallow Neural Networks and Deep Neural Networks
| Feature | Shallow Neural Networks | Deep Neural Networks | 
|---|---|---|
| Number of Layers | Typically one hidden layer | Multiple hidden layers | 
| Handling Complexity | Good for simple or linearly separable problems | Excellent at handling complex, non-linear patterns; can model high-level abstractions | 
| Hierarchical Feature Learning | Limited capability due to fewer layers | Can learn multiple levels of feature abstractions due to depth | 
| Typical Applications | Linear regression, simple binary classification, baseline models | Image and speech recognition, natural language processing, complex predictive analytics | 
| Feature Interactions | Simpler interactions due to fewer layers | More complex feature interactions possible across layers | 
| Performance on High-Dimensional Data | Generally less effective unless data is simple or limited in dimensionality | Highly effective, can manage and extract value from large and high-dimensional datasets | 
| Use in Industry | Often used for quick, simple tasks or where computational efficiency is required | Dominates in sectors requiring detailed analysis and predictions from complex data, like healthcare and autonomous tech | 
Advantages of Shallow Neural Networks
- Simplicity: Easier to set up and train, requiring less computational resources than deep neural networks.
- Speed: Faster training times due to fewer parameters and computational complexity.
- Less Prone to Overfitting: With fewer layers and weights, they can generalize better to new data, provided they are adequately trained.
- Good for Small Datasets: Effective in situations where the volume of data is limited, and deep networks might overfit.
Limitations of Shallow Neural Networks
- Limited Complexity: May not capture complex patterns as effectively as deeper networks, particularly in large or high-dimensional datasets.
- Less Flexibility: Often outperformed by deep networks in tasks involving high levels of abstraction, such as image and speech recognition.
Applications of Shallow Neural Networks
Shallow neural networks are particularly useful in scenarios where simplicity and speed are more critical than capturing complex relationships. They are commonly used in:
- Binary Classification Tasks: Simple decision boundaries can be effectively learned by shallow networks.
- Baseline Models: Quick initial assessments for machine learning tasks can be efficiently provided by shallow networks.
- Small-scale Regression: Modeling relationships in small or medium-sized datasets where deep networks might overfit.
Conclusion
Shallow neural networks, while not as flashy as their deeper counterparts, remain a valuable tool in the machine learning toolbox. Their simplicity can be an asset in many scenarios, offering quicker training times and reduced computational demands. As deep learning continues to evolve, the foundational principles learned from shallow neural networks will undoubtedly continue to inform and shape the field. Understanding and utilizing these networks can provide a clear path to grasping more complex machine learning methodologies, making them an essential topic for students and professionals alike.
