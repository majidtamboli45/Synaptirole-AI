# JavaScript Custom Events

> Source: https://www.geeksforgeeks.org/javascript/javascript-custom-events/

Custom events are events created by developers to perform specific actions. They allow different parts of an application to communicate without being tightly connected. These events can be linked to elements or objects, and when triggered, they run certain tasks.
How to Create and Trigger Custom Events?
To create and trigger a custom event in JavaScript, we typically follow these steps:
- Create an Event: Use the Event constructor to create a new event.
- Add an Event Listener: Attach an event listener to an element or document to listen for the custom event.
- Dispatch the Event: Use the dispatchEvent() method to trigger the event when needed.
Syntax
const eventName = new Event('eventName');
const eventWithData = new CustomEvent('eventWithData', {
detail: {
key: 'value'
}
});
Now let's understand this with the help of example:
<html>
<head>
    <style>
        body,
        html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            background-color: #f0f0f0;
        }
        #startButton {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            margin-top: 20px;
        }
        #startButton:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <button id="startButton">Start Process</button>
    <script src="app.js"></script>
</body>
</html>
const startProcessEvent = new Event('startProcess');
document.addEventListener('startProcess', () => {
    console.log('Custom event "startProcess" has been triggered!');
    alert('Process Started!');
});
const startButton = document.getElementById('startButton');
startButton.addEventListener('click', () => {
    console.log('Button clicked. Triggering custom event...');
    document.dispatchEvent(startProcessEvent);
});
Output:
In this example
- A button is displayed on the screen.
- A custom event called 'startProcess' is created.
- When the button is clicked, the 'startProcess' event is triggered.
- The event listener shows a console log and an alert saying "Process Started!" when the event occurs.
Condition-based Event Dispatching
In condition-based event dispatching, events are triggered based on certain conditions or states. The event will only be dispatched if the condition is met.
<html>
<head>
    <style>
        body,
        html {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding-top: 20px;
            background-color: #f0f0f0;
        }
        #clickButton {
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
        }
        #clickButton:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <button id="clickButton">Click Me</button>
    <script>
        const customEvent = new Event('customEventTriggered');
        document.addEventListener('customEventTriggered', () => {
            alert('Custom event triggered after 5 clicks!');
            console.log('Event triggered after 5 clicks!');
        });
        let clickCount = 0;
        const button = document.getElementById('clickButton');
        button.addEventListener('click', () => {
            clickCount++;
            if (clickCount === 5) {
                document.dispatchEvent(customEvent);
                clickCount = 0;
            }
            console.log(`Button clicked ${clickCount} times`);
        });
    </script>
</body>
</html>
Output
In this example
- A button is placed at the top of the screen.
- When clicked, a counter tracks how many times the button has been clicked.
- After 5 clicks, a custom event is triggered.
- The custom event shows an alert and logs a message to the console.
- After triggering, the counter resets to 0.
Why Use Custom Events?
Custom events provide several advantages:
- Modularity: Custom events help to separate different parts of the application, making it more modular and easier to maintain.
- Flexibility: Developers can define their own events to handle specific actions or behaviors that standard events do not cover.
- Communication: Custom events allow different components or modules of an application to communicate with each other in a loosely-coupled way.
Real-World Use Cases for Custom Events
- Modular Applications: In complex applications, different parts of the system can communicate using custom events without tightly coupling the components.
- Form Validation: Custom events can be used to trigger validation on form fields whenever the value of an input changes.
- Animations and Transitions: Custom events are useful in animation libraries where one animation can trigger another through custom events.
- Inter-Component Communication: In frameworks like React or Vue, custom events allow child components to send messages to parent components or vice versa.
Conclusion
Custom events in JavaScript provide a powerful way to handle user-defined actions that go beyond the built-in events. By using Event and CustomEvent constructors, developers can create flexible, modular, and decoupled systems in web applications.
