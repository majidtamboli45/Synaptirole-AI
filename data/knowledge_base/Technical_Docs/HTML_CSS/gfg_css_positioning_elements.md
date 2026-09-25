# CSS Positioning Elements

> Source: https://www.geeksforgeeks.org/css/css-positioning-elements

CSS positioning is used to control the placement of elements on a web page. It allows elements to be positioned relative to the normal document flow, the browser window, or other elements.
- The position property defines how an element is positioned.
- Common position values include static, relative, absolute, fixed, and sticky.
- Positioning works with properties like top, right, bottom, and left.
- It helps create flexible layouts, overlays, and responsive designs.
Given below the different types of Positioning:
1. Static Positioning
Static is the default position of an element. It does not accept properties like top, left, right, or bottom.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div {
            border: 1px solid black;
            padding: 10px;
            margin: 10px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>Box 1</div>
    <div>Box 2</div>
</body>
</html>
<!--Driver Code Ends-->
- The boxes follow the normal flow of the document.
- There’s no overlap or displacement of elements.1
2. Relative Positioning
Relative positioning places an element relative to its normal position. You can move it using top, left, right, or bottom.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<!--Driver Code Ends-->
<head>
  <meta charset="UTF-8">
  <title>Link CSS Example</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
    
  <div>Box 1</div>
  <div class="relative">Box 2</div>
  
</body>
</html>
 div {
            border: 1px solid black;
            padding: 10px;
            margin: 10px;
        }
.relative {
            position: relative;
            top: 20px;
            left: 30px;
        }
Box 2 is shifted 20px down and 30px to the right from its normal position.
3. Absolute Positioning
Absolute positioning removes the element from the document flow and places it relative to the nearest ancestor with a positioning context (relative, absolute, or fixed).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            position: relative;
            width: 300px;
            height: 200px;
            border: 2px solid black;
            margin: 20px auto;
        }
        .absolute {
            position: absolute;
            top: 50px;
            left: 50px;
            background-color: pink;
            padding: 10px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <p>Container with Relative Positioning</p>
        <div class="absolute">Absolutely Positioned Element</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- The pink box (.absolute) is positioned 50px down and 50px right within the .container.
- It does not affect other elements in the flow.
4. Fixed Positioning
Fixed positioning removes the element from the flow and positions it relative to the viewport. It remains in place even when the page scrolls.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .fixed {
            position: fixed;
            top: 10px;
            right: 10px;
            background-color: lightgreen;
            padding: 20px;
            border: 2px solid black;
        }
        .content {
            height: 1200px;
            padding: 10px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>Fixed Positioning Example</h2>
    <div class="fixed">Fixed Box</div>
    <div class="content">
        <p>Scroll down to see that the fixed box stays in place.</p>
        <p>This content simulates a long page.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
The fixed element stays at the top-right corner of the viewport even as the user scrolls.
5. Sticky Positioning
Sticky positioning switches between relative and fixed based on the scroll position.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .sticky {
            position: sticky;
            top: 0;
            background-color: yellow;
            padding: 10px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="sticky">I am sticky</div>
    <p>Scroll down to see the effect.</p>
    <div style="height: 1000px;"></div>
</body>
</html>
<!--Driver Code Ends-->
The sticky element stays at the top of the viewport as you scroll but only within its containing element.
