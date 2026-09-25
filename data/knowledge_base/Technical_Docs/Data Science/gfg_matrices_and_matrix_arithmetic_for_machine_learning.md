# Matrices and Matrix Arithmetic for Machine Learning

> Source: https://www.geeksforgeeks.org/data-science/matrices-and-matrix-arithmetic-for-machine-learning/

Matrices are used in machine learning to handle data in multi-dimensional form, making computations efficient. Many algorithms like linear regression, neural networks, and dimensionality reduction rely on matrix operations to process and analyze data.
- A matrix is a two-dimensional array of numbers arranged in rows and columns
- Each element is represented as a[i][j] where i is the row number and j is the column number
- The order of a matrix is written as m×n, where m is the number of rows and n is the number of columns
Defining a Matrix in Python
In Python the NumPy library is commonly used to work with matrices. Matrices can be created using the numpy.array() function:
import numpy as np
matrix = np.array([[1, 2, 3],
                   [4, 5, 6],
                   [7, 8, 9]])
print(matrix)
Output:
[[1 2 3]
[4 5 6]
[7 8 9]]
Here we see a list of lists which is a two-dimensional array having 3 rows and 3 columns. The order of the above matrix is 3 x 3.
Matrix Arithmetic
Matrix arithmetic involves performing mathematical operations on matrices. These operations are fundamental in machine learning for manipulating and transforming multi-dimensional data efficiently.
1. Matrix Addition
Matrix addition combines two matrices of the same order by adding their corresponding elements. Addition is done using the + operator in Python. It is only possible when both matrices have the same number of rows and columns.
import numpy as np
A = np.array([[1, 2],
              [3, 4]])
B = np.array([[5, 6],
              [7, 8]])
C = A + B
print(C)
Output:
[[ 6 8]
[10 12]]
Here we have two matrices A and B. Add each element of A with the corresponding element in B
C[0][0] = 1 + 5 = 6
C[0][1] = 2 + 6 = 8
C[1][0] = 3 + 7 = 10
C[1][1] = 4 + 8 = 12
We can see that the corresponding elements are added and we get the final matrix with the same order.
2. Matrix Subtraction
Matrix subtraction subtracts the corresponding elements of two matrices of the same order. Subtraction is done using the - operator in Python. It is only possible when both matrices have the same number of rows and columns.
import numpy as np
A = np.array([[1 , 2],[3 , 4]])
B = np.array([[0 , 1],[2 , 1]])
C = A - B
print(C)
Output:
[[1 1]
[1 3]]
Here we have two matrices A and B. Subtract each element of B from the corresponding element in A:
C[0][0] = 1 - 0 = 1
C[0][1] = 2 - 1 = 1
C[1][0] = 3 - 2 = 1
C[1][1] = 4 - 1 = 3
We can see that the corresponding elements are subtracted and the resultant matrix has the same order.
3. Matrix Division
Matrix division divides the corresponding elements of two matrices of the same order. Division is done using the / operator for float division or // operator for integer division in Python.
import numpy as np
A = np.array([[4 , 2],[6 , 8]])
B = np.array([[2 , 2],[3 , 4]])
C = A//B
print(C)
Output:
[[2 1]
[2 2]]
Here we have two matrices A and B. Divide each element of A by the corresponding element in B:
C[0][0] = 4 // 2 = 2
C[0][1] = 2 // 2 = 1
C[1][0] = 6 // 3 = 2
C[1][1] = 8 // 4 = 2
The resultant matrix has the same order as the original matrices.
4. Matrix Multiplication ( Dot product )
Matrix multiplication multiplies rows of the first matrix with columns of the second matrix. Multiplication is done using the .dot() method or the @ operator in Python. It requires that the number of columns in the first matrix equals the number of rows in the second matrix.
Note : Matrices do not satisfy commutative property. AB is not equal to BA
A = np.array([[1, 2],
              [3, 4]])
B = np.array([[5, 6],
              [7, 8]])
C = A.dot(B)
print(C)
Output:
[[19 22]
[43 50]]
The matrix A is of order 2 x 2 and B is also 2 x 2. Multiplication is possible because the columns of A equal the rows of B. Each element of the resulting matrix C is calculated by taking the dot product of a row from A with a column from B, summing the products to get the corresponding element in C.
C[0][0] = 1*5 + 2*7 = 19
C[0][1] = 1*6 + 2*8 = 22
C[1][0] = 3*5 + 4*7 = 43
C[1][1] = 3*6 + 4*8 = 50
5. Vector multiplication
A vector is a one-dimensional array that can be either a row or a column. A row vector has a single row while a column vector has a single column. To multiply a matrix by a vector, the number of columns in the matrix must equal the number of rows in the vector.
A = np.array([[1, 2],
              [1, 1]])
V = np.array([[1],
              [1]])
C = A.dot(V)
print(C)
Output:
[[3]
[2]]
Here we multplied the matrix A with vector V and we got a column vector C. In the same way we can multiply a matrix with a row vector and the dot product will also be a row vector.
C[0][0] = 1*1 + 2*1 = 3
C[1][0] = 1*1 + 1*1 = 2
6. Scalar multiplication
When we multiply a matrix with a scalar then it is multiplied with each and every element in the matrix. The order remains same even after multiplying the matrix with scalar. We use matrix - scalar multiplications while solving equations in linear algebra.
import numpy as np
A = np.array([[1,2],[3,4]])
b = 2
print(A * b)
Output:
[[2 4]
[6 8]]
In the above matrix, we can see that b = 2 is multiplied with each element in the matrix.
C[0][0] = 1 * 2 = 2
C[0][1] = 2 * 2 = 4
C[1][0] = 3 * 2 = 6
C[1][1] = 4 * 2 = 8
