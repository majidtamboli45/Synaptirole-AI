# HTML Tables

> Source: https://www.geeksforgeeks.org/html/html-tables

HTML tables help organize data into rows and columns, making information easy to read and compare. They are useful for displaying schedules, price lists, product details, and more.
- Can include text, images, links, and other elements.
- Built using tags like <table>, <tr>, <th>, and <td>.
- Allow clear presentation of data for comparison.
- Can be styled with CSS for better design and readability.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <table>
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Luca</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
</body>
</html>
- An HTML table is created using the <table> tag.
- <tr> defines a table row.
- <th> defines a table header cell (usually bold and centered).
- <td> defines a table data cell that holds actual content.
- Each <tr> represents one row containing <th> or <td> cells.
- Cells can include text, images, lists, links, or even another table (nested table).
HTML Tables Tags
List of all the tags that we used in table formation in html:
- <table> : <table> defines the structure for organizing data in rows and columns within a web page.
- <tr> : <tr> represents a row within an HTML table containing individual cells.
- <th> : <th> shows a table header cell that typically holds titles or headings.
- <td> : <td> represents a standard data cell, holding content or data.
- <caption> : <caption> provides a title or description for the entire table.
- <thead> : <thead> defines the header section of a table, often containing column labels.
- <tbody> : <tbody> represents the main content area of a table, separating it from the header or footer.
- <tfoot> : <tfoot> specifies the footer section of a table, typically holding summaries or totals.
- <col> : <col> defines attributes for table columns that can be applied to multiple columns simultaneously.
- <colgroup> : <colgroup> groups together a set of columns in a table to which you can apply formatting or properties collectively.
Example: Creating a simple table in HTML using a table tag.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<body>
    <table>
<!--Driver Code Ends-->
        <tr>
            <th>Book Name</th>
            <th>Author Name</th>
            <th>Genre</th>
        </tr>
        <tr>
            <td>The Book Thief</td>
            <td>Markus Zusak</td>
            <td>Historical Fiction</td>
        </tr>
        <tr>
            <td>The Cruel Prince</td>
            <td>Holly Black</td>
            <td>Fantasy</td>
        </tr>
        <tr>
            <td>The Silent Patient</td>
            <td> Alex Michaelides</td>
            <td>Psychological Fiction</td>
        </tr>
    </table>
</body>
<!--Driver Code Starts-->
</html>
<!--Driver Code Ends-->
- Displays a table with book details using <table>, with rows <tr> and cells <th> and <td>.
- Each row lists a book’s name, author, and genre in separate columns.
Styling HTML Tables
Use CSS (Cascading Style Sheets) to add styles such as borders, background colors, text alignments, and much more. Here are some basic styles to make your table look neater and more professional:
1. Adding a Border to an HTML Table
A border is set using the CSS border property. If you do not specify a border for the table, it will be displayed without borders.
Syntax:
table, th, td {
border: 1px solid black;
}
<!DOCTYPE html>
<html>
<head>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <table style="width:100%">
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Lucas</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
</body>
</html>
- Uses CSS to add a black border to the table, header cells, and data cells.
- Creates a full-width table displaying first name, last name, and age for three people.
2. Adding Collapsed Borders in an HTML Table
For borders to collapse into one border, add the CSS border-collapse property.
Syntax:
 table, th, td {
border: 1px solid black;
border-collapse: collapse;
}
<!DOCTYPE html>
<html>
<head>
    <style>
    table,
    th,
    td {
        border: 1px solid black;
        border-collapse: collapse;
    }
    </style>
</head>
<body>
    <table style="width:100%">
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Lucas</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
</body>
</html>
- Adds border-collapse: collapse; so table borders merge into a single clean border.
- Shows a full-width table listing first name, last name, and age for three people.
3. Adding Cell Padding in an HTML Table
Cell padding specifies the space between the cell content and its borders. If we do not specify a padding, the table cells will be displayed without padding.
Syntax:
th, td {
padding: 20px;
}
<!DOCTYPE html>
<html>
<head>
    <style>
    table,
    th,
    td {
        border: 1px solid black;
        border-collapse: collapse;
    }
    th,
    td {
        padding: 20px;
    }
    </style>
</head>
<body>
    <table style="width:100%">
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Lucas</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
</body>
</html>
- Uses border-collapse: collapse; and border properties to create a clean, single-bordered table.
- Applies padding: 20px to table cells for better spacing and readability, showing a list of people’s first name, last name, and age.
4. Adding Left Align Headings in an HTML Table
By default, the table headings are bold and centered. To left-align the table headings, we must use the CSS text-align property.
Syntax:
th {
text-align: left;
}
<!DOCTYPE html>
<html>
<head>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th,
        td {
            padding: 20px;
        }
        th {
            text-align: left;
        }
    </style>
