# HTML DOM (Document Object Model)

> Source: https://www.geeksforgeeks.org/javascript/dom-document-object-model/

The HTML DOM (Document Object Model) is a structured representation of a web page that allows developers to access, modify, and control its content and structure using JavaScript. It powers most dynamic website interactions, enabling features like real-time updates, form validation, and interactive user interfaces.
- The HTML Document Object Model (DOM) is a tree structure, where each HTML tag becomes a node in the hierarchy.
- At the top, the <html> tag is the root element, containing both <head> and<body> as child elements.
- These in turn have their own children, such as <title>, <div>, and nested elements like <h1>, <p>,<ul>, and<li>.
- Elements that contain other elements are labeled as container elements, while elements that do not are simply child elements.
- This hierarchy allows developers to navigate and manipulate web page content using JavaScript by traversing from parent to child and vice versa.
Structure of the HTML DOM
Imagine your webpage as a tree:
- The document is the root.
- HTML tags like <html>, <head>, and <body> are branches.
- Attributes, text, and other elements are the leaves.
Requirement of DOM
The DOM is essential because:
- Dynamic Content Updates: Without reloading the page, the DOM allows content updates (e.g., form validation, AJAX responses).
- User Interaction: It makes your webpage interactive (e.g., responding to button clicks, form submissions).
- Flexibility: Developers can add, modify, or remove elements and styles in real-time.
- Cross-Platform Compatibility: It provides a standard way for scripts to interact with web documents, ensuring browser compatibility.
Working of DOM
The DOM connects your webpage to JavaScript, allowing you to:
- Access elements (like finding an <h1> tag).
- Modify content (like changing the text of a <p> tag).
- React to events (like a button click).
- Create or remove elements dynamically.
Types of DOM
The DOM is seperated into 3 parts:
- Core DOM: It is standard model for all document types(All DOM implementations must support the interfaces listed as "fundamental" in the code specifications).
- XML DOM: It is standard model for XML Documents( as the name suggests, all XML elements can be accessed through the XML DOM .)
- HTML DOM: It is standard model for HTML documents (The HTML DOM is a standard for how to get, change, add, or delete HTML elements.)
Properties of the DOM
- Node-Based: Everything in the DOM is represented as a node (e.g., element nodes, text nodes, attribute nodes).
- Hierarchical: The DOM has a parent-child relationship, forming a tree structure.
- Live: Changes made to the DOM using JavaScript are immediately reflected on the web page.
- Platform-Independent: It works across different platforms, browsers, and programming languages.
The Document
The Document interface represents a web page loaded in the browser and acts as the main entry point to its content. It allows developers to access and manipulate the page through the DOM tree.
- The DOM tree consists of nodes like <body>, <table>, and other HTML elements.
- The Document interface provides global access to page information such as the URL.
- It enables creating, modifying, and managing elements within the web page.
HTML documents served with the "text/html" content-type, also implement the HTMLDocument interface, whereas XML and SVG documents implement the XMLDocument interface.
The Window (BOM)
Before getting into the window object, let’s talk briefly about another concept, BOM. The Browser Object Model (BOM) allows JavaScript to “talk to” the browser. Even though there are no official standards for the Browser Object Model (BOM), modern browsers have implemented (almost) the same methods and properties for JavaScript interactivity.
- Now, the window object basically represents the browser window.
- All global JavaScript objects, functions, and variables automatically become members of the window object.
- Even the document object (of the HTML DOM) is a property of the window object.
window.document.getElementById(“header”);
The Object
All of the properties, methods, and events available for manipulating and creating web pages are organized into objects inside dom (for example, the document is itself an object that represents the document itself, the table an object that implements the special HTMLTableElement DOM interface for accessing HTML tables, and so forth).
- The modern DOM is built using multiple APIs that work together.
- The core DOM defines the objects that fundamentally describe a document and the objects within it.
- This is enhanced and expanded upon need.
- For example, the HTML DOM API adds support for representing HTML documents to the core DOM.
The Interface
In the HTML DOM, an interface is like a blueprint that defines the properties and methods available for different types of elements. For example, a<table> element uses the HTMLTableElement interface, which gives it special table-specific methods like insertRow(). Most elements inherit features from more general interfaces like Element and Node, allowing you to interact with them easily using JavaScript.
It shows how different types of HTML elements are related through interfaces, from general to more specific:
- EventTarget is the base interface from which most DOM nodes inherit. It allows elements to listen for and respond to events.
- Node extends EventTarget and represents any single point in the document tree—such as elements, text, or comments.
- Document is a specialized type of Node that acts as the entry point to the entire DOM tree (i.e., the web page).
- HTMLElement extends Node and represents any HTML element (like <div>, <p>, etc.).
- HTMLTableElement is a more specific type of HTMLElement tailored for <table> elements, giving it extra table-related methods like insertRow().
Note: The HTMLTableElement interface provides special properties and methods (beyond the regular HTMLElement object interface it also has available to it by inheritance) for manipulating the layout and presentation of tables in an HTML document.
Accessing data from DOM
JavaScript uses the DOM to access the document and its elements in the webpage using the API for the document or window .
For example, the standard DOM specifies that the getElementsByTagName the method in the code below must return a list of all the <p> elements in the document:
const paragraphs = document.getElementsByTagName("p");
// paragraphs[0] is the first <p> element
Similarly, we can also access HTML elements by:
- id : var x = document.getElementById(“intro”); (Only one element gets returned with this method)
- class name: var x = document.getElementsByClassName(“intro”);
- CSS selectors: var x = document.querySelectorAll(“p.intro”);
- HTML elements by HTML object collections:
document.anchors.length;
document.forms.length;
document.images.length;
document.links.length;
document.scripts.length;
DOM Data Types
When working with the DOM (Document Object Model), there are different types of data or building blocks used behind the scenes. Here’s what they mean in everyday terms:
- Document: Think of it as the entire webpage. It's like the starting point or the big box that holds everything you see on a website.
- Node: Anything on the webpage—like a heading, paragraph, image, or even some hidden parts—is called a node. It’s like a small part or piece of the whole page.
- Element: This is a specific type of node. It represents actual tags you write in HTML, like <div>, <p>, or <img>. These are the visible parts of the page.
- NodeList: Imagine you ask the page to give you all the buttons or all the paragraphs—it gives you a list of those items. That list is called a NodeList. It's like a group of nodes stored together.
Commonly Used DOM Methods
| Methods | Description | 
|---|---|
| getElementById(id) | getElementById(id) method is used to select an element by its unique ID. | 
| getElementsByClassName(class) | getElementsByClassName(class) method retrieves all elements that share a given class name. | 
| querySelector(selector) | querySelector(selector) method returns the first element that matches the specified selector. | 
| querySelectorAll(selector) | querySelectorAll(selector) method selects all elements that match the given selector. | 
| createElement(tag) | createElement(tag) method is used to create a new HTML element dynamically. | 
| appendChild(node) | appendChild(node) method adds a child node to an existing element. | 
| remove() | remove() method is called to remove an element from the DOM. | 
| addEventListener(event, fn) | addEventListener(event, fn) method attaches an event handler function to an element. | 
<html>
<body>
    <h2>GeeksforGeeks</h2>
    <!-- Finding the HTML Elements by their Id in DOM -->
    <p id="intro">
        A Computer Science portal for geeks.
    </p>
    <p>
        This example illustrates the <b>getElementById</b> method.
    </p>
    <p id="demo"></p>
    <script>
        const element = document.getElementById("intro");
        document.getElementById("demo").innerHTML =
            "GeeksforGeeks introduction is: " + element.innerHTML;
    </script>
