# CSS Functions Complete Reference

> Source: https://www.geeksforgeeks.org/css/css-functions-complete-reference

CSS functions are used to dynamically define or manipulate property values in stylesheets, making designs more flexible and responsive.
- Retrieve values like attributes with attr() or calculate sizes with calc().
- Adjust colors using functions like rgb() or hsl().
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: calc(50% - 10px);
            background: linear-gradient(to right, lightblue, lightgreen);
            height: 100px;
            border: 1px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The calc() function dynamically calculates the width of the box as 50% of the parent element minus 10px.
- The linear-gradient() function creates a smooth gradient background transitioning from light blue to light green.
The complete list of CSS Functions is given below:
| Functions | Description | 
|---|---|
| attr() | Returns the value of an attribute of the selected elements. | 
| blur() | Apply a blurred effect filter on the image. | 
| brightness() | Apply a filter to set the brightness of the image. | 
| calc() | Returns the value of an attribute of the selected elements. | 
| circle() | Create floating text around the circular shape picture or anything else | 
| conic-gradient() | Set a conic gradient as the background image. | 
| contrast() | Apply a filter to set the contrast of the image. | 
| cubic-bezier() | Define a Cubic Bezier curve. | 
| drop-shadow() | Apply a filter to the image to set the shadow of the image. | 
| ellipse() | Create floating text around the ellipse shape picture or anything else. | 
| env() | Insert the value of a user agent-defined environment variable into your CSS. | 
| grayscale() | Apply a filter to the image to set the grayscale of the image. | 
| hsl() | Define the colors using the Hue-saturation-lightness model (HSL). | 
| hsla() | Define the colors using the Hue Saturation Lightness Alpha (HSLA) model. | 
| hue-rotate() | Apply a filter to the image to set the hue rotation of the image. | 
| inset() | It is used with the filter property to change the inset of images. | 
| invert() | Set the invert of the color of the sample image. | 
| linear-gradient() | Set the linear gradient as the background image. | 
| matrix() | Create a homogeneous 2D transformation matrix. | 
| matrix3d() | Create a 3D transformation as a 4×4 homogeneous matrix. | 
| max() | Return the largest value from a set of comma-separated values. | 
| min() | Return minimum value from a set of comma-separated values. | 
| opacity() | Apply a filter to the image to set the transparency of the image. | 
| perspective() | It is used with the transform property to set the perspective effect on images. | 
| polygon() | It is used with the filter property to create a polygon of images or text. | 
| radial-gradient() | Set a radial gradient as the background image. | 
| repeating-conic-gradient() | Repeat conic gradients in the background image. | 
| repeating-linear-gradient() | It is used to repeat linear gradients. | 
| repeating-radial-gradient() | It is used to repeat radial gradients. | 
| rgb() | It is used to define the colors using the Red Green Blue (RGB) model. | 
| rgba() | It is used to define the colors using the Red-Green-Blue-Alpha (RGBA) model. | 
| rotate() | Rotate an element based on the given angle as an argument. | 
| rotate3d() | Set the style in web pages that contain HTML elements. | 
| rotateX() | Rotate an element around the x-axis. | 
| rotateY() | Rotate an element around the vertical axis. | 
| rotateZ() | Rotate an element around the z-axis. | 
| saturate() | It is used to super-saturate or desaturate the input image. | 
| scale() | It is used to resize the element in 2D plane. | 
| scale3d() | Resize the element in a 3D space. It scales the elements in x, y, and z planeR | 
| scaleX() | Resize an element along the x-axis in a 2D plane. | 
| scaleY() | Resize an element along the y-axis in a 2D plane. | 
| scaleZ() | Resize an element along the z-axis. | 
| sepia() | Apply a filter to the image to convert an image into a sepia image. | 
| skew() | It is used to transform an element in the 2D plane. | 
| skewX() | Transform an element in the horizontal direction in a 2D plane. | 
| skewY() | Transform an element in the vertical direction in a 2D plane. | 
| translate() | Reposition an element in a horizontal and vertical direction. | 
| translate3d() | Reposition an element in 3D space. | 
| translateX() | Reposition the element along the horizontal axis. | 
| translateY() | Reposition the element along the vertical axis. | 
| translateZ() | Reposition the element along the z-axis in 3D space. | 
| url() | It is used to include a file. | 
| var() | Insert a value for custom property. | 
Best Practices for Using CSS Functions
- Use Functions Appropriately: Apply CSS functions like calc(), var(), and rgb() to enhance flexibility and maintainability in your stylesheets.
- Maintain Readability: While functions add power, ensure your code remains readable by avoiding overly complex expressions.
- Test Across Browsers: Some CSS functions may have varying levels of support; always test your styles across different browsers to ensure compatibility.
