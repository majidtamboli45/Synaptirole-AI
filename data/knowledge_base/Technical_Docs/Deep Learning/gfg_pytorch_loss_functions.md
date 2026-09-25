# PyTorch Loss Functions

> Source: https://www.geeksforgeeks.org/deep-learning/pytorch-loss-functions/

Loss functions are a crucial component in neural network training, as every machine learning model requires optimization, which helps in reducing the loss and making correct predictions. Without loss functions, there's no way to drive your model to make correct predictions. But what exactly are loss functions, and how do you use them? In this article, we'll look into the different loss functions available that can be used in the optimization of your models.
Loss Function
When predicting values from a model for the first time, you're not sure whether your model will land on the actual predictions or not. As the weights are initialized randomly, it's difficult for a model to predict the actual values. This is where our loss function is needed.
The loss function is an expression used to measure how close the predicted value is to the actual value. This expression outputs a value called loss, which tells us the performance of our model. By reducing this loss value in further training, the model can be optimized to output values that are closer to the actual values.
Loss Functions in Pytorch
Pytorch is a popular open-source Python library for building deep learning models effectively. It provides us with a ton of loss functions that can be used for different problems. There are basically three types of loss functions in probability: classification, regression, and ranking loss functions.
Regression losses are mostly for problems that deal with continuous values, such as predicting age or prices. On the other hand, classification losses are for problems that deal with discrete values, such as detecting whether an email is spam or ham. The relative distances between values are predicted by ranking losses.
All the loss functions are packaged inside the nn module, which is the base class in pytorch for working with neural networks. So, it is pretty easy to import and use all the loss functions.
#import nn module
import torch.nn as nn
mse_loss_fn = nn.MSELoss()
The above code will store the MSELoss function in the mse_loss_fn variable which can then used to return the loss value by passing the correct parameters as shown below.
loss = mse_loss_fn(predicted_value, target)
#predicted value is what the model is predicting 
#target is the actual value
Now let's look into the workings of various types of loss functions available in pytorch.
L1 loss
The L1 loss function also called Mean Absolute Error (MAE) computes the average of the sum of absolute differences between the predicted and the actual values. It first calculates the absolute differences between the predicted and actual values and then sums all the values. Finally, it takes the average to calculate the loss. L1 loss is mostly used for regression problems and is more robust to outliers.
Formula: 
Here,
- n represents the total number of observations or samples
- yirepresents the actual or observed value for the ithsample,
- ŷi represents the predicted or estimated value for the ith sample.
Syntax:
torch.nn.L1Loss(size_average=None, reduce=None, reduction='mean')
#initialising the loss function
loss = nn.L1Loss()
#randomly initialising the input and the target value...input is considered as predicted value here.
input = torch.randn(2, 4, requires_grad=True)
target = torch.randn(2, 4)
#passing both the values inside the loss function.
output = loss(input, target)
#backpropagation
output.backward()
print(output)
Output:
tensor(2.0804, grad_fn=<MseLossBackward0>)
Advantage
- MAE is more robust to outliers compared to Mean Squared Error (MSE) because it takes the absolute difference, reducing the impact of extremely large errors.
- The MAE loss is straightforward to interpret as it represents the average magnitude of errors, making it easier to communicate the model's performance to stakeholders.
Disadvantage
- MAE treats all errors equally, regardless of their magnitude. This can be a disadvantage in cases where distinguishing between small and large errors is important.
- The gradient of MAE is a constant value, which can slow down convergence during optimization, especially in comparison to MSE, where the gradient decreases as the error decreases.
Mean Square Error
Also known as L2 loss, MSE is similar to the MAE loss but instead of calculating absolute differences like we did in MAE, L2 computes the average of the squared differences between the predicted and actual values.. The main idea behind squaring is to penalise the model for large difference so that the model avoid larger differences.
This is also used for regression problems but it is less robust than MAE. It is default loss function for most Pytorch regression problems
Formula:
Here,
- n represents the total number of observations or samples,
- yi represents the actual or observed value for the ith sample,
- ŷi represents the predicted or estimated value for the ith sample.
Syntax:
torch.nn.MSELoss(size_average=None, reduce=None, reduction='mean')
import torch
from torch import nn
#initialising the loss function
loss = nn.MSELoss()
#randomly initialising the input and the target value...input is considered as predicted value here.
input = torch.randn(2, 4, requires_grad=True)
target = torch.randn(2, 4)
#passing both the values inside the loss function.
output = loss(input, target)
#backpropagation
output.backward()
print(output)
Output:
tensor(0.9743, grad_fn=<MeanBackward0>)
Advantages:
- Suitable for regression tasks where the final goal is to minimize the squared differences between predicted values and actual values.
- Differentiable and convex.
Disadvantages:
- Sensitive to outliers due to the squaring operation, which deviates the results in the optimization process.
- Not ideal for tasks where errors should be penalized differently.
Huber Loss
This loss is used while tackling regression problems especially when dealing with outliers. It combines both MAE( Mean Absolute Error ) and MSE( Mean Squared Error) and which loss will be used depends upon the delta value. First it calculates the difference between actual and predicted values. If that difference is less than the threshold value i.e. delta, it behaves like MAE, otherwise it switches to MSE.
Formula:
Here,
- x represents the predicted values,target represents the ground truth or target values,
- δ is a parameter controlling the threshold for switching between quadratic and linear loss
Syntax:
torch.nn.HuberLoss(reduction='mean', delta=1.0)
Advantage-
- Less sensitive to outliers than MSE but still provide a more balanced approach to evaluating the performance of regression models compared to MAE.
Disadvantage-
- Introduces a new hyper parameter and the optimization of that leads to more complexity in the model.
MAE, MSE and Huber loss are used in regression problems but, which one should we use. MSE can be used when you want to penalize larger errors more heavily. It's useful when the data does not have significant outliers and you assume that the errors are normally distributed. MAE can be used when you want robust loss function that is less affected by outliers. And Huber loss can be used when you want to compromise the benefits of both MAE and MSE.
Cross Entropy Loss
Cross Entropy Loss function is used in classification problems, this loss function computes the differences between two probability distributions for a given set of random variables. The output of the network is a softmax layer which ensures that the final probability value remains in the range of 0 to 1.
Used in binary classification tasks, for which it’s the default loss function in Pytorch.
Formula:
Here,
- x represents the predicted values,
- target represents the ground truth or target values.
Syntax:
torch.nn.CrossEntropyLoss(weight=None, size_average=None, ignore_index=- 100, reduce=None, reduction='mean', label_smoothing=0.0)
#initialising the loss function
loss = nn.CrossEntropyLoss()
#randomly initialising the input and the target value...input is considered as predicted value here.
input = torch.randn(2, 4, requires_grad=True)
target = torch.empty(2, dtype=torch.long).random_(4)
#passing both the values inside the loss function.
output = loss(input, target)
#backpropagation
output.backward()
print(output)
Output:
tensor(1.5564, grad_fn=<NllLossBackward0>)
Advantages-
- Invariant to scaling and shifting of the predicted probabilities.
- Provides a measure of uncertainty which helps in better understanding the model predictions.
Disadvantages-
- Sensitive to outliers and imbalanced data (can be biased towards majority class).
- It does not provide a similarity between classes which can be required in some cases.
Negative Log Likelihood Loss
Similar to Cross Entropy loss, this loss is also used for classification problems and uses the softmax layer to calculate the loss value. After the output of the softmax layer is calculated (i.e. a value between 0 and 1), negative log is calculated of that value. The final layer combined is called as log-softmax layer. Generally, it is used in multi-class classification problems.
Formula:
Here,
- x represents the predicted values,
- target represents the ground truth or target values
Syntax:
torch.nn.NLLLoss(weight=None, size_average=None, ignore_index=- 100, reduce=None, reduction='mean')
import torch
import torch.nn as nn
# size of input (N x C) is = 3 x 5
input = torch.randn(3, 5, requires_grad=True)
# every element in target should have 0 <= value < C
target = torch.tensor([1, 0, 4])
#initialising loss function
m = nn.LogSoftmax(dim=1)
nll_loss = nn.NLLLoss()
output = nll_loss(m(input), target)
#backpropagation
output.backward()
#printing output
print(output)
Output:
tensor(1.8755, grad_fn=<NllLossBackward0>)
Binary Cross Entropy Loss
This loss is a special class of Cross Entropy Loss which is used for binary classification problems. The output of the neural network is a sigmoid layer which ensures that the final result is either a value close to zero or close to one. As the name suggests, used for binary classification tasks.
Formula:
Here,
- x represents the predicted values,target represents the ground truth or target values,
- N represents the samples for which loss is being calculated
Syntax:
torch.nn.BCELoss(weight=None, size_average=None, reduce=None, reduction='mean')
#sigmoid layer
m = nn.Sigmoid()
#initialising the loss
loss = nn.BCELoss()
#initialising input and target
input = torch.randn(3, requires_grad=True)
target = torch.empty(3).random_(2)
output = loss(m(input), target)
#backpropagation
output.backward()
#printing the loss value
print(output)
Output:
tensor(0.6782, grad_fn=<BinaryCrossEntropyBackward0>)
Advantages:
- It is commonly used in binary classification problems. It also helps in handling imbalanced datasets.
- It encourages the model to predict high probabilities for the correct class.
Disadvantages:
- It can undergo vanishing gradient and slow convergence when the predicted probabilities are far from the true labels.
Kullback-Leibler Divergence Loss
Kullback-Leibler Divergence loss computes the difference between two probability distributions. It tells how much the divergence is if the predicted probability distribution is used instead of the target probability distribution. If the divergence is greater, the loss function will be greater. If the KL divergence loss is zero, it means both the probability distributions are the same. It is used to approximate complex functions, multi-class classification tasks and If you want to make sure that the distribution of predictions is similar to that of training data.
Formula:
Here,
- x represents the predicted values ,
- target represents the ground truth or target values.
Syntax:
torch.nn.KLDivLoss(size_average=None, reduce=None, reduction='mean', log_target=False)
#import
import torch 
from torch import nn
import torch.nn.functional as F
#initialise loss
kl_loss = nn.KLDivLoss(reduction="batchmean")
#define input
input = F.log_softmax(torch.randn(3, 5, requires_grad=True), dim=1)
#define the target value
target = F.softmax(torch.rand(3, 5), dim=1)
#passing the values of input and target to the loss function
output = kl_loss(input, target)
#print output
print(output)
Output:
tensor(0.4681, grad_fn=<DivBackward0>)
Advantages:
- It measures the difference between two probability distributions and is used frequently for tasks like variational autoencoders (VAEs).
- It is also used in training generative models and aligning the respective predicted distribution with the true distribution.
Disadvantages:
- It is not symmetric and is not suitable for a stand-alone loss function in a training classifiers.
Hinge Embedding Loss
This loss is mostly used in semi-supervised learning tasks or learning nonlinear embeddings. There's an input tensor and target labels which are between -1 and 1 i.e. binary classification. This loss measures whether two inputs are similar or dissimilar.
Syntax:
torch.nn.HingeEmbeddingLoss(margin=1.0, size_average=None, reduce=None, reduction='mean')
#importing libraries
import torch
import torch.nn as nn
#initialising random input and target variables
input = torch.randn(3, 5, requires_grad=True)
target = torch.randn(3, 5)
#initialising the loss function
hinge_loss = nn.HingeEmbeddingLoss()
#calculating the ouput by passing the input and target values
output = hinge_loss(input, target)
#backpropagation
output.backward()
#printing the output
print(output)
Output:
tensor(1.1289, grad_fn=<MeanBackward0>)
Margin Ranking Loss
Margin ranking loss function measures the relative distance between inputs between a set of inputs in the dataset where the labels contain only binary values i.e. 1 and -1. Suppose there are two inputs, when the target will be 1, the first input will be considered of higher ranking whereas in case of label being -1, the second input will be considered of higher value. Used mostly in ranking problems.
Syntax:
torch.nn.MarginRankingLoss(margin=0.0, size_average=None, reduce=None, reduction='mean')
#importing libraries
import torch
import torch.nn as nn
#initialising two inputs and target label
input_one = torch.randn(3, requires_grad=True)
input_two = torch.randn(3, requires_grad=True)
target = torch.randn(3).sign()
#initialising the loss
ranking_loss = nn.MarginRankingLoss()
#passing the values into the loss function
output = ranking_loss(input_one, input_two, target)
#backpropagation
output.backward()
#printing the output
print(output)
Output:
tensor(0.0444, grad_fn=<MeanBackward0>)
CTC Loss
Connectionist Temporal Classification (CTC) loss calculates the loss between a continuous series of inputs and a target sequence. It sums over the probability of all the possible alignments of input to target, producing a loss value which is differentiable with respect to each input node.
Syntax:
torch.nn.CTCLoss(blank=0, reduction='mean', zero_infinity=False)
There are many other losses which are not yet covered in this article such as Binary cross entropy with logits, etc. Refer the documentation to get an overview about all the loss functions available in pytorch.
In conclusion, loss functions are a crucial component in training the neural networks and pytorch does a great job in providing us with the loss functions with enough abstraction so that they can be understood and used easily.
