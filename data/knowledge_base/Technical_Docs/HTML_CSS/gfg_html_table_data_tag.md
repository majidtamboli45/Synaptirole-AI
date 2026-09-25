# HTML Table Data Tag

> Source: https://www.geeksforgeeks.org/html/html-td-tag

The <td> tag in HTML defines a standard data cell inside a table. It can hold text, images, numbers, or any other content within a table row (<tr>).
- Used to display regular table data inside rows.
- Text is left-aligned and normal by default (unlike <th>).
<!DOCTYPE html>
<html>
<body>
	<table>
		<tr>
			<td>Row 1, Cell 1</td>
			<td>Row 1, Cell 2</td>
		</tr>
		<tr>
			<td>Row 2, Cell 1</td>
			<td>Row 2, Cell 2</td>
		</tr>
	</table>
</body>
</html>
- The <td> tag creates data cells in the table, holding values like "Row 1, Cell 1."
- Each row uses <td> to place table content into columns.
Syntax:
<td> . . . . </td>
Note: The <td> tag also supports the Global Attributes in HTML and Event Attributes in HTML.
Types of Cells
HTML tables contain two main types of cells that help organize and display information clearly:
1. Header Cells
Header cells define and highlight table headings for better structure and readability.
- Used to display column or row headings in a table.
- Text appears bold and centered by default.
- Helps label and organize table data clearly.
2. Standard Cells
Standard cells store and display the main data content within table rows.
- Used to display regular data within the table.
- Text appears normal and left-aligned by default.
- Holds the actual content corresponding to headers.
Attributes
There are many attributes supported by HTML5 are listed below:
- rowspan : rowspan specifies the number of rows covered by the cell.
- colspan : colspan determines the number of columns covered by the cell.
- id : id identifies the data cell uniquely in the table.
- class : class specifies the CSS class to style the cell.
- style : style gives the visual appearance of the cell through CSS properties.
There are many attributes supported by HTML4.1 but removed from HTML5 are listed below:
- abbr : abbr attribute is used as an abbreviated version of the text content in a header cell.
- align : align sets the alignment the text content within the table.
- axis : axis categorizes header cells in the table.
- bg color : bg color sets the background color of a header cell.
- char : char aligns the content in a header cell to a character.
- charoff : charoff is used to sets the number of characters that will be aligned from the character specified by the char attribute.
- colspan : colspan specifies number of columns a header cell should span.
- headers : headers specifies multiple header cells a cell is related to.
- height : height sets the height of a header cell in the table.
- nowrap : nowrap specifies that the content inside a header cell should not wrap.
- scope : scope is used to specify the score of header content.
- valign : valign is used to set the vertical alignment of text content.
- width : width is used to set the width of a header cell.
Example of HTML td tag
Different ways to use the HTML <td> tag in a table.
Example 1: Implementation of <td> tag with rowspan attribute.
<!DOCTYPE html>
<html>
<body>
	<table border="1">
		<tr>
			<th>Item</th>
			<th>Description</th>
		</tr>
		<tr>
			<td rowspan="2">Laptop</td>
			<td>Brand: XYZ</td>
		</tr>
		<tr>
			<td>Price: $999</td>
		</tr>
	</table>
</body>
</html>
- The <td rowspan="2"> attribute makes the "Laptop" cell span two rows, effectively merging them vertically.
- This technique is useful for grouping related information under a single category.
Example 2: Implementation and styling of table cells.
<!DOCTYPE html>
<html>
<head>
    <style>
        table {
            border-collapse: collapse;
        }
        td {
            border: 1px solid black;
            padding: 8px;
        }
        td:nth-child(even) {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <table>
        <tr>
            <td>Alice</td>
            <td>30</td>
        </tr>
        <tr>
            <td>Bob</td>
            <td>25</td>
        </tr>
    </table>
</body>
</html>
- padding: 8px; adds space inside each table cell.
- background-color: #f9f9f9; applies a light grey background to every even-numbered cell.
- border: 1px solid black; adds a black border around each table cell.
