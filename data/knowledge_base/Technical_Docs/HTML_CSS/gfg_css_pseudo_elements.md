# CSS Pseudo Elements

> Source: https://www.geeksforgeeks.org/css/css-pseudo-elements

A pseudo-element is a keyword added to a selector that lets you style specific parts of an element. For example, you can style the first line of a paragraph, add content before or after an element, or create complex effects with minimal code. Pseudo-elements are denoted by a double colon (::) (or : in legacy CSS).
Syntax
selector::pseudo-element{
property: value
}
::(the double colon is a syntax for pseudo-elements)
Commonly Used CSS Pseudo-Elements
1. ::before
The ::before pseudo-element allows you to insert content before the actual content of an element.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p::before {
            content: "✨ ";
            color: gold;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This is a paragraph.</p>
</body>
</html>
<!--Driver Code Ends-->
2. ::after
Similar to ::before, the ::after pseudo-element inserts content after the element’s content. It is often used to add icons, styling cues, or additional details.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p::after {
            content: " 🔥";
            color: red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This is a paragraph.</p>
</body>
</html>
<!--Driver Code Ends-->
3. ::first-letter
The ::first-letter pseudo-element targets the first letter of a block of text, generally used for decorative initials in paragraphs.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p::first-letter {
            font-size: 2em;
            color: blue;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This is a paragraph.</p>
</body>
</html>
<!--Driver Code Ends-->
4. ::first-line
The ::first-line pseudo-element is used to style the first line of a block of text. It is particularly useful for emphasizing the introduction of paragraphs.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p::first-line {
            font-weight: bold;
            color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>This is a longer paragraph to demonstrate the <br>
        first-line styling in action.</p>
</body>
</html>
<!--Driver Code Ends-->
5. ::placeholder
The ::placeholder pseudo-element styles placeholder text inside input fields.
<!--Driver Code Starts-->
<html>
<head>
    <style>
<!--Driver Code Ends-->
        input::placeholder {
            color: gray;
            font-style: italic;
        }
    </style>
</head>
<!--Driver Code Starts-->
<body>
    <input type="text" placeholder="Enter your name">
</body>
</html>
<!--Driver Code Ends-->
6. ::marker
Styles the marker of list items.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        li::marker {
            color: purple;
            font-size: 1.5em;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <ul>
        <li>First item</li>
        <li>Second item</li>
        <li>Third item</li>
    </ul>
</body>
</html>
<!--Driver Code Ends-->
7. ::selection
Styles the selected text.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        ::selection {
            background: yellow;
            color:green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>Select some text in this paragraph to see the effect.</p>
</body>
</html>
<!--Driver Code Ends-->
8. ::backdrop
Styles the backdrop of modal elements like <dialog>. It helps to style the background of the dialog box opened as a modal on the screen of the user.
<!--Driver Code Starts-->
<html>
<head>
    <style>
<!--Driver Code Ends-->
        dialog::backdrop {
            background: rgba(232, 233, 0, 0.5);
        }
<!--Driver Code Starts-->
        dialog {
            border: none;
            padding: 20px;
            background: white;
        }
    </style>
</head>
<body>
    <dialog id="myDialog">This is a dialog box.</dialog>
    <script>
        const dialog = document.getElementById("myDialog");
        if (dialog) {
            dialog.showModal();
        }
    </script>
</body>
</html>
<!--Driver Code Ends-->
Pseudo-elements for Specific Contexts
::file-selector-button for Media and Interactivity
This pseudo-element selector helps to style the button of a input type file.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        ::file-selector-button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        ::file-selector-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<!--Driver Code Starts-->
    <h2>Custom File Selector Button</h2>
    <input type="file">
</body>
</html>
<!--Driver Code Ends-->
::spelling-error for Error Handling
The ::spelling-error pseudo-element styles text that has been flagged as a spelling error by the browser's spell-check functionality.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        ::spelling-error {
            background-color: #ffdddd;
            text-decoration: underline solid red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>Spelling Error Detection</h2>
    <input type="text" value="Ths is a splling eror" spellcheck="true">
</body>
</html>
<!--Driver Code Ends-->
