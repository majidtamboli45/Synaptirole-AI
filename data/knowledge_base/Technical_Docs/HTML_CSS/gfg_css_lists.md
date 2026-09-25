# CSS Lists

> Source: https://www.geeksforgeeks.org/css/css-lists

CSS Lists are used to display items in a clear and organized manner, either with bullets (unordered) or numbers (ordered).
- CSS lists help present items in an organized way using bullets or numbers, making webpage content clear and easy to read.
- CSS allows customization of list styles, improving the visual design and layout of list elements.
Try It:
Currently Active Property:
list-style-type: decimal;
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
  <style>
    ul {
      list-style-type: square; 
    }
  </style>
<!--Driver Code Starts-->
</head>
<body>
  <ul>
    <li>Item 1</li>
    <li>Item 2</li>
    <li>Item 3</li>
  </ul>
</body>
</html>
<!--Driver Code Ends-->
- The <ul> element represents an unordered list.
- The list-style-type: square; declaration changes the default bullet points to squares.
Types of Lists in CSS
The list can be categorized into 2 types:
- Unordered List: In unordered list, the list items are marked with bullets i.e. small black circles by default.
- Ordered List: In ordered list, the list items are marked with numbers and an alphabet.
Properties of CSS List
We have the following CSS lists properties, which can be used to control the CSS lists:
| Property | Description | 
|---|---|
| list-style-type | Specifies the appearance of the list item marker (e.g., disc, circle, square, numbers, etc.). | 
| list-style-image | Sets the image to be used as the list item marker, replacing the default marker with a custom image. | 
| list-style-position | Defines the position of the marker relative to the list item's content (inside or outside the list item). | 
| list-style | A shorthand property to set list-style-type, list-style-position, and list-style-image together. | 
List Item Marker
The list-style-type property defines the marker for each list item. By default, unordered lists have a disc-shaped marker. You can change it to different types like numbers, squares, or images.
Syntax:
list-style-type: value;
The following value can be used:
| CSS List Style Type | Description | 
|---|---|
| none | No bullet or marker is shown for the list items. | 
| circle | Displays a hollow circle as the marker, commonly used for unordered lists. | 
| decimal | Numbers the list items sequentially, starting from 1 (e.g., 1, 2, 3...). | 
| decimal-leading-zero | Similar to decimal, but adds leading zeroes (e.g., 01, 02, 03...). | 
| lower-roman | Uses lowercase Roman numerals for list markers (e.g., i, ii, iii...). | 
| upper-roman | Shows uppercase Roman numerals as markers (e.g., I, II, III...). | 
| lower-alpha | Assigns lowercase alphabet letters (e.g., a, b, c...) for ordered list markers. | 
| upper-alpha | Marks ordered list items with uppercase letters (e.g., A, B, C...). | 
| square | Displays a solid square as the marker for unordered lists. | 
More examples on CSS Lists
Here some more examples:
Custom Bullet Points
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        ul.custom-bullets {
            list-style-type: none;
            padding-left: 0;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <ul class="custom-bullets">
        <li>First item</li>
        <li>Second item</li>
        <li>Third item</li>
    </ul>
</body>
</html>
<!--Driver Code Ends-->
- The list-style-type: none; removes the default bullet points.
Ordered List with Custom Numbering
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
	<style>
		ol.custom-numbers {
			list-style-type: none;
			counter-reset: custom-counter;
			padding-left: 0;
		}
		ol.custom-numbers li {
			counter-increment: custom-counter;
			margin-bottom: 5px;
		}
		ol.custom-numbers li::before {
			content: counter(custom-counter) ". ";
			font-weight: bold;
			margin-right: 5px;
		}
	</style>
<!--Driver Code Starts-->
</head>
<body>
	<ol class="custom-numbers">
		<li>Step one</li>
		<li>Step two</li>
		<li>Step three</li>
	</ol>
</body>
</html>
<!--Driver Code Ends-->
- The counter-reset: custom-counter; initializes a custom counter for the list.
- Each li increments the counter, and the ::before pseudo-element displays the current counter value followed by a period.
Best Practices for CSS Lists
Proper CSS list styling improves readability, maintains a consistent design, and ensures lists are visually clear and easy to navigate.
- Use Consistent Styling: Ensure uniform appearance across all lists by defining standard styles for list types (ul, ol) and list items (li).
- Maintain Proper Indentation: Align nested lists correctly to reflect hierarchy, enhancing readability and structure.
- Customize List Markers Thoughtfully: Use list-style-type or custom markers to match the design aesthetic, ensuring they enhance user experience without causing confusion.
