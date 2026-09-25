# Float and Clear

> Source: https://www.geeksforgeeks.org/css/css-layout-float-and-clear

CSS layout is used to control how elements are positioned and arranged on a webpage. The "float" and "clear" properties help in organizing content, ensuring proper alignment and preventing wrapping around elements.
Float Property
The CSS float property allows elements to be positioned to the left or right of their container, allowing inline content (like text) to wrap around it. It is commonly used to create layouts, such as columns, where the text or other elements wrap around floated items.
Syntax
.element {
float: left | right | none | inherit;
}
| Value | Description | 
|---|---|
| left | Floats the element to the left side of its container. | 
| right | Floats the element to the right side of its container. | 
| none | Removes the float and keeps the element in the normal flow. | 
| inherit | Inherits the float property from its parent element. | 
1. float: left
Floats the element to the left side of its container.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .left {
            float: left;
            width: 50px;
            height: 50px;
            background-color: lightblue;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="left">Left Float</div>
</body>
</html>
<!--Driver Code Ends-->
2. float: right
Floats the element to the right side of its container.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .right {
            float: right;
            width: 50px;
            height: 50px;
            background-color: lightgreen;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="right">Right Float</div>
</body>
</html>
<!--Driver Code Ends-->
3. float: none
Removes the float and keeps the element in the normal flow.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .none {
            float: none;
            width: 50px;
            height: 50px;
            background-color: lightcoral;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="none">No Float</div>
</body>
</html>
<!--Driver Code Ends-->
4. float: inherit
Inherits the float property from its parent element.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .parent {
            float: left;
        }
        .child {
            float: inherit;
            width: 50px;
            height: 50px;
            background-color: lightyellow;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="parent">
        Parent
        <div class="child">Inherit Float</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Clear Property
The CSS clear property controls the behavior of elements in relation to floated elements. It specifies whether an element should be placed next to or below floated elements.
Syntax
.element {
clear: left | right | both | none | inherit;
}
| Value | Description | 
|---|---|
| none | No effect on adjacent elements, allowing them to position freely. | 
| left | Forces the element below any left-floating elements. | 
| right | Forces the element below any right-floating elements. | 
| both | Forces the element below both left and right floating elements. | 
| inherit | Inherits the clear property from its parent element. | 
1. clear: left
Prevents the element from being adjacent to left-floated elements.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .float-left {
            float: left;
            width: 100px;
            height: 100px;
            background-color: lightblue;
        }
        .clear-left {
            clear: left;
            background-color: lightgreen;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="float-left">Floated Left</div>
    <div class="clear-left">Cleared Left</div>
</body>
</html>
<!--Driver Code Ends-->
2. clear: right
Prevents the element from being adjacent to right-floated elements.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .float-right {
            float: right;
            width: 100px;
            height: 100px;
            background-color: lightcoral;
        }
        .clear-right {
            clear: right;
            background-color: lightyellow;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="float-right">Floated Right</div>
    <div class="clear-right">Cleared Right</div>
</body>
</html>
<!--Driver Code Ends-->
3. clear: both
Prevents the element from being adjacent to both left and right-floated elements.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .float-left {
            float: left;
            width: 100px;
            height: 100px;
            background-color: lightblue;
        }
        .float-right {
            float: right;
            width: 100px;
            height: 100px;
            background-color: lightcoral;
        }
        .clear-both {
            clear: both;
            background-color: lightgray;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="float-left">Floated Left</div>
    <div class="float-right">Floated Right</div>
    <div class="clear-both">Cleared Both</div>
</body>
</html>
<!--Driver Code Ends-->
4. clear: none
Allows the element to be adjacent to floated elements (default behavior).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .float-left {
            float: left;
            width: 100px;
            height: 100px;
            background-color: lightblue;
        }
        .no-clear {
            clear: none;
            background-color: lightpink;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="float-left">Floated Left</div>
    <div class="no-clear">No Clear Applied</div>
</body>
</html>
<!--Driver Code Ends-->
Best Practices for CSS clear Property
- Use floats sparingly; prefer Flexbox or Grid for layouts.
- Always clear floats to prevent layout issues.
- Test designs across devices to ensure consistency.
