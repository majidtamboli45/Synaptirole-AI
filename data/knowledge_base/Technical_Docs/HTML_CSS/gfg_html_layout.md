# HTML Layout

> Source: https://www.geeksforgeeks.org/html/html-layout

HTML layouts divide a web page into structured sections for better organization and styling. They improve readability, accessibility, and overall user experience.
- Semantic Structure: Uses elements like <header>, <nav>, <main>, <article>, <section>, <aside>, and <footer>.
- Better Organization: Helps arrange content clearly, making pages easier to manage.
- Improved SEO & Accessibility: Enhances search engine understanding and user accessibility.
Syntax:
<header> Content... </header>
<nav> Content... </nav>
<main> Content... </main>
<footer> Content... </footer>
<html>
<body>
	<header>
		<h1>My Website</h1>
	</header>
	<main>
		<p>Welcome to my website!</p>
	</main>
	<footer>
		<p> 2024 My Website</p>
	</footer>
</body></html>
- <header> contains the main heading of the page.
- <main> holds the primary content.
- <footer> includes the footer information.
Layout Components
HTML layouts divide a webpage into structured sections for better organization and readability.
- Header: Top section with title, logo, or links using <header>.
- Navigation Bar: Menu for site links using <nav>.
- Index / Sidebar: Side section for extra content like links or ads.
- Content Section: Main content area using <main>.
- Footer: Bottom section with info using <footer>.
Example 1: Layout with Additional Semantic Tags
<html>
<body>
	<header>
		<h1>My Blog</h1>
	</header>
	<nav>
		<a href="#">Home</a> | <a href="#">About</a> | <a href="#">Contact</a>
	</nav>
	<section>
		<h2>Latest Posts</h2>
		<article>
			<h3>Post Title</h3>
			<p>This is a brief introduction to the blog post.</p>
		</article>
	</section>
	<aside>
		<h2>About Me</h2>
		<p>Short bio or profile information.</p>
	</aside>
	<footer>
		<p>© 2026 My Blog</p>
	</footer>
</body>
</html>
- <nav> provides navigation links for the website.
- <section> groups related content, here titled "Latest Posts."
- <article> represents an individual blog post.
- <aside> contains supplementary information, such as an "About Me" section.
Example 2: Styled Layout with Semantic Tags
<html >
<head>
	<style>
		header {
			background-color: #4caf50;
			color: white;
			text-align: center;
			padding: 1em;
		}
		nav {
			background-color: #333;
			overflow: hidden;
		}
		main {
			padding: 20px;
		}
		footer {
			background-color: #4caf50;
			color: white;
			text-align: center;
			padding: 1em;
		}
	</style>
</head>
<body>
	<header>
		<h1>Styled Page</h1>
	</header>
	<nav>
		<a href="#">Home</a>
		<a href="#">Services</a>
		<a href="#">Contact</a>
	</nav>
	<main>
		<h2>Welcome!</h2>
		<p>This is a simple page.</p>
	</main>
	<footer>
		<p>© 2026 Styled Page</p>
	</footer>
</body>
</html>
- Header: The <header> element contains the main heading of the page, providing a clear introduction.
- Main: The <main> element holds the primary content, ensuring semantic clarity and improved accessibility.
Techniques for Creating HTML Layouts
There are several techniques to create multi-column layouts in HTML:
- CSS Frameworks (like Bootstrap): CSS frameworks like Bootstrap help speed up layout design using pre-built components and grid systems.
- CSS Float Property: The CSS Float Property is used to position elements, though it requires careful handling to avoid layout issues.
- CSS Flexbox: CSS Flexbox is used to create responsive and dynamic layouts by aligning and distributing space efficiently.
- CSS Grid: CSS Grid allows developers to create complex two-dimensional layouts with better control over element placement.
Best Practices for HTML Layout
Follow these practices to create clean, structured, and responsive web page layouts.
- Keep layout simple and clean by avoiding deeply nested elements and unnecessary divs.
- Use CSS for styling and positioning instead of relying on HTML structure for layout design.
- Ensure responsiveness by designing layouts that adapt well to different screen sizes using flexible units and media queries.
