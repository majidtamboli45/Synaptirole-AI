# Batch Normalization In Deep Learning

> Source: https://www.geeksforgeeks.org/deep-learning/what-is-batch-normalization-in-deep-learning/

Batch Normalization in Deep Learning is a technique used to normalize the activations of a neural network during training.
- It reduces the problem of internal covariate shift, where the distribution of inputs to each layer changes as the model learns.
- By normalizing the activations of each mini-batch, Batch Normalization keeps the input values of each layer more consistent, resulting in faster and more stable training.
Need for Batch Normalization
- Speeds Up Training: Stable activations allow the network to converge in fewer training iterations.
- Supports Higher Learning Rates: Makes training more robust, allowing larger learning rates without causing divergence.
- Improves Gradient Flow: Reduces the chances of vanishing and exploding gradients in deep neural networks.
- Acts as a Regularizer: The variation introduced by mini-batch statistics can reduce overfitting, sometimes decreasing the need for dropout.
- Reduces Sensitivity to Weight Initialization: Models become less dependent on carefully chosen initial parameter values, making training more reliable.
Working
The working of Batch Normalization can be understood in the following steps:
Step 1: Compute the Batch Mean
For each mini-batch, the mean of the activations is calculated. The batch mean represents the average value of all activations in the current mini-batch and is used as the reference for normalization.
u_B=\frac{1}{m}\sum_{i=1}^{m}x_i 
where:
- m is the number of samples in the mini-batch.
- x_i is the activation of the ithi^{th}ith sample.
- \mu_B  is the mean of the mini-batch.
Step 2: Compute the Batch Variance
Next, the variance of the activations is calculated. The variance measures how far the activations are spread around the batch mean.
\sigma_B^2=\frac{1}{m}\sum_{i=1}^{m}(x_i-\mu_B)^2 
where:
- \sigma_B^2 is the variance of the mini-batch.
Step 3: Normalize the Activations
Each activation is normalized by subtracting the batch mean and dividing by the square root of the batch variance. A small constant ϵ\epsilonϵ is added to the denominator to prevent division by zero.
{x_i}=\frac{x_i-\mu_B}{\sqrt{\sigma_B^2+\epsilon}} 
where:
- \hat{x_i} is the normalized activation.
- \epsilon is a small constant added for numerical stability.
After this step, the activations have approximately zero mean and unit variance, which helps stabilize the learning process.
Step 4: Scale and Shift the Normalized Activations
Normalizing the activations may reduce the flexibility of the network. To overcome this, Batch Normalization introduces two learnable parameters:
- γ (gamma): Scaling parameter
- β (beta): Shifting parameter
The final output is computed as:
y_i=\gamma\hat{x_i}+\beta 
where:
- y_i is the final output after Batch Normalization.
- \gamma controls the scale of the normalized activations.
- \beta shifts the normalized activations to the desired range.
Step 5: Pass the Output to the Next Layer
- The scaled and shifted activations are then passed to the next layer of the neural network.
- During training, the normalization statistics (mean and variance) are computed separately for each mini-batch.
- During inference, the layer uses the running averages of these statistics collected during training to ensure consistent predictions.
Implementation using TensorFlow
Step 1: Import the Required Library
- Import the TensorFlow library to build and train the neural network.
- The Keras API in TensorFlow provides the BatchNormalization() layer used in this example.
import tensorflow as tf
Step 2: Load and Preprocess the Dataset
- Load the handwritten digit dataset using TensorFlow.
- Normalize the pixel values to the range 0–1 for faster and more stable training.
- Flatten each image into a one-dimensional vector before passing it to the Dense layer.
- Select only 5,000 training samples so the example runs quickly.
# Load the MNIST dataset
(x_train, y_train), (x_test, y_test) = tf.keras.datasets.mnist.load_data()
# Normalize pixel values
x_train = x_train.astype("float32") / 255.0
x_test = x_test.astype("float32") / 255.0
# Flatten each 28×28 image into a 784-dimensional vector
x_train = x_train.reshape(-1, 784)
x_test = x_test.reshape(-1, 784)
# Use a small subset for faster execution
x_train = x_train[:5000]
y_train = y_train[:5000]
Step 3: Create the Neural Network with Batch Normalization
- Create a Sequential neural network.
- Add an input layer with 784 features.
- Add a Dense layer containing 64 neurons.
model = tf.keras.Sequential([
    tf.keras.Input(shape=(784,)),
    tf.keras.layers.Dense(64),
    tf.keras.layers.BatchNormalization(),
    tf.keras.layers.Activation("relu"),
    tf.keras.layers.Dense(10, activation="softmax")
])
Step 4: Compile the Model
- Use the Adam optimizer for efficient weight updates.
- Use Sparse Categorical Crossentropy because the labels are integer values.
- Track the model's performance using accuracy.
model.compile(
    optimizer="adam",
    loss="sparse_categorical_crossentropy",
    metrics=["accuracy"]
)
Step 5: Train the Model
- Train the model using the training dataset.
- Run the training process for 2 epochs to keep execution time short.
model.fit(
    x_train,
    y_train,
    epochs=2,
    batch_size=32
)
Output:
Epoch 1/2
157/157 ━━━━━━━━━━━━━━━━━━━━ 2s 4ms/step - accuracy: 0.83 - loss: 0.62
Epoch 2/2
157/157 ━━━━━━━━━━━━━━━━━━━━ 1s 3ms/step - accuracy: 0.92 - loss: 0.28
Implementing using PyTorch
Step 1: Import the Required Libraries
- Import PyTorch and its neural network modules.
- Import the MNIST dataset and image transformation utilities.
-  Import DataLoader to load the dataset in mini-batches.
-  Import Subset to use a smaller portion of the dataset for faster execution.
import torch
import torch.nn as nn
import torch.optim as optim
from torchvision import datasets, transforms
from torch.utils.data import DataLoader, Subset
Step 2: Load and Prepare the Dataset
- Convert each image into a PyTorch tensor.
- Download and load the MNIST training dataset.
- Select only the first 5,000 samples to reduce execution time.
# Convert images to tensors
transform = transforms.ToTensor()
# Load the MNIST training dataset
train_dataset = datasets.MNIST(
    root="./data",
    train=True,
    download=True,
    transform=transform
)
# Use only the first 5000 samples
train_dataset = Subset(train_dataset, range(5000))
# Create a DataLoader
train_loader = DataLoader(
    train_dataset,
    batch_size=32,
    shuffle=True
)
Step 3: Define the Neural Network with Batch Normalization
-  Create a custom neural network by inheriting from nn.Module .
- Flatten each 28 × 28 image into a vector of 784 features.
- Add a fully connected layer with 64 neurons.
class Model(nn.Module):
    def __init__(self):
        super().__init__()
        self.flatten = nn.Flatten()
        self.fc1 = nn.Linear(784, 64)
        self.bn = nn.BatchNorm1d(64)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(64, 10)
    def forward(self, x):
        x = self.flatten(x)
        x = self.fc1(x)
        x = self.bn(x)
        x = self.relu(x)
        x = self.fc2(x)
        return x
