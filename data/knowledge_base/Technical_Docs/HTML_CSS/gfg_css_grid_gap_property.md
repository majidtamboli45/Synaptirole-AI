# CSS grid-gap Property

> Source: https://www.geeksforgeeks.org/css/css-grid-gap-property

The grid-gap property sets the size of the gap between rows and columns in a grid layout, allowing you to easily control the spacing between grid items in both horizontal and vertical directions.
It is a shorthand property for the following properties:
- grid-column-gap property
- grid-row-gap property
Syntax:
grid-gap: grid-row-gap grid-column-gap;
Property Values:
- grid-row-gap: Sets the size of the gap between the rows in a grid layout. The default value is 0
- grid-column-gap: Sets the size of the gap between the columns in a grid layout. The default value is 0.
Different Examples of CSS Grid Gap Property
Example 1: In this example, we are using the CSS grid-gap property to give a gap between the row and columns.
<!DOCTYPE html>
<html>
  
<head>
    <title>
        CSS grid-gap Property
    </title>
    <style>
        body {
            text-align: center;
        }
        h1 {
            color: black;
        }
        .grid-container {
            display: grid;
            grid-template-columns: auto auto auto;
            grid-column-gap: 50px;
            grid-row-gap: 10px;
            background-color: blue;
            padding: 10px;
        }
        .grid-container>div {
            background-color: white;
            text-align: center;
            padding: 20px 0;
            font-size: 30px;
        }
    </style>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h2>Grid-gap property</h2>
    <p>This grid has a 50px gap between
        columns and 10px gap between rows. :
    </p>
    <div class="grid-container">
        <div class="item1">G</div>
        <div class="item2">E</div>
        <div class="item3">E</div>
        <div class="item4">K</div>
        <div class="item5">S</div>
    </div>
</body>
  
</html>
Output:
Example 2: In this example we are using the css grid gap property to give gap between the row and columns.
<!DOCTYPE html>
<html>
  
<head>
    <title>
        CSS grid-gap Property
    </title>
    <style>
        body {
            text-align: center;
        }
        h1 {
            color: green;
        }
        .grid-container {
            display: grid;
            grid-template-columns: auto auto auto;
            grid-column-gap: 8%;
            grid-row-gap: 5%;
            background-color: black;
            padding: 6%;
        }
        .grid-container>div {
            background-color: yellow;
            text-align: center;
            padding: 20px 0;
            font-size: 30px;
        }
    </style>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h2>Grid-gap property</h2>
    <p>This grid has a 8% gap between columns
        and 5% gap between rows:
    </p>
    <div class="grid-container">
        <div class="item1">G</div>
        <div class="item2">E</div>
        <div class="item3">E</div>
        <div class="item4">K</div>
        <div class="item5">S</div>
    </div>
</body>
  
</html>
Output:
The CSS grid-gap property is useful for creating visually appealing and well-spaced grid layouts. By understanding and utilizing the grid-gap, grid-row-gap, and grid-column-gap properties, developers can achieve precise control over the spacing between grid items, enhancing the overall design and usability of their web pages. Ensure cross-browser compatibility and consider the supported browser versions when implementing this property to maintain a consistent user experience across different platforms.
