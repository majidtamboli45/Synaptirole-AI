# $pop Operator

> Source: https://www.geeksforgeeks.org/mongodb/mongodb-pop-operator/

The $pop operator in MongoDB removes either the first or the last element from an array field during updates, making it useful for maintaining fixed-size arrays such as rolling logs or recent activity lists.
- Removes either the first or the last element from an array.
- Modifies the array directly in place using updateOne(), updateMany(), or findAndModify().
- Useful for maintaining arrays (e.g., logs or history lists); additional logic is required to enforce a fixed size.
- Part of MongoDB’s array update operators for managing array fields.
Syntax
{ $pop: { <field>: <-1 | 1>, ... } }
- <field> specifies the array field to update and can use dot notation for nested arrays
- The value must be -1 to remove the first element or 1 to remove the last element
- The target <field> must resolve to an array for $pop to work
Examples of $pop in MongoDB
In the following examples, we are working with:
Database: GeeksforGeeks 
Collection: logs
Document: Four documents that contain log-related data.
Example 1: Removing first item from the array
Remove the first element of the recentActions array for the document where user is "Liam" by setting $pop to -1.
db.logs.updateOne(
{ user: "Liam" },
{ $pop: { recentActions: -1 } }
)
Output:
Example 2: Removing last item from the array
Remove the last element of the recentActions array for the document where user is "Emma" by setting $pop to 1.
db.logs.updateOne(
{ user: "Emma" },
{ $pop: { recentActions: 1 } }
)
Output:
Example 3: Removing first item from the embedded/nested document
Remove the first element of the activity.history array in the nested document for the user "Olivia" by setting $pop to -1.
db.logs.updateOne(
{ user: "Olivia" },
{ $pop: { "activity.history": -1 } }
)
Output:
