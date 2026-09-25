# CSS Multiple Columns

> Source: https://www.geeksforgeeks.org/css/css-multiple-columns

CSS Multiple Columns is a layout feature that divides content into multiple vertical columns, similar to a newspaper. It improves readability and organizes content efficiently across different screen sizes.
- Use properties like column-count and column-width to define the number and size of columns.
- Apply column-gap to control spacing between columns.
- Helps present large text content in a clean and structured format.
Properties of CSS Multiple Columns
Below is a list of essential CSS properties for working with multiple columns:
The column-count property
The column-count property in CSS defines the number of columns into which the content of an element is divided.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .content {
            column-count: 3; 
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="content">
        This text is divided into three columns using the column-count property. 
        It helps in creating newspaper-style layouts and enhances readability 
        for large chunks of text by splitting them into multiple columns.
    </div>
</body>
</html>
<!--Driver Code Ends-->
- column-count: 3;: Specifies that the content inside the element is divided into three columns.
- Used for creating layouts similar to newspapers or magazines.
The columns-gap property
The column-gap property in CSS is used to specify the space between columns in a multi-column layout.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .content {
            column-count: 3; 
            column-gap: 30px; 
            text-align: justify;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1 style="text-align: center; color: green;">GeeksforGeeks</h1>
    <div class="content">
        GeeksforGeeks is a computer science portal for geeks. It provides various tutorials, articles, 
        and courses to prepare for interviews at top companies like Microsoft, Amazon, and Google. 
    </div>
</body>
</html>
<!--Driver Code Ends-->
- column-count: 3;: Divides the content into three columns.
- column-gap: 30px;: Sets a 30px gap between the columns to improve readability.
The column-rule-style property
The column-rule-style property in CSS specifies the style of the rule (line) between columns in a multi-column layout.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .content {
            column-count: 3; 
            column-rule-style: solid;
            text-align: justify;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="content">
        GeeksforGeeks is a computer science portal for geeks. It provides tutorials, articles, 
      and courses to prepare for interviews at top companies like Microsoft, Amazon, and Google. 
    </div>
</body>
</html>
<!--Driver Code Ends-->
- column-count: 3;: Divides the content into three columns.
- column-rule-style: solid;: Adds a solid line between the columns.
- text-align: justify;: Justifies the text within each column for a cleaner appearance.
The column-rule-width property
The column-rule-width property in CSS specifies the width of the line drawn between columns in a multi-column layout.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .content {
            column-count: 3; 
            column-gap: 50px; 
            column-rule-style: solid; 
            column-rule-width: 10px; 
            text-align: justify;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="content">
        GeeksforGeeks is a computer science portal offering articles, tutorials, 
      and courses for coding and technical interview preparation. 
    </div>
</body>
</html>
<!--Driver Code Ends-->
- column-rule-style: solid;: Specifies a solid line between columns.
- column-rule-width: 10px;: Sets the width of the column rule to 10px.
The column-rule-color property
The column-rule-color property in CSS specifies the color of the line between columns in a multi-column layout.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .content {
            column-count: 3;
            column-rule-style: solid;
            column-rule-color: green;
            text-align: justify;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="content">
        GeeksforGeeks is a computer science portal offering articles,
      tutorials, and courses for coding and technical interview preparation.
    </div>
</body>
</html>
<!--Driver Code Ends-->
- column-count: 3;: Divides the content into three columns.
- column-rule-style: solid;: Specifies a solid line between the columns.
- column-rule-color: green;: Colors the column rule green for a visually appealing layout.
The column-rule property
The column-rule property in CSS allows you to set the style, width, and color of the rule (line) between columns in a multi-column layout.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .content {
            column-count: 3;
            padding-top: 35px;
            column-rule: 10px solid green; 
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="content">
        Sudo Placement: Prepare for the Recruitment
      drive of product-based companies like Microsoft, Amazon,
    </div>
</body>
</html>
<!--Driver Code Ends-->
- column-count: 3;: Divides the content into three columns.
- column-rule: 10px solid green;: Creates a 10px wide solid green line between the columns.
The column-span property
The column-span property in CSS allows an element to span across multiple columns in a multi-column layout. By setting it to all, you can make an element stretch across all columns.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
         .container {
            column-count: 3;
            column-gap: 20px;
            text-align: justify;
        }
        .geeks_content {
            column-span: all;
            font-weight: bold;
            margin-bottom: 10px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
   <div class="container">
        <div class="geeks_content">
            Sudo Placement: Prepare for the Recruitment drive of product-based
            companies like Microsoft, Amazon, Adobe, etc.
        </div>
        GeeksforGeeks is a computer science portal offering articles, tutorials,
        and courses for coding and technical interview preparation. 
    </div>
</body>
</html>
<!--Driver Code Ends-->
- column-span: all;: This property ensures the .content element spans across all three columns in the multi-column layout.
- text-align: justify;: This property ensures that the text within the .geeks_content element is justified, meaning the text is aligned evenly along both the left and right margins.
The column-width property
The column-width property in CSS defines the width of each column in a multi-column layout.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .geeks_content {
            column-width: 250px; 
            text-align: justify;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="geeks_content">
        Sudo Placement: Prepare for the Recruitment
        drive of product-based companies like Microsoft,
        Amazon, Adobe, etc., with a free online placement
    </div>
</body>
</html>
<!--Driver Code Ends-->
- column-width: 250px;: Sets the ideal width for each column to 250 pixels. The browser will determine the number of columns based on this width and the available space.
Best Practices
Here some best practices discussed:
- Maintain Readability: Avoid using too many columns as it may overwhelm the user.
- Responsive Design: Use media queries to adjust the column count and width for different screen sizes.
- Test on Devices: Ensure your multi-column layout looks good on various devices.
- Align with Themes: Match the column rules and gaps with the overall design theme for consistency.
