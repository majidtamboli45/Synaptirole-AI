# Mean Encoding in Machine Learning

> Source: https://www.geeksforgeeks.org/machine-learning/mean-encoding-machine-learning/

Mean Encoding, also known as Target Encoding, is a technique that converts categorical variables into numerical values by replacing each category with the average value of the target variable for that category. It is particularly useful for features with a large number of unique categories.
- Works effectively with high cardinality categorical features.
- Creates fewer features compared to One-Hot Encoding.
- Captures the relationship between categories and the target variable.
- Often improves model performance by providing more meaningful numerical representations.
Working of Mean Encoding
Mean Encoding replaces each category with the average value of the target variable for that category.
Example Dataset
| City | Purchased | 
|---|---|
| Delhi | 1 | 
| Mumbai | 0 | 
| Delhi | 1 | 
| Chennai | 0 | 
| Mumbai | 1 | 
Step 1: Calculate Mean Target Value for Each Category
| City | Mean Purchased | 
|---|---|
| Delhi |  | 
| Mumbai |  | 
| Chennai |  | 
Step 2: Replace Categories with Mean Values
| City (Encoded) | Purchased | 
|---|---|
| 1.0 | 1 | 
| 0.5 | 0 | 
| 1.0 | 1 | 
| 0.0 | 0 | 
| 0.5 | 1 | 
Implementation
1. Import Required Library
- Imports the Pandas library for data manipulation and analysis.
- Pandas provides DataFrame objects that make it easy to work with tabular data.
import pandas as pd
2. Create the Dataset
- Creates a sample dataset containing a categorical feature (City) and a target variable (Purchased).
- The target variable indicates whether a purchase was made (1) or not (0).
df = pd.DataFrame({
    "City": [
        "Delhi",
        "Mumbai",
        "Delhi",
        "Chennai",
        "Mumbai"
    ],
    "Purchased": [
        1,
        0,
        1,
        0,
        1
    ]
})
print(df)
Output:
3. Calculate Mean Value for Each Category
- Groups the dataset by the City column.
- Calculates the average value of the Purchased column for each city.
- These mean values will be used as the encoded values.
mean_encoding = df.groupby(
    "City"
)["Purchased"].mean()
print(mean_encoding)
Output:
4. Apply Mean Encoding
- Uses the map() function to replace each city with its corresponding mean target value.
- Creates a new column called City_Encoded containing the encoded values.
df["City_Encoded"] = df["City"].map(
    mean_encoding
)
print(df)
Output:
Download code from here
