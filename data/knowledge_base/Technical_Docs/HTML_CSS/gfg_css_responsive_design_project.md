# CSS Responsive Design Project

> Source: https://www.geeksforgeeks.org/css/css-responsive-design-project

Create a responsive cafe website that works well on desktop, tablet, and mobile screens.
The page will contain a header, navigation menu, cafe information, menu cards, a fixed contact button, and a footer. The project will use the Responsive Design module concepts such as website layout, box model, media queries, flexible images, positioning, nesting, and grouping.
Requirements
- Create a complete cafe webpage.
- Use a header, navigation, content sections, and footer.
- Make the layout responsive for different screen sizes.
- Use flexible widths and images.
-  Use box-sizing: border-box for predictable sizing.
- Use positioning for the contact button.
- Use CSS nesting through parent-child selectors and grouping to reduce repeated styles.
- Keep everything in one HTML file.
Module Articles Used
Step-by-Step Implementation
1. Create the Website Structure
First, create the main layout with a header, navigation menu, content area, cafe sections, and footer.
<header>
    <h1>GeeksforGeeks Cafe</h1>
    <p>Fresh Coffee. Simple Moments.</p>
</header>
<nav>
    <a href="#">Home</a>
    <a href="#">Menu</a>
    <a href="#">About</a>
    <a href="#">Contact</a>
</nav>
<main>
    <section class="intro">
        <h2>Welcome to Cafe</h2>
        <p>
            Enjoy freshly brewed coffee, homemade snacks,
            and a comfortable place to relax.
        </p>
    </section>
    <section class="menu">
        <h2>Our Menu</h2>
        <div class="menu-item">
            <h3>Classic Coffee</h3>
            <p>Freshly brewed coffee with a rich taste.</p>
            <strong>₹120</strong>
        </div>
        <div class="menu-item">
            <h3>Cold Coffee</h3>
            <p>Chilled coffee served with a smooth finish.</p>
            <strong>₹160</strong>
        </div>
        <div class="menu-item">
            <h3>Chocolate Cake</h3>
            <p>Soft chocolate cake made for coffee lovers.</p>
            <strong>₹180</strong>
        </div>
    </section>
</main>
<footer>
    <p>© 2026 GeeksforGeeks Cafe</p>
