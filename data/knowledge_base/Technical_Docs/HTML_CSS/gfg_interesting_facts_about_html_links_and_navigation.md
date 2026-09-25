# Interesting Facts About HTML Links and Navigation

> Source: https://www.geeksforgeeks.org/html/interesting-facts-about-html-links-and-navigation

HTML (HyperText Markup Language) is the foundation of web development. One of the most essential components of HTML is links (or anchors), which enable users to navigate between different web pages or sections of the same page.
1. HTTP Link Header for Resource Preloading
Servers can send a Link header to preload resources before the HTML is parsed. This is different from the <link> tag and is used for advanced performance optimization.
</styles.css>; rel=preload; as=style
2. <base> Tag for Global URLs
The <base> tag sets a default URL for all relative links, simplifying navigation.
<base href="https://www.google.com/">
<a href="about.html">About Us</a> 
3. Tooltip Links with title
Adding a title attribute creates a tooltip when hovering over a link.
<a href="https://www.geeksforgeeks.org/" title="Visit our homepage">GeeksforGeeks</a>
4. Multi-Recipient Email Links
You can create a link that sends an email to multiple recipients by separating their email addresses with commas. You can also include a subject line.
<a href="mailto:user1@example.com,user2@example.com?subject=Hello">Email Us</a>
5. Link to a Specific Page Section
Using the id attribute, you can create links that navigate to specific sections within the same page. This is particularly useful for long pages with multiple sections.
<a href="#contact">Go to Contact</a>
<h2 id="contact">Contact Section</h2>
6. rel="nofollow" for SEO Control
The rel="nofollow" attribute tells search engines not to pass ranking value to the linked page. This is often used for user-generated content or untrusted external links.
<a href="https://example.com/" rel="nofollow">External Link</a>
7. hreflang Attribute for Language Targeting
The hreflang attribute specifies the language of the linked resource. This is useful for multilingual websites, helping search engines serve the correct language version to users.
<a href="/en/page" hreflang="en">English</a>
<a href="/fr/page" hreflang="fr">French</a>
8. Fragment Identifiers for In-Page Navigation
Fragment identifiers (#) allow you to link to specific sections within a page.
<a href="#section2">Go to Section 2</a>
<h2 id="section2">Section 2</h2>
<p>Content of section 2...</p>
9. rel="alternate" for Alternative Formats
The rel="alternate" attribute indicates an alternative representation of the current document, such as a PDF version of a webpage.
<link rel="alternate" type="application/pdf" href="article.pdf">
