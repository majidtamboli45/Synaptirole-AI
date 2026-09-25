# Connecting a MySQL Database to a Django Project

> Source: https://www.geeksforgeeks.org/python/how-to-integrate-mysql-database-with-django/

Django uses SQLite as the default database for development because of its simplicity and ease of setup. For real-world and production-oriented applications, MySQL is commonly preferred due to its strong performance, reliability, and widespread industry adoption.
Step 1: Install MySQL
Install MySQL on Windows
Download the MySQL Installer from the official website:
https://dev.mysql.com/downloads/installer/
During installation:
- Set the MySQL root password
- Ensure the MySQL server is running
Verify installation:
mysql -u root -p
Install MySQL on macOS
Download the macOS DMG installer from the official MySQL website:
https://dev.mysql.com/downloads/mysql/
After installation:
- Run the .dmg installer and complete setup
- Set the MySQL root password
- Start MySQL Server from System Settings -> MySQL
Verify installation:
mysql -u root -p
Install MySQL on macOS Using Homebrew
MySQL can also be installed using Homebrew for a package manager–based installation on macOS.
Install MySQL:
brew install mysql
Start the MySQL service:
brew services start mysql
Verify installation:
mysql --version
mysql -u root
Step 2: Install MySQL Connector
mysqlclient is a C-based MySQL/MariaDB database driver that Django uses as a DB-API 2.0–compliant backend to execute SQL queries and manage connections to a MySQL database. Install it using the following pip command:
pip install mysqlclient
Step 3: Create a Django Project
Create a new Django project:
django-admin startproject MyDB
cd MyDB
Step 4: Create a MySQL Database
Log in to MySQL:
mysql -u root -p
Create a database:
CREATE DATABASE mydb
Step 5: Configure MySQL in settings.py
Open MyDB/settings.py and replace the default SQLite configuration with MySQL:
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'mydb',
        'USER': 'root',
        'PASSWORD': 'your_mysql_password',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
In the above configuration:
- ENGINE: Specifies MySQL as the database backend
- NAME: Database name
- USER: MySQL username
- PASSWORD: Database password
- HOST / PORT: MySQL server connection details
Note: The same steps apply when connecting other databases such as PostgreSQL, MariaDB, or Oracle. Only the database driver and configuration in settings.py need to be updated according to the selected database backend.
Step 6: Apply Database Migrations
Run the following commands to create the required database tables:
python manage.py makemigrations
python manage.py migrate
Step 7: Verify Database Output
Log in to the MySQL database:
mysql -u root -p mydb
Verify the tables created by Django:
SHOW TABLES;
Output:
Step 8: Run the Django Development Server
Start the Django development server:
python manage.py runserver
If the server starts without errors, Django is successfully connected to the MySQL database.
