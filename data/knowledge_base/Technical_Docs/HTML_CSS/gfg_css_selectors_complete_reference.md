# CSS Selectors Complete Reference

> Source: https://www.geeksforgeeks.org/css/css-selectors-complete-reference

CSS selectors are used to select HTML elements based on their element name, id, class, attribute, and many more.
Example: Below the HTML/CSS code shows the functionality of ::after selector.
<!DOCTYPE html>
<html>
<head>
    <style>
        p::after {
            content: " - Remember this";
            background-color: blue;
        }
    </style>
</head>
<body>
    <h3>After Selector</h3>
    <p>User ID: @dmor1</p>
    <p>Name: GFG</p>
</body>
</html>
Output:
The complete reference of CSS selectors is listed below:
| CSS Selectors | Description | 
|---|---|
| [attribute*=value] | Select those elements whose attribute value contains the specified substring str. | 
| [attribute=value] | Select those elements whose attribute value is equal to “value”. | 
| [attribute$=value] | Select those elements whose attribute value ends with a specified value “value”. | 
| [attribute\|=value] | Select those elements whose attribute value is equal to “value”. Whose attribute value started with “value” immediately followed by hyphen (-). | 
| [attribute~=value] | Select those elements whose attribute value contains a specified word. | 
| [attribute^=value] | Select those elements whose attribute value begins with the given attribute. | 
| #id | Set the style of the given id. The id attribute is the unique identifier in an HTML document. | 
| * | Select all the elements in an HTML document. | 
| active | It is used in styling an active link on the web page. Style display when the user clicks on the link. | 
| after | It is used to add the same content multiple times after the content of other elements. | 
| before | It is used to add the same content multiple times before the content of other elements | 
| checked | Select all checked elements in the input tag and radio buttons. | 
| Class | Select all elements which belong to a particular class attribute | 
| default | Set a default element in a group of the same type of element in a form. | 
| disabled | This property is mostly used on the form elements. | 
| element | Select HTML elements that are required to be style | 
| element element | Select elements inside the elements | 
| element, element | It is used to style all comma-separated elements with the same style. | 
| element1~element2 | It is used to match the occurrences of element2 followed by element1 | 
| empty | Select that element that does not contain any children (including the text node). | 
| enabled | Set the background color in the enabled element in a form | 
| first-child | Select those elements which are the first-child elements. | 
| first-of-type | It is used to target the first child of every element of its parent. | 
| first-letter | Apply the style to the first letter of the first line of a block-level element. | 
| first-line | Apply style to the first line of a block-level element. | 
| focus | It is used to target the focused element. | 
| hover | Style elements when the mouse hovers over them | 
| indeterminate | Select any form elements that are in an indeterminate state | 
| in-range | Select all elements that are given within a particular range value. | 
| invalid | Select every form element that does not validate according to the elements | 
| lang | Target the element which is based on language attributes for a specific value. | 
| last-child | Target the last child element of its parent for styling. | 
| last-of-type | Target the last child element of the same type as it’s the parent for styling. | 
| link | Target the unvisited link for styling, not the links which are already visited. | 
| not | Style every element that is not specified by the selector | 
| nth-child() | Match the elements based on their position in a group of siblings. | 
| nth-last-child() | Match elements based on their position among the group of siblings, counting from the end. | 
| nth-last-of-type() | Style only those elements which are the nth number of child of the parent element. | 
| nth-of-type() | Style only those elements which are the nth number of child of its parent element. | 
| optional | Style the form input elements which are optional. | 
| only-child | Match every element that is the only child of its parent | 
| only-of-type | Select only those elements have no siblings of the given type. | 
| out-of-range | Select the elements that are lying outside the given range | 
| placeholder | Design the placeholder text by changing the text color and it allows modification of the style of the text. | 
| read-only | Select an element that is readable only | 
| read-write | Select an element (such as an input text) that is editable by the user. | 
| required | Select the required element with the required attribute and set the CSS property. | 
| root | Select all the elements of an HTML Documents | 
| selection | Set the CSS property to the part of the document that is selected by the user. | 
| target | The target selector is used to represent a unique element. | 
| valid | Select the form elements with a given value that validates according to the elements. | 
| visited | select the visited links. |
