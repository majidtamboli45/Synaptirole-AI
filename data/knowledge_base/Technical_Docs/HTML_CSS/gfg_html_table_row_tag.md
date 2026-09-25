# HTML Table Row Tag

> Source: https://www.geeksforgeeks.org/html/html-tr-tag

The <tr> tag in HTML defines a single row within a table, grouping related data or headers horizontally. It acts as a container for table cells.
- Contains <td> (data) or <th> (header) cells.
- Used inside the <table> element to organize content row by row.
- Each <tr> represents one horizontal row of cells in a table structure.
- It helps maintain a structured and readable layout for tabular data.
<!DOCTYPE html>
<html>
<head>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <th>Name</th>
            <th>User Id</th>
        </tr>
        <tr>
            <td>Shashank</td>
            <td>@shashankla</td>
        </tr>
        <tr>
            <td>GeeksforGeeks</td>
            <td>@geeks</td>
        </tr>
    </table>
</body>
</html>
- The <tr> tag is used to define each row in the table structure.
- <tr> creates one header row and two data rows that hold the table content.
Syntax:
<tr> . . . . </tr>
Note: The <tr> tag also supports the Global Attributes and the Event Attributes in HTML.
Attributes
These attributes control the alignment and visual formatting of content within table rows.
- align: The align attribute is used to align the content.
- bgcolor: The bgcolor attribute is used to specify the background color of the row.
- char: The char attribute is used to align the content to a specific character.
- charoff: The charoff attribute is used to set the number of characters to offset the alignment.
- valign: The valign attribute is used to vertically align the content.
Note: These attributes are deprecated in HTML5; use CSS instead.
Example: Implementation of <tr> tag in html.
<!DOCTYPE html>
<html>
<body>
<table border="1">
    <tr>
        <th>Fruit</th>
        <th>Color</th>
    </tr>
    <tr>
        <td>Apple</td>
        <td>Red</td>
    </tr>
    <tr>
        <td>Banana</td>
        <td>Yellow</td>
    </tr>
</table>
</body>
</html>
- The <tr> tag is used to create each row of the table, including one header row and two data rows.
- Each <tr> groups related cells together, such as Fruit–Color in the header and the data pairs like Apple–Red and Banana–Yellow.
