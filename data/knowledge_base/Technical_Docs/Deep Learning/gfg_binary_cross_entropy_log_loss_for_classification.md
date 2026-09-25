# Binary Cross Entropy/Log Loss for Binary Classification

> Source: https://www.geeksforgeeks.org/deep-learning/binary-cross-entropy-log-loss-for-binary-classification/

Binary cross-entropy (log loss) is a loss function used in binary classification problems. It quantifies the difference between the actual class labels (0 or 1) and the predicted probabilities output by the model. The lower the binary cross-entropy value, the better the model’s predictions align with the true labels.
Mathematically, Binary Cross-Entropy (BCE) is defined as:
where:
- N is the number of observations
- y_i is the actual binary label (0 or 1) of thei^{th} observation.
- p_i is the predicted probability of thei^{th} observation being in class 1.
Since the model’s output is a probability between 0 and 1, minimizing binary cross-entropy during training helps improve predictive accuracy, ensuring the model effectively distinguishes between two classes.
How Does Binary Cross-Entropy Work?
Binary Cross-Entropy measures the distance between the true labels and the predicted probabilities. When the predicted probability 
Conversely, when the predicted probability deviates significantly from the actual label, the BCE value is high, indicating a poor prediction. The logarithmic component of the BCE function penalizes wrong predictions more heavily than correct ones.
For example, if the true label is 1 and the predicted probability is close to 0, the loss is substantial. This characteristic makes BCE particularly effective in driving the model to improve its predictions during training.
Why is Binary Cross-Entropy Important?
- Training Deep Learning Models: Binary Cross-Entropy is used as the loss function for training neural networks in binary classification tasks. It helps in adjusting the model's weights to minimize the prediction error.
- Probabilistic Interpretation: BCE provides a probabilistic interpretation of the model's predictions, making it suitable for applications where understanding the confidence of predictions is important, such as in medical diagnosis or fraud detection.
- Model Evaluation: BCE is a clear and interpretable metric for evaluating the performance of binary classification models. Lower BCE values indicate better model performance.
- Handling Imbalanced Data: BCE can be particularly useful in scenarios with imbalanced datasets, where one class is significantly more frequent than the other. By focusing on probability predictions, it helps the model learn to make accurate predictions even in the presence of class imbalance.
Mathematical Example of Binary Cross-Entropy
Consider a binary classification problem where we have the following true labels 
| Observation | True Label (y) | Predicted Probability (p) | 
|---|---|---|
| 1 | 1 | 0.9 | 
| 2 | 0 | 0.2 | 
| 3 | 1 | 0.8 | 
| 4 | 0 | 0.4 | 
We will calculate the Binary Cross-Entropy loss for this set of observations step-by-step.
Observation 1:
Here, True label 
Similarly, for other classes,
- Predicted probability p2 =0.2 and Loss2=0.223
- Predicted probability p3 =0.8and Loss3=0.2231
- Predicted probability p4 =0.4 and Loss4=0.5108
Next, we sum the individual losses and calculate the average:
Therefore, the Binary Cross-Entropy loss for these observations is approximately 0.2656.
Implementation of Binary Cross Entropy in Python
- Manual Calculation with NumPy: The function binary_cross_entropy manually calculates BCE loss using the formula, averaging individual losses for true labels (y_true ) and predicted probabilities (y_pred ).
- Keras Calculation: The binary_crossentropy function from Keras computes BCE loss directly and efficiently, taking the same inputs (y_true andy_pred ), with results converted to NumPy format.
- Verification: The close match between manual (bce_loss ) and Keras (bce_loss_keras ) calculations validates the manual implementation, ensuring accuracy in computing BCE loss for binary classification models.
import numpy as np
from keras.losses import binary_crossentropy
# Example true labels and predicted probabilities
y_true = np.array([0, 1, 1, 0, 1])
y_pred = np.array([0.1, 0.9, 0.8, 0.2, 0.7])
# Compute Binary Cross-Entropy using NumPy
def binary_cross_entropy(y_true, y_pred):
    bce = -np.mean(y_true * np.log(y_pred) + (1 - y_true) * np.log(1 - y_pred))
    return bce
bce_loss = binary_cross_entropy(y_true, y_pred)
print(f"Binary Cross-Entropy Loss (manual calculation): {bce_loss}")
# Compute Binary Cross-Entropy using Keras
bce_loss_keras = binary_crossentropy(y_true, y_pred).numpy()
print(f"Binary Cross-Entropy Loss (Keras): {bce_loss_keras}")
Output:
Binary Cross-Entropy Loss (manual calculation): 0.20273661557656092
Binary Cross-Entropy Loss (Keras): 0.2027364925606956
The manual calculation using NumPy might have slightly different floating-point precision or rounding behavior compared to the Keras implementation. Keras might use optimized backend operations and higher precision floating-point arithmetic, leading to a very slightly different results.
Understanding and implementing BCE ensures robust evaluation and enhancement of binary classification models, especially in deep learning applications.
