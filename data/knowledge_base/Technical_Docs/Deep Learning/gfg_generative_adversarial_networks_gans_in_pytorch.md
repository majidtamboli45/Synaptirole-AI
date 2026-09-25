# Generative Adversarial Networks (GANs) in PyTorch

> Source: https://www.geeksforgeeks.org/deep-learning/generative-adversarial-networks-gans-in-pytorch/

Generative Adversarial Networks (GANs) help models to generate realistic data like images. Using GANs two neural networks the generator and the discriminator are trained together in a competitive setup where the generator creates synthetic images and the discriminator learns to distinguish them from real ones. This adversarial training improves both networks over time which results in high-quality generated images. In this article we will implement GANs using the PyTorch and train a model on the MNIST dataset to generate handwritten digit images.
Why Choose PyTorch for GANs?
PyTorch is used deep learning framework because of its:
- Dynamic Computation Graphs: Allow easy debugging and flexible model changes during training.
- User-Friendly API: Makes building and experimenting with complex models faster and simpler.
- Large Community: Offers lots of tutorials, tools and support for learners and experts.
- Strong Integration with Python: Feels natural for Python developers and supports seamless use of other Python libraries.
- Efficient GPU Acceleration: Helps in fast training and model experimentation on GPUs, speeding up development.
Implementation
We will build and train a Generative Adversarial Network (GAN) using PyTorch to generate realistic handwritten digit images from the MNIST dataset. Below are the key steps involved:
Step 1: Importing Necessary Libraries
We will be using fundamental pytorch modules like torch and torch.nn, torch.optim for building and training models. We can also use torchvision to load and preprocess the MNIST dataset and torchvision.transforms for image transformations before feeding the data to the GAN.
import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
import matplotlib.pyplot as plt
import numpy as np
Step 2: Define Generator Function
The generator class inherits from nn.Module and takes a noise vector as input.
- The architecture uses linear layers, ReLU activation, unflattening and convolutional transpose layers to upsample the noise into a 28×28 grayscale image.
- The output layer uses Tanh activation to scale pixel values between -1 and 1.
class Generator(nn.Module):
    def __init__(self, noise_dim):
        super(Generator, self).__init__()
        self.noise_dim = noise_dim
        self.main = nn.Sequential(
            nn.Linear(noise_dim, 7 * 7 * 256),
            nn.ReLU(True),
            nn.Unflatten(1, (256, 7, 7)),
            nn.ConvTranspose2d(256, 128, 5, stride=1, padding=2),
            nn.BatchNorm2d(128),
            nn.ReLU(True),
            nn.ConvTranspose2d(128, 64, 5, stride=2,
                               padding=2, output_padding=1),
            nn.BatchNorm2d(64),
            nn.ReLU(True),
            nn.ConvTranspose2d(64, 1, 5, stride=2,
                               padding=2, output_padding=1),
            nn.Tanh()
        )
    def forward(self, x):
        return self.main(x)
Step 3: Define Discriminator Function
The discriminator class also inherits from nn.Module.
- It uses convolutional layers with LeakyReLU activation and batch normalization to downsample images and extract features.
- The final layer is a fully connected layer that outputs a single value showing if the input image is real or fake.
nn.Conv2d(64, 128, 5, stride=2, padding=2): Adds another convolutional layer increasing channels from 64 to 128, with same kernel size, stride, and padding.
class Discriminator(nn.Module):
    def __init__(self):
        super(Discriminator, self).__init__()
        self.main = nn.Sequential(
            nn.Conv2d(1, 64, 5, stride=2, padding=2),
            nn.LeakyReLU(0.2, inplace=True),
            nn.BatchNorm2d(64),
            nn.Conv2d(64, 128, 5, stride=2, padding=2),
            nn.LeakyReLU(0.2, inplace=True),
            nn.BatchNorm2d(128),
            nn.Flatten(),
            nn.Linear(7 * 7 * 128, 1)
        )
    def forward(self, x):
        return self.main(x)
Step 4: Combining the Generator and Discriminator
Here we create instances of the generator and discriminator. The generator creates fake images from random noise while the discriminator classifies images as real or fake.
NOISE_DIM = 100
generator = Generator(NOISE_DIM)
discriminator = Discriminator()
Step 5: Device Configuration
Device configuration allows for efficient training of the GAN models on the available hardware resources.
device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')
generator = generator.to(device)
discriminator = discriminator.to(device)
Step 6: Set Loss Function, Optimizer and Hyperparameters
- Use Binary Cross Entropy with Logits Loss suitable for classifying real vs. fake images.
- Use Adam optimizers for both generator and discriminator with a learning rate of 0.0002.
- Define number of epochs as 5 and batch size as 256.
criterion = nn.BCEWithLogitsLoss()
generator_optimizer = optim.Adam(
    generator.parameters(), lr=0.0002, betas=(0.5, 0.999))
