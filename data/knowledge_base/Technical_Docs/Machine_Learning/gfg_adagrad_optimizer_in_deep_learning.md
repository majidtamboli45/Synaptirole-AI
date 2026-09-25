# Adagrad Optimizer in Deep Learning

> Source: https://www.geeksforgeeks.org/machine-learning/intuition-behind-adagrad-optimizer/

Adagrad is an optimization method that adapts the learning rate for each parameter based on past gradients, improving learning for features with different frequencies.
- Adjusts learning rate individually for each parameter
- Uses accumulated past gradients to scale updates
- Works well for sparse data and varying feature magnitudes
- Reduces learning rate over time for frequently updated parameters
Working of Adagrad Algorithm
Adagrad adapts the learning rate for each parameter by using the accumulated sum of squared gradients, allowing more efficient and stable training.
1. Initialization: Adagrad begins by initializing the parameter values randomly, just like other optimization algorithms. Additionally, it initializes a running sum of squared gradients for each parameter which will track the gradients over time.
2. Gradient Calculation: For each training step, the gradient of the loss function with respect to the model's parameters is calculated, just like in standard gradient descent.
3. Adaptive Learning Rate: Adagrad adjusts the learning rate for each parameter based on the accumulated sum of squared gradients, instead of using a fixed rate.
- Learning rate is updated as:
\text{lr}_t = \frac{\eta}{\sqrt{G_t + \epsilon}} 
- \eta is the global learning rate (a small constant value)
- G_t  is the sum of squared gradients for a given parameter up to time stept
- ϵ is a small value added to avoid division by zero (often set to1e−8 )
- As \sqrt{G_t + \epsilon}  increases, the learning rate decreases over time
- This helps stabilize training and prevents large updates
4. Parameter Update: The model's parameters are updated by subtracting the product of the adaptive learning rate and the gradient at each step:
\theta_{t+1} = \theta_t - \text{lr}_t \cdot \nabla_{\theta} 
Where:
- \theta_t  is the current parameter
- \nabla_{\theta} J(\theta) is the gradient of the loss function with respect to the parameter
Use Cases of Adagrad
- Works well for sparse data such as NLP and recommender systems
- Useful when features have different importance or frequency
- Suitable for tasks that prefer stable learning over very fast convergence
- May not perform well when a consistent learning rate is needed
- In such cases, optimizers like RMSProp or Adam are often preferred
Variants of Adagrad Optimizer
To overcome Adagrad’s rapidly decreasing learning rate, improved variants have been developed.
1. RMSProp (Root Mean Square Propagation):
RMSProp improves Adagrad by using an exponentially decaying average of squared gradients instead of accumulating them, preventing the learning rate from shrinking too quickly.
- Uses moving average of squared gradients
- Prevents rapid decay of learning rate
- Improves performance in deep neural networks
- Provides more stable and efficient training
Formula:
G_t = \gamma G_{t-1} + (1 - \gamma) (\nabla_{\theta} J(\theta))^2 
Where:
- G_t is the accumulated gradient
- \gamma is the decay factor (typically set to 0.9)
- \nabla_{\theta} J(\theta) is the gradient
Parameter update:
\theta_{t+1} = \theta_t - \frac{\eta}{\sqrt{G_t + \epsilon}} \cdot \nabla_{\theta} J(\theta) 
2. AdaDelta
AdaDelta is an improved version of Adagrad that avoids excessive accumulation of past gradients by using moving averages, leading to more stable and consistent updates.
- Uses moving average of squared gradients instead of full accumulation
- Prevents learning rate from shrinking too quickly
- Provides more stable and bounded updates
- Reduces the need to manually tune the learning rate
Formula:
\Delta \theta_{t+1} = - \frac{\sqrt{E[\Delta \theta]^2_{t}}}{\sqrt{E[\nabla_{\theta} J(\theta)]^2_{t}} + \epsilon} \cdot \nabla_{\theta} J(\theta) 
Where:
- [\Delta \theta]^2_{t} is the running average of past squared parameter updates
3. Adam (Adaptive Moment Estimation)
Adam is an optimization algorithm that combines the benefits of momentum and adaptive learning rates, making it robust and widely used in deep learning.
- Uses moving average of gradients (momentum)
- Uses moving average of squared gradients (adaptive learning rate)
- Provides fast and stable convergence
- Works well across a wide range of tasks and models
Adam has the following update rules
- First moment estimate (m_t ):
m_t = \beta_1 m_{t-1} + (1 - \beta_1) \nabla_{\theta} J(\theta) 
- Second moment estimate (v_t ):
v_t = \beta_2 v_{t-1} + (1 - \beta_2) (\nabla_{\theta} J(\theta))^2 
- Corrected moment estimates:
\hat{m}_t = \frac{m_t}{1 - \beta_1^t}, \quad \hat{v}_t = \frac{v_t}{1 - \beta_2^t} 
- Parameter update:
\theta_{t+1} = \theta_t - \frac{\eta}{\sqrt{\hat{v}_t} + \epsilon} \cdot \hat{m}_t 
Adagrad Optimizer Implementation
Below are examples of how to implement the Adagrad optimizer in TensorFlow and PyTorch.
1. TensorFlow Implementation
In TensorFlow, implementing Adagrad is easier as it's already included in the API. Here's an example where:
- mnist.load_data() loads the MNIST dataset.
- reshape() flattens 28x28 images into 784-length vectors.
- Division by 255 normalizes pixel values to [0,1].
- tf.keras.Sequential() builds the neural network model.
- tf.keras.layers.Dense() creates fully connected layers.
- activation='relu' adds non-linearity in hidden layer and softmax outputs probabilities.
- tf.keras.optimizers.Adagrad() applies adaptive learning rates per parameter to improve convergence.
- compile() configures training with optimizer, loss function and metrics.
- loss='sparse_categorical_crossentropy' computes loss for integer class labels.
- model.fit() trains the model for specified epochs on the training data.
import tensorflow as tf
from tensorflow.keras.datasets import mnist
from tensorflow.keras.utils import to_categorical
(x_train, y_train), (x_test, y_test) = mnist.load_data()
x_train = x_train.reshape(-1, 784).astype('float32') / 255.0
x_test = x_test.reshape(-1, 784).astype('float32') / 255.0
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(784,)),
    tf.keras.layers.Dense(10, activation='softmax')
])
model.compile(optimizer=tf.keras.optimizers.Adagrad(learning_rate=0.01),
              loss='sparse_categorical_crossentropy',
              metrics=['accuracy'])
