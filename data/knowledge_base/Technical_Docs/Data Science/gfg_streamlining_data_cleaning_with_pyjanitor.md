# Streamlining Data Cleaning with PyJanitor

> Source: https://www.geeksforgeeks.org/data-science/streamlining-data-cleaning-with-pyjanitor-a-comprehensive-guide/

Data cleaning is one of the most important steps in the data analysis process. Raw data often contains missing values, inconsistent column names, duplicates, or unwanted entries. Cleaning such data manually using Pandas can become repetitive and error-prone, especially for large datasets.
What is PyJanitor?
PyJanitor is an open-source Python library that extends Pandas by adding convenient functions for data cleaning. It helps perform common tasks such as renaming columns, handling missing values, filtering data, and encoding categorical variables with minimal code.
The goal of PyJanitor is to make data cleaning simpler, faster, and less error-prone, especially for beginners.
Key Features of PyJanitor
PyJanitor offers a variety of features that simplify data cleaning:
- Method Chaining: Apply multiple cleaning steps in a single readable pipeline.
- Convenient Functions: Ready-made functions for common data-cleaning tasks.
- Pandas Integration: Works seamlessly with Pandas DataFrames.
- Custom Functions: Allows users to integrate their own cleaning logic.
Installing PyJanitor
You can install PyJanitor using pip:
pip install pyjanitor
Using PyJanitor for Data Cleaning in Python
1. Cleaning Column Names
clean_names() function standardizes column names by:
- Converting to lowercase
- Replacing spaces with underscores
- Removing special characters
import pandas as pd
import janitor
data = pd.DataFrame({'Column_1': [1, 2], 'Column_2': [3, 4]})
data = data.clean_names(remove_special=True)
print(data)
Output
      column_1    column_2
0           1                 3
1           2                4
2. Removing Empty Rows and Columns
Use remove_empty() to remove rows or columns containing only missing values.
import pandas as pd
import janitor
data = {'A': [1, None, 3], 'B': [4, None, 6]}
data = pd.DataFrame(data)  
data = data.remove_empty()   
print(data)
Output
      A       B
0   1.0   4.0
1   3.0   6.0
3. Identifying Duplicate Data Points
We can identify the data points that are repeated using the duplicated() function, which returns True if all the columns of a data point are repeated, and False if any one is not repeated.
import pandas as pd
import janitor
data = {
    'A': [1, 2, 2, 4],
    'B': [5, 6, 6, 8]
}
data = pd.DataFrame(data)
dup = data.duplicated()
print(dup)
Output
0    False
1    False
2     True
3    False
dtype: bool
4. Encoding Object Data Type to Categorical
We can encode an object data type to a categorical data type using the encode_categorical() function, in which we need to pass the column names for which we want to encode.
import pandas as pd
import janitor
data = {
    'A': ['low', 'medium', 'high', 'medium', 'low'],
    'B': ['type1', 'type2', 'type1', 'type3', 'type2']
}
data = pd.DataFrame(data)
print(data.dtypes)
data = data.encode_categorical(column_names=['A', 'B'])
print(data)
print(data.dtypes)
Output
A    object
B    object
dtype: object
        A      B
0     low  type1
1  medium  type2
2    high  type1
3  medium  type3
4     low  type2
A    category
B    category
dtype: object
Explanation:
- data = pd.DataFrame({...}): Create a DataFrame with columns 'A' and 'B'.
- data.encode_categorical(column_names=['A', 'B']): Convert specified columns to categorical type.
5. Renaming Columns
Renaming columns is common in data cleaning; PyJanitor’s clean_names standardizes names to lowercase and replaces spaces with underscores.
import pandas as pd
import janitor
data = {
    'First Name': [1, 2, 3, 4],
    'Last Name': [5, 6, 7, 8],
    'Age (Years)': [9, 10, 11, 12]
}
df = pd.DataFrame(data)
c1 = df.clean_names()
print(c1)
Output
       first_name   last_name     age_years_
0             1                5                     9
1             2                6                    10
2            3                7                    11
3           4               8                     12
6. Filtering Data
Filtering data based on certain conditions is a common data cleaning task. PyJanitor provides the filter_string function to filter rows based on string conditions.
import pandas as pd
import janitor
data = {
    'Name': ['Smith', 'Robert', 'Mary', 'Harry'],
    'Age': [25, 30, 35, 40]
}
df = pd.DataFrame(data)
d1 = df.filter_string(column_name='Name', search_string='a')
print(d1)
Output
       Name    Age
