# HTML iframes

> Source: https://www.geeksforgeeks.org/html/html-iframes

An iframe, or Inline Frame, is an HTML element represented by the <iframe> tag. It functions as a 'window' on your webpage through which visitors can view and interact with another webpage from a different source.
iframes are used for various purposes like:
- Embedding Multimedia: Easily integrate videos, audio, or animations from platforms like YouTube, etc.
- Including Maps: Embed maps from services like Google Maps directly into your site.
- Loading Forms and Widgets: Incorporate forms or widgets from other sources without writing complex code.
Syntax:
<iframe src="URL" title="description"></iframe>
The src attribute specifies the URL of the document you want to embed, and iframes can include videos, maps, or entire web pages from other sources.
HTML iframes Examples
HTML iframes are used to embed external web pages, videos, or documents inside a webpage without reloading the main page.
Example 1: Basic iframe Embedding
In this example, an iframe is used to display another webpage within the current webpage.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body style="text-align: center">
    <h2>HTML iframe Tag</h2>
    <iframe src="https://media.geeksforgeeks.org/wp-content/uploads/20240206111438/uni2.html"
            height="370"
            width="400">
    </iframe>
</body>
</html>
Output:
- src: Specifies the URL of the page to display within the iframe.
- width and height: Defines the size of the iframe on your page.
Supported Attributes of the <iframe> Tag
| Attributes | Description | 
|---|---|
| allow | Specifies a set of extra restrictions on the content that can be loaded in an <iframe>. | 
| allowfullscreen | Indicates whether the <iframe> can be displayed in fullscreen mode. | 
| allowpaymentrequest | Enables payment requests for content inside the <iframe>. | 
| height | Sets the height of the <iframe> element. | 
| width | Sets the width of the <iframe> element. | 
| loading | Specifies how the content of the <iframe> should be loaded. | 
| scrolling | Controls whether or not the <iframe> should have scrollbars. | 
| name | Specifies the name of the <iframe> for targeting its content or for referencing it in JavaScript. | 
| referrerpolicy | Sets the referrer policy for the <iframe> content. | 
| sandbox | Specifies an extra set of restrictions for the content in the <iframe>. | 
| src | Specifies the URL of the document to embed in the <iframe>. | 
| srcdoc | Specifies the HTML content of the page to display in the <iframe>. | 
Example 2: Using Height and Width attribute
The height and width attributes are used to specify the size of the iframe. The attribute values are specified in pixels by default. You can use pixels or percentages (e.g., “80%”).
<!DOCTYPE html>
<html>
<body>
    <h2>HTML iframe Tag</h2>
    <p> Content goes here </p>
    <iframe src="https://media.geeksforgeeks.org/wp-content/uploads/20240206111438/uni2.html"
            height="395" 
            width="400">
    </iframe>
</body>
</html>
Example 3: Removing Borders from iframe
By default, iframe has a border around it. To remove the border, we must use the style attribute and use the CSS border property.
<!DOCTYPE html>
<html>
<body>
    <h2>HTML iframe Tag</h2>
    <p>Content goes here</p>
    <iframe src="https://media.geeksforgeeks.org/wp-content/uploads/20231227155729/jsonPrac3.html" 
            height="300" 
            width="400" 
            style="border: none"> 
    </iframe>
</body>
</html>
Example 4: Styling iframe Border Using CSS
You can change the size, style, and color of the iframe border using CSS.
<!DOCTYPE html>
<html>
<body>
    <p>Content goes here</p>
    <iframe src="https://media.geeksforgeeks.org/wp-content/uploads/20240206111438/uni2.html" 
            height="400" 
            width="400" 
            style="border: 4px solid orange"> 
    </iframe>
</body>
</html>
Example 5: iframe Target in Link
You can target an iframe with links by using the name attribute of the iframe and the target attribute of the link.
<!DOCTYPE html>
<html>
<body>
    <h2>HTML iframe Tag</h2>
    <p> Click the link text </p>
    <iframe src="https://media.geeksforgeeks.org/wp-content/uploads/20210910170539/gfg-221x300.png"
            height="400"
            width="350" 
            name="iframe_a">
    </iframe>
    <p>
        <a href="https://media.geeksforgeeks.org/wp-content/uploads/20240206111438/uni2.html"
           target="iframe_a">
            Converter
        </a>
    </p>
</body>
</html>
Best Practices for Using iframes
While <iframe> elements provide flexibility for embedding external content, they should be used carefully to maintain performance, security, and accessibility.
- Security: Use the sandbox attribute to restrict iframe capabilities unless the source is fully trusted.
- Performance: Limit iframe usage and ensure embedded content is optimized to avoid slow page loads.
- Accessibility: Provide fallback text or links inside the <iframe> tag for users who cannot interact with it.
