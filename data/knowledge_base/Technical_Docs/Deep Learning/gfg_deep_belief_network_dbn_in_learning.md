# Deep Belief Network (DBN) in Deep Learning

> Source: https://www.geeksforgeeks.org/deep-learning/deep-belief-network-dbn-in-deep-learning/

Discover data creation with Deep Belief Networks (DBNs), cutting-edge generative models that make use of deep architecture. This article walks you through the concepts of DBNs, how they work, and how to implement them using practical coding.
What is a Deep Belief Network?
Deep Belief Networks (DBNs) are sophisticated artificial neural networks used in the field of deep learning, a subset of machine learning. They are designed to discover and learn patterns within large sets of data automatically. Imagine them as multi-layered networks, where each layer is capable of making sense of the information received from the previous one, gradually building up a complex understanding of the overall data.
DBNs are composed of multiple layers of stochastic, or randomly determined, units. These units are known as Restricted Boltzmann Machines (RBMs) or other similar structures. Each layer in a DBN aims to extract different features from the input data, with lower layers identifying basic patterns and higher layers recognizing more abstract concepts. This structure allows DBNs to effectively learn complex representations of data, which makes them particularly useful for tasks like image and speech recognition, where the input data is high-dimensional and requires a deep level of understanding.
The architecture of DBNs also makes them good at unsupervised learning, where the goal is to understand and label input data without explicit guidance. This characteristic is particularly useful in scenarios where labelled data is scarce or when the goal is to explore the structure of the data without any preconceived labels.
How Deep Belief Networks Work?
DBNs work in two main phases: pre-training and fine-tuning. In the pre-training phase, the network learns to represent the input data layer by layer. Each layer is trained independently as an RBM, which allows the network to learn complex data representations efficiently. During this phase, the network learns the probability distribution of the inputs, which helps it understand the underlying structure of the data.
In the fine-tuning phase, the DBN adjusts its parameters for a specific task, like classification or regression. This is typically done using a technique known as backpropagation, where the network’s performance on a task is evaluated, and the errors are used to update the network’s parameters. This phase often involves supervised learning, where the network is trained with labelled data.
Concepts Related to Deep Belief Networks (DBNs)
- Restricted Boltzmann Machines (RBMs): These are the building blocks of DBNs. An RBM is a two-layered neural network that learns the probability distribution of the input data. Each layer in a DBN is typically an RBM.
- Stochastic Units: DBNs use units that make decisions probabilistically. This stochastic nature allows the network to explore and learn more complex patterns in the data.
- Layer-wise Training: DBNs are trained one layer at a time, which is efficient and helps in learning deep representations of data.
- Unsupervised and Supervised Learning: DBNs are versatile, capable of both unsupervised learning (learning from unlabeled data) and supervised learning (learning from labeled data).
- Greedy Algorithm: This is used during the pre-training phase of DBNs. Each layer is trained greedily, meaning it’s trained independently of the others, which simplifies the training process.
- Backpropagation: In the fine-tuning phase, backpropagation is used for supervised learning tasks. It adjusts the network’s parameters to improve its performance on specific tasks.
DBNs, with their deep architecture and efficient learning capabilities, have been pivotal in advancing the field of deep learning, particularly in handling complex tasks like image and speech recognition.
Mathematical Concepts Related to DBN
Deep Belief Networks (DBNs) employ several mathematical concepts, blending probability theory with neural network structures. At their core, they use Restricted Boltzmann Machines (RBMs) for layer-wise learning, which are based on probabilistic graphical models.
1. Energy-Based Model: Each RBM within a DBN is an energy-based model. For an RBM with visible units v and hidden units h, the energy function is defined as:
Here, ai and bj are bias terms, and wij represents the weights between units.
2. Probability Distribution: The probability of a given state of the RBM is defined by the Boltzmann distribution:
where Z is the partition function, a normalization factor calculated as the sum over all possible pairs of visible and hidden units.
3. Training using Contrastive Divergence: RBMs are typically trained using a method called Contrastive Divergence (CD). This method approximates the gradient of the log-likelihood and updates the weights wij, and biases ai,bj to maximize the likelihood of the training data under the model.
In a DBN, these RBMs are stacked. The hidden layer of one RBM serves as the visible layer for the next. After this unsupervised, layer-wise training, the entire network can be fine-tuned using supervised methods like backpropagation, where the goal is to minimize the difference between the predicted output and the actual label of the training data.
Implementation of Deep Belief Networks (DBNs)
Prerequsite:
To implement the Deep Belief Networks (DBNs), first you need to install the numpy, pandas, and scikit-learn 
!pip install numpy pandas scikit-learn
The code provided outlines the process of creating a Deep Belief Network (DBN) using Python. Here's a step-by-step explanation:
- Import Libraries: Essential Python libraries for data handling (numpy, pandas), machine learning models (scikit-learn), and deep learning (tensorflow) are imported.
- Load Dataset: The MNIST dataset, a collection of 28x28 pixel images of handwritten digits, is fetched using fetch_openml from scikit-learn. This dataset is commonly used for benchmarking classification algorithms.
- Preprocessing: The dataset is split into training and testing sets with train_test_split. The data is then scaled using StandardScaler to normalize it, which often leads to better performance for neural networks.
- RBM Layer: A Restricted Boltzmann Machine (RBM) is initialized with a specified number of components and learning rate. RBMs are unsupervised neural networks that find patterns in data by reconstructing the inputs.
- Classifier Layer: A logistic regression classifier is chosen for the final prediction layer. Logistic regression is a simple yet effective linear model for classification tasks.
- DBN Pipeline: The RBM and logistic regression model are chained together in a Pipeline. This allows for sequential application of the RBM (for feature extraction) followed by logistic regression (for classification).
- Training: The pipeline, which forms the DBN, is trained on the preprocessed training data (X_train_scaled). The RBM learns features that are then used by the logistic regression model to classify the digits.
- Evaluation: Finally, the trained DBN's performance is evaluated on the test set. The classification accuracy (dbn_score) is printed to provide a quantitative measure of how well the model performs.
This DBN implementation leverages a simple but effective stack of models to learn from the data and perform digit classification. The RBM layers act as feature detectors, converting raw pixel intensities into more useful representations for the logistic regression model to classify.
import numpy as np
import pandas as pd
from sklearn.datasets import fetch_openml
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neural_network import BernoulliRBM
from sklearn.pipeline import Pipeline
from sklearn.linear_model import LogisticRegression
# Load the dataset
mnist = fetch_openml('mnist_784', version=1)
X, y = mnist['data'], mnist['target']
# Split the dataset into training and test sets
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42)
# Preprocess the data by scaling it
scaler = StandardScaler()
X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)
# Initialize the RBM model
rbm = BernoulliRBM(n_components=256, learning_rate=0.01, n_iter=20, verbose=1)
# Initialize the logistic regression model
logistic = LogisticRegression(max_iter=1000)
# Create a pipeline that first extracts features using the RBM and then classifies with logistic regression
dbn_pipeline = Pipeline(steps=[('rbm', rbm), ('logistic', logistic)])
# Train the DBN
dbn_pipeline.fit(X_train_scaled, y_train)
# Evaluate the model on the test set
dbn_score = dbn_pipeline.score(X_test_scaled, y_test)
print(f"DBN Classification score: {dbn_score}")
Output:
[BernoulliRBM] Iteration 1, pseudo-likelihood = -71697.68, time = 54.64s
[BernoulliRBM] Iteration 2, pseudo-likelihood = -144548.11, time = 51.82s
[BernoulliRBM] Iteration 3, pseudo-likelihood = -217564.40, time = 48.61s
[BernoulliRBM] Iteration 4, pseudo-likelihood = -268422.46, time = 53.68s
[BernoulliRBM] Iteration 5, pseudo-likelihood = -335396.55, time = 51.02s
[BernoulliRBM] Iteration 6, pseudo-likelihood = -428781.07, time = 50.73s
[BernoulliRBM] Iteration 7, pseudo-likelihood = -502137.58, time = 51.02s
[BernoulliRBM] Iteration 8, pseudo-likelihood = -596137.19, time = 48.26s
[BernoulliRBM] Iteration 9, pseudo-likelihood = -616426.82, time = 48.28s
[BernoulliRBM] Iteration 10, pseudo-likelihood = -701353.08, time = 48.52s
[BernoulliRBM] Iteration 11, pseudo-likelihood = -796299.85, time = 49.36s
[BernoulliRBM] Iteration 12, pseudo-likelihood = -847262.04, time = 48.59s
[BernoulliRBM] Iteration 13, pseudo-likelihood = -878603.80, time = 48.95s
[BernoulliRBM] Iteration 14, pseudo-likelihood = -986107.67, time = 48.56s
[BernoulliRBM] Iteration 15, pseudo-likelihood = -1101152.68, time = 50.52s
[BernoulliRBM] Iteration 16, pseudo-likelihood = -1175377.79, time = 48.11s
[BernoulliRBM] Iteration 17, pseudo-likelihood = -1215855.52, time = 46.14s
[BernoulliRBM] Iteration 18, pseudo-likelihood = -1260792.79, time = 50.41s
[BernoulliRBM] Iteration 19, pseudo-likelihood = -1351889.17, time = 50.81s
[BernoulliRBM] Iteration 20, pseudo-likelihood = -1389506.51, time = 49.05s
DBN Classification score: 0.21142857142857144
Output Explanation:
The output shows the training progress of a Deep Belief Network (DBN) over 20 iterations. During each iteration, the RBM part of the DBN is learning to understand the structure of the data. The "pseudo-likelihood" is a measure used to estimate how well the RBM is modeling the data. However, the values given are negative and increasing in magnitude, which typically should not happen as we expect the pseudo-likelihood to increase (or loss to decrease) as the model learns.
After training, the DBN achieves a classification score of about 21.14%. This score is a way of measuring accuracy; it tells us that the DBN correctly predicted the digit class 21.14% of the time on the test dataset. This is not a very high score, suggesting the model didn't perform well in this task.
Conclusion
The article provided a walkthrough on setting up a Deep Belief Network (DBN), a type of advanced computer program designed to recognize patterns in data. We used handwritten digits as an example. The DBN was trained using a method that involved learning from the data in stages, with each stage hoping to get better at spotting the various digits.
However, the training updates showed a peculiar trend where the model's estimation of doing a good job (pseudo-likelihood) kept getting worse. Ideally, this number should get better as the model sees more data. After the training, when the DBN was tested to see how well it could identify new handwritten digits, it only got it right about 21% of the time. This score is quite low, suggesting that the DBN didn't learn as effectively as we would have liked.
In simple terms, it's like the DBN was a student who, despite studying more, wasn't getting better at passing tests. This outcome suggests that the DBN might need a different study strategy, perhaps a change in how it learns from the data or the kind of data it learns from. To improve its performance, we might need to adjust the training process or try different ways of teaching the DBN about handwritten digits.
