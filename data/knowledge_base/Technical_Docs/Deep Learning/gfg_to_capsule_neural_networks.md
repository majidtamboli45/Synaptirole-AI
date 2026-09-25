# Introduction to Capsule Neural Networks

> Source: https://www.geeksforgeeks.org/deep-learning/capsule-neural-networks-ml/

Capsule Neural Network also known as CapsNet is an artificial neural network (ANN) in machine learning to designed to overcome limitations of traditional convolutional neural networks (CNNs). The article explores the fundamentals, working and architecture of CapsNet.
Table of Content
Limitation of CNN
Convolutional Neural Networks (CNNs) represent a category of deep learning models specifically tailored for processing structured grid data. Because of their capacity to automatically extract hierarchical representations from input, CNNs—whose design is inspired by the visual processing found in the human brain—have emerged as a key component of deep learning.
Convolutional layers play a major role in the fundamental design of Convolutional Neural Networks (CNNs), which are used to identify hierarchical patterns in images. However, deep learning pioneer Geoffrey Hinton criticizes the widely used max-pooling procedure, which is used to down sample spatial information. Hinton refers to max-pooling as a "big mistake" because, although effective in expanding the network's field of vision and retrieving high-level characteristics, it discards important information. The success of the pooling operation is viewed as a "disaster" because it conceals the underlying issue with the network, which is the loss of hierarchical structures and geographical relationships.
To address the shortcomings of conventional CNNs, Hinton and his colleagues proposed an alternative called Capsule Networks, which introduce capsules that maintain spatial hierarchies. This allows for better handling of pose variations, deformations, and complex spatial relationships.
What are Capsule Neural Networks?
A Capsule Neural Network (CapsNet) is an artificial neural network (ANN) in machine learning designed to emulate hierarchical relationships, drawing inspiration from the organizational principles of biological neural structures. CapsNets seek to replicate the hierarchical organization observed in biological neural systems.
Capsules in a Capsule Network
Fundamental building blocks called capsules in a capsule network (CapsNet) are created to get around drawbacks in conventional neural networks. Capsule neurons, in contrast to regular neurons, are better able to handle hierarchical structures and pose variations because they encapsulate both the activation information and spatial relationships. Each capsule outputs a set of pose parameters, including orientation and position, in addition to an activation that represents a particular entity or portion of an object. By allowing the network to iteratively refine the coupling coefficients between capsules based on the agreement of their pose parameters, capsules enable dynamic routing. As a result, CapsNets can better recognize intricate patterns in data, capture complex spatial hierarchies, and improve generalization.
Working of a Capsule Network
Unlike neurons, capsules process inputs by encapsulating the result in informative vectors through an affine transformation. In contrast to neurons that work with scalars, capsules work with vectors. Steps for artificial neurons include scalar activation, sum computation, and weighted connections.
Comparatively, capsules go through more steps:
- Input vectors multiply with spatial-relationship-encoded weight matrices
- Further multiplication with weights
- Weighted sum of input vectors
- Activation function application for vector output.
Let's see the working of a capsule network in detail:
1. Input vectors multiply with spatial-relationship-encoded weight matrices
The input vectors in the neural network represent either the initial input or information from a preceding layer. These vectors undergo a transformation through multiplication with weight matrices. These weight matrices encode spatial relationships within the data. For instance, if one object is positioned symmetrically around another and shares similar proportions, the resulting product of the input vector and weight matrix encapsulates a high-level feature indicative of this spatial arrangement. This process allows the neural network to discern and capture meaningful relationships and features as it progresses through its layers. Here, we are multiplying the input vector by the weight matrix.
2. Further multiplication with weights
In this phase, a weighted adjustment in a capsule network is applied to the outputs obtained from the previous step. In contrast to conventional ANNs, which update weights via error-based backpropagation, Capsule Networks use dynamic routing to change weights. The weights assigned to the connections between neurons are determined by this unique methodology.
Capsule Networks create robust associations between nearby high-level capsules and low-level capsules by dynamically adjusting weights. The computation entails calculating the separation between dense clusters that represent low-level capsule predictions and the outputs of the affine transformation. When low-level capsule predictions are similar, these clusters form and are positioned closely. The distance metric determines the weight assignment so that the high-level capsule closest to the current prediction cluster is given a higher weight and the other capsules have lower weights according to their distances.
3. Weighted sum of input vectors
Calculate the input vectors' weighted sum.
4. Activation function application for vector output
Capsule activation functions guarantee dynamic and rich representations of vector outputs. The squashing function, which normalizes the vector length while maintaining its orientation, is a popular option. The "Squashing Function" denoted as:
Where, sj is the sum of the input vectors and vj is the output obtained after applying non-linearity function. It compresses the vector sj to a magnitude between 0 and 1. This enables robust hierarchical representations by enabling capsules to capture intricate interactions among features. Capsules can transmit subtle information that is essential for complex pattern identification in tasks like computer vision because of the normalizing property of the squashing function, which improves robustness to changes.
What is Dynamic Routing?
Dynamic routing in Capsule Networks involves lower capsules sending data to the most suitable parent capsule based on dot product. The parent capsule is chosen through an agreement mechanism, utilizing the highest dot product between prediction vectors from lower capsules and the weight matrix.
Dynamic routing can be even explained through the following example :
Suppose, if we provide an image to a system so that it can recognize it and state what it is? The picture is that of a house in four different types of viewpoints, CNN can recognize the front view of the house very easily that was taught during its training but it will have serious troubles in identifying the picture of the house from the top view so here capsules come into play. Capsules detect the roof and walls very easily but not any roof can be a house so, they analyze the constant part in the image i.e the co-ordinate frame of the house capsule wrt to both roof and walls. The prediction is done by both the roof and the walls so as to decide whether the object is a house or not. These predictions are then sent to the mid-level capsule. If the prediction of the roof and the walls matches each other only then the object is said to be a house, this process is called Routing by agreement.
Dynamic Routing Algorithm
The dynamic Routing algorithm is described below:
function dynamic_routing(u, r, l):
# u: Affine transformed input, r: Number of routing iterations, l: Layer number
b = initialize_temporary_values(u)
for iteration in range(r):
c = softmax(b) # Ensure non-negative c values summing to 1
s = weighted_sum(u, c)
v = squash(s) # Apply non-linearity
if iteration < r - 1:
b += update_weights(u, v) # Update weights for the next iteration
return v # Final output vector after dynamic routing
- b = initialize_temporary_values(u): Using the affine transformed input u as a basis, initialize temporary values b.
- for iteration in range(r): Iterate for the specified number of routing iterations (r).
- c = softmax(b) : To get the routing weights c, apply the softmax function to the temporary values b. This guarantees that the sum of the c values is 1.
- s = weighted_sum(u, c) : Using the computed routing weights c, determine the weighted sum of the inputs u.
- v = squash(s) : To obtain the output vector v, apply the squash non-linearity to the weighted sum.
- if iteration < r - 1: Verify that this is not the final iteration.
- b += update_weights(u, v) :  Using the update function based on inputs u and output vector v, update the temporary values b for the subsequent iteration.
Architecture of Capsule networks
A kind of neural network architecture known as a capsule network (CapsNet) was created to get around some of the drawbacks of conventional convolutional neural networks (CNNs), particularly with regard to managing hierarchical relationships and perspective fluctuations. Capsule Networks' architecture is made up of various essential elements:
Encoder Network
It takes the image input and displays the image as a vector that contains all the instantiation parameters needed to render the image. Encoder further encapsulates the :
- Convolutional layer - A convolutional layer is frequently used at the start of a CapsNet to extract low-level features from the input photos.
- PrimaryCaps layer - This layer uses clusters of neurons known as capsules to record significant patterns. Every capsule in the input represents an instantiation parameter (like posture) of a certain kind of creature.
- DigitCaps layer - The center of CapsNets is the DigitCaps layer. In this layer, each capsule stands for a certain kind of thing (such a class of digits). The instantiation parameters and the likelihood that the entity will exist are both encoded in these capsules.
The instantiation parameters are ultimately encoded using a reconstruction loss. Every training example's loss is computed against every output class. All of the digit capsules' losses added together equals the total loss. Here is the loss equation:
Where:
- Lk is the margin loss for the k-th digit capsule.
- Tk is a binary indicator.
- vk is the activity vector of the k-th digit capsule.
- ||vk || is length of the activity vector.
- m+ is the positive margin.
- m- is the negative margin.
- \lambda is a down-weighting factor for the loss from incorrect digit capsules.
This loss function promotes the length of the correct digit capsule to be greater than m+ and the length of the incorrect digit capsules to be less than m-. The contribution of both accurate and inaccurate predictions to the total loss is balanced by the down-weighting factor, or . Usually, the parameters m- and m+ are hyperparameters that can be adjusted in the training process.
Decoder Network
In Capsule Networks, the Decoder Network is essential for recreating input images from the data contained in the DigitCapsules. The instantiation properties (such pose and viewpoint) of the chosen DigitCapsules are utilized to rebuild the input data in the Capsule Network following the dynamic routing procedure. The decoder's fully-connected layers enable this reconstruction. In order to facilitate the creation of a reconstruction that closely resembles the original input, the instantiation parameters are converted to the original input space. In order to promote accurate picture recovery, the loss for reconstruction is usually computed using the Euclidean distance between the reconstructed image and the original input. Reconstruction improves classification accuracy and meaningful picture reconstruction, which furthers the overall training goal of Capsule Networks.
Advantages of Capsule Networks
Compared to more conventional neural network architectures like convolutional neural networks (CNNs), capsule neural networks (CapsNets) have a number of advantages. The following are some of Capsule Networks' main benefits:
- Improved Handling of Hierarchies: By capturing the spatial hierarchies among features, Capsule Neural Networks (CapsNets) improve representation learning by handling hierarchical relationships in data quickly.
- Reduced Need for Data Augmentation: Compared to traditional CNNs, capsule neural networks, or CapsNets, frequently require less data augmentation. By facilitating consensus on instantiation parameters, dynamic routing lessens the requirement for significant data augmentation in capsules.
- Improved Robustness to Adversial Attacks: CapsNets demonstrate heightened resilience against adversarial attacks due to their use of vector representations and routing methods, making it challenging for attackers to influence the network with minor input perturbations.
- Explicit pose Information: Capsules in CapsNets encode pose information, enhancing structured representations for tasks like object recognition and pose estimation, where understanding spatial relationships is crucial.
Disadvantages of Capsule Networks
Although Capsule Neural Networks (CapsNets) have demonstrated encouraging benefits, they are not without obstacles and drawbacks:
- Limited Empirical Evidence: Compared to more well-established designs such as CNNs, CapsNets are a relatively new concept and so have not been thoroughly empirically tested. To confirm their general efficacy across a range of jobs, more investigation and benchmarking are needed.
- Computational Complexity: Because dynamic routing is iterative, CapsNets may require more computing power, especially when dealing with large datasets. This could lead to longer training durations and more resource requirements.
- Potential Overemphasis on Capsules: The concentration of CapsNets on capsules may cause other important aspects of network architecture to be overlooked. For best results, the capsule layers and other components must be properly balanced.
- Inherent Complexity of Capsules: The additional complexity of capsules could not improve performance, especially for smaller workloads or datasets when standard architectures are enough. CapsNets could be excessively complex for specific uses.
Applications of Capsule Networks
Since they can record hierarchical relationships in data, Capsule Networks, or CapsNets, have found applications across a wide range of domains. A few noteworthy uses are as follows:
- Computer Vision: CapsNets use their ability to comprehend spatial hierarchies to their advantage in image recognition, object detection, and posture estimation.
- Anomaly Detection: CapsNets are useful for cybersecurity and fraud detection since they are good at finding anomalies in a variety of datasets.
- Autonomous Vehicles: CapsNets' comprehension of intricate visual scenes can help autonomous cars have better perception systems.
- Medical Imaging: CapsNets have demonstrated potential in the field of healthcare image analysis, supporting tasks such as organ segmentation and tumor detection.
