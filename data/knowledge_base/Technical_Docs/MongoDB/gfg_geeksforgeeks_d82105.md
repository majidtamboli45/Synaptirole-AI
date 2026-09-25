# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-map-reduce/

Map-Reduce is an older feature in MongoDB and is generally replaced by the aggregation pipeline for better performance and flexibility.
- Processes large datasets for aggregation.
- Uses map (emit key–value) and reduce (aggregate by key).
- Stores results in a new collection.
- Supports custom logic like sum, max, and avg.
Syntax
db.collection.mapReduce(
mapFunction,
reduceFunction,
{
query: <filter>,
out: <outputCollection>
}
)
- map() function: Uses emit(key, value) where the key is used for grouping (similar to Group By in MySQL).
- reduce() function: Aggregate values for each key (e.g., sum, avg).
- query: Filters the input documents before processing.
- out: Specifies the collection where the result will be stored.
Steps to use Map Reduce in MongoDB
Let's try to understand the mapReduce() using the following example. In this example, we have five records from which we need to take out the maximum marks of each section and the keys are id, sec, marks.
{"id":1, "sec":"A", "marks":80}
{"id":2, "sec":"A", "marks":90}
{"id":1, "sec":"B", "marks":99}
{"id":1, "sec":"B", "marks":95}
{"id":1, "sec":"C", "marks":90}
Step 1: Define the map function
Group by sec and emit marks as values.
var map = function () {
emit(this.sec, this.marks);
}
Step 2: Define the Reduce Function
Compute the maximum marks for each section.
var reduce = function (sec, marks) {
return Array.max(marks)
}
Step 3: Run Map-Reduce
Store results in a new collection.
db.collectionName.mapReduce(map, reduce, { out: "collectionName" })
Step 4: View Result
Output:
{"_id":"A", value:90}
{"_id":"B", value:99}
{"_id":"C", value:90}
Examples of MongoDB Map Reduce
The collection contains employee details like age and rank.
- Database: geeksforgeeks2
- Collection: employee
- Documents: Six documents that contain the details of the employees
Example 1: Find the Sum of Ranks Grouped by Ages
Calculate the sum of rank present inside the particular age group. Now age is our key on which we will perform group by (like in MySQL) and rank will be the key on which we will perform sum aggregation.
var map=function(){ emit(this.age,this.rank)};
var reduce=function(age,rank){ return Array.sum(rank);};
db.employee.mapReduce(map,reduce,{out :"resultCollection1"});
Output:
- In map(), emit(this.age, this.rank) groups documents by age and emits rank for aggregation.
- In reduce(), Array.sum(rank) aggregates ranks per age.
- The { out: "resultCollection1" } option saves the result in the specified collection.
Example 2: Performing avg() Aggregation on Rank Grouped by Ages
Calculate the average of the ranks grouped by age.
var map=function(){ emit(this.age,this.rank)};
var reduce=function(age,rank){ return Array.avg(rank);};
db.employee.mapReduce(map,reduce,{out :"resultCollection3"});
db.resultCollection3.find()
Output:
- Groups documents by age using the map() function.
- Aggregates rank values per age using Array.avg() in reduce().
- Stores the computed averages in resultCollection3.
- Each output document contains the age as _id and the average rank as value.
Usage of Map-Reduce in MongoDB
Here are some usage of Map-Reduce:
- Large Datasets: The aggregation query is slow due to the volume of data. Map-Reduce can process large datasets more efficiently.
- Complex Aggregations: If your aggregation operations are complex or not easily achievable using MongoDB’s aggregation pipeline.
- Custom Data Transformations: We need the flexibility of custom JavaScript functions to process and aggregate the data.
- Performance Optimization: Map-Reduce can be faster than the aggregation pipeline for some large-scale operations like sum, avg, and max.
Limitations of MongoDB Map-Reduce
While MongoDB Map-Reduce is powerful, it is not always the best option. Avoid using it when:
- Simple Aggregation Operations: MongoDB’s aggregation pipeline is generally more efficient for simple aggregation tasks like sum, count, and average.
- Performance Concerns: Map-Reduce involves more overhead and can be slower than the aggregation pipeline for simpler queries.
