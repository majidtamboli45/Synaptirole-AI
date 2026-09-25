# HTML Event Attributes Reference

> Source: https://www.geeksforgeeks.org/html/html-event-attributes

HTML event attributes are used to define actions that should occur when specific events are triggered on a webpage.
- They enable interaction between the user and the system, like clicking a button or resizing a window.
- Event attributes are added to HTML elements to specify the event type and action.
- They enhance dynamic behavior and improve user experience on a webpage.
<html>
<head>
	<script>
		function displayMessage() {
			alert("Button was clicked!");
		}
	</script>
</head>
<body>
	<button onclick="displayMessage()">Click Me!</button>
</body>
</html>
- <button onclick="displayMessage()">: Calls a function when the button is clicked.
- displayMessage(): Shows an alert message when triggered.
Window Event Attributes
Window Event Attributes are HTML/JavaScript event handlers that respond to browser window–level actions such as page load, resize, scroll, focus, or unload, allowing developers to execute scripts when these events occur (e.g., onload, onresize, onscroll).
| Window Event Attributes | Description | 
|---|---|
| onafterprint | Used with onbeforeprint to perform actions after the page is printed. | 
| onbeforeprint | The alert message display before the print dialogue box appears. | 
| onbeforeunload | The onbeforeunload event run when the document is about to be unloaded. | 
| onerror | This attribute works when an error occurs while loading an external file. | 
| onhashchange | This attribute works when there has been changes to the anchor part. | 
| onload | This attribute works when an object has been loaded. | 
| onoffline | The onoffline event attribute works when the browser work in offline mode. | 
| ononline | The ononline event attribute works when the browser starts working in online mode. | 
| onpageshow | This event occurs when a user navigates to a website. | 
| onresize | The onresize event attribute is triggered each time when resize the browser window size. | 
| onunload | Fired when the document is unloaded (e.g., when navigating away). | 
Form Event Attributes
Form Event Attributes are HTML/JavaScript event handlers that respond to user interactions with forms, such as submitting, resetting, or changing input fields. They allow developers to execute scripts when these actions occur.
| Form Event Attributes | Description | 
|---|---|
| onblur | This attribute is mostly used in Form validation code. | 
| onchange | The onchange event attribute works when the value of the element changes and select the new value from the List. | 
| oncontextmenu | This attribute works when the user right-clicks on an element to open the context menu. | 
| onfocus | This event attribute is mostly used with <input>, <select>, <a> elements. | 
| oninput | This attribute works when it gets user input value. | 
| oninvalid | The oninvalid event attribute works when an input field values are invalid or empty. | 
| onreset | The onreset event attribute in HTML is triggered when reset the form. | 
| onsearch | When a user presses the ENTER button or click on the x button. | 
| onselect | The onselect event attribute works when some text has been selected in an element. | 
| onsubmit | The onsubmit event attribute in HTML is triggered when a form is submitted. | 
Keyboard Event Attributes
Keyboard Event Attributes are HTML/JavaScript event handlers that respond to user interactions with the keyboard, allowing scripts to execute when keys are pressed, released, or typed in an input field or the document.
| Keyboard Event Attributes | Description | 
|---|---|
| onkeydown | The onkeydown event is triggered when the user presses any key on the keyboard. | 
| onkeypress | This attribute fires when a user presses a key on the Keyboard. | 
| onkeyup | This onkeyup event attribute works when the user releases the key from the keyboard. | 
Mouse Event Attributes
Mouse Event Attributes are HTML/JavaScript event handlers that respond to user interactions with the mouse, allowing scripts to execute when the mouse is clicked, moved, or interacts with an element.
| Mouse Event Attributes | Description | 
|---|---|
| onclick | The onclick event attribute in HTML works when the user clicks on the button. | 
| ondblclick | This Attribute Event occurs when a user fires mouse Double click on the Element. | 
| onmousedown | when a mouse button is pressed down on the element | 
| onmousemove | The onmousemove attribute works when the pointer moves over an element. | 
| onmouseout | when the mouse pointer moves out of the specified element. | 
| onmouseover | The onmouseover event attribute works when the mouse pointer moves over the specified element. | 
| onmouseup | when a mouse button is released over the element. | 
| onwheel | when the wheel of pointer device is rolled up or down over an element. | 
Drag Event Attributes
Drag Event Attributes are HTML/JavaScript event handlers that respond to drag-and-drop actions, allowing developers to control how elements are dragged, dropped, or moved within a webpage.
| Drag Event Attributes | Description | 
|---|---|
| ondrag | when the element or text selection is being dragged in HTML | 
| ondragend | when the user finished the dragging of element. The drag and drop feature is common in HTML5 | 
| ondragenter | The ondragenter event attribute in HTML works when the content is draggable | 
| ondragleave | The ondragleave attribute works when a draggable element or text selection leaves a valid drop target | 
| ondragstart | HTML ondragstart Event Attribute is used when the user wants to drag the text or element. | 
| ondrop | The ondrop event attribute is used to drag an element or text and drop it into a valid droppable location or target. | 
| onscroll | This onscroll attribute works when an element scrollbar is being scrolled. | 
Clipboard Events Attributes
Clipboard Event Attributes are HTML/JavaScript event handlers that respond to user actions involving the clipboard, such as copying, cutting, or pasting text or data. They allow developers to control or react to these operations.
| Clipboard Events Attributes | Description | 
|---|---|
| oncopy | This attribute fires when the user copied the content present in an element. | 
| oncut | This attribute fires when the user cut or delete the content that has been present in the element. | 
| onpaste | The onpaste attribute works when some content are paste in an element. | 
Misc Events Attributes
Miscellaneous Event Attributes handle non-standard events, such as ontoggle, which triggers when a <details> element is opened or closed.
Best Practices
Best Practices for using HTML event attributes focus on preferring external JavaScript, using event listeners, and avoiding overuse to keep code organized, efficient, and maintainable.
- Prefer External JavaScript: Instead of embedding JavaScript directly within HTML event attributes, link to external JavaScript files to enhance code organization and maintainability.
- Use Event Listeners: Implement event listeners in JavaScript rather than inline event attributes to separate structure from behavior, improving code clarity.
- Avoid Overuse: Limit the number of event attributes to prevent performance issues and maintain a responsive user interface.
