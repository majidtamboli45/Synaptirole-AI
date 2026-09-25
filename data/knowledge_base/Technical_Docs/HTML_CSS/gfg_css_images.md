# CSS Images

> Source: https://www.geeksforgeeks.org/css/css-styling-images

CSS styling for images enhances their appearance and ensures they adapt well across different devices. It allows customization of size, shape, and visual effects for better presentation.
- Use properties like width, height, and object-fit to control image size and responsiveness.
- Apply styles such as border, border-radius, and box-shadow for visual effects.
- Helps images look attractive and maintain proper layout on all screen sizes.
Thumbnail Images
The border property helps create thumbnail images by adding a border around the image, giving it a clean, defined look.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        img {
            border: 1px solid black;
            border-radius: 5px;
            padding: 5px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <img src="https://media.geeksforgeeks.org/wp-content/uploads/geeksforgeeks-25.png" 
    alt="thumbnail-image"
        style="width:290px">
</body>
</html>
<!--Driver Code Ends-->
- The border property defines the size and color of the image's border.
- Width and height properties set the dimensions of the thumbnail image.
Border-radius Property
The border-radius property rounds the corners of the image, creating a circular or oval shape, based on the values provided.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        img {
            border-radius: 50%;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/forkandgeeksclassesV-min.png" 
         alt="rounded-image"
        width="150" height="150">
</body>
</html>
<!--Driver Code Ends-->
- border-radius: 50% creates a circular image when applied to a square image.
- Width and height define the size of the image.
Responsive Images
Responsive images automatically adjust to fit the container size, ensuring they look good on different screen sizes.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        img {
            max-width: 100%;
            height: auto;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/geeksforgeeks-25.png" 
         alt="Responsive-image"
         width="400" 
         height="200">
</body>
</html>
<!--Driver Code Ends-->
- width: 100% makes the image adjust to the container's width.
- height: auto ensures the image maintains its aspect ratio.
Transparent Image
The opacity property is used to make an image transparent. The value ranges from 0 (fully transparent) to 1 (fully opaque).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        img {
            opacity: 0.5;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <img src="https://media.geeksforgeeks.org/wp-content/uploads/geeksforgeeks-25.png" 
         alt="Transparent-image" width="40%">
</body>
</html>
<!--Driver Code Ends-->
- opacity: 0.5 makes the image semi-transparent.
- The image will appear with reduced opacity, allowing the background to be seen through it
Center an Image
To center an image within a container, you can use margin and display properties.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    img {
        display: block;
        margin-left: auto;
        margin-right: auto;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body> 
 <img src= "https://media.geeksforgeeks.org/wp-content/uploads/geeksforgeeks-25.png" 
      alt="centered-image" 
      style="width:40%"> 
</body>
</html>
<!--Driver Code Ends-->
- display: block makes the image behave like a block element.
- margin-left: auto and margin-right: auto center the image horizontally.
