# Build, Test, and Deploy Model With AutoML

> Source: https://www.geeksforgeeks.org/machine-learning/evaluate-test-and-deploy-your-model-with-automl/

The term "Automated Machine Learning," or "AutoML," refers to a set of tools and methods used to speed up the creation of machine learning models. It automates a variety of processes, including model evaluation, feature selection, hyperparameter tweaking, and data preparation. By automating the intricate and time-consuming processes involved in model creation, AutoML platforms hope to make machine learning accessible to people and businesses without a strong background in data science.
Build, Test, and Deploy Model With AutoML
Here I will use Vertex AI in Google Cloud Platform to demonstrate the AutoML.
Make sure you have already created a Project and a Bucket to move forward.
Step 1: Dataset
- We need to create a dataset, using the create button. Here we have used Titanic.csv. It is mandatory to keep the dataset in the dataset section. First, inside Vertex AI go to Dataset and click on Create.
- Write the dataset name, and select the types. There are four types.
  - Image : If the dataset consists of Image.
  - Tabular: If the dataset is in excel format.
  - Text: If the dataset is in json format.
  - Video: If the dataset is in video format.
Now we can view & analyze the uploaded dataset
- If you want to do classification and Regression problems or forecasting then go to Tabular -> Classification/Regression or Tabular -> Forecasting.
- Upload the dataset from either local computer (chargeable), or you can directly use BigQuery if your dataset is stored in BigQuery itself.
- After successful completion, you can click to Analyze the dataset. It will automatically analyze the unique and the missing values of the dataset in a click.
Step 2: AUTO ML in Vertex AI
- Go to Training in Vertex AI, click on Create.
- Please Note: Auto ML doesn’t work great in complex dataset. For that we need a clean pre processed data. All the preprocessing must be done before uploading the dataset in Vertex AI.
- Select the region where you want to store the training.
Train new model
A new pop will open i..e 'Train new model'
1. Training Methods
- First we select our dataset from dropdown
- Then Select the Objective. The objectives are either Classification or Regression.
- Then we select the desired Model Training Method. i.e from AutoML & Custom Training
  - Here we are clicking on AutoML for automatic training and then Continue.
  - The best part of training is if you gets disconnected from the internet still it will train in the background.
2. Model Details
- In model details we have the two options i.e
  - Train new model : We will select it when we are training a new model
  - Train new version : We will select it when we want train the existing model
- We can retrain if required only by updating the version of existing model or we can train a new model.
- For training the new model, we have to provide the name, descriptions and select the Target Column from the above defined dataset.
- Data Split: In data split we have the 3 options i.e
  - Random: Split the data into 80% training, 10% valiadations and 10% for testing randomly.
  - Manual: Here we can define the manully the % of data to split into training, testing and validations.
  - Chronological: This will split the first 80% data into training, next 10% into validations and last 10% for testing.
3. Join Featurestore
- Join Featurestore is optional, mean we can skip also.
- Feature store are used for reusability so for this time we are not adding any feature from feature store.
4. Training options
- In training options we can exclude any unnecessary independent variables If required, just click on minus.
- Click on Advanced Option. There is a weight column where we can give priority to some feature if required. Use the optimization techniques as required. Here, I used Log loss.
5. Compute and pricing
- In compute and pricing, put a budget. Budget ranges from (1 to 72) where 1 denotes to 1 node hour. Enable early stopping for healthy practices.
- Click on Start Training.
- After execution complete, it will reflect on Training.
Step 3 : Model Registry
- Once a dataset is trained we can import the model in Model Registry.
- A model registry is used to store version trained machine learning models. It is a type of repository..
- Here, all the models with their version type is displayed.
- Click on Name of model which we havwe assign while training i.e. Titanic.
Step 4: Evalute
- Version Type is written. If we have same models of different versions we can change it by clicking on Versions.
- We, can create Evaluation report of different models to see which version is more accurate. It will produce visualize output.
Step 5: Deploy and Test
- An endpoint refers to an API (Application Programming Interface) that allows you to interact with your deployed machine learning model. It provides a way for external applications, services, or users to send data to the model for inference (making predictions or classifications) and receive the model's responses.
- Click on Deploy & Test -> Deploy to Endpoint.
- Container creation is needed in Manual ML.
1. Define your endpoint
- Create new endpoint if not.
- Fill name, location.
- Access are of two types. Standard uses Rest API, private is for your private cloud (if purchased).
- In Advanced, there is encryption type, Google managed encryption and Customer managed encryption type. Google managed is the default.
2. Model Setting
- Select Traffic Split, remember select it out of 100. (Details in next slide)
- Min no of compute nodes is the compute resources will continuously run even without traffic demand. This can increase cost but avoid dropped requests due to node initialization.
What is Traffic split in Vertex AI during Model deployment?
Traffic split refers to the distribution of inference requests (also known as traffic) across different versions of a deployed machine learning model. When you deploy multiple versions of a model, you can control how much traffic each version receives. For example, you might direct 80% of the traffic to the current production version and 20% to a new experimental version. So, in short if you want to deploy multiple versions, make the traffic distribution in that respective way.
- Explainability options are particularly important when dealing with complex models, such as deep neural networks, that might be considered "black-box" models due to their intricate internal workings. Explainability helps data scientists, developers, and stakeholders gain confidence in the model's decisions. It is recommended to turn it on so that we can test it after deployment.
- Click on Feature attribute
Model Productions
Once the model is in production, it requires continuous monitoring for ensuring its performance is as we expected. It will send email report to the given email id in a gap of x days.
- Click on Deploy.
- After successful deployment, we can test the model.
- To test the model provide the inputs. See the result of the output.
Your model is ready now.
API calling is a separate large topic so we are concluding it here.
