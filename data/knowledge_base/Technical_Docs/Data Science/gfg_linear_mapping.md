# Linear Mapping

> Source: https://www.geeksforgeeks.org/data-science/linear-mapping/

Linear mapping is a mathematical operation that transforms a set of input values into a set of output values using a linear function. It is often used as a preprocessing step to transform the input data into a more suitable format for analysis. It can also be used as a model in itself, such as in linear regression or linear classifiers.
The linear mapping function can be represented as follows
y = Wx +b 
where
- x is the input vector,
- W is the weight matrix
- b is the bias vector
- y is the output vector.
The weight matrix and bias vector are learned during the training process.
Let V and W be vector spaces over a field K. A function f: V -> W is called a linear map if, for any vectors u, v ∈ V and a scalar c ∈ K, the following conditions hold:
- If the transformation is additive in nature:
f ( u + v ) = f ( u ) + f ( v ) 
- If transformation is homogeneity:
f ( c . u ) = c . f ( u ) 
Zero/Identity Transformation
A  linear transformation 
Zero-Transformation: For a transformation 
T ( v ) = 0 \forall V 
Identity-Transformation: For a transformation 
T ( v ) = v \, \forall \, V 
Properties of Linear Transformation
Let  
- T(0) =0
- T ( -v ) = -T ( v )
- T ( u - v ) = T( u ) - T( v )
If 
Then, 
Linear Transformation of Matrix
Let T be a mxn matrix, the transformation 
T(v) = Av 
Zero and Identity Matrix operations
- A matrix mxn matrix is a zero matrix, corresponding to zero transformation from R^n \rightarrow R^m.
- A matrix nxn matrix is Identity matrix \mathbb{I_n} , corresponds to zero transformation fromR^n \rightarrow R^m .
Example
Let's consider the linear transformation from 
Now, we will be verifying that it is a linear transformation. For that we need to check for the above two conditions for the Linear mapping, first, we will be checking the constant multiplicative conditions:
L(c \vec{v}) = c \cdot L(\vec{v}) L(c\begin{bmatrix} v_1\\ v_2 \end{bmatrix})= \begin{bmatrix} c v_1\\ c v_1 - c v_2 \\ c v_1 + c v_2 \end{bmatrix}= c \begin{bmatrix} v_1\\ v_1 - v_2 \\ v_1 + v_2 \end{bmatrix} = c L(\vec{v}) 
and the following transformation:
L(\vec{v} + \vec{w})= L(\vec{v}) + L(\vec{w}) \vec{v} =\begin{bmatrix} v_1 \\ v_2 \end{bmatrix} \\\vec{w} =\begin{bmatrix} w_1 \\ w_2 \end{bmatrix} \\\\\vec{v} + \vec{w} =\begin{bmatrix} v_1 + w_1\\ v_2 + w_2 \end{bmatrix} L(\vec{v} + \vec{w}) = \begin{bmatrix} v_1 + w_1\\ (v_1 + w_1) - (v_2 + w_2)\\ (v_1 + w_1) + (v_2 + w_2) \end{bmatrix} = L(\vec{v}) + L(\vec{w}) 
It proves that the above transformation is Linear transformation. 
Examples of not linear transformation include trigonometric transformation, polynomial transformations.
Kernel and Range Space
Let 
- The kernel space of zero transformation for T:V \rightarrow W is W.
- The kernel space of identity transformation for T:V \rightarrow W is {0}.
The dimensions of the kernel space are known as nullity or null(T).
Range Space
 Let 
The dimensions of the range space are known as rank (T). The sum of rank and nullity is the dimension of the domain:
null(T) + rank(T) = dim(V)=n 
Linear Transformation as Rotation
Some of the transformation operators when applied to some vector give the output of vector with rotation with angle \theta of the original vector.
The linear transformation 
Let v 
which is similar to rotating the original vector by 
Linear Transformation as Projection
A linear transformation 
T = 
If a vector is given by v = (x, y, z). Then, 
Advantages of Linear Mapping
- Simplicity: It is a simple and easy-to-understand mathematical operation, making it an attractive choice for many machine learning tasks.
- Speed: It is a computationally efficient operation, making it suitable for large datasets and real-time applications.
- Interpretability: It is a transparent and interpretable operation, making it easier to understand and analyze the results of a model.
- Versatility: It can be applied to a wide range of machine-learning tasks, including regression, classification and clustering.
Limitations of linear mapping
- Limited expressiveness: It can only model linear relationships between variables, which may not be sufficient for complex tasks that require non-linear relationships.
- Sensitivity to outliers: It is sensitive to outliers in the data, which can lead to poor model performance.
- Limited feature engineering: It may not be able to capture complex interactions between features, which can limit its ability to extract meaningful information from the data.
