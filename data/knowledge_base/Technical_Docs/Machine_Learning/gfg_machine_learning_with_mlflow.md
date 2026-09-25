# Machine Learning with MLflow

> Source: https://www.geeksforgeeks.org/machine-learning/machine-learning-with-mlflow/

Managing machine learning projects can get complicated with multiple models, datasets and settings. Without a proper system, tracking experiments manually is time-consuming and error-prone. MLflow is an open-source tool that helps simplify and organize this process. It streamlines the entire machine learning workflow, making it easier to track experiments, manage models and deploy them efficiently.
Introduction to MLflow
MLflow is an open-source platform designed to manage and streamline the entire machine learning lifecycle. It provides a set of tools for tracking experiments, packaging models and deploying them, making it easier to manage the various stages of ML workflows. Whether we are a data scientist, ML engineer or DevOps engineer, MLflow offers a robust solution to track our experiments and manage models throughout their lifecycle.
Key Features of MLflow
- Experiment Tracking: It lets us log and compare experiments, tracking parameters, metrics and model artifacts (like trained models and plots). This helps us organize and analyze different experiments.
- Model Packaging: It saves trained models in a reusable format. It supports models from libraries like scikit-learn, TensorFlow and PyTorch, making them easy to share and deploy.
- Model Registry: It helps us register and version control models, track their lifecycle stages (e.g., development, production) and manage model transitions.
- Model Deployment: It supports deploying models to cloud services (e.g., AWS SageMaker, Azure ML) or locally, making them ready for real-world use.
MLflow Setup and Installation
Let's setup MLflow on our devices,
Install MLflow via pip: We can install MLflow directly from the command line using pip, a package management system for Python.
pip install mlflow
Install Dependencies: Install the common data science libraries such as scit-learn, pandas, matplotlib etc.
pip install scikit-learn pandas matplotlib seaborn
Verify Installation: After installation, verify that MLflow is correctly installed or not by running the version check.
mlflow --version
Start the MLflow Tracking server: MLflow provides a local tracking server where you can log experiments and view them via the web UI. To start the server, run:
mlflow ui
By default, the MLflow UI will be available at http://127.0.0.1:5000. Here, we can track all our machine learning experiments, models and logs.
Key MLflow Components
MLflow consists of four core components, each supporting different aspects of the ML lifecycle:
- MLflow Tracking: Logs and organizes experiments, making it easy to compare hyperparameters, metrics and models.
- MLflow Projects: Packages data science code in a standardized format for better reproducibility.
- MLflow Models: A consistent model format that allows you to share and deploy models seamlessly across platforms.
- MLflow Model Registry: A centralized repository for managing models, version control and transitions between different model stages (e.g., Development, Staging, Production).
Key Stages of the Machine Learning Model Lifecycle
Stage 1: Data Collection and Preparation: In the first stage, we collect and clean our data so it’s ready for training the model. We may need to handle missing data, change the format of our data or split it into training and testing sets.
Stage 2: Model Training: Once the data is ready, the next step is training a machine learning model. This involves using algorithms to create a model that can make predictions based on the data. We will also try different settings (called hyperparameters) to see which gives the best results.
MLflow Tracking helps us log key information during model training, such as:
- Hyperparameters (e.g., how many trees in a random forest model)
- Evaluation metrics (e.g., accuracy, precision, etc.)
- The trained model itself
Example: Training and Tracking a Model with MLflow
import mlflow
import mlflow.sklearn
from sklearn.ensemble import RandomForestClassifier
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
data = load_iris()
X = data.data
y = data.target
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.3, random_state=42)
with mlflow.start_run():
    model = RandomForestClassifier(n_estimators=100, max_depth=3)
    model.fit(X_train, y_train)
    mlflow.log_param("n_estimators", 100)
    mlflow.log_param("max_depth", 3)
    y_pred = model.predict(X_test)
    accuracy = accuracy_score(y_test, y_pred)
    mlflow.log_metric("accuracy", accuracy)
    mlflow.sklearn.log_model(model, "random_forest_model")
print(f"Model trained with accuracy: {accuracy:.4f}")
Output:
Model trained with accuracy: 1.0000
Stage 3: Experiment Tracking: Tracking experiments is important when testing different models or settings. MLflow lets us record details like hyperparameters, metrics and models for every run. This helps us compare results over time and pick the best model.
We can see all our experiments in the MLflow UI, where we can compare metrics like accuracy and other important results.
Stage 4: Model Packaging: After training a model, the next step is to package it. Packaging means saving the model in a format that can be shared and deployed. MLflow Models provide a standard format to save models. This makes it easier to deploy models that were built using different tools like scikit-learn or TensorFlow.
Example: Packaging a Model for Deployment
mlflow.sklearn.log_model(model,"random_forest_model")
Output:
<mlflow.models.model.ModelInfo at 0x79864a9b8050>
This command saves the model in a standard format that can be easily deployed later.
Stage 5: Model Deployment: Once the model is packaged, it’s ready to be deployed in a production environment where it can make predictions on new data. MLflow makes this easier by offering tools for deployment, whether it’s on our local machine or in the cloud. MLflow can integrate with services like AWS SageMaker and Azure ML to deploy models on cloud platforms.
Example: Deploying a Model with MLflow
mlflow models serve - m "runs:/<run-id>/random_forest_model" - p 5000
This command will expose the model as a REST API, which other applications can use to send data and get predictions.
Stage 6: Monitoring and Maintenance
MLflow’s Model Registry helps with tracking model versions and updating models when necessary. We can also log metrics after deployment to see if the model’s accuracy drops over time.
