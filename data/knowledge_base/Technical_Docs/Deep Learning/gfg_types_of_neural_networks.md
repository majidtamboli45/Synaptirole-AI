# Types of Neural Networks

> Source: https://www.geeksforgeeks.org/deep-learning/types-of-neural-networks/

Neural networks are available in different architectures, each designed to solve specific types of problems. The choice of architecture depends on the nature of the data and the task, such as image recognition, sequence modeling or pattern classification.
1. Feedforward Neural Networks
Feedforward neural networks are a type of artificial neural network where data flows in one direction from input to output without forming cycles. Inputs pass through hidden layers to produce outputs.
- Architecture: Consists of input, hidden and output layers with unidirectional data flow.
- Training: Typically trained using backpropagation to minimize prediction error.
- Applications: Used in image and speech recognition, NLP, financial forecasting and recommendation systems.
- When to use: Suitable for general tasks like classification and regression, especially when data is static and not sequential.
2. Convolutional Neural Networks (CNNs)
Convolutional neural networks are designed to process grid-like data such as images and videos. They use convolutional layers to detect patterns and capture spatial relationships.
- Key Components: Utilizing convolutional layers, pooling layers and fully connected layers.
- Applications: Image classification, object detection, medical imaging, autonomous driving and augmented reality.
- When to use: Ideal for tasks involving images, videos or grid-structured data.
3. Recurrent Neural Networks (RNNs)
Recurrent neural network handles sequential data in which the current output is a result of previous inputs by looping over themselves to hold internal state (memory).
- Architecture: Includes recurrent connections that allow information to loop and capture sequence patterns.
- Challenges: Face issues like vanishing gradients, which limit learning long-term dependencies.
- Applications: Language translation, text classification, conversational systems and time series prediction.
- When to use: Suitable for tasks involving sequences such as text, speech or time series data.
4. Long Short-Term Memory Networks (LSTMs)
Long Short-Term Memory Networks (LSTMs) are a variant of RNNs. They exhibit memory cells to solve the disappearing gradient issue and keep large ranges of information in their memory.
- Key Features: Capture memory cells in pass information flowing and vanishing gradient issue.
- Applications: Value of RNNs is in terms of importing long-term memory into the model like language translation and time-series forecasting.
- When to use: Use when you need to model long-term dependencies in sequences.
5. Gated Recurrent Units (GRUs)
Gated Recurrent Units (GRUs) is the second usual variant of RNNs which is working on gating mechanism just like LSTM but with little parameter.
- Advantages: Vanishing gradient issue is addressed and it is compute-efficient than LSTM.
- Applications: LSTM is also involved in tasks that can be categorized as similar to speech recognition and text monitoring.
- When to use: Use when LSTM-like performance is needed but with lower computational cost.
6. Radial Basis Function Networks (RBFNs)
Radial basis function (RBF) networks are neural networks that use radial basis functions to model complex relationships, making them effective for function approximation and classification.
- Applications: Used in regression, pattern recognition and control systems.
- When to use: Suitable for function approximation and small to medium-scale classification tasks.
7. Self-Organizing Maps (SOMs)
Self-Organizing Maps are unsupervised neural networks that cluster high-dimensional data while preserving its structure, mapping it into a lower-dimensional space.
- Features: Reduce data dimensions while maintaining the underlying relationships.
- Applications: Data visualization, customer segmentation, anomaly detection and feature selection.
- When to use: Ideal for data visualization, clustering and dimensionality reduction.
8. Deep Belief Networks (DBNs)
Deep Belief Networks are composed of multiple layers of stochastic hidden variables, enabling both supervised and unsupervised learning, especially for complex feature extraction.
- Function: Learn hierarchical representations that improve classification performance.
- Applications: Image and voice recognition, natural language understanding and smart devices as recommendations systems.
- When to use: Suitable for unsupervised pre-training and deep feature extraction tasks.
9. Generative Adversarial Networks (GANs)
Generative Adversarial Networks consist of two models—a generator and a discriminator that compete with each other. The generator creates synthetic data, while the discriminator distinguishes between real and fake data.
- Working Principle: Both models improve through training, with the generator producing more realistic data and the discriminator becoming better at detection.
- Applications: Data generation, data augmentation, style transfer and unsupervised learning.
- When to use: Suitable for generating realistic synthetic data.
10. Autoencoders (AE)
Autoencoders are feedforward neural networks that learn efficient representations by encoding input data into a latent space and then reconstructing it. The encoder maps the input to a compressed representation, while the decoder reconstructs it.
- Functionality: Used for dimensionality reduction, feature extraction, noise removal and generative modeling.
- Types: Include undercomplete, overcomplete and variational autoencoders.
- When to use: Suitable for unsupervised tasks like data compression, denoising and anomaly detection.
11. Transformer Networks
Transformer Networks do this by way of self-attention mechanism which results into a parallel process used for making the tokenization inputs faster and thus improved capturing of long range dependencies.
- Key Features: High performance in handling language tasks, especially for translation, text generation and summarization.
- Applications: Widely used in natural language processing, as well as image and audio tasks.
- When to use: Used for NLP tasks like translation, text generation and summarization.
12. Siamese Neural Networks
Siamese Neural Network consist of two identical networks that share the same architecture and weights. They compare two inputs using a similarity metric to determine how alike they are.
- Applications: Face recognition, signature verification, image similarity and information retrieval.
- When to use: Ideal when comparing two inputs to determine similarity like face verification.
13. Capsule Networks (CapsNet)
Capsule Networks capture spatial and hierarchical relationships in data by passing information from lower to higher layers, preserving part-to-whole structures.
- Applications: Image classification, object detection and scene understanding via the immense visual data exposure.
- When to use: Use for image classification where part-to-whole relationships matter.
14. Spiking Neural Networks (SNN)
Spiking Neural Networks (SNNs) are inspired by brain activity, where neurons communicate through discrete signals called spikes, closely mimicking biological processing.
- Applications: Neuromorphic computing, cognitive modeling and brain-inspired learning systems.
- When to use: Used when working on neuromorphic computing and biologically inspired architectures.
