# Negative Matrix Factorization

> Source: https://www.geeksforgeeks.org/machine-learning/non-negative-matrix-factorization/

Non-Negative Matrix Factorization (NMF) is a technique used to break down large dataset into smaller meaningful parts while ensuring that all values remain non-negative. This helps in extracting useful features from data and making it easier to analyze and process it.
Matrix Decomposition and Representation in NMF
For a matrix A of dimensions 
A_{m \times n} \approx W_{m \times k} \cdot H_{k \times n} 
where:
- A : Original input matrix (a linear combination of W and H)
- W : Feature matrix (basis components)
- H : Coefficient matrix (weights associated with W)
- k : Rank (dimensionality of the reduced representation wherek \le \min(m, n)
NMF helps to identify hidden patterns in data by assuming that each data point can be represented as a combination of fundamental features found in 
Intuition Behind NMF
The goal of NMF is to simplify complex data into a smaller set of meaningful patterns. By choosing a lower dimension k the decomposition highlights essential features while ignoring noise.
- Each data point (column in A ) is approximated as a combination of non-negative feature vectors inW .
- This method assumes that data consists of meaningful parts that add up to form the whole.
For example in facial recognition NMF can break down an image into basic facial features such as eyes, nose and mouth. The 
W matrix contains these key features while theH matrix defines how strongly each image is composed of these features.
Working of NMF
NMF decomposes a data matrix 
1. Initialization: Start with random non-negative values for 
2. Iterative Update: Modify 
3. Stopping Criteria: The process stops when:
- The reconstruction error stabilizes.
- A set number of iterations is reached.
Common optimization techniques for NMF include:
- Multiplicative Update Rules: Ensures non-negativity by iteratively adjusting W andH .
- Alternating Least Squares (ALS): Solves for W while keepingH fixed and vice versa, in an alternating manner.
Example
Let us consider some real-life examples to understand the working of the NMF algorithm. Let's take a case of image processing.
- Suppose we have an input image having pixels that form matrix A.
- Using NMF we factorize it into two matrices one containing the facial feature set [Matrix W]
- Other contains the importance of each facial feature in the input image i.e. the weights [Matrix H]. (As shown in below image)
Applications
- Image Processing: Feature extraction in facial recognition and object detection.
- Text Mining and NLP Task: Topic modeling by decomposing a document-term matrix into key topics.
- Spectral Data Analysis: Identifying hidden patterns in sound, medical signals and chemical spectra.
- Bioinformatics: Gene expression analysis for identifying molecular patterns in biological data.
