# MongoDB Aggregation $out

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-aggregation-out/

The $out stage in MongoDB allows you to persist the results of an aggregation pipeline by writing them to a collection, making pre-processed data available for reporting, analytics, and future queries.
- $out is an aggregation pipeline stage that writes results to a specified collection.
- The output can be written to a new collection or replace an existing one.
- Must be the last stage in the aggregation pipeline.
- Stores results for later use without re-running complex aggregations.
Key Features of $out
The $out stage stores the final output of an aggregation pipeline into a collection, making processed data reusable for analytics, reporting, and future queries.
- Stores Aggregation Results: Writes the pipeline output into a target collection for reuse.
- Creates or Replaces Collections: Automatically creates the collection or overwrites existing data.
- Optimizes Repeated Queries: Avoids re-running expensive pipelines by persisting results.
- Supports Analytical Workloads: Helps build reporting and data-warehouse-style collections.
- Final Stage Requirement: Must be the last stage in the aggregation pipeline.
Syntax
{ $out: { db: "<output-db>", coll: "<output-collection>" } }
- $out: Specifies the stage in the aggregation pipeline.
- db: Defines the target database for output.
- coll: Specifies the target collection where results are stored
Example of Using $out in MongoDB
Below is a step-by-step guide demonstrating how to use the $out stage in an aggregation pipeline.
Step 1: Aggregating Data and Writing to a New Collection
Using the sample_supplies database, the pipeline groups documents by storeLocation, calculates total items sold per location, and writes the results to the store_items_totals collection.
Step 2: Verifying the Collection Creation
After running the query, a new collection is created, which can be verified using show collections; the store_items_totals collection appears in the sample_supplies database.
Step 3:Checking Data in the New Collection
To check whether the query is written successfully in the new collection we run the command find( ) to display the items in the collections.
Step 4: Understanding the Output
Finally we can infer from the above image that our query is written successfully on a new collection. The results show aggregated sales data per store location.
Use Cases of MongoDB Aggregation $out
The $out stage is employed in various scenarios, including:
- Data Warehousing: Storing pre-aggregated data in separate collections for analytical use.
- Performance Optimization: Creating compact summary collections from large datasets for faster queries.
- Precomputed Analytics: Persisting aggregated results to avoid repeated heavy computations.
- Historical Snapshots: Maintaining aggregated collections to preserve historical trends and reduce operational data size.
- Periodic Reporting: Saving scheduled aggregation results in dedicated collections for quick report generation.
$out Vs $merge
MongoDB provides both $out and $merge stages for storing aggregation results, but they serve different purposes.
| $out | $merge | 
|---|---|
| Creates a new collection or replaces an existing one | Updates or merges data in an existing collection | 
| Completely replaces the existing collection | Merges new data with existing documents | 
| Storing aggregated results separately | Incrementally updating or merging query results | 
| Does not preserve existing data. | Preserves existing data while merging new records. | 
Best Practices for Using $out
Here are some best practices of using $out:
- Ensure the target collection is not capped: $out does not work with capped collections.
- Avoid using $out in sharded collections: MongoDB does not support $out for sharded output collections.
- Use indexes for efficiency: Index the newly created collection for faster queries.
- Monitor Storage Impact: Since $out overwrites existing data, ensure you do not accidentally delete important information.
- Consider $merge for incremental updates: If we need to merge data instead of overwriting it, use $merge.
