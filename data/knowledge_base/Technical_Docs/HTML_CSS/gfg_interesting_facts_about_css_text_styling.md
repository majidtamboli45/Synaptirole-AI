# Interesting Facts About CSS Text Styling

> Source: https://www.geeksforgeeks.org/css/interesting-facts-about-css-text-styling

CSS text styling provides a wide range of options to enhance and customize the text in your layouts. Let’s explore some interesting facts and tricks to improve your text styling skills.
1. Use text-shadow for Subtle Effects
The text-shadow property is often underused but can add a nice depth to the text, making it stand out more on your pages.
- Creates a shadow behind the text: Use text-shadow to give your text a soft shadow effect.
- Perfect for headers: Great for adding depth to titles and headings.
- Multiple shadows: You can apply more than one shadow for a more complex effect.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1 {
            font-size: 50px;
            text-shadow: 3px 3px 4px rgba(0, 0, 0, 0.3);
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Text Shadow Example</h1>
</body>
</html>
<!--Driver Code Ends-->
- text-shadow: 3px 3px 4px rgba(0, 0, 0, 0.3) creates a soft shadow that shifts 3px horizontally and vertically, with a blur radius of 4px.
- This effect makes the text appear more prominent and readable against a background.
2. Warp Text Using text-transform
The text-transform property can change the case of text, making it easier to control how text appears without needing to rewrite it in HTML.
- Control case with ease: uppercase, lowercase, and capitalize transform text instantly.
- Consistent styling: Helpful for maintaining consistent text presentation across your layout.
- No need for extra markup: You can adjust the case in CSS rather than in HTML.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            text-transform: uppercase;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This is a simple text transformation.</p>
</body>
</html>
<!--Driver Code Ends-->
- text-transform: uppercase makes the text all uppercase, even though it’s written in normal case in HTML.
- This allows you to adjust the case for specific design needs without extra markup.
3. Improve Text Legibility with line-height
The line-height property affects the vertical spacing between lines of text. This is important for improving legibility, especially in longer paragraphs.
- Increases readability: Adjusting line-height makes blocks of text easier to read.
- Customizable: You can set it in terms of pixels or unitless values for flexible scaling.
- Works across text blocks: Applies to all text elements, from paragraphs to headings.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            line-height: 1.8;
            font-size: 18px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This is the Sample HTML Code .</p>
</body>
</html>
<!--Driver Code Ends-->
- The line-height: 1.8 property increases the space between lines, making the text easier to read.
- A higher line-height value is especially helpful for larger blocks of text.
4. Control Text Wrapping and Overflow with white-space
The white-space property gives you control over how white space is handled in your text, especially useful when working with preformatted text or text that needs to stay on one line.
- No wrapping: Use white-space: nowrap to prevent text from wrapping to the next line.
- Preserve whitespace: white-space: pre allows the text to maintain spaces and line breaks as they are in the HTML code.
- Fit text within boundaries: Can be helpful for ensuring text fits within a specific container without wrapping.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            white-space: nowrap;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This text will stay on one line, no matter how long it gets. 
      This text will stay on one line, no matter how long it gets.
      This text will stay on one line, no matter how long it gets.
      This text will stay on one line, no matter how long it gets.</p>
</body>
</html>
<!--Driver Code Ends-->
- white-space: nowrap prevents the text from wrapping and forces it to remain on a single line.
- This can be useful when displaying text like navigation links or long URLs that shouldn’t break.
