# CSS Tables

> Source: https://www.geeksforgeeks.org/css/css-tables

CSS Tables allow you to style and enhance HTML tables for better readability and design. With CSS, you can adjust borders, spacing, colors, alignment, and even add hover effects to make data more organized and visually appealing.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <table>
        <tr>
            <th>Header 1</th>
            <th>Header 2</th>
        </tr>
        <tr>
            <td>Data 1</td>
            <td>Data 2</td>
        </tr>
        <tr>
            <td>Data 3</td>
            <td>Data 4</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
- This code defines a table with two columns and three rows, including a header row.
- The CSS styles apply borders, padding, and background color to enhance the table's appearance.
CSS Table Properties
Here are the different Properties of CSS Tables:
1. Border
The border property defines the appearance of borders around table elements (e.g., table, tr, td, th). It specifies the border's width, style, and color.
Syntax:
  border: table_width table_color;
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    table,
    th,
    td {
        border: 1.5px solid blue;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <table>
        <tr>
            <th>Roll No.</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
- This HTML code creates a table with two columns: "Roll No." and "Name," and two rows of data.
- The CSS styles apply a 1.5px solid blue border to the table, table headers (<th>), and table data cells (<td>).
2. Border Collapse
The border-collapse property controls whether the borders of adjacent cells are merged into a single border or kept separate.
Syntax:
border-collapse: collapse/separate;
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    table.one {
        border-collapse: collapse;
    }
    table.two {
        border-collapse: separate;
      }
    table,
    td,
    th {
        border: 1.5px solid blue;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <table class="one">
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
    <br>
    <br>
    <h2>borders separated:</h2>
    <table class="two">
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
- The first table uses border-collapse: collapse;, making borders merge into a single line.
- The second table uses border-collapse: separate;, keeping borders distinct and spaced apart.
3. Border Spacing
Border Spacing property specifies the distance between the borders of adjacent cells when border-collapse is set to separate.
Syntax:
border-spacing: value;
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    table.one {
        border-collapse: separate;
        border-spacing: 10px;
    }
    table.two {
        border-collapse: separate;
        border-spacing: 10px 30px;
    }
    table,
    td,
    th {
        border: 1.5px solid blue;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <table class="one">
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
    <br>
    <br>
    <table class="two">
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
- The first table uses border-spacing: 10px;, adding equal 10-pixel spacing between all cells.
- The second table uses border-spacing: 10px 30px;, adding 10 pixels of horizontal and 30 pixels of vertical spacing between cells.
4. Caption Side
Caption Side property specifies the placement of the table caption relative to the table.
Syntax:
caption-side: top/bottom;
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    body {
        text-align: left;
    }
    h1 {
        color: green;
    }
    table.one {
        border-collapse: separate;
        border-spacing: 10px;
        caption-side: top;
    }
    table.two {
        border-collapse: separate;
        border-spacing: 10px;
        caption-side: bottom;
    }
    table,
    td,
    th {
        border: 1.5px solid blue;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <table class="one">
        <caption>Caption at the top of the table.</caption>
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
    <br>
    <br>
    <table class="two">
        <caption> Caption at the bottom of the table </caption>
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
- The first table uses caption-side: top;, placing the caption above the table.
- The second table uses caption-side: bottom;, positioning the caption below the table.
5. Empty cells
Empty cells property specifies whether or not to display borders and background on empty cells in a table.
Syntax:
empty-cells:show/hide;
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    table.one {
        border-collapse: separate;
        border-spacing: 10px;
        empty-cells: hide;
    }
    table.two {
        border-collapse: separate;
        border-spacing: 10px;
        empty-cells: show;
      }
    table,
    td,
    th {
        border: 1.5px solid blue;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <table class="one">
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td></td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
    <br>
    <br>
    <table class="two">
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td></td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
- The first table uses empty-cells: hide;, which hides borders and backgrounds of empty cells, making them invisible.
- The second table uses empty-cells: show;, ensuring that empty cells are displayed with their borders and backgrounds.
6. Table layout
The Table layout property is used to set up the layout algorithm used for the table.
Syntax:
table-layout:auto/fixed;
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    table.one {
        width: 80px border-collapse: separate;
        border-spacing: 10px;
        table-layout: auto;
    }
    table.two {
        width: 80px border-collapse: separate;
        border-spacing: 10px;
        table-layout: fixed;
    }
    table,
    td,
    th {
        border: 1.5px solid blue;
        width: 80px;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <table class="one">
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C_D_E_F_G_H_I_J_K_L_M_N_O_P</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
    <br>
    <br>
    <table class="two">
        <tr>
            <th>Roll Number</th>
            <th>Name</th>
        </tr>
        <tr>
            <td>1</td>
            <td>A_B_C_D_E_F_G_H_I_J_K_L_M_N_O_P</td>
        </tr>
        <tr>
            <td>2</td>
            <td>X_Y_Z</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
- The first table uses table-layout: auto;, adjusting column widths dynamically based on content size.
- The second table uses table-layout: fixed;, making column widths fixed and ignoring content size.
