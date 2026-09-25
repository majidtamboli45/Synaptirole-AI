# Best HTML Coding Practices You Must Know

> Source: https://www.geeksforgeeks.org/html/best-html-coding-practices-you-must-know

HTML is easy to learn and often the first step into programming, but even experienced developers make common mistakes that affect code quality, teamwork, and user experience.
- HTML is widely used by beginners and professionals to build web pages.
- Poor or careless HTML practices can confuse developers and harm site usability.
- Following clean and best HTML coding practices improves readability, maintenance, and user satisfaction.
1. Use Proper Document Structure With Doctype
Following a proper HTML document structure with the correct <!DOCTYPE> ensures consistent rendering across all browsers.
- Browsers may render pages correctly even if elements like <html>, <head>, or <body> are missing, but results can vary.
- Declaring the correct <!DOCTYPE> at the start prevents inconsistencies and compatibility issues.
- <!DOCTYPE> specifies the HTML version, ensuring correct browser interpretation of the code.
- Maintaining proper structure is a good habit for reliable and standards-compliant HTML.
<!DOCTYPE html>
<html>
  <head>
    <title>Hello World</title>
  </head>
  <body>
    <h1>Welcome Programmers</h1>
    
<p>This website is GeeksforGeeks.</p>
  </body>
</html>
2. Close the Tags
Always closing HTML tags ensures valid, compatible, and error-free code, even though HTML5 allows some tags to remain unclosed.
- Helps avoid validation and compatibility issues across browsers.
- Modern text editors often auto-close tags, but manual checking is recommended.
- Following W3C guidelines by closing all tags prevents future errors.
Note: Not all the tags have losing tags, Please check Which tags contain both opening & closing tags in HTML.
<div>
    <div>
        <div>
            <p>Hello Programmers</p>
            <ul>
                <li>Array<li>
                <li>Linked List<li>
                <1i>Stack<li>
           </ul>    
       </div>
    </div>
</div>
<div> Missing close div -->
3. Write Tags in Lowercase
Using lowercase for all HTML tags, attributes, and values is a best practice that improves readability and maintains industry standards.
- Capitalizing tags doesn’t affect browser rendering, but lowercase is preferred.
- Lowercase code is cleaner, easier to read, and more maintainable.
- Following this habit aligns with industry standards and professional coding practices.
<!-- Wrong practice-->
<SECTION>
   <p>This is a paragraph.</p>
</SECTION>
<!-- Right practice-->
<section>
   <p>This is a paragraph.</p>
</section>
4. Add Image Attributes
It Always use the alt attribute and specify image dimensions in HTML to improve accessibility, SEO, and page layout stability.
- The alt attribute provides descriptive text for accessibility and validation; choose meaningful descriptions.
- Omitting alt can lower your page’s search engine ranking.
- Setting the image’s height and width helps the browser reserve space, reducing layout shifts during page load.
<!-- Wrong Practice-->
<img src="html5.gif">
<!-- Right Practice-->
<img src="html5.gif" alt="HTML5" style="width:100px;height:100px;">
5. Avoid Using Inline Styles
It Avoid using inline styles in HTML, keeping CSS separate makes your code cleaner, easier to read, and maintainable.
- Inline styles clutter HTML, making it hard to update or maintain.
- Separating HTML and CSS improves readability and organization.
- It allows other developers to modify or extend the design more easily.
<!-- Wrong Practice -->
<p style="color: #393; font-size: 24px;">Thank you!</p>
<!-- Right Practice -->
<p class="alert-success">Thank you!</p>
6. Use a Meaningful Title and Descriptive Meta Tags
HTML titles and meta descriptions play a crucial role in SEO, helping search engines understand and rank your page effectively.
- The <title> should be meaningful, as it appears in search engine results and influences indexing.
- The meta description summarizes the page’s content and purpose for users; avoid repetitive words or phrases.
- Keywords in meta tags help search engines match your page with relevant user searches.
<meta charset="UTF-8" />
<meta
   name="viewport"
   content="width=device-width, initial-scale=1, maximum-scale=1"/>
<meta
   name="description"
   content=
   "A Computer Science portal for geeks. It contains well written,
   well thought and well explained computer science and programming 
   articles, quizzes and practice/competitive programming/company 
   interview Questions."/>
<meta name="theme-color" content="#0f9d58" />
<meta
   property="og:image"
   content="image/png"/>
<meta property="og:image:type" content="image/png" />
<meta property="og:image:width" content="200" />
<meta property="og:image:height" content="200" />
<script src="https://apis.google.com/js/platform.js"></script>
<script src=
   "//cdnjs.cloudflare.com/ajax/libs/require.js/2.1.14/require.min.js"></script>
<title>GeeksforGeeks | A computer science portal for geeks</title>
7. Use Heading Elements Wisely
Heading tags (<h1> to <h6>) structure your content and improve SEO by defining a clear hierarchy of importance.
- Use <h1> for the main title or most important content, and only one <h1> per page as per W3C standards.
- <h2> to <h6> organize subsections, creating a logical content hierarchy.
- Proper use of headings helps search engines understand and rank your page effectively.
<h1>Topmost heading</h1>
<h2>Sub-heading underneath the topmost heading.</h2>
<h3>Sub-heading underneath the h2 heading.</h3>
8. Always Use the Right HTML Elements
Using the correct HTML elements ensures meaningful content structure, better accessibility, and maintainable code.
- Beginners often misuse elements; learning proper usage comes with practice and observing well-written code.
- Use CSS for spacing instead of <br> between paragraphs, and understand semantic differences like <em> vs <i> and <strong> vs <b>.
- Correct element usage improves readability, accessibility, and overall code quality.
<!-- Wrong Practice -->
<span class="heading"><strong>Hello Geeks</strong></span>
<br><br>
This is Computer Science portal for geeks.
<br><br>
<!-- Right Practice -->
<h1>Hello Geeks</h1>
<p>This is Computer Science portal for geeks.</p>
9. Proper Use of Indentation
Proper spacing and indentation in HTML improve readability, maintainability, and overall code quality.
- Avoid writing all code in a single line; use indentation for nested elements to show structure clearly.
- Well-formatted code is easier to modify and understand for yourself and other developers.
- Following proper formatting reduces development time and promotes good coding practices.
<!-- Bad Code -->
<aside>
<h3>GeeksforGeeks</h3>
<h5>A computer science portal for geeks</h5>
<ul>
<li>Computer Science</li>
<li>Gate</li>
</ul>
</aside>
<!-- Good Code -->
<aside>
  <h3>GeeksforGeeks</h3>
  <h5>A computer science portal for geeks</h5>
  <ul>
    <li>Computer Science</li>
    <li>Gate</li>
  </ul>
</aside>
10. Validate Your Code
Regularly validating your HTML ensures error-free, standards-compliant code and helps detect hidden issues early.
- Validation identifies mistakes that may be difficult to spot manually.
- Tools like W3C Markup Validation or Firefox Developer Toolbar can check your code by URL.
- Using validators improves code quality, compatibility, and maintainability.
