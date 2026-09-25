# Stochastic Gradient Descent (SGD)

> Source: https://www.geeksforgeeks.org/machine-learning/ml-stochastic-gradient-descent-sgd/

Stochastic Gradient Descent is an optimization algorithm used in machine learning, especially for large datasets, that updates model parameters efficiently using small batches or single samples.
- Variant of gradient descent designed for faster and scalable learning
- Updates parameters using one data point or small batches at a time
- Reduces computation compared to full batch gradient descent
- Widely used in deep learning for efficient training
Working of Stochastic Gradient Descent
- In traditional gradient descent, the gradients are computed based on the entire dataset which can be computationally expensive for large datasets.
- In Stochastic Gradient Descent, the gradient is calculated for each training example (or a small subset of training examples) rather than the entire dataset.
Stochastic Gradient Descent update rule is:
\theta = \theta - \eta \nabla_\theta J(\theta; x_i, y_i) 
Where:
- x_i  andy_i  represent the features and target of the i-th training example.
- The gradient \nabla_\theta J(\theta; x_i, y_i) is now calculated for a single data point or a small batch.
Implementing Stochastic Gradient Descent from Scratch
1. Generating the Data
In this step, we generate synthetic data for the linear regression problem. The data consists of feature X and the target y where the relationship is linear, i.e., y = 4 + 3 * X + noise.
- X is a random array of 100 samples between 0 and 2.
- y is the target, calculated using a linear equation with a little random noise to make it more realistic.
import numpy as np
np.random.seed(42)
X = 2 * np.random.rand(100, 1)
y = 4 + 3 * X + np.random.randn(100, 1)
For a linear regression with one feature, the model is described by the equation:
y = \theta_0 + (\theta_1 )\cdot X 
Where:
- \theta_0  is the intercept (the bias term),
- \theta_1 is the slope or coefficient associated with the input featureX .
2. Defining the SGD Function
This step defines the Stochastic Gradient Descent function that initializes parameters, updates them iteratively, and tracks the loss during training.
- Takes input data X and targety
- Itheta (\theta ) is the parameter vector (intercept and slope) initialized randomly.
- X_bias is the augmented X with a column of ones added for the bias term (intercept).
- Shuffles data in each epoch and updates parameters using single samples or mini-batches
- Computes loss using Mean Squared Error (MSE)
- Stores loss values to monitor convergence
def sgd(X, y, learning_rate=0.1, epochs=1000, batch_size=1):
    m = len(X)
    theta = np.random.randn(2, 1)
    X_bias = np.c_[np.ones((m, 1)), X]
    cost_history = []
    for epoch in range(epochs):
        indices = np.random.permutation(m)
        X_shuffled = X_bias[indices]
        y_shuffled = y[indices]
        for i in range(0, m, batch_size):
            X_batch = X_shuffled[i:i + batch_size]
            y_batch = y_shuffled[i:i + batch_size]
            gradients = 2 / batch_size * \
                X_batch.T.dot(X_batch.dot(theta) - y_batch)
            theta -= learning_rate * gradients
        predictions = X_bias.dot(theta)
        cost = np.mean((predictions - y) ** 2)
        cost_history.append(cost)
        if epoch % 100 == 0:
            print(f"Epoch {epoch}, Cost: {cost}")
    return theta, cost_history
3: Train the Model Using SGD
In this step, we call the sgd() function to train the model. We specify the learning rate, number of epochs and batch size for SGD.
theta_final, cost_history = sgd(X, y, learning_rate=0.1, epochs=1000, batch_size=1)
Output:
4. Visualizing the Cost Function
After training, we visualize how the cost function evolves over epochs. This helps us understand if the algorithm is converging properly.
import matplotlib.pyplot as plt
plt.plot(cost_history)
plt.xlabel('Epochs')
plt.ylabel('Cost (MSE)')
plt.title('Cost Function during Training')
plt.show()
Output:
5. Plotting the Data and Regression Line
We will visualize the data points and the fitted regression line after training. We plot the data points as blue dots and the predicted line (from the final 
plt.scatter(X, y, color='blue', label='Data points')
plt.plot(X, np.c_[np.ones((X.shape[0], 1)), X].dot(
    theta_final), color='red', label='SGD fit line')
plt.xlabel('X')
plt.ylabel('y')
plt.title('Linear Regression using Stochastic Gradient Descent')
plt.legend()
plt.show()
Output:
6. Printing the Final Model Parameters
After training, we print the final parameters of the model which include the slope and intercept. These values are the result of optimizing the model using SGD.
print(f"Final parameters: {theta_final}")
Output:
Final parameters: [[4.35097872] [3.45754277]]
The final parameters returned by the model are:
\theta_0 = 4.35, \quad \theta_1 = 3.45 
Then the fitted linear regression model will be:
y = 4.35 + (3.45)\cdot X 
This means:
- When X=0, y=4.3(the intercept or bias term).
- For each unit increase in X, y will increase by 3.4 units (the slope or coefficient).
Applications
- Used in deep learning to train large neural networks efficiently
- Applied in NLP for models like Word2Vec and transformers
- Used in computer vision tasks such as image classification, object detection and segmentation
- Applied in reinforcement learning for models like deep Q-networks and policy gradient methods
Advantages
- Faster and more efficient since it updates parameters using one or a few data points
- Requires less memory, making it suitable for large datasets
- Stochastic updates help escape local minima and saddle points
- Supports online learning by updating the model with incoming data
Challenges
- Updates can be noisy due to using single samples, causing fluctuations in the loss instead of smooth convergence
- Highly sensitive to learning rate; too high may diverge, too low slows down learning
- May take longer to converge overall despite faster individual updates
