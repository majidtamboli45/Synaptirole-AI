# CSS Conditional Rules

> Source: https://www.geeksforgeeks.org/css/css-conditional-rules

CSS Conditional Rules apply styles only when specific conditions are met, allowing dynamic styling based on situations. These rules evaluate conditions as true or false and execute styles accordingly.
- Commonly used for responsive design and browser compatibility.
- Helps apply styles selectively based on device, screen size, or feature support.
The main conditional rules include:
1. CSS Supports Rule
The @supports rule in CSS allows you to apply styles only if the browser supports a specific CSS property or feature.
Syntax:
@supports ("condition") {
/* Style to apply */
}
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        @supports (display: grid) {
            section h1 {
                background-color: green;
                color: white;
                padding: 15px;
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <section>
        <h1>GeeksforGeeks</h1>
        <h3>A computer science portal for geeks</h3>
    </section>
</body>
</html>
<!--Driver Code Ends-->
- The @supports rule checks if the browser supports the display: grid property.
- If supported, it applies the specified styles to the <h1> element within the <section>, changing its background color to green, text color to white, and adding padding.
2. CSS Media Rule
The @media rule in CSS applies styles based on media queries, allowing for responsive design that adapts to different devices and screen sizes.
Syntax:
@media screen and ("condition") {
/* Style to apply */
}
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        @media screen and (max-width: 700px) {
            section {
                background-color: green;
                color: white;
                padding: 15px;
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <section>
        <h1>GeeksforGeeks</h1>
        <h3>A computer science portal for geeks</h3>
    </section>
</body>
</html>
<!--Driver Code Ends-->
- The @media rule checks if the device's screen width is 700 pixels or less.
- If this condition is met, it applies the specified styles to the <section> element, changing its background color to green, text color to white, and adding padding.
3. CSS Document Rule
The @document rule in CSS is designed to apply styles to specific URLs or sets of URLs. However, it is currently experimental and primarily supported only in Firefox with the -moz- prefix. As a result, it is not recommended for cross-browser use.
Syntax:
@-moz-document url("YOUR-URL") {
/* Style to apply */
}
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        @-moz-document url("http://localhost/GfG/document-rule.html") {
            section h1 {
                background-color: green;
                color: #fff;
                padding: 15px;
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <section>
        <h1>GeeksforGeeks</h1>
        <h3>A computer science portal for geeks</h3>
    </section>
</body>
</html>
<!--Driver Code Ends-->
- The @-moz-document rule targets the specific URL "http://localhost/GfG/document-rule.html".
- Within this URL, it applies styles to the <h1> element inside the <section>, setting a green background, white text color, and padding.
Note: The @document rule is not widely supported across browsers; currently, it is primarily implemented in Firefox using the @-moz-document prefix
Best Practices
Here are some best best practices discussed:
- Use the @supports rule to apply styles only if the browser supports specific CSS features, ensuring fallback for unsupported browsers.
- Leverage the @media rule for responsive design, targeting specific screen sizes or device characteristics.
- Avoid over-reliance on experimental rules like @document, as they lack cross-browser support.
