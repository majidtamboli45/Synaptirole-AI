# Handling Imbalanced Data for Classification

> Source: https://www.geeksforgeeks.org/machine-learning/handling-imbalanced-data-for-classification/

Imbalanced data occurs when one class has far more samples than others, causing models to favour the majority class and perform poorly on the minority class. This often results in misleading accuracy, especially in critical applications like fraud detection or medical diagnosis.
- ML models tend to get biased toward the majority class and predict it more frequently.
- Minority class instances may be treated as noise, causing the model to overlook them.
- Accuracy becomes misleading because the model performs well only on the dominant class.
- Skewed decision boundaries lead to poor generalisation and weak performance on minority class predictions.
Techniques to Handle Imbalanced Data
1. Use Better Evaluation Metrics
Accuracy is not a reliable metric for imbalanced datasets because a model can predict only the majority class and still achieve high accuracy. Instead, metrics like Precision, Recall and F1-score give a clearer picture of performance.
F1 = \frac{2 \times (\text{Precision} \times \text{Recall})}{(\text{Precision} + \text{Recall})} 
- Precision measures how many predicted positives are actually correct.
- Recall measures how many actual positives the model correctly identifies.
- F1-score is the harmonic mean of precision and recall and is widely used for imbalanced datasets.
Precision and F1 score decrease with more false positives while recall and F1 score drop when minority class samples are missed. F1 score improves only when both precision and recall increase making it ideal for imbalanced datasets.
2. Resampling Techniques
Resampling adjusts the size of classes to make them more balanced.
- Oversampling: Duplicates or generates minority class samples to help the model learn more patterns.
- Undersampling: Removes majority class samples to balance the dataset and give equal importance to all classes.
Implementing Resampling
- Creates an imbalanced binary dataset with one minority and one majority class using synthetic data.
- Prints the original number of samples in each class before balancing.
- Applies oversampling to duplicate minority class samples and balance the dataset.
- Uses undersampling to reduce majority class samples and achieve class balance.
import numpy as np
from sklearn.datasets import make_classification
from imblearn.over_sampling import RandomOverSampler
from imblearn.under_sampling import RandomUnderSampler
from collections import Counter
X, y = make_classification(n_classes=2, class_sep=2, weights=[0.1, 0.9],
                           n_informative=3, n_redundant=1, flip_y=0,
                           n_features=20, n_clusters_per_class=1,
                           n_samples=1000, random_state=42)
