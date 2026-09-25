# Working with Python

> Source: https://www.geeksforgeeks.org/cloud-computing/google-cloud-run-working-with-python/

Python is one of the most popular programming languages and growing. It's well-suited for a number of use cases, including web applications, machine learning, and big data. Cloud Run lets you use any runtime you want, making it easy to deploy Python in a serverless way. Cloud Run is also fully managed, meaning you don't have to worry about infrastructure scaling if your service starts getting a ton of traffic.
If you have an existing stateless Python app, all you need to do is add one file to deploy a surface to Cloud Run. No code changes needed. Users like to use Flask for small services like this because it's a lightweight framework that's easy to set up. Its service has the basics, an HTML file where one can create a form to get user input, a simple CSS file, and an app.py file where we set routes and define functions.
The last file that you will need to define is the Docker file. This allows users to customize the runtime of their container to suit their needs exactly. Containers are a way to isolate our application to make it run the same no matter where it's deployed.
When creating a Docker file, we first need to specify a base Docker image with the FROM command as below:
FROM python: 3.8-slim
This is where you set your Python runtime.
The COPY command adds files from your Docker client's current directory as below:
COPY. . /
The RUN command installs Flask, gunicorn, and currency converter dependencies for the service.
RUN pip install Flask gunicorn CurrencyConverter
And finally, CMD is a command to start the application inside the container and bind it to a port.
CMD gunicorn --bind :$PORT app:app
The app: app at the end means import our app from the app.py file.
One of the advantages of Cloud Run is that you can run any Python version you want as long as there is a base Docker image available for it. You can even use the newest version of Python, version 3.8, if you want to.
Now that we have our Docker file, we can build our container with Cloud Build. This bundles up our code along with everything we've added in our Docker file and pushes it to the Container Registry, a place to store container images. And finally, we deploy the service to Cloud Run.
It only takes two commands to get the service out to the world. In the terminal, we first build the container using the builds command.
$ gcloud builds submit --tag gcr.io/PROJECT_ID/PROJECT-NAME
And then we deploy the service using the container image we just built.
$ gcloud run deploy --image gcr.io/PROJECT_ID/PROJECT-NAME
If we check out the Cloud Run section of Google Cloud console, we can see our Cloud Run service. If we click the service, we can see important info, like metrics and the URL of our service.
Here users can also redirect or split user traffic to previous revisions if they discover the latest revision has a breaking change.
