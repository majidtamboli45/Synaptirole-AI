# Data Mining Process

> Source: https://www.geeksforgeeks.org/dbms/data-mining-process/

Data mining is the process of analyzing large datasets using statistical, machine learning, and artificial intelligence techniques to discover hidden patterns, relationships, and trends.
- It transforms raw data into actionable insights that support prediction and decision-making.
- Focuses on extracting actionable insights from large datasets and databases.
This pyramid diagram illustrates the Business Intelligence (BI) and Data Analytics hierarchy, showcasing how raw data is progressively transformed into strategic business decisions.
- Data and Value Progression: The process starts at the base with raw Data Sources (managed by DBAs and data professionals), moves up through Data Preprocessing, Exploration, and Mining, and culminates at the peak with Decision Making by End Users (executives and stakeholders).
- Business Impact: As data progresses through the pyramid, its value increases, enabling better business decisions.
Data Mining: Confluence of Multiple Disciplines
Steps of Data Mining Process
Step 1: State the problem: In this step, the modeler defines key variables and forms initial hypotheses about their relationships. It requires close collaboration between domain experts and data mining professionals. This teamwork starts early and continues throughout the entire data mining process to ensure meaningful results.
Step 2: Collect the data: This step focuses on how data is collected. Data should be collected consistently, and training and testing data should ideally come from the same underlying distribution.
Step 3: Perform Preprocessing: Data is usually "collected" from existing databases, data warehouses, and data marts. Data preprocessing usually includes a minimum of two common tasks :
(i) Outlier Detection: Outliers are unusual data values that differ significantly from most other observations. There are two strategies for handling outliers:
- Detect and eventually remove outliers as part of the preprocessing phase.
- Develop robust modeling methods that are insensitive to outliers.
(ii) Scaling, encoding, and selecting features: Data preprocessing involves steps like scaling and encoding variables. Scaling adjusts them to the same range so all features contribute equally. Encoding converts categorical variables into numerical representations so that machine learning and data mining algorithms can process them effectively.
Step 4: Estimate/Build the Model: Apply and test different data mining techniques. It often requires trying multiple models and comparing results to choose the best fit.
Step 5: Interpret model and draw conclusions: The final model should support decision-making and be interpretable.
Major issues in Data Mining
- Mining Different Types of Knowledge: Support various data mining tasks to meet different user needs.
- Use of Background Knowledge: Utilize prior knowledge to improve the mining process.
- Interactive data exploration and querying: Provide flexible queries for interactive data analysis.
- Data Cleaning: Handle noisy, missing, and inconsistent data for accurate results.
- Pattern Evaluation: Identify only useful and interesting patterns.
- Efficiency and Scalability: Process large datasets efficiently.
- Parallel and Distributed Mining: Support mining across multiple systems and incremental updates.
- Result Presentation: Display discovered patterns using simple visualizations and summaries.
Alternative Names for Data Mining:
- Knowledge discovery (mining) in databases (KDD)
- Knowledge extraction
- Data/pattern analysis
- Data archaeology
- Information harvesting
