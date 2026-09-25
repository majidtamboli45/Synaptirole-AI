# Loss Functions in Deep Learning

> Source: https://www.geeksforgeeks.org/deep-learning/loss-functions-in-deep-learning/

A loss function measures how well a model’s predictions match the actual results by giving a numerical value for the error. A smaller value means better performance, and it guides the model during training.
- Measures the difference between predicted and actual values
- Guides training by helping algorithms like gradient descent update parameters
- Used to evaluate model performance
- Influences how the model learns based on the type of errors
- Different loss functions are used for different tasks
1. Regression Loss Functions
These are used when your model needs to predict a continuous number such as predicting the price of a product or age of a person. Popular regression loss functions are:
1. Mean Squared Error (MSE) Loss
Mean Squared Error (MSE) Loss is one of the most widely used loss functions for regression tasks. It calculates the average of the squared differences between the predicted values and the actual values. It is simple to understand and sensitive to outliers because the errors are squared which can affect the loss.
\text{MSE} =\frac{1}{n}\sum_{i=1}^{n}(y_i−\widehat{y}_i)^2 
2. Mean Absolute Error (MAE) Loss
Mean Absolute Error (MAE) Loss is another commonly used loss function for regression. It calculates the average of the absolute differences between the predicted values and the actual values. It is less sensitive to outliers compared to MSE. But it is not differentiable at zero which can cause issues for some optimization algorithms.
\text{MAE}= \frac{1}{n}\sum_{i=1}^{n} ∣y_i − \widehat{y_i}∣ 
3. Huber Loss
Huber Loss combines the advantages of MSE and MAE. It is less sensitive to outliers than MSE and differentiable everywhere unlike MAE. It requires tuning of the parameter 
\begin{cases}\frac{1}{2} (y_i - \hat{y}_i)^2 & \quad \text{for } |y_i - \hat{y}_i| \leq \delta \\\delta |y_i - \hat{y}_i| - \frac{1}{2} \delta^2 & \quad \text{for } |y_i - \hat{y}_i| > \delta\end{cases} 
2. Classification Loss Functions
Classification loss functions are used to evaluate how well a classification model's predictions match the actual class labels. There are different types of classification Loss functions:
1. Binary Cross-Entropy Loss (Log Loss)
Binary Cross-Entropy Loss is also known as Log Loss and is used for binary classification problems. It measures the performance of a classification model whose output is a probability value between 0 and 1.
\text{Binary Cross-Entropy} = - \frac{1}{n} \sum_{i=1}^{n} [y_i \log(\hat{y}_i) + (1 - y_i) \log(1 - \hat{y}_i)] 
where:
- n is the number of data points
- y_i is the actual binary label (0 or 1)
- \hat{y}_i  is the predicted probability.
2. Categorical Cross-Entropy Loss
Categorical Cross-Entropy Loss is used for multiclass classification problems. It measures the performance of a classification model whose output is a probability distribution over multiple classes.
\text{Categorical Cross-Entropy} = - \sum_{i=1}^{n} \sum_{j=1}^{k} y_{ij} \log(\hat{y}_{ij}) 
where:
- n is the number of data points
- k is the number of classes,
- y_{ij}  is the binary indicator (0 or 1) if class label j is the correct classification for data point i
- \hat{y}_{ij}  is the predicted probability for class j.
3. Sparse Categorical Cross-Entropy Loss
Sparse Categorical Cross-Entropy Loss is similar to Categorical Cross-Entropy Loss but is used when the target labels are integers instead of one-hot encoded vectors. It is efficient for large datasets with many classes.
\text{Sparse Categorical Cross-Entropy} = - \sum_{i=1}^{n} \log(\hat{y}_{i, y_i}) 
where 
4. Kullback-Leibler Divergence Loss (KL Divergence)
KL Divergence measures how one probability distribution diverges from a second expected probability distribution. It is often used in probabilistic models. It is sensitive to small differences in probability distributions.
\text{KL Divergence} = \sum_{i=1}^{n} \sum_{j=1}^{k} y_{ij} \log\left(\frac{y_{ij}}{\hat{y}_{ij}}\right) 
5. Hinge Loss
Hinge Loss is used for training classifiers especially for support vector machines (SVMs). It is suitable for binary classification tasks as it is not differentiable at zero.
\text{Hinge Loss} = \frac{1}{n} \sum_{i=1}^{n} \max(0, 1 - y_i \cdot \hat{y}_i) 
where:
- y_i  is the actual label (-1 or 1)
- \hat{y}_i  is the predicted value.
3. Ranking Loss Functions
Ranking loss functions are used to evaluate models that predict the relative order of items. These are commonly used in tasks such as recommendation systems and information retrieval.
1. Contrastive Loss
Contrastive Loss is used to learn embeddings such that similar items are closer in the embedding space while dissimilar items are farther apart. It is often used in Siamese networks.
\text{Contrastive Loss} = \frac{1}{2N} \sum_{i=1}^{N} \left( y_i \cdot d_i^2 + (1 - y_i) \cdot \max(0, m - d_i)^2 \right) 
where:
- d_i is the distance between a pair of embeddings
- y_i is 1 for similar pairs and 0 for dissimilar pairs
- m is a margin.
2. Triplet Loss
Triplet Loss is used to learn embeddings by comparing the relative distances between triplets: anchor, positive example and negative example.
\text{Triplet Loss} = \frac{1}{N} \sum_{i=1}^{N} \left[ \|f(x_i^a) - f(x_i^p)\|_2^2 - \|f(x_i^a) - f(x_i^n)\|_2^2 + \alpha \right]_+ 
where:
- f(x) is the embedding function
- x_i^a  is the anchor
- x_i^p  is the positive example
- x_i^n  is the negative example
- \alpha is a margin.
3. Margin Ranking Loss
Margin Ranking Loss measures the relative distances between pairs of items and ensures that the correct ordering is maintained with a specified margin.
\text{Margin Ranking Loss} = \frac{1}{N} \sum_{i=1}^{N} \max(0, -y_i \cdot (s_i^+ - s_i^-) + \text{margin}) 
where:
- s_i^+  ands_i^- are the scores for the positive and negative samples
- y_i  is the label indicating the correct ordering.
4. Image and Reconstruction Loss Functions
These loss functions are used to evaluate models that generate or reconstruct images ensuring that the output is as close as possible to the target images.
1. Pixel-wise Cross-Entropy Loss
Pixel-wise Cross-Entropy Loss is used for image segmentation tasks where each pixel is classified independently.
\text{Pixel-wise Cross-Entropy} = - \frac{1}{N} \sum_{i=1}^{N} \sum_{c=1}^{C} y_{i,c} \log(\hat{y}_{i,c}) 
where:
- N is the number of pixels,
- C is the number of classes
- y_{i,c} is the binary indicator for the correct class of pixel
- \hat{y}_{i,c} is the predicted probability for class c.
2. Dice Loss
Dice Loss is used for image segmentation tasks and is particularly effective for imbalanced datasets. It measures the overlap between the predicted segmentation and the ground truth.
\text{Dice Loss} = 1 - \frac{2 \sum_{i=1}^{N} y_i \hat{y}_i}{\sum_{i=1}^{N} y_i + \sum_{i=1}^{N} \hat{y}_i} 
where:
- y_i is the ground truth label
- \hat{y}_i is the predicted label.
3. Jaccard Loss (Intersection over Union, IoU)
Jaccard Loss is also known as IoU Loss that measures the intersection over union of the predicted segmentation and the ground truth.
\text{Jaccard Loss} = 1 - \frac{\sum_{i=1}^{N} y_i \hat{y}_i}{\sum_{i=1}^{N} y_i + \sum_{i=1}^{N} \hat{y}_i - \sum_{i=1}^{N} y_i \hat{y}_i} 
4. Perceptual Loss
Perceptual Loss measures the difference between high-level features of images rather than pixel-wise differences. It is often used in image generation tasks.
\text{Perceptual Loss} = \sum_{i=1}^{N} \| \phi_j(y_i) - \phi_j(\hat{y}_i) \|_2^2 
where:
- \phi_j is a layer in a pre-trained network
- y_i and\hat{y}_i are the ground truth and predicted images
5. Total Variation Loss
Total Variation Loss encourages spatial smoothness in images by penalizing differences between adjacent pixels.
\text{Total Variation Loss} = \sum_{i,j} \left( (y_{i,j+1} - y_{i,j})^2 + (y_{i+1,j} - y_{i,j})^2 \right) 
5. Adversarial Loss Functions
Adversarial loss functions are used in generative adversarial networks (GANs) to train the generator and discriminator networks.
1. Adversarial Loss (GAN Loss)
The standard GAN loss function involves a minimax game between the generator and the discriminator.
\min_G \max_D \mathbb{E}_{x \sim p_{data}(x)} [\log D(x)] + \mathbb{E}_{z \sim p_z(z)} [\log (1 - D(G(z)))] 
- The discriminator tries to maximize the probability of correctly classifying real and fake samples.
- The generator tries to minimize the discriminator’s ability to tell its outputs are fake.
2. Least Squares GAN Loss
LSGAN modifies the standard GAN loss by using least squares error instead of log loss make the training more stable:
Discriminator Loss: 
\min_D \frac{1}{2} \mathbb{E}_{x \sim p_{data}(x)} [(D(x) - 1)^2] + \frac{1}{2} \mathbb{E}_{z \sim p_z(z)} [D(G(z))^2] Generator Loss:  
\min_G \frac{1}{2} \mathbb{E}_{z \sim p_z(z)} \left[ (D(G(z)) - 1)^2 \right] 
6. Specialized Loss Functions
Specialized loss functions are designed for specific tasks such as sequence prediction, count data and cosine similarity.
1. CTC Loss (Connectionist Temporal Classification)
CTC Loss is used for sequence prediction tasks where the alignment between input and output sequences is unknown.
\text{CTC Loss} = - \log(p(y | x)) 
where p(y∣x) is the probability of the correct output sequence given the input sequence.
2. Poisson Loss
Poisson Loss is used for count data modeling the distribution of the predicted values as a Poisson distribution.
\text{Poisson Loss} = \sum_{i=1}^{N} (\hat{y}_i - y_i \log(\hat{y}_i)) 
3. Cosine Proximity Loss
Cosine Proximity Loss measures the cosine similarity between the predicted and target vectors encouraging them to point in the same direction.
\text{Cosine Proximity Loss} = - \frac{1}{N} \sum_{i=1}^{N} \frac{y_i \cdot \hat{y}_i}{\|y_i\| \|\hat{y}_i\|} 
4. Earth Mover's Distance (Wasserstein Loss)
Earth Mover's Distance measures the distance between two probability distributions and is used in Wasserstein GANs.
\text{Wasserstein Loss} = \mathbb{E}_{x \sim p_r} [D(x)] - \mathbb{E}_{z \sim p_z} [D(G(z))] 
Choosing the Right Loss Function
Selecting an appropriate loss function is essential for training a model effectively and achieving good performance. The choice depends on the task, data type, and learning objectives.
- Use MSE or MAE for regression tasks, Cross-Entropy for classification and Dice or Jaccard Loss for segmentation problems
- Choose regression losses for continuous outputs, classification losses for categorical outputs, and CTC Loss for sequence tasks like speech or handwriting
- For imbalanced datasets, use Focal Loss to focus more on difficult or rare examples
- When data contains outliers, use Huber Loss for more stable and robust learning
- Select loss functions that support faster convergence and better overall model performance
