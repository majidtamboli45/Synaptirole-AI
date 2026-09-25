# Forward Propagation in Neural Networks

> Source: https://www.geeksforgeeks.org/deep-learning/forward-propagation-in-neural-networks/

Forward propagation is the process where input data passes through each layer of a neural network to produce an output. It transforms raw inputs into predictions using weights, biases and activation functions.
- Data flows from input layer to output layer step by step
- Each neuron computes weighted sums and applies activation functions
- Used during both training and inference (without updating weights)
- Determines how well the model captures patterns for accurate predictions
Working
1. Input Layer: Receives raw data where each feature corresponds to a neuron. Data is often normalized or standardized before processing.
2. Hidden Layers: The processed input passes through one or more hidden layers where most of the computation takes place. Each neuron performs a weighted sum of inputs and applies an activation function to capture non-linear patterns. The computation inside each neuron follows
Z = W × X + b 
where:
- W represents the weights
- X is the input vector
- b is the bias term
After this, an activation function such as ReLU or sigmoid is applied to produce the neuron’s output, which is then passed forward.
3. Output Layer: The final layer generates the model’s prediction. The choice of activation function depends on the task
- Softmax : multi-class classification
- Sigmoid : binary classification
- Linear : regression
4. Prediction: The network produces its final output using current weights and biases, which is then evaluated against the true value.
- Generates final prediction from the output layer
- Compared with actual value using a loss function
- Loss function calculates the error
- Error is passed to backpropagation for weight updates
Mathematical Explanation of Forward Propagation
Consider a neural network with one input layer, two hidden layers and one output layer.
1. Layer 1 (First Hidden Layer)
The transformation is:
A^{[1]} = \sigma(W^{[1]}X + b^{[1]}) 
where:
- W^{[1]} is the weight matrix,
- X is the input vector,
- b^{[1]} is the bias vector,
- \sigma is the activation function.
2. Layer 2 (Second Hidden Layer)
We can have n number of hidden layers:
A^{[n]} = \sigma(W^{[n]}A^{[n-1]} + b^{[n]}) 
3. Output Layer
 
A^{[3]} = \sigma(\sigma(\sigma(X W^{[1]} + b^{[1]}) W^{[2]} + b^{[2]}) W^{[3]} + b^{[3]}) 
This equation illustrates how data flows through the network:
- Weights (W ) determine the importance of each input
- Biases (b ) adjust activation thresholds
- Activation functions (\sigma ) introduce non-linearity to enable complex decision boundaries.
Implementation
1. Import Required Libraries
Here we will import Numpy and pandas library.
import numpy as np
import pandas as pd
2. Create Sample Dataset
- The dataset consists of CGPA, profile score and salary in LPA.
- X contains only input features.
data = {'cgpa': [8.5, 9.2, 7.8], 'profile_score': [85, 92, 78], 'lpa': [10, 12, 8]}
df = pd.DataFrame(data)
X = df[['cgpa', 'profile_score']].values
3. Initialize Parameters
When initilaizing parameters Random initialization avoids symmetry issues where neurons learn the same function.
def initialize_parameters():
    np.random.seed(1)
    W = np.random.randn(2, 1) * 0.01
    b = np.zeros((1, 1))
    return W, b
4. Define Forward Propagation
- Z=WX+B computes the linear transformation.
- Sigmoid activation ensures values remain between 0 and 1.
def forward_propagation(X, W, b):
    Z = np.dot(X, W) + b
    A = 1 / (1 + np.exp(-Z))  
    return A
5. Execute Forward Propagation
Here we will execute the process of forward propagation using the above functions we created.
W, b = initialize_parameters()
A = forward_propagation(X, W, b)
print("Final Output:", A)
Output:
Final Output: 
[[0.40566303] 
 [0.39810287] 
 [0.41326819]]
- Each number represents the model's predicted probability before training for the given input.
- The values represent the sigmoid activation output which ranges between 0 and 1 indicating a probability like score for classification.
Download full code from here
