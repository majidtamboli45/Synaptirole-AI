# Implementing an Autoencoder in PyTorch

> Source: https://www.geeksforgeeks.org/deep-learning/implementing-an-autoencoder-in-pytorch/

Autoencoders are neural networks designed for unsupervised tasks like dimensionality reduction, anomaly detection and feature extraction. They work by compressing data into a smaller form through an encoder and then reconstructing it back using a decoder. The goal is to minimize the difference between the original input and its reconstruction. In this article, we’ll implement a simple autoencoder in PyTorch using the MNIST dataset of handwritten digits.
Implementation of Autoencoder in PyTorch
Lets see various steps involved in the implementation process.
Step 1: Importing Libraries
We will be using PyTorch including the torch.nn module for building neural networks and torch.optim for optimization. For loading and preprocessing the MNIST dataset, we will use datasets and transforms from the torchvision package. Also we use Matplotlib for visualizing training progress and displaying images.
import torch
from torch import nn, optim
from torchvision import datasets, transforms
import matplotlib.pyplot as plt
Step 2: Loading the Dataset
Now we will load MNIST dataset containing 70,000 grayscale images of digits (0-9), each sized 28x28 pixels. We will convert images to tensors and create a data loader to fetch data in batches for training.
tensor_transform = transforms.ToTensor()
dataset = datasets.MNIST(root="./data", train=True,
                         download=True, transform=tensor_transform)
loader = torch.utils.data.DataLoader(
    dataset=dataset, batch_size=32, shuffle=True)
Step 3: Define the Autoencoder Model
In this step we are going to define our autoencoder. It consists of two components:
Encoder: Compresses the 784-pixel image into a smaller latent representation through fully connected layers with ReLU activations helps in reducing dimensions.
28*28 = 784 ==> 128 ==> 64 ==> 36 ==> 18 ==> 9
Decoder: Reconstructs the original image by expanding the latent vector back to the original size, ending with a Sigmoid activation to output pixel values between 0 and 1.
9 ==> 18 ==> 36 ==> 64 ==> 128 ==> 784 ==> 28*28 = 784
class AE(nn.Module):
    def __init__(self):
        super(AE, self).__init__()
        self.encoder = nn.Sequential(
            nn.Linear(28 * 28, 128),
            nn.ReLU(),
            nn.Linear(128, 64),
            nn.ReLU(),
            nn.Linear(64, 36),
            nn.ReLU(),
            nn.Linear(36, 18),
            nn.ReLU(),
            nn.Linear(18, 9)
        )
        self.decoder = nn.Sequential(
            nn.Linear(9, 18),
            nn.ReLU(),
            nn.Linear(18, 36),
            nn.ReLU(),
            nn.Linear(36, 64),
            nn.ReLU(),
            nn.Linear(64, 128),
            nn.ReLU(),
            nn.Linear(128, 28 * 28),
            nn.Sigmoid()
        )
    def forward(self, x):
        encoded = self.encoder(x)
        decoded = self.decoder(encoded)
        return decoded
Step 4: Initializing Model
After defining the autoencoder, we create an instance of the model. We use Mean Squared Error (MSE) as the loss function since it measures how close the reconstructed images are to the original inputs. For optimization, we use the Adam optimizer with a learning rate of 0.001 and weight decay of 
model = AE()
loss_function = nn.MSELoss()
optimizer = optim.Adam(model.parameters(), lr=1e-3, weight_decay=1e-8)
Step 5: Training the model and Plotting Training Loss
In this step the model undergoes training for 20 epochs. The training process updates the model's weights using backpropagation and optimization techniques. Loss values are recorded during each iteration and after training a loss plot is generated to assess the model’s performance over time.
Note: This snippet takes 15 to 20 mins to execute depending on the processor type. Initialize epoch = 1 for quick results. Use a GPU/TPU runtime for faster computations.
epochs = 20
outputs = []
losses = []
device = torch.device("cuda" if torch.cuda.is_available() else "cpu")
model.to(device)
for epoch in range(epochs):
    for images, _ in loader:
        images = images.view(-1, 28 * 28).to(device)
        
        reconstructed = model(images)
        loss = loss_function(reconstructed, images)
        
        optimizer.zero_grad()
        loss.backward()
        optimizer.step()
        
        losses.append(loss.item())
    
    outputs.append((epoch, images, reconstructed))
    print(f"Epoch {epoch+1}/{epochs}, Loss: {loss.item():.6f}")
plt.style.use('fivethirtyeight')
plt.figure(figsize=(8, 5))
plt.plot(losses, label='Loss')
plt.xlabel('Iterations')
plt.ylabel('Loss')
plt.legend()
plt.show()
Output:
The loss curve in the image shows how the model's error decreases over training iterations. Initially the loss is high but quickly drops showing that the model is learning.
Step 6: Visualizing Original and Reconstructed Images
After training, it's important to see how well the autoencoder reconstructs the images. We take a batch of images and pass them through the trained model and display the original and reconstructed images side by side.
model.eval()
dataiter = iter(loader)
images, _ = next(dataiter)
images = images.view(-1, 28 * 28).to(device)
reconstructed = model(images)
fig, axes = plt.subplots(nrows=2, ncols=10, figsize=(10, 3))
for i in range(10):
    axes[0, i].imshow(images[i].cpu().detach().numpy().reshape(28, 28), cmap='gray')
    axes[0, i].axis('off')
    axes[1, i].imshow(reconstructed[i].cpu().detach().numpy().reshape(28, 28), cmap='gray')
    axes[1, i].axis('off')
plt.show()
Output:
The top row shows the original MNIST digits and the bottom row shows their reconstructions. Some reconstructed images may look a little blurry which is expected because the model compresses the data. This can be improved by using more advanced architectures or training longer.
You can download source code from here.
