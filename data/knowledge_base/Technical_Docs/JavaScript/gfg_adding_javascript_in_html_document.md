# Adding JavaScript in HTML Document

> Source: https://www.geeksforgeeks.org/javascript/where-to-put-javascript-in-an-html-document/

JavaScript can be included in an HTML document to make web pages interactive and dynamic. It allows you to handle user actions, update content without reloading the page, and control browser behavior.
- JavaScript can be added using the <script> tag either inside the HTML file or as an external file.
- It is commonly placed in the <head> or just before the closing </body> tag for better performance.
- External JavaScript files help keep code organized and reusable across multiple pages.
Inline JavaScript
You can write JavaScript code directly inside the HTML element using the onclick, onmouseover, or other event handler attributes.
<!--Driver Code Starts-->
<html>
<head></head>
<body>
    <h2>
        Adding JavaScript in HTML Document
    </h2>
<!--Driver Code Ends-->
    <button onclick="alert('Button Clicked!')">
        Click Here
    </button>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Internal JavaScript (Within <script> Tag)
You can write JavaScript code inside the <script> tag within the HTML file. This is known as internal JavaScript and is commonly placed inside the <head> or <body> section of the HTML document.
1. JavaScript Code Inside <head> Tag
Placing JavaScript within the <head> section of an HTML document ensures that the script is loaded and executed as the page loads. This is useful for scripts that need to be initialized before the page content is rendered.
<!--Driver Code Starts-->
<html>
<!--Driver Code Ends-->
<head>
    <script>
        function myFun() {
            document.getElementById("demo")
                .innerHTML = "Content changed!";
        }
    </script>
</head>
<!--Driver Code Starts-->
<body>
    <h2>
        Add JavaScript Code
        inside Head Section
    </h2>
    <h3 id="demo" style="color:green;">
        GeeksforGeeks
    </h3>
    <button type="button" onclick="myFun()">
        Click Here
    </button>
</body>
</html>
<!--Driver Code Ends-->
2. JavaScript Code Inside <body> Tag
JavaScript can also be placed inside the <body> section of an HTML page. Typically, scripts placed at the end of the <body> load after the content, which can be useful if your script depends on the DOM being fully loaded.
<!--Driver Code Starts-->
<html>
<head></head>
<!--Driver Code Ends-->
<body>
    <h2>
        Add JavaScript Code
        inside Body Section
    </h2>
    <h3 id="demo" style="color:green;">
        GeeksforGeeks
    </h3>
    <button type="button" onclick="myFun()">
        Click Here
    </button>
    <script>
        function myFun() {
            document.getElementById("demo")
                .innerHTML = "Content changed!";
        }
    </script>
</body>
<!--Driver Code Starts-->
</html>
<!--Driver Code Ends-->
External JavaScript (Using External File)
For larger projects or when reusing scripts across multiple HTML files, you can place your JavaScript code in an external .js file. This file is then linked to your HTML document using the src attribute within a <script> tag.
<!--Driver Code Starts-->
<html>
<!--Driver Code Ends-->
<head>
    <script src="script.js"></script>
</head>
<!--Driver Code Starts-->
<body>
    <h2>
        External JavaScript
    </h2>
    <h3 id="demo" style="color:green;">
        GeeksforGeeks
    </h3>
    <button type="button" onclick="myFun()">
        Click Here
    </button>
</body>
</html>
<!--Driver Code Ends-->
/* Filename: script.js*/
function myFun () {
    document.getElementById('demo')
        .innerHTML = 'Content Changed'
}
Output:
Advantages of External JavaScript
- Faster Page Load Times: Cached external JavaScript files don’t need to be reloaded every time the page is visited, which can speed up loading times.
- Improved Readability and Maintenance: Keeping HTML and JavaScript separate makes both easier to read and maintain.
- Separation of Concerns: By separating HTML (structure) and JavaScript (behavior), your code becomes cleaner and more modular.
- Code Reusability: One external JavaScript file can be linked to multiple HTML files, reducing redundancy and making updates easier.
Reference External JavaScript Files
We can reference an external script in three ways in javascript:
- By using a full URL:
src = "https://www.geeksforgeek.org/js/script.js"
- By using a file path:
src = "/js/script.js"
- Without using any path:
src = "script.js"