</body>
</html>
Example : This describes the representation of the HTML elements in the tree structure.
<table>
    <ROWS>
        <tr>
            <td>Car</td>
            <td>Scooter</td>
        </tr>
        <tr>
            <td>MotorBike</td>
            <td>Bus</td>
        </tr>
    </ROWS>
</table>
Understanding HTML Table Structure through DOM
This image visually represents how <table> contains <tr> (rows), which contain <td> (cells), and how each cell can hold content like "Car", "Scooter", etc., making it a clear example of HTML DOM structure for tables.
Misunderstandings About the DOM
- It is not a binary description where it does not define any binary source code in its interfaces.
- It is not used to describe objects in XML or HTML whereas the DOM describes XML and HTML documents as objects.
- It is not represented by a set of data structures; it is an interface that specifies object representation.
- It does not show the criticality of objects in documents i.e it doesn't have information about which object in the document is appropriate to the context and which is not.
filename: index.html
<html>
<head></head>
<body>
    <label>Enter Value 1: </label>
    <input type="text" id="val1" />
    <br />
    <br />
    <label>Enter Value 2: </label>
    <input type=".text" id="val2" />
    <br />
    <button onclick="getAdd()">Click To Add</button>
    <p id="result"></p>
    <script type="text/javascript">
        function getAdd() {
            // Fetch the value of input with id val1
            const num1 = Number(document.getElementById("val1").value);
            // Fetch the value of input with id val2
            const num2 = Number(document.getElementById("val2").value);
            const add = num1 + num2;
            console.log(add);
            // Displays the result in paragraph using dom
            document.getElementById("result").innerHTML = "Addition : " + add;
            // Changes the color of paragraph tag with red
            document.getElementById("result").style.color = "red";
        }
    </script>
</body>
</html>
