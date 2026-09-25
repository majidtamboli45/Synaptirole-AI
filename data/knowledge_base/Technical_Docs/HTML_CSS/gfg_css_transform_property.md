# CSS transform Property

> Source: https://www.geeksforgeeks.org/css/css-transform-property

The CSS transform property is used to modify the appearance of an element by rotating, scaling, skewing, or translating it without affecting the document layout.
- Allows transformations like rotate(), scale(), skew(), and translate().
- Transforms are applied in 2D or 3D space.
- Does not affect the surrounding elements or page flow.
- Commonly used for animations, hover effects, and visual enhancements.
This example describes Matrix() property value.
<html>
<head>
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: matrix(1, 0, -1, 1, 1, 0);
    }
    </style>
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
Syntax:
transform: none|transform-functions|initial|inherit;
Note: The transformations can be of 2-D or 3-D type.
Try It:
Currently Active Property:
transform: rotate(45deg); Values:
- none: No transformation takes place.
- matrix(x, x, x, x, x, x): It specifies a matrix transformation of 2-D type. It takes 6 values.
- matrix3d(x, x, x, x, x, x, x, x, x): It specifies a matrix transformation of 3-D type. It takes 9 values.
- translate(x, y): It specifies a translation across the X and Y axes.
- translate3d(x, y, z): It specifies a translation across the X, Y, and Z axes.
- translateX(x): It specifies the translation across the X-axis only.
- translateY(y): It specifies the translation across the Y-axis only.
- translateZ(z): It specifies the translation across the Z-axis only.
- rotate(angle): It specifies the angle of rotation.
- rotateX(angle): It specifies the rotation along with the X-axis corresponding to the angle of rotation.
- rotateY(angle): It specifies the rotation along with the Y-axis corresponding to the angle of rotation.
- rotateZ(angle): It specifies the rotation along with the Z-axis corresponding to the angle of rotation.
- scale(x, y): It specifies the scale transformation along the X and Y axes.
- scaleX(x): It specifies the scale transformation along the X-axis.
- scaleY(y): It specifies the scale transformation along the Y-axis.
- scaleZ(z): It specifies the scale transformation along the Z-axis.
- scale3d(x, y, z): It specifies the scale transformation along the X, Y, and Z axes.
- skew(angle, angle): It specifies the skew transformation along the X and Y axes corresponding to the skew angles.
- skewX(angle): It specifies the skew transformation along with the X-axis corresponding to the skew angle.
- skewY(angle): It specifies the skew transformation along with the Y-axis corresponding to the skew angle.
- skewZ(angle): It specifies the skew transformation along with the Z-axis corresponding to the skew angle.
- perspective(x): It specifies the perspective of an element. Refer: Perspective property
- initial: It initializes the element to its default value.
- inherit: It inherits the value from its parent element.
Example 1: Without the transform property.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 2: Matrix3d() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
        transform-style: preserve-3d;
    }
    
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform-style: preserve-3d;
        position: absolute;
        transform: translate(150px, 75%, 5em)
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 3: translate() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: translate(150px, 65%);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 4: translate3d() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: translate(150px, 65%, 5em);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 5: translateX() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: translateX(150px);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 6: This example describes translateY() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: translateY(150px);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 7: translateZ() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: translateZ(150px);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 8: rotate() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: rotate(45deg);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 9: rotateX() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: rotateX(75deg);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 10: rotateY() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: rotateY(75deg);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 11: rotateZ() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: rotateZ(75deg);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 12: scale() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: scale(1, 2);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 13: scale3d() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: scale3d(2, 1, 5);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 14: scaleX() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: scaleX(2);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 15: scaleY() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: scaleY(2);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 16: scaleZ() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: scaleZ(2);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 17: skew() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: skew(30deg, 30deg);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 18: skewX() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: skewX(30deg);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 19: skewY() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: skewY(30deg);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 20: perspective() property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: perspective(30px);
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 21: Initial property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: initial;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Example 22: Inherit property value.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
    .main {
        display: grid;
        padding: 30px;
        background-color: green;
        transform: rotateX(45deg);
    }
    .GFG {
        text-align: center;
        font-size: 35px;
        background-color: white;
        color: green;
        transform: inherit;
    }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="main">
        <div class="GFG">GeeksforGeeks</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Note: Sometimes the 3-D values don't give the correct output when they are used on 2-D elements, Hence it is not recommended to use 3-D values for 2-D elements.
Supported Browsers:
The browser supported by transform property are listed below:
1. For 2-D Transforms:
- Chrome 36.0, 4.0 -webkit-
- Edge 10.0, 9.0 -ms-
- Firefox 16.0, 3.5 -moz-
- Safari 9.0, 3.2 -webkit-
- Opera 23.0, 15.0 -webkit-, 10.5 -o-
2. For 3-D Transforms:
- Chrome 36.0, 12.0 -webkit-
- Edge 12.0
- Firefox 10.0
- Safari 9.0, 4.0 -webkit-
- Opera 23.0, 15.0 -webkit-