</footer>
<a href="#" class="contact-button">Contact Us</a>
2. Build the Main Layout and Box Model
Now style the header, navigation, content, menu items, and footer. The layout uses the website-layout and box-model concepts.
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
            background-color: #f5f1eb;
            color: #333;
        }
        header {
            padding: 30px;
            background-color: #5b3924;
            color: white;
            text-align: center;
        }
        header h1,
        header p {
            margin: 8px;
        }
        nav {
            overflow: hidden;
            background-color: #382317;
        }
        nav a {
            float: left;
            display: block;
            padding: 16px 22px;
            color: white;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #70472c;
        }
        main {
            width: 90%;
            max-width: 1000px;
            margin: 30px auto;
        }
        .intro {
            padding: 25px;
            background-color: white;
            border: 2px solid #ddd0c3;
            text-align: center;
        }
        .intro img {
            max-width: 100%;
            height: auto;
            margin-top: 15px;
        }
        .menu {
            margin-top: 25px;
            padding: 25px;
            background-color: white;
            border: 2px solid #ddd0c3;
            overflow: hidden;
        }
        .menu h2 {
            text-align: center;
        }
        .menu-item {
            float: left;
            width: 31.33%;
            margin: 1%;
            padding: 20px;
            background-color: #f8eee4;
            border: 1px solid #d8c0aa;
        }
        .menu-item h3,
        .menu-item p,
        .menu-item strong {
            display: block;
            margin: 10px 0;
        }
        footer {
            margin-top: 30px;
            padding: 20px;
            background-color: #382317;
            color: white;
            text-align: center;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
<header>
    <h1>GeeksforGeeks Cafe</h1>
    <p>Fresh Coffee. Simple Moments.</p>
</header>
<nav>
    <a href="#">Home</a>
    <a href="#">Menu</a>
    <a href="#">About</a>
    <a href="#">Contact</a>
</nav>
<main>
    <section class="intro">
        <h2>Welcome to Cafe</h2>
        <p>
            Enjoy freshly brewed coffee, homemade snacks,
            and a comfortable place to relax.
        </p>
    </section>
    <section class="menu">
        <h2>Our Menu</h2>
        <div class="menu-item">
            <h3>Classic Coffee</h3>
            <p>Freshly brewed coffee with a rich taste.</p>
            <strong>₹120</strong>
        </div>
        <div class="menu-item">
            <h3>Cold Coffee</h3>
            <p>Chilled coffee served with a smooth finish.</p>
            <strong>₹160</strong>
        </div>
        <div class="menu-item">
            <h3>Chocolate Cake</h3>
            <p>Soft chocolate cake made for coffee lovers.</p>
            <strong>₹180</strong>
        </div>
    </section>
</main>
<footer>
    <p>© 2026 GeeksforGeeks Cafe</p>
</footer>
</body>
</html>
<!--Driver Code Ends-->
3. Add Positioning and Responsive Design
The contact button can stay visible while scrolling using fixed positioning. Media queries then change the layout for smaller screens.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Previous CSS */
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f1eb;
            color: #333;
        }
        header {
            padding: 30px;
            background-color: #5b3924;
            color: white;
            text-align: center;
        }
        header h1,
        header p {
            margin: 8px;
        }
        nav {
            overflow: hidden;
            background-color: #382317;
        }
        nav a {
            float: left;
            display: block;
            padding: 16px 22px;
            color: white;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #70472c;
        }
        main {
            width: 90%;
            max-width: 1000px;
            margin: 30px auto;
        }
        .intro {
            padding: 25px;
            background-color: white;
            border: 2px solid #ddd0c3;
            text-align: center;
        }
        .intro img {
            max-width: 100%;
            height: auto;
            margin-top: 15px;
        }
        .menu {
            margin-top: 25px;
            padding: 25px;
            background-color: white;
            border: 2px solid #ddd0c3;
            overflow: hidden;
        }
        .menu h2 {
            text-align: center;
        }
        .menu-item {
            float: left;
            width: 31.33%;
            margin: 1%;
            padding: 20px;
            background-color: #f8eee4;
            border: 1px solid #d8c0aa;
        }
        .menu-item h3,
        .menu-item p,
        .menu-item strong {
            display: block;
            margin: 10px 0;
        }
        footer {
            margin-top: 30px;
            padding: 20px;
            background-color: #382317;
            color: white;
            text-align: center;
        }
