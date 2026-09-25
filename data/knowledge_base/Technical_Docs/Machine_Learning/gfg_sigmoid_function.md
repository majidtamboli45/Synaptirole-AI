# Sigmoid Function

> Source: https://www.geeksforgeeks.org/machine-learning/derivative-of-the-sigmoid-function/

Sigmoid is a mathematical function that maps any real-valued number into a value between 0 and 1. Its characteristic "S"-shaped curve makes it particularly useful in scenarios where we need to convert outputs into probabilities. This function is often called the logistic function.
Mathematically, sigmoid is represented as:
where,
- x is the input value,
- e is Euler's number (\approx 2.718 )
Sigmoid function is used as an activation function in machine learning and neural networks for modeling binary classification problems, smoothing outputs, and introducing non-linearity into models.
In this graph, the x-axis represents the input values that ranges from 
In machine learning, 
x could be a weighted sum of inputs in a neural network neuron or a raw score in logistic regression. If the output value is close to 1, it indicates high confidence in one class and if the value is close to 0, it indicates high confidence in the other class.
Properties of the Sigmoid Function
The sigmoid function has several key properties that make it a popular choice in machine learning and neural networks:
- Domain: The domain of the sigmoid function is all real numbers. This means that you can input any real number into the sigmoid function, and it will produce a valid output.
- Asymptotes: As x approaches positive infinity,σ(x) approaches 1. Conversely, asx approaches negative infinity,σ(x) approaches 0. This property ensures that the function never actually reaches 0 or 1, but gets arbitrarily close.
- Monotonicity: The sigmoid function is monotonically increasing, meaning that as the input increases, the output also increases.
- Differentiability: The sigmoid function is differentiable, which allows for the calculation of gradients during the training of machine learning models.
Sigmoid Function in Backpropagation
If we use a linear activation function in a neural network, the model will only be able to separate data linearly, which results in poor performance on non-linear datasets. However, by adding a hidden layer with a sigmoid activation function, the model gains the ability to handle non-linearity, thereby improving performance.
During the backpropagation, the model calculates and updates weights and biases by computing the derivative of the activation function. The sigmoid function is useful because:
- It is the only function that appears in its derivative.
- It is differentiable at every point, which helps in the effective computation of gradients during backpropagation.
Derivative of Sigmoid Function
The derivative of the sigmoid function, denoted as 
Let's see how the derivative of sigmoid function is computed.
We know that, sigmoid function is defined as:
Define:
Rewriting the sigmoid function:
Differentiating 
Differentiating 
Using the chain rule:
Since 
Since:
Rewriting:
Substituting:
Final Result
The above equation is known as the generalized form of the derivation of the sigmoid function. The below image shows the derivative of the sigmoid function graphically.
Issue with Sigmoid Function in Backpropagation
One key issue with using the sigmoid function is the vanishing gradient problem. When updating weights and biases using gradient descent, if the gradients are too small, the updates to weights and biases become insignificant, slowing down or even stopping learning.
The shades red region highlights the areas where the derivative
