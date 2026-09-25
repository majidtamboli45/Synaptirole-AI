# How to select DOM Elements in JavaScript ?

> Source: https://www.geeksforgeeks.org/javascript/how-to-select-dom-elements-in-javascript/

Selecting DOM (Document Object Model) elements is a fundamental aspect of web development with JavaScript. It allows developers to interact with and manipulate elements on a webpage dynamically. Proper selection of elements is crucial for tasks such as updating content, adding event listeners, or modifying styles.
Below are the approaches to select DOM elements in JavaScript:
Table of Content
Using getElementById
This method selects a single element by its unique ID attribute.
Syntax:
document.getElementById('id')
Example:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, 
                   initial-scale=1.0">
    <title>getElementById Example</title>
</head>
<body>
    <h1 id="gfg">GeeksForGeeks</h1>
    <script>
        // styling the h1 tag
        const element = document.getElementById('gfg');
        element.style.color = "green";
        element.style.textAlign = "center";
        element.style.margin = "30px";
        element.style.fontSize = "30px";
    </script>
</body>
</html>
Output:
Using getElementsByClassName
This method selects elements based on their class attribute. It returns a collection of elements with the specified class name.
Syntax:
 document.getElementsByClassName('class')
Example:
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>getElementsByClassName Example</title>
</head>
  
<body>
    <h1 class="selector">GeeksForGeeks</h1>
    <h2 class="selector">DOM selector in JavaScript</h2>
    <script>
        const elements = 
        documSizeent.getElementsByClassName('selector');
        elements[0].style.color = "green";
        elements[1].style.color = "red";
        elements[0].style.textAlign = "center";
        elements[1].style.textAlign = "center";
        elements[0].style.marginTop = "60px";
    </script>
</body>
  
</html>
Output:
Using getElementsByTagName
This method selects elements based on their tag name. It returns a collection of elements with the specified tag name.
Syntax:
document.getElementsByTagName('tag')
Example:
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>getElementsByTagName Example</title>
</head>
  
<body>
    <p>Thanks for visiting GFG</p>
    <p>This is showing how to select DOM element using tag name</p>
    <script>
        const paragraphs = document.getElementsByTagName('p');
        paragraphs[0].style.color = "green";
        paragraphs[1].style.color = "blue";
        paragraphs[0].style.fontSize = "25px";
        paragraphs[0].style.textAlign = "center";
        paragraphs[1].style.textAlign = "center";
        paragraphs[0].style.marginTop = "60px";
    </script>
</body>
  
</html>
Output:
Using querySelector
This method selects the first element that matches a specified CSS selector. It returns only one element.
Syntax:
document.querySelector('selector')
Example:
<!DOCTYPE html>
<html lang="en">
  
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width,
                   initial-scale=1.0">
    <title>querySelector Example</title>
</head>
  
<body>
    <div class="gfg">GeeksForGeeks</div>
    <script>
        const element = 
        document.querySelector('.gfg');
        element.style.color = "green";
        element.style.textAlign = "center";
        element.style.margin = "30px";
        element.style.fontSize = "30px";
    </script>
</body>
  
</html>
Output:
Using querySelectorAll
Similar to querySelector, but it returns a NodeList containing all elements that match the specified CSS selector.
Syntax:
document.querySelectorAll('selector')
Example:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>querySelectorAll Example</title>
</head>
<body>
    <h1 class="selector">GeeksForGeeks</h1>
    <p class="selector">
        This is showing how to select DOM element
        using tag name
    </p>
    <script>
        const elements = document.querySelectorAll('.selector');
        elements[0].style.color = "green";
        elements[1].style.color = "red";
        elements[0].style.textAlign = "center";
        elements[1].style.textAlign = "center";
        elements[0].style.marginTop = "60px";
    </script>
</body>
</html>
Output:
