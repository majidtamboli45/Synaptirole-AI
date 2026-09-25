# CSS Selectors Mini Project

> Source: https://www.geeksforgeeks.org/css/css-selectors-mini-project

Create a simple developer documentation page for a fictional web development resource.
The page should contain a navigation area, documentation sections, code examples, a list of topics, external links, and a feedback form. The main goal is to practice selecting HTML elements in different ways instead of assigning a separate class to every element.
You must build the project using the CSS selectors covered in this module, including CSS selectors, combinators, and specificity.
Requirements
- Create a developer documentation page.
- Use different CSS selectors to target HTML elements.
- Use combinators to select elements based on their relationships.
- Use attribute selectors for specific HTML attributes.
- Use pseudo-classes for interactive and positional styling.
- Use pseudo-elements for small visual details.
- Demonstrate CSS specificity with competing selectors.
- Keep the project in a single HTML file.
Module Articles Used
Step-by-Step Implementation
1. Create the Documentation Page and Use Basic Selectors
Create the header, navigation, and first documentation section. Use ID, element, and class selectors to style them.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Selectors Documentation</title>
    <style>
<!--Driver Code Ends-->
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #222;
        }
        a {
            color: #1769aa;
        }
        #site-header {
            padding: 25px;
            background-color: #172b4d;
            color: white;
        }
        #site-header h1 {
            margin: 0 0 15px;
        }
        .main-nav {
            padding: 15px;
            background-color: white;
        }
        .main-nav a {
            margin-right: 18px;
            text-decoration: none;
        }
        main {
            max-width: 850px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .doc-section {
            margin-bottom: 25px;
            padding: 25px;
            background-color: white;
            border: 1px solid #d8dde3;
        }
        .doc-section p {
            line-height: 1.6;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <header id="site-header">
        <h1>CSS Selectors Documentation</h1>
        <nav class="main-nav">
            <a href="#selectors">Selectors</a>
            <a href="#combinators">Combinators</a>
            <a href="#specificity">Specificity</a>
        </nav>
    </header>
    <main>
        <section id="selectors" class="doc-section">
            <h2>CSS Selectors</h2>
            <p>
                CSS selectors are used to target HTML elements for styling.
            </p>
            <p>
                Different selectors can target elements by their type,
                class, ID, attributes, or position in the document.
            </p>
            <ul class="topic-list">
                <li>Basic Selectors</li>
                <li>Attribute Selectors</li>
                <li>Pseudo-Classes</li>
                <li>Pseudo-Elements</li>
            </ul>
        </section>
    </main>
</body>
</html>
<!--Driver Code Ends-->
2. Use Combinators to Select Related Elements
Add the Combinators section and use descendant, child, adjacent sibling, and general sibling combinators
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Selectors Documentation</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #222;
        }
        #site-header {
            padding: 25px;
            background-color: #172b4d;
            color: white;
        }
        .main-nav {
            padding: 15px;
            background-color: white;
        }
        .main-nav a {
            margin-right: 18px;
            color: #1769aa;
            text-decoration: none;
        }
        main {
            max-width: 850px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .doc-section {
            margin-bottom: 25px;
            padding: 25px;
            background-color: white;
            border: 1px solid #d8dde3;
        }
        /* Descendant selector */
<!--Driver Code Ends-->
        .doc-section p {
            line-height: 1.6;
        }
        /* Child selector */
        .doc-section > ul {
            padding-left: 25px;
        }
        /* Adjacent sibling selector */
        h2 + p {
            font-weight: bold;
        }
        /* General sibling selector */
        h2 ~ p {
            color: #555;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <header id="site-header">
        <h1>CSS Selectors Documentation</h1>
        <nav class="main-nav">
            <a href="#selectors">Selectors</a>
            <a href="#combinators">Combinators</a>
        </nav>
    </header>
    <main>
        <section id="selectors" class="doc-section">
            <h2>CSS Selectors</h2>
            <p>
                CSS selectors are used to target HTML elements for styling.
            </p>
            <ul class="topic-list">
                <li>Basic Selectors</li>
                <li>Attribute Selectors</li>
                <li>Pseudo-Classes</li>
            </ul>
        </section>
        <section id="combinators" class="doc-section">
            <h2>CSS Combinators</h2>
            <p>
                Combinators describe relationships between elements.
            </p>
            <p>
                The adjacent sibling selector targets the next sibling.
            </p>
            <p>
                The general sibling selector targets matching siblings
                that follow.
            </p>
        </section>
    </main>
</body>
</html>
<!--Driver Code Ends-->
Here:
- .doc-section p selects paragraphs inside the section.
- .doc-section > ul selects aul that is a direct child.
- h2 + p selects the paragraph immediately after anh2 .
- h2 ~ p selects matching paragraphs that follow theh2 and share the same parent.
This also corrects the original article's General Sibling example, where h2 + p was repeated instead of using the general sibling combinator. 
3. Add Attribute Selectors, Pseudo-Classes, and Pseudo-Elements
Add navigation links and a feedback form. Use attribute selectors, pseudo-classes, and pseudo-elements to style different elements without adding extra classes.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Selectors Documentation</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #222;
        }
        #site-header {
            padding: 25px;
            background-color: #172b4d;
            color: white;
        }
        .main-nav {
            padding: 15px;
            background-color: white;
        }
        .main-nav a {
            margin-right: 18px;
            color: #1769aa;
            text-decoration: none;
        }
        /* Attribute selectors */
        a[href^="#"] {
            text-decoration: underline;
        }
        a[target="_blank"] {
            font-weight: bold;
        }
        input[type="email"] {
            border-left: 4px solid #1769aa;
        }
        /* Pseudo-classes */
        .main-nav a:hover {
            color: #e85d04;
        }
        input:focus,
        textarea:focus {
            outline: 2px solid #1769aa;
        }
        .topic-list li:first-child {
            font-weight: bold;
        }
        .topic-list li:last-child {
            color: #1769aa;
        }
        .topic-list li:not(:first-child) {
            margin-top: 6px;
        }
        /* Pseudo-elements */
        .doc-section h2::before {
            content: "› ";
        }
        a[target="_blank"]::after {
            content: " ↗";
        }
        .doc-section p:first-of-type::first-letter {
            font-size: 28px;
            font-weight: bold;
        }
        .doc-section p:first-of-type::first-line {
            font-weight: 600;
        }
