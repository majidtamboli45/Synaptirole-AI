# Layers in Artificial Neural Networks (ANN)

> Source: https://www.geeksforgeeks.org/deep-learning/layers-in-artificial-neural-networks-ann/

In an Artificial Neural Network, data flows from the input layer to the output layer through one or more hidden layers. Each layer contains neurons that process information and pass it forward, allowing the network to learn patterns and make predictions.
- Consists of three main layers: input layer, hidden layers, and output layer
- Each layer is made up of interconnected neurons (nodes)
- Input layer receives data, hidden layers transform it and output layer produces the final result
- Layers work together to extract features and make predictions
Layers in ANN
1. Input Layer
The input layer is the first layer in an artificial neural network and is responsible for receiving raw input data. Each neuron represents a feature of the data and simply passes this information to the next layer without performing any computation.
- Receives raw input data
- Each neuron corresponds to a feature in the dataset
- Does not perform calculations, only forwards data
- Example: In an image, each neuron can represent a pixel value
2. Hidden Layers
Hidden layers are the intermediate layers between the input and output layers where most of the computation happens. They transform input data into more meaningful representations to help the network learn complex patterns.
- Located between input and output layers
- Perform the main computations in the network
- Apply weights and biases to input data
- Use activation functions to introduce non-linearity
- Number and size depend on the complexity of the task
3. Output Layer
The output layer is the final layer of an artificial neural network that produces the model’s predictions. The number of neurons depends on the type of problem and the required output.
- Produces the final output or prediction
- Number of neurons depends on classes (classification) or outputs (regression)
- Uses different activation functions based on the task
- Softmax for multi-class classification
- Sigmoid for binary classification
- Linear for regression
Types of Hidden Layers in Artificial Neural Networks
Hidden layers can be of different types, each designed to perform specific computations and improve learning.
1. Dense (Fully Connected) Layer
Dense (Fully Connected) Layer is the most common hidden layer where each neuron is connected to every neuron in the previous layer. It performs a weighted sum of inputs followed by an activation function to learn complex patterns.
- Every neuron is connected to all neurons in the previous layer
- Performs weighted sum of inputs and applies activation function
- Activation functions like ReLU, Sigmoid or Tanh introduce non-linearity
- Learns important representations from input data
2. Convolutional Layer
Convolutional layers is used in neural networks, especially CNNs, to process image and spatial data by capturing important patterns and features.
- Applies convolution operations using filters (kernels)
- Scans input data to create feature maps
- Captures spatial features like edges, textures and shapes
- Reduces parameters compared to fully connected layers
- Widely used in image and vision-related tasks
3. Recurrent Layer
Recurrent layers is used in neural networks to handle sequential data by maintaining information across time steps, making it suitable for tasks involving context and order.
- Designed for sequence data like time series and text
- Uses feedback connections to retain past information
- Maintains an internal state across time steps
- Captures temporal dependencies in data
- Commonly used in tasks like NLP and speech processing
4. Dropout Layer
Dropout layers is used as a regularization technique to reduce overfitting by randomly deactivating some neurons during training, encouraging the network to learn more robust features.
- Helps prevent overfitting
- Randomly drops neurons during training
- Each neuron is kept with a probability p
- Reduces dependency on specific neurons
- Improves generalization of the model
5. Pooling Layer
Pooling Layer is used to reduce the spatial dimensions of data, making computation faster and helping control overfitting in neural networks.
- Reduces size of feature maps (dimensionality reduction)
- Decreases computational cost
- Helps prevent overfitting
- Common types include Max Pooling and Average Pooling
- Widely used in CNNs for image processing tasks
6. Batch Normalization Layer
A Batch Normalization Layer normalizes the outputs of a previous layer using the batch mean and standard deviation, helping improve training stability and speed.
- Normalizes activations to maintain stable distributions
- Speeds up training and improves convergence
- Reduces internal covariate shift
- Can reduce the need for heavy regularization
- Commonly used in deep neural networks for better performance
