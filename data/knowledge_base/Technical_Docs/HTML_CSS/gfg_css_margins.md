# CSS Margins

> Source: https://www.geeksforgeeks.org/css/css-margins-padding

CSS margins are used to create space outside an element’s border, helping to separate it from other elements on a webpage. They help in organizing the layout and preventing content from appearing too close together.
- Control the outer spacing around elements.
- Can be set for all sides or individually (top, right, bottom, left).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            margin: 20px ;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box">
        This box has a margin of 20px vertically.
    </div>
</body>
</html>
<!--Driver Code Ends-->
- margin: 20px; applies a 20px margin to all four sides of the element.
Syntax:
body {  margin: value;}
Types of Margin Values
- Pixels (px): The most common unit, specifies a fixed number of pixels.
- Percentage (%): The margin is calculated as a percentage of the containing. element's width (for horizontal margins) or height (for vertical margins).
- Other units: Less common units like em, rem, vh, and vw can also be used for relative sizing.
- Auto: The browser calculates a suitable margin size, often used for centering elements.
Note: We can also use negative values for margins.
Margin Properties Values
CSS margin properties (margin-top, margin-right, margin-bottom, margin-left, and margin) control the space outside an element, with margin serving as a shorthand for all sides.
| Margin Property | Description | Example | 
|---|---|---|
| margin-top | Sets the top margin of an element. | margin-top: 20px ; | 
| margin-right | Sets the right margin of an element. | margin-right: 15px; | 
| margin-bottom | Specifies the margin at the bottom of an element. | margin-bottom: 30px; | 
| margin-left | Determines the width of the margin on the left side. | margin-left: 10px; | 
| margin | Shorthand to set margins on all four sides. | margin: 10px 20px; | 
Example of margin property with 4 values
If the margin property contains four values, then the first value sets the top margin, the second value sets the right margin, the third value sets the bottom margin, and the fourth value sets the left margin.
margin: 40px 100px 120px 80px;
- top margin = 40px
- right margin = 100px
- bottom margin = 120px
- left margin = 80px
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            margin: 40px 100px 120px 80px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p> Margin properties </p>
</body>
</html>
<!--Driver Code Ends-->
Example of margin property with 3 values
If the margin property contains three values, then the first value sets the top margin, the second value sets the right and left margin, and the third value sets the bottom margin.
margin: 40px 100px 120px;  - top = 40px
- right and left = 100px
- bottom = 120px
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            margin: 40px 100px 120px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        Margin properties
    </p>
</body>
</html>
<!--Driver Code Ends-->
Example of margin property with 2 values
If the margin property contains two values, then the first value applies to the top and bottom margin, and the second value applies to the right and left margin.
margin: 40px 100px; 
- top and bottom = 40px;
- left and right = 100px;
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            margin: 40px 100px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        Margin properties
    </p>
</body>
</html>
<!--Driver Code Ends-->
Example of margin property with 1 value
If the margin property has one value, then it applies padding to all sides of an element.
margin: 40px;
- top, right, bottom and left = 40px
Example of margin: auto property
margin: auto;
//Driver Code Starts
<html>
<head>
//Driver Code Ends
    <style>
        div {
            margin: auto;
            width: 50%;
            border: 1px solid black;
            text-align: center;
        }
    </style>
//Driver Code Starts
</head>
<body>
    <div> Centered using margin: auto; </div>
</body>
</html>
//Driver Code Ends
- margin: auto; : Automatically adjusts the left and right margins to center the element horizontally.
- The element must have a defined width for margin: auto; to work effectively.
Example of margin: inherit; Property
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .parent {
            margin: 20px;
        }
        .child {
            margin: inherit;
            border: 1px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="parent">
        Parent Element
        <div class="child"> Child inherits margin from parent. </div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- margin: inherit; : The child element inherits the margin value of its parent.
- The child element's margin is set to 20px, matching the parent's margin.
