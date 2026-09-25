# What is Fully Connected Layer in Deep Learning

> Source: https://www.geeksforgeeks.org/deep-learning/what-is-fully-connected-layer-in-deep-learning/

Fully Connected (FC) layers, also called dense layers, are neural network layers where each neuron is connected to every neuron in the previous layer.
- Every neuron is fully connected to neurons in adjacent layers
- Commonly used in deep learning and neural networks
- In CNNs, FC layers follow convolution and pooling layers
- Convert extracted feature maps into final predictions or output classes
- Serve as core building blocks in feedforward neural networks
Structure of Fully Connected Layers
The structure of a fully connected layer is based on complete connectivity, where every neuron in one layer is connected to every neuron in the next layer.
- Each neuron connects to all neurons in the subsequent layer
- Enables information flow across the entire network
- Uses weights and biases to learn patterns from data
- Helps transform extracted features into predictions
Key Components of Fully Connected Layers
Fully connected layers consist of several important components that help the network learn and make predictions.
- Neurons: Receive inputs from all neurons in the previous layer and send outputs forward
- Weights: Represent the strength of connections between neurons
- Biases: Adjust the weighted sum to improve learning flexibility
- Activation Functions: Functions like ReLU, Sigmoid or Tanh introduce non linearity for learning complex patterns
Working of Fully Connected Layers
Fully connected layers process and combine features from previous layers to make predictions and recognize complex patterns.
Key Operations in Fully Connected Layers
1. Input Processing
Each neuron receives inputs from all neurons of the previous layer. A weighted sum and bias are calculated as:
z_j = \sum_i (w_{ij}.x_i) +b_j 
- w_{ij} :weight between neurons
- x_i : input value
- b_j : bias term
2. Activation
The weighted sum is passed through an activation function such as ReLU, Sigmoid or Tanh
a_j = f(z_j) 
f denotes the activation function transforming the linear combination of inputs into a non-linear output.
Importance of Fully Connected Layers in Neural Networks
Fully connected (FC) layers play a major role in combining learned features and generating final predictions in neural networks.
- Feature Integration and Abstraction: Combines features extracted by earlier layers to capture complex patterns and relationships.
- Decision Making and Output Generation: Converts learned features into final outputs or class probabilities, often using Softmax for classification.
- Introduction of Non-Linearity: Uses activation functions like ReLU, Sigmoid or Tanh to learn complex non-linear patterns.
- Universal Approximation: With enough neurons, FC layers can approximate complex continuous functions.
- Flexibility across Domains: Used in various applications such as computer vision, speech processing and NLP.
- Regularization and Overfitting Control: Techniques like Dropout and L2 regularization help improve generalization and reduce overfitting.
Advantages
- Combines features effectively for complex pattern recognition
- Flexible and can be used in different network architectures
- Can process various types of reshaped input data
- Simple to implement and widely supported in deep learning frameworks
Limitations
- High number of parameters increases computation and memory usage
- Prone to overfitting, especially on small datasets
- Less effective for spatial data since they do not preserve spatial relationships like convolutional layers
