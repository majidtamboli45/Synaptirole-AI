# Most Commonly Used Tags in HTML

> Source: https://www.geeksforgeeks.org/html/most-commonly-used-tags-in-html

HTML tags are the fundamental building blocks of web development, providing the structure and organization necessary for creating web pages.
- They include tags for headings, paragraphs, links, images, and more.
- Commonly used tags like <html>, <head>, and <body> are essential for creating a well-structured web document.
- These tags provide the framework for building user-friendly and accessible web pages.
<!DOCTYPE html>
<html>
<body>
    <h1>Welcome to My Website</h1>
    <p>This is a paragraph introducing the content of my website.</p>
    <a href="https://www.geeksforgeeks.org/">Visit GeeksforGeeks</a>
</body>
</html>
- The <h1> tag defines a top-level heading, which serves as the main title of the webpage.
- The <p> tag defines a paragraph, providing a block of text to introduce the website's content.
- The <a> tag defines a hyperlink, allowing users to navigate to another webpage, in this case, "https://www.geeksforgeeks.org/".
Document structure tag
The <html> tag is essential, encapsulating the entire HTML document and serving as the root element for content organization.
| Structure Tag | Syntax | Description | 
|---|---|---|
| <html> | <html> Statements... </html> | The root of the HTML document specifies it as HTML. | 
| <head> | <head> Statements... </head> | Contains head elements such as title, style, and meta tags in the HTML file. | 
| <title> | <title> Statements... </title> | Defines the title of an HTML document. | 
| <body> | <body> Statements... </body> | Defines the body of an HTML document, containing content like images, tables, and lists. | 
Commonly used tags in HTML
| HTML Tag | Syntax | Description | 
|---|---|---|
| <div> | <div>...</div> | Defines a division or section in an HTML document. | 
| <p> | <p>...</p> | Defines a paragraph. | 
| <a> | <a href="...">...</a> | Defines a hyperlink. | 
| <img> | <img src="..." alt="..."> | Embeds an image. | 
| <ul> | <ul><li>...</li></ul> | Defines an unordered list. | 
| <ol> | <ol><li>...</li></ol> | Defines an ordered list. | 
| <li> | <li>...</li> | Defines a list item. | 
| <table> | <table>...</table> | Defines a table. | 
| <tr> | <tr>...</tr> | Defines a table row. | 
| <th> | <th>...</th> | Defines a table header cell. | 
| <td> | <td>...</td> | Defines a table data cell. | 
| <form> | <form>...</form> | Defines an HTML form for user input. | 
| <input> | <input type="..."> | Defines an input control within a form. | 
| <button> | <button>...</button> | Defines a clickable button. | 
| <h1> -<h6> | <h1>...</h1> | Define headings of different levels. | 
| <span> | <span>...</span> | Defines a generic inline container. | 
| <label> | <label for="...">...</label> | Defines a label for an input element. | 
| <iframe> | <iframe src="..."></iframe> | Embeds an inline frame for external content. | 
Use of Basic HTML Structure Tags
<!DOCTYPE html>
<html>
<head>
    <title>My First Web Page</title>
</head>
<body>
    <h1>Welcome to My Website</h1>
</body>
</html>
- The <html> tag defines the root element of the HTML document, encompassing all content.
- The <head> tag contains meta-information about the document, such as its title.
- The <body> tag includes all visible content displayed on the webpage.
Styling Text with HTML Tags
<!DOCTYPE html>
<html>
<body>
    <h1 style="color: green;">Welcome to Geeks for Geeks</h1>
    <p style="font-size: 16px;">Geeks for Geeks is a computer science portal for geeks.</p>
    <a href="https://www.geeksforgeeks.org/" style="text-decoration: none; color: blue;">
      Visit Geeks for Geeks</a>
</body>
</html>
- The <p> tag defines a paragraph with a font size of 16px, providing a brief description.
- The <a> tag creates a hyperlink with blue text and no underline, directing users to the Geeks for Geeks website.
Creating a Course List with HTML Tags
<!DOCTYPE html>
<html>
<body>
    <h2 style="font-family: Arial, sans-serif;">Available Courses</h2>
    <ul>
        <li>Web Development</li>
        <li>Data Structures</li>
        <li>Machine Learning</li>
    </ul>
</body>
</html>
- The <h2> tag creates a subheading with a specified font family, titled "Available Courses."
- The <ul> tag defines an unordered list, and <li> tags represent individual list items, each naming a course.
Best Practices for Commonly Used HTML Tags
- Implementing best practices when using HTML tags ensures your web content is well-structured, accessible, and SEO-friendly. Here are key guidelines to consider:
- Use Semantic Tags: Employ tags like <header>, <nav>, <article>, and <footer> to clearly define the structure of your content, enhancing readability and SEO.
- Ensure Proper Nesting: Maintain correct nesting of tags to prevent rendering issues and ensure the document adheres to HTML standards.
- Use Anchor Text in Links: Use clear and descriptive text within <a> tags to inform users and search engines about the linked content.
