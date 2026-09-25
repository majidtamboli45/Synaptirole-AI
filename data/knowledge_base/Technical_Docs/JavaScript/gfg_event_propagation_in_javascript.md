# Event Propagation in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/what-is-event-propagation-capturing-bubbling/

Event Propagation defines the order in which event handlers are triggered when an event occurs in the DOM. In HTML and React, this behavior is handled using two main mechanisms: Event Bubbling and Event Capturing.
- Event Bubbling: The event starts from the target element (component3) and propagates upward to its parent elements (component2 to component1).
- Event Capturing: The event starts from the outermost element (component1) and moves down to the target element (component3).
- When component3 is clicked, all attached click handlers run, and the execution order depends on whether bubbling or capturing is used.
Bubbling
This behavior is known as Event Bubbling. When an event occurs on a component, the event handler is triggered first on the target (inner) component, then on its parent, and continues upward through all ancestor components.
- Default event propagation behavior in the DOM and React.
- Event flows from the innermost element to the outermost element.
- Commonly used for handling events efficiently with parent components.
Example: Three nested div elements have click event handlers. When Component 3 is clicked, the event bubbles up and triggers the handlers of Component 2 and Component 1 in sequence from bottom to top.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <style>
        #div1 {
            background-color: lightgreen;
            padding: 24px;
            border: 1px solid black;
        }
        #div2 {
            background-color: yellow;
            padding: 18px;
            border: 1px solid black;
        }
        #div3 {
            background-color: orange;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h1 style="color: green">GeeksForGeeks</h1>
    <h3>What is Event propagation, capturing, bubbling?</h3>
    <div id="div1">
        Component 1
        <div id="div2">
            component 2
            <div id="div3">
                component 3
            </div>
        </div>
    </div>
    <!-- Javascript code for event bubbling -->
<!--Driver Code Ends-->
    <script>
        let div1 = document.querySelector("#div1");
        let div2 = document.querySelector("#div2");
        let div3 = document.querySelector("#div3");
        div1.addEventListener("click", function (event) {
            alert("Component 1 event clicked");
        });
        div2.addEventListener("click", function (event) {
            alert("Component 2 event clicked");
        });
        div3.addEventListener("click", function (event) {
            alert("Component 3 event clicked");
        });
    </script>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Output:
Capturing
This behavior is known as Event Capturing. In this approach, the event is handled starting from the outermost (parent) element and then moves inward to the target component.
- Event flows from parent to child (outermost to innermost).
- Also referred to as trickle-down event propagation.
- Used when you need to intercept events before they reach the target element.
Example: Three nested div elements have click event handlers. When Component 3 is clicked, the event is first captured by Component 1, then Component 2, and finally Component 3, triggering their handlers in sequence from top to bottom.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <style>
        #div1 {
            background-color: lightgreen;
            padding: 24px;
            border: 1px solid black;
        }
        #div2 {
            background-color: yellow;
            padding: 18px;
            border: 1px solid black;
        }
        #div3 {
            background-color: orange;
            border: 1px solid black;
        }
    </style>
</head>
<body>
    <h1 style="color: green">GeeksForGeeks</h1>
    <h3>What is Event propagation, capturing, bubbling?</h3>
    <div id="div1">
        Component 1
        <div id="div2">
            component 2
            <div id="div3">
                component 3
            </div>
        </div>
    </div>
    <!-- Javascript code for event capturing -->
<!--Driver Code Ends-->
    <script>
        let div1 = document.querySelector("#div1");
        let div2 = document.querySelector("#div2");
        let div3 = document.querySelector("#div3");
        div1.addEventListener("click", function (event) {
            alert("Component 1 event clicked");
        }, true);
        div2.addEventListener("click", function (event) {
            alert("Component 2 event clicked");
        }, true);
        div3.addEventListener("click", function (event) {
            alert("Component 3 event clicked");
        }, true);
    </script>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Output:
