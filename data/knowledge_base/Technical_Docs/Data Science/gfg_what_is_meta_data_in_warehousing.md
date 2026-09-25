# What is Meta Data in Data Warehousing?

> Source: https://www.geeksforgeeks.org/data-science/what-is-meta-data-in-data-warehousing/

Metadata in data warehousing is data that describes other data. It provides information about the structure, meaning, origin, and usage of data stored in a data warehouse. Instead of containing actual business data, metadata acts as a guidebook that helps users and systems understand how data is organized and how it should be used.
For example: if a customer's purchase amount is the data, then the information about when the purchase was made, the data type, and the source system is its metadata.
Note: If data is the content, metadata is the documentation that explains what that content represents.
Examples of Metadata
- File metadata: This includes information about a file, such as its name, size, type, and creation date.
- Image metadata: This includes information about an image, such as its resolution, color depth, and camera settings.
- Music metadata: This includes information about a piece of music, such as its title, artist, album, and genre.
- Video metadata: This includes information about a video, such as its length, resolution, and frame rate.
- Document metadata: This includes information about a document, such as its author, title, and creation date.
- Database metadata: This includes information about a database, such as its structure, tables, and fields.
- Web metadata: This includes information about a web page, such as its title, keywords, and description.
Consider a table named Sales_Fact:
| Metadata Element | Description | 
|---|---|
| Table Name | Sales_Fact | 
| Column Name | Total_Amount | 
| Data Type | DECIMAL(10,2) | 
| Source System | CRM System | 
| Load Frequency | Daily | 
This metadata explains how the actual data should be interpreted and maintained.
Types of Metadata in Data Warehousing
Metadata in a data warehouse is commonly divided into three main categories:
1. Business Metadata
Business metadata describes data in business-friendly terms so that non-technical users can understand it easily.
Examples:
- Meaning of a column like Customer_ID
- Business rules for calculating "Total Sales"
- Report definitions and KPIs
2. Technical Metadata
Technical metadata focuses on the physical and structural aspects of data.
Examples:
- Table and column names
- Data types (VARCHAR, INT, DATE, etc.)
- Indexes, partitions, and storage locations
3. Operational Metadata
Operational metadata tracks process-related information about how data moves and changes.
Examples:
- Data load timestamps
- ETL job status (success/failure)
- Error logs and refresh cycles
How Metadata is Used in Data Warehousing
Metadata supports various warehouse operations, such as:
- ETL processes: mapping source fields to target warehouse fields
- Query optimization: helping database engines choose efficient execution plans
- Data lineage tracking: identifying source systems and transformations
- Impact analysis: understanding how changes affect downstream reports
This makes system maintenance and troubleshooting much easier.
Metadata Repository
A metadata repository is a centralized storage where all metadata is stored and managed. It acts as a reference point for:
- ETL tools
- BI tools
- Data analysts and engineers
- Data governance teams
This repository ensures consistency and standardization across the data warehouse.