</head>
<body>
    <table style="width:100%">
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Lucas</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
</body>
</html>
- Adds text-align: left specifically to <th> elements so table headers are aligned to the left.
- Displays a full-width table with clean borders and padding, listing first name, last name, and age for three people.
5. Adding Border Spacing in an HTML Table
Border spacing specifies the space between the cells. To set the border-spacing for a table, we must use the CSS border spacing property.
Syntax:
table {
border-spacing: 5px;
}
<!DOCTYPE html>
<html>
<head>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
        }
        table {
            border-spacing: 5px;
        }
    </style>
</head>
<body>
    <table style="width:100%">
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Lucas</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
</body>
</html>
- Uses border-spacing: 5px; to add space between table cells instead of collapsing borders.
- Displays a full-width table showing first name, last name, and age with separate bordered cells.
6. Adding Cells that Span Many Columns in HTML Tables
To make a cell span more than one column, we must use the colspan attribute.
<!DOCTYPE html>
<html>
<head>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th,
        td {
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
    <table style="width:100%">
        <tr>
            <th>Name</th>
            <th colspan="2">Telephone</th>
        </tr>
        <tr>
            <td>Lucas Rossi</td>
            <td>9125577854</td>
            <td>8565557785</td>
        </tr>
    </table>
</body>
</html>
- Uses colspan="2" on the Telephone header so one cell stretches across two columns.
- Displays a table with a name in the first column and two phone numbers in the next two columns, all with collapsed borders and padding for readability.
7. Adding Cells that span many rows in HTML Tables
To make a cell span more than one row, we must use the rowspan attribute.
<!DOCTYPE html>
<html>
<head>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th,
        td {
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
    <table style="width:100%">
        <tr>
            <th>Name:</th>
            <td>Lucas Rossi</td>
        </tr>
        <tr>
            <th rowspan="2">Telephone:</th>
            <td>9125577854</td>
        </tr>
        <tr>
            <td>8565557785</td>
        </tr>
    </table>
</body>
</html>
- Uses rowspan="2" on the Telephone header so it spans across two rows.
- Displays one name and two phone numbers in a table with collapsed borders and padding for readability.
8. Adding a Caption in an HTML Table
To add a caption to a table, we must use the "caption" tag.
Syntax:
<table style="width:100%">
<caption>DETAILS</caption>
<!DOCTYPE html>
<html>
<head>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th,
        td {
            padding: 20px;
        }
        th {
            text-align: left;
        }
    </style>
</head>
<body>
    <table style="width:100%">
        <caption>DETAILS</caption>
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Lucas</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
</body>
</html>
- Uses padding: 20px on table cells to add space inside each <th> and <td> for better readability.
- Displays a full-width table with first name, last name, and age, arranged neatly with collapsed borders.
9. Adding a Background Color to the Table
A color can be added as a background in an HTML table using the "background-color" option.
Syntax:
table#t01 {
width: 100%;
background-color: #f2f2d1;
}
<!DOCTYPE html>
<html>
<head>
    <style>
        table,
        th,
        td {
            border: 1px solid black;
            border-collapse: collapse;
        }
        th,
        td {
            padding: 5px;
            text-align: left;
        }
        table#t01 {
            width: 100%;
            background-color: #f2f2d1;
        }
    </style>
</head>
<body>
    <table style="width:100%">
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Lucas</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
    <br><br>
    <table id="t01">
        <tr>
            <th>Firstname</th>
            <th>Lastname</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Lucas</td>
            <td>Rossi</td>
            <td>24</td>
        </tr>
        <tr>
            <td>Sophie</td>
            <td>Dubois</td>
            <td>32</td>
        </tr>
        <tr>
            <td>Sam</td>
            <td>Watson</td>
            <td>41</td>
        </tr>
    </table>
</body>
</html>
- Adds text-align: left and padding for better spacing and alignment inside table cells.
- Includes a second table with id="t01" that applies a custom background color (#f2f2d1) and full width styling.
10. Creating Nested Tables
Nesting tables simply means making a Table inside another Table. Nesting tables can lead to complex table layouts, which are visually interesting and have the potential of introducing errors.
<!DOCTYPE html>
<html>
<body>
    <table border=5 bordercolor=black>
        <tr>
            <td> First Column of Outer Table </td>
            <td>
                <table border=5 bordercolor=grey>
                    <tr>
                        <td> First row of Inner Table </td>
                    </tr>
                    <tr>
                        <td> Second row of Inner Table </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
- Outer table has two columns, and the second column contains a nested inner table.
- Inner table has two rows, demonstrating a table inside another table.
