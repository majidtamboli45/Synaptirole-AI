# HTML Canvas Complete Reference

> Source: https://www.geeksforgeeks.org/html/html-canvas-complete-reference

The HTML “canvas” element is used to draw graphics via JavaScript. The “canvas” element is only a container for graphics. One must use JavaScript to actually draw the graphics. Canvas has several methods for drawing paths, boxes, circles, text, and adding images.
Example: This example shows the basic use of Canvas in HTML.
<!DOCTYPE html>
<html>
<head>
    <title>
        HTML canvas beginPath() Property
    </title>
</head>
<body style="text-align:center;">
    
    <h1 style="color:green;">
        GeeksforGeeks
    </h1>
    
    <h2>HTML canvas beginPath() Property</h2>
    
    <canvas id="GFG" width="500" height="300"></canvas>
    
    <script>
        var GFG = document.getElementById("GFG");
        var context = GFG.getContext("2d");
        
        // Create a path
        context.beginPath();
        
        // Set the path width
        context.lineWidth = "8";
        
        // Set the path color
        context.strokeStyle = "green";
        
        context.moveTo(100, 250);
        context.lineTo(150, 50);
        context.lineTo(250, 250);
        
        context.stroke();
        
        context.beginPath();
    </script>
</body>
</html>                    
Output:
HTML Canvas Reference Complete Reference
Colors, Styles, and Shadows Properties and Methods
| Properties | Description | 
|---|---|
| fillStyle | Return the color, gradient, or pattern used to fill the drawing. | 
| strokeStyle | Return the stroke of color, gradient, or pattern used in the drawing. | 
| shadowColor | Set to a string representing a CSS color value, which we want as shadow color. | 
| shadowBlur | Return the blur level for shadows. | 
| ShadowOffsetX | Return the horizontal distance of the shadow from the shape. | 
| ShadowOffsetY | Return the vertical distance of the shadow from the shape. | 
| Methods | Description | 
|---|---|
| createLinearGradient() | Gradient can be used to fill different colors in rectangles, circles, lines, text, etc | 
| createPattern() | It is used to repeat the specified element in the specified direction. | 
| addColorStop() | It is used to specify the color and its position in the gradient object. | 
Line Styles Properties
| Properties | Description | 
|---|---|
| lineCap | Set or return the style of end caps of line. | 
| lineJoin | Return the type of corner created, when two lines meet, by using the lineJoin property. | 
| lineWidth | Return the width of the line (thickness of the line). | 
| miterLimit | It is used to or returns the maximum miter length. | 
Rectangles Methods
| Methods | Description | 
|---|---|
| rect() | Create a rectangle in HTML. | 
| fillRect() | It is used to fill the rectangle using the given color. | 
| strokeRect() | It is used to draw a rectangle in a given color. | 
| clearRect() | Clear the specified pixels within a given rectangle. | 
Paths Methods
| Methods | Description | 
|---|---|
| fill() | It is used to fill the current drawing path. | 
| stroke() | Draw the path you have defined with all those moveTo() and lineTo() methods. | 
| beginPath() | It is used to start a path or reset the current path. | 
| moveTo() | Move the path to the specified point in the canvas, without creating a line. | 
| closePath() | Create a path from the current point back to the starting point. | 
| lineTo() | It is used to add a new point to create a line from that point to the last specified point in the canvas | 
| clip() | It is used to clip a region/part of any shape and size from the given/original canvas. | 
| quadraticCurveTo() | Create a quadratic curve on the canvas | 
| bezierCurveTo() | Bezier curves on HTML canvas are drawn using a start point, one or more control point/points, and an endpoint. | 
| arc() | Create an arc/curve i.e. circles or parts of circles. | 
| arcTo() | Create an arc/curve between two tangents on the canvas. | 
| isPointInPath() | Check whether or not the specified point is contained in the current path. | 
Transformations Methods
| Methods | Description | 
|---|---|
| scale() | It is used to scale the current drawing into a smaller or larger size. | 
| rotate() | It is used to rotate the drawing by a given angle. | 
| translate() | Specify that the object is translated by the given translation amount. | 
| transform() | It is used to replace the current transformation matrix | 
| setTransform() | It is used to replace the current transformation matrix | 
Text Properties and Methods
| Properties | Description | 
|---|---|
| font | Change the present font family of the Text content of the <canvas> element. | 
| textAlign | Return the current alignment for text content, according to the anchor point. | 
| textBaseline | Return the baseline of the current text. | 
| Methods | Description | 
|---|---|
| fillText() | It is used to draw filled text on the canvas. | 
| strokeText() | Draw text (with no fill) on the canvas, by using strokeText() Method. | 
| measureText() | Return an object that represents the width of the specified text in terms of pixels. | 
Pixel Manipulation Properties and Methods
| Properties | Description | 
|---|---|
| width | It is used to specify the width of the <canvas> in terms of pixels. | 
| height | It is used to specify the height of the <canvas> element in terms of pixels. | 
| Methods | Description | 
|---|---|
| createImageData() | It is used to create a new blank ImageData object. | 
| getImageData() | It is used to copy the pixel data for the specified rectangle on a canvas. | 
| putImageData() | It is used to put the image data back into the canvas from a specified ImageData object. | 
Compositing & Image Drawing Properties and Methods
| Properties | Description | 
|---|---|
| globalAlpha | set or return the current alpha or transparency value of the drawing. | 
| Methods | Description | 
|---|---|
| drawImage() | It is used to display an image or video on canvas. |
