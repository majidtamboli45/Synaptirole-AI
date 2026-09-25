# CSS 3D Transforms

> Source: https://www.geeksforgeeks.org/css/css-3d-transforms

CSS 3D transforms are used to manipulate HTML elements in three dimensions by rotating them along the x-axis, y-axis, and z-axis. There are three main types of transformation which are listed below:
- rotateX(): Rotates an element around its X-axis.
- rotateY(): Causes rotation around the Y-axis.
- rotateZ(): Enables rotation along the Z-axis.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: green;
            transform: rotateX(30deg) rotateY(30deg) rotateZ(30deg);
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- rotateX(30deg): Rotates the box 30 degrees around the X-axis (horizontal axis).
- rotateY(30deg) and rotateZ(30deg): Rotate the box around the Y-axis (vertical axis) and Z-axis (depth axis), creating a 3D effect.
The rotateX() Method
The rotateX() method in CSS is used to rotate an HTML element around its X-axis, which is horizontal.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: orange;
            transform: rotateX(45deg);
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- rotateX(45deg): Rotates the element 45 degrees downward around the X-axis.
- This creates a 3D tilt effect, making the top edge move backward.
The rotateY() Method
The rotateY() method in CSS is used to rotate an HTML element around its vertical Y-axis. This method allows the element to flip side to side, creating a mirror-like rotation effect.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: green;
            transform: rotateY(45deg);
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- rotateY(45deg): Applies a 45-degree rotation around the Y-axis, causing the left side of the box to move towards the viewer and the right side to move away.
- This rotation provides a visual effect of the element spinning from left to right.
The rotateZ() Method
The rotateZ() method in CSS is used to rotate an HTML element around its Z-axis, which is perpendicular to the screen. This rotation affects the element as if it were spinning flat on the screen.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: red;
            transform: rotateZ(45deg);
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- rotateZ(45deg): Rotates the box 45 degrees around the Z-axis, creating a twist as if turning a dial.
- This rotation pivots the element around its center, altering its orientation on the plane of the screen.
Best Practices for Using CSS 3D Transforms
- Use a perspective property on the parent container to enhance the 3D effect of transformations.
- Combine transforms with transitions or animations to smoothly animate changes in 3D space.
- Test responsiveness across different browsers and devices to ensure consistent behavior and appearance.
