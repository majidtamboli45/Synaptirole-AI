# SELU Activation Function in Neural Network

> Source: https://www.geeksforgeeks.org/deep-learning/selu-activation-function-in-neural-network/

SELU (Scaled Exponential Linear Unit) is an activation function designed to help neural networks train more effectively by keeping the output of each layer automatically normalized. Unlike simpler functions like ReLU, it not only introduces non-linearity but also helps to stabilize the learning process.
What sets SELU apart is its ability to self-normalize. This means that as data flows through the network, the activations tend to stay close to a mean of zero and a standard deviation of one and is ideal for conditions for training deep networks efficiently. This property reduces the need for techniques like batch normalization. The SELU function behaves differently for positive and negative inputs:
f(x) =\begin{cases}\lambda x & \text{if } x > 0 \\\lambda \alpha (e^x - 1) & \text{if } x \leq 0\end{cases} 
In this equation:
- x is the input to the neuron
- α ≈ 1.67326 controls the curve for negative inputs
- λ ≈ 1.0507 scales the output to maintain self-normalization
For positive values it works like a scaled linear function. For negative values it smoothly curves downward similar to ELU but with the added scaling factor. This combination helps prevent neurons from becoming inactive and improves the overall flow of information through the network.
SELU works best when used with dense neural networks and when inputs are properly standardized. It’s also recommended to pair SELU with the LeCun normal initializer and use alpha dropout instead of regular dropout to preserve its self-normalizing effect during training. If we plot the graph of SELU activation function, it will appear like this:
Why is SELU Popular?
- Self-Normalizing Activations: SELU has the unique ability to keep the activations of each layer close to a mean of zero and a variance of one. This helps the model stay stable during training without needing extra normalization techniques.
- Faster Training: By maintaining a consistent scale of activations throughout the network, SELU speeds up convergence. This allows models to learn patterns more efficiently with fewer training epochs.
- No Need for Batch Normalization: Unlike other activation functions, SELU often eliminates the need for batch normalization layers, making the network architecture simpler and faster to compute.
- Better Gradient Flow: SELU helps prevent the vanishing and exploding gradient problems, which are common in deep networks. This improves the flow of gradients during backpropagation, leading to better learning.
- Keeps Neurons Active: Thanks to its smooth curve for negative inputs, SELU avoids the “dying neuron” problem seen in ReLU, where some neurons stop updating. This keeps more parts of the network contributing during training.
Drawbacks of SELU
- Needs Careful Initialization: It requires the network’s weights to be initialized correctly and the inputs to be standardized. Without this its self-normalizing effect won’t work well, and training can become unstable.
- Best Suited for Specific Network Types: This activation works mainly with fully connected (dense) layers. It may not perform as well in convolutional or recurrent networks without extra adjustments.
- Special Dropout Required: Regular dropout disrupts SELU’s normalization benefits. To keep its advantages, alpha dropout must be used instead, which can complicate the model design.
- More Computation Needed: Because SELU involves exponential calculations for negative inputs it can be slightly slower to compute compared to simpler functions like ReLU.