<!--Driver Code Ends-->
        input::placeholder,
        textarea::placeholder {
            color: #777;
            font-style: italic;
        }
        main {
            max-width: 850px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .doc-section,
        .feedback {
            margin-bottom: 25px;
            padding: 25px;
            background-color: white;
            border: 1px solid #d8dde3;
        }
        .doc-section p {
            line-height: 1.6;
        }
        .feedback input,
        .feedback textarea {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #aaa;
        }
        .feedback textarea {
            min-height: 100px;
        }
        .feedback button {
            padding: 10px 18px;
            border: 0;
            background-color: #1769aa;
            color: white;
        }
        .feedback button:hover {
            background-color: #0f4f80;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <header id="site-header">
        <h1>CSS Selectors Documentation</h1>
        <nav class="main-nav">
            <a href="#selectors">Selectors</a>
            <a href="#combinators">Combinators</a>
            <a href="#specificity">Specificity</a>
        </nav>
    </header>
    <main>
        <section id="selectors" class="doc-section">
            <h2>CSS Selectors</h2>
            <p>
                CSS selectors are used to target HTML elements for styling.
            </p>
            <p>
                Different selectors can target elements by their type,
                class, ID, attributes, or position in the document.
            </p>
            <ul class="topic-list">
                <li>Basic Selectors</li>
                <li>Attribute Selectors</li>
                <li>Pseudo-Classes</li>
                <li>Pseudo-Elements</li>
            </ul>
        </section>
        <section id="combinators" class="doc-section">
            <h2>CSS Combinators</h2>
            <p>
                Combinators describe relationships between elements.
            </p>
            <p>
                They allow selectors to target elements based on
                their relationship with other elements.
            </p>
        </section>
        <section class="doc-section">
            <h2>External Resources</h2>
            <p>
                Visit the following examples to practice selectors.
            </p>
            <a href="#selectors">Selector Example</a>
            <a href="#combinators" target="_blank">
                Combinator Example
            </a>
        </section>
        <section class="feedback">
            <h2>Send Feedback</h2>
            <input
                type="text"
                placeholder="Enter your name"
            >
            <input
                type="email"
                placeholder="Enter your email"
            >
            <textarea
                placeholder="Write your feedback"
            ></textarea>
            <button type="submit">Submit Feedback</button>
        </section>
    </main>
</body>
</html>
<!--Driver Code Ends-->
This combines the original Attribute Selectors, Pseudo-Classes, and Pseudo-Elements steps instead of making three separate small steps. Those concepts are all part of the selector practice already present in the source article.
4. Demonstrate CSS Specificity
Add a special note and apply two selectors to the same element to demonstrate specificity.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Specificity</title>
    <style>
<!--Driver Code Ends-->
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
        }
        .doc-section {
            width: 700px;
            margin: 50px auto;
            padding: 25px;
            background-color: white;
            border: 1px solid #d8dde3;
        }
        .important-note {
            color: #1769aa;
        }
        #main-note {
            color: #d62828;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
    <section class="doc-section">
        <h2>CSS Specificity</h2>
        <p>
            Specificity determines which declaration wins
            when multiple selectors match an element.
        </p>
        <p class="important-note" id="main-note">
            Always test your selectors carefully.
        </p>
    </section>
</body>
</html>
<!--Driver Code Ends-->
Both .important-note and #main-note target the same paragraph, but the ID selector has higher specificity than the class selector. Therefore, the paragraph becomes red. This keeps the original practical specificity example. 
Final Source Code
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSS Selectors Documentation</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #222;
        }
        a {
            color: #1769aa;
        }
        #site-header {
            padding: 25px;
            background-color: #172b4d;
            color: white;
        }
        #site-header h1 {
            margin: 0 0 15px;
        }
        .main-nav {
            padding: 15px;
            background-color: #ffffff;
        }
        .main-nav a {
            margin-right: 18px;
            text-decoration: none;
        }
        a[href^="#"] {
            text-decoration: underline;
        }
        a[target="_blank"] {
            font-weight: bold;
        }
        input[type="email"] {
            border-left: 4px solid #1769aa;
        }
        main {
            max-width: 850px;
            margin: 30px auto;
            padding: 0 20px;
        }
        .doc-section {
            margin-bottom: 25px;
            padding: 25px;
            background-color: white;
            border: 1px solid #d8dde3;
        }
        .doc-section p {
            line-height: 1.6;
        }
        .doc-section > ul {
            padding-left: 25px;
        }
        h2 + p {
            font-weight: bold;
        }
        h2 ~ p {
            color: #555;
        }
        .main-nav a:hover {
            color: #e85d04;
        }
        input:focus,
        textarea:focus {
            outline: 2px solid #1769aa;
        }
        .topic-list li:first-child {
            font-weight: bold;
        }
        .topic-list li:last-child {
            color: #1769aa;
        }
        .topic-list li:not(:first-child) {
            margin-top: 6px;
        }
        .doc-section h2::before {
            content: "› ";
        }
        a[target="_blank"]::after {
            content: " ↗";
        }
        .doc-section p:first-of-type::first-letter {
            font-size: 28px;
            font-weight: bold;
        }
        .doc-section p:first-of-type::first-line {
            font-weight: 600;
        }
        input::placeholder,
        textarea::placeholder {
            color: #777;
            font-style: italic;
        }
        .important-note {
            color: #1769aa;
        }
        #main-note {
            color: #d62828;
        }
        .reference-links {
            margin-top: 20px;
        }
        .reference-links a {
            display: inline-block;
            margin-right: 15px;
        }
        .feedback {
            margin-bottom: 30px;
            padding: 25px;
            background-color: white;
            border: 1px solid #d8dde3;
        }
        .feedback input,
        .feedback textarea {
            display: block;
            width: 100%;
            margin: 10px 0;
            padding: 10px;
            border: 1px solid #aaa;
        }
        .feedback textarea {
            min-height: 100px;
        }
        .feedback button {
            padding: 10px 18px;
            border: 0;
            background-color: #1769aa;
            color: white;
        }
        .feedback button:hover {
            background-color: #0f4f80;
        }
        footer {
            padding: 20px;
            text-align: center;
            background-color: #172b4d;
            color: white;
        }
    </style>
