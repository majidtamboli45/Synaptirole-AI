# HTML Basics

> Source: https://www.geeksforgeeks.org/html/html-basics

HTML (HyperText Markup Language) is the standard markup language used to create and structure web pages.
- It defines the layout of a webpage using elements and tags, allowing for the display of text, images, links, and multimedia content.
- As the foundation of nearly all websites, HTML is used in over 95% of all web pages today, making it an essential part of modern web development.
In this guide, we learn the basics of HTML, which includes HTML tags ( <h1>, <p>, <img>, etc), attributes, elements, and document structure which collectively form a working web page.
HTML Basic Document and Structure
Every HTML document begins with a document type declaration, setting the foundation for the webpage. This section introduces basic HTML tags that structure the page, such as <head>, <body>, and <title>. Although this is not mandatory, it is a good convention to start the document with the below-mentioned tag.
Below mentioned are the basic HTML tags that divide the whole page into various parts like head, body, etc.
| Basic HTML Tags for Document Structure |  | 
|---|---|
| Tags | Descriptions | 
| <html> | Encloses the entire HTML document, serving as the root element for all HTML content. | 
| <head> | Contains header information about the webpage, including title, meta tags, and linked stylesheets. It is part of the document's structure but is not displayed on the webpage. | 
| <title> | Used within the <head> section to define the title of the HTML document. It appears in the browser tab or window and provides a brief description of the webpage's content. | 
| <body> | Encloses the visible content of the webpage, such as text, images, audio, videos, and links. All elements within this tag are displayed on the actual webpage when viewed in a browser. | 
Example:
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>HTML</title>
</head>
<body>
    <!--Contents of the webpage-->
    <p>GeeksforGeeks is a online study platform</p>
</body>
</html>
Code Overview:
- This HTML document defines a basic webpage with a responsive design using <meta> tags, ensuring it adjusts well to different devices.
- The content includes a paragraph <p> displaying "GeeksforGeeks is an online study platform," and the title "HTML" appears in the browser tab.
HTML Headings
The HTML heading tags are used to create headings for the content of a webpage. These tags are typically placed inside the body tag. HTML offers six heading tags, from <h1> to <h6>, each displaying the heading in a different font size.
Syntax:
<h1></h1>
<h2></h2>
<h3></h3>
<h4></h4>
<h5></h5>
<h6></h6>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>HTML</title>
</head>
<body>
      <h1>Heading 1 (h1)</h1>
      <h2>Heading 2 (h2)</h2>
      <h3>Heading 3 (h3)</h3>
      <h4>Heading 4 (h4)</h4>
      <h5>Heading 5 (h5)</h5>
      <h6>Heading 6 (h6)</h6>
</body>
</html>
Code Overview:
- This code displays six headings (<h1> to <h6>) on the webpage, with <h1> being the largest and most prominent and <h6> being the smallest.
- The headings are used to define text hierarchy and emphasize content based on importance.
HTML Paragraph and Break Elements
HTML <p> tags are used to write paragraph statements on a webpage. They start with the <p> tag and end with </p>. The HTML <br> tag is used to insert a single line break and does not require a closing tag. In HTML, the break tag is written as <br>.
Syntax:
// for Paragraph
<p> Content... </p>
// for Break
<br>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>HTML</title>
</head>
<body>
      <p>
            HTML stands for HyperText Markup Language.<br>
            It is used to design web pages using a markup
            language.<br>HTML is a combination of Hypertext
            and Markup language.<br>Hypertext defines the
            link between web pages.<br>A markup language
            is used to define the text document within the
            tag which defines the structure of web pages.
      </p>
</body>
</html>
Code Overview:
- This HTML code uses a <p> tag to display a paragraph of text, providing an overview of what HTML is and its purpose.
- The <br> tags are used to insert line breaks, making the text more readable by separating each sentence onto a new line within the paragraph.
HTML Horizontal Line
The HTML <hr> tag is used to divide a page into sections by creating a horizontal line that spans from the left to the right side of the page. This is an empty tag and does not require a closing tag or any additional attributes.
Syntax:
<hr>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>HTML</title>
</head>
<body>
    <p>
        A Computer Science portal for geeks<br>
        A Computer Science portal for geeks<br>
        A Computer Science portal for geeks<br>
    </p>
    <hr>
    <p>
        A Computer Science portal for geeks<br>
        A Computer Science portal for geeks<br>
        A Computer Science portal for geeks<br>
    </p>
    <hr>
    <p>
        A Computer Science portal for geeks<br>
        A Computer Science portal for geeks<br>
        A Computer Science portal for geeks<br>
    </p>
    <hr>
</body>
</html>
Code Overview:
- <h1> to <h6> tags are used to define headings, with <h1> being the largest and <h6> the smallest.
- Each tag displays "Hello World!" in decreasing font sizes, illustrating the hierarchy of headings in HTML.
HTML Comments
HTML comments are annotations in your code that are not displayed in the browser. They are enclosed within <!-- and --> tags and are primarily used for documentation, explanation, or temporarily disabling code during debugging.
Syntax of HTML Comments
- Single-line comment:
<!-- This is a single-line comment -->
- Multi-line comment:
<!--
This is a multi-line comment
spanning multiple lines
-->
Example Usage of HTML Comments
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" 
          content="width=device-width, initial-scale=1.0">
    <title>HTML</title>
</head>
<body>
    <!-- This is a heading tag -->
    <h1>Welcome to GeeksforGeeks</h1>
    <!-- This is a paragraph tag -->
    <p>Learn HTML, CSS, and JavaScript here.</p>
  </body>
</html>
In this example, the comments provide context about the purpose of each HTML element.
Best Practices for Using HTML Comments
- Be concise and relevant: Write comments that explain the "why" behind the code in a brief and clear manner.
- Avoid over-commenting: Do not state the obvious. Let the code itself explain when possible.
- Keep comments up-to-date: Ensure comments reflect changes in the code to avoid confusion.
HTML Images
The <img> tag is used to insert an image into a webpage. The source of the image is specified within the src attribute, like this: <img src="source_of_image">.
Syntax:
<img src="geeks.png">
- This HTML code uses the <img> tag to display an image on a webpage.
- The src attribute specifies the URL of the image, which is loaded and displayed when the page is rendered in the browser.
View HTML Source Code
While checking a web page, you might want to see the HTML code behind it. Here we will see how you can view HTML source code for the entire page or a specific element.
1. View HTML Source Code of Entire Page
- To view the source code of a webpage press ctrl + u on the page, or right-click on the page and select the "view page source" option.
- This will open a new tab that shows the HTML source code for that entire page.
2. Inspect an HTML Element on a Page
- To check the HTML code for a specific element on a page, right-click on the page and select the "Inspect" option.
- This lets you see the HTML and CSS behind that element. You can also try making changes and see the changes.
Conclusion
Understanding HTML is the first step in becoming a web developer. By learning the basic tags and structure, you can create well-organized and functional web pages. The more you practice and experiment with HTML, the better you'll understand how to create interactive, engaging, and well-optimized websites.
