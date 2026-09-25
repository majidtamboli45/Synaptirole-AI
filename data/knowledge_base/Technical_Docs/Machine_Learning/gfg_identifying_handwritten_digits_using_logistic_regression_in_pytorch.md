# Identifying handwritten digits using Logistic Regression in PyTorch

> Source: https://www.geeksforgeeks.org/machine-learning/identifying-handwritten-digits-using-logistic-regression-pytorch/

Logistic Regression is a very commonly used statistical method that allows us to predict a binary output from a set of independent variables. The various properties of logistic regression and its Python implementation have been covered in this article previously. Now, we shall find out how to implement this in PyTorch, a very popular deep learning library that is being developed by Facebook.
Now, we shall see how to classify handwritten digits from the MNIST dataset using Logistic Regression in PyTorch. Firstly, you will need to install PyTorch into your Python environment. The easiest way to do this is to use the pip or conda tool. Visit pytorch.org and install the version of your Python interpreter and the package manager that you would like to use.
With PyTorch installed, let us now have a look at the code. Write the three lines given below to import the required library functions and objects.
import torch
import torch.nn as nn
import torchvision.datasets as dsets
import torchvision.transforms as transforms
from torch.autograd import Variable
Here, the torch.nn module contains the code required for the model, torchvision.datasets contain the MNIST dataset. It contains the dataset of handwritten digits that we shall be using here. The torchvision.transforms module contains various methods to transform objects into others. Here, we shall be using it to transform from images to PyTorch tensors. Also, the torch.autograd module contains the Variable class amongst others, which will be used by us while defining our tensors.
Next, we shall download and load the dataset to memory.
# Set the batch size
batch_size = 64
# MNIST Dataset (Images and Labels)
train_dataset = dsets.MNIST(root ='./data', 
                            train = True, 
                            transform = transforms.ToTensor(),
                            download = True)
test_dataset = dsets.MNIST(root ='./data', 
                           train = False, 
                           transform = transforms.ToTensor())
# Dataset Loader (Input Pipeline)
train_loader = torch.utils.data.DataLoader(dataset = train_dataset, 
                                           batch_size = batch_size, 
                                           shuffle = True)
test_loader = torch.utils.data.DataLoader(dataset = test_dataset, 
                                          batch_size = batch_size, 
                                          shuffle = False)
# This code is modified by Susobhan Akhuli
Now, we shall define our hyperparameters.
# Hyper Parameters 
input_size = 784
num_classes = 10
num_epochs = 5
batch_size = 100
learning_rate = 0.001
In our dataset, the image size is 28*28. Thus, our input size is 784. Also, 10 digits are present in this and hence, we can have 10 different outputs. Thus, we set num_classes as 10. Also, we shall train five times on the entire dataset. Finally, we will train in small batches of 100 images each so as to prevent the crashing of the program due to memory overflow.
After this, we shall be defining our model as below. Here, we shall initialize our model as a subclass of torch.nn.Module and then define the forward pass. In the code that we are writing, the softmax is internally calculated during each forward pass and hence we do not need to specify it inside the forward() function.
class LogisticRegression(nn.Module):
    def __init__(self, input_size, num_classes):
        super(LogisticRegression, self).__init__()
        self.linear = nn.Linear(input_size, num_classes)
    def forward(self, x):
        out = self.linear(x)
        return out
