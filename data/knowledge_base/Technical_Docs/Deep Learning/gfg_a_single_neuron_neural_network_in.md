# A single neuron neural network in Python

> Source: https://www.geeksforgeeks.org/deep-learning/single-neuron-neural-network-python/

A single neuron neural network is the simplest form of an artificial neural network, consisting of just one processing unit that takes multiple inputs, applies weights, passes the result through an activation function and produces an output.
- Works as the foundation of larger neural networks.
- Uses weights to determine the importance of each input.
- Employs an activation function (here, tanh) to map input to output.
- Training involves minimizing error using backpropagation and weight adjustments.
- Serves as an educational tool to understand how neural networks learn.
Implementation
We will build a single neuron neural network in Python using NumPy.
Step 1: Import Libraries and perform Reproducibility
- NumPy is used for vectorized math operations.
- seed(1) ensures random values (like weights) are the same across runs.
import numpy as np
np.random.seed(1)
Step 2: Class and Weight Initialization
- Initializes a weight vector (3x1) for three inputs.
- Random values are scaled to the range [-1, 1].
class NeuralNetwork:
    def __init__(self):
        self.weight_matrix = 2 * np.random.random((3, 1)) - 1
Step 3: Activation Function and Derivative
- tanh squashes values between -1 and 1.
- Its derivative (1 - a²) is used in backpropagation to adjust weights.
def tanh(self, x):
        return np.tanh(x)
    def tanh_derivative(self, a):
        return 1.0 - a ** 2
Step 4: Forward Propagation
- Multiplies inputs with weights -> applies tanh -> produces output.
- Works with both single inputs (1,3) and batches (m,3).
def forward_propagation(self, inputs):
    inputs = np.atleast_2d(inputs)
    return self.tanh(np.dot(inputs, self.weight_matrix))
Step 5: Training the Neuron
- Forward pass: Compute prediction.
- Error: Difference between predicted and expected outputs.
- Delta: Error scaled by derivative (gradient).
- Adjustment: Average gradient across all samples.
- Update: Adjust weights using learning rate.
def train(self, train_inputs, train_outputs, num_train_iterations,
          learning_rate=0.1, verbose=False):
    m = train_inputs.shape[0]
    for iteration in range(num_train_iterations):
        output = self.forward_propagation(train_inputs)
        error = train_outputs - output
        delta = error * self.tanh_derivative(output)
        adjustment = np.dot(train_inputs.T, delta) / m
        self.weight_matrix += learning_rate * adjustment
        if verbose and (iteration % max(1, num_train_iterations // 10) == 0):
            loss = np.mean(error ** 2)
            print(f"Iter {iteration:6d}  loss={loss:.6f}")
Step 6: Driver Code
We will run our system,
if __name__ == "__main__":
    nn = NeuralNetwork()
    print("Initial weights:\n", nn.weight_matrix)
    X = np.array([[0, 0, 1],
                  [1, 1, 1],
                  [1, 0, 1],
                  [0, 1, 1]])
    y = np.array([[0, 1, 1, 0]]).T
    nn.train(X, y, num_train_iterations=10000, learning_rate=0.1, verbose=True)
    print("\nTrained weights:\n", nn.weight_matrix)
    print("\nTest [1, 0, 0] ->", nn.forward_propagation(np.array([1, 0, 0])))
Output:
Applications
- Linear classification: Distinguish between two linearly separable classes.
- Regression tasks: Simple function approximation when the relationship is nearly linear.
- Feature weighting: Analyze importance of inputs via trained weights.
- Educational tool: Introduce neural network fundamentals (forward/backward propagation).
- Baseline model: Used as a sanity check before building complex networks.
Advantages
- Simple and interpretable: Easy to understand weight contributions.
- Fast training: Minimal computation required.
- Foundation for deeper models: Shows how backpropagation and learning work.
- Lightweight: Requires very little memory and processing power.
Limitations
- Cannot solve non-linear problems (like XOR): needs multiple neurons/layers.
- No regularization by default (risk of overfitting on small data).
- Saturating activation (tanh) can cause vanishing gradients in larger models.
- Learning rate sensitivity: too high causes divergence, too low slows training.