<!--Driver Code Ends-->
        .contact-button {
            position: fixed;
            right: 20px;
            bottom: 20px;
            padding: 12px 20px;
            background-color: #c56b2d;
            color: white;
            text-decoration: none;
            border: 2px solid #a65320;
        }
        @media screen and (max-width: 768px) {
            .menu-item {
                width: 48%;
            }
            nav a {
                padding: 14px;
            }
        }
        @media screen and (max-width: 500px) {
            header {
                padding: 20px;
            }
            main {
                width: 94%;
            }
            nav a {
                float: none;
                text-align: center;
            }
            .menu-item {
                float: none;
                width: 100%;
                margin: 10px 0;
            }
            .contact-button {
                right: 10px;
                bottom: 10px;
            }
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
<header>
    <h1>GeeksforGeeks Cafe</h1>
    <p>Fresh Coffee. Simple Moments.</p>
</header>
<nav>
    <a href="#">Home</a>
    <a href="#">Menu</a>
    <a href="#">About</a>
    <a href="#">Contact</a>
</nav>
<main>
    <section class="intro">
        <h2>Welcome to Cafe</h2>
        <p>
            Enjoy freshly brewed coffee, homemade snacks,
            and a comfortable place to relax.
        </p>
        <img
                src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png">
    </section>
    <section class="menu">
        <h2>Our Menu</h2>
        <div class="menu-item">
            <h3>Classic Coffee</h3>
            <p>Freshly brewed coffee with a rich taste.</p>
            <strong>₹120</strong>
        </div>
        <div class="menu-item">
            <h3>Cold Coffee</h3>
            <p>Chilled coffee served with a smooth finish.</p>
            <strong>₹160</strong>
        </div>
        <div class="menu-item">
            <h3>Chocolate Cake</h3>
            <p>Soft chocolate cake made for coffee lovers.</p>
            <strong>₹180</strong>
        </div>
    </section>
</main>
<footer>
    <p>© 2026 GeeksforGeeks Cafe</p>
</footer>
<a href="#" class="contact-button">Contact Us</a>
</body>
</html>
<!--Driver Code Ends-->
This makes the three menu items appear in columns on larger screens, two columns on medium screens, and one column on smaller screens.
4. Combine Nesting and Grouping
Use parent-child selectors to style related elements and group selectors when several elements need the same styling.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        /* Previous CSS remains here */
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f1eb;
            color: #333;
        }
        header {
            padding: 30px;
            background-color: #5b3924;
            color: white;
            text-align: center;
        }
        header h1,
        header p {
            margin: 8px;
        }
        nav {
            overflow: hidden;
            background-color: #382317;
        }
        nav a {
            float: left;
            display: block;
            padding: 16px 22px;
            color: white;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #70472c;
        }
        main {
            width: 90%;
            max-width: 1000px;
            margin: 30px auto;
        }
        .intro {
            padding: 25px;
            background-color: white;
            border: 2px solid #ddd0c3;
            text-align: center;
        }
        .intro img {
            max-width: 100%;
            height: auto;
            margin-top: 15px;
        }
        .menu {
            margin-top: 25px;
            padding: 25px;
            background-color: white;
            border: 2px solid #ddd0c3;
            overflow: hidden;
        }
        .menu h2 {
            text-align: center;
        }
        .menu-item {
            float: left;
            width: 31.33%;
            margin: 1%;
            padding: 20px;
            background-color: #f8eee4;
            border: 1px solid #d8c0aa;
        }
        .menu-item h3,
        .menu-item p,
        .menu-item strong {
            display: block;
            margin: 10px 0;
        }
        footer {
            margin-top: 30px;
            padding: 20px;
            background-color: #382317;
            color: white;
            text-align: center;
        }
        .contact-button {
            position: fixed;
            right: 20px;
            bottom: 20px;
            padding: 12px 20px;
            background-color: #c56b2d;
            color: white;
            text-decoration: none;
            border: 2px solid #a65320;
        }
        @media screen and (max-width: 768px) {
            .menu-item {
                width: 48%;
            }
            nav a {
                padding: 14px;
            }
        }
        @media screen and (max-width: 500px) {
            header {
                padding: 20px;
            }
            main {
                width: 94%;
            }
            nav a {
                float: none;
                text-align: center;
            }
            .menu-item {
                float: none;
                width: 100%;
                margin: 10px 0;
            }
            .contact-button {
                right: 10px;
                bottom: 10px;
            }
        }
<!--Driver Code Ends-->
        .intro h2,
        .menu h2 {
            color: #5b3924;
        }
        .menu-item h3,
        .menu-item strong {
            color: #8b4d25;
        }
        header h1,
        header p {
            text-align: center;
        }
<!--Driver Code Starts-->
    </style>
</head>
<body>
<header>
    <h1>GeeksforGeeks Cafe</h1>
    <p>Fresh Coffee. Simple Moments.</p>
</header>
<nav>
    <a href="#">Home</a>
    <a href="#">Menu</a>
    <a href="#">About</a>
    <a href="#">Contact</a>
</nav>
<main>
    <section class="intro">
        <h2>Welcome to Cafe</h2>
        <p>
            Enjoy freshly brewed coffee, homemade snacks,
            and a comfortable place to relax.
        </p>
        <img
                src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png">
       
    </section>
    <section class="menu">
        <h2>Our Menu</h2>
        <div class="menu-item">
            <h3>Classic Coffee</h3>
            <p>Freshly brewed coffee with a rich taste.</p>
            <strong>₹120</strong>
        </div>
        <div class="menu-item">
            <h3>Cold Coffee</h3>
            <p>Chilled coffee served with a smooth finish.</p>
            <strong>₹160</strong>
        </div>
        <div class="menu-item">
            <h3>Chocolate Cake</h3>
            <p>Soft chocolate cake made for coffee lovers.</p>
            <strong>₹180</strong>
        </div>
    </section>
