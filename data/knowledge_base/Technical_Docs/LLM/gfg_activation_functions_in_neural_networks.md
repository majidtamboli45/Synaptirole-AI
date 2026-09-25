# Activation Functions in Neural Networks

> Source: https://www.geeksforgeeks.org/machine-learning/activation-functions-neural-networks/

An activation function is applied to the weighted sum of inputs before producing the final output of a neuron. It introduces non-linearity, allowing the network to learn complex patterns.
- Applied after the weighted sum of inputs
- Introduces non-linearity into the model
- Enables learning of complex data patterns
- Without it, the network behaves like a linear model
Importance of Non-Linearity
- Real-world data is rarely linearly separable.
- Non-linear functions allow neural networks to form curved decision boundaries, making them capable of handling complex patterns (e.g., classifying apples vs. bananas under varying colors and shapes).
- They ensure networks can model advanced problems like image recognition, NLP and speech processing.
Mathematical Example
Consider a neural network with:
- Inputs: i1, i2
- Hidden layer: neurons h1 and h2
- Output layer: one neuron (output)
- Weights: w1, w2, w3, w4, w5, w6
- Biases: b1 for hidden layer, b2 for output layer
Each circle represents a neuron (node) and a group of neurons forms a layer.
The hidden layer outputs are:
The output before activation is:
\text{output} = h_1.w_5 + h_2.w_6 + \text{bias} 
Without activation, these are linear equations.
To introduce non-linearity, we apply a sigmoid activation:
\text{final output} = \sigma(h_1.w_5 + h_2.w_6 + \text{bias}) 
This gives the final output of the network after applying the sigmoid activation function in output layers, introducing the desired non-linearity.
Types of Activation Functions in Deep Learning
1. Linear Activation Function
Linear Activation Function resembles straight line define by y=x. No matter how many layers the neural network contains if they all use linear activation functions the output is a linear combination of the input.
- The range of the output spans from (-\infty \text{ to } + \infty) .
- Output is a linear combination of inputs
- Using it in all layers makes the network behave like a linear model
- Limits the ability to learn complex patterns
- Commonly used in the output layer for regression tasks
- Often combined with non-linear functions in hidden layers for better learning
2. Non-Linear Activation Functions
1. Sigmoid Function
Sigmoid Activation Function is characterized by 'S' shape. It is mathematically defined as
- It allows neural networks to handle and model complex patterns that linear equations cannot.
- The output ranges between 0 and 1, hence useful for binary classification.
- The function exhibits a steep gradient when x values are between -2 and 2. This sensitivity means that small changes in input x can cause significant changes in output y which is critical during the training process.
2. Tanh Activation Function
Tanh function (hyperbolic tangent function) is a shifted version of the sigmoid, allowing it to stretch across the y-axis. It is defined as:
- Outputs values from -1 to +1.
- Enables modeling of complex data patterns.
- Commonly used in hidden layers due to its zero-centered output, facilitating easier learning for subsequent layers.
3. ReLU(Rectified Linear Unit)Function
ReLU activation is defined by 
- Value Range is[0, \infty) , meaning the function only outputs non-negative values.
- Introduces non-linearity, enabling learning of complex patterns
- Computationally efficient due to simple operations
- Activates only positive neurons, making the network sparse and efficient
- Commonly used in hidden layers for faster training and better performance
4. Leaky ReLU
- Leaky ReLU is similar to ReLU but allows a small negative slope (\alpha , e.g., 0.01) instead of zero.
- Solves the “dying ReLU” problem, where neurons get stuck with zero outputs.
- Range: (-\infty, \infty) .
- Preferred in some cases for better gradient flow.
5. SoftPlus Function
Softplus function is defined mathematically as: 
- The Softplus function is non-linear.
- The function outputs values in the range (0, \infty) , similar to ReLU, but without the hard zero threshold that ReLU has.
- Softplus is a smooth, continuous function, meaning it avoids the sharp discontinuities of ReLU which can sometimes lead to problems during optimization.
3. Exponential Linear Units
1. ELU (Exponential Linear Unit) Function
ELU (Exponential Linear Unit) is a non-linear activation function that improves learning speed and helps reduce the vanishing gradient problem. It behaves like ReLU for positive inputs but allows smooth negative values.
- Output range is (−α,∞)(-\alpha, \infty)(−α,∞)
- Introduces non-linearity for learning complex patterns
- Allows negative outputs, helping maintain zero-centered activations
- Smooth and differentiable, supporting stable training
2. SELU (Scaled Exponential Linear Unit) Function
SELU is a scaled version of ELU designed for self-normalizing neural networks, helping maintain stable activations during training.
where λ ≈ 1.05 (scaling factor) and α ≈ 1.67
- Output range is(-\lambda\alpha,\infty)
- Maintains near zero mean and unit variance (self-normalizing)
- Helps prevent vanishing and exploding gradients
- Works well in deep fully connected networks
- Can reduce the need for batch normalization in some cases
4. Output Layer Activation Functions
1. Sigmoid Activation Function
Sigmoid function produces an S-shaped curve and maps input values into a probability-like range between 0 and 1 and is used to find the final output of the neural network for binary classification problems. It is defined as:
- Output range is (0,1)
- Produces probability-like outputs
- Commonly used in the output layer for binary classification
- Smooth and differentiable, useful for gradient-based learning
2. Softmax Function
Softmax function is used for multi-class classification and converts raw output scores into probabilities for each class.
- Transforms outputs into values between 0 and 1
- Ensures all probabilities sum to 1
- Highlights the most likely class among multiple options
- Commonly used in the output layer for multi-class classification
- Helps interpret model outputs as probabilities
Impact of Activation Functions on Model Performance
Activation functions play a key role in how efficiently a neural network learns and performs across different tasks.
- ReLU helps in faster training by avoiding the vanishing gradient problem, while Sigmoid and Tanh can slow down convergence in deep networks
- ReLU maintains better gradient flow, allowing deeper layers to learn effectively, whereas Sigmoid may produce very small gradients
- Softmax enables handling of multi-class classification problems, while functions like ReLU or Leaky ReLU are commonly used in hidden layers for efficient learning
