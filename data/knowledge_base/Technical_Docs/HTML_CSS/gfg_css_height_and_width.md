# CSS Height and Width

> Source: https://www.geeksforgeeks.org/css/css-height-and-width

These properties define the size of an element, controlling the space it occupies on a webpage for consistent layout and design. They can use units like pixels, percentages, or viewport values for responsive designs.
- Height & Width control element size: Ensures proper spacing and layout on the page.
- Supports various units: Can use px, %, vh, or vw to make designs responsive.
Width and Height
The width and height properties in CSS are used to define the dimensions of an element. The values can be set in various units, such as pixels (px), centimeters (cm), percentages (%), etc.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>width and height</title>
<!--Driver Code Ends-->
    <style>
        .GFG {
               width: 40%;
               border: 3px solid black;
               font-size: 22px;
               font-weight: bold;
               color: green;
               text-align: center;
               padding: 20px;
               margin: 20px 0 0 10px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="GFG"> GeeksforGeeks </div>
</body>
</html>
<!--Driver Code Ends-->
- .GFG styling: Sets width, border, text color, size, alignment, padding, and margin for the div.
- HTML div: Displays “GeeksforGeeks” with the applied styles.
Height and Width of Image
To set the height and width of an image, the width and height properties are used. These values can be specified in pixels, percentages, or other units.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>Height and width of image</title>
<!--Driver Code Ends-->
    <style>
        .GFG {
            width: 100px;
            height: 50px;
            border: 2px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h3>Set the width and height of an Image</h3>
    <img class="GFG" src="https://media.geeksforgeeks.org/wp-content/uploads/20210224031038/Capture4-300x174.PNG">
</body>
</html>
<!--Driver Code Ends-->
- .GFG styling: Sets the image width to 100px, height to 50px, and adds a 2px black border.
- HTML image: Displays the image with the applied size and border styles.
Set max-width and min-width
These properties control the maximum and minimum width an element can have.
1. max-width:
The max-width property is used to set the maximum width of a box. Its effect can be seen by resizing the browser window.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>max-width of element</title>
<!--Driver Code Ends-->
    <style>
        .GFG {
            max-width: 500px;
            font-size:12px;
            border: 2px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="GFG">
        <h3>GeeksforGeeks</h3>
        <p>
              GeeksforGeeks is a computer science
            platform where you can learn programming.
            It is a Computer Science portal for geeks.
            It contains well written, well thought and
            well explained computer science
            and programming articles, quizzes etc.
        </p>
   </div>
</body>
</html>
<!--Driver Code Ends-->
2. min-width:
The min-width property is used to set the minimum width of a box. Its effect can be seen by resizing the browser window.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>min-width of element</title>
<!--Driver Code Ends-->
    <style>
        .GFG {
            min-width: 400px;
            font-size:13px;
            border: 2px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="GFG">
        <h3>GeeksforGeeks</h3>
        <p>
              GeeksforGeeks is a computer science platform
            where you can learn programming. It is a Computer
            Science portal for geeks. It contains well written,
            well thought and well explained computer science
            and programming articles, quizzes etc.
        </p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- .GFG styling: Limits the div’s width to a maximum of 500px, sets font size to 12px, and adds a 2px black border.
- HTML div content: Displays a heading and paragraph that will not exceed 500px in width.
Set max-height and min-height
These properties define the maximum and minimum height an element can take.
1. max-height
The max-height property is used to set the maximum height of a box. Its effect can be seen by resizing the browser window.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>max-height of element</title>
<!--Driver Code Ends-->
    <style>
        .GFG {
            max-height: 100px;
            border: 2px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="GFG">
        <h3>GeeksforGeeks</h3>
        <p>
              GeeksforGeeks is a computer science platform
            where you can learn programming. It is a Computer
            Science portal for geeks. It contains well written,
            well thought and well explained computer science
            and programming articles, quizzes etc.
        </p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- .GFG styling: Sets a maximum height of 100px and adds a 2px black border to the div.
- HTML div content: Displays a heading and paragraph, which will be restricted to the max height of 100px.
2. min-height
The min-height property is used to set the minimum height of a box. Its effect can be seen by resizing the browser window.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>min-height of element</title>
<!--Driver Code Ends-->
    <style>
        .GFG {
            min-height: 50px;
            border: 2px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="GFG">
        <h3>GeeksforGeeks</h3>
        <p>
              GeeksforGeeks is a computer science platform
            where you can learn programming. It is a Computer
            Science portal for geeks. It contains well written,
            well thought and well explained computer science
            and programming articles, quizzes etc.
        </p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- .GFG styling: Sets a minimum height of 50px and adds a 2px black border to the div.
- HTML div content: Ensures the div is at least 50px tall while displaying the heading and paragraph.
