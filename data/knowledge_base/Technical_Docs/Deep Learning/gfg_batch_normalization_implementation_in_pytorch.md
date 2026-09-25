# Batch Normalization Implementation in PyTorch

> Source: https://www.geeksforgeeks.org/deep-learning/batch-normalization-implementation-in-pytorch/

Batch Normalization (BN) is a critical technique in the training of neural networks, designed to address issues like vanishing or exploding gradients during training. In this tutorial, we will implement batch normalization using PyTorch framework.
Table of Content
What is Batch Normalization?
Gradients are used to update weights during training, that can become unstable or vanish entirely, hindering the network's ability to learn effectively. Batch Normalization (BN) is a powerful technique that addresses these issues by stabilizing the learning process and accelerating convergence. Batch Normalization(BN) is a popular technique used in deep learning to improve the training of neural networks by normalizing the inputs of each layer. Implementing batch normalization in PyTorch models requires understanding its concepts and best practices to achieve optimal performance.
Batch Normalization makes the training to be more consistent, and faster, adds better performance, and avoids problems like gradient becoming too small or too large during training and ensures that the network doesn't get stuck or make big mistakes while learning. It is helpful when neural network faces issues like slow training or unstable gradients.
How Batch Normalization works?
- During each training iteration (epoch), BN takes a mini batch of data and normalizes the activations (outputs) of a hidden layer. This normalization transforms the activations to have a mean of 0 and a standard deviation of 1.
- While normalization helps with stability, it can also disrupt the network's learned features. To compensate, BN introduces two learnable parameters: gamma and beta. Gamma rescales the normalized activations, and beta shifts them, allowing the network to recover the information present in the original activations.
It ensures that each element or component is in the right proportion before distributing the inputs into the layers and each layer is normalized before being passed to the next layer.
Correct Batch Size:
- Resonable sized mini-batches must be taken into consideration during training. It performs better with large batch sizes as it computes more accurate batch statistics.
- Leading it to be more stable gradients and faster convergence.
Implementing Batch Normalization in PyTorch
PyTorch provides the nn.BatchNormXd module (where X is 1 for 1D data, 2 for 2D data like images, and 3 for 3D data) for convenient BN implementation. In this tutorial, we will see the implementation of batch normalizationa and it's effect on model. We will train the model and highlight the loss before and after using batch normalization with MNIST dataset widely used dataset in the field of machine learing and computer vision. This dataset consists of a collection of 28X28 pixel grayscale images of handwritten digits ranges from (0 to 9) inclusive along with their corresponding labels.
Prerequsite: Install the PyTorch library:
pip install torch torchvision
Step 1: Importing necessary libraries
- Torch : Imports the PyTorch library for deep learning operations.
- nn : Imports the neural network module from PyTorch for building neural network architectures.
- DataLoader : Import dataloader class from PyTorch, it helps in loading the datasets efficiently for traning and testing.
- Transforms : Imports the transforms module from torchvision, which provides common image transformations.
- Time : Imports the time module for time-related operations.
- OS : Imports the os module, which provides functions for interacting with the operating system.
import torch
from torch import nn
from torchvision.datasets import MNIST
from torch.utils.data import DataLoader
from torchvision import transforms
import time
import datetime
import os
Step 2: Implementing Batch Normalization to the model
In the code snippet, Batch Normalization (BN) is incorporated into the neural network architecture using the nn.BatchNorm1d layer, the layers  are added after the fully connected layers.
- nn.BatchNorm1d(64) is applied after the first fully connected layer (64 neurons).
- nn.BatchNorm1d(32) is applied after the second fully connected layer (32 neurons).
The arguments (64 and 32) represent the number of features (neurons) in the respective layers to which Batch Normalization is applied. Following Batch Normalization, the ReLU activation function is applied to introduce non-linearity. In the forward method, the input tensor x is passed through the layers, including those with Batch Normalization. 
# Define your neural network architecture with batch normalization
class MLP(nn.Module):
    def __init__(self):
        super().__init__()
        self.layers = nn.Sequential(
            nn.Flatten(),                   # Flatten the input image tensor
            nn.Linear(28 * 28, 64),         # Fully connected layer from 28*28 to 64 neurons
            nn.BatchNorm1d(64),             # Batch normalization for stability and faster convergence
            nn.ReLU(),                      # ReLU activation function
            nn.Linear(64, 32),              # Fully connected layer from 64 to 32 neurons
            nn.BatchNorm1d(32),             # Batch normalization for stability and faster convergence
            nn.ReLU(),                      # ReLU activation function
            nn.Linear(32, 10)               # Fully connected layer from 32 to 10 neurons (for MNIST classes)
        )
    def forward(self, x):
        return self.layers(x)
Step 3: The next step follows loading and training the dataset with simple MLP neural network architecture for the MINST dataset and creating the dataloader for training.
if __name__ == '__main__':
    # Set random seed for reproducibility
    torch.manual_seed(47)
    # Load the MNIST dataset
    transform = transforms.Compose([
        transforms.ToTensor()
    ])
    train_data = MNIST(os.getcwd(), download=True, transform=transforms.ToTensor())
    train_loader = DataLoader(train_data, batch_size=64, shuffle=True)
Step 4: Initialize the MLP model, Define the loss function(CrossEntropyLoss), and optimizer (Adam).
mlp = MLP() # Initialize MLP model
loss_function = nn.CrossEntropyLoss()    # Cross-entropy loss function for classification
optimizer = torch.optim.Adam(mlp.parameters(), lr=1e-3)   # Adam optimizer with learning rate 0.001
Step 5: Define Training Loop
We are training the model for 3 epoch using a training loop. It will itertate over mini-batches of traning data, computes the loss, performs backpropogation, and updatess the model paramaters.
start_time = time.time()
# Training loop
for epoch in range(3):   # Iterate over 3 epochs
    print(f'Starting epoch {epoch + 1}')
    running_loss = 0.0
    for i, data in enumerate(train_loader, 0):
        inputs, labels = data
        optimizer.zero_grad()   # Zero the gradients
        outputs = mlp(inputs.view(inputs.shape[0], -1))   # Flatten the input for MLP and forward pass
        loss = loss_function(outputs, labels)   # Compute the loss
        loss.backward()   # Backpropagation
        optimizer.step()   # Optimizer step to update parameters
        running_loss += loss.item()
        if i % 100 == 99:   # Print every 100 mini-batches
            print(f'Epoch {epoch + 1}, Mini-batch {i + 1}, Loss: {running_loss / 100}')
            running_loss = 0.0
print('Training finished')
end_time = time.time() # Record end time
print('Training process has been completed. ')
training_time = end_time - start_time
print('Training time:', str(datetime.timedelta(seconds=training_time))) # for calculating the training time in minutes and seconds format
Output:
Starting epoch 1
Epoch 1, Mini-batch 100, Loss: 1.107109518647194
Epoch 1, Mini-batch 200, Loss: 0.48408970028162
Epoch 1, Mini-batch 300, Loss: 0.3104418055713177
Epoch 1, Mini-batch 400, Loss: 0.2633690595626831
Epoch 1, Mini-batch 500, Loss: 0.2228860107809305
Epoch 1, Mini-batch 600, Loss: 0.20098184436559677
Epoch 1, Mini-batch 700, Loss: 0.18423103891313075
Epoch 1, Mini-batch 800, Loss: 0.16403419613838197
Epoch 1, Mini-batch 900, Loss: 0.14670498583465816
Starting epoch 2
Epoch 2, Mini-batch 100, Loss: 0.1223447759822011
Epoch 2, Mini-batch 200, Loss: 0.11535881120711565
Epoch 2, Mini-batch 300, Loss: 0.12264159372076393
Epoch 2, Mini-batch 400, Loss: 0.1274782767519355
Epoch 2, Mini-batch 500, Loss: 0.12688526364043354
Epoch 2, Mini-batch 600, Loss: 0.10709397405385972
Epoch 2, Mini-batch 700, Loss: 0.12462730823084713
Epoch 2, Mini-batch 800, Loss: 0.10854666410945356
Epoch 2, Mini-batch 900, Loss: 0.10740736600011587
Starting epoch 3
Epoch 3, Mini-batch 100, Loss: 0.09494352690875531
Epoch 3, Mini-batch 200, Loss: 0.08548182763159275
Epoch 3, Mini-batch 300, Loss: 0.08944599309004843
Epoch 3, Mini-batch 400, Loss: 0.08315778982825578
Epoch 3, Mini-batch 500, Loss: 0.0855206391401589
Epoch 3, Mini-batch 600, Loss: 0.08882722020149231
Epoch 3, Mini-batch 700, Loss: 0.0896124207880348
Epoch 3, Mini-batch 800, Loss: 0.08545528341084718
Epoch 3, Mini-batch 900, Loss: 0.09168351721018553
Training finished
Training process has been completed. 
Training time: 0:00:21.384532
Note: The loss after mini-batch 900 of epoch 3 with batch normalization is 0.09196628
Benefits of Batch Normalization
- Faster Convergence: By stabilizing the gradients, BN allows you to use higher learning rates, which can significantly speed up training.
- Reduced Internal Covariate Shift: As the network trains, the distribution of activations within a layer can change (internal covariate shift). BN helps mitigate this by normalizing activations before subsequent layers, making the training process less sensitive to these shifts.
- Initialization Insensitivity: BN makes the network less reliant on the initial weight values, allowing for more robust training and potentially better performance.
Conclusion
The choice between using batch normalization or not depends on factors such as model architecture, dataset characteristics, and computational resources. The discussed practices for batch normalization must be taken into consider as it reflects its output in the MLP. Thus for better generalization, and faster convergence leads to  takeforward the technolgies in deeper networks.
