# CSS Logic Implementations Project

> Source: https://www.geeksforgeeks.org/css/css-logic-implementations-project

Create a responsive digital magazine webpage for a technology magazine.
The page should contain a magazine heading and three technology articles. Each article should be automatically numbered using CSS counters. The article content should be displayed in multiple columns on larger screens and change to fewer columns on smaller screens.
Use logical properties for spacing and borders, and use CSS math functions to make the page width and heading size flexible. Use conditional rules to control the layout based on screen size and browser feature support.
Module Articles Used
Step-by-Step Implementation
1. Create the Magazine Structure
Create a heading, introduction, and several article sections. The article content will later be divided into columns.
<header>
    <h1>Tech Weekly</h1>
    <p>Simple Ideas. Useful Technology.</p>
</header>
<main>
    <section class="magazine">
        <h2>Web Development</h2>
        <article>
            <h3>Building Better Websites</h3>
            <p>
                Modern websites should be simple, useful, and easy to
                use across different screen sizes.
            </p>
            <p>
                A well-organized layout helps readers find information
                quickly and makes content easier to understand.
            </p>
        </article>
        <article>
            <h3>Responsive Design</h3>
            <p>
                Responsive layouts allow content to adapt to different
                screen sizes without creating separate pages.
            </p>
            <p>
                Flexible sizing and responsive rules help provide a
                better reading experience on different devices.
            </p>
        </article>
        <article>
            <h3>Modern CSS</h3>
            <p>
                CSS provides many features for creating flexible layouts,
                including mathematical functions and logical properties.
            </p>
            <p>
                These features can make styles easier to adapt and
                maintain.
            </p>
        </article>
    </section>
</main>
<footer>
    <p>© 2026 Tech Weekly</p>
