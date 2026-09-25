# Adding CSS to HTML

> Source: https://www.geeksforgeeks.org/css/how-to-add-css

Each method serves a different purpose based on how you organize and manage your styles.
- Helps you structure CSS according to your project needs.
- Makes your code easier to maintain and update.
- Allows flexibility in applying styles to different parts of a webpage.
- Improves readability and reusability of your design.
1. Inline CSS
Inline CSS allows you to apply styles directly within HTML tags using the style attribute. This method is useful for small-scale styling or when you need to apply a unique style to a single element.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>Inline CSS</title>
</head>
<body>
<!--Driver Code Ends-->
    <h2 style="color: green;">
          Welcome to 
          <i style="color: green;">
              GeeksforGeeks
          </i>
      </h2>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
2. Internal CSS
Internal CSS involves adding CSS styles directly within the HTML file by including them inside the <style> tags. This method is more efficient for applying styles to a single HTML document and keeps your CSS code more organized compared to inline styling.
Note: It's best to add the <style> tags within the <head> section to ensure the styles are read before the body content is loaded.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title>Internal CSS</title>
  
<!--Driver Code Ends-->
      <style>
        h2 {
            color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>Welcome to GeeksforGeeks</h2>
</body>
</html>
<!--Driver Code Ends-->
3. External CSS
External CSS uses a separate .css file linked with the <link> tag, making it ideal for large projects by improving maintainability and reusability.
Link this HTML file into CSS
<!DOCTYPE html>
<html>
<head>
    <title>External CSS</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h2>Welcome to GeeksforGeeks</h2>
</body>
</html>
/* Create a file named styles.css */
h2 {
    color: green;
    font-size: 20px;
}
Best Practices for Using CSS in HTML
1. Inline
Styles are applied directly to individual HTML elements using the style attribute.
- Best for small, unique styles applied to individual elements.
- Useful for quick styling changes or testing new styles.
- Directly affects a single element, making it not reusable for multiple elements.
- Should be used sparingly to avoid cluttering HTML and making maintenance harder.
2. Internal
Styles are defined within a <style> tag inside the HTML document’s <head> section.
- Defined within a single HTML document for styling multiple elements on that page.
- Easier to manage than inline CSS and allows consistent styles for the page.
- Ideal for single-page websites or pages with unique styling needs.
- Not reusable across multiple pages, so not recommended for larger projects.
3. External
Styles are written in a separate CSS file and linked to multiple HTML pages.
- Styles are stored in separate files and applied to multiple pages.
- Best suited for larger projects and multi-page websites.
- Promotes organization, maintainability, and reusability.
- Allows for consistent design across a website and improves performance through browser caching.