model.fit(x_train, y_train, epochs=5)
Output:
2. PyTorch Implementation
In PyTorch, Adagrad can be used with the torch.optim.Adagrad class. Here's an example where:
- datasets.MNIST() loads data, ToTensor() converts images and Lambda() flattens them.
- DataLoader batches and shuffles data.
- SimpleModel has two linear layers with ReLU in forward().
- CrossEntropyLoss computes classification loss.
- Adagrad optimizer adapts learning rates per parameter based on past gradients, improving training on sparse or noisy data.
- Training loop: zero gradients, forward pass, compute loss, backpropagate and update weights with Adagrad.
import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms
from torch.utils.data import DataLoader
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Lambda(lambda x: x.view(-1))
])
train_dataset = datasets.MNIST(
    root='./data', train=True, download=True, transform=transform)
train_loader = DataLoader(train_dataset, batch_size=64, shuffle=True)
class SimpleModel(nn.Module):
    def __init__(self):
        super(SimpleModel, self).__init__()
        self.fc1 = nn.Linear(784, 64)
        self.fc2 = nn.Linear(64, 10)
    def forward(self, x):
        x = torch.relu(self.fc1(x))
        return self.fc2(x)
model = SimpleModel()
loss_fn = nn.CrossEntropyLoss()
optimizer = optim.Adagrad(model.parameters(), lr=0.01)
for epoch in range(5):
    for data, target in train_loader:
        optimizer.zero_grad()
        output = model(data)
        loss = loss_fn(output, target)
        loss.backward()
        optimizer.step()
    print(f"Epoch {epoch+1} complete")
Output:
By applying Adagrad in appropriate scenarios and complementing it with other techniques like RMSProp and Adam, practitioners can achieve faster convergence and improved model performance.
Advantages
- Adapts learning rates for each parameter, helping with sparse features and noisy data.
- Works well with sparse data by giving rare but important features appropriate updates.
- Automatically adjusts learning rates, eliminating the need for manual tuning.
- Improves performance in cases with varying gradient magnitudes, enabling efficient convergence.
Limitations
- Learning rates shrink continuously during training which can slow convergence and cause early stopping.
- Performance depends heavily on the initial learning rate choice.
- Lacks momentum, making it harder to escape shallow local minima.
- Learning rates decrease as gradients accumulate which helps avoid overshooting but may hinder progress later in training.
