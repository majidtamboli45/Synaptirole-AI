# CSS Pseudo-classes

> Source: https://www.geeksforgeeks.org/css/css-pseudo-classes

A pseudo-class is a keyword added to a CSS selector, prefixed by a colon (:), to define a specific state or condition of an element. It is used to style elements like a hovered button, the first child of a container, or checked input fields.
Syntax
selector:pseudo-class {
    /* styles */
}
Interactive/User Action Pseudo-Classes
1. :hover
This applies when the user hovers over an element.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        button:hover {
            background-color: lightblue;
            color: white;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <button>Hover over me!</button>
</body>
</html>
<!--Driver Code Ends-->
This will change the background color of the button when hovered over.
Output:
2. :focus
Applies when an element receives focus (e.g., a text input clicked)
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:focus {
            border: 2px solid blue;
            outline: none;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <input type="text" placeholder="Click to focus">
</body>
</html>
<!--Driver Code Ends-->
This will change the border of the input field to blue when it is focused.
3. :active
Applies when an element is being clicked .
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        button:active {
            background-color: darkblue;
            color: white;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <button>Click me!</button>
</body>
</html>
<!--Driver Code Ends-->
This will change the background color of the button when it is being clicked (in the active state).
Output:
4. :visited
Applies to links the user has visited.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        a:visited {
            color: purple;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <a href="https://www.example.com//">Visit this link</a>
</body>
</html>
<!--Driver Code Ends-->
This will change the color of visited links to purple.
5. :link
Applies to links that the user has not visited yet.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        a:link {
            color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <a href="https://www.example.com//">Visit this link</a>
</body>
</html>
<!--Driver Code Ends-->
This will make unvisited links appear in green.
Output:
6. :focus-visible
Applies when an element is focused, but only if the focus is visible (e.g., for accessibility).This Style is applied when user focus on an element using tab button.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        button:focus-visible {
            outline: 3px solid orange;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <button>Click or Tab to focus</button>
</body>
</html>
<!--Driver Code Ends-->
Output:
7. :focus-within
Applies to an element if it or its descendants have focus.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .form-container:focus-within {
            border: 2px solid green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="form-container">
        <input type="text" placeholder="Type here">
    </div>
</body>
</html>
<!--Driver Code Ends-->
This will apply a green border to the .form-container element when any of its descendants (like the input field) has focus.
Output:
Structural targeting pseudo classes
1. :first-child
Matches the first child of its parent
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:first-child {
            color: red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the first paragraph.</p>
        <p>This is the second paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Output:
2. :last-child
Matches the last child of its parent
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:last-child {
            color: blue;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the first paragraph.</p>
        <p>This is the last paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Output:
3. :nth-child(n)
Matches the nth child of its parent
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:nth-child(5) {
            color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the first paragraph.</p>
        <p>This is the second paragraph.</p>
        <p>This is the third paragraph.</p>
        <p>This is the fourth paragraph.</p>
        <p>This is the fifth paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Output:
4. :nth-last-child(n)
Matches the nth child from the end of its parent
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:nth-last-child(1) {
            color: orange;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the first paragraph.</p>
        <p>This is the second paragraph.</p>
        <p>This is the third paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Output:
5. :first-of-type
Matches the first instance of a specific type within a parent element.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:first-of-type {
            color: purple;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <span>Some text</span>
        <p>This is the first paragraph.</p>
        <p>This is another paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Output:
6. :last-of-type
Matches the last instance of a specific type within a parent.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:last-of-type {
            color: yellow;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the first paragraph.</p>
        <span>Some text</span>
        <p>This is the last paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Output:
7. :nth-of-type(n)
Matches the nth instance of a specific type.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:nth-of-type(2) {
            color: pink;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the first paragraph.</p>
        <span>Some text</span>
        <p>This is the second paragraph.</p>
        <p>This is the third paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
8. :nth-last-of-type(n)
Matches the nth instance of a specific type from the end
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:nth-last-of-type(1) {
            color: brown;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the first paragraph.</p>
        <span>Some text</span>
        <p>This is the second paragraph.</p>
        <p>This is the third paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
9. :only-child
Matches elements that are the only child of their parent.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:only-child {
            color: teal;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the only paragraph.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
10. :only-of-type
Matches elements that are the only instance of their type within a parent.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p:only-of-type {
            color: coral;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div>
        <p>This is the only paragraph.</p>
        <span>Some text</span>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Output:
11. :empty
Matches elements with no children or content.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        div:empty {
            background-color: green;
        }
        #one {
            height: 100px;
            width: 100px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div id="one"></div>
    <div>
        <p>This div has content.</p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
Output:
Form Pseudo-Classes
1. :checked
Matches checkboxes or radio buttons that are selected.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:checked {
            outline: 5px solid red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    Agree to terms <input type="checkbox">
</body>
</html>
<!--Driver Code Ends-->
Output:
2. :disabled
Matches elements that are disabled.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:disabled {
            background-color: lightgray;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <input type="text" disabled placeholder="Disabled input">
</body>
</html>
<!--Driver Code Ends-->
Output:
3. :enabled
Matches elements that are enabled.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:enabled {
            background-color: lightblue;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <input type="text" placeholder="Enabled input">
</body>
</html>
<!--Driver Code Ends-->
Output:
4. :required
Matches form fields marked as required.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:required {
            border: 2px solid red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <form>
        <input type="text" required placeholder="This field is required">
    </form>
</body>
</html>
<!--Driver Code Ends-->
Output:
5. :optional
Matches form fields that are not required.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:optional {
            border: 2px solid green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <form>
        <input type="text" placeholder="This field is optional">
    </form>
</body>
</html>
<!--Driver Code Ends-->
Output:
6. :valid
Matches form fields with valid input types entered in them.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:valid {
            border: 2px solid green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <form>
        <input type="email" placeholder="Enter valid email" required>
    </form>
</body>
</html>
<!--Driver Code Ends-->
Output:
7. :invalid
Matches form fields with invalid input entered in them.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:invalid {
            border: 2px solid red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <form>
        <input type="email" placeholder="Enter valid email" required>
    </form>
</body>
</html>
<!--Driver Code Ends-->
Output:
8. :in-range
Matches inputs within a valid range (e.g., a number input).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:in-range {
            background-color: lightgreen;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <form>
        <input type="number" min="1" max="10" placeholder="Pick a number between 1 and 10">
    </form>
</body>
</html>
<!--Driver Code Ends-->
Output:
9. :out-of-range
Matches inputs outside the valid range.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:out-of-range {
            background-color: lightcoral;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <form>
        <input type="number" min="1" max="10" placeholder="Pick a number between 1 and 10">
    </form>
</body>
</html>
<!--Driver Code Ends-->
Output:
10. :read-only
Matches elements that are read-only.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:read-only {
            background-color: lightgray;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <input type="text" value="This is read-only" readonly>
</body>
</html>
<!--Driver Code Ends-->
Output:
11. :read-write
Matches elements that are editable.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        input:read-write {
            background-color: lightyellow;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <input type="text" placeholder="You can type here">
</body>
</html>
<!--Driver Code Ends-->