print("Original class distribution:", Counter(y))
oversample = RandomOverSampler(sampling_strategy='minority')
X_over, y_over = oversample.fit_resample(X, y)
print("Oversampled class distribution:", Counter(y_over))
undersample = RandomUnderSampler(sampling_strategy='majority')
X_under, y_under = undersample.fit_resample(X, y)
print("Undersampled class distribution:", Counter(y_under))
Output:
3. Balanced Bagging Classifier
Balanced Bagging Classifier is an ensemble technique used to handle imbalanced datasets. It works like Bagging but balances each bootstrap sample so that minority classes are not ignored during training. Standard models favour the majority class due to which minority class predictions become poor. Balanced Bagging Classifier resamples data internally to fix this problem.
Implementing Balanced Bagging Classifier
Here in this code we create an imbalanced dataset and train a Random Forest model using balanced bootstrapped samples so that both majority and minority classes are learned fairly. The model is then evaluated on test data to check improved performance on the minority class.
Step 1: Import Required Libraries
- make_classification creates synthetic imbalanced data
- BalancedBaggingClassifier helps handle class imbalance
- matplotlib is used for visualization
import matplotlib.pyplot as plt
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from imblearn.ensemble import BalancedBaggingClassifier
from sklearn.metrics import accuracy_score, classification_report
Step 2: Create an Imbalanced Dataset
- weights=[0.1, 0.9] creates class imbalance
- random_state ensures reproducible results
X, y = make_classification(
    n_samples=1000,
    n_features=20,
    n_classes=2,
    weights=[0.1, 0.9],
    n_informative=3,
    n_redundant=1,
    random_state=42
)
Step 3: Visualize Class Distribution
Shows how one class dominates the dataset
plt.figure()
plt.hist(y)
plt.xlabel("Class Label")
plt.ylabel("Count")
plt.title("Imbalanced Class Distribution")
plt.show()
Output:
Step 4: Split Dataset into Train and Test
- 80% data used for training, 20% for testing
- Same random state keeps split consistent
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
Step 5: Create Base Classifier
Random Forest acts as the base learner
base_classifier = RandomForestClassifier(random_state=42)
Step 6: Create BalancedBaggingClassifier
- sampling_strategy='auto' balances all classes
- replacement=False avoids duplicate samples
balanced_bagging = BalancedBaggingClassifier(
    estimator=base_classifier,
    sampling_strategy='auto',
    replacement=False,
    random_state=42
)
Step 7: Train Model and Predict
Model learns from balanced bootstrapped samples
balanced_bagging.fit(X_train, y_train)
y_pred = balanced_bagging.predict(X_test)
Step 8: Evaluate the Model
- Accuracy gives overall correctness
- Classification report shows precision, recall, and F1-score
print("Accuracy:", accuracy_score(y_test, y_pred))
print("Classification Report:\n", classification_report(y_test, y_pred))
Output:
4. Synthetic Minority Oversampling Technique (SMOTE)
SMOTE is a data level technique used to handle imbalanced datasets by creating new synthetic samples for the minority class instead of duplicating existing ones. In SMOTE a minority class data point is first selected then its k-nearest neighbors are identified and finally a new synthetic data point is generated between the selected point and one of its neighbors.
Handling Class Imbalance Using SMOTE
- Creates an imbalanced binary dataset and splits it into training and test sets.
- Displays the class distribution of the training data before applying SMOTE.
- Applies SMOTE to generate synthetic minority samples and balance the training dataset.
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from imblearn.over_sampling import SMOTE
from collections import Counter
X, y = make_classification(
    n_classes=2,
    class_sep=2,
    weights=[0.1, 0.9],
    n_informative=3,
    n_redundant=1,
    flip_y=0,
    n_features=20,
    n_clusters_per_class=1,
    n_samples=1000,
    random_state=42
)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)
print("Class distribution before SMOTE:", Counter(y_train))
smote = SMOTE(sampling_strategy='auto', random_state=42)
X_train_resampled, y_train_resampled = smote.fit_resample(X_train, y_train)
print("Class distribution after SMOTE:", Counter(y_train_resampled)
Output:
Class distribution before SMOTE: Counter({np.int64(1): 713, np.int64(0): 87})
Class distribution after SMOTE: Counter({np.int64(1): 713, np.int64(0): 713})
5. Threshold Moving
In classification, models often give probabilities for each class. By default a probability above 0.5 is labeled as the positive class. However for imbalanced dataset this default may not work well.
To improve performance the classification threshold can be adjusted. A lower or higher threshold can help the model better detect the minority class or reduce false positives.
Ways to find the best threshold:
- ROC Curve: Choose the threshold that balances true positive rate and false positive rate.
- Precision-Recall Curve: Especially useful for imbalanced data to maximize precision and recall.
- Grid Search / Range Testing: Experiment with multiple threshold values to find the one that gives the best performance metrics.
Implementing Threshold Tuning for Imbalanced Classification
- Trains a Random Forest classifier on the imbalanced training data.
- Predicts probabilities for the positive class instead of direct labels.
- Iteratively changes the decision threshold to observe how the F1-score varies and find a better balance between precision and recall.
from sklearn.datasets import make_classification
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import accuracy_score, precision_score, recall_score, f1_score, roc_auc_score
X, y = make_classification(n_classes=2, class_sep=2, weights=[0.1, 0.9],
                           n_informative=3, n_redundant=1, flip_y=0,
                           n_features=20, n_clusters_per_class=1,
                           n_samples=1000, random_state=42)
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42)
model = RandomForestClassifier(random_state=42)
model.fit(X_train, y_train)
y_proba = model.predict_proba(X_test)[:, 1]
threshold = 0.5
while threshold >= 0:
    y_pred = (y_proba >= threshold).astype(int)
    f1 = f1_score(y_test, y_pred)
    print(f"Threshold: {threshold:.2f}, F1 Score: {f1:.4f}")
  
    threshold -= 0.02
Output:
This output shows how the F1 score changes with different classification thresholds. Higher thresholds (around 0.30–0.50) give perfect F1 scores (1.0), while lowering the threshold gradually reduces the F1 score, indicating a trade-off between precision and recall.
6. Using Tree Based Models
The hierarchical structure of tree-based models such as Decision Trees, Random Forests and Gradient Boosted Trees allows them to handle imbalanced datasets better than non-tree-based models.
- Decision Trees: Decision trees create a structure resembling a tree by dividing the feature space into regions according to feature values. By changing the decision boundaries to incorporate minority class patterns, decision trees can react to data that is unbalanced. They might experience overfitting, though.
- Random Forests: Random Forests are made up of many Decision Trees that have been trained using arbitrary subsets of features and data. Random Forests improve generalization by reducing overfitting and strengthening robustness against imbalanced datasets by mixing numerous trees.
- Gradient Boosted Trees: Boosted Gradient Trees grow in a sequential fashion, with each new growth repairing the mistakes of the older one. Gradient Boosted Trees perform well in imbalanced circumstances because of their ability to concentrate on misclassified occurrences through sequential learning. Although they often work effectively, they could be noise-sensitive.
7. Using Anomaly Detection Algorithms
- Anomaly or Outlier Detection algorithms are one class classification algorithms that helps in identifying outliers ( rare data points) in the dataset.
- In an Imbalanced dataset, assume Majority class records as Normal data and Minority Class records as Outlier data.
- These algorithms are trained on Normal data.
- A trained model can predict if the new record is Normal or Outlier.
You can download full code from here