</main>
<footer>
    <p>© 2026 GeeksforGeeks</p>
</footer>
<a href="#" class="contact-button">Contact Us</a>
</body>
</html>
<!--Driver Code Ends-->
These selectors keep related styles together and avoid repeating the same declarations.
Final Source Code
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GeeksforGeeks Cafe</title>
    <style>
        * {
            box-sizing: border-box;
        }
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #f5f1eb;
            color: #333;
        }
        header {
            padding: 30px;
            background-color: #5b3924;
            color: white;
            text-align: center;
        }
        header h1,
        header p {
            margin: 8px;
        }
        nav {
            overflow: hidden;
            background-color: #382317;
        }
        nav a {
            float: left;
            display: block;
            padding: 16px 22px;
            color: white;
            text-decoration: none;
        }
        nav a:hover {
            background-color: #70472c;
        }
        main {
            width: 90%;
            max-width: 1000px;
            margin: 30px auto;
        }
        .intro {
            padding: 25px;
            background-color: white;
            border: 2px solid #ddd0c3;
            text-align: center;
        }
        .intro img {
            max-width: 100%;
            height: auto;
            margin-top: 15px;
        }
        .menu {
            margin-top: 25px;
            padding: 25px;
            background-color: white;
            border: 2px solid #ddd0c3;
            overflow: hidden;
        }
        .intro h2,
        .menu h2 {
            color: #5b3924;
        }
        .menu h2 {
            text-align: center;
        }
        .menu-item {
            float: left;
            width: 31.33%;
            margin: 1%;
            padding: 20px;
            background-color: #f8eee4;
            border: 1px solid #d8c0aa;
        }
        .menu-item h3,
        .menu-item p,
        .menu-item strong {
            display: block;
            margin: 10px 0;
        }
        .menu-item h3,
        .menu-item strong {
            color: #8b4d25;
        }
        footer {
            margin-top: 30px;
            padding: 20px;
            background-color: #382317;
            color: white;
            text-align: center;
        }
        .contact-button {
            position: fixed;
            right: 20px;
            bottom: 20px;
            padding: 12px 20px;
            background-color: #c56b2d;
            color: white;
            text-decoration: none;
            border: 2px solid #a65320;
        }
        @media screen and (max-width: 768px) {
            .menu-item {
                width: 48%;
            }
            nav a {
                padding: 14px;
            }
        }
        @media screen and (max-width: 500px) {
            header {
                padding: 20px;
            }
            main {
                width: 94%;
            }
            nav a {
                float: none;
                text-align: center;
            }
            .menu-item {
                float: none;
                width: 100%;
                margin: 10px 0;
            }
            .contact-button {
                right: 10px;
                bottom: 10px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>GeeksforGeeks Cafe</h1>
        <p>Fresh Coffee. Simple Moments.</p>
    </header>
    <nav>
        <a href="#">Home</a>
        <a href="#">Menu</a>
        <a href="#">About</a>
        <a href="#">Contact</a>
    </nav>
    <main>
        <section class="intro">
            <h2>Welcome to Cafe</h2>
            <p>
                Enjoy freshly brewed coffee, homemade snacks,
                and a comfortable place to relax.
            </p>
            <img
                src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png"
                alt="Cafe interior"
            >
        </section>
        <section class="menu">
            <h2>Our Menu</h2>
            <div class="menu-item">
                <h3>Classic Coffee</h3>
                <p>Freshly brewed coffee with a rich taste.</p>
                <strong>₹120</strong>
            </div>
            <div class="menu-item">
                <h3>Cold Coffee</h3>
                <p>Chilled coffee served with a smooth finish.</p>
                <strong>₹160</strong>
            </div>
            <div class="menu-item">
                <h3>Chocolate Cake</h3>
                <p>Soft chocolate cake made for coffee lovers.</p>
                <strong>₹180</strong>
            </div>
        </section>
    </main>
    <footer>
        <p>© 2026 GeeksforGeeks Cafe</p>
    </footer>
    <a href="#" class="contact-button">Contact Us</a>
</body>
</html>
