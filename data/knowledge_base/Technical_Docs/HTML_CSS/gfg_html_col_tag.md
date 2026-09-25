# HTML col Tag

> Source: https://www.geeksforgeeks.org/html/html-col-tag

HTML <col> tag defines attributes for table columns within the <colgroup> element, allowing styling and formatting of columns, such as width, alignment, and background color. This tag does not contain closing tags.
- Defines visual styles (e.g., background color, width, alignment) for specific table columns.
- Used inside a <colgroup> to apply settings to one or more columns.
- Lets you style multiple columns at once, simplifying table formatting.
<!DOCTYPE html>
<html>
<body>
    <table>
        <colgroup>
            <col span="1" 
            style="background-color: green" />
            <col span="1" 
            style="background-color: red" />
            <col span="1" 
            style="background-color: none" />
        </colgroup>
        <tr>
            <th>NAME</th>
            <th>AGE</th>
            <th>BRANCH</th>
        </tr>
        <tr>
            <td>Ben</td>
            <td>22</td>
            <td>CSE</td>
        </tr>
        <tr>
            <td>Rayen</td>
            <td>21</td>
            <td>ECE</td>
        </tr>
    </table>
</body>
</html>
- <col> tags inside <colgroup> set background colors for each table column (green, red, none).
- These column styles apply automatically to all cells, showing how <col> simplifies column-level formatting.
Syntax:
<col style="property:value;">
Attributes
The various attributes that can be used with the col tag are listed below. Most of the attributes are not supported by HTML5.
- span : span is used to define the number of columns on which property will be applied.
- style : style attribute is used to define the CSS to change the properties of the column (deprecated).
- align :align attribute is used to set the alignment of the content of <col> element (deprecated).
- width : width is used to specify the width of a <col> element (deprecated).
- charoff : charoff is used to specify the number of characters the content will be aligned from the character specified by the char attribute (deprecated).
