# CSS Fonts

> Source: https://www.geeksforgeeks.org/css/css-fonts

CSS fonts are used to style and enhance the appearance of text on a webpage, making it more readable and visually appealing. They help control how text looks and fits within the overall design.
- Used to set the size, weight, style, and color of text.
- Help create a consistent and attractive look across a website.
- Improve readability and align the text style with the website’s theme.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .gfg {
            font-family: Arial, Helvetica, sans-serif;
            font-size: 60px;
            color: #090;
            text-align: center;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="gfg">GeeksforGeeks</div>
</body>
</html>
<!--Driver Code Ends-->
- The code applies a green, 60px Arial font to the text "GeeksforGeeks" and centers it on the page.
- The text is styled using the .gfg class in the HTML.
Applying Fonts in CSS
Fonts in CSS are applied using specific properties that control the style and appearance of text.
1. font-family
The font-family property defines which font(s) should be used for text. You can provide a list of fonts as a fallback mechanism in case the preferred font is unavailable.
Syntax:
font-family: "Font Name", generic-font-name; body {
    font-family: "Arial", sans-serif;
}
In this example, the browser will first try to display the text in Arial. If Arial is not available, it will fall back to a sans-serif font.
2. font-size
The font-size property controls the size of the text. You can set the size in several units, including pixels (px), ems (em), and percentages (%).
Syntax:
font-size: value;
h1 {
    font-size: 32px; /* Pixels */
}
p {
    font-size: 1.2em; /* Relative to the parent element */
}
- Pixels (px) provide a fixed font size.
- Ems (em) are relative to the parent element’s font size, making them useful for responsive design.
3. font-weight
The font-weight property controls the thickness of the text. It can accept values like normal, bold, or numeric values (100 to 900).
Syntax:
font-weight: value;
p {
    font-weight: bold; /* Bold text */
}
strong {
    font-weight: 700; /* Equivalent to bold */
}
Numeric values allow for finer control over weight (e.g., 100 for light, 900 for extra bold).
4. font-style
The font-style property defines the style of the font, typically italic or normal.
Syntax:
font-style: value;
em {
    font-style: italic; /* Italicized text */
}
p {
    font-style: normal; /* Normal text */
}
5. line-height
The line-height property defines the space between lines of text. Increasing line height improves readability, especially for long paragraphs.
Syntax:
line-height: value;
p {
    line-height: 1.5; /* 1.5 times the font size */
}
Web Safe Fonts Vs Custom Fonts
This comparison highlights the difference between universally supported system fonts (web-safe) and designer-selected custom fonts used for unique web styling.
1. Web Safe Fonts
Web safe fonts are commonly supported across all browsers and operating systems. These fonts are pre-installed on most computers, ensuring your text appears the same across devices.
Common Web Safe Fonts
- Arial
- Times New Roman
- Courier New
- Verdana
- Georgia
body {
    font-family: "Verdana", sans-serif;
}
2. Custom Fonts
Custom fonts allow you to use fonts that are not pre-installed on a user’s device. You can load them using web fonts. The most popular method for using custom fonts is through Google Fonts, or by hosting fonts on your own server.
<head>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <h1 style="font-family: 'Roboto', sans-serif;">Hello, World!</h1>
</body>
Responsive Typography
To make typography adaptable to different screen sizes, use responsive units like em, rem, %, or vw for font sizes. You can also combine CSS media queries with typography to ensure readability across devices.
body {
    font-size: 16px; /* Default font size */
}
@media (max-width: 600px) {
    body {
        font-size: 14px; /* Smaller font on smaller screens */
    }
}
- em and rem: These units are relative to the parent element or root element’s font size, allowing better scaling.
- vw (viewport width): This unit scales the font size based on the width of the viewport, which is great for fluid layouts.
Properties of CSS Fonts
To customize fonts effectively in web design, it’s crucial to understand the main CSS font properties:
- font-family: Specifies the font type.
- font-size: Determines the size of the text.
- font-weight: Adjusts the thickness of the text.
- font-style: Controls the slant of the text (e.g., italic).
- line-height: Sets the space between lines of text.
- letter-spacing: Modifies the space between characters.
- text-transform: Controls the capitalization of text.
