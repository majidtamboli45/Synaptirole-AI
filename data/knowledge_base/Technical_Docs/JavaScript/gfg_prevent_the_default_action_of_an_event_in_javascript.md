# Prevent the default action of an event in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/how-to-prevent-the-default-action-of-an-event-in-javascript/

The preventDefault() method is used to stop the browser from performing its default action when an event occurs. It allows developers to implement custom behavior instead of the browser's built-in response.
- Prevents the default behavior of an event using event.preventDefault().
- Commonly used with forms, links, and keyboard events.
- Does not stop event propagation; use stopPropagation() if needed.
Create HTML structure with event and function that needs to prevent the default actions.
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Prevent Default</title>
</head>
<body>
    <a href="https://www.example.com/" 
        onclick="return handleClick()">
        Click me
    </a>
    <script>
        function handleClick() {
            alert("Event handled");
        }
    </script>
</body>
</html>
Examples to prevent the default action of an event in JavaScript
The following examples demonstrate different ways to prevent the browser's default behavior for events such as form submission, link navigation, and context menus.
1. Using return statement to prevent the default action
Returning false from an event handler can prevent the default action for some events. However, it is not recommended because event.preventDefault() provides a more reliable approach.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Prevent Default - Example 1</title>
</head>
<body>
    <a href="https://www.example.com/" 
       onclick="return handleClick()">Click me</a>
<!--Driver Code Ends-->
    <script>
        function handleClick() {
            alert("Event handled, but default action prevented");
            return false; // Prevents the default action
        }
    </script>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Output:
In the JavaScript code, the handleClick() function is defined to display an alert message and then return false, preventing the default action (navigating to "https://www.example.com/").
2. Using preventDefault() method to prevent the default action
The preventDefault() method is the standard way to prevent an event's default action. It is called on the event object inside the event handler and is widely supported across modern browsers. For example, it can prevent a link from opening a new page or stop a form from submitting automatically.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Prevent Default - Example 3</title>
</head>
<body>
    <a href="https://www.example.com/" 
       onclick="handleClick(event)">Click me</a>
<!--Driver Code Ends-->
    <script>
        function handleClick(event) {
            alert("Event handled, but default action prevented");
            event.preventDefault(); // Prevents the default action
        }
    </script>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Output:
In the JavaScript code, the handleClick() function is defined to display an alert message and then call event.preventDefault(), which prevents the default action (navigating to "https://www.example.com/").
