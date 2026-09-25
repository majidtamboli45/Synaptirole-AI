# HTML Block and Inline Elements

> Source: https://www.geeksforgeeks.org/html/html-block-and-inline-elements

HTML elements are either block-level, which structure the layout and span full width (like <div> or <p>), or inline, which styles content within blocks without breaking the flow (like <span> or <a>). This distinction covers 80–90% of common HTML usage.
Example: Here, we illustrate the use of the block-level element(Div) and the inline element(<a>).
<!DOCTYPE html>
<html>
  <body>
    <div>GeeksforGeeks</div>
    Checkout the GeeksforGeeks
    <a href="www.youtube.com" alt="GeeksforGeeks youtube"> official </a>
    youtube for the videoes on various courses.
  </body>
</html>
Code Overview:
In the above example, we have used the <div> tag that always starts in a new line & captures the full width available. We have also used the inline element anchor tag <a> that is used to provide a link to a text that doesn't start in a new line & captures only the space around the element.
HTML Block Elements
A block-level element always starts on a new line and stretches out to the left and right as far as it can i.e, it occupies the whole horizontal space of its parent element & the height is equal to the content's height.
div element:
The <div> element is used as a container for other HTML elements. It has no required attributes. Style, class, and id are the commonly used attributes.
Syntax:
<div>GFG</div>
Example: The below code illustrates the implementation of <div> tag.
<!DOCTYPE html>
<html>
<head>
    <title>Block-level Element</title>
</head>
<body>
    <div>
        <h1>GeeksforGeeks</h1>
        <h3>GeeksforGeeks is a science portal for geeks.</h3>
        <h3>
            You can give reviews as well as
            contribute posts on this portal.
        </h3>
    </div>
</body>
</html>
Output:
Inline Elements
An inline element is the opposite of the block-level element. It does not start on a new line and takes up only the necessary width ie., it only occupies the space bounded by the tags defining the HTML element, instead of breaking the flow of the content.
span element:
The <span> tag is used as a container for text. It has no required attributes. Style, class, and id are the commonly used attributes.
Syntax:
<span>GFG</span>
Example: The below code illustrates the implementation of <span> tag.
<!DOCTYPE html>
<html>
<head>
    <title>HTML span element</title>
    <style>
        body {
            text-align: center;
        }
        h1 {
            color: green;
        }
        span {
            color: white;
        }
    </style>
</head>
<body>
    <h1>Geeks
        <span> for</span>
        Geeks
    </h1>
</body>
</html>
