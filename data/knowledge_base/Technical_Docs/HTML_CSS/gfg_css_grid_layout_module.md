# CSS Grid Layout Module

> Source: https://www.geeksforgeeks.org/css/css-grid-layout-module

The CSS Grid Layout Module is a powerful two-dimensional layout system that enables the creation of complex and responsive designs. It allows precise control over rows, columns, and the positioning of elements.
- Grid layouts work with both rows and columns simultaneously.
- It helps create structured and responsive page layouts.
- Elements can be positioned precisely using grid lines and areas.
<html>
<head>
	<style>
		.grid-container {
			display: grid;
			grid-template-columns: auto auto;
			gap: 10px;
		}
	</style>
</head>
<body>
	<div class="grid-container">
		<div class="grid-item">Item 1</div>
		<div class="grid-item">Item 2</div>
		<div class="grid-item">Item 3</div>
		<div class="grid-item">Item 4</div>
	</div>
</body>
</html>
- The .grid-container uses display: grid; to define a grid layout with two columns (grid-template-columns: auto auto;) and a 10px gap between items.
Syntax:
.class {    display: grid;}
Note: You can also use display: inline-grid; to make an element an inline grid.
CSS Grid Layout Properties
Below is a list of key CSS Grid properties with descriptions:
| Property | Description | 
|---|---|
| column-gap | Defines the amount of space between columns in a multi-column layout, often used with column-count in CSS Grid. | 
| gap | Specifies the spacing (also called gutter) between rows and columns in CSS Grid and Flexbox layouts. | 
| grid | A grid-based layout system in CSS that provides rows and columns, simplifying the design without using floats or positioning. | 
| grid-area | Defines the size and location of a grid item within a CSS grid layout by specifying the start and end lines. | 
| grid-auto-columns | Sets the size of columns that are automatically generated in a CSS Grid layout when more content is added. | 
| grid-auto-flow | It specifies exactly how auto-placed items get flow into the grid. | 
| grid-auto-rows | It is used to specify the size for the rows of implicitly generated grid containers. | 
| grid-column | It describes the number of properties that allow to design of grid structures and control the placement of grid items using CSS. | 
| grid-column-end | It explains the number of columns an item will span, or on which column-line the item will end. | 
| grid-column-gap | It is used to set the size of the gap between the columns in a grid layout. | 
| grid-column-start | It defines for which column line item will start. | 
| grid-gap | It is used to sets the size of the gap between the rows and columns in a grid layout. | 
| grid-row | It is used to specify the size and location in a grid layout. | 
| grid-row-end | It is used to define the grid item's end position within a grid row by specifying the inline edge of its grid area. | 
| grid-row-gap | It is used to define the size of the gap between the grid elements. | 
| grid-row-start | It is used to define the grid items' start position within the grid row by specifying the inline start edge of its grid area. | 
| grid-template | It is a shorthand property for defining grid columns, rows, and areas. | 
| grid-template-areas | It is used to specify the area within the grid layout. | 
| grid-template-columns | It is used to set the number of columns and size of the columns of the grid. | 
| grid-template-rows | It is used to set the number of rows and height of the rows in a grid. | 
More Examples of CSS Grid Layout Module
Three-Column Layout
<html>
<head>
	<style>
		.grid-container {
			display: grid;
			grid-template-columns: 1fr 1fr 1fr;
			gap: 10px;
		}
		.grid-item {
			background-color: #f0f0f0;
			padding: 20px;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="grid-container">
		<div class="grid-item">Column 1</div>
		<div class="grid-item">Column 2</div>
		<div class="grid-item">Column 3</div>
	</div>
</body>
</html>
- The .grid-container is set to display as a grid with three equal-width columns (1fr each) and a 10px gap between them.
- Each .grid-item represents a column with basic styling for clarity.
Responsive Two-Row Layout
<html>
<head>
	<style>
		.grid-container {
			display: grid;
			grid-template-rows: auto auto;
			gap: 15px;
		}
		.grid-item {
			background-color: #e0e0e0;
			padding: 15px;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="grid-container">
		<div class="grid-item">Row 1</div>
		<div class="grid-item">Row 2</div>
	</div>
</body>
</html>
- The .grid-container is defined as a grid with two rows (auto height) and a 15px gap between them.
- Each .grid-item represents a row with minimal styling for demonstration.
Four-Item Grid with Unequal Column Widths
<html>
<head>
	<style>
		.grid-container {
			display: grid;
			grid-template-columns: 1fr 2fr;
			gap: 10px;
		}
		.grid-item {
			background-color: #f0f0f0;
			padding: 20px;
			text-align: center;
		}
	</style>
</head>
<body>
	<div class="grid-container">
		<div class="grid-item">Item 1</div>
		<div class="grid-item">Item 2</div>
		<div class="grid-item">Item 3</div>
		<div class="grid-item">Item 4</div>
	</div>
</body>
</html>
- The .grid-container is defined as a grid with two columns, where the first column takes up one fraction (1fr) of the available space, and the second column takes up two fractions (2fr), creating unequal column widths.
- Each .grid-item represents a grid cell with minimal styling for demonstration purposes.
Best Practices for CSS Grid Layout
- Use Flexible Units: Utilize flexible units like fr and minmax() to create responsive layouts that adapt to various screen sizes.
- Define Explicit Grid Areas: Clearly specify grid areas using grid-template-areas for better readability and maintainability of your code.
- Combine with Other Layout Methods: Integrate CSS Grid with Flexbox to leverage the strengths of both and achieve complex, responsive design.
