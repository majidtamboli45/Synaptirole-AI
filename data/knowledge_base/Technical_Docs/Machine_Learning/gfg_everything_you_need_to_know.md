# Everything You Need to Know

> Source: https://www.geeksforgeeks.org/machine-learning/mlops-everything-you-need-to-know/

Machine Learning Operations (MLOps) is the union of Data Engineering, Machine Learning, and DevOps. It aims to standardize the lifecycle of ML products, moving them from isolated "notebook experiments" to reliable, scalable production services.
The Core Challenges MLOps Solves
While traditional software is primarily logic-driven, ML is data-driven. This creates unique hurdles:
- The "Black Box" Problem: Debugging a model is harder than debugging code because the error might be in the data distribution, not the logic.
- Technical Debt: Without MLOps, organizations often end up with "spaghetti pipelines" where data cleaning and training are manual and undocumented.
- Model Decay: Unlike software, ML models degrade the moment they hit production because the real world changes (e.g., consumer habits shifting).
MLOps Workflow
MLOps workflow helps teams to manage machine learning projects smoothly and automatically. Here's how it works:
1. Data Collection & Preprocessing
- Gather structured and unstructured data from multiple sources.
- Clean, normalize and transform data to ensure quality for training.
- Manage data versioning for reproducibility.
2. Model Development
- Build ML models using supervised, unsupervised or reinforcement learning.
- Experiment with algorithms, architectures and hyperparameters.
- Track experiments for reproducibility using tools like MLflow or Weights & Biases.
3. Model Training & Validation
- Train models on preprocessed datasets.
- Validate performance using metrics such as accuracy, F1-score or RMSE.
- Address overfitting/underfitting using techniques like cross-validation.
4. Model Deployment
- Deploy models to production using cloud, on-premise or edge infrastructure.
- Use CI/CD pipelines for seamless integration.
- Ensure containerization in Docker or Kubernetes for portability.
5. Monitoring & Maintenance
- Continuously monitor model performance, latency and accuracy.
- Detect data drift or concept drift and trigger retraining if needed.
The MLOps Maturity Model
To implement MLOps effectively, organizations usually progress through three levels of automation:
| Level | Name | Description | 
|---|---|---|
| Level 0 | Manual Process | Data scientists build and deploy models manually. Script-driven, no automation, high risk of failure. | 
| Level 1 | ML Pipeline Automation | The entire training pipeline is automated. Whenever new data arrives, the model is retrained and validated automatically. | 
| Level 2 | CI/CD Pipeline Automation | Full "Continuous Delivery." Not just the model, but the pipeline code is automatically tested and deployed. | 
Implementation Roadmap
- Start with "Level 0" but Documented: Don't automate everything on day one. Establish a Model Registry first so you know what is running where.
- Adopt Containerization: Package your environment (Python versions, libraries) in Docker. This eliminates the "it worked on my laptop" excuse.
- Establish a Feature Store: Prevent "Training-Serving Skew" (where the model sees different data formats in production than it did in training).
- Define "SLA" for Models: Treat your model like a product. What is the acceptable latency? What is the minimum accuracy before an alert is sent to the team?
MLOps vs DevOps
- Continuous Integration (CI): In DevOps, this tests code. In MLOps, this tests code, data schemas, and models.
- Continuous Delivery (CD): In DevOps, this deploys a service. In MLOps, this deploys a training pipeline or a prediction service.
- Continuous Training (CT): This is unique to MLOps. It is the property of the system to automatically retrain models based on new data or performance triggers.
| Feature | DevOps | MLOps | 
|---|---|---|
| Core Purpose | Focuses on automating the development and deployment of traditional software. | Extends DevOps principles to machine learning systems, managing not only code but also data and models. | 
| Main Assets Managed | Handles code, application binaries and infrastructure. | Handles code plus datasets, features, model versions and experiments. | 
| Lifecycle Coverage | Covers coding → testing → deployment → monitoring. | Adds stages like data preparation, feature engineering, model training, validation, deployment, retraining and drift management. | 
| Nature of Updates | Updates happen when developers push new features or bug fixes. | Updates are triggered not only by new features but also by changing data, shifting patterns or model performance drops. | 
| Complexity | Mostly predictable, since software code is static once shipped. | Dynamic and complex, because data evolves, models decay and retraining is often required. | 
| Monitoring Needs | Monitors system uptime, response times, errors and stability. | Monitors model accuracy, fairness, bias, drift in data, latency of predictions and compliance with regulations. | 
| Tools Used | Jenkins, Git, Docker, Kubernetes, Terraform, Ansible. | Adds ML-specific tools like MLflow, Kubeflow, TensorFlow Extended (TFX), DVC, Weights & Biases and feature stores. | 
| Teams Involved | Software developers and operations engineers. | Includes data scientists, ML engineers, DevOps and domain experts working together. |
