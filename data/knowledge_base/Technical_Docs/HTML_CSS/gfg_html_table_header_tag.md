# HTML Table Header Tag

> Source: https://www.geeksforgeeks.org/html/html-th-tag

The <th> tag in HTML is used to define table header cells, helping label and organize table columns or rows. It makes header text bold and centered by default, distinguishing it from regular data cells.
- Used to display header information in a table, such as column titles.
- Visually different from <td> cells, which show regular, left-aligned data.
<!DOCTYPE html>
<html>
<head>
<title></title>
</head>
<body>
    <table border='1'>
      <tr>
        <th>Name</th>
        <th>Age</th>
      </tr>
      <tr>
        <td>Roy</td>
        <td>22</td>
      </tr>
    </table>
</body>
</html>
- <th> is used to create table headers like Name and Age.
- Header text appears bold and centered by default.
Syntax
<th> Contents... </th>
Note: The <th> tag also supports the Global Attributes in HTML and Event Attributes in HTML.
Attributes
There are many attributes supported by HTML5 are listed below:
- abbr : abbr attribute is used as an abbreviated version of the text content in a header cell.
- colspan : colspan specifies number of columns a header cell should span.
- headers : headers specifies one or more header cells a cell is related to.
- rowspan : rowspan set the number of rows a header cell should span.
- scope : scope is used to specify the score of header content.
There are many attributes supported by HTML4.1 but removed from HTML5 are listed below:
- align : align sets the alignment of the text content.
- axis : axis categories header cells.
- bgcolor: bgcolor sets the background color of a header cell.
- char : char aligns the content in a header cell to a character.
- charoff : charoff is used to sets the number of characters that will be aligned from the character specified by the char attribute.
- height : height sets the height of a header cell.
- valign : valign is used to set the vertical alignment of text content.
- width : width is used to set the width of a header cell.
Example 1: Implementation of <th> tag in html.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<body>
        <table>
            <thead>
<!--Driver Code Ends-->
                <tr>
                    <th>Name</th>
                    <th>User Id</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Lucas</td>
                    <td>@LucasTin</td>
                </tr>
                <tr>
                    <td>GeeksforGeeks</td>
                    <td>@geeks</td>
                </tr>
<!--Driver Code Starts-->
            </tbody>
        </table>
</body>
</html>
<!--Driver Code Ends-->
- Creates a table with two column headers: Name and User Id.
- Adds two rows of data: Lucas / @LucasTin and GeeksforGeeks / @geeks.
Example 2: Implementation of <th> tag in html.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <style>
        body {
            text-align: center;
        }
        th,
        td {
            border: 1px solid #dddddd;
            padding: 8px;
        }
        table {
            margin: 10px auto;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <h1 style="color: green;"> GeeksforGeeks </h1>
    <h2>Sample Table with <code><th></code> Tag </h2>
    <table>
        <tr>
            <th>Header 1</th>
            <th>Header 2</th>
            <th>Header 3</th>
        </tr>
        <tr>
            <td>Row 1, Cell 1</td>
            <td>Row 1, Cell 2</td>
            <td>Row 1, Cell 3</td>
        </tr>
        <tr>
            <td>Row 2, Cell 1</td>
            <td>Row 2, Cell 2</td>
            <td>Row 2, Cell 3</td>
        </tr>
    </table>
</body>
</html>
- The first row uses <th> to create three bold, centered table headers.
- The next rows use <td> to add normal data cells under each header.
