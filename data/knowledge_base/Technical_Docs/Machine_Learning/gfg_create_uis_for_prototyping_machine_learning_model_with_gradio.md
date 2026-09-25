# Create UIs for Prototyping Machine Learning Model with Gradio

> Source: https://www.geeksforgeeks.org/machine-learning/python-create-uis-for-prototyping-machine-learning-model-with-gradio/

In this article we will create simple, shareable web UIs for a Machine Learning model using Gradio. The example demonstrates an InceptionV3 image classifier (TensorFlow), and the UI will accept an image and show the top predicted labels with confidence scores.
Requirements
Install required Python packages:
pip install gradio tensorflow numpy requests
If you already have TensorFlow installed, you can skip reinstalling it. Just make sure all versions are compatible.
Step-by-Step implementation
Step 1: Import libraries
We first import the necessary Python libraries for creating the UI, loading the model, and handling arrays and data downloads.
import gradio as gr
import tensorflow as tf
import numpy as np
import requests
Explanation:
- gradio is used to build the interactive web interface and tensorflow loads and runs the pre-trained model.
- numpy helps in handling image arrays and requests is used to fetch extra resources (if needed).
Step 2: Load the pre-trained model
We load the InceptionV3 model that comes pre-trained on ImageNet a large dataset of images and labels.
inception_net = tf.keras.applications.InceptionV3(weights="imagenet")
Explanation:
- This line loads the InceptionV3 model along with its pre-trained weights.
- Since the model is trained on 1000 categories, it can recognize a wide variety of objects like animals, vehicles, and household items.
Note: You do not need a separate labels file when you use decode_predictions() (it uses TF's internal mapping).
Step 3: Define the image classification function
Next, we define a function that takes the uploaded image, processes it to the right format, runs the model, and returns the predicted results.
def classify_image(image):
    if image is None:
        return {"error": "No image provided"}
    # If the image has 4 channels (RGBA), remove the alpha channel
    if image.ndim == 3 and image.shape[2] == 4:
        image = image[..., :3]
    # Convert grayscale images to 3-channel (RGB)
    if image.ndim == 2:
        image = np.stack([image] * 3, axis=-1)
    # Resize the image to 299x299 as expected by InceptionV3
    img_resized = tf.image.resize(image, (299, 299)).numpy()
    # Convert to float32 and make it writable
    img_resized = img_resized.astype("float32").copy()
    # Preprocess the image and make a prediction
    batch = tf.keras.applications.inception_v3.preprocess_input(np.expand_dims(img_resized, axis=0))
    preds = inception_net.predict(batch)
    # Decode and return top 5 predictions
    decoded = tf.keras.applications.inception_v3.decode_predictions(preds, top=5)[0]
    return {label: float(score) for (_, label, score) in decoded}
Explanation:
- Handles images with extra channels or grayscale formats.
- Resizes and preprocesses the image to fit the model’s requirements.
- Uses the pre-trained model to predict the most likely labels.
- Returns readable class names (like “Egyptian_cat”, “Labrador”, “sports_car”) along with confidence scores.
Step 4: Create input and output components
Now, we create the Gradio interface specifying what the input and output will look like.
image_input = gr.Image(type="numpy", label="Upload an Image")
label_output = gr.Label(num_top_classes=3, label="Top Predictions")
demo = gr.Interface(
    fn=classify_image,
    inputs=image_input,
    outputs=label_output,
    title="InceptionV3 Image Classifier",
    description="Upload an image to see what the model predicts!"
)
Explanation:
- gr.Image() lets you upload or drag an image directly.
- gr.Label() neatly displays the top predicted results.
- gr.Interface() connects everything it takes your function and displays it as a working UI with a title and short description.
Step 5: Launch the interface
Finally, launch the Gradio app. You can view it on your browser locally or share it online with a temporary link.
demo.launch(share=True)
Explanation:
- launch(share=True) opens a local UI and creates a public shareable link (expires in ~1 week).
- Use share=False to keep it local-only. To host permanently, deploy to Hugging Face Spaces (gradio deploy) or other hosting.
Output
When you run the program, a simple Gradio interface will appear. It contains an image upload section on the left and a results panel on the right.
Below is how the plain interface looks when you run it:
Now, once you upload an image (for example, a cat or a dog) and click Submit, the right side of the interface displays the model’s predictions showing the top class names and their confidence scores.
