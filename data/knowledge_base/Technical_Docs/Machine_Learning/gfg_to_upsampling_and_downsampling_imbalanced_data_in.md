# Introduction to UpSampling and DownSampling Imbalanced Data in Python

> Source: https://www.geeksforgeeks.org/machine-learning/introduction-to-upsampling-and-downsampling-imbalanced-data-in-python/

Imbalanced datasets are a common challenge in machine learning, where one class significantly outweighs another. This imbalance can lead to biased model predictions. Two primary techniques to address this issue are UpSampling and DownSampling:
- UpSampling: Increases the number of samples in the minority class.
- DownSampling: Reduces the majority class size to match the minority class.
In this article, we will explore these techniques, their implementation in Python using libraries like imbalanced-learn, and how to optimize them for better machine learning performance.
Why Are Imbalanced Datasets a Problem?
Imbalanced data occurs when the target class distribution is uneven, with one class having significantly more observations than the other.
For example:
- Fraud detection datasets often have a high number of legitimate transactions (majority class) and very few fraudulent ones (minority class).
- Imbalanced data can lead to models being biased toward the majority class, resulting in poor performance for the minority class, particularly in critical applications like fraud detection or medical diagnosis.
Imbalanced datasets can produce misleading metrics like accuracy. For example, in a dataset where 95% of cases belong to the majority class, a model predicting only the majority class achieves 95% accuracy but fails to identify the minority class.
Key Considerations When Handling Imbalanced Data
- Avoid Data Leakage: Split the dataset into training and testing sets before applying resampling techniques. This prevents the model from learning patterns it wouldn't encounter in real-world scenarios.
- Use Synthetic Methods: Techniques like SMOTE (Synthetic Minority Over-sampling Technique) generate synthetic samples for the minority class, improving diversity and model performance.
- Experiment with Both Techniques: Test both upsampling and downsampling to find the optimal approach for your dataset. The choice depends on the dataset size, model requirements, and application.
What is UpSampling?
UpSampling addresses class imbalance in datasets by increasing the number of samples in the minority class. This can be achieved by duplicating existing samples or generating new synthetic samples through methods like SMOTE (Synthetic Minority Over-sampling Technique).
Example: In a fraud detection dataset with 1,000 legitimate transactions (Class 0) and 50 fraudulent transactions (Class 1), upsampling duplicates or synthesizes fraudulent transactions to balance the dataset.
Upsampling improves minority class representation during training, leading to better model performance.
What is DownSampling?
DownSampling reduces the number of samples in the majority class to match that of the minority class. This involves randomly selecting a subset of samples from the majority class until its size aligns with minority class.
Example: In a medical diagnosis context where you have 950 healthy patients (Class 0) and only 50 patients with a rare disease (Class 1), downsampling would involve randomly selecting 50 healthy patients to match the number of patients with the disease. This helps ensure that both classes are equally represented during training.
Downsampling reduces bias toward the majority class and helps focus on minority class predictions.
Steps for UpSampling and DownSampling in Python
Step 1 . Installing Required Libraries
To perform upsampling and downsampling, you need to install the libraries:
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.datasets import fetch_openml
Step 2 : Load the Dataset:
url = "https://raw.githubusercontent.com/jbrownlee/Datasets/master/pima-indians-diabetes.data.csv"
column_names = ['Pregnancies', 'Glucose', 'BloodPressure', 'SkinThickness', 'Insulin', 'BMI', 'DiabetesPedigreeFunction', 'Age', 'Outcome']
data = pd.read_csv(url, names=column_names)
data.head()
Output:
Step 3: Check the Class Distribution
from collections import Counter
y = data['Outcome']
print(f"Original Class Distribution: {Counter(y)}")
Output:
Original Class Distribution: Counter({0: 500, 1: 268})
Step 4: Perform UpSampling:
UpSampling increase  the number of samples in the minority class by adding data points. Here, we use RandomOverSampler from the imbalanced-learn library.
from imblearn.over_sampling import RandomOverSampler
X = data.drop('Outcome', axis=1)
y = data['Outcome']
ros = RandomOverSampler(sampling_strategy='minority')
X_resampled, y_resampled = ros.fit_resample(X, y)
print(f"After Upsampling: {Counter(y_resampled)}")
Output:
After Upsampling: Counter({1: 500, 0: 500})
Step 5. Downsampling the Majority Class
Downsampling reduces the number of samples in the majority class by randomly removing data points. Here, we use RandomUnderSampler from the imbalanced-learn library.
from imblearn.under_sampling import RandomUnderSampler
rus = RandomUnderSampler(sampling_strategy='majority')
X_resampled_down, y_resampled_down = rus.fit_resample(X, y)
print(f"After Downsampling: {Counter(y_resampled_down)}")
Output:
After Downsampling: Counter({0: 268, 1: 268})
Step 6: Visulaization to check the difference
import matplotlib.pyplot as plt
fig, axes = plt.subplots(1, 3, figsize=(15, 5))
axes[0].bar(Counter(y).keys(), Counter(y).values(), color='b')
axes[0].set_title('Original Distribution')
axes[1].bar(Counter(y_resampled).keys(), Counter(y_resampled).values(), color='g')
axes[1].set_title('After Upsampling')
axes[2].bar(Counter(y_resampled_down).keys(), Counter(y_resampled_down).values(), color='r')
axes[2].set_title('After Downsampling')
plt.tight_layout()
plt.show()
Output:
Key Differences Between Upsampling and Downsampling
| Aspect | Upsampling | Downsampling | 
|---|---|---|
| Class Affected | Increases minority class size | Reduces majority class size | 
| Data Loss | No data loss (duplicates data) | Data loss (removes samples) | 
| Dataset Size | Increases the dataset size | Reduces the dataset size | 
| Best Use Case | Small datasets where data is valuable | Large datasets where data removal is acceptable | 
Handling imbalanced datasets with UpSampling and DownSampling improves machine learning models' reliability, especially for critical tasks like fraud detection or medical diagnosis. By balancing the dataset, you ensure your model performs well across all classes, minimizing bias and enhancing accuracy.