2     Mary    35
3    Harry    40
Pipe() Method: Chaining Operations
- The pipe() method of PyJanitor is used to chain multiple data-cleaning operations.
- This method helps us to write more readable code.
- We can do a series of operations in a clear manner, making it easier to understand. Here’s an example of how to use this function.
Example:
import pandas as pd
from janitor import clean_names, remove_empty
company_sales = {
    'SalesMonth': ['Jan', 'Feb', None, 'April'],
    'Company1': [150.0, 200.0, None, 400.0],
    'Company2': [180.0, 250.0, None, 500.0],
    'Company3': [400.0, 500.0, None, 675.0]
}
data = (
    pd.DataFrame.from_dict(company_sales)
    .pipe(clean_names)
    .pipe(remove_empty)
)
print(data)
Output
     salesmonth  company1  company2  company3
0        Jan          150.0            180.0           400.0
1        Feb          200.0           250.0          500.0
2      April         400.0           500.0          675.0
Key PyJanitor Functions
Now that we have understood the main features of PyJanitor, let's dive deep into some other main functions.
1. fill_empty(data, column_names, value)
The fill_empty function replaces empty values in a column with a specified value.
- column_names: the column(s) to fill (use a string for one column or a list for multiple columns).
- value: the value to replace the empty cells.
Example:
import pandas as pd
import janitor as jn
data = pd.DataFrame(
    {
        'col1': [1, 2, 3],
        'col2': [None, 4, None],
        'col3': [None, 5, 6]
    }
)
data = jn.impute(data, column_names=['col2', 'col3'], value=0)
print(data)
Output
      col1    col2     col3
0      1        0.0      0.0
1      2        4.0      5.0
2     3        0.0     6.0
Explanation: jn.impute(data, column_names=['col2', 'col3'], value=0): Fill missing values in columns 'col2' and 'col3' with 0.
2. filter_on(data, criteria, complement=False)
The filter_on function lets you filter rows in a DataFrame based on a condition. It does not change the original data.
- criteria: the condition as a string (e.g., "score >= 50").
- complement: default is False. Set to True to get rows not matching the condition.
Example:
import pandas as pd
data = pd.DataFrame({
    "student_id": ["S1", "S2", "S3", "S4", "S5"],
    "score": [45, 75, 50, 90, 30],
})
f1 = data.query("score >= 50")
print(f1)
Output
     student_id    score
1          S2             75
2         S3              50
3        S4              90
Explanation: f1 = data.query("score >= 50"): Filter rows where the score is greater than or equal to 50.
3. rename_column(data, old_column_name, new_column_name)
The rename_column function is used to change a column name in a DataFrame.
- old_column_name: the current column name you want to change.
- new_column_name: the new name you want to give.
Example:
import pandas as pd
data = pd.DataFrame({"x": [10, 20, 30], "y": [40, 50, 60]})
data = data.rename(columns={'x': 'x_new'})
print(data)
Output
      x_new   y
0       10     40
1       20    50
2      30    60
Explanation: data = data.rename(columns={'x': 'x_new'}): Rename column x to x_new.
4. add_column(df, column_name, value, fill_remaining=False)
The add_column function is used to add a new column to a DataFrame.
- column_name: the name of the new column.
- value: the value(s) to fill in the column. You can provide a single value (e.g., 3) for all rows, or a list/range for different values in each row.
Example:
import pandas as pd
data = pd.DataFrame({"a": list(range(3)), "b": list("abc")})
data = data.assign(
    c=1,
    d=list("efg"),
    e=range(4, 7)
)
print(data)
Output
       a   b   c   d   e
0    0   a   1    e   4
1     1   b   1    f    5
2    2   c   1   g  6
Explanation:
- pd.DataFrame({"a": list(range(3)), "b": list("abc")}): Create a DataFrame with columns a and b.
- data.assign(c=1, d=list("efg"), e=range(4, 7)): Add new columns:
 c with all values 1
 d with values 'e', 'f', 'g'
e with values 4, 5, 6
