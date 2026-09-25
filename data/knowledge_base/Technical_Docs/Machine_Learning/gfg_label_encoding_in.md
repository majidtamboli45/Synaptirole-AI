# Label Encoding in Python

> Source: https://www.geeksforgeeks.org/machine-learning/ml-label-encoding-of-datasets-in-python/

Label Encoding is a data preprocessing technique used to convert categorical values into numerical labels. It assigns a unique integer to each category, allowing machine learning algorithms to process categorical data in a numerical format. The encoded labels are typically assigned based on the sorted order of unique categories.
- Produces a compact representation of categorical data using a single feature column.
- Commonly applied to target variables and ordinal features in machine learning tasks.
Label Encoding for Categorical Data
Label Encoding is important because many ML algorithms cannot process string values (Categorical Data) directly. Hence, converting them into numerical values is essential for model training. Categorical data is broadly divided into two types:
- Nominal Data: Categories without a natural order, such as colors (Red, Blue, Green).
- Ordinal Data: Categories with a natural order, such as satisfaction levels (Low, Medium, High).
Label encoding works best for ordinal data, where the assigned numbers reflect the order. But when you apply it to nominal data, the numbers accidentally create a fake ranking (e.g., Red = 0, Blue = 1, Green = 2).
- Linear regression treats these numbers as if “Green > Blue > Red” and assumes equal gaps between them.
- This adds artificial relationships that don't exist and can mislead the model, producing wrong coefficients and predictions.
- Thus, the choice of encoding must align with the data type and the algorithm used.
LabelEncoder in Scikit-Learn
LabelEncoder is a utility in sklearn.preprocessing that converts categorical labels into numerical values. It assigns a unique integer to each class and stores the mapping for transforming and recovering original labels. The classes_ attribute contains all unique class labels discovered during fitting.
Common Methods
- fit(y): Learns unique class labels from the data.
- fit_transform(y): Learns labels and returns encoded values.
- transform(y): Converts labels into integer values.
- inverse_transform(y): Converts encoded values back to original labels.
- get_params(deep=True): Returns encoder parameters.
- set_params(params): Updates encoder parameters.
- get_metadata_routing(): Returns metadata routing information.
- set_output(transform=None): Configures the output format.
Implementation
1. Encoding Numeric Labels
- LabelEncoder() creates an encoder that converts categories into numeric labels.
- fit() learns unique sorted classes and stores them in classes_.
- transform() maps labels to integers based on order.
- inverse_transform() converts encoded values back to original labels.
from sklearn.preprocessing import LabelEncoder
le = LabelEncoder()
le.fit([1, 2, 2, 6])
le.classes_                
le.transform([1, 1, 2, 6])     
le.inverse_transform([0, 0, 1, 2])
Output:
array([1, 1, 2, 6])
2. Encoding String Labels
LabelEncoder can also encode non numeric labels (strings) as long as they are hashable.
le = LabelEncoder()
le.fit(["paris", "paris", "tokyo", "amsterdam"])
list(le.classes_)
le.transform(["tokyo", "tokyo", "paris"])
list(le.inverse_transform([2, 2, 1]))
Output:
3. Using scikit-learn’s LabelEncoder
- LabelEncoder is used to convert categorical text data into numeric values.
- Each unique category is mapped to an integer from 0 to n-classes.
- Useful when encoding single categorical columns or target labels.
- Stores mapping inside .classes_ so we can retrieve original labels later.
from sklearn.preprocessing import LabelEncoder
import pandas as pd
data = pd.DataFrame({
    'Fruit': ['Apple', 'Banana', 'Orange', 'Apple', 'Orange', 'Banana'],
    'Price': [1.2, 0.5, 0.8, 1.3, 0.9, 0.6]
})
le = LabelEncoder()
data['Fruit_Encoded'] = le.fit_transform(data['Fruit'])
print(data)
print("Category Mapping:", le.classes_)
Output:
4. Using Pandas Categorical Codes
- Pandas offers a built-in approach to label encoding without external libraries.
- Converts category values into integer codes using astype('category').cat.codes.
- Faster for quick preprocessing inside Pandas workflows.
- Mapping can be extracted using .cat.categories.
data['Fruit_Encoded_Pandas'] = data['Fruit'].astype('category').cat.codes
print(data)
print("Category Mapping:", dict(enumerate(data['Fruit'].astype('category').cat.categories)))
Output:
4. Encoding Ordinal Data Manually
- Used when categories have a natural order.
- Manual dictionary mapping prevents incorrect ordering assumptions.
- Useful for models that rely on ranking information.
- Encoded using map() function in Pandas.
data = pd.DataFrame({
    'Satisfaction': ['Low', 'High', 'Medium', 'Low', 'High'],
    'Score': [3, 8, 5, 2, 9]
})
satisfaction_order = {'Low': 0, 'Medium': 1, 'High': 2}
data['Satisfaction_Encoded'] = data['Satisfaction'].map(satisfaction_order)
print(data)
Output:
5. Handling Unseen Categories in Test Data
- Real datasets may contain new categories not seen during training.
- Applying LabelEncoder directly may cause an error on unseen labels.
- check existence in .classes_ and assign default (-1).
- Ensures model stability during deployment.
train = pd.DataFrame({'City': ['Delhi', 'Mumbai', 'Chennai', 'Delhi']})
test = pd.DataFrame({'City': ['Mumbai', 'Kolkata']})
le = LabelEncoder()
train['City_Encoded'] = le.fit_transform(train['City'])
test['City_Encoded'] = test['City'].apply(lambda x: le.transform([x])[0] if x in le.classes_ else -1)
print(train)
print(test)
Output:
You can download full code from here.
Applications
- Encoding Ordinal Features: Converts ordered categories such as Low, Medium, and High into numerical values.
- Preparing Target Variables: Transforms class labels into numeric form for classification models.
- Tree-Based Machine Learning Models: Provides compact categorical representations for algorithms such as Decision Trees and Random Forests.
- High-Cardinality Categorical Data: Reduces dimensionality when features contain many unique categories.
- Machine Learning Pipelines: Maintains consistent category-to-label mappings during training, validation, and deployment.
Advantages
- Converts categorical values into numerical form quickly and efficiently.
- Does not create additional columns like One-Hot Encoding, making it memory efficient for large datasets.
- Preserves the natural ordering of categories, making it suitable for ordinal features.
- Works effectively with tree-based models such as Decision Trees, Random Forests, XGBoost, and LightGBM, which do not misinterpret encoded integers as magnitude.
- Provides a consistent category-to-label mapping that can be reused during model prediction and deployment.
Limitations
- Encoded values may incorrectly imply an order among nominal categories where no natural ordering exists.
- Models such as Linear Regression, Logistic Regression, KNN, and SVM may interpret encoded integers as meaningful distances, potentially reducing prediction accuracy.
- Cannot directly handle unseen categories in test data, which may result in errors or incorrect mappings.
- May not represent relationships effectively when dealing with features that contain a very large number of unique categories.
Related Article:
