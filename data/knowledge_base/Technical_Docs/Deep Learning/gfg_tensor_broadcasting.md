# Tensor Broadcasting

> Source: https://www.geeksforgeeks.org/deep-learning/tensor-broadcasting/

Tensor broadcasting is a concept of array processing libraries like TensorFlow and NumPy, it allows for implicit element-wise operations between arrays of different shapes. In this article, we will learn about tensor broadcasting, it's significance and steps to perform tensor broadcasting.
Tensor Broadcasting
- This technique allows us to perform element-wise operations between two or more tensors of different shapes but having compatible shapes.
- Broadcasting is done when we have different shapes of different ranks but those must be compatible and meet certain conditions.
- In this technique, we make changes to the shapes that are compatible by changing the length of their dimension to meet the length of the dimension of the shape of the other tensor.
Significance of Tensor Broadcasting in Array Operations
- Tensor broadcasting is mostly used in array operations. This technique is applied to libraries like NumPy, TensorFlow, and PyTorch because these libraries are array oriented.
- It is most significant because it helps us to handle many operations where we perform arithmetic operations on two tensors of different shapes, sizes, and dimensions.
- When two tensors are of different shapes, it becomes impossible to perform element-wise arithmetic operations and we have to manually reshape and optimize them so that they match each other's shapes and dimensions. It is too time-consuming and not efficient to do this task manually when we are working with large amounts of data from different categories, where we have to handle complex data such as images data ,speech data and complex scientific computing.
- Broadcasting technique available in these libraries makes our work easier by automatically aligning dimensions ,shapes and sizes of tensors . It makes our codes concise and more readable and optimize.
- These becomes even more important to have knowledge about this technique when dealing with machine learning, deep learning and data analysis operations.
Prerequisites
Tensor
We know that Vector is a 1D array and Matrix is a 2D array and scaler is 0D array. Tensor is Multi-dimensional Array used to store many Arrays in its multiple dimensions, and we can say that Vector is a 1-dimension tensor and Matrix is a 2-dimension tensor and scalar is of 0 dimension.
Example of 2D tensor:
tensor_2d =tf.constant([ [1,  2 , 3 ],
[4, 4, 5 ],
[7, 8 ,8 ] ] )
Compatible Shape
Compatible shapes refers to the shape of the tensors which follow certain conditions which lead us to perform elementwise Arithmetic operations of our tensors. Some conditions to meat the compatible shapes are :-
- Equal shapes - When the shape of the tensor T1 and tensor T2 are exactly same . Then Operations are easily applied without broadcasting . Given down the example
- One of the dimension is 1- If one of the dimension of any dimension pair is 1 . In above example tensor T2 shape (3,1) has one in its back dimension and tension T1 (3,3) don't have any one in its dimension . So, We have to broadcast along the dimension where the tensor dimension is 1 to match the corresponding dimension of the other tensor T1.
The tensor shapes which don't follow the above conditions are non-compatible shapes.
Element-Wise operation
This is performed between two or more tensors. The element of the tensor T1 should add, subtract, divide, multiply with corresponding element of the tensor T2 having the same Compatible shape as the tensor T2, this is called the Element -wise operation with the resulting tensor of same shape as T1 and T2.
The condition for Elementwise operation is that they both should have compatible shapes as each other.
We can apply Broadcasting to the compatible shapes only , broadcasting can't be applied to non-compatible shapes.
Now let's deep dive into the examples , rules and steps needed to perform tensor broadcasting.
Step by step process to perform Tensor Broadcasting
1. Different Shapes:
When the two tensors are having different shapes, they can be broadcasted to perform arithmetic operations, when their shapes are compatible.
As we discussed above the conditions for any tensor's shape to be compatible are-
- If both the shapes are equal
- If one of the dimensions of the shape is 1
Rules:
- In above example we have noticed that T2 is compatible --as it contains 1 in its front dimension of the shape -- also both tensors' Ranks are same
- Expanding T2 from its row length to match the T1.
import tensorflow as tf
T1 = tf.constant([[1, 2, 8],          # Shape: (2, 3)
                   [4, 7, 6]])
T2 = tf.constant([[7, 8, 10]])        # Shape: (1, 3)
# T2 is compatible so broadcasting it to match the size of shape of T1
# Ranks of both the tensors are 2
# Performing arithmetic operation
T3 = T1 + T2
print(T3)
Output:
tf.Tensor(
[[ 8 10 18]
[11 15 16]], shape=(2, 3), dtype=int32)
Now, this T1 and T2 can be used to perform any elementary operations
2. Different Ranks
When the two tensors have different ranks or the tensors are of different dimensions. In which one tensor is of lower dimension and other is of higher dimension.
One of the tensor Rank is 1: If the tensor has Singleton dimension i.e. the dimension of size 1 . It is considered to have size 1 along missing dimension of T2.
- Broadcasting in the below example will start from trailing dimension of the T2.
- This singleton dimension is treated as having size 1.
- Sizes along the corresponding dimension of the corresponding tensors are compared.
- T2 is expanded along its singleton dimension which is trialing dimension to match the size of T1.
- Expanded along next axis of next dimension.
import tensorflow as tf
# Tensor T1: 
T1 = tf.constant([[1, 2, 3],      #Rank 2 , shape(2,3)  
              [4, 5, 6]])
