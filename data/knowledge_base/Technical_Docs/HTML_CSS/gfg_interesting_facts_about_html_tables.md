# Interesting Facts About HTML Tables

> Source: https://www.geeksforgeeks.org/html/interesting-facts-about-html-tables

HTML tables are an essential part of web development, used to display data in a structured format. They are commonly used for presenting financial data, schedules, and other tabular information. In this article, we will explore interesting facts about HTML tables and provide step-by-step examples with code.
1. Scope Attribute Clarifies Header Relationships
The scope attribute in <th> elements defines whether a header applies to a row (row), column (col), or a group of rows/columns. This improves accessibility by helping screen readers interpret table structure.
<th scope="col">Price</th> <!-- Column header -->
<th scope="row">Item</th> <!-- Row header -->
2. Headers Attribute Links Cells to Headers
The headers attribute in <td> can reference the id of relevant <th> elements. This is crucial for accessibility when cells relate to multiple headers.
<th id="product">Product</th>
<td headers="product">Laptop</td>
3. The <caption> Element Adds Context
The <caption> tag provides a title or description for a table, placed directly after the opening <table> tag. It’s essential for accessibility and SEO.
<table>
  <caption>Monthly Sales Report</caption>
  <!-- Table content -->
</table>
4. Tables Can Be Made Responsive Without CSS
Using the <overflow> technique with the <div>, you can make tables scrollable without using CSS media queries.
<div style="overflow-x:auto;">
    <table border="1">
        <tr><th>Header 1</th><th>Header 2</th></tr>
        <tr><td>Data 1</td><td>Data 2</td></tr>
    </table>
</div>
5. Merge Cells with rowspan and colspan
The rowspan and colspan attributes allow cells to span multiple rows or columns, optimizing layout and readability.
<table border="1">
    <tr>
        <td rowspan="2">Merged Row</td>
        <td>Cell 1</td>
    </tr>
    <tr>
        <td>Cell 2</td>
    </tr>
</table>
6. Tables Support Captions
The <caption> tag provides a title or description for better accessibility.
<table border="1">
    <caption>Monthly Sales Report</caption>
    <tr><th>Month</th><th>Sales</th></tr>
    <tr><td>January</td><td>$1000</td></tr>
</table>
7. Creating Tables Without <table>
With CSS display: table; any element can behave like a table.
<div style="display: table; border: 1px solid black;">
    <div style="display: table-row;">
        <div style="display: table-cell; border: 1px solid black;">Cell 1</div>
        <div style="display: table-cell; border: 1px solid black;">Cell 2</div>
    </div>
</div>
8. Enhancing Accessibility with Scope Attribute
The scope attribute helps screen readers understand table structure by specifying whether a <th> applies to a column, row, or group.
<table border="1">
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Age</th>
    </tr>
    <tr>
        <td>Alice</td>
        <td>30</td>
    </tr>
</table>
