# Blind source separation using FastICA in Scikit Learn

> Source: https://www.geeksforgeeks.org/machine-learning/blind-source-separation-using-fastica-in-scikit-learn/

Blind Source Separation (BSS) refers to the process of separating signals when the source signals are unknown and the method of mixing is also unknown. FastICA is a widely used algorithm for solving this problem. It is commonly applied in fields like audio processing, medical imaging and financial data analysis. FastICA is of two types :
- Deflation-based FastICA where the components are found in one by one manner.
- Symmetric FastICA where the components are found simultaneously.
It can also work with different nonlinearity function and optimize the extraction order in the deflation-based version. Even without knowing much about the signals or how they were mixed we can separate them using FastICA.
Mathematical Explanation of FastICA Algorithm
Let there be n original source signals combined linearly into m observed mixed signals.
- s = \left( s_1, s_2, \ldots, s_n \right)^T be the original independent signals
- x = \left( x_1, x_2, \ldots, x_m \right)^T be the observed mixed signals
- The mixing process is linear:
x=Gs 
where G is an unknown mixing matrix.
FastICA aims to find an unmixing matrix U such that:
y = Ux
where y approximates the independent sources.
Steps in FastICA Algorithm
Step 1: Centering
Subtract the mean of each signal:
\tilde{\mathbf{x}} = \mathbf{x} - \mathbb{E}[\mathbf{x}] 
where 
Step 2: Whitening (Sphering)
Whitening transforms data so that:
- Signals are uncorrelated
- Variance of each signal is 1
Whitened signal: 
where 
FastICA implementations typically use PCA whitening internally.
Step 3: Fixed-Point Iterative Update
FastICA finds weight vectors w that maximize non-Gaussianity of the projection 
Common nonlinearity: 
Matrix update rule (for symmetric FastICA): 
Step 4: Symmetric Orthogonalization
After each update: 
This ensures:
Step 5: Convergence Criteria
FastICA stops when:
Typical tolerance = 
A maximum iteration limit (e.g., 200–1000) is also used.
Python Implementation of FastICA
Now lets implement it step by step:
Step 1: Import Required Libraries
we will import some python libraries like NumPy, Matplotlib and Scikit learn we can perform complex computations easily and effectively.
import numpy as np
import matplotlib.pyplot as plt
from sklearn.decomposition import FastICA
Step 2: Generate Source Signals (Sine, Square, Noise)
In this step we create original signals that will act as the sources we want to later separate or analyze. These are basic signal types commonly used in signal processing:
- s1: Smooth periodic signal
- s2: Sharp square wave (high kurtosis)
- s3: Random Gaussian noise
- S: Shape=(2000,3) each column is one independent source
- X= observed signals (mixed)
np.random.seed(0)
n_samples = 2000
time = np.linspace(0, 8, n_samples)
s1 = np.sin(2 * time) 
s2 = np.sign(np.sin(3 * time))  
s3 = np.random.normal(0, 1, n_samples)  
S = np.c_[s1, s2, s3]
A = np.array([
    [1, 1, 1],
    [0.5, 2, 1.0],
    [1.5, 1.0, 2.0]
])
X = np.dot(S, A.T)
Step 3: Apply FastICA to Recover the Signals
Now we will compute ICA model using FastICA and also as given earlier we will also compute PCA model for showing the comparison.
- fit_transform(X) performs centering, whitening and fixed-point iteration
- S_estimated: Approximates original signals (shape: 2000 x 3)
- A_estimated: Estimated mixing matrix
ica = FastICA(n_components=3)
S_estimated = ica.fit_transform(X)  
A_estimated = ica.mixing_ 
Step 4: Plot the Results (Original, Mixed, Recovered)
Now we will plot the graph with our achieved values and can under stand the efficiency of ICA for blind source separation of signals as well as PCA as it failed to do this.
plt.figure(figsize=(12, 8))
plt.subplot(3, 1, 1)
plt.title("Original Source Signals")
plt.plot(S)
plt.xlabel("Samples")
plt.subplot(3, 1, 2)
plt.title("Mixed Signals (Observed)")
plt.plot(X)
plt.xlabel("Samples")
plt.subplot(3, 1, 3)
plt.title("Recovered Signals (After ICA)")
plt.plot(S_estimated)
plt.xlabel("Samples")
plt.tight_layout()
plt.show()
Output:
The output shows three stages of signal processing.
- In the first plot we can see the original source signals i.e a smooth sine wave, a square-shaped signal and some random noise.
- The second plot shows them mixed together making it hard to tell them apart.
- The third plot shows the signals separated again using FastICA closely matching the originals.
