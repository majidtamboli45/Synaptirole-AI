# CSS Links

> Source: https://www.geeksforgeeks.org/css/css-links

CSS Links are used to style hyperlinks and control how they appear in different states such as normal, visited, hover, and active. They help improve the look and user experience of web navigation by customizing link colors, effects, and behaviors.
Four states of links:
- a:link: This is a normal, unvisited link.
- a:visited: This is a link visited by user at least once
- a:hover : This is a link when mouse hovers over it
- a:active: This is a link that is just clicked.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>CSS links</title>
<!--Driver Code Ends-->
    <style>
        p {
            font-size: 25px;
            text-align: center;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        <a href="https://www.geeksforgeeks.org/">
            GeeksforGeeks Simple Link
        </a>
    </p>
</body>
</html>
<!--Driver Code Ends-->
- The <a> (anchor) tag is used to create a hyperlink that redirects the user to the GeeksforGeeks website when the text is clicked.
- The CSS applied to the <p> tag increases the font size to 25px and centers the link text, improving readability and presentation on the page.
Syntax: a:link {color:color_name;}
Properties of CSS Links
Some basic CSS properties of links are given below:
1. Color
This CSS property is used to change the color of the link text.
Syntax:
a {
color: color_name;
}
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>Link color property</title>
<!--Driver Code Ends-->
    <style>
        p {
            font-size: 20px;
            text-align: center;
        }
        /*unvisited link will appear green*/
        a:link {
            color: red;
        }
        /*visited link will appear blue*/
        a:visited {
            color: blue;
        }
        /*when mouse hovers over link it will appear orange*/
        a:hover {
            color: orange;
        }
        /*when the link is clicked, it will appear black*/
        a:active {
            color: black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        <a href="https://www.geeksforgeeks.org/">
            GeeksforGeeks
        </a>
        This link will change colours with different states.
    </p>
</body>
</html>
<!--Driver Code Ends-->
- The CSS pseudo-classes (a:link, a:visited, a:hover, a:active) control the link’s color in different states such as unvisited, visited, hovered, and active (clicked).
- This example demonstrates how a single link dynamically changes color based on user interaction, improving visual feedback and user experience.
2. Font-family
This property is used to change the font type of a link using font-family property.
Syntax:
a {
font-family: "family name";
}
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
<!--Driver Code Ends-->
    <style>
        /*Initial link font family arial*/
        a {
            font-family: Arial;
        }
        p {
            font-size: 30px;
            text-align: center;
        }
        /*unvisited link font family*/
        a:link {
            color: Arial;
        }
        /*visited link font family*/
        a:visited {
            font-family: Arial;
        }
        /*when mouse hovers over it will change to times new roman*/
        a:hover {
            font-family: Times new roman;
        }
        /*when the link is clicked, it will changed to Comic sans ms*/
        a:active {
            font-family: Comic Sans MS;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        <a href="https://www.geeksforgeeks.org/" id="link">
            GeeksforGeeks
        </a>
        a Computer Science Portal for Geeks.
    </p>
</body>
</html>
<!--Driver Code Ends-->
- The CSS link pseudo-classes (a:link, a:visited, a:hover, a:active) are used to change the font family of the hyperlink based on different user interaction states.
- This example shows how a link’s appearance dynamically updates—from Arial by default to Times New Roman on hover and Comic Sans MS when clicked—enhancing interactivity and visual feedback.
3. Text-Decoration
This property is basically used to remove/add underlines from/to a link.
Syntax:
a {
text-decoration: none;
}
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>Text decoration in link</title>
<!--Driver Code Ends-->
    <style>
        /*Set the font size for better visibility*/
        p {
            font-size: 2rem;
        }
        /*Removing underline using text-decoration*/
        a {
            text-decoration: none;
        }
        /*underline can be added using
        text-decoration:underline;
        */
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        <a href="https://www.geeksforgeeks.org/" id="link">
            GeeksforGeeks
        </a>
        a Computer Science Portal for Geeks.
    </p>
</body>
</html>
<!--Driver Code Ends-->
- The text-decoration: none; property is used to remove the default underline from the hyperlink, giving it a cleaner and more customized appearance.
- The example highlights how text-decoration can be used to control link styling, such as adding or removing underlines to match the design requirements.
4. background-color
This property is used to set the background color of the link.
Syntax:
a {
background-color: color_name;
}
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>background color</title>
<!--Driver Code Ends-->
    <style>
        /*Setting font size for better visibility*/
        p {
            font-size: 2rem;
        }
        /*Designing unvisited link button*/
        a:link {
            background-color: powderblue;
            color: green;
            padding: 5px 5px;
            text-decoration: none;
            display: inline-block;
        }
        /*Designing link button when mouse cursor hovers over it*/
        a:hover {
            background-color: green;
            color: white;
            padding: 5px 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        <a href="https://www.geeksforgeeks.org/" id="link">
            GeeksforGeeks
        </a>
        a Computer Science Portal for Geeks.
    </p>
</body>
</html>
<!--Driver Code Ends-->
- The background-color property is used to style the hyperlink as a button, giving it a powder blue background for the unvisited state and green on hover for visual interaction feedback.
- Additional styling like color, padding, text-decoration: none, and display: inline-block makes the link look like a clickable button rather than a standard text link, improving usability and aesthetics.
CSS Link Button
CSS links can also be styled using buttons/boxes. The following example shows how CSS links can be designed as buttons.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>Link button</title>
<!--Driver Code Ends-->
    <style>
        /*Setting font size for better visibility*/
        p {
            font-size: 2rem;
        }
        a {
            background-color: green;
            color: white;
            padding: 5px 5px;
            border-radius: 5px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        <a href="https://www.geeksforgeeks.org/" id="link">
            GeeksforGeeks
        </a>
        a Computer Science Portal for Geeks.
    </p>
</body>
</html>
<!--Driver Code Ends-->
- The link is styled as a button using CSS properties like background-color, color, padding, border-radius, and display: inline-block to make it visually distinct and user-friendly.
- text-decoration: none removes the default underline, while text-align: center ensures the text is centered within the button, enhancing readability and aesthetics.
