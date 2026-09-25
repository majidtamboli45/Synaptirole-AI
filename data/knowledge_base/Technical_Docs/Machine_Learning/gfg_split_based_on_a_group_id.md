# Split Based on a Group ID?

> Source: https://www.geeksforgeeks.org/machine-learning/how-to-generate-a-train-test-split-based-on-a-group-id/

Splitting a dataset into training and testing sets is a common and critical step in building machine learning models. The typical train_test_split function randomly partitions the data into training and test subsets. However, there are cases when you need to ensure that data related to the same group (such as a customer, patient, or event) appears either in the training set or the test set, but not both. This is where splitting the dataset based on a group ID comes into play. In this article, we will explore how to generate a train-test split based on a group ID, why it's important, and how to implement it efficiently in Python using sklearn and other libraries.
Importance of Group-Based Splitting
Group Based Splitting is required so that the model is evaluated in a correct way. Group Based Splitting ensures that the model generalizes the data well and that it learns the patterns in a deep way. This is critical when:
- Avoiding Data Leakage: Group-related instances appearing in both training and test sets can cause data leakage, leading to overly optimistic performance estimates.
- Real-World Scenarios: Many real-world datasets have hierarchical structures, such as customer transactions, medical records, or time series data. A model trained on data from one group should be tested on data from another group to simulate real-world scenarios more effectively.
When to Use Group-Based Splits
You should use group-based splits when:
- Group Correlation Exists: When observations within a group are not independent. For example, different entries for the same customer, patient, or company.
- Data Hierarchy: When your data has a hierarchy where instances are grouped by some category, and you want to avoid information leakage between training and testing sets.
- Time-Based Data: When the data points are tied to a specific event or person and may share trends that should not appear in both sets.
There are some scenarios where Group Based Splitting is extremely important. They are as follows:
- Bank Data in which one customer has one ID but has performed multiple transactions.
- Medical records where one patient ID has multiple medical records.
- Manufacturing Units where Manufacturing IDs are used to predict the defect.
Methods for Train-Test Splitting by Group
Scikit-Learn Library provides multiple techniques to split the data into train and test based on ids. In this way, it is ensured that the model provides correct prediction and it does not lead to over-optimistic results.
1. GroupShuffleSplit
GroupShuffleSplit is a method present in sklearn library that works similarly like the train-test split but preserves the group ids concept. This method ensures that if a group of data points with a particular ID is present, then either that particular group is present in the training dataset or test dataset.
The syntax for GroupShuffle Split is as follows:
x=GroupShuffleSplit(n_splits='val', test_size='val', random_state='val')
- n_splits: Specify all possible combinations of train and test.
- test_size: In this we divide the data into train and test
- random_state: divide the data in random manner.
For instance we have defined a sample dataset. There are three group ids and we want to split the data into train and test. Then we have used GroupShuffleSplit to split the data into train and test and the number of possible combinations we have defined is 2. Then we are iterating over the splits and printing the train and test for each split.
from sklearn.model_selection import GroupShuffleSplit
import pandas as pd
# Sample dataset
data = {
    'feature1': [1, 2, 3, 4, 5, 6],
    'group_id': [1, 1, 2, 2, 3, 3],
    'target': [0, 1, 0, 1, 0, 1]
}
df = pd.DataFrame(data)
# Initialize GroupShuffleSplit with 3 splits
gss = GroupShuffleSplit(n_splits=2, test_size=0.33, random_state=42)
# Iterate over the splits
for train_idx, test_idx in gss.split(df, groups=df['group_id']):
    train_data = df.iloc[train_idx]
    test_data = df.iloc[test_idx]
    print("Training Data:")
    print(train_data)
    print("\nTesting Data:")
    print(test_data)
    print("\n---\n")
Output:
2. GroupKFold
Cross-validation is a very useful technique as it prevents model from overfitting by ensuring every fold of data acts as test subset. GroupKFold technique is used when we are using k-fold cross-validation to prevent our model from overfitting. In this, the technique ensures that each fold contains the whole group with that particular ID. GroupKFold is also present in Scikit-Learn library.
In GroupKFold we will define 5 splits. This ensures that all the datapoints belonging to particular ID has been acting as test data.
import numpy as np
import pandas as pd
from sklearn.model_selection import GroupKFold
# Sample Data
data = {
    'feature1': np.random.rand(10),
    'feature2': np.random.rand(10),
    'target': np.random.randint(0, 2, 10),
}
df = pd.DataFrame(data)
# Create group IDs
groups = np.array(['A', 'A', 'B', 'B', 'C', 'C', 'D', 'D', 'E', 'E'])  # 5 groups (A, B, C, D, E)
# Initialize Group K-Fold
gkf = GroupKFold(n_splits=5)
# Perform Group K-Fold
for train_index, test_index in gkf.split(df, df['target'], groups=groups):
    print("TRAIN indices:", train_index, "TEST indices:", test_index)
Output:
TRAIN indices: [0 1 2 3 4 5 6 7] TEST indices: [8 9]
TRAIN indices: [0 1 2 3 4 5 8 9] TEST indices: [6 7]
TRAIN indices: [0 1 2 3 6 7 8 9] TEST indices: [4 5]
TRAIN indices: [0 1 4 5 6 7 8 9] TEST indices: [2 3]
TRAIN indices: [2 3 4 5 6 7 8 9] TEST indices: [0 1]
Implementation Example: Group-Based Train-Test Split
1. GroupShuffleSplit
In this example we will be using Iris dataset. Here we will be importing necessary libraries. Then after loading the dataset, for each class we will be assigning group ids. The model used is Random Forest Classifier. Now using GroupShuffleSplit we will split the data by group ids into train and test in the ratio 80:20. Lastly we will be iterating through the combinations and for each combination we will fit the training data, test the model and print the accuracy.
import numpy as np
import pandas as pd
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GroupShuffleSplit
from sklearn.metrics import accuracy_score
# Load the Iris dataset
iris = load_iris()
X = iris.data
y = iris.target
# Create a DataFrame and add a group column
df = pd.DataFrame(X, columns=iris.feature_names)
df['target'] = y
# Assign a group for each sample; using the sample index for simplicity
df['group'] = np.arange(len(y))
# Initialize the model
model = RandomForestClassifier(random_state=42)
# Group Shuffle Split Cross-Validation
print("Group Shuffle Split Cross-Validation:\n")
gss = GroupShuffleSplit(n_splits=2, test_size=0.2, random_state=42)
for i, (train_index, test_index) in enumerate(gss.split(X, y, groups=df['group'])):
    # Prepare the training and testing data
    X_train, X_test = X[train_index], X[test_index]
    y_train, y_test = y[train_index], y[test_index]
    # Fit the model
    model.fit(X_train, y_train)
    # Predict
    y_pred = model.predict(X_test)
    # Calculate accuracy
    accuracy = accuracy_score(y_test, y_pred)
    print(f"TRAIN indices: {train_index}, TEST indices: {test_index}")
    print("Accuracy: "+str(accuracy))
