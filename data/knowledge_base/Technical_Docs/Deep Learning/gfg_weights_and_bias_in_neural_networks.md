# Weights and Bias in Neural Networks

> Source: https://www.geeksforgeeks.org/deep-learning/the-role-of-weights-and-bias-in-neural-networks/

Neural networks learn from data by identifying patterns, and weights and biases are the key components that control how they learn and make predictions.
- Weights determine the importance of each input feature
- Bias allows the model to adjust the output independently of inputs
- Both are updated during training to reduce prediction error
- Help the network learn complex patterns and improve accuracy
Weights
Weights are numerical values that determine how much influence each input has on the output. They are adjusted during training to improve the model’s predictions.
- Control the importance of each input feature in the network.
- During forward propagation, inputs are multiplied by weights before passing through an activation function.
- Updated using optimization methods like gradient descent.
- Well-trained weights help the model generalise to new data.
- In house price prediction, the weight for house size shows how strongly size affects the price.
Biases
Biases are additional parameters that shift the output of a neuron, helping the model learn patterns more effectively.
- Allow neurons to activate even when inputs are low.
- Shift the activation function to improve flexibility.
- Updated during training along with weights.
- Help the model fit the data more accurately.
- In house price prediction, bias can represent a base price even when size is zero.
Learning Process in Neural Networks
1. Forward Propagation
Forward propagation is the initial phase of processing input data through the neural network to produce an output or prediction.
- Input Layer: The process starts with data entering the input layer, such as image pixels or feature values from a dataset.
- Weighted Sum: Each neuron multiplies inputs with their weights and adds them to calculate a total value, showing the importance of each input.
- Adding Biases: A bias is added to this value to shift the output and help the model learn better patterns.
- Activation Function: The result is passed through an activation function (like ReLU or sigmoid) to decide whether the neuron should activate or not.
- Propagation: The output is passed to the next layer, and this process continues until the final prediction is generated.
2. Backpropagation
After making a prediction, the network evaluates how accurate it is and updates itself to improve future predictions. This process is called backpropagation.
- Error Calculation: The predicted output is compared with the actual value, and the difference is calculated as error or loss.
- Gradient Calculation: The error is sent backward through the network to calculate how each weight and bias contributed to it.
- Updating Weights and Biases: The network adjusts weights and biases using optimization methods like gradient descent to reduce the error.
- Iteration: This process repeats over multiple iterations, gradually improving the model’s accuracy.
Applications
- Image recognition models detect and classify objects by learning visual features like edges, shapes and patterns.
- NLP models understand and generate text by learning the importance of words and context.
- Autonomous systems process sensor data to make real-time driving decisions for safe navigation.
- Healthcare models analyze medical data to detect diseases and support accurate diagnosis.
Advantages
- Enable the model to learn patterns from data and make meaningful predictions.
- Improve flexibility by adjusting outputs even with limited input information.
- Reduce errors over time, leading to better accuracy.
- Support generalization to new, unseen data.
- Increase the ability to handle complex problems effectively.
Limitations
- Improper initialization can slow down learning or lead to poor results.
- Over adjustment may cause overfitting, making the model too dependent on training data.
- Tuning requires time, experimentation and significant computational resources.
- Understanding the impact of individual parameters is difficult, making the model hard to interpret.
- Training and optimization can be computationally expensive and time consuming.
