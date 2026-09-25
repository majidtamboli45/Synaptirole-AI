# Analyzing Loadings and Biplots

> Source: https://www.geeksforgeeks.org/machine-learning/feature-importance-in-pca-analyzing-loadings-and-biplots/

Principal Component Analysis (PCA) is a widely used technique for dimensionality reduction, data visualization and feature extraction. One challenge after applying PCA is finding which original features contribute the most to the principal components. Feature importance in PCA is determined by loadings matrix which represents the contribution of each original feature to the principal components.
Features with higher absolute values in the loadings have a great impact on the principal component. Now we will perform the PCA algorithm to determine the features using the iris dataset.
Step 1: Data Preparation and Standardization
- In this step the Iris dataset is loaded using the load_iris() function from scikit-learn.
- The dataset contains 150 rows and 4 features which are: sepal length, sepal width, petal length and petal width.
- After loading the data the next step is to standardize the dataset using StandardScaler().
- Then the fit_transform() applied on X which calculates the mean and standard deviation of each feature
- Then transforms the data using the standardization formula. The result is stored in the X_scaled variable.
import numpy as np
import pandas as pd
from sklearn.decomposition import PCA
from sklearn.preprocessing import StandardScaler
from sklearn.datasets import load_iris
import matplotlib.pyplot as plt
import seaborn as sns
iris = load_iris()
X = iris.data
y = iris.target
feature_names = iris.feature_names
scaler = StandardScaler()
X_scaled = scaler.fit_transform(X)
Step 2: Applying PCA
In this step, Principal Component Analysis (PCA) is applied to reduce the dimensionality of the dataset from 4 features to 2 features while preserving as much important information (variance) from the original dataset as possible
- fit(): The fit() method calculates the principal components by finding the directions (axes) where the variance is maximum.
- transform(): Once the components are found, the transform() method projects the original data onto the new principal components. This reduces the dataset from 4 dimensions to 2 dimensions
- The transformed dataset is stored in the variable X_pca. It contains only two features (PC1 and PC2) instead of four making the dataset simpler without losing much information
from sklearn.decomposition import PCA
pca = PCA(n_components=2)
X_pca = pca.fit_transform(X_scaled)
print("Shape of Original Dataset:", X_scaled.shape)
print("Shape after PCA:", X_pca.shape)
Step 3: Calculating and Visualizing Feature Loadings
In this step the feature loadings are calculated and visualized to understand how much each original feature contributes to the principal components.
- loadings: Matrix to visualize
- annot=true: Display the numbers inside each cell
- cmap='coolwarm': Sets the color map i.e red for high importance and blue for low importance
- xticklabels=['PC1' , 'PC2']: Labels for the x-axis (Principal Components)
- yticklabels-feature_names: Labels for the y-axis (Original Features)
loadings = pca.components_.T * np.sqrt(pca.explained_variance_)
print("Loadings:")
print(loadings)
import matplotlib.pyplot as plt
plt.figure(figsize=(10, 8))
sns.heatmap(loadings, annot=True, cmap='coolwarm', xticklabels=['PC1', 'PC2'], yticklabels=feature_names)
plt.title('Feature Importance in Principal Components')
plt.show()
Output:
Loadings: 
[[ 0.89315091 0.3620387 ] 
[-0.46168423 0.88567345] 
[ 0.99487699 0.02349363] 
[ 0.96821173 0.06421425]]
Step 4: Biplot Visualization
After the feature loadings we will create a Biplot to visually represent both:
- The reduced dataset after applying PCA.
- The direction and importance of original features in the new principal component space.
def biplot(score, coeff, labels=None):
    xs = score[:, 0]
    ys = score[:, 1]
    plt.figure(figsize=(10, 8))
    plt.scatter(xs, ys, c=y, cmap='viridis')
    for i in range(len(coeff)):
        plt.arrow(0, 0, coeff[i, 0], coeff[i, 1], color='r', alpha=0.5)
        plt.text(coeff[i, 0] * 1.2, coeff[i, 1] * 1.2, labels[i], color='g')
    plt.xlabel("PC1")
    plt.ylabel("PC2")
    plt.title("Biplot")
    plt.show()
biplot(X_pca, pca.components_.T, feature_names)
Output:
Biplot shows how features contribute to principal components. Longer red arrows mean higher importance and smaller angles between arrows show strong feature correlation. Clusters in the plot represent different Iris species.
Applications of Feature Importance in PCA
- Feature Selection: It can be used for feature selection by identifying and retaining the most important features. This can help in building more interpretable and efficient models.
- Data Visualization: By understanding the importance of features one can create more informative visualizations that highlight the key aspects of the data.
- Model Interpretation: It helps in interpreting the results of PCA making it easier to understand the underlying structure of the data and the relationships between variables.
Challenges and Considerations
- Interpretability: One of the main challenges of PCA is the interpretability of the principal components. While PCA reduces dimensionality the new components are linear combinations of the original features which may not always be easy to interpret.
- Information Loss: It involves selecting a subset of principal components which may led to information loss if important features are not adequately represented in the selected components.
- Sensitivity to Scaling: PCA is sensitive to the scaling of the data. It is important to standardize the data before performing PCA to ensure that all features contribute equally to the analysis.