</head>
<body>
    <header id="site-header">
        <h1>CSS Selectors Documentation</h1>
        <nav class="main-nav">
            <a href="#selectors">Selectors</a>
            <a href="#combinators">Combinators</a>
            <a href="#specificity">Specificity</a>
            <a href="#feedback" target="_blank">Practice</a>
        </nav>
    </header>
    <main>
        <section
            id="selectors"
            class="doc-section"
        >
            <h2>CSS Selectors</h2>
            <p>
                CSS selectors target elements so that styles
                can be applied to specific elements.
            </p>
            <p>
                Selectors can target elements by their type,
                class, ID, attributes, or state.
            </p>
            <ul class="topic-list">
                <li>Universal Selector</li>
                <li>Element Selector</li>
                <li>Class Selector</li>
                <li>ID Selector</li>
                <li>Attribute Selector</li>
                <li>Pseudo-Class</li>
                <li>Pseudo-Element</li>
            </ul>
        </section>
        <section
            id="combinators"
            class="doc-section"
        >
            <h2>CSS Combinators</h2>
            <p>
                Combinators describe relationships between
                elements in a document.
            </p>
            <p>
                They allow selectors to target elements
                based on their relationship with other elements.
            </p>
            <p>
                The main combinators are descendant, child,
                adjacent sibling, and general sibling.
            </p>
            <ul class="topic-list">
                <li>Descendant Combinator</li>
                <li>Child Combinator</li>
                <li>Adjacent Sibling Combinator</li>
                <li>General Sibling Combinator</li>
            </ul>
        </section>
        <section
            id="specificity"
            class="doc-section"
        >
            <h2>CSS Specificity</h2>
            <p>
                Specificity determines which declaration wins
                when multiple selectors match an element.
            </p>
            <p>
                IDs have higher specificity than classes,
                while classes have higher specificity than
                element selectors.
            </p>
            <p
                class="important-note"
                id="main-note"
            >
                This paragraph demonstrates selector specificity.
            </p>
        </section>
        <section class="doc-section">
            <h2>Attribute Selectors</h2>
            <p>
                Attribute selectors target elements according
                to their attributes or attribute values.
            </p>
            <div class="reference-links">
                <a href="#selectors">
                    Selector Example
                </a>
                <a
                    href="#combinators"
                    target="_blank"
                >
                    Combinator Example
                </a>
            </div>
        </section>
        <section
            class="feedback"
            id="feedback"
        >
            <h2>Practice Feedback</h2>
            <input
                type="text"
                placeholder="Enter your name"
            >
            <input
                type="email"
                placeholder="Enter your email"
            >
            <textarea
                placeholder="Write your feedback"
            ></textarea>
            <button type="submit">
                Submit Feedback
            </button>
        </section>
    </main>
    <footer>
        <p>
            CSS Selectors Practice © 2026
        </p>
    </footer>
</body>
</html>
Output
Note:
- CSS selectors target HTML elements in different ways.
- Combinators select elements based on their relationship with other elements.
- Attribute selectors can target elements using their attributes.
- Pseudo-classes style elements based on their state or position.
- Pseudo-elements add visual content or style part of an element.
- Specificity determines which style is applied when multiple selectors match an element.
