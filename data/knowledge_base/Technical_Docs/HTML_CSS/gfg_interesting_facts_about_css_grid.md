# Interesting Facts About CSS Grid

> Source: https://www.geeksforgeeks.org/css/interesting-facts-about-css-grid

CSS Grid is one of the most powerful layout systems in CSS. Let’s explore some interesting facts about CSS Grid that will help you use it more effectively.
1. Overlapping Items Made Easy
CSS Grid allows you to easily position items in a way that they overlap one another, which is difficult to achieve with traditional layout methods.
- No Negative Margins: Unlike Flexbox, you don’t need to use negative margins to overlap items.
- Creative Designs: Perfect for creating layered, magazine-style layouts.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            grid-template-rows: 100px 100px;
            gap: 10px;
        }
        .item1 {
            grid-column: 1 / 3;
            grid-row: 1 / 2;
            background-color: lightcoral;
        }
        .item2 {
            grid-column: 1 / 2;
            grid-row: 2 / 3;
            background-color: lightblue;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="item1"></div>
        <div class="item2"></div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- .item1 spans two columns and one row, while .item2 occupies just one column and row.
- The items overlap due to the grid positioning properties.
2. Span Multiple Rows and Columns
You can make grid items span across multiple rows or columns, giving you more flexibility in arranging content.
- Spanning items: Use grid-column and grid-row to define how many rows or columns an item should occupy.
- Responsive layouts: Great for creating layouts that need to adapt to different screen sizes.
- No extra wrappers needed: You can control layout directly on the items.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            grid-template-rows: 100px 100px;
            gap: 10px;
        }
        .item {
            background-color: lightgreen;
        }
        .item1 {
            grid-column: span 2;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="item item1"></div>
        <div class="item"></div>
        <div class="item"></div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- .item1 spans two columns, while the other items take up one column each.
- grid-template-columns: repeat(3, 1fr) defines three equal-width columns in the grid.
3. Automatic Sizing Based on Content
CSS Grid can automatically adjust the size of rows and columns based on the content inside the grid items.
- Content-based sizing: The grid automatically adjusts rows and columns to fit their content.
- No manual sizing: You don’t need to set fixed dimensions for your rows and columns.
- Perfect for responsive designs: Grid adapts to changes in content size automatically.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            display: grid;
            grid-template-columns: repeat(3, auto);
            gap: 10px;
        }
        .item {
            background-color: lightyellow;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="item">Short text</div>
        <div class="item">A longer text that will affect the column width</div>
        <div class="item">More text</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- grid-template-columns: repeat(3, auto) ensures that each column's width adjusts based on its content.
- The container automatically adjusts based on the size of the content in the grid items.
4. Create Complex Layouts with Simple Code
CSS Grid enables you to create complex layouts with just a few lines of code, saving time and effort.
- Simplified layout creation: Define rows and columns once and place content in them.
- No floats or clearfixes: No need for complex CSS hacks like floats or clearfix.
- Efficient grid system: Easily adjust the number of rows and columns.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            display: grid;
            grid-template-columns: 200px 1fr 200px;
            grid-template-rows: 100px auto 100px;
            gap: 10px;
        }
        .header {
            grid-column: 1 / 4;
            background-color: lightgray;
        }
        .sidebar {
            grid-row: 2 / 3;
            background-color: lightblue;
        }
        .content {
            background-color: lightgreen;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="header">Header</div>
        <div class="sidebar">Sidebar</div>
        <div class="content">Content</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- grid-template-columns: 200px 1fr 200px creates three columns (sidebar, content, sidebar).
- The header spans across all columns, and the sidebar is placed in the second row.
