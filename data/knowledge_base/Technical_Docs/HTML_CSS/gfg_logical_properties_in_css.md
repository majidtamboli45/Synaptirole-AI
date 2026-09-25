# Logical Properties in CSS

> Source: https://www.geeksforgeeks.org/css/logical-properties-in-css

CSS logical properties use the terms block and inline to define the direction of the writing flow.
- Block Properties: Control vertical flow (e.g., top/bottom margins, padding) in horizontal writing modes.
- Inline Properties: Control horizontal flow (e.g., left/right margins, padding) in horizontal writing modes.
Syntax:
.element {
    margin-block: 10px;  /* Top and bottom margins */
    padding-inline: 20px; /* Left and right padding */
}
- margin-block: Sets the top and bottom margins.
- padding-inline: Sets the left and right padding.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            margin-block: 10px;
            padding-inline: 15px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box">This is a box with logical properties.</div>
</body>
</html>
<!--Driver Code Ends-->
- margin-block: Sets top and bottom margins.
- padding-inline: Sets left and right padding.
Mapping Logical Properties to Physical Equivalents
Here is a list of CSS logical properties and their physical equivalents:
- inline-size: inline-size defines the width of an element.
- max-inline-size: max-inline-size sets the maximum width limit.
- min-inline-size: min-inline-size sets the minimum width limit.
- block-size: block-size defines the height of an element.
- max-block-size: max-block-size sets the maximum height limit.
- min-block-size: min-block-size sets the minimum height limit.
- border-block-start: border-block-start applies border to the top side.
- border-block-end: border-block-end applies border to the bottom side.
- border-inline-start: border-inline-end applies border to the left side.
- border-inline-end: border-inline-start applies border to the right side.
- margin-block-start: margin-block-start sets margin at the top.
- margin-block-end: margin-block-end sets margin at the bottom.
- margin-inline-start: margin-inline-start sets margin on the left.
- margin-inline-end: margin-inline-end sets margin on the right.
- inset-block-start: inset-block-start positions element from the top.
- inset-block-end: inset-block-end positions element from the bottom.
- inset-inline-start: inset-inline-start positions element from the left.
- inset-inline-end: inset-inline-end positions element from the right.
Examples of CSS Logical Properties
CSS Logical Properties let you add borders, margins, and padding in a way that adapts to writing modes (LTR, RTL, vertical text), making layouts flexible and international-friendly.
Adding Borders Using Logical Properties
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .border-example {
            border-block-start: 2px solid blue;
            border-inline-end: 2px solid orange;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="border-example">
        Logical Properties: Flexible Borders for Different Writing Modes
    </div>
</body>
</html>
<!--Driver Code Ends-->
- border-block-start: Adds a blue border to the block's start side.
- border-inline-end: Adds an orange border to the inline's end side.
Logical Values with Advanced Styles
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .logical-styled-box {
            margin-block: 20px;
            padding-inline: 15px;
            border-block: 3px dashed red;
            border-inline: 2px solid blue;
            text-align: start;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="logical-styled-box">
        Advanced Logical Styles: Responsive Borders, Padding, and Alignment
    </div>
</body>
</html>
<!--Driver Code Ends-->
- margin-block: Adds vertical spacing (top and bottom margins).
- padding-inline: Adds horizontal padding (left and right).
- border-block: Adds dashed red borders at block-start and block-end.
- border-inline: Adds solid blue borders at inline-start and inline-end.
Best Practices
Use logical properties to create flexible, writing-mode independent and responsive layouts.
- Use logical properties to make layouts adapt to different writing modes, enhancing responsiveness.
- Replace directional properties (e.g., top, left) with logical ones for better flexibility.
- Always test your layout in various writing modes to ensure consistency across languages.
- Combine logical properties with media queries for optimized designs on diverse devices.
