# HTML caption Tag

> Source: https://www.geeksforgeeks.org/html/html-caption-tag

The <caption> tag in HTML is used to provide a title or description for a <table> element. It helps give context or additional information about the content of the table.
- The <caption> tag must be placed immediately after the opening <table> tag.
- Useful for summarizing table data, especially in large datasets
<!DOCTYPE html>
<html>
<body>
    <table>
        <caption>Student Information</caption>
        <tr>
            <th>Roll No.</th>
            <th>Name</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>1</td>
            <td>Alex</td>
            <td>20</td>
        </tr>
        <tr>
            <td>2</td>
            <td>Ben</td>
            <td>22</td>
        </tr>
    </table>
</body>
</html>
- The <caption> tag provides a title for the table, which in this case is "Student Information".
- The table contains rows of data with roll no, names, and ages.
Syntax
<caption> . . . . </caption>
Note: The <caption> tag also supports the Global Attributes and Event Attributes in HTML.
Example 1: Implementation of an Employee table with a caption tag.
<!DOCTYPE html>
<html>
<body>
    <table>
        <caption>Employee Details</caption>
        <tr>
            <th>Employee Name</th>
            <th>Position</th>
        </tr>
        <tr>
            <td>John</td>
            <td>Manager</td>
        </tr>
        <tr>
            <td>Emma</td>
            <td>Developer</td>
        </tr>
    </table>
</body>
</html>
- The <caption> tag provides a title for the employee details table.
- It helps to clarify the purpose of the table for screen readers and users.
Example 2: We see a styled Product table with a caption tag.
<!DOCTYPE html>
<html>
<head>
	<style>
		table {
			width: 100%;
			border-collapse: collapse;
		}
		th,
		td {
			border: 1px solid black;
			padding: 10px;
		}
		caption {
			font-size: 1.5em;
			margin-bottom: 10px;
		}
	</style>
</head>
<body>
	<table>
		<caption>Product Details</caption>
		<tr>
			<th>Product Name</th>
			<th>Price</th>
		</tr>
		<tr>
			<td>Smartphone</td>
			<td>$599</td>
		</tr>
		<tr>
			<td>Laptop</td>
			<td>$999</td>
		</tr>
	</table>
</body>
</html>
- The <caption> tag is used to label the table as Product Details, making the content easily identifiable.
- Custom styles such as border and padding are applied to enhance readability and table structure.
Best Practices
Follow structured practices to improve table clarity, accessibility, and maintainability.
- Use <caption> to provide a clear and accessible table title.
- Place <caption> immediately after the opening <table> tag.
- Keep captions short, descriptive, and relevant to the table content.
- Use <th> elements to properly define headers for better structure.
- Maintain consistent formatting and alignment across table content.
- Avoid overly complex tables; keep layout simple and readable.
