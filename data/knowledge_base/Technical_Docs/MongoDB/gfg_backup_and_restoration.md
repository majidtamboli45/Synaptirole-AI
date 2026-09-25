# Backup and Restoration

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-backup-and-restoration/

Backup and restoration in MongoDB are important for protecting data and recovering it in case of system failures, accidental deletion, or other data loss events. They help maintain data availability and reliability.
- Backup creates a copy of MongoDB data for future recovery.
- Restoration restores the data from a backup when needed.
- Helps prevent database loss caused by hardware failures, software issues, or human errors.
Backup and Restoration in MongoDB Ensure Data Protection and Recovery
Backup and restoration in MongoDB are essential for protecting the database from data loss and restoring it when failures or unexpected issues occur.
- Protects the database from hardware failures, software issues, and human errors.
- Helps recover data after accidental deletion or cyberattacks.
- Supports disaster recovery and reduces downtime.
Different Backup Methods Are Used in MongoDB
MongoDB supports different backup methods depending on data size, recovery needs, and storage requirements. Each method varies in how much data it copies and how quickly the database can be restored.
- Full Backup: Creates a complete copy of the entire database, including all collections and data.
- Incremental Backup: Copies only the data changed since the last backup, reducing storage space and backup time.
- Differential Backup: Copies all data changed since the last full backup, offering a balance between storage efficiency and recovery speed.
Data Backup in MongoDB
MongoDB uses the mongodump tool to create database backups by exporting data into BSON format. By default, the backup is stored in the dump directory, but a different output location can be specified using the --out option.
Basic Backup Process Using mongodump
The mongodump command is used to export data from a MongoDB instance and can be run with or without arguments depending on the backup requirement.
- Without arguments: Creates a backup of all databases and collections from the local MongoDB instance running on port 27017.
- With arguments: Allows backup of a specific database or collection.
- With --out: Stores the backup in a custom directory instead of the default dump folder.
Backup all databases
mongodump
Backup a specific database and collection
mongodump --db databaseName --collection collectionName
Backup to a custom output directory
mongodump --db databaseName --collection collectionName --out c:\backup
Examples of Backing Up Data in MongoDB
Here are some example discussed:
Example 1: Backing Up All Databases
If a MongoDB instance contains multiple databases, the following command creates a backup of all databases and stores it in the specified folder.
Note: Exit the MongoDB shell before running the mongodump command.
mongodump --out c:\backupDatabase
Output:
Example 2: Backing Up a Specific Collection
The following command creates a backup of the students collection from the GeeksForGeeks database and stores it in the GFGbackup folder.
mongodump --db GeeksForGeeks --collection students --out c:\GFGbackup
Output:
Data Restoration in MongoDB
MongoDB uses the mongorestore utility to restore backup data created by the mongodump tool. It restores BSON data dumps and can be used to recover an entire database backup or a specific collection. It also restores the indexes associated with the backed-up collections.
By default, mongorestore looks for backup data in the dump folder, which is also the default output directory used by mongodump.
Restoring Data Using mongorestore
- Restore all databases: Restores all databases available in the backup folder.
- Restore a specific collection: Restores only the specified collection from the backup.
- Indexes are also restored along with the collection data.
Restore all databases
mongorestore dump
Restore a specific collection
mongorestore --db databaseName --collection collectionName directory\collectionName.bson
Example: Restoring a Specific Collection
In this example, the GeeksForGeeks database contains multiple collections. First, a backup of the students collection is created, then the collection is dropped, and finally it is restored using the backup.
Backup the collection
mongodump --db GeeksForGeeks --collection students --out c:\GFGbackup
Output:
The backup is stored in the c:\GFGbackup folder. After creating the backup, the students collection can be dropped using the following command:
db.students.drop()
Output:
The students collection can now be restored from the backup using the following command:
mongorestore --db GeeksForGeeks --collection students c:\GFGbackup\GeeksForGeeks\students.bson
Output:
MongoDB Follows a Backup and Restore Workflow
Backup and restore in MongoDB work through a series of steps that ensure data is safely copied, stored, and recovered when needed. These processes help maintain data integrity and support recovery after failures or data loss.
Backup Process
- Initiation: The backup process is started manually or through scheduled tasks.
- Data Copying: MongoDB creates a backup of the entire database or selected collections.
- Storage: The backup is stored in a secure location such as a local folder, separate server, or cloud storage.
- Verification: The backup is checked to ensure it is complete and can be restored successfully.
Restore Process
- Selection: The required backup is selected based on the data that needs to be recovered.
- Initiation: The restore process is started using the appropriate MongoDB restore command or tool.
- Data Recovery: The DBMS restores the backup data to the database or collection.
- Verification: The restored data is checked to confirm accuracy and proper database functionality.
