# Data Marts

> Source: https://www.geeksforgeeks.org/dbms/data-marts-storage-component-of-hdfs/

A Data Mart is a subset of a data warehouse designed to serve the needs of a specific department or business unit within an organization. Whereas a data warehouse, which stores all organizational data, a data mart focuses on a subset of data, making it smaller, faster, and easier to manage.
- It is compatible with tools like Tableau, Power BI, and QlikView for visualization and analysis.
- A data mart can be designed to meet departmental requirements.
- It can scale horizontally or vertically to accommodate more data or users.
Data marts are typically maintained by a single authority or departments like finance, marketing or sales and are optimized for quick retrieval and analysis of relevant data.
Types of Data Marts
Data marts can be classified into three types based on how data is sourced and structured:
1. Dependent Data Mart
- Created by extracting data from a central data warehouse.
- It follows a top-down approach, where the data warehouse is built first from external sources using ETL (Extract, Transform, Load) processes.
- It commonly used by large organizations.
2. Independent Data Mart
- It created directly from external sources, without relying on a data warehouse.
- Follows a bottom-up approach, where the data mart is built first and a data warehouse may later be created from it.
- It is suitable for small organizations and is cost-effective.
3. Hybrid Data Mart
- It combines both approaches extracts data from operational sources or the data warehouse.
- Provides flexibility depending on business requirements.
Features
- Subset of Data: Contains a focused subset of data from a larger warehouse or data lake.
- Optimized for Query Performance: Supports fast queries and efficient analysis.
- Self-Contained: Includes its own tables, indexes and data models for easy management.
- Security: Access can be restricted to specific users or groups.
- ETL Process: Populated via ETL, extracting data from a warehouse or external sources, transforming it as needed and loading it into the data mart.
Need for Data Marts
- Reduces response time for queries.
- It focuses on the functioning of a particular department.
- Maintained by a single authority, ensuring accountability.
- Enables faster data retrieval due to smaller data volumes.
- Enhances the smooth operation and efficiency of departmental processes.
- Easier to design, implement, and maintain compared to a complete data warehouse.
Advantages
- Quick implementation due to Faster to deploy than a full data warehouse.
- Cost-effective because of organizations can choose the type of data mart based on budget and business needs.
- Fast data access can optimized for specific departmental queries.
- Business trend analysis is frequently accessed queries enable trend detection.
- Customizable beacuse it can be tailored to the specific needs of a department.
Disadvantages
- Limited data scope because stores only a subset of organizational data, not suitable for enterprise-wide analysis.
- Management overhead due to maintaining multiple data marts for different departments can become cumbersome.
