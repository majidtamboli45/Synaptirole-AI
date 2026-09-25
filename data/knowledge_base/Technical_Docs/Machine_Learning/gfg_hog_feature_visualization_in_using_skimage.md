# HOG Feature Visualization in Python Using skimage

> Source: https://www.geeksforgeeks.org/machine-learning/hog-feature-visualization-in-python-using-skimage/

Object detection is a fundamental task in computer vision, where the goal is to identify and locate objects within images or videos. However, this task can be challenging due to the complexity of real-world images, which often contain varying lighting conditions, occlusions, and cluttered backgrounds. Traditional approaches to object detection rely on handcrafted features, which can be time-consuming and may not generalize well to new scenarios. One popular method for feature extraction is the Histogram of Oriented Gradients (HOG) technique.
In this article, we will understand and implement examples of visualizing HOG feature arrays using skimage.
Table of Content
Understanding HOG Features
HOG features were first introduced by Dalal and Triggs in 2005 as a robust feature extraction method for pedestrian detection. The core idea behind HOG is to capture the distribution of gradient orientations in an image, which can be used to describe the shape and appearance of objects. HOG features are computed by dividing an image into small cells, calculating the gradient orientations within each cell, and then aggregating these orientations into a histogram. This histogram represents the distribution of gradient orientations, which can be used as a feature vector for object detection.
Advantages of HOG Feature
HOG features have several benefits that make them an attractive choice for object detection:
- Robustness to lighting changes: HOG features are invariant to changes in lighting conditions, making them suitable for object detection in real-world scenarios.
- Robustness to occlusions: HOG features can handle partial occlusions, allowing for accurate object detection even when objects are partially hidden.
- Computational efficiency: HOG features can be computed efficiently, making them suitable for real-time object detection applications.
- Flexibility: HOG features can be used with various classification algorithms, such as Support Vector Machines (SVMs) and Random Forests, to name a few.
Visualizing HOG Features with Python and skimage
To understand how we can implement and visualize Histogram of Oriented Gradients (HOG) features using Python's skimage library. Let's start by importing necessary modules: color conversion utilities from skimage, HOG feature extraction, image data, exposure utilities, input-output functions, and plotting functionalities from matplotlib.
- An example image of an astronaut is loaded using data.astronaut() . The image is converted to grayscale usingcolor.rgb2gray() . converting the image to grayscale simplifies the feature extraction process and improves the performance and interpretability of the HOG algorithm for tasks such as object detection and recognition.
- Next, HOG features are extracted from the grayscale image using the hog() function, specifying parameters like orientations, pixels per cell, and cells per block. Thevisualize=True argument ensures the computation of the HOG image.
from skimage import color
from skimage.feature import hog
from skimage import data, exposure, io
import matplotlib.pyplot as plt
# Loading an example image
image = data.astronaut()
image_gray = color.rgb2gray(image) # Converting image to grayscale
# Extract HOG features
features, hog_image = hog(image_gray, orientations=9, pixels_per_cell=(8, 8),
                          cells_per_block=(2, 2), visualize=True)
plt.figure(figsize=(8, 4))
plt.subplot(1, 2, 1)
plt.imshow(image_gray, cmap='gray')
plt.title('Input image')
plt.subplot(1, 2, 2)
plt.imshow(hog_image, cmap='gray')
plt.title('HOG features')
plt.show()
Output:
By computing the distribution of local intensity gradients or edge directions in an image, HOG features capture the presence of specific shapes and edges.
Customizing HOG Feature Visualization with skimage
Following the same procedure, in this example we will compute HOG features for the coffee image, which is another built-in image in skimage using hog function from skimage. Following are the improvements made:
- Added a title to the figure for better context.
- Added annotations to the subplots for clarity.
- Used multichannel=True to ensure compatibility with color images.
- Removed the unnecessary channel axis specification.
- Improved layout and spacing for better aesthetics.
import matplotlib.pyplot as plt
from skimage.feature import hog
from skimage import data, exposure
image = data.coffee()
# Compute HOG features
fd, hog_image = hog(image, orientations=8, pixels_per_cell=(16, 16), cells_per_block=(1, 1), visualize=True, multichannel=True)
fig, (ax1, ax2) = plt.subplots(1, 2, figsize=(8,4), sharex=True, sharey=True)
fig.suptitle('Coffee Cup Image with Histogram of Oriented Gradients (HOG)', fontsize=14, fontweight='bold')
ax1.imshow(image, cmap=plt.cm.gray)
ax1.set_title('Original Image')
ax1.axis('off')
# Rescale histogram for better display
hog_image_rescaled = exposure.rescale_intensity(hog_image, in_range=(0, 10))
# HOG Features
ax2.imshow(hog_image_rescaled, cmap=plt.cm.gray)
ax2.set_title('HOG Features')
ax2.axis('off')
plt.tight_layout()
plt.subplots_adjust(top=0.85)  # Adjust the layout to accommodate the title
plt.show()
Output:
Conclusion
HOG features offer a powerful tool for object detection, providing a robust and efficient way to represent images. By visualizing HOG features using Python and skimage, we can gain a deeper understanding of how these features capture the essence of an image, enabling accurate object detection in various scenarios. Whether you're working on pedestrian detection, facial recognition, or object tracking, HOG features are an essential component of any computer vision pipeline.
