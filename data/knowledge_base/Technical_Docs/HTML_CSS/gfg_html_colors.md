# HTML Colors

> Source: https://www.geeksforgeeks.org/html/html-colors

HTML Colors can be applied to text, backgrounds, borders, links, forms, tables, etc. This article provides an in-depth look at how colors can be applied to various elements such as text, backgrounds, borders, links, forms, and tables in HTML. We will explore different color formats including hexadecimal, RGB, RGBA, HSL, and named colors, offering you precise control over the color presentation on your web pages.
HTML Colors Name
HTML color names offer a user-friendly way to specify colors. From classic colors like Red, Green, Blue, Pink, Purple, Sky Blue, Gray, and Orange, to more exotic shades, HTML provides a wide palette for web designers. Whether you’re designing a serene theme or a vibrant layout, HTML color names have got you covered.
Red
Green
Blue
Pink
Purple
Sky Blue
Gray
Orange
Checkout Color Wheel Tool on GFG: Color Wheel
HTML Color Usage
| Usage | Descriptions | Syntax | 
|---|---|---|
| Background Color | HTML Background Color is the shade that appears behind the content on a webpage. The background covers the total size of the element with padding and border but excludes the margin. It makes the text so easy to read for the user. | <div style="background-color: magenta;"> Div with magenta background </div> | 
| Text Color | Text color in HTML specifies the color of the text content, similar to font color. | <p style="color: pink;"> Pink color is used </p> | 
| Border Color | HTML Border Color refers to the color of borders around elements like <div>, <img>, etc. It defines the color of the border lines. | <div style="border: 1px solid black; border-color: green;"> This div has a green border </div> | 
| Link Color | HTML Link Color specifies the color of the anchor tag within a webpage, allowing us to define the color of clickable text, and making user navigation more visual. | <a href="#" style="color: blue;"> Link has a blue color </a> | 
HTML Colors Example:
The example illstrates the various HTML Colors to the element.
<!DOCTYPE html>
<html>
<head>
    <title>HTML Text Color</title>
    <style>
        center {
            width: 50%;
            margin: 0 auto;
        }
        h2, div, p, span {
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <center>
        <h2 style="background-color: gray;">
            Heading with Gray Background color
        </h2>
        <div style="border: 2px solid skyblue;">
            Div with Skyblue Border color
        </div>
        <span >
            <a href="#" style="color: #ff6347;">
                Link has a tomato color
            </a>
        </span>
        <p style="color: darkgreen;">
            Paragraph with Dark Green Text color
        </p>
        
    </center>
</body>
</html>
Output:
HTML Colors Example Explanation:
- In this example we create HTML to structure content with elements like headings, divs, links, and paragraphs.
- Heading displays a gray background for emphasis.
- Div is bordered with skyblue color for visual distinction.
- Link text appears in tomato color for better visibility.
- Paragraph text is styled with a dark green color for readability.
Color Values
Color values in HTML define the color of elements. They can be specified using various formats such as hexadecimal, RGB, RGBA, HSL, HSLA, color names, and system color keywords.
RGB Color Value
RGB, which stands for Red, Green, and Blue, is a method used in CSS to describe colors. It works by mixing different amounts of three primary colors, each with values ranging from 0 to 255. By adjusting these values, we can produce an extensive range of colors, allowing for the creation of diverse and better color palettes across websites.
RGB Color Value Properties
Some properties are:
- It's representation is as rgb(red, green, blue).
- By adjusting these values from 0 to 255, we can produce 16,777,216 unique colors.
- For instance, specifying rgb(0, 255, 0) results in green because the green value is at its maximum (255), while red and blue are at 0. Conversely, using rgb(0, 0, 255) produces blue, with the blue channel set to its peak (255), and red and green at 0.
- To render black, all color parameters are set to 0 (rgb(0, 0, 0)), and for white, all parameters are set to their maximum (rgb(255, 255, 255)).
RGB Color Value Syntax
// Blue background
<p style="background-color: rgb(0, 0, 255);">
    Is the sky background Blue by using RGB
</p>
RGB Color Value Example
The example we are using the RGB color values to style our html elements.
<!DOCTYPE html>
<html>
<head>
    <title>RGB Color Value</title>
    <style>
        center {
            width: 50%;
            margin: 0 auto;
        }
        h2,
        div,
        p,
        span {
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <center>
        <h2 style="background-color: rgb(109, 102, 197);">
            Heading with blue Background color
        </h2>
        <div style="border: 2px solid rgb(135, 206, 235);">
            <li>
                <a href="#html-color-usage">
                    HTML Color Usage
                </a>
            </li>
            Div with Skyblue Border color
        </div>
        <span>
            <a href="#" style="color: rgb(241, 76, 89);">
                Link has a tomato color
            </a>
        </span>
        <p style="color: rgb(0, 100, 0);">
            Paragraph with Dark Green Text color
        </p>
    </center>
</body>
</html>
Output:
RGB Color Value Example Explanation
Here is the implementation of above example.
- In the above example the Heading exhibits a blue background using RGB color value (109, 102, 197).
- Div border is styled with skyblue using RGB color value (135, 206, 235).
- Link text appears in tomato color using RGB value (241, 76, 89) for visual distinction.
- Paragraph text is styled with dark green using RGB value (0, 100, 0) for readability.
RGBA Color Value
RGBA (Red, Green, Blue, Alpha) is a color model similar to RGB, but with an added alpha parameter representing transparency. The alpha value, which ranges from 0 to 1, adjusts transparency, allowing the display of colors with varying levels of opacity. It's representation is as rgba(red, green, blue, alpha).
RGBA Color values Properties
- RGBA Format Represents colors using Red, Green, Blue, and Alpha (transparency) values, allowing control over opacity.
- Alpha value ranges from 0 (fully transparent) to 1 (fully opaque).
- RGBA values are expressed as rgba(red, green, blue, alpha).
- Ideal for creating semi-transparent elements, providing subtle visual effects or layering content.
RGBA Color Value Syntax
// Semi-transparent text with a purple hue
<span style="color: rgba(128, 0, 128, 0.5);">
    This text is semi-transparent with a purple hue using RGBA
</span>
RGBA Color Value Example
In this example we are using the RGBA color values to style our html elements.
<!DOCTYPE html>
<html>
<head>
    <title>RGBA Color Value</title>
    <style>
        center {
            width: 50%;
            margin: 0 auto;
        }
        h2, div, p, span {
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <center>
        <h2 style="background-color: rgba(255, 99, 71, 0.5);">
            Heading with semi-transparent Tomato Background color
        </h2>
        <div style="border: 2px solid rgba(255, 165, 0, 0.7);">
            Div with semi-transparent Orange Border color
        </div>
        <span>
            <a href="#" 
               style="color: rgba(0, 191, 255, 0.8);">
                Link has a semi-transparent Deep Sky Blue color
            </a>
        </span>
    
        <p style="color: rgba(128, 0, 128, 0.6);">
            Paragraph with semi-transparent Purple Text color
        </p>
        
    </center>
</body>
</html>
Output:
RGBA Color Value Example Explanation:
- Here we styled Heading with semi-transparent tomato background color using RGBA (255, 99, 71, 0.5).
- Div Exhibits a semi-transparent orange border with RGBA (255, 165, 0, 0.7).
- Link Displays a semi-transparent deep sky blue color using RGBA (0, 191, 255, 0.8).
- In Paragraph Text appears semi-transparent purple with RGBA (128, 0, 128, 0.6).
HEX Color Value
Hexadecimal color values, often referred to as hex values, use a six-digit code made up of pairs of characters.
- Hexadecimal values in CSS are represented as #rrggbb, where rr, gg, and bb denote the intensity of red, green, and blue, respectively, ranging from 00 to ff.
- This encoding allows for 16,777,216 unique color combinations, providing a vast spectrum for web design.
- For example, #ff0000 corresponds to red (max red, no green, no blue), while #00ff00 represents green (max green, no red, no blue).
- Black is denoted by #000000 (no red, no green, no blue), while white is represented as #ffffff (max red, max green, max blue).
HEX Color Value Syntax
// Pinkish Background
<div style="background-color: #FF69B4;">
    div has a pinkish background by using Hex
</div>
HEX Color Value Example:
In this example we are using the HEX color values to style our html elements.
<!DOCTYPE html>
<html>
<head>
    <title>Hex Color Value</title>
    <style>
        center {
            width: 50%;
            margin: 0 auto;
        }
        h2, div, p, span {
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <center>
        <h2 style="background-color: #FF6347;">
            Heading with semi-transparent 
            Tomato Background color (Hex: #FF6347)
        </h2>
        <div style="border: 2px solid #FFA500;">
            Div with semi-transparent 
            Orange Border color (Hex: #FFA500)
        </div>
        <span>
            <a href="#" style="color: #00BFFF;">
                Link has a semi-transparent 
                Deep Sky Blue color (Hex: #00BFFF)
            </a>
        </span>
    
        <p style="color: #800080;">
            Paragraph with semi-transparent 
            Purple Text color (Hex: #800080)
        </p>
    </center>
</body>
</html>
Output:
HEX Color Value Explanation:
- In this example Heading Styled with a tomato background using hex color value #FF6347.
- Div Features an orange border using hex color value #FFA500.
- Link Rendered with a deep sky blue color using hex value #00BFFF.
- Paragraph Text is colored purple using hex value #800080.
HSL (Hue, Saturation, Lightness) Value
HSL color values in HTML represent colors by defining their hue, saturation, and lightness. The hue signifies the type of color (red, blue, green, etc.), saturation refers to the intensity or purity of the color, and lightness determines the brightness or darkness.
HSL Color value Properties:
- HSL representation defines colors based on Hue, Saturation, and Lightness components, offering a more intuitive way to specify colors.
- Hue represents the color type, ranging from 0 to 360 degrees.
- Saturation determines the intensity or purity of the color, from 0% (grayscale) to 100% (full color).
- Lightness controls the brightness of the color, ranging from 0% (black) to 100% (white), with 50% representing normal.
HSL Color value Syntax
// Golden Background
<div style="background-color: hsl(45, 100%, 50%);">
    This div has a golden background using HSL
</div>
HSL color value Example:
The example shows the HSL color values.
<!DOCTYPE html>
<html>
<head>
    <title>HSL Color Value</title>
    <style>
        center {
            width: 50%;
            margin: 0 auto;
        }
        h2, div, p, span {
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <center>
        <h2 style="background-color: hsla(120, 100%, 50%, 0.5);">
            Heading with semi-transparent 
            Green Background color 
            (HSL: hsla(120, 100%, 50%, 0.5))
        </h2>
        <div style="border: 2px solid hsla(240, 100%, 50%, 0.7);">
            Div with semi-transparent 
            Blue Border color 
            (HSL: hsla(240, 100%, 50%, 0.7))
        </div>
        <span>
            <a href="#" style="color: hsla(30, 100%, 50%, 0.8);">
                Link has a semi-transparent 
                Orange color 
                (HSL: hsla(30, 100%, 50%, 0.8))
            </a>
        </span>
    
        <p style="color: hsla(0, 100%, 25%, 0.6);">
            Paragraph with semi-transparent 
            Red Text color 
            (HSL: hsla(0, 100%, 25%, 0.6))
        </p>
    </center>
</body>
</html>
Output:
HSL Color value Explanation:
- In this example HSLA(120, 100%, 50%, 0.5) creates a semi-transparent green background for the heading with 50% opacity.
- HSLA(240, 100%, 50%, 0.7) sets a semi-transparent blue border for the div with 70% opacity.
- HSLA(30, 100%, 50%, 0.8) defines a semi-transparent orange color for the link with 80% opacity.
- HSLA(270, 100%, 25%, 0.6) specifies semi-transparent purple text for the paragraph with 60% opacity.
