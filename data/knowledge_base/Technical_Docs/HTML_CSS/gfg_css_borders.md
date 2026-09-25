# CSS Borders

> Source: https://www.geeksforgeeks.org/css/css-borders

CSS borders define the outline around an HTML element, providing visual separation and emphasis within a webpage layout.
- Width is determined by the thickness of the border.
- Style is defined by the appearance of the border (solid, dashed, dotted, etc.).
- Color is specified by the chosen hue of the border.
- Borders can be applied to all sides or specific edges of an element.
You can try different types of borders here-
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .simple-border {
            border: 2px solid black;
            padding: 20px;
            text-align: center;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="simple-border">This div has a simple black border.</div>
</body>
</html>
<!--Driver Code Ends-->
- A <div> element is created with a black border that is 2px wide.
- The content inside the <div> has 20px of padding for spacing between the text and the border.
- The text inside the <div> is centered using text-align: center.
Syntax:
element {
border: 1px solid black;
}
CSS Border Properties
CSS provides several properties to control and customize borders:
- border-style: Type of border is determined by border-style, such as solid, dashed, or dotted.
- border-width: Width of the border is set using border-width, in pixels, points, or other units.
- border-color: Color of the border is specified using border-color.
- border-radius: Rounded corners are created using border-radius.
Ways to Style Border in CSS
The CSS border property enables the styling of an element's border by setting its width, style, and color, allowing for customizable visual boundaries in web design.
1. Border Style
- CSS border-top style Property
- border-right-style Property
- border-bottom-style Property
- border-left-style Property
2. Border Width
- border-top-width Property
- border-right-width Property
- border-bottom-width Property
- border-left-width Property
3. Border Color
- border-top-color Property
- border-right-color Property
- border-bottom-color Property
- border-left-color Property
4. Border individual sides
CSS allows you to style each side of a border individually, giving flexibility in design.
5. Border Radius Property
The border-radius property allows you to round the corners of an element, creating smoother edges.
Common Border Styles
The border-style property specifies the type of border. None of the other border properties will work without setting the border style.
| Border Style | Description | 
|---|---|
| Dotted | Creates a series of dots. | 
| Dashed | Forms a dashed line. | 
| Solid | Produces a continuous line. | 
| Double | Renders two parallel lines. | 
| Groove | Creates 3D grooved effect. | 
| Ridge | Creates 3D ridged effect. | 
| Inset | Adds 3D inset border. | 
| Outset | Adds 3D outset border. | 
| None | Removes the border. | 
| Hidden | Hides the border. | 
The following example demonstrates different common border styles using the border-style property in CSS.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p.dotted {
            border-style: dotted;
        }
        p.dashed {
            border-style: dashed;
        }
        p.solid {
            border-style: solid;
        }
        p.double {
            border-style: double;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p class="dotted">A dotted border.</p>
    <p class="dashed">A dashed border.</p>
    <p class="solid">A solid border.</p>
    <p class="double">A double border.</p>
</body>
</html>
<!--Driver Code Ends-->
- border-style is used to set the type of border around an element.
- dotted: Creates a border with dots.
- dashed: Creates a border with dashed lines.
- solid: Creates a solid, continuous border.
- double: Creates a border with two solid lines.
CSS Border Width
CSS border-width is used to define the thickness of the border around an element. It can be specified in various units like px, pt, cm, or by using predefined values like thin, medium, and thick.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            border-style: solid;
            border-width: 8px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>CSS Border Width</p>
</body>
</html>
<!--Driver Code Ends-->
- border-width property is used to set the thickness of the border.
- You can use numeric values (e.g., 1px, 5pt, 2cm) or keywords (thin, medium, thick) to set the border width.
- The border-style and border-color properties must be used in conjunction with border-width to see the effect.
CSS Border Color
CSS border-color is used to define the color of the border. You can set the color using color names, hexadecimal values, or RGB values. If no color is specified, the border will inherit the color of the element itself.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            border-style: solid;
            border-color: red
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>CSS Border color</p>
</body>
</html>
<!--Driver Code Ends-->
- border-color property is used to set the color of the element's border.
- the border color is set to red using the color name red. You can also use hex codes like #ff0000 or RGB values like rgb(255, 0, 0).
- The border-style property must be defined (e.g., solid, dashed, etc.) for the border color to be visible.
Border radius property
The CSS border-radius property in CSS is used to round the corners of an element's border, giving it a more visually pleasing and smoother appearance.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1 {
            border-style: solid;
            text-align: center;
            background: green;
            border-radius: 20px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Border Radius Property</h1>
</body>
</html>
<!--Driver Code Ends-->
- border-radius is used to apply rounded corners to the element. In this case, a value of 20px is applied to create a soft, rounded edge.
- The element has a solid border, a green background, and centered text, with the rounded corners enhancing its visual appeal.
- You can adjust the border-radius value to control the curvature of the corners, making them more or less rounded.
Practical Use Cases of CSS Borders
CSS borders are commonly used in the following scenarios:
- Styling Buttons : Borders enhance button designs, making them more visually appealing and clickable.
- Creating Dividers : Borders can act as separators between content sections, providing clear visual breaks.
- Customizing Images : Apply borders around images to frame them, making thumbnails stand out.
- Designing Navigation Menus : Borders can define the boundaries of navigation links or items.
