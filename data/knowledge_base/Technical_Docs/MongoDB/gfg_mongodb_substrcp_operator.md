# MongoDB $substrCP Operator

> Source: https://www.geeksforgeeks.org/mongodb/substrcp-aggregation-operator-in-mongodb/

The $substrCP operator in MongoDB extracts substrings based on Unicode code points within the aggregation pipeline, ensuring correct handling of both ASCII and non-ASCII characters for multilingual text processing.
- Extracts substrings using Unicode code point index and length.
- Handles multibyte and non-ASCII characters correctly.
- Designed for use in aggregation stages (e.g., $project, $addFields).
- Avoids byte-level slicing issues seen with byte-based substring methods.
- Suitable for multilingual and special-character text manipulation.
Syntax
{ $substrCP: [ <string expression>, <code point index>, <code point count> ] }
- string expression: Accepts strings with alphabetic, alphanumeric, and special characters as input for substring extraction.
- code point index: It is a non-negative integer that represents the starting point of the substring
- code point count: Non-negative integer specifying the number of characters that need to be taken from the code point index.
Importance of $substrCP
Here are some importance discussed below:
- Works seamlessly with non-ASCII characters (e.g., Chinese, Arabic, emojis, etc.).
- Uses Unicode code points instead of byte positions, ensuring accuracy.
- Supports multibyte character sets effectively.
- Enhances data processing in multilingual applications.
- Helps extract portions of text fields for analysis, filtering, and transformations.
Examples of MongoDB $substrCP Operator
To understand MongoDB $substrCP Operator we need a collection on which we will perform various operations and queries.
- Database: GeeksforGeeks
- Collection: articles
- Documents: Three documents that contain the details of the articles in the form of field-value pairs.
Example 1: Using $substrCP operator
Extract publicationmonth and publicationyear from publishedon.
db.articles.aggregate([
{
$project: {
articlename: 1,
publicationmonth: { $substrCP: ["$publishedon", 0, 4] },
publicationyear: { $substrCP: ["$publishedon", 4, 4] }
}
}
])
Output:
- "publicationmonth" extracts the first 4 characters of publishedon, representing the year.
- "publicationyear" extracts the remaining characters by using $subtract to calculate the length dynamically.
Example 2: Single-Byte Character Set
Create a new field shortName with only the first 10 characters of each article's name. This is useful for displaying short previews of article titles.
db.articles.aggregate([
{
$project: {
articlename: 1,
shortName: {
$substrCP: ["$articlename", 0, 10]
}
}
}
])
Output:
- $substrCP extracts a substring starting from index 0 (first character) and taking 10 characters from articlename.
- The resulting shortName contains the first 10 characters, which can be used as a preview or snippet of the full title.
- This approach ensures correct handling of Unicode characters, preventing any corruption in case of multibyte characters.
Example 3: Handling Multibyte Character Set
Suppose another document in the articles collection has an articlename in a Multibyte Character Set.
db.articles.aggregate([
{
$project: {
shortName: { $substrCP: ["$articlename", 0, 15] }
}
}
])
Output:
$substrCP ensures that characters are correctly extracted even if they are multibyte characters, preventing data corruption.
Important Points About MongoDB $substrCP Operator
Here are some important points:
- $substrCP extracts substrings in the aggregation pipeline using Unicode code point index and length.
- Safely handles non-ASCII/multibyte characters.
- Designed for efficient Unicode-aware string manipulation in aggregation.
