# Evaluation Metrics in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/evaluation-metrics-in-tensorflow/

Evaluation metrics accesses the performance of machine learning models.
In TensorFlow, these metrics help quantify how well the model is performing during training and after it has been trained. TensorFlow provides a wide variety of built-in metrics for both classification and regression tasks, allowing you to choose the most appropriate one for your specific problem.
1. Accuracy
Accuracy is one of the most widely used evaluation metrics, particularly in classification problems. It measures the percentage of correct predictions out of all predictions made. It’s suitable for balanced datasets but may not be the best choice for imbalanced datasets, as it can give misleading results.
Function: tf.keras.metrics.Accuracy()
TensorFlow Code:
import tensorflow as tf
# Example model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(32,)),
    tf.keras.layers.Dense(10, activation='softmax')
])
# Compile model with Accuracy metric
model.compile(optimizer='adam', 
              loss='sparse_categorical_crossentropy', 
              metrics=[tf.keras.metrics.Accuracy()])
# Train the model
model.fit(x_train, y_train)
2. Precision
Precision is a metric used in classification tasks that measures how many of the predicted positive labels were actually positive. It’s particularly useful when the cost of false positives is high.
Function: tf.keras.metrics.Precision()
Example Code in TensorFlow:
import tensorflow as tf
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(32,)),
    tf.keras.layers.Dense(1, activation='sigmoid')  # For binary classification
])
# Compile model with Precision metric
model.compile(optimizer='adam', 
              loss='binary_crossentropy', 
              metrics=[tf.keras.metrics.Precision()])
model.fit(x_train, y_train)
3. Recall
Recall is another important metric in classification, especially in situations where false negatives are more costly than false positives. It measures how many of the actual positive labels were correctly identified by the model.
Function: tf.keras.metrics.Recall()
Example Code in TensorFlow:
import tensorflow as tf
# Example model
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(32,)),
    tf.keras.layers.Dense(1, activation='sigmoid')  # For binary classification
])
# Compile model with Recall metric
model.compile(optimizer='adam', 
              loss='binary_crossentropy', 
              metrics=[tf.keras.metrics.Recall()])
# Train the model
model.fit(x_train, y_train)
4. F1 Score
F1 Score is the harmonic mean of precision and recall, providing a balanced evaluation metric for classification tasks. It is particularly useful when you need to balance both false positives and false negatives.
Function: TensorFlow doesn’t have a built-in F1 score metric, but you can compute it using precision and recall.
5. Mean Squared Error (MSE)
MSE is commonly used for regression tasks. It measures the average squared difference between the predicted and actual values. A lower MSE indicates better model performance.
Function: tf.keras.metrics.MeanSquaredError()
Example Code in TensorFlow:
import tensorflow as tf
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(32,)),
    tf.keras.layers.Dense(1)  
])
# Compile model with Mean Squared Error metric
model.compile(optimizer='adam', 
              loss='mean_squared_error', 
              metrics=[tf.keras.metrics.MeanSquaredError()])
model.fit(x_train, y_train)
6. Mean Absolute Error (MAE)
Mean Absolute Error is another metric commonly used in regression. It measures the average absolute differences between the predicted and actual values. Unlike MSE, MAE doesn’t penalize large errors as much, making it more robust to outliers.
Function: tf.keras.metrics.MeanAbsoluteError()
Example Code in TensorFlow:
import tensorflow as tf
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(32,)),
    tf.keras.layers.Dense(1)  # For regression
])
# Compile model with Mean Absolute Error metric
model.compile(optimizer='adam', 
              loss='mean_absolute_error', 
              metrics=[tf.keras.metrics.MeanAbsoluteError()])
model.fit(x_train, y_train)
7. AUC (Area Under the Curve)
AUC measures the area under the receiver operating characteristic (ROC) curve. It is a valuable metric for binary classification tasks, indicating the model’s ability to distinguish between classes. A higher AUC value indicates a better performing model.
Function: tf.keras.metrics.AUC()
8. Cosine Similarity
Cosine similarity measures the cosine of the angle between the predicted and actual vectors. It is commonly used in text-related tasks, such as document similarity, or in cases where the direction of the vector is more important than its magnitude.
Function: tf.keras.metrics.CosineSimilarity()
Example Code in TensorFlow:
import tensorflow as tf
model = tf.keras.Sequential([
    tf.keras.layers.Dense(64, activation='relu', input_shape=(32,)),
    tf.keras.layers.Dense(1, activation='sigmoid')  # For binary classification
])
# Compile model with Cosine Similarity metric
model.compile(optimizer='adam', 
              loss='binary_crossentropy', 
              metrics=[tf.keras.metrics.CosineSimilarity()])
model.fit(x_train, y_train)
Evaluation metrics are vital tools for assessing the performance of your machine learning models. TensorFlow provides a comprehensive suite of built-in metrics that cater to both classification and regression tasks.
By understanding and using the appropriate metrics in TensorFlow, you can better tune your models and achieve optimal performance.
