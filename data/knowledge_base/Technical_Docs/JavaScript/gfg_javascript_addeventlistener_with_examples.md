# JavaScript addEventListener() with Examples

> Source: https://www.geeksforgeeks.org/javascript/javascript-addeventlistener-with-examples/

The addEventListener() method is used to attach an event handler to an element in the DOM (Document Object Model). It listens for specific events (such as click, keydown, or submit) on that element and executes a function when the event occurs.
Syntax
element.addEventListener(event, function, useCapture);
- element: The DOM element you want to listen for events on (for example, document, button, div).
- event: The type of event you want to listen for, such as 'click', 'keydown', 'submit', etc.
- function: The function to be executed when the event is triggered. It could be an anonymous function or a reference to a named function.
- useCapture (optional): A boolean value that specifies whether to use event capturing.
Working of addEventListener()
When you use addEventListener(), you’re essentially telling JavaScript to "watch" for a specific event on an element. Here's how it works:
- Choose an element: We need to select the element we want to attach an event to.
- Specify the event type: This could be any event like click, hover, keyup, etc.
- Define the action: Provide the function that should run when the event happens.
Note => The event listener continuously checks for the occurrence of the specified event, and once it happens, the corresponding function is executed.
<!--Driver Code Starts-->
<html>
<head>
    <title>JavaScript addEventListeners</title>
</head>
<body>
    <button id="try">Click here</button>
    <h1 id="text"></h1>
<!--Driver Code Ends-->
    <script>
        document.getElementById("try").addEventListener("click", function () {
            document.getElementById("text").innerText = "GeeksforGeeks";
        });
    </script>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- The HTML has a button (<button id="try">) and an empty <h1 id="text"> element.
- JavaScript uses addEventListener() to listen for a click event on the button.
- When the button is clicked, it changes the text of the <h1> element to "GeeksforGeeks".
Adding Multiple Event Listeners to an Element
In JavaScript, we can attach multiple event listeners to the same element. Each event listener can handle a different event or the same event type, and they will all trigger their respective functions when the event occurs.
<!--Driver Code Starts-->
<html>
<head>
    <title>Multiple Event Listeners Example</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        #myButton {
            padding: 15px 30px;
            font-size: 16px;
            cursor: pointer;
            border: none;
            border-radius: 5px;
            background-color: #4CAF50;
            color: white;
            transition: background-color 0.3s ease;
        }
        #myButton:hover {
            background-color: #45a049;
        }
        #message {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div>
        <button id="myButton">Click me!</button>
        <h1 id="message"></h1>
    </div>
<!--Driver Code Ends-->
    <script>
        const button = document.getElementById("myButton");
        const message = document.getElementById("message");
        button.addEventListener("click", function () {
            button.style.backgroundColor = "lightblue";
            message.innerText = "Button was clicked!";
        });
        button.addEventListener("mouseenter", function () {
            message.innerText = "Mouse is over the button!";
        });
        button.addEventListener("mouseleave", function () {
            message.innerText = "Mouse left the button!";
        });
        document.addEventListener("keydown", function (event) {
            if (event.key === "Enter") {
                message.style.color = "green";
                message.innerText = "Enter key pressed!";
            }
        });
    </script>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- Click Event: When the button is clicked, its background color changes to lightblue and the message updates to "Button was clicked!".
- Mouse Enter Event: When the mouse hovers over the button, the message changes to "Mouse is over the button!".
- Mouse Leave Event: When the mouse leaves the button, the message updates to "Mouse left the button!".
- Keydown Event: When any key is pressed, if the Enter key is pressed, the message color changes to green and displays "Enter key pressed!".
- The button reacts to mouse events (click, hover, leave) and a keyboard event (Enter key press), updating the message accordingly.
Adding Event Handlers to the window Object
The window object in JavaScript represents the browser window and can be used to listen for events that occur globally across the entire window, such as resizing the window, scrolling, or keypresses.
<!--Driver Code Starts-->
<html>
<head>
    <title>Interactive Window Event Handlers</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 20px;
            height: 2000px;
            transition: background-color 0.3s ease;
        }
        #message {
            font-size: 20px;
            font-weight: bold;
            margin-top: 20px;
            padding: 10px;
        }
        #keyPressDisplay {
            font-size: 24px;
            font-weight: bold;
            margin-top: 30px;
            color: #333;
        }
    </style>
</head>
<body>
    <h1>Interact with the Page!</h1>
    <div id="message">Resize the window, scroll down, or press a key!</div>
    <div id="keyPressDisplay"></div>
<!--Driver Code Ends-->
    <script>
        const message = document.getElementById('message');
        const keyPressDisplay = document.getElementById('keyPressDisplay');
        // Window Resize Event
        window.addEventListener('resize', function () {
            const width = window.innerWidth;
            const height = window.innerHeight;
            message.innerText = `Window resized! New dimensions: ${width}x${height}`;
            message.style.fontSize = (width / 50) + 'px';
        });
        window.addEventListener('scroll', function () {
            const scrollY = window.scrollY;
            document.body.style.backgroundColor = `rgb(${scrollY % 255}, ${255 - (scrollY % 255)}, 150)`;
            message.innerText = `You have scrolled! Scroll position: ${scrollY}px`;
        });
        // Window Keydown Event
        window.addEventListener('keydown', function (event) {
            keyPressDisplay.innerText = `You pressed the "${event.key}" key!`;
            if (event.key === 'Enter') {
                keyPressDisplay.style.color = 'green';
            } else if (event.key === 'Escape') {
                keyPressDisplay.style.color = 'red';
            } else {
                keyPressDisplay.style.color = '#333';
            }
        });
    </script>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
- Window Resize: Updates message with new dimensions and adjusts font size based on width.
- Scroll Event: Changes background color and displays scroll position.
- Keydown Event: Displays pressed key. Enter key turns text green, Escape turns it red, and other keys keep it default (#333).
Reason to Use addEventListener()
- Cleaner Code: Keeps event handling separate from HTML, improving code organization.
- Multiple Listeners: Allows attaching multiple event listeners to the same element.
- Event Propagation Control: Offers control over event bubbling or capturing.
- Remove Event Listener: Enables you to remove event listeners with removeEventListener().
- Cross-Browser Compatibility: Works consistently across all modern browsers.
- Better Performance: More efficient for handling events than inline event handlers.
- Access to Event Object: Provides detailed information about the event, like mouse position or key pressed.
