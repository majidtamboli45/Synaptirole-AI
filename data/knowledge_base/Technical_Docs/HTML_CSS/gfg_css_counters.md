# CSS Counters

> Source: https://www.geeksforgeeks.org/css/css-counters

CSS counters allow you to number elements like lists or sections automatically. They are "variables" maintained by CSS, and their values can be incremented with CSS rules, tracking how many times they are used.
To work with CSS counters, we use a set of properties:
- counter-reset: Creates or resets a counter.
- counter-increment: Increments the counter's value.
- content: Inserts generated content (like the counter's value) before or after an element.
- counter() and counters() functions: Return the current value of a counter or a nested counter.
Automatic Numbering With Counters
CSS counters act as "variables." These variables can be incremented through CSS, and their values can be used within the content of an element. Here's a basic example demonstrating automatic numbering for sections.
1. Numbering Sections
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            counter-reset: section;
        }
        h2::before {
            counter-increment: section;
            content: "Section " counter(section) ": ";
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>Pizza</h2>
    <h2>Hamburger</h2>
    <h2>Hotdogs</h2>
</body>
</html>
<!--Driver Code Ends-->
- counter-reset: section;: Resets the section counter at the beginning of the body element.
- counter-increment: section;: Increments the counter value for each <h2> element.
- content: "Section " counter(section) ": ";: Displays the value of the counter before each <h2>, resulting in a numbered list of sections.
2. Nesting Counters
You can also create multiple counters, each of which operates independently. For example, you might want to have one counter for sections and another for subsections. Here's how you can nest counters.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        body {
            counter-reset: section;
        }
        h1 {
            counter-reset: subsection;
        }
        h1::before {
            counter-increment: section;
            content: "Section " counter(section) ". ";
        }
        h2::before {
            counter-increment: subsection;
            content: counter(section) "." counter(subsection) " ";
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Pizza</h1>
    <h2>Cheese</h2>
    <h2>Tomato</h2>
    <h1>Hamburger</h1>
    <h2>Beef</h2>
    <h2>Chicken</h2>
    <h1>Hotdogs</h1>
    <h2>Classic</h2>
    <h2>Spicy</h2>
</body>
</html>
<!--Driver Code Ends-->
- counter-reset: subsection;: Resets the subsection counter when a new <h1> element is encountered.
- counter-increment: section;: Increments the section counter for each <h1>.
- counter-increment: subsection;: Increments the subsection counter for each <h2>.
- content: counter(section) "." counter(subsection): Combines both counters for displaying "Section 1.1", "Section 1.2", etc.
Creating Outlined Lists with Counters
Counters can also be useful for creating outlines, as they automatically generate new instances of counters in child elements. You can use the counters() function to combine different levels of counters, creating hierarchical numbering.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        ol {
            counter-reset: section;
            list-style-type: none;
        }
        li::before {
            counter-increment: section;
            content: counters(section, ".") " ";
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <ol>
        <li>Pizza</li>
        <li>Hamburger
            <ol>
                <li>Beef</li>
                <li>Chicken</li>
            </ol>
        </li>
        <li>Hotdogs</li>
    </ol>
</body>
</html>
<!--Driver Code Ends-->
- counter-reset: section;: Resets the counter at the start of the <ol> element.
- counter-increment: section;: Increments the counter for each <li>.
- content: counters(section, "."): Uses the counters() function to display the counter values separated by periods (.), resulting in hierarchical numbering.
