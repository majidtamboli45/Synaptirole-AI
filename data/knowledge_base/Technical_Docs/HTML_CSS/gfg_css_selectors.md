# CSS Selectors

> Source: https://www.geeksforgeeks.org/css/css-selectors

CSS Selectors are patterns used in CSS to select and target HTML elements so that styles can be applied to them. They define which elements on a web page should receive specific styling rules.
- Used to select HTML elements based on tag name, class, id, or attributes.
- Help apply styles like color, font, spacing, and layout.
- Make web pages structured, consistent, and visually appealing.
CSS selectors are commonly grouped into five main categories:
1. Basic Selectors
Basic selectors in CSS are simple tools used for selecting by HTML element name (e.g., h1), class (.class Name), ID (#idName), or universally (* for all elements).
1. Universal Selector (*): Selects all elements on the page and applies the same style universally.
Example: Setting the font color for every element.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        * {
            color: red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>Header Text</h1>
    <p>Paragraph Text</p>
</body>
</html>
<!--Driver Code Ends-->
2. Element Selector: Targets all elements of a specific type, such as paragraphs or headers.
Example: Setting a common font size for all paragraphs
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            font-size: 16px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This paragraph styled with font size 16px.</p>
</body>
</html>
<!--Driver Code Ends-->
3. Class Selector (.): Applies styles to elements with a specific class attribute.
Example: Making all buttons have a blue background.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .button {
            background-color: blue;
            color: white;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <button class="button">Click Me!</button>
</body>
</html>
<!--Driver Code Ends-->
4. ID Selector (#): Styles a single element identified by its unique id.
Example: changing the background color of a header.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        #header {
            background-color: gray;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div id="header">This is the header section.</div>
</body>
</html>
<!--Driver Code Ends-->
2. Combinator Selectors
Used to define relationships between selectors, allowing you to style elements based on their hierarchy or positioning in the document. Common combinators include descendant ( ), child (>), adjacent sibling (+), and general sibling (~).
1. Descendant Selectors: Targets an element inside another, such as paragraphs inside div .
Example: Styling paragraphs inside a div.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div p {
            color: red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This paragraph inside a div will be red.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
2. Child Selector (>): They only affects the direct child elements of a parent.
Example: Styling direct children paragraphs of a div.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div>p {
            margin-left: 20px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is a direct child and has a left margin.</p>
        <div>
            <p>This is not a direct child.</p>
        </div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
3. Adjacent Sibling Selector (+): Styles an element immediately following another .
Example: Making the first paragraph bold after an h1.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1+p {
            font-weight: bold;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>This is a header.</h1>
    <p>This is immediately following the header and is bold.</p>
    <p>This will not be bold.</p>
</body>
</html>
<!--Driver Code Ends-->
4. General Sibling Selector (~): Styles all siblings that follow a specific element.
Example: Italicizing all paragraphs following an h1.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1~p {
            font-style: italic;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>This is a header.</h1>
    <p>This is a sibling of the header and will be italicized.</p>
    <p>This will also be italicized because it's a sibling of the header.</p>
</body>
</html>
<!--Driver Code Ends-->
3. Attribute Selectors
Attribute selectors in CSS target elements based on the presence or value of their attributes.
1. Presence Selector: It selects elements that contain a specific attribute.
Example: styling all inputs with a type attribute.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input[type] {
            border: 2px solid black;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <input type="text" placeholder="Text input">
    <input type="number" placeholder="Number input">
</body>
</html>
<!--Driver Code Ends-->
2. Attribute Value Selector: It targets elements with a particular attribute value.
Example: Styling text inputs.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input[type="text"] {
            background-color: yellow;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <input type="text" placeholder="Text input">
    <input type="password" placeholder="Password input">
</body>
</html>
<!--Driver Code Ends-->
3. Substring Matching(^=): It matches elements where the attribute contains a substring.
Example: Styling links with https in their href.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        a[href^="https"] {
            color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <a href="https://example.com/">Secure link</a>
    <a href="http://example.com/">Non-secure link</a>
</body>
</html>
<!--Driver Code Ends-->
4. Wildcard Selector (*=): Matches elements where the attribute value contains a specific string.
Example: Underlining links with example in the URL.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        a[href*="example"] {
            text-decoration: underline;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <a href="https://example.com/">This contains 'example' and is underlined.</a>
    <a href="https://otherlink.com">This is not underlined.</a>
</body>
</html>
<!--Driver Code Ends-->
5. Ends With Selector ($=): Matches elements whose attribute value ends with a specific string.
Example: Styling links that end with .pdf in their URL.
<style>
a[href$=".pdf"] {
    color: red;
}
</style>
6. Word Match Selector (~=): Matches elements whose attribute contains a specific whole word (space-separated).
Example: Styling elements that have the class highlight among multiple class names.
<style>
p[class~="highlight"] {
    background: yellow;
}
</style>
7. Hyphen Match Selector (|=): Matches elements whose attribute value starts with a word followed by a hyphen.
Example: Styling elements with language attributes like en or en-US.
<style>
p[lang|="en"] {
    color: blue;
}
</style>
4. Pseudo-Classes
Pseudo-classes in CSS define the special states of elements for styling.
1. :hover: Styles elements when the user hovers over them.
Example: Changing the color of a link when hovered.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        a:hover {
            color: red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <a href="https://example.com/">Hover over this to see the effect.</a>
</body>
</html>
<!--Driver Code Ends-->
2. :focus: Styles the elements when the user focus on any particular element.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:focus {
            outline: 3px solid red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <input type="text">
</body>
</html>
<!--Driver Code Ends-->
3. :first-child: Styles the element which is the first child of it's parent.
<!--Driver Code Starts-->
<html><head></head>
<!--Driver Code Ends-->
<style>
    p:first-child {
        color: brown;
    }
</style>
<!--Driver Code Starts-->
<body>
    <div>
        <p>Hello1</p>
        <p>Hello2</p>
    </div>
</body></html>
<!--Driver Code Ends-->
4. :last-child: Style's the element which is the last child of it's parent.
<!--Driver Code Starts-->
<html><head></head>
<!--Driver Code Ends-->
<style>
    p:last-child {
        color:green;
    }
</style>
<!--Driver Code Starts-->
<body>
    <div>
        <p>Hello1</p>
        <p>Hello2</p>
    </div>
</body></html>
<!--Driver Code Ends-->
5. :not: Helps to remove a particular element from the styling index or styling context.
<!--Driver Code Starts-->
<html><head></head>
<!--Driver Code Ends-->
<style>
    p:not(.one) {
        color: blue;
    }
</style>
<!--Driver Code Starts-->
<body>
    <div>
        <p class="one">Hello1</p>
        <p class="two">Hello2</p>
    </div>
</body></html>
<!--Driver Code Ends-->
5. Pseudo-Elements
Pseudo-elements allow you to target and style specific parts of an element, such as inserting content before or after it.
- They can be used to style parts of text, like the first letter or line of a paragraph.
- Pseudo-elements are commonly used to enhance and beautify the internal content of elements.
1. ::before: To insert some content before an element.
<!--Driver Code Starts-->
<html><head></head>
<!--Driver Code Ends-->
<style>
    h1::before {
        content: "★ "
    }
</style>
<!--Driver Code Starts-->
<body>
    <h1 tabindex="0">Welcome to GFG</h1>
</body></html>
<!--Driver Code Ends-->
2. ::after: To insert some content after an element.
<!--Driver Code Starts-->
<html><head></head>
<!--Driver Code Ends-->
<style>
    h1::after {
        content: "☀ ";
        color: orangered;
    }
</style>
<!--Driver Code Starts-->
<body>
    <h1 tabindex="0">Welcome to GFG</h1>
</body></html>
<!--Driver Code Ends-->
3. ::first-line: Styles the first line of text within a block element. Line breaks mark the beginning of a new line.
<!--Driver Code Starts-->
<html><head></head>
<!--Driver Code Ends-->
<style>
    p::first-line {
        color: red;
    }
</style>
<!--Driver Code Starts-->
<body>
    <p>Welcome to GFG<br>
        Hello GFG</p>
</body>
</html>
<!--Driver Code Ends-->
4. ::first-letter: It Styles the first-letter of a word or a sentence.
<!--Driver Code Starts-->
<html><head></head>
<!--Driver Code Ends-->
<style>
    p::first-letter {
        color: red;
        font-size: 23px;
    }
</style>
<!--Driver Code Starts-->
<body>
    <p>Welcome to GFG</p>
</body></html>
<!--Driver Code Ends-->
5. ::placeholder: Styles the placeholder of a specific input field.
<!--Driver Code Starts-->
<html><head></head>
<!--Driver Code Ends-->
<style>
    input::placeholder {
        font-size: 20x;
        font-family: sans-serif;
        font-weight: 900;
    }
</style>
<!--Driver Code Starts-->
<body>
    <input type="text" placeholder="Enter your name">
</body></html>
<!--Driver Code Ends-->