# Tensor T2: 
T2 = tf.constant([20, 40, 50])    #Rank 1 ,shape(3,)
# Broadcasting T2 to shape (2, 3) to match T1
#arithmetic operation
T3=T1+T2
print(T3)
Output:
tf.Tensor(
[[21 42 53]
[24 45 56]], shape=(2, 3), dtype=int32)
Broadcasted form of T2 will be of Rank 2 and shape (3,2)
One of the tensors Rank 0 (Scaler): Scalar is a tensor of Rank 0 and can be broadcasted along its size to match the size of the higher dimensional tensor to perform elementwise operation.
- When performing the broadcasting of the scaler we have to compare the sizes of the dimensions of both tensors
- Now we have to expand scaler along all the dimensions of the tensor T1.
- Replicate the value of scaler along all the dimensions of the newly broadcasted tensor.
import tensorflow as tf
T1 =tf.constant([[1, 2, 3],      # Rank 2 , shape (2,3)
              [4, 5, 8]])
T2 =tf.constant (20)           # Rank 0 , shape()
#arithmetic operation
T3 =T1+T2
print(T3)
Output:
tf.Tensor(
[[21 22 23]
[24 25 28]], shape=(2, 3), dtype=int32)
Now this is the broadcasted tensor and elementwise operations can be performed on it now.
Both tensors Rank is of higher dimensions:
- When we are given two tensors of different ranks, one is of lower rank and other is of higher rank let's say (2,3) and (2,3,2) respectively.
- Broadcasting is done on the lower dimension to match the shape of the higher dimension tensor to be able to perform elementwise operation.
- Broadcasting is performed on the lower rank tensor, and it is expanded along its singleton dimension to match the dimension of the other tensor.
Given below the example of two tensors, T1 is the tensor of higher rank and T2 the tensor of lower rank. And broadcasting will be performed on the T2.
- Broadcasting in T2 starts from the trailing dimension of its shape.
- Compare the sizes of the corresponding dimensions of the two tensors.
- In tensor T2 of shape (2,3 ) we consider a singleton dimension i.e (the dimension which has size or number of elements along that dimension is one only) along a trailing end by adding new axis at end.
- We can add new axis at the end by 'tf.expand_dims(input, axis ,name)' in the tensorflow ---- And the resulting shape of T2 becomes as (2,3,1) --- after addition of new axis at the trailing point.
- Now when we check for of them for compatibility they both are compatible now ---- as tensor T2 as a 1 at the end
- The broadcasting occurs and T2 is expanded along the singleton dimension i.e 1 to match the shape of the tensor T1.
- Resulting tensor T2 will be of shape (2,3,2) after broadcasting to match the shape of the tensor T1.
- Now we can perform elementwise operation and resultant also be the shape of (2,3,2)
import tensorflow as tf
# tensor T1
T1 =tf. constant([[[10, 11],   #Rank 3 and shape(2,3,2)
                   [20, 20],
                   [30, 30]],
              
                 [ [40, 41],
                   [50, 50],
                   [60, 60]   ]])
# tensor T2
T2= tf.constant([[1, 2, 3],    # Rank 2 and shape (2,3)
                 [4, 5, 6]])
#Adding new axis to T2 by .expand_dims() at its trailing end
broadcasted_T2 = tf.expand_dims(T2, axis=-1)
# arithmetic operation
T3=broadcasted_T2+ T1
print(T3)
Output:
tf.Tensor(
[[[11 12]
[22 22]
[33 33]]
[[44 45]
[55 55]
[66 66]]], shape=(2, 3, 2), dtype=int32)
Now this is the broadcasted tensor and element wise operations can be performed on it now.
Applications of Tensor Broadcasting
Tensor Broadcasting is widely used in the Machine learning, deep learning and Data analysis applications etc. where there involve the operations between the tensors of different shapes, sizes and dimensions.
- Image Processing: Images are multi-dimensional arrays of pixels. When we apply different filters, transformations, resolutions, color contrasts to a image different pixel values of different tensors to adjusts them in different resolutions, dimensions while performing different operations on the image. Technique of Tensor Broadcasting helps in performing these operations easily by aligning different dimensions and shapes of tensors of images. resizing, changing color from RGB to greyscale. Tensor Broadcasting extends or compress images to smaller or larger resolutions and also preserving the content of the image.
- Signal preprocessing: Like images signals are also multi-dimensional, speech recognition & classification are the signal of 1-dimensional, Radar signals used for detecting and tracking signal in these are multi-dimensional. When we apply filters, transformations & feature extraction operations on signals of different lengths, Broadcasting of tensor helps to do these tasks easily by systematically aligning these signals in different dimensions.
- Data Analysis operations: When we analyze and manipulate the data by applying different operations such as data cleaning, transformations and feature engineering on datasets of different shapes and sizes, tensor broadcasting helps in performing these operations more smoothly because we know tensors will be involving in this operation which might be of different in sizes, shapes and dimensions. Tensor broadcasting handles these tensors in these complex operations of large datasets.
These are just few applications of tensor broadcasting but there are even more wide range of applications of these techniques as it helps in many different to handles the operations related to multi-dimensional arrays.
Conclusion
This was all about broadcasting in the tensors and these techniques are all applicable to libraries like NumPy, TensorFlow and PyTorch as well. So basically we 've learned through out the article that if both the tensor have exactly equal shape then there will be no problem in the elementwise operations but if shapes are not same and also Ranks are different then we have to make them in  the compatible shape . By making them in the compatible shape broadcasting can be easily applied to perform the tasks.
