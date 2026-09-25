# What is Scripting ?

> Source: https://www.geeksforgeeks.org/javascript/what-is-scripting/

Scripting is used to automate tasks on a website. It can respond to any specific event, like button clicks, scrolling, and form submission. It can also be used to generate dynamic content. and JavaScript is a widely used scripting language. In this article, we will learn about types of scripting, their features, benefits, applications, and steps to use them.
Table of Content
Types of scripting
There are two types of scripting:
- Client-side scripting (browser scripting)
- Server-Side Scripting
1. Client-side scripting (Browser Scripting)
Client-side scripting refers to the scripts that run on the user's web browser. and JavaScript is the most common language for scripting. It is mostly supported by all browsers, and it allows dynamic scripting. It can handle user interactions like button clicks, hovers, and form submissions, and it can also reduce the load on the server as processing happens on the client side. By using client-side scripting, you can also validate the form field, access the DOM, and manipulate it to dynamically change its content.
2. Server-side scripting
Server-side scripting refers to scripts that run on the web server. and languages such as PHP, Python, Java, and Node. JS is used for server-side scripting. In server-side scripting, the script is executed before it is sent to the browser. It can handle tasks that require a database, file system, and any other server resources securely. It creates dynamic content based on user requests. You can also create an API by using server-side scripting.
Features of Browser Scripting
- By using Document Object Model (DOM) you can dynamically change the content of a web page.
- Event Handling allows you to respond to events like button clicks, form submitting, etc..
- By using Asynchronous JavaScript XM (AJAX) you can dynamically change the content without reloading the page.
- It supports client-side storage like cookies and local storage.
Benefits of Browser Scripting
- It is supported by every browser.
- You can automate tasks like form filling, Data extraction, etc.
- By using AJAX you can dynamically display content without reloading to web page.
- It allows access to browser storage like local storage and cookies.
- You can respond to any event.
- By using DOM you can Dynamically change the content and structure of a web page.
Application of Scripting
- It can be used with other Languages.
- You can make an HTTP request to the server.
- You can automate tasks.
- It can be used to access DOM and dynamically change content.
- It provides a storage facility.
- You can respond to any specific events like button click, scroll, etc.
- It can be used to extract data from server response.
Steps to use Scripting
- Choose a Scripting Language. Ex, JavaScript
- Use any code editor for writing your script. Ex, Notepad, VS Code, Sublime Text etc..
- Learn How to manipulate a DOM and Event Handling.
- Run your Script on Any Browser.
Example
In this example we are change the text GeeksForGeeks on calling a function by button click event. and after 2 second it is alerting a message.
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GeeksForGeeks</title>
</head>
  
<body>
    <h1>GeeksForGeeks | Browser Scripting</h1>
    <button onclick="showtext()">Say Hello</button>
    <h2 id="text">GeeksForGeeks</h2>
    <!-- Script tag is used to write Script  -->
    <script>
        // JavaScript code starts here
        // This Function is called when you click on "Say Hello" button.
        const showtext = () => {
            // Get the element with the id 'text'
            let text = document.getElementById('text')
            
            // Change the text content of the 'text' element
            text.innerText = "Hello"
            // Set a timeout to display an alert after 2 seconds
            setTimeout(() => {
                alert("Text has been changed")
            }, 2000)
        } 
    </script>
</body>
  
</html>
Output
Conclusion
Scripting plays an vital role to guiding browser on how to respond to events. And JavaScript is the popular and broadly used language for scripting. By using scripting you can dynamically change content by using DOM, event handling and AJAX.
