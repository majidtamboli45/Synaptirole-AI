# Ragged tensors in TensorFlow

> Source: https://www.geeksforgeeks.org/deep-learning/ragged-tensors-in-tensorflow/

Ragged tensors are a fundamental data structure in TensorFlow, especially in scenarios where data doesn't conform to fixed shapes, such as sequences of varying lengths or nested structures. In this article, we'll understand what ragged tensors are, why they're useful, and provide hands-on coding examples to illustrate their usage.
Table of Content
What are Ragged Tensors?
In TensorFlow, tensors are the basic building blocks for data representation. A tensor is essentially a multi-dimensional array, where each dimension represents a different mode of indexing. Ragged tensors, however, deviate from this notion by allowing for variable lengths along certain dimensions.
Ragged tensors possess several distinct features:
- Rank: Similar to conventional tensors, ragged tensors have a rank, denoting the number of axes they contain.
- Shape: Unlike regular tensors, the shape of a ragged tensor isn't a fixed tuple of dimensions. Instead, it comprises a nested structure indicating the lengths of each dimension for every element, allowing for variations in shape.
- Values: Ragged tensors can contain scalars, vectors, matrices, or even other ragged tensors, providing additional versatility in data representation.
Why Use Ragged Tensors?
Ragged tensors offer immense utility across diverse scenarios where data exhibits irregularities and fails to adhere to fixed shapes. Their versatility becomes apparent in various domains:
- Natural Language Processing (NLP): Sentences and paragraphs have different lengths. Ragged tensors handle this irregularity perfectly, making them ideal for tasks like sentiment analysis and machine translation.
- Time Series: Sensor readings or financial data may have missing entries or be collected at irregular intervals. Ragged tensors effortlessly manage these inconsistencies.
Constructing Ragged Tensors
Here, we will learn how to create a ragged tensor with Tensorflow.
1. Using tf.ragged.constant()
We use tf.ragged.constant() to create a ragged tensor from nested Python lists. Each nested list represents a sequence of varying length. The resulting ragged tensor accommodates these variable-length sequences.
import tensorflow as tf
# Creating a ragged tensor from a nested Python list
ragged_tensor = tf.ragged.constant([[1, 2], [3, 4, 5], [6]])
print(ragged_tensor)
Output:
<tf.RaggedTensor [[1, 2], [3, 4, 5], [6]]>
RaggedTensors are multi-dimensional tensors that can have rows of different lengths. There are multiple ways to put them together.
Pairing flat values (holding all values in a flattened list) with a row-partitioning tensor that indicates how to divide those values into rows using factory classmethods like tf.RaggedTensor.from_value_rowids, tf.RaggedTensor.from_row_lengths, and tf.RaggedTensor.from_row_splits.
2. Using tf.RaggedTensor.from_value_rowids
- Values Tensor: Create a flat tensor containing all the words.
- Value Rows Tensor: This tensor tells us which row (sentence) each word belongs to. It should have the same length as the values tensor. Here,0 represents the first sentence,2 represents the second sentence, and3 represents the third sentence (since it's a single word).
import tensorflow as tf
words = [3, 1, 4, 1, 5, 9, 2]
row_ids = [0, 0, 0, 0, 2, 2, 3]
ragged_tensor = tf.RaggedTensor.from_value_rowids(values=words, value_rowids=row_ids)
print(ragged_tensor)
Output:
<tf.RaggedTensor [[3, 1, 4, 1], [], [5, 9], [2]]>
3. Using tf.RaggedTensor.from_row_lengths
row_lengths: This is constant tensor containing information about the number of elements in each row of the desired RaggedTensor. Below, [2, 2, 2, 2] specifies that we want four rows, each with two elements.
import tensorflow as tf
# Convert from row lengths
values = tf.constant([1, 2, 3, 0, 4, 0, 5, 6])
row_lengths = tf.constant([2, 2, 2, 2])
from_row_lengths_ragged = tf.RaggedTensor.from_row_lengths(values, row_lengths)
print(from_row_lengths_ragged)
Output:
<tf.RaggedTensor [[1, 2],
[3, 0],
[4, 0],
[5, 6]]>
4. Using tf.RaggedTensor.from_row_splits
row_splits: This is a constant tensor, but instead of lengths, it contains information about where each row starts in the values tensor. Below, [0, 2, 4, 6, 8] indicates the starting index for each row: 0 (first element), 2 (third element), 4 (fifth element), and 6 (seventh element).
import tensorflow as tf
# Convert from row splits
values = tf.constant([1, 2, 3, 0, 4, 0, 5, 6])
row_splits = tf.constant([0, 2, 4, 6, 8])
from_row_splits_ragged = tf.RaggedTensor.from_row_splits(values, row_splits)
print(from_row_splits_ragged)
Output:
<tf.RaggedTensor [[1, 2],
[3, 0],
[4, 0],
[5, 6]]>
Operations on Ragged Tensors
Ragged tensors support various standard operations similar to regular tensors in TensorFlow:
- Addition with tf.add: Performing element-wise addition between ragged tensors using tf.add .
- Calculating mean with tf.reduce_mean
- Concatenating ragged tensors along a specified axis using tf.concat .
- Getting shapes using shape attribute
In the example, let's demonstrate several standard operations on ragged tensors.
import tensorflow as tf
# Define ragged tensors
ragged1 = tf.ragged.constant([[1, 2], [3, 0]])  # Padding with zeros to ensure compatible shapes
ragged2 = tf.ragged.constant([[4, 0], [5, 6]])
# Add ragged tensors
added_ragged = tf.add(ragged1, ragged2)
# Compute the mean of ragged tensor values
mean_value = tf.reduce_mean(added_ragged)
# Concatenate ragged tensors
concatenated_ragged = tf.concat([ragged1, ragged2], axis=0)
# Get the shapes of elements inside the ragged tensor
shapes_ragged = ragged1.bounding_shape()
# Print results
print("Added Ragged Tensor:")
print(added_ragged)
print("Mean Value of Ragged Tensor:", mean_value.numpy())
print("Concatenated Ragged Tensor:")
print(concatenated_ragged)
print("Shapes of Elements Inside the Ragged Tensor:", shapes_ragged)
Output:
Added Ragged Tensor:
<tf.RaggedTensor [[5, 2],
[8, 6]]>
Mean Value of Ragged Tensor: 5.25
Concatenated Ragged Tensor:
<tf.RaggedTensor [[1, 2],
[3, 0],
[4, 0],
[5, 6]]>
Shapes of Elements Inside the Ragged Tensor: tf.Tensor([2 2], shape=(2,), dtype=int64)
Passing Ragged Tensors for Training
Keras Makes Ragged Tensors Easy for Training with:
- Set the ragged=True argument: When defining the input layer usingtf.keras.Input , set theragged=True argument. This tells Keras the input will be a ragged tensor.
- Pass your ragged tensor directly: After setting ragged=True , simply pass your ragged tensor as the input to the model. Keras handles the ragged structure internally.
inputs = keras.Input(shape=(), dtype=tf.int64, ragged=True)
