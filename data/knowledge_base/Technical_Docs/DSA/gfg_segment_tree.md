# Segment Tree

> Source: https://www.geeksforgeeks.org/dsa/segment-tree-data-structure

Segment Tree is a data structure that allows efficient querying and updating of intervals or segments of an array.
- It is particularly useful for problems involving range queries, such as finding the sum, minimum, maximum, or any other operation over a specific range of elements in an array.
- The tree is built recursively by dividing the array into segments until each segment represents a single element.
- This structure enables fast query and update operations with a time complexity of O(log n)
The following diagram shows a segment tree built for an array [1, 4, 5, 9, 10, 12] of size 6. The example tree is built for range sum queries. Every node stores sum of a range. The root nodes stores sum of the whole array and leaf nodes store sums of single elements in the array. Please refer Segment Tree Introduction article for details about construction and query.
Basics of Segment Tree:
Lazy Propagation:
Range Queries:
Some interesting problem on Segment Tree:
Applications of Segment Tree:
- Interval scheduling: Segment trees can be used to efficiently schedule non-overlapping intervals, such as scheduling appointments or allocating resources.
- Range-based statistics: Segment trees can be used to compute range-based statistics such as variance, standard deviation, and percentiles.
- Image processing: Segment trees are used in image processing algorithms to divide an image into segments based on color, texture, or other attributes.
