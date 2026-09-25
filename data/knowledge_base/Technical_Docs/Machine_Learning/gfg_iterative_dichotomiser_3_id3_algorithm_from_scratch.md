# Iterative Dichotomiser 3 (ID3) Algorithm From Scratch

> Source: https://www.geeksforgeeks.org/machine-learning/iterative-dichotomiser-3-id3-algorithm-from-scratch/

The Iterative Dichotomiser 3 (ID3) algorithm is a decision tree learning algorithm used for solving classification problems. It constructs a tree by selecting attributes that maximize Information Gain, which is computed using entropy. ID3 follows a greedy, top-down recursive strategy to split the dataset until the classification becomes pure or no attributes remain. Let's see some key concepts:
- Decision Tree Learning: Represents classification logic using a tree structure.
- Entropy: Measures impurity or randomness in the target variable.
- Information Gain: Quantifies reduction in entropy after a split.
- Greedy Approach: Chooses the best split at each step without backtracking.
- Categorical Attributes: Originally designed for categorical features.
Working
Let's see how ID3 works
- Initialize the Dataset: The algorithm begins by taking the complete training dataset along with the target class attribute. At this stage, all input features are considered as potential candidates for splitting.
- Compute Entropy of Target Attribute: Entropy is calculated for the target class to measure the level of impurity or randomness present in the dataset. This value acts as a baseline for evaluating future splits.
- Calculate Information Gain for Each Attribute: For every input attribute, the dataset is split based on its distinct values and entropy is computed for each subset. Information gain is then calculated as the reduction in entropy caused by splitting on that attribute.
- Select the Best Attribute for Splitting: The attribute with the highest information gain is selected as the decision node because it best separates the data into homogeneous classes.
- Partition the Dataset: The dataset is divided into multiple subsets based on the values of the selected attribute. Each subset corresponds to one branch of the decision tree.
- Create Child Nodes Recursively: The same process of entropy calculation and information gain evaluation is recursively applied to each subset to grow the decision tree further.
- Check Stopping Conditions: The recursion stops if all instances in a subset belong to the same class, if no attributes are left for further splitting or if the subset becomes empty.
- Assign Class Labels to Leaf Nodes: When a stopping condition is met, a leaf node is created and assigned the majority class label of the corresponding subset.
Implementation
Let's see the python implementation,
Step 1: Import Libraries
We need to import the necessary libraries such as Pandas, NumPy, Matplotlib.
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
Step 2: Entropy Function
- Unique class labels and their frequencies are extracted from the target column.
- Class probabilities are computed using frequency counts.
- Entropy is calculated using the standard entropy formula.
- This function measures impurity at any node in the decision tree.
def entropy(target_col):
    elements, counts = np.unique(target_col, return_counts=True)
    entropy_value = -np.sum([
        (counts[i] / np.sum(counts)) * np.log2(counts[i] / np.sum(counts))
        for i in range(len(elements))
    ])
    return entropy_value
Step 3: Information Gain Function
- Entropy of the full dataset is calculated before splitting.
- The dataset is split based on each unique value of the selected feature.
- Entropy is computed for every subset created by the split.
- A weighted sum of subset entropies is calculated.
- Information gain is obtained by subtracting weighted entropy from total entropy.
def information_gain(data, feature, target="Class"):
    total_entropy = entropy(data[target])
    values, counts = np.unique(data[feature], return_counts=True)
    weighted_entropy = np.sum([
        (counts[i] / np.sum(counts)) *
        entropy(data[data[feature] == values[i]][target])
        for i in range(len(values))
    ])
    return total_entropy - weighted_entropy
Step 4: Recursive ID3 Tree Construction
- This function builds the decision tree recursively.
- It takes the current dataset original dataset, remaining features and target column.
def id3(data, original_data, features, target="Class", parent_node_class=None):
Step 5: Handle Stopping Conditions and Majority Class
- Stops recursion when data becomes pure.
- Handles empty subsets safely.
- Assigns majority class when no features remain.
if len(np.unique(data[target])) == 1:
    return np.unique(data[target])[0]
if len(data) == 0:
    return np.unique(original_data[target])[np.argmax(
        np.unique(original_data[target], return_counts=True)[1])]
if len(features) == 0:
    return parent_node_class
Step 6: Select Best Feature and Split Dataset
- Identifies the most frequent class for fallback prediction.
- Selects the attribute with highest information gain.
- Initializes the decision node.
parent_node_class = np.unique(data[target])[np.argmax(
    np.unique(data[target], return_counts=True)[1])]
gains = [information_gain(data, feature, target) for feature in features]
best_feature = features[np.argmax(gains)]
tree = {best_feature: {}}
features = [f for f in features if f != best_feature]
Step 7: Recursive Subtree Generation
- Splits data based on feature values.
- Recursively builds child nodes.
- Attaches subtrees to the main decision node.
for value in np.unique(data[best_feature]):
    subset = data[data[best_feature] == value]
    subtree = id3(subset, original_data, features, target, parent_node_class)
    tree[best_feature][value] = subtree
Step 8: Execute Model and Output Tree
- Dataset is defined and processed.
- ID3 algorithm is executed.
- Final decision tree is printed as a nested dictionary.
data = pd.DataFrame({...})
features = list(data.columns[:-1])
tree = id3(data, data, features)
print(tree)
Output:
{'Outlook': {'Overcast': 'Yes', 'Rain': {'Wind': {'Strong': 'No', 'Weak': 'Yes'}}, 'Sunny': 'No'}}
Applications
- Medical Diagnosis Systems: ID3 is used to classify diseases based on symptoms and patient attributes by generating interpretable decision rules.
- Credit Risk Assessment: Banks and financial institutions use ID3 to decide loan approval or rejection based on applicant features.
- Customer Segmentation: It helps group customers based on behavior, preferences or demographics for targeted marketing.
- Educational Analytics: ID3 is applied to predict student performance, dropout risk or grade classification.
- Expert Systems: The algorithm is widely used in rule-based expert systems where decision transparency is required.
Advantages
- Simple and Easy to Understand: The tree structure and decision rules produced by ID3 are intuitive and human-readable.
- Automatic Feature Selection: ID3 automatically selects the most informative attributes using information gain.
- Non-Parametric Nature: It does not assume any prior data distribution, making it flexible for different datasets.
- Efficient for Small Datasets: ID3 performs well and trains quickly on small to medium-sized datasets.
- Rule Extraction Capability: The generated decision tree can be easily converted into if–else rules.
Limitations
- Overfitting Problem: ID3 does not include pruning, which can lead to overly complex trees.
- Bias Toward Multi-Valued Attributes: Attributes with many distinct values tend to have higher information gain, causing biased splits.
- Handling of Continuous Data: ID3 cannot directly handle numerical attributes without prior discretization.
- Sensitivity to Noise: Noisy or inconsistent data can significantly affect the quality of the decision tree.
- Greedy Learning Strategy: The algorithm chooses locally optimal splits and may miss the globally optimal tree.
