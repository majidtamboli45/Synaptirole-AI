# CSS Introduction

> Source: https://www.geeksforgeeks.org/css/css-introduction

CSS (Cascading Style Sheets) is a language designed to simplify the process of making web pages presentable.
- It allows you to apply styles to HTML documents by prescribing colors, fonts, spacing, and positioning.
- CSS separates content from styling and enables reuse across pages.
- HTML uses tags, and CSS uses rule sets.
- CSS styles are applied to the HTML element using selectors.
Understanding Cascading
Cascading in CSS defines how the browser resolves conflicts between multiple CSS rules using importance, specificity, and source order.
- CSS follows a hierarchy-Inline, Internal, External styles.
- Specificity decides which selector has more weight.
- Later rules override earlier ones if they have equal priority.
Key Features of CSS
- Cascading: Styles can come from multiple sources, and the browser decides which one wins based on priority.
- Selectors: Powerful patterns to target specific elements (by tag, class, id, etc.).
- Responsive Design: CSS makes websites look good on mobiles, tablets, and desktops.
- Reusability: One stylesheet can control hundreds of pages.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>My First Styled Page</title>
<!--Driver Code Ends-->
    <style>
        body {
            background-color: #f0f0f0;
            font-family: Arial, sans-serif;
        }
        h1 {
            color: #258D46;
            font-size: 48px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.1);
        }
        p {
            color: #D35400;
            font-size: 20px;
            line-height: 1.6;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Welcome to CSS</h1>
    <p>This is a beautifully styled paragraph using CSS.</p>
</body>
</html>
<!--Driver Code Ends-->
The output shows how the CSS content is displayed in the browser:
Advantages of CSS
Here are some advantages of css:
- Makes web design and maintenance easier.
- Improves website performance and user experience.
- Supports responsive and adaptive designs for all devices.
- Write CSS once and reuse it across multiple HTML pages.
- Change the style globally with a single modification.
- Clean coding technique that improves readability for search engines.
- Offers a wider array of attributes compared to HTML.
- CSS can store web applications locally using an offline cache, allowing offline viewing.
