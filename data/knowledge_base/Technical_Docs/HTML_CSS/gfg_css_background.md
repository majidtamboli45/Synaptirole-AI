# CSS Background

> Source: https://www.geeksforgeeks.org/css/css-background

The CSS background defines the area behind an element’s content and can include colors, images, or both. It provides control over how these backgrounds appear and behave.
- Use properties like background-color, background-image, and background-size to style backgrounds.
- Control positioning and repetition using background-position and background-repeat.
- Helps enhance visual design and improve the overall look of web pages.
You can try different types of background here:
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            background: lightblue url(
            "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190417124305/250.png") 
            no-repeat center fixed;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body></body>
</html>
<!--Driver Code Ends-->
CSS Background Property
The CSS Background is a shorthand property for the following:
Background color Property
The background-color property in CSS sets the background color of an element. It can accept a color name (e.g., "red"), HEX value (e.g., "#ff0000"), or RGB value (e.g., "rgb(255, 0, 0)").
Syntax:
body {
background-color:color name
}
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1 {
            background-color: blue;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Geeksforgeeks</h1>
</body>
</html>
<!--Driver Code Ends-->
- background-color: Sets the background color of the h1 element to blue.
- The color can be specified using: Color name: (blue, green, etc.), HEX code: (#5570f0, #ff5733, etc.), RGB value: (rgb(255, 0, 0), rgb(0, 255, 0), etc.)
Background Image Property
The background-image property in CSS is used to set an image as the background of an element. By default, the image is repeated to cover the entire element unless specified otherwise.
Syntax:
body {
background-image : link;
}
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            background-image:
                url("https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190417124305/250.png");
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Geeksforgeeks</h1>
</body>
</html>
<!--Driver Code Ends-->
- background-image: Sets the background image of the body element.
- The image URL provided (https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190417124305/250.png) is used as the background.
- By default, the image repeats to cover the entire background of the body.
Background repeat Property
The background-repeat property in CSS specifies how the background image is repeated. By default, the image repeats both horizontally and vertically. You can control the repetition by specifying values such as repeat-x, repeat-y, or no-repeat.
Syntax:
body {
background-image:link;
background-repeat: repeat:x;
}
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            background-image:
                url(
            "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190417124305/250.png");
            background-repeat: repeat-x;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>"Hello world"</h1>
</body>
</html>
<!--Driver Code Ends-->
- background-image: The image (250.png) is used as the background of the body element.
- background-repeat: repeat-x: The background image will only repeat horizontally, along the x-axis.
- The image is repeated only across the horizontal direction while maintaining its position vertically.
Background-attachment Property
The background-attachment property in CSS specifies how the background image behaves when the user scrolls the page. By setting the value to fixed, the background image stays in place while the content of the page scrolls.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            background-image:
                url(
            "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190417124305/250.png");
            background-attachment: fixed;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Geeksforgeeks</h1>
</body>
</html>
<!--Driver Code Ends-->
- background-image: The image (250.png) is set as the background of the body element.
- background-attachment: fixed: The background image is fixed in place, meaning it will not scroll with the page's content.
- As you scroll, the background image remains static, providing a parallax effect.
Syntax:
body {
background-attachment: fixed;
}
Background-position Property
The background-position property in CSS is used to set the starting position of the background image within the element. You can use values like top, left, center, or specify exact pixel/percentage values to position the image.
Syntax:
body {
background-repeat:no repeat;
background-position:left top;
}
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            background-image:
                url(
            "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190417124305/250.png");
            background-repeat: no-repeat;
            background-position: center;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Geeksforgeeks</h1>
</body>
</html>
<!--Driver Code Ends-->
- background-image: The image (250.png) is set as the background of the body element.
- background-repeat: no-repeat: The image will not repeat horizontally or vertically.
- background-position: center: The background image is centered within the body element.
1. background-origin
The background-origin property sets the starting position of a background image relative to the element’s box.
Syntax:
body {
background-image: url('https://via.placeholder.com/300');
background-origin: padding-box;
}
- background-origin: padding-box;: Background image starts from inside the padding area, not from the border.
- The border area is not covered by the background image; only padding and content are included.
2. background-clip
The background-clip property defines how far the background (color or image) extends within an element.
Syntax:
body {
background-image: url('https://via.placeholder.com/300');
background-clip: content-box;
}
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div {
            width: 250px;
            height: 150px;
            padding: 20px;
            border: 10px solid black;
            background-color: orange;
            background-clip: content-box;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>Background Clip Example</div>
</body>
</html>
<!--Driver Code Ends-->
- background-clip: content-box;: Background shows only in the content area.
- Padding and border areas are not colored, only the text area.