Having defined our class, now we instantiate an object for the same.
model = LogisticRegression(input_size, num_classes)
Next, we set our loss function and the optimizer. Here, we shall be using the cross-entropy loss and for the optimizer, we shall be using the stochastic gradient descent algorithm with a learning rate of 0.001 as defined in the hyperparameter above.
criterion = nn.CrossEntropyLoss()
optimizer = torch.optim.SGD(model.parameters(), lr = learning_rate)
Now, we shall start the training. Here, we shall be performing the following tasks:
- Reset all gradients to 0.
- Make a forward pass.
- Calculate the loss.
- Perform backpropagation.
- Update all weights.
# Training the Model 
for epoch in range(num_epochs): 
	for i, (images, labels) in enumerate(train_loader): 
		images = Variable(images.view(-1, 28 * 28)) 
		labels = Variable(labels) 
		# Forward + Backward + Optimize 
		optimizer.zero_grad() 
		outputs = model(images) 
		loss = criterion(outputs, labels) 
		loss.backward() 
		optimizer.step() 
		if (i + 1) % 100 == 0: 
			print('Epoch: [% d/% d], Step: [% d/% d], Loss: %.4f'
				% (epoch + 1, num_epochs, i + 1, 
					len(train_dataset) // batch_size, loss.item())) # Use loss.item() to get the scalar value
# This code is modified by Susobhan Akhuli
Finally, we shall be testing out the model by using the following code.
# Test the Model
correct = 0
total = 0
for images, labels in test_loader:
    images = Variable(images.view(-1, 28 * 28))
    outputs = model(images)
    _, predicted = torch.max(outputs.data, 1)
    total += labels.size(0)
    correct += (predicted == labels).sum()
print('Accuracy of the model on the 10000 test images: % d %%' % (
            100 * correct / total))
Accuracy of the model on the 10000 test images:  84 %
Assuming that you performed all steps correctly, you will get an accuracy of 82%, which is far off from today's state-of-the-art model, which uses a special type of neural network architecture. For your reference, you can find the entire code for this article below:
import torch 
import torch.nn as nn 
import torchvision.datasets as dsets 
import torchvision.transforms as transforms 
from torch.autograd import Variable 
# MNIST Dataset (Images and Labels) 
train_dataset = dsets.MNIST(root ='./data', 
							train = True, 
							transform = transforms.ToTensor(), 
							download = True) 
test_dataset = dsets.MNIST(root ='./data', 
						train = False, 
						transform = transforms.ToTensor()) 
# Dataset Loader (Input Pipeline) 
train_loader = torch.utils.data.DataLoader(dataset = train_dataset, 
										batch_size = batch_size, 
										shuffle = True) 
test_loader = torch.utils.data.DataLoader(dataset = test_dataset, 
										batch_size = batch_size, 
										shuffle = False) 
# Hyper Parameters 
input_size = 784
num_classes = 10
num_epochs = 5
batch_size = 100
learning_rate = 0.001
# Model 
class LogisticRegression(nn.Module): 
	def __init__(self, input_size, num_classes): 
		super(LogisticRegression, self).__init__() 
		self.linear = nn.Linear(input_size, num_classes) 
	def forward(self, x): 
		out = self.linear(x) 
		return out 
model = LogisticRegression(input_size, num_classes) 
# Loss and Optimizer 
# Softmax is internally computed. 
# Set parameters to be updated. 
criterion = nn.CrossEntropyLoss() 
optimizer = torch.optim.SGD(model.parameters(), lr = learning_rate) 
# Training the Model 
for epoch in range(num_epochs): 
	for i, (images, labels) in enumerate(train_loader): 
		images = Variable(images.view(-1, 28 * 28)) 
		labels = Variable(labels) 
		# Forward + Backward + Optimize 
		optimizer.zero_grad() 
		outputs = model(images) 
		loss = criterion(outputs, labels) 
		loss.backward() 
		optimizer.step() 
		if (i + 1) % 100 == 0: 
			print('Epoch: [% d/% d], Step: [% d/% d], Loss: %.4f'
				% (epoch + 1, num_epochs, i + 1, 
					len(train_dataset) // batch_size, loss.item())) 
# Test the Model 
correct = 0
total = 0
for images, labels in test_loader: 
	images = Variable(images.view(-1, 28 * 28)) 
	outputs = model(images) 
	_, predicted = torch.max(outputs.data, 1) 
	total += labels.size(0) 
	correct += (predicted == labels).sum() 
print('Accuracy of the model on the 10000 test images: % d %%' % ( 
			100 * correct / total)) 
# This code is modified by Susobhan Akhuli
Epoch: [ 1/ 5], Step: [ 100/ 600], Loss: 2.2127
Epoch: [ 1/ 5], Step: [ 200/ 600], Loss: 2.1009
Epoch: [ 1/ 5], Step: [ 300/ 600], Loss: 2.0020
Epoch: [ 1/ 5], Step: [ 400/ 600], Loss: 1.9426
Epoch: [ 1/ 5], Step: [ 500/ 600], Loss: 1.9161
Epoch: [ 1/ 5], Step: [ 600/ 600], Loss: 1.7942
Epoch: [ 2/ 5], Step: [ 100/ 600], Loss: 1.7794
Epoch: [ 2/ 5], Step: [ 200/ 600], Loss: 1.6350
Epoch: [ 2/ 5], Step: [ 300/ 600], Loss: 1.6210
Epoch: [ 2/ 5], Step: [ 400/ 600], Loss: 1.6226
Epoch: [ 2/ 5], Step: [ 500/ 600], Loss: 1.5117
Epoch: [ 2/ 5], Step: [ 600/ 600], Loss: 1.3767
Epoch: [ 3/ 5], Step: [ 100/ 600], Loss: 1.4091
Epoch: [ 3/ 5], Step: [ 200/ 600], Loss: 1.3804
Epoch: [ 3/ 5], Step: [ 300/ 600], Loss: 1.3727
Epoch: [ 3/ 5], Step: [ 400/ 600], Loss: 1.2697
Epoch: [ 3/ 5], Step: [ 500/ 600], Loss: 1.2719
Epoch: [ 3/ 5], Step: [ 600/ 600], Loss: 1.2932
Epoch: [ 4/ 5], Step: [ 100/ 600], Loss: 1.3018
Epoch: [ 4/ 5], Step: [ 200/ 600], Loss: 1.2399
Epoch: [ 4/ 5], Step: [ 300/ 600], Loss: 1.1748
Epoch: [ 4/ 5], Step: [ 400/ 600], Loss: 1.0913
Epoch: [ 4/ 5], Step: [ 500/ 600], Loss: 1.1653
Epoch: [ 4/ 5], Step: [ 600/ 600], Loss: 1.0840
Epoch: [ 5/ 5], Step: [ 100/ 600], Loss: 1.0235
Epoch: [ 5/ 5], Step: [ 200/ 600], Loss: 1.0301
Epoch: [ 5/ 5], Step: [ 300/ 600], Loss: 0.9974
Epoch: [ 5/ 5], Step: [ 400/ 600], Loss: 0.9303
Epoch: [ 5/ 5], Step: [ 500/ 600], Loss: 1.0271
Epoch: [ 5/ 5], Step: [ 600/ 600], Loss: 0.9955
Accuracy of the model on the 10000 test images: 82 %
References:
Get the complete notebook link here:
Colab Link : click here.
