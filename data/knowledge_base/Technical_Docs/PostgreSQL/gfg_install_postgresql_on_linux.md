# Install PostgreSQL on Linux

> Source: https://www.geeksforgeeks.org/postgresql/install-postgresql-on-linux/

This is a step-by-step guide to install PostgreSQL on a Linux machine. By default, PostgreSQL is available in all Ubuntu versions as PostgreSql "Snapshot". However other versions of the same can be downloaded through the PostgreSQL apt repository. 
We will be installing PostgreSQL version 11.3 on Ubuntu in this article. 
There are three crucial steps for the installation of PostgreSQL as follows: 
- Check for the current version of PostgreSQL on your Ubuntu 
- Install PostgreSQL 
- Verify the installation 
Check for the current version of PostgreSQL
You can check for the current version of PostgreSQL on your Ubuntu device by using the below command in the terminal:
postgres -V 
Installing PostgreSQL on Ubuntu
After checking if you need an update of PostgreSQL, follow the below steps to install the latest PostgreSQL version:
- Step 1: Add the GPG key for connecting with the official PostgreSQL repository using the below command:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
- Step 2: Add the official PostgreSQL repository in your source list and also add it's certificate using the below command:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" >> /etc/apt/sources.list.d/pgdg.list'
- Step 3: Run the below command to install PostgreSQL:
sudo apt update
sudo apt install postgresql postgresql-contrib 
Verifying the Installation of PostgreSQL
There are couple of ways to verify the installation of PostgreSQL like connecting to the database server using some client applications like pgAdmin or psql. 
The quickest way though is to use the psql shell. For that follow the below steps: 
- Step 1: Open the terminal and run the below command to log into PostgreSQL server:
sudo su postgres
- Step 2: Now use the below command to enter the PostgreSQL shell:
psql
- Step 3: Now run the below command to check for the PostgreSQL version:
SELECT version();