Step 4: Create the Model and Define the Loss Function and Optimizer
- Create an instance of the neural network.
- Use CrossEntropyLoss for multi-class classification.
- Use the Adam optimizer with a learning rate of 0.001 to update the model parameters.
model = Model()
criterion = nn.CrossEntropyLoss()
optimizer = optim.Adam(
    model.parameters(),
    lr=0.001
)
Step 5: Train the Model
- Train the model for 2 epochs.
- Reset the gradients before processing each mini-batch.
- Perform a forward pass to generate predictions.
- Compute the loss between predictions and actual labels.
for epoch in range(2):
    running_loss = 0.0
    for images, labels in train_loader:
        optimizer.zero_grad()
        outputs = model(images)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()
        running_loss += loss.item()
    print(f"Epoch {epoch+1}, Loss: {running_loss / len(train_loader):.4f}")
Output:
Epoch 1, Loss: 0.5648
Epoch 2, Loss: 0.2317
You can download the complete code from here.
Applications
- Image Classification: Used in deep Convolutional Neural Networks (CNNs) such as ResNet and VGG to improve training stability and classification accuracy.
- Object Detection: Helps object detection models like Faster R-CNN and YOLO converge faster by maintaining stable feature distributions during training.
- Medical Image Analysis: Improves the training of deep learning models for tasks such as disease detection, tumor segmentation, and medical image classification.
- Speech Recognition: Normalizes activations in speech recognition networks, enabling more stable learning from audio features.
- Transfer Learning: Fine-tuning pretrained deep learning models becomes more reliable as Batch Normalization helps adapt feature representations to new datasets.
Advantages
- Normalizing activations allows the network to converge faster, reducing the number of training epochs required.
- Stable activation distributions enable the use of larger learning rates without causing unstable optimization.
- Reduces the effects of vanishing and exploding gradients, making it easier to train deep neural networks.
- Models become less dependent on carefully initialized weights, simplifying the training process.
Limitations
- Very small mini-batches produce unreliable mean and variance estimates, reducing the effectiveness of normalization.
- Computing batch statistics introduces extra operations, slightly increasing training time and memory usage.
- Training uses mini-batch statistics, while inference relies on stored moving averages, requiring proper management of running statistics.
- Models such as RNNs and Transformers often achieve better performance with Layer Normalization because it does not depend on batch statistics.
