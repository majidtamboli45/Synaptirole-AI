# How to Create a Superuser in Django

> Source: https://www.geeksforgeeks.org/python/how-to-create-superuser-in-django/

Django comes with a built-in admin panel that helps developers manage the database, users, and application models efficiently, without needing a separate interface. To access and use the admin panel, a superuser must be created.
- A superuser is a user with full administrative privileges.
- The admin panel allows you to add, edit, and delete model data.
Steps to Create a Superuser
Before creating a superuser, ensure your project has been migrated to set up necessary database tables. Follow these steps to create a Superuser:
1. Navigate to the Project Directory
Open terminal or command prompt and move to the directory where your manage.py file is located.
cd path/to/your/django/project
2. Run the Superuser Creation Command
Execute the following command to initiate the superuser creation process:
python manage.py createsuperuser
3. Enter Required Details:
The system will prompt you to enter details for the superuser:
- Username: Choose a username for the superuser.
Username: admin
- Email Address: Provide an email address (optional, can be left blank).
Email address: admin@example.com
- Password: Enter a secure password and confirm it when prompted.
Password: ********
Password (again): ********
4. Successful Superuser Creation:
If all fields are entered correctly, Superuser created successfully.
Logging into the django admin panel
Once the superuser is created, follow these steps to log in:
1. Start the Django development server:
python manage.py runserver
2. Open web browser and navigate to the Django admin login page:
http://127.0.0.1:8000/admin/
3. Enter the Username and Password you set while creating the superuser.
Click Login, and you will be redirected to the Django Admin Dashboard, where you can manage your application’s models, users and data.
Additional Superuser Operations
1. Changing Superuser Password: If the superuser password is forgotten, reset it using:
python manage.py changepassword <username>
2. Creating Multiple Superusers: Additional superusers can be created by running the createsuperuser command again.
3. Managing Users via Shell: Superusers can also be created or managed from the shell:
python manage.py shell
from django.contrib.auth.models import User
User.objects.create_superuser('newadmin', 'admin@example.com', 'securepassword')
Related Articles:
