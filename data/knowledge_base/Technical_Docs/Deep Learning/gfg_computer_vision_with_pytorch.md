# Computer Vision with PyTorch

> Source: https://www.geeksforgeeks.org/deep-learning/computer-vision-with-pytorch/

PyTorch is a powerful framework applicable to various computer vision tasks. The article aims to enumerate the features and functionalities within the context of computer vision that empower developers to build neural networks and train models. It also demonstrates how PyTorch framework can be utilized for computer vision tasks.
AI can use various technologies like computer vision, which facilitates the customization and experimentation, thus allowing researchers and developers to come up with the best methods of solving serious vision related problems.
- Image Classification: Image includes becomes to figure out what objects (for instance, dog, car and beach ) are featured in it.
- Object Detection: Obtain an image, locate the position of the objects, and draw boxes around them by example the individual, car, and traffic sign (people images).
- Image Segmentation: The segmentation of an object into different portions (e.g., background, foreground objects and respective parts of an object) can be done by dividing the image in different regions attributed to distinct features.
- Video Processing: What is important in Video Analytic for example identifying activities (such as whether a person is walking, running or dancing), recognizing objects on the video (it can be sport, news or entertainments) or following the object when it moves.
PyTorch Capabilities for Computer Vision Tasks
- It supports Torchvision which is a PyTorch library and it is given with some pre-trained models, datasets, and tools designed specifically for computer vision tasks. It also gives researchers an access to popular deep learning models like ResNet, VGG, and DenseNet, which they can be used to build their model.
- PyTorch manages the load easily and also allows users to prepare image datasets for training their models. It consists of some standard datasets like ImageNet, CIFAR, and COCO which can be used for the own custom datasets.
- It supports data augmentation with PyTorch's TorchVision transforms. It can be used for random transformations like cropping, resizing, and color tweaks into the images during training, which helps the model to get better.
- This integrates with CUDA, allowing users to leverage the power of its GPU for accelerating the training of deep learning models. This can increase the model to speed up the training process, especially for large datasets and complex architectures.
- It have dynamic computation graph which allows users to approach the model & allows them to create and modify computational graphs during runtime. This enables flexibility which let users to experiment the different model architectures and control flows easily, which is great for rapid development in computer vision tasks.
- This also provides automatic differentiation which is a key feature of PyTorch's autograd engine. It offers efficiently computes gradients for training the models, simplifying the complex neural network architectures and optimize the algorithms used in the computer vision.
Computer Vision Hands on with PyTorch
In this, we will use the CIFAR-10 dataset, a popular dataset for image classification. This contains 60,000 32x32 color images in 10 classes, with 6,000 images per class so, We'll load the dataset, prepare data loaders, build a simple convolutional neural network (CNN) as a baseline model, and perform evaluation.
- We import the necessary libraries including torch for PyTorch functionalities and torchvision for datasets and transformations.
- We define transformations to normalize the data using transforms.Compose.
Step 1: Loading the Dataset
We are going to Load the CIFAR-10 dataset using torchvision.datasets.CIFAR10 and create data loaders for training and testing sets using torch.utils.data.DataLoader.
import torch
import torchvision
import torchvision.transforms as transforms
import torch.nn as nn
import torch.optim as optim
# Step 1: Loading the CIFAR-10 dataset
transform = transforms.Compose([
    transforms.ToTensor(),
    transforms.Normalize((0.5, 0.5, 0.5), (0.5, 0.5, 0.5))  # Normalize to [-1, 1]
])
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
Step 2: Defining the Model
In this step, we are preparing data loaders for training and testing. In this, we will define the classes of the dataset and define a simple CNN model (SimpleCNN) using nn.Module.
# Step 2: Defining the CNN model
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
        x = self.pool(torch.relu(self.conv1(x)))
        x = self.pool(torch.relu(self.conv2(x)))
        x = x.view(-1, 16 * 5 * 5)
        x = torch.relu(self.fc1(x))
        x = torch.relu(self.fc2(x))
        x = self.fc3(x)
        return x
net = Net()
Step 3: Defining Loss Function and optimizer
Now, we shall be building a simple CNN model as a baseline for which we define loss function using (nn.CrossEntropyLoss) and optimizer using (optim.SGD).
# Step 3: Defining loss function and optimizer
criterion = nn.CrossEntropyLoss()
optimizer = optim.SGD(net.parameters(), lr=0.001, momentum=0.9)
Step 4: Model Training Process
Now we will be training the model by using a couple of epochs. In this step, we define some crucial points while training a couple of epochs like Data Loading, Forward Pass, Compute Loss etc.
# Step 4: Training the model
for epoch in range(2):  # loop over the dataset multiple times
    running_loss = 0.0
    for i, data in enumerate(trainloader, 0):
        inputs, labels = data
        optimizer.zero_grad()
        outputs = net(inputs)
        loss = criterion(outputs, labels)
        loss.backward()
        optimizer.step()
        running_loss += loss.item()
        if i % 2000 == 1999:  # print every 2000 mini-batches
            print('[%d, %5d] loss: %.3f' %
                  (epoch + 1, i + 1, running_loss / 2000))
            running_loss = 0.0
print('Finished Training')
Output:
[1,  2000] loss: 2.140
[1, 4000] loss: 1.808
[1, 6000] loss: 1.638
[1, 8000] loss: 1.562
[1, 10000] loss: 1.505
[1, 12000] loss: 1.441
[2, 2000] loss: 1.378
[2, 4000] loss: 1.356
[2, 6000] loss: 1.343
[2, 8000] loss: 1.330
[2, 10000] loss: 1.282
[2, 12000] loss: 1.292
Finished Training
Step 5: Model Evaluation
In this step, we shall evaluate the network on the test dataset by iterating through the test data loader. Lets Evaluate the model on the test set. 
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
Accuracy of the network on the 10000 test images: 54 %
