# Interesting Facts About HTML Meta Tags and SEO

> Source: https://www.geeksforgeeks.org/html/interesting-facts-about-html-meta-tags-and-seo

HTML meta tags are small but powerful elements found in the <head> section of a webpage. Although users can't see them, they are important for search engine optimization (SEO). Meta tags provide search engines with key information about a page's content and purpose, helping improve its visibility in search results.
Let's explore some interesting facts about HTML meta tags and how they impact SEO.
1. Description Meta Tag: Snippet Preview
The description meta tag provides a brief summary of the page's content. This summary often appears in search engine results as the snippet below the page title.
<meta name="description" content="Learn about our new product and its amazing features.">
2. Robots Meta Tag: Page Control
The robots meta tag instructs search engines on how to handle a specific page. For example, you can prevent a page from being indexed or restrict certain actions.
<meta name="robots" content="noindex">
3. Charset Meta Tag: Character Encoding
The charset meta tag specifies the character encoding for the webpage. It should always be placed first in the <head> section to avoid rendering issues..
<head>
  <meta charset="UTF-8"> <!-- Always first! -->
  <title>Page Title</title>
</head>
4. Author Meta Tag: Content Attribution
The author meta tag identifies the creator of the webpage's content. Some browser extensions use this information for additional functionalities.
<meta name="author" content="Jane Smith">
5. Custom Meta Tags: Internal Use
Custom meta tags, like product-category, can be used to categorize content for internal search engines or organizational purposes.
<meta name="product-category" content="electronics">
6. Referrer Policy Meta Tag: Control Referrer Data
The Referrer policy meta tag controls how much information is sent in the Referrer header when users navigate to another page.
<meta name="referrerpolicy" content="strict-origin-when-cross-origin">
7. Viewport Meta Tag: Mobile Optimization
The viewport meta tag ensures the webpage is optimized for mobile devices by controlling the viewport's dimensions and scaling.
<meta name="viewport" content="width=device-width, initial-scale=1.0">
8. Canonical Link Tag: Avoid Duplicate Content
The canonical link tag specifies the preferred version of a webpage when multiple versions exist. This helps prevent duplicate content issues.
<link rel="canonical" href="https://www.example.com/original-page.html">
