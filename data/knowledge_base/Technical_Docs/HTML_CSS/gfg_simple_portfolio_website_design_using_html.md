# Simple Portfolio Website Design using HTML

> Source: https://www.geeksforgeeks.org/html/simple-portfolio-website-design-using-html

Creating a portfolio website is a great way to showcase your work, skills, and personal brand to companies/recruiters. Let's create a simple portfolio using only HTML.
- We'll develop a simple portfolio website that presents your professional highlights, projects, and achievements.
- We'll utilize HTML tables to organize content, and the layout will be clean with text alignments and a navigational header.
- You are not required to style the website, you are only required to create the structure of the website using HTML.
Project Preview:
Portfolio Website - HTML Code Structure
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portfolio of John Doe</title>
</head>
<body>
    <header>
        <h1 style="text-align:center;">John Doe</h1>
        <p style="text-align:center;">Home | Projects | Blogs | Contact</p>
    </header>
    <h2 style="text-align:center;">Web Developer and Designer</h2>
    <table border="1" width="100%">
        <tr>
            <td>
                <h3>Portfolio Highlights</h3>
                <ul>
                    <li>Responsive HTML Layout</li>
                    <li>E-commerce Storefront</li>
                    <li>Interactive Form Design</li>
                    <li>Event Countdown Widget</li>
                    <li>Prototype Landing Pages</li>
                </ul>
            </td>
            <td>
                <h3>Career Achievements</h3>
                <p>Frontend Developer [Intern] at XYZ<br>Headed major product redesigns resulting in a 40% increase in user engagement.<br><a href="#">View My LinkedIn Profile</a></p>
                <h3>Community Involvement</h3>
                <p>Active participant in local and online developer forums. Regularly contribute to web development blogs and GitHub projects.<br><a href="#">Visit My GitHub</a></p>
            </td>
            <td>
                <h3>Academic Qualifications</h3>
                <p>B.Tech (Computer Science) from ABC University</p>
                <p>Specializations:</p>
                <ul>
                    <li>Systems Analysis</li>
                    <li>Advanced JavaScript Techniques</li>
                    <li>Web Accessibility Standards</li>
                    <li>Performance Optimization in Web Applications</li>
                    <li>Cloud Computing Infrastructure</li>
                    <li>Security in Web Applications</li>
                    <li>Advanced Algorithms</li>
                </ul>
            </td>
        </tr>
    </table>
    <h3>Peer Reviews</h3>
    <table border="1" width="100%">
        <tr>
            <td>John Doe consistently delivers high-quality, innovative solutions that exceed project expectations. - Steven, Project Lead</td>
            <td>John Doe is known for his precise attention to detail and his ability to mentor younger developers. - David, UI Designer</td>
            <td>John's approach to problem-solving has been instrumental in our success. - Sarah, Frontend Developer</td>
        </tr>
    </table>
    <footer style="text-align:center;">
        © [2025] All rights reserved by John Doe
    </footer>
</body>
</html>
1. Document Structure
<!DOCTYPE html> this declaration tells the browser that this is an HTML5 document, which is the latest standard version of HTML. <html> is the root element that encompasses all the content of the webpage.
Head Section
<head> contains meta-information about the document, which isn't displayed directly on the webpage but is crucial for browser handling and SEO.
- <meta charset="UTF-8">: Sets the character encoding to UTF-8, which includes most characters from all known languages, ensuring the text appears correctly.
- <meta name="viewport" content="width=device-width, initial-scale=1.0">: Optimizes the viewport for responsive design, making the site accessible and visually coherent on various devices.
- <title>: Specifies the title of the webpage, which appears in the browser tab and is used by search engines.
2. Body Section
<body> contains all the contents of the web page that are visible to the viewer.
Header
<header> serves as the top section of the website. <h1> and <p> display the name 'John Doe' and a simple navigation menu (Home | Projects | Blogs | Contact). These elements are centrally aligned using inline CSS (style="text-align: center;").
Main Content
<h2> is a subtitle that describes John Doe’s professional role as "Web Developer and Designer", also centered.
<table> organizes the main content into three columns, each housed in <td> tags:
- Portfolio Highlights: Lists key projects or skills like responsive design and e-commerce storefronts.
- Career Achievements and Community Involvement: Professional experience, community contributions, and links to LinkedIn and GitHub.
- Academic Qualifications: Details educational background and specialized areas of knowledge.
Peer Reviews: Another <table> providing testimonials from colleagues, emphasizing John’s skills and impact in his field. This is a strategic addition to build credibility and showcase real-world validation of his abilities.
Footer Element: <footer> closes the webpage with copyright information, symbolizing ownership and rights over the content. This is also centrally aligned for consistency with the rest of the page’s styling.
Since this HTML page may not look very appealing right now due to the lack of colors and interactivity, don’t worry! As you move forward in this course, you’ll learn CSS and JavaScript to style and add functionality to your portfolio website.
