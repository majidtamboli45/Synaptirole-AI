# CSS z-index Property

> Source: https://www.geeksforgeeks.org/css/css-z-index-property

CSS z-index is used to control the stacking order of overlapping elements, which decides whether an element appears on top or behind others based on their assigned value.
- It works only on positioned elements (relative, absolute, or fixed).
- Default stacking order applies if no z-index is defined.
- The z-index property can take various values, which we’ll cover below.
Property values
These are the values of the z-index property and their descriptions:
| Value | Description | 
|---|---|
| auto | The stack order is equal to that of the parent (default). | 
| number | The stack order depends on the number. | 
| initial | Sets the property to its default value. | 
| inherit | Inherits the property from the parent element. | 
1. Using z-index with auto
The auto value applies the default stacking order without explicitly defining the stacking context.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div {
            position: relative;
            width: 100px;
            height: 100px;
        }
        .box1 {
            background-color: red;
            z-index: auto;
            top: 50px;
            left: 50px;
            position: absolute;
        }
        .box2 {
            background-color: blue;
            top: 70px;
            left: 70px;
            position: absolute;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box1"></div>
    <div class="box2"></div>
</body>
</html>
<!--Driver Code Ends-->
- The red box (.box1) and blue box (.box2) overlap.
- Since both boxes have their z-index set to auto, the default stacking order applies, and the blue box is rendered on top because it comes later in the DOM.
2. Using z-index with Numbers
Specifying numerical values controls the stacking order. Higher values stack above lower ones.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div {
            position: absolute;
            width: 100px;
            height: 100px;
        }
        .box1 {
            background-color: red;
            z-index: 1;
            top: 50px;
            left: 50px;
        }
        .box2 {
            background-color: blue;
            z-index: 2;
            top: 70px;
            left: 70px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box1"></div>
    <div class="box2"></div>
</body>
</html>
<!--Driver Code Ends-->
The blue box (z-index: 2) appears above the red box (z-index: 1).
3. Using z-index with initial
The initial value resets the z-index to its default value of auto.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div {
            position: absolute;
            width: 100px;
            height: 100px;
        }
        .box1 {
            background-color: red;
            z-index: initial;
            top: 50px;
            left: 50px;
        }
        .box2 {
            background-color: blue;
            z-index: 1;
            top: 70px;
            left: 70px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box1"></div>
    <div class="box2"></div>
</body>
</html>
<!--Driver Code Ends-->
The red box follows the default stacking order since z-index: initial resets to auto.
4. Using z-index with inherit
The inherit value ensures the element inherits its z-index value from its parent.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .parent {
            position: relative;
            z-index: 5;
        }
        .child {
            position: absolute;
            width: 100px;
            height: 100px;
            background-color: yellow;
            z-index: inherit;
            top: 50px;
            left: 50px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="parent">
        <div class="child"></div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
The child element inherits the z-index value (5) from its parent.
5. Combining z-index with Multiple Contexts
When working with multiple stacking contexts, the z-index applies only within its context.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .parent {
            position: relative;
            z-index: 1;
            background-color: lightgray;
            width: 200px;
            height: 200px;
        }
        .child1 {
            position: absolute;
            z-index: 2;
            background-color: red;
            width: 100px;
            height: 100px;
        }
        .child2 {
            position: absolute;
            z-index: 1;
            background-color: blue;
            width: 100px;
            height: 100px;
            top: 50px;
            left: 50px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="parent">
        <div class="child1"></div>
        <div class="child2"></div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
The red box stacks above the blue box within the same stacking context defined by the parent element.
