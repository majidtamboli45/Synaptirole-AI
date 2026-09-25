# Vanishing and Exploding Gradients Problems in Deep Learning

> Source: https://www.geeksforgeeks.org/deep-learning/vanishing-and-exploding-gradients-problems-in-deep-learning/

Vanishing and exploding gradients are common problems in deep neural networks that occur during backpropagation. They make training difficult by causing gradients to become extremely small or excessively large.
- Vanishing gradients slow or stop learning in earlier layers
- Exploding gradients cause unstable and very large weight updates
- Both problems affect convergence and model performance
- Commonly seen in very deep neural networks and RNNs
Vanishing Gradient Problem
Vanishing gradients occur when gradients become extremely small during backpropagation, causing earlier layers to learn very slowly or stop learning completely.
- Common in deep neural networks and RNNs
- Earlier layers receive very small updates
- Slows down or prevents effective learning
- Often caused by repeated multiplication of small gradient values
\frac{\partial L}{\partial w_i} = \frac{\partial L}{\partial a_n} \cdot \frac{\partial a_n}{\partial a_{n-1}} \cdot \frac{\partial a_{n-1}}{\partial a_{n-2}} \cdots \frac{\partial a_1}{\partial w_i} 
where
- L : Loss function.
- w_i : Weight parameter in the layer.
- a_n : Activation output of layer.
- \frac{\partial L}{\partial w_i} : Gradient of loss with respect to weight.
Exploding Gradient Problem
Exploding gradients occur when gradients grow too large during backpropagation, leading to unstable weight updates and divergence in loss. When derivatives or weights are greater than 1, their repeated multiplication across layers leads to exponential growth.
\prod_{i=1}^{n} \frac{\partial a_i}{\partial a_{i-1}} \longrightarrow \infty 
The gradient update rule in gradient descent is:
w_{t+1} = w_t - \eta \cdot \frac{\partial L}{\partial w_t} 
where
- w_i : Current weight value at time stept .
- \eta : Learning rate.
- \frac{\partial L}{\partial w_t} Gradient of loss with respect to weight.
- w_{t+1} : Updated weight after applying gradient descent.
If 
Causes of Vanishing and Exploding Gradients
Several factors can cause gradients to become too small or too large during backpropagation.
- Activation functions like Sigmoid and Tanh produce small derivatives, shrinking gradients
- Improper weight initialization can cause gradients to vanish or explode
- Deep networks repeatedly multiply gradients, increasing instability
- High learning rates or unscaled inputs can lead to exploding gradients
Techniques to Fix Vanishing and Exploding Gradients
Vanishing and exploding gradients make training deep neural networks difficult. The following methods help stabilize gradient flow and improve learning
1. Proper Weight Initialization
Choosing the right weight initialization keeps gradients balanced during backpropagation.
- Xavier Initialization: Keeps activation variance consistent across layers to stabilize gradients.
- Kaiming Initialization: Scales weights for ReLU to preserve signal strength and prevent gradient decay.
2. Use Non Saturating Activation Functions
Sigmoid and Tanh can shrink gradients. Using ReLU or its variants prevents vanishing gradients:
- ReLU: Basic rectified linear unit.
- Leaky ReLU: Allows small gradients for negative inputs.
- ELU / SELU: Helps maintain self normalizing properties.
3. Apply Batch Normalization
Normalizes layer inputs to have zero mean and unit variance, stabilizing gradients and accelerating convergence.
4. Gradient Clipping
Limits gradients to a maximum threshold to prevent them from exploding and destabilizing training.
Implementation
Here we compare how gradients behave in deep neural networks using Sigmoid and ReLU activations to visualize the vanishing gradient problem through loss curves.
Step 1 : Import Required Libraries
- numpy: For numerical and array operations.
- matplotlib: For plotting graphs and visualizations.
- Sequential: Builds neural networks layer by layer.
- train_test_split: split data into training and testing sets
- tensorflow: build and train deep neural networks
import numpy as np
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense
from tensorflow.keras.optimizers import Adam
Step 2: Create a Simple Dataset
- Generates a binary classification dataset
- Keeps the data simple to isolate gradient behavior
- Prevents data complexity from hiding gradient issues
np.random.seed(42)
X = np.random.randn(2000, 2)
y = (X[:, 0] + X[:, 1] > 0).astype(int)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
Step 3: Define a Deep Neural Network
- Uses many layers to amplify vanishing gradient effects
- Accepts an activation function as input
- Keeps architecture identical for fair comparison
def build_model(activation, layers=20):
    model = Sequential()
    model.add(tf.keras.Input(shape=(2,)))
    model.add(Dense(32, activation=activation))
    for _ in range(layers - 1):
        model.add(Dense(32, activation=activation))
    model.add(Dense(1, activation='sigmoid'))
    model.compile(
        optimizer=Adam(learning_rate=0.001),
        loss='binary_crossentropy'
    )
    return model
Step 4: Train Model with Sigmoid Activation
- Sigmoid has small derivatives
- Gradients shrink as they move backward
- Early layers learn very slowly
sigmoid_model = build_model('sigmoid', layers=20)
sigmoid_history = sigmoid_model.fit(
    X_train, y_train,
    epochs=100,
    batch_size=32,
    verbose=0
)
Step 5: Train Model with ReLU Activation
- ReLU is non-saturating
- Preserves gradient magnitude
- Enables faster and more stable learning
relu_model = build_model('relu', layers=20)
relu_history = relu_model.fit(
    X_train, y_train,
    epochs=100,
    batch_size=32,
    verbose=0
)
Step 6: Plot Training Loss Curves
- Loss curves act as an indirect indicator of gradient flow
- Slow or flat loss vanishing gradients
- Rapid loss decrease healthy gradients
plt.figure(figsize=(8,5))
plt.plot(sigmoid_history.history['loss'], label='Sigmoid Activation')
plt.plot(relu_history.history['loss'], label='ReLU Activation')
plt.xlabel('Epochs')
plt.ylabel('Binary Crossentropy Loss')
plt.title('Vanishing Gradient Effect')
plt.legend()
plt.grid(True)
plt.show()
Output:
You can download full code file from here.
Effects of Vanishing and Exploding Gradients in RNNs
Recurrent Neural Networks (RNNs) process sequences step by step, using past outputs as inputs for future steps which makes them particularly sensitive to gradient issues during training.
- Causes loss of long-term memory, making earlier information difficult to retain
- Large gradients can lead to unstable training and divergence
- Reduces ability to learn long-range sequential dependencies
- Makes optimization highly sensitive to learning rate and initialization
- Advanced architectures like LSTM and GRU help stabilize gradients using gating mechanisms
- Techniques such as gradient clipping, proper initialization and normalization improve training stability
Challenges
Vanishing and exploding gradients create several difficulties during neural network training.
- Vanishing gradients cause very slow or stopped learning in earlier layers
- Exploding gradients lead to unstable updates and diverging loss
- Long-term dependencies become difficult to learn in sequence models
- Training may converge poorly or fail completely
- Requires careful tuning of learning rates and weight initialization