</footer>
2. Add Counters and Multiple Columns
Use a CSS counter to automatically number each article. Then use the multiple-column properties to create the magazine layout.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <style>
<!--Driver Code Ends-->
        body {
            counter-reset: article;
        }
        article h3::before {
            counter-increment: article;
            content: "Article " counter(article) ": ";
        }
        .magazine {
            column-count: 2;
            column-gap: 30px;
            column-rule: 1px solid #ccc;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
<header>
    <h1>Tech Weekly</h1>
    <p>Simple Ideas. Useful Technology.</p>
</header>
<main>
    <section class="magazine">
        <h2>Web Development</h2>
        <article>
            <h3>Building Better Websites</h3>
            <p>
                Modern websites should be simple, useful, and easy to
                use across different screen sizes.
            </p>
            <p>
                A well-organized layout helps readers find information
                quickly and makes content easier to understand.
            </p>
        </article>
        <article>
            <h3>Responsive Design</h3>
            <p>
                Responsive layouts allow content to adapt to different
                screen sizes without creating separate pages.
            </p>
            <p>
                Flexible sizing and responsive rules help provide a
                better reading experience on different devices.
            </p>
        </article>
        <article>
            <h3>Modern CSS</h3>
            <p>
                CSS provides many features for creating flexible layouts,
                including mathematical functions and logical properties.
            </p>
            <p>
                These features can make styles easier to adapt and
                maintain.
            </p>
        </article>
    </section>
</main>
<footer>
    <p>© 2026 Tech Weekly</p>
</footer>
</body>
</html>
<!--Driver Code Ends-->
The article numbers are generated automatically, so adding another article does not require manually changing the numbers
3. Add Logical Properties, Math Functions, and Conditional Rules
Now make the layout more flexible using logical properties and CSS math functions. Conditional rules will adjust the layout on smaller screens and apply styles when a feature is supported.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
<!--Driver Code Ends-->
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #333;
            counter-reset: article;
        }
        header {
            padding-block: 30px;
            padding-inline: 5%;
            background-color: #234;
            color: white;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: clamp(28px, 5vw, 42px);
        }
        header p {
            margin-block: 10px 0;
        }
        main {
            width: min(90%, 1000px);
            margin-block: 30px;
            margin-inline: auto;
        }
        .magazine {
            padding-block: 25px;
            padding-inline: 25px;
            background-color: white;
            border-block: 3px solid #234;
            column-count: 2;
            column-gap: 30px;
            column-rule: 1px solid #ccc;
        }
        .magazine h2 {
            column-span: all;
            margin-block-start: 0;
            margin-block-end: 25px;
            color: #234;
            font-size: clamp(24px, 4vw, 36px);
            text-align: center;
        }
        article {
            break-inside: avoid;
            margin-block-end: 25px;
        }
        article h3 {
            margin-block-start: 0;
            color: #345c7d;
        }
        article h3::before {
            counter-increment: article;
            content: "Article " counter(article) ": ";
        }
        article p {
            margin-block: 10px;
            line-height: 1.6;
            text-align: justify;
        }
        footer {
            padding-block: 20px;
            padding-inline: 5%;
            background-color: #234;
            color: white;
            text-align: center;
        }
        @media screen and (max-width: 700px) {
            .magazine {
                column-count: 1;
            }
        }
        @supports (column-span: all) {
            .magazine h2 {
                font-weight: bold;
            }
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
<header>
    <h1>Tech Weekly</h1>
    <p>Simple Ideas. Useful Technology.</p>
</header>
<main>
    <section class="magazine">
        <h2>Web Development</h2>
        <article>
            <h3>Building Better Websites</h3>
            <p>
                Modern websites should be simple, useful, and easy to
                use across different screen sizes.
            </p>
            <p>
                A well-organized layout helps readers find information
                quickly and makes content easier to understand.
            </p>
        </article>
        <article>
            <h3>Responsive Design</h3>
            <p>
                Responsive layouts allow content to adapt to different
                screen sizes without creating separate pages.
            </p>
            <p>
                Flexible sizing and responsive rules help provide a
                better reading experience on different devices.
            </p>
        </article>
        <article>
            <h3>Modern CSS</h3>
            <p>
                CSS provides many features for creating flexible layouts,
                including mathematical functions and logical properties.
            </p>
            <p>
                These features can make styles easier to adapt and
                maintain.
            </p>
        </article>
    </section>
</main>
<footer>
    <p>© 2026 Tech Weekly</p>
</footer>
</body>
</html>
<!--Driver Code Ends-->
Final Source Code
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tech Weekly</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            color: #333;
            counter-reset: article;
        }
        header {
            padding-block: 30px;
            padding-inline: 5%;
            background-color: #234;
            color: white;
            text-align: center;
        }
        header h1 {
            margin: 0;
            font-size: clamp(28px, 5vw, 42px);
        }
        header p {
            margin-block: 10px 0;
        }
        main {
            width: min(90%, 1000px);
            margin-block: 30px;
            margin-inline: auto;
        }
        .magazine {
            padding-block: 25px;
            padding-inline: 25px;
            background-color: white;
            border-block: 3px solid #234;
            column-count: 2;
            column-gap: 30px;
            column-rule: 1px solid #ccc;
        }
        .magazine h2 {
            column-span: all;
            margin-block-start: 0;
            margin-block-end: 25px;
            color: #234;
            font-size: clamp(24px, 4vw, 36px);
            text-align: center;
        }
        article {
            break-inside: avoid;
            margin-block-end: 25px;
        }
        article h3 {
            margin-block-start: 0;
            color: #345c7d;
        }
        article h3::before {
            counter-increment: article;
            content: "Article " counter(article) ": ";
        }
        article p {
            margin-block: 10px;
            line-height: 1.6;
            text-align: justify;
        }
        footer {
            padding-block: 20px;
            padding-inline: 5%;
            background-color: #234;
            color: white;
            text-align: center;
        }
        @media screen and (max-width: 700px) {
            .magazine {
                column-count: 1;
            }
        }
        @supports (column-span: all) {
            .magazine h2 {
                font-weight: bold;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>Tech Weekly</h1>
        <p>Simple Ideas. Useful Technology.</p>
    </header>
    <main>
        <section class="magazine">
            <h2>Web Development</h2>
            <article>
                <h3>Building Better Websites</h3>
                <p>
                    Modern websites should be simple, useful, and easy
                    to use across different screen sizes.
                </p>
                <p>
                    A well-organized layout helps readers find
                    information quickly and makes content easier
                    to understand.
                </p>
            </article>
            <article>
                <h3>Responsive Design</h3>
                <p>
                    Responsive layouts allow content to adapt to
                    different screen sizes without creating separate
                    pages.
                </p>
                <p>
                    Flexible sizing and responsive rules help provide
                    a better reading experience on different devices.
                </p>
            </article>
            <article>
                <h3>Modern CSS</h3>
                <p>
                    CSS provides many features for creating flexible
                    layouts, including mathematical functions and
                    logical properties.
                </p>
                <p>
                    These features can make styles easier to adapt
                    and maintain.
                </p>
            </article>
        </section>
    </main>
    <footer>
        <p>© 2026 Tech Weekly</p>
    </footer>
</body>
</html>
Output
What You Practice
This project brings the five Logic Implementations articles together:
- Automatically numbers each article.
- Create the magazine-style two-column layout.
- Use @media and@supports .
- Use padding-block ,padding-inline ,margin-block , andborder-block .
- Use min() andclamp() for flexible sizing.
