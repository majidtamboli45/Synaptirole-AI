# CSS grid-template-columns Property

> Source: https://www.geeksforgeeks.org/css/css-grid-template-columns-property

The grid-template-columns property in CSS defines the number and size of columns in a grid layout. It allows you to set both fixed and flexible column sizes, making grid-based designs more adaptable to various layouts and responsive needs.
Syntax
grid-template-columns: none | auto | max-content | min-content | length | initial | inherit;
Property Values
Here’s a table format for the Property Values of the grid-template-columns property:
| Property Value | Description | 
|---|---|
| none | Default value. No explicit columns are defined unless required by grid items. | 
| auto | Columns are sized automatically based on content and element sizes. | 
| min-content | Columns are sized according to the smallest content within them. | 
| max-content | Columns are sized according to the largest content within them. | 
| length | Specifies a column size using values like pixels ( px ), em units (em ), or percentages (% ). | 
| initial | Resets the property to its default value. | 
| inherit | Inherits the property value from its parent element. | 
CSS grid-template-columns Property Examples
Example 1: Using Auto and Fixed-Width Columns
This example demonstrates the grid-template-columns property in CSS to create a grid layout with four columns. The first two columns are sized automatically based on their content, the third column is fixed at 200px, and the fourth column is fixed at 150px. The grid also features a 10px gap between the grid items.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS grid-template-columns Property
    </title>
    <style>
        .geeks {
            background-color: green;
            padding: 30px;
            display: grid;
            grid-template-columns: auto auto 200px 150px;
            grid-gap: 10px;
        }
        .GFG {
            background-color: white;
            border: 1px solid white;
            font-size: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="geeks">
        <div class="GFG">A</div>
        <div class="GFG">B</div>
        <div class="GFG">C</div>
        <div class="GFG">D</div>
        <div class="GFG">E</div>
        <div class="GFG">F</div>
        <div class="GFG">G</div>
        <div class="GFG">H</div>
    </div>
</body>
</html>
Output: Example 2: Using min-content, max-content, and Fixed-Width Columns
This example demonstrates the grid-template-columns property using a combination of min-content, max-content, and fixed-width columns. The first column takes the minimum space required, the second adjusts to the largest content, the third is fixed at 400px, and the fourth also takes the minimum space. A 10px gap is applied between grid items.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS grid-template-columns Property
    </title>
    <style>
        .geeks {
            background-color: green;
            padding: 30px;
            display: grid;
            grid-template-columns:
                min-content max-content 400px min-content;
            grid-gap: 10px;
        }
        .GFG {
            background-color: white;
            border: 1px solid white;
            font-size: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="geeks">
        <div class="GFG">Geeks</div>
        <div class="GFG">GFG</div>
        <div class="GFG">C</div>
        <div class="GFG">D</div>
        <div class="GFG">E</div>
        <div class="GFG">F</div>
        <div class="GFG">G</div>
        <div class="GFG">H</div>
    </div>
</body>
</html>
Output:
Supported Browsers
The browser supported by grid-template-columns property are listed below:
Note: This property is widely supported across all modern browsers. Ensure your browser is updated to the latest version for the best compatibility with CSS Grid features. Older browsers, particularly Internet Explorer, may not fully support CSS Grid.
