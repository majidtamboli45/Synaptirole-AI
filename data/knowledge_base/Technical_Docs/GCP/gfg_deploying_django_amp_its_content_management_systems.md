# Deploying Django &amp; its Content Management Systems

> Source: https://www.geeksforgeeks.org/devops/google-cloud-platform-deploying-django-its-content-management-systems/

Django is a web framework written in Python that handles serving web pages for you. You define data models as Python objects, and Django simplifies communicating these to a database.
Cloud Run is a managed serverless platform, where each server runs stateless. No data is stored on the servers themselves. But Cloud Run can connect to the state for backing services, databases, APIs, and the like. Web frameworks that rely on databases like Django can run in a serverless setup with some configuration.
The general steps described in this article can be used for not only Django, but any other content management system that uses Django, such as Wagtail and Django CMS. Any Django site can be built into a container image. This image can be deployed as a Cloud Run service, but that just handles the code part. Django also needs a database to store relational data and a place to store media and static assets. These two backing services need to be provisioned and accessible by the service.
Django supports many relational databases, including PostgreSQL and MySQL. We can also use Cloud SQL, a managed database service, that supports both PostgreSQL and MySQL, and even MS SQL.
When users first deploy their Cloud Run service, they'll need to set the add SQL instance parameter, linking their Cloud Run service with their Cloud SQL database as shown below:
$ gcloud run deploy PROJECT_NAME\
  --platform managed\
  --add--cloudsql-instances vivid: REGION: Project\
  ...
This allows the service in the database to communicate over an automatically encrypted connection.
Django will also need connection settings. Not just the instance hostname but also the database username and password.
$ gcloud secrets create DATABASE_URL \ 
  --data-file db_config.txt
Users can store these credentials using Secret Manager, retrieving them at runtime. From here, everything is set up to run Django's migrate command:
python manage.py migrate
Secondly, media and static assets. Users can configure their new Django app to use a Google Cloud Storage bucket to store these files. Cloud storage can be configured as a custom storage backend in Django using the Django storage package. Users just need to install the package using the below command:
$ pip install django-storages [google]
And edit their settings.py to use this new storage backend and point to their new Cloud Storage bucket as below:
$ cat Project/setting.py
'''
DEFAULT_FILE_STORAGE = (
  'storage.backends.gcloud.GoogleCloudStorage')
GS_BUCKET = 'Project-dotcom-media'
...
'''
From here, everything is setup to run Django's collect static command.
Cloud Run focuses on serving containers and doesn't provide a way to run a one-off shell command against a running service. What users can do is run these commands as part of their continuous integration process using Google Cloud Build.
In their Cloud Build config, they can add a new step called migrate between their built step and their deploy step.
$ cat cloudbuild.yaml
steps:
    -id: "build"
    -id: "django migrate"
    name: gcr.io/google-appengine/exec-wrapper'
    args:{ '-i', 'gcr.io/.....,
          '--', 'python', 'manage.py', 'migrate']
    -id: 'deploy'
    ...
This migrate step uses the App Engine exec wrapper, which allows commands to be run against a database during a Cloud Build job. Additionally, they can configure this job to be automatically run anytime the project code is updated in source control using Cloud Build triggers.
$ gcloud builds triggers create github \
  --build-config cloudbuild.yaml \
  -- repo-owner project \
  -- repo-name project-dotcom \
  -- branch-pattern "^prod$"
If an automated process doesn't work for users' migration strategy, they can run their migration commands manually with help from Cloud SQL proxy.
$ ./cloud_sql_proxy ..&
By connecting these manager's services together, users will be able to host their websites in the cloud. These services automatically scale up and down as their load changes throughout the day, without having to pay a fixed price for a virtual server.
