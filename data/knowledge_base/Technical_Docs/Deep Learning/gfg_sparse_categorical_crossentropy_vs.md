# Sparse Categorical Crossentropy vs. Categorical Crossentropy

> Source: https://www.geeksforgeeks.org/deep-learning/sparse-categorical-crossentropy-vs-categorical-crossentropy/

Sparse Categorical Crossentropy and Categorical Crossentropy are loss functions used for multi‑class classification problems in deep learning. While both measure the difference between predicted probabilities and actual labels, they differ in how the target labels are represented.
Categorical Crossentropy
Categorical Crossentropy measures how well the predicted probabilities of each class align with the actual target labels. It compares the predicted class probabilities with the true labels and requires the target labels to be in one-hot encoded format, where the correct class is represented by 1 and all other classes by 0.
Example: If we are classifying animals into three categories- Dog, Cat and Rabbit and the correct label is "Cat",
- The one-hot encoded vector would be [0, 1, 0].
- Suppose the model predicts probabilities like [0.2, 0.7, 0.1] (20% Dog, 70% Cat, 10% Rabbit). The loss is calculated for the correct class (Cat) using the formula:
(predicted probability of correct class) = 
-log −log(0.7) ≈ 0.3567 
The lower the loss, the closer the model's prediction is to the true label. The model minimizes this loss during training to improve accuracy.
Sparse Categorical Crossentropy
Sparse Categorical Crossentropy is functionally similar to Categorical Crossentropy but is designed for cases where the target labels are not one-hot encoded. Instead, the labels are represented as integers corresponding to class indices.
Example: If the correct label is "Cat", it would be represented as the integer 1 (since "Cat" is the second class, starting from 0).
- Suppose the model predicts probabilities like [0.2, 0.7, 0.1] .
- The loss is calculated for the correct class (Cat ) using the formula:
-\log(0.7) \approx 0.3567 
Sparse Categorical Crossentropy internally handles the class index during loss computation, eliminating the need for manual one-hot encoding. This makes it more memory-efficient and convenient when working with datasets containing a large number of classes.
Key Difference
| Feature | Categorical Crossentropy | Sparse Categorical Crossentropy | 
|---|---|---|
| Label Representation | Requires one-hot encoded labels (e.g., [0, 1, 0] ) | Uses integer class labels (e.g., 1 ) | 
| Memory Efficiency | Lower due to one-hot encoded vectors | Higher since only class indices are stored | 
| Preprocessing | Requires one-hot encoding of labels | No one-hot encoding required | 
| Use Cases | Suitable when labels are already one-hot encoded | Suitable when labels are stored as integers | 
| Loss Calculation | Uses one-hot encoded labels during loss computation | Uses integer labels and handles encoding internally | 
| Ease of Use | Requires additional label preprocessing | Simpler label preparation | 
| Compatibility | Labels must match the prediction shape | More flexible with label format | 
When to Use
Use Categorical Crossentropy if:
- Our labels are already one-hot encoded.
- We want precise control over label representation. For example, custom metrics or weighted classes.
Use Sparse Categorical Crossentropy if:
- Our labels are integers.
- We want faster training and better memory usage, especially with many classes.
