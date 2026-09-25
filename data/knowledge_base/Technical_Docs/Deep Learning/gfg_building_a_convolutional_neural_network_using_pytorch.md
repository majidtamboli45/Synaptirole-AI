# Building a Convolutional Neural Network using PyTorch

> Source: https://www.geeksforgeeks.org/deep-learning/building-a-convolutional-neural-network-using-pytorch/

importingConvolutional Neural Networks (CNNs) are deep learning models used for image processing and analysis. They learn hierarchical features from images using layers like convolution and pooling.
- Extract features such as edges, textures, and patterns automatically.
- Use convolution, pooling, and fully connected layers for learning.
- Implemented in PyTorch for building, training, and evaluating models.
Implementation
1. Importing necessary libraries
We are importing necessary modules from the PyTorch library.
import torch
import torch.nn as nn
import torch.optim as optim
import torchvision
import torchvision.transforms as transforms
import torch.nn.functional as F
2. Preparing Dataset
Preparing the CIFAR-10 dataset in PyTorch by applying image transformations, loading the data, and using data loaders for batching and shuffling. The dataset consists of 10 class labels.
transform = transforms.Compose(
    [transforms.ToTensor(),
     transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))])
trainset = torchvision.datasets.CIFAR10(root='./data', train=True,
                                        download=True, transform=transform)
trainloader = torch.utils.data.DataLoader(trainset, batch_size=4,
                                          shuffle=True, num_workers=2)
testset = torchvision.datasets.CIFAR10(root='./data', train=False,
                                       download=True, transform=transform)
testloader = torch.utils.data.DataLoader(testset, batch_size=4,
                                         shuffle=False, num_workers=2)
classes = ('plane', 'car', 'bird', 'cat',
           'deer', 'dog', 'frog', 'horse', 'ship', 'truck')
3. Define CNN Architecture
Defining a CNN model in PyTorch using a custom class.
- Create class Net inheriting fromnn.Module .
- Use two convolutional layers with ReLU and max pooling.
- Add three fully connected (dense) layers.
- Flatten feature maps before passing to dense layers.
- Instantiate the model as net .
class Net(nn.Module):
    def __init__(self):
        super(Net, self).__init__()
        self.conv1 = nn.Conv2d(3, 6, 5)
        self.pool = nn.MaxPool2d(2, 2)
        self.conv2 = nn.Conv2d(6, 16, 5)
        self.fc1 = nn.Linear(16 * 5 * 5, 120)
        self.fc2 = nn.Linear(120, 84)
        self.fc3 = nn.Linear(84, 10)
    def forward(self, x):
        x = self.pool(F.relu(self.conv1(x)))
        x = self.pool(F.relu(self.conv2(x)))
        x = x.view(-1, 16 * 5 * 5)
        x = F.relu(self.fc1(x))
        x = F.relu(self.fc2(x))
        x = self.fc3(x)
        return x
net = Net()
4. Defining Loss Function and Optimizer
Setting up the training components for the model.
- nn.CrossEntropyLoss(): Computes loss for multi-class classification.
- optim.SGD: Updates model weights using stochastic gradient descent.
- Learning rate (0.001) & momentum (0.9): Control update speed and stability.
criterion = nn.CrossEntropyLoss()
optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)
5. Training Network
- Train the model (net ) for 2 epochs.
- Use the defined loss function and optimizer for updates.
- Print average loss every 2000 mini-batches to monitor training.
for epoch in range(2):
    running_loss = 0.0
    for i, data in enumerate(trainloader, 0):
        inputs, labels = data
        optimizer.zero_grad()
        outputs = net(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()
        running_loss += loss.item()
        if i % 2000 == 1999:
            print('[%d, %5d] loss: %.3f' %
                  (epoch + 1, i + 1, running_loss / 2000))
            running_loss = 0.0
print('Finished Training')
Output:
6. Testing Network
- Generate predictions using the trained model (net ).
- Compare predictions with true labels.
- Compute overall model accuracy.
correct = 0
total = 0
with torch.no_grad():
    for data in testloader:
        images, labels = data
        outputs = net(images)
        _, predicted = torch.max(outputs.data, 1)
        total += labels.size(0)
        correct += (predicted == labels).sum().item()
print('Accuracy of the network on the 10000 test images: %d %%' % (
    100 * correct / total))
Output:
Accuracy of the network on the 10000 test images: 53 %
The model achieves 55% accuracy, indicating under performance. Tuning hyperparameters or using optimizers like Adam can improve results.
You can download source code from here.