Output:
Group Shuffle Split Cross-Validation:
TRAIN indices: [ 0 1 2 3 4 5 6 7 8 10 11 13 14 15 16 17 20 21
22 23 24 25 27 28 32 33 34 35 37 38 39 40 41 42 43 44
46 47 48 49 50 51 52 53 54 57 58 59 60 61 62 63 65 66
67 70 71 72 74 75 77 79 80 81 83 84 85 86 87 88 89 90
91 92 93 94 95 96 97 98 99 100 101 102 103 105 106 107 109 111
112 113 114 115 116 117 119 120 121 122 123 124 125 126 129 130 133 134
135 136 137 138 139 140 142 144 146 147 148 149], TEST indices: [ 9 12 18 19 26 29 30 31 36 45 55 56 64 68 69 73 76 78
82 104 108 110 118 127 128 131 132 141 143 145]
Accuracy: 1.0
TRAIN indices: [ 0 1 2 4 6 8 10 11 12 15 16 17 18 19 22 23 24 25
26 27 28 29 30 31 32 34 35 36 37 38 39 40 41 42 43 44
50 51 52 53 54 55 56 57 58 59 61 63 64 65 66 67 68 69
70 71 72 73 74 76 78 79 80 81 82 83 85 86 87 88 89 91
92 93 94 95 96 97 98 99 100 102 103 104 105 106 107 109 110 111
112 113 115 116 118 119 120 121 122 124 125 126 127 128 129 130 131 132
133 134 135 136 137 138 139 140 142 143 145 147], TEST indices: [ 3 5 7 9 13 14 20 21 33 45 46 47 48 49 60 62 75 77
84 90 101 108 114 117 123 141 144 146 148 149]
Accuracy: 0.9666666666666667
2. GroupKFold
Here we have used Iris dataset. For Group-K Fold Cross-Validation, we have created 3 splits. Lastly we iterate on each fold, fit the train data and use test data to evaluate the model.
import numpy as np
import pandas as pd
from sklearn.datasets import load_iris
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import GroupKFold
from sklearn.metrics import accuracy_score
# Load the Iris dataset
iris = load_iris()
X = iris.data
y = iris.target
# Create a DataFrame and add a group column
df = pd.DataFrame(X, columns=iris.feature_names)
df['target'] = y
# Assign a group for each sample; using the sample index for simplicity
df['group'] = np.arange(len(y))
# Initialize the model
model = RandomForestClassifier(random_state=42)
# Group K-Fold Cross-Validation
print("Group K-Fold Cross-Validation:\n")
gkf = GroupKFold(n_splits=3)
for i, (train_index, test_index) in enumerate(gkf.split(X, y, groups=df['group'])):
    # Prepare the training and testing data
    X_train, X_test = X[train_index], X[test_index]
    y_train, y_test = y[train_index], y[test_index]
    # Check unique classes in training and testing sets
    print(f"\nFold {i + 1}:")
    print(f"Unique classes in TRAIN: {np.unique(y_train)}")
    print(f"Unique classes in TEST: {np.unique(y_test)}")
    # Check shapes and data integrity
    print(f"TRAIN shapes: X: {X_train.shape}, y: {y_train.shape}")
    print(f"TEST shapes: X: {X_test.shape}, y: {y_test.shape}")
    # Fit the model
    model.fit(X_train, y_train)
    # Predict
    y_pred = model.predict(X_test)
    # Calculate accuracy
    accuracy = accuracy_score(y_test, y_pred)
    print(f"Accuracy: {accuracy:.2f}")
Output:
Group K-Fold Cross-Validation:
Fold 1:
Unique classes in TRAIN: [0 1 2]
Unique classes in TEST: [0 1 2]
TRAIN shapes: X: (100, 4), y: (100,)
TEST shapes: X: (50, 4), y: (50,)
Accuracy: 0.92
Fold 2:
Unique classes in TRAIN: [0 1 2]
Unique classes in TEST: [0 1 2]
TRAIN shapes: X: (100, 4), y: (100,)
TEST shapes: X: (50, 4), y: (50,)
Accuracy: 0.94
Fold 3:
Unique classes in TRAIN: [0 1 2]
Unique classes in TEST: [0 1 2]
TRAIN shapes: X: (100, 4), y: (100,)
TEST shapes: X: (50, 4), y: (50,)
Accuracy: 0.98
As we can see that for each fold the accuracy is changing.
Fold 1: 92%
Fold 2: 94%
Fold 3: 98%
Ensuring Data Integrity During Splitting
We need to ensure that the data is reliable and accurate so that our model generalizes well. There are some techniques to ensure data integrity during splitting.
- Avoid model cheating: When we split the data we need to ensure that the datapoints belonging to particular ID does not lie simultaneously in both train and test data.
- Random Split: Ensure that the datapoints is split randomly so that we can ensure that the model has not become biased and accordingly we can analyze the performance of the model
- Equality: Ensure that the features are also equally distributed along with the datapoints.
- Metrics Evaluation: Ensure that for the group split is proper and the accuracy is properly calculated as there might be scenarios where accuracy can be 0.
Best Practices for Group-Based Splitting
To ensure an effective group-based train-test split, follow these best practices:
- Group Consistency: Always ensure that the group is consistent and all relevant data points are identified by the group ID.
- Stratification: If your dataset is imbalanced, use stratification techniques to maintain class distribution across the splits.
- Avoid Data Leakage: Ensure that no information from the test set leaks into the training set by enforcing group boundaries.
- Cross-Validation: Use group-aware cross-validation techniques such as GroupKFold to validate models on grouped data effectively.
Conclusion
Generating a train-test split based on a group ID is essential when dealing with grouped data, where related instances must be kept together in either the training or testing sets. Using Scikit-Learn’s GroupShuffleSplit and GroupKFold allows you to maintain the integrity of these groups, avoiding data leakage.
