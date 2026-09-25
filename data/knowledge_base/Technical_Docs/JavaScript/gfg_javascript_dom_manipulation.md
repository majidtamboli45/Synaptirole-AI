# JavaScript DOM Manipulation

> Source: https://www.geeksforgeeks.org/javascript/how-to-manipulate-dom-elements-in-javascript/

The Document Object Model (DOM) represents the structure of a webpage as a tree of objects. It allows JavaScript to access and modify the content, structure, and styling of HTML elements dynamically.
- Enables changing HTML content and attributes using JavaScript.
- Allows styling updates like colors, fonts, and layout.
- Provides methods to add, remove, or modify elements in the webpage.
Manipulation of DOM Elements
We can manipulate or change the DOM elements by using the following methods:
1. Change the Content of an Element
You can change the content inside an HTML element using JavaScript. The two most common properties for this are innerHTML and textContent:
- innerHTML: Allows you to get or set the HTML content inside an element.
- textContent: Allows you to get or set the text content inside an element, ignoring any HTML tags.
<body>
    <div id="example1">This is the original content using innerHTML.</div>
    <div id="example2">This is the original text content using textContent.</div>
    <button onclick="changeContent()">Change Content</button>
    <script>
        // Function to change content
        function changeContent() {
            document.getElementById("example1").innerHTML = 
            "<strong>This is changed using innerHTML!</strong>";
            document.getElementById("example2").textContent = 
            "This is changed using textContent!";
        }
    </script>
</body>
- innerHTML changes the entire content of an element, including HTML tags. In this case, we replace the content of the first div with bold text using <strong>.
- textContent changes only the text inside the element, ignoring any HTML tags. The second div is updated with plain text, without any HTML formatting.
- The first div shows "This is the original content using innerHTML."
- The second div shows "This is the original text content using textContent."
- After clicking the "Change Content" button.
- The first div will display "This is changed using innerHTML!" with bold text.
- The second div will display "This is changed using textContent!" with plain text.
2. Manipulate the Class Attribute
You can add, remove, or toggle classes on an element using JavaScript. This is helpful for styling or applying animations.
- classList.add(): Adds a class to an element.
- classList.remove(): Removes a class from an element.
- classList.toggle(): Toggles a class (adds it if it's not present, removes it if it is).
<html>
<head>
    <style>
        .highlight {
            color: red;
            font-weight: bold;
        }
        .bold {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div id="example" class="bold">This is a text element with the "bold" class.</div>
    <button onclick="addClass()">Add 'highlight' Class</button>
    <button onclick="removeClass()">Remove 'bold' Class</button>
    <button onclick="toggleClass()">Toggle 'highlight' Class</button>
    <script>
        function addClass() {
            document.getElementById("example").classList.add("highlight");
        }
        function removeClass() {
            document.getElementById("example").classList.remove("bold");
        }
        function toggleClass() {
            document.getElementById("example").classList.toggle("highlight");
        }
    </script>
</body>
</html>
- Adding a Class (addClass()): Adds the highlight class to the element, changing its appearance based on the CSS rules.
- Removing a Class (removeClass()): Removes the bold class from the element, removing the bold styling.
- Toggling a Class (toggleClass()): Adds the highlight class if it is absent, or removes it if it is already present.
3. Set CSS Styles Using JavaScript
You can directly manipulate the CSS styles of an element using the style property. This allows you to dynamically change how elements appear on the page.
// Changing multiple CSS properties
document.getElementById("demo").style.color = "red";
document.getElementById("demo").style.fontSize = "20px";
// Adding more than one style
document.getElementById("demo").style.cssText = "color: blue; font-size: 18px;";
4. Create, Add, and Remove Elements
You can create new elements, add them to the DOM, insert them at a specific position, or remove existing elements using JavaScript.
- document.createElement(): Creates a new element.
- appendChild(): Adds an element as the last child of a parent element.
- insertBefore(): Inserts an element before a specified child element.
- element.remove(): Removes an element directly.
- removeChild(): Removes a child element from its parent.
// Create a new element
let newDiv = document.createElement("div");
newDiv.textContent = "This is a new div";
// Add the element to the DOM
document.body.appendChild(newDiv);
// Create another element
let anotherDiv = document.createElement("div");
anotherDiv.textContent = "Inserted before the new div";
// Insert before an existing element
document.body.insertBefore(anotherDiv, newDiv);
// Remove the element
newDiv.remove();
- createElement() creates new HTML elements dynamically.
- appendChild() adds an element to the end of a parent element.
- insertBefore() inserts an element before a specified element.
- remove() removes an element from the DOM.
- These methods allow dynamic modification of the webpage structure.
5. Manipulate Element Attributes
You can easily get, set, or remove the attributes of an HTML element using the following methods:
- getAttribute(): Retrieves the value of an attribute.
- setAttribute(): Sets a new value for an attribute.
- removeAttribute(): Removes an attribute.
// Get the value of an attribute
let src = document.getElementById("image").getAttribute("src");
// Set a new value for an attribute
document.getElementById("image").setAttribute("src", "new-image.jpg");
// Remove an attribute
document.getElementById("image").removeAttribute("src");
6. Manipulate Data Attributes
HTML5 introduced data attributes, which are custom attributes that you can use to store extra information about an element. These are particularly useful for adding data to an element without affecting its visual structure.
- dataset: A special property in JavaScript that allows you to access data attributes.
// Setting a data attribute
document.getElementById("demo").dataset.userId = "12345";
// Getting a data attribute
let userId = document.getElementById("demo").dataset.userId;
console.log(userId); // Outputs: 12345
