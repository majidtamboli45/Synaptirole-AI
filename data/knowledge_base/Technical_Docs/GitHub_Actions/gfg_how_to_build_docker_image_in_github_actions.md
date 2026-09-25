# How To Build Docker Image In GitHub Actions ?

> Source: https://www.geeksforgeeks.org/devops/build-docker-image-in-github-actions

GitHub Actions is a powerful tool provided by GitHub to automate tasks directly within your repositories. It plays a crucial role in Continuous Integration/Continuous Deployment (CI/CD) pipelines, enabling developers to automate workflows, tests, and deployments seamlessly.
With GitHub Actions, workflows are defined using simple YAML files called workflow files. These files specify the series of steps or actions that GitHub should take when certain events occur, such as a push to a repository or the creation of a pull request. By defining workflows in YAML, developers can easily configure and customize their automation processes to meet the specific needs of their projects.
Steps To Create Docker Images With Github Actions
Step 1: Create a Github repository link.
Step 2: Commit a Dockerfile to your GitHub repository.
- Navigate to your repository: Go to your GitHub repository's main page.
- Create a new file: Click on the "Add file" dropdown and select "Create new file."
- Name the file: In the field for the file name, enter "Dockerfile" (without quotes).
- Write Dockerfile content: In the text editor area, write the content of your Dockerfile. You can either type it directly or copy and paste it from your local file.
- Commit changes: Scroll down to the bottom of the page. In the section labeled "Commit new file," you'll see fields to enter a commit message and an optional extended description. Enter a meaningful commit message describing the changes you made.
- Commit new file: Click the "Commit new file" button to commit your changes. This will add the Dockerfile to your repository.
Step 3: Select a Github action workflow as shown image below and click on new workflow and write the your workflow in the .yaml file.
There will be workflow recommendations given to you. Our repository contains a Dockerfile, thus the Docker procedures will be shown prominently. We decide to use the "Docker image" procedure, which is seen in the screenshot I have included below on the right. Press the button labeled "Set up this workflow." Its auto suggest the basic workflow.
Step 4: Save your new Github action workflow.
Here is the sample workflow to build the python application , dockerize the application using the docker and push the image into the container registry and artifact registry.
name: <name of your build>
on:
push:
branches: [ main ]
jobs:
build-push-gcr:
name: Build and Push to GCP
runs-on: ubuntu-latest
env:
IMAGE_NAME: <iname-name>
PROJECT_ID: gcp-demo-project-413710
steps:
- name: Checkout
uses: actions/checkout@v2
- uses: google-github-actions/setup-gcloud@v2
with:
service_account_key: ${{ secrets.SERVICE_ACCOUNT_KEY }}
project_id: ${{ env.PROJECT_ID }}
export_default_credentials: true
- name: Build Docker Image
run: docker build -t $IMAGE_NAME:latest .
- name: Configure Docker Client
run: |-
gcloud auth configure-docker --quiet
gcloud auth configure-docker us-central1-docker.pkg.dev --quiet
- name: Push Docker Image to Container Registry (GCR)
env:
GIT_TAG: v1
run: |-
docker tag $IMAGE_NAME:latest gcr.io/${{ env.PROJECT_ID }}/$IMAGE_NAME:latest
docker tag $IMAGE_NAME:latest gcr.io/${{ env.PROJECT_ID }}/$IMAGE_NAME:$GIT_TAG
docker push gcr.io/${{ env.PROJECT_ID }}/$IMAGE_NAME:latest
docker push gcr.io/${{ env.PROJECT_ID }}/$IMAGE_NAME:$GIT_TAG
- name: Push Docker Image to Artifact Registry
env:
GIT_TAG: v1
run: |-
docker tag $IMAGE_NAME:$GIT_TAG us-central1-docker.pkg.dev/${{ env.PROJECT_ID }}/images/$IMAGE_NAME:$GIT_TAG
docker push us-central1-docker.pkg.dev/${{ env.PROJECT_ID }}/images/$IMAGE_NAME:$GIT_TAG
This is my simple docker file to dockerize the our application code.
FROM python:3.10-slim-buster
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY . .
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
Step 5: Make a change and trigger a Docker image build.
The Github web interface is the simplest method for achieving this. Navigate to the page of your repository and select the Docker file. Use the "edit this file" button after that. Apply the modification and push it to the master branch. If you are a proficient user of Git, you may also commit the modification using the command line tool.
Once Github detects a modification to your repository, a new build will begin. An indication that the build has begun should be visible. This is an instance of my repository 5 seconds following the modification.
While doing the build process the image is building with the docker as shown in the image with specified tag.
Now, on Github, you are automatically creating Docker images. Publicating your container image to a Docker registry is the logical next step. For this, I recommend using the Docker publish method.
Conclusin
In the CI/CD process, making a Docker image for every repository change is a minor task. You can now think about deploy the your Docker images on real infrastructure and uploading images to the Articat or docker registry repository.