discriminator_optimizer = optim.Adam(
    discriminator.parameters(), lr=0.0002, betas=(0.5, 0.999))
NUM_EPOCHS = 5
BATCH_SIZE = 256
Step 7: Prepare DataLoader
- Transformations: Images are transformed into tensors and normalized to range [-1, 1].
- Dataset: MNIST training dataset is loaded with specified transformations and downloaded if necessary.
- DataLoader: Creates batches of data and shuffles them and handles loading them during training.
- train_dataset = torchvision.datasets.MNIST(root='./data', train=True, transform=transform, download=True): Downloads and loads the MNIST training dataset, applying the defined transformations.
- train_loader = torch.utils.data.DataLoader(train_dataset, batch_size=BATCH_SIZE, shuffle=True): Creates an iterable DataLoader to load batches of images from the dataset, shuffling them each epoch for randomness.
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.5,), (0.5,))
])
train_dataset = torchvision.datasets.MNIST(
    root='./data', train=True, transform=transform, download=True)
train_loader = torch.utils.data.DataLoader(
    train_dataset, batch_size=BATCH_SIZE, shuffle=True)
Step 8: Training Process
This training loop iterates over the specified number of epochs, training the GAN by alternating between updating the discriminator and the generator:
- For each epoch, loop over batches of real images.
- Train discriminator with real images and labels then with fake images generated by the generator.
- Train generator to produce images that fool the discriminator.
- Print losses regularly to monitor training.
- real_labels = torch.ones(real_images.size(0), 1, device=device): Creates labels of ones representing real images for the discriminator.
- noise = torch.randn(real_images.size(0), NOISE_DIM, device=device): Generates random noise vectors to feed the generator.
- fake_labels = torch.ones(real_images.size(0), 1, device=device): Creates labels of ones to trick the discriminator into thinking generated images are real.
for epoch in range(NUM_EPOCHS):
    for i, data in enumerate(train_loader):
        real_images, _ = data
        real_images = real_images.to(device)
        discriminator_optimizer.zero_grad()
        real_labels = torch.ones(real_images.size(0), 1, device=device)
        real_outputs = discriminator(real_images)
        real_loss = criterion(real_outputs, real_labels)
        real_loss.backward()
        noise = torch.randn(real_images.size(0), NOISE_DIM, device=device)
        fake_images = generator(noise)
        fake_labels = torch.zeros(real_images.size(0), 1, device=device)
        fake_outputs = discriminator(fake_images.detach())
        fake_loss = criterion(fake_outputs, fake_labels)
        fake_loss.backward()
        discriminator_optimizer.step()
        generator_optimizer.zero_grad()
        fake_labels = torch.ones(real_images.size(0), 1, device=device)
        fake_outputs = discriminator(fake_images)
        gen_loss = criterion(fake_outputs, fake_labels)
        gen_loss.backward()
        generator_optimizer.step()
        if i % 100 == 0:
            print(f'Epoch [{epoch+1}/{NUM_EPOCHS}], Step [{i+1}/{len(train_loader)}], '
                  f'Discriminator Loss: {real_loss.item() + fake_loss.item():.4f}, '
                  f'Generator Loss: {gen_loss.item():.4f}')
Step 9: Visualization
Generate and save sample images from the trained generator at intervals to track progress visually.
- test_noise = torch.randn(16, NOISE_DIM, device=device): Creates a batch of 16 random noise vectors for image generation.
def generate_and_save_images(model, epoch, noise):
    model.eval()
    with torch.no_grad():
        fake_images = model(noise).cpu()
        fake_images = fake_images.view(fake_images.size(0), 28, 28)
        fig = plt.figure(figsize=(4, 4))
        for i in range(fake_images.size(0)):
            plt.subplot(4, 4, i + 1)
            plt.imshow(fake_images[i], cmap='gray')
            plt.axis('off')
        plt.savefig(f'image_at_epoch_{epoch+1:04d}.png')
        plt.show()
test_noise = torch.randn(16, NOISE_DIM, device=device)
generate_and_save_images(generator, NUM_EPOCHS, test_noise)
Output:
The output of the image is not clear as the image is trained only for 5 epochs, you can train the image for more number of epochs and fine tune according to your need to get better results.
As GANs continue to grow, their ability to create increasingly realistic and diverse images will open up new possibilities across art, design and data science.
