# CSS Interview Questions and Answers

> Source: https://www.geeksforgeeks.org/css/css-interview-questions

CSS (Cascading Style Sheets) is the standard stylesheet language used to design and style web pages. It is widely used with HTML and JavaScript to create responsive, visually appealing, and user-friendly websites. Mastering key CSS interview questions is essential for succeeding in technical interviews for Frontend, Web, and Full-Stack Developer roles.
1. What is the latest version of CSS?
CSS3 is the latest version of CSS.
2. Suggest Some Best CSS Frameworks?
The best CSS frameworks are:
- Bootstrap
- Foundation
- Bulma
- UIKit
- Semantic UI
- Materialize
- Pure
- Tailwind CSS
3. What is the syntax for CSS?
A CSS style rule consists of a selector, property, and its value. The selector points to the HTML element where CSS style is to be applied. The CSS property is separated by semicolons.
Syntax:
selector { 
    Property: value; 
}
4. What are the different ways to apply CSS to a webpage?
There are three ways we can add CSS to a webpage:
- Inline CSS: Inline CSS contains the CSS property in the body section attached with the element known as inline CSS. This kind of style is specified within an HTML tag using the style attribute.
- Internal CSS: Internal CSS can be used when a single HTML document must be styled uniquely. The CSS ruleset should be within the HTML file in the head section i.e the CSS is embedded within the HTML file.
- External CSS: External CSS contains a separate CSS file which contains only style property with the help of tag attributes (For example class, id, heading, … etc). CSS property is written in a separate file with .css extension and should be linked to the HTML document using the link tag.
5. Which type of CSS holds the highest priority?
Inline CSS has the highest priority, then comes Internal/Embedded followed by External CSS which has the least priority. Multiple style sheets can be defined on one page. If for an HTML tag, styles are defined in multiple style sheets then the below order will be followed.
- As Inline has the highest priority, any styles that are defined in the internal and external style sheets are overridden by Inline styles.
- Internal or Embedded stands second in the priority list and overrides the styles in the external style sheet.
- External style sheets have the least priority. If there are no styles defined either in the inline or internal style sheet then external style sheet rules are applied for the HTML tags.
6. What are CSS Selectors?
CSS Selectors: CSS Selectors are used to select HTML elements based on their element name, id, attributes, etc. It can select one or more elements simultaneously.
Element Selectors: The Element Selectors in CSS is used to select HTML elements which are required to be styled. In a selector declaration, there is the name of the HTML element, and the CSS properties which are to be applied to that element is written inside the brackets {}.
Syntax:
element_name {
    // CSS Property
}
id selector: The #id selector is used to set the style of the given id. The id attribute is the unique identifier in an HTML document. The id selector is used with a # character.
Syntax:
#id_name { 
    // CSS Property
}
class selector: The .class selector is used to select all elements which belong to a particular class attribute. To select the elements with a particular class, use the (.) character with specifying the class name. The class name is mostly used to set the CSS property to the given class.
Syntax:
.class_name {
    // CSS Property
7. When is it better to use logical properties (inline-/block-start/end) vs physical properties (top/right/…)
Use logical properties (like margin-inline-start, padding-block-end) when you want your layout to adapt to different writing modes, text directions (LTR/RTL), or vertical scripts—making your design more flexible and internationalized.
Physical properties (like margin-top, padding-right) are more suitable when the layout is fixed to a left-to-right, horizontal writing environment and doesn’t need to adjust for localization.
8. How to make an accessible “Skip to content” link that’s hidden until focus and which hiding methods are a11y-safe?
Keep the link in the DOM and tab order using a visually hidden utility (not display:none, visibility:hidden, or aria-hidden). Reveal it on :focus/:active. Avoid huge negative positioning tricks.
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Skip to Content Example</title>
  <style>
    /* Hide visually but keep accessible for screen readers */
    .visually-hidden {
      position: absolute;
      width: 1px;
      height: 1px;
      margin: -1px;
      padding: 0;
      border: 0;
      overflow: hidden;
      white-space: nowrap;
      clip: rect(0 0 0 0);
      clip-path: inset(50%);
    }
    /* Reveal skip link on focus or activation */
    .skip-link:focus,
    .skip-link:active {
      position: fixed;
      top: 1rem;
      left: 1rem;
      z-index: 1000;
      width: auto;
      height: auto;
      margin: 0;
      padding: .5rem .75rem;
      clip: auto;
      clip-path: none;
      overflow: visible;
      white-space: normal;
      background: #fff;
      outline: 2px solid;
      border-radius: .25rem;
      font-weight: bold;
      text-decoration: none;
      color: #000;
    }
  </style>
</head>
<body>
  
  <!-- Skip Link -->
  <a class="skip-link visually-hidden" href="#main">Skip to content</a>
  <!-- Simulated header/navigation -->
  <header>
    <nav>
      <ul>
        <li><a href="#">Home</a></li>
        <li><a href="#">About</a></li>
        <li><a href="#">Services</a></li>
        <li><a href="#">Contact</a></li>
      </ul>
    </nav>
  </header>
  <!-- Main content -->
  <main id="main">
    <h1>Welcome to the Page</h1>
    <p>This is the main content area. The skip link above lets keyboard and screen reader users jump directly here.</p>
  </main>
</body>
</html>
9. What are CSS custom properties (variables), and how do they cascade?
CSS custom properties are runtime variables you define with names starting -- and use with var(). They inherit by default and follow normal CSS precedence: origin → !important → specificity → source order. Define on :root for globals; override on any subtree (including inside media queries). If a variable isn’t defined at a point of use, var(--x, fallback) applies the fallback; otherwise the property becomes invalid.
:root { --brand: #0a84ff; }          /* global */
.card { color: var(--brand); }
.theme-dark { --brand: #64d2ff; }    /* scoped override */
@media (prefers-contrast: more) {
  :root { --brand: black; }          /* conditional override */
}
10. How is CSS different from CSS 3?
| CSS | CSS3 | 
|---|---|
| CSS is capable of positioning texts and objects. CSS is somehow backward compatible with CSS3. | On the other hand, CSS3 is capable of making the web page more attractive and takes less time to create. If you write CSS3 code in CSS, it will be invalid. | 
| Responsive designing is not supported in CSS | CSS3 is the latest version, hence it supports responsive design. | 
| CSS cannot be split into modules. | Whereas, CSS3 can be broken down into modules. | 
| Using CSS, we cannot build 3D animation and transformation. | But in CSS3 we can perform all kinds of animation and transformations as it supports animation and 3D transformations. | 
11. What’s the difference between a CSS reset and a normalizer,
A CSS reset wipes most browser defaults (margins, paddings, headings, lists, etc.) to a neutral baseline so you rebuild styles from scratch. A normalizer (e.g., Normalize.css) preserves useful defaults and only fixes cross-browser inconsistencies. Use a reset when you want total control in a tightly designed system; use a normalizer when you want sensible defaults with consistent behavior and less re-styling.
12. How can we add comments in CSS?
Comments are the statements in your code that are ignored by the compiler and are not executed. Comments are used to explain the code. They make the program more readable and understandable.
Syntax:
/* content */
Comments can be single-line or multi-line.
13. How should I organize CSS custom properties to maintain a shared color scheme across components?
Here is the way to organize CSS variables for a shared color scheme:
1. Design tokens (brand/base)
:root {
  /* brand in HSL so you can vary alpha easily */
  --brand-h: 220; --brand-s: 90%; --brand-l: 56%;
  --neutral-0: #ffffff; --neutral-900: #0a0a0a;
  /* semantic roles (don’t tie to a specific component) */
  --color-bg: var(--neutral-0);
  --color-fg: var(--neutral-900);
  --color-accent: hsl(var(--brand-h) var(--brand-s) var(--brand-l));
  --color-border: color-mix(in oklab, var(--color-fg) 15%, transparent);
  --on-accent: white;
}
2. Themes override only semantic roles (not component CSS):
[data-theme="dark"] {
  --color-bg: #0b0b0b;
  --color-fg: #f5f5f5;
  --color-border: color-mix(in oklab, var(--color-fg) 25%, transparent);
  --on-accent: black; /* if your accent shifts lighter in dark mode */
}
3. Component-level aliases (map semantics → component tokens):
.button {
  /* component tokens (can be customized per instance) */
  --btn-bg: var(--color-accent);
  --btn-fg: var(--on-accent);
  --btn-border: var(--color-border);
  background: var(--btn-bg);
  color: var(--btn-fg);
  border: 1px solid var(--btn-border);
}
.card {
  --card-bg: var(--color-bg);
  --card-fg: var(--color-fg);
  --card-border: var(--color-border);
  background: var(--card-bg);
  color: var(--card-fg);
  border: 1px solid var(--card-border);
}
14. What are CSS HSL Colors?
HSL stands for Hue, Saturation, and Lightness respectively. This format uses the cylindrical coordinate system.
- Hue: Hue is the degree of the color wheel. Its value lies between 0 to 360 where 0 represents red, 120 represents green and 240 represents a blue color.
- Saturation: It takes a percentage value, where 100% represents completely saturated, while 0% represents completely unsaturated (gray).
- Lightness: It takes a percentage value, where 100% represents white, while 0% represents black.
Syntax:
h1 {
    color:hsl(H, S, L);
}
Example:
<html> 
    <head> 
        <title>CSS hsl color property</title> 
        <style> 
            h1{ 
                color:hsl(120, 100%, 30%); 
                text-align:center; 
            } 
        </style> 
    </head> 
    <body> 
        <h1> 
            GeeksforGeeks 
        </h1> 
    </body> 
</html>                     
Output:
15. What are CSS backgrounds, list the properties?
The CSS background properties are used to define the background effects for elements.
CSS background properties are as follows:
- background-color: This property specifies the background color of an element.
- background-image: This property specifies an image to use as the background of an element. By default, the image is repeated so it covers the entire element.
- background-repeat: By default, the background image property repeats the image both horizontally and vertically.
- background-attachment: This property is used to fix the background ground image. The image will not scroll with the page.
- background-position: This property is used to set the image to a particular position.
16. What are the different CSS border properties?
CSS border properties allow us to set the style, color, and width of the border.
- Border Style: The border-style property specifies the type of border. None of the other border properties will work without setting the border style.
- Border Width: Border width sets the width of the border. The width of the border can be in px, pt, cm or thin, medium and thick.
- Border Color: This property is used to set the color of the border. Color can be set using the color name, hex value, or RGB value. If the color is not specified border inherits the color of the element itself.
17. What does margin: 40px 100px 120px 80px signify?
CSS margins are used to create space around the element. We can set the different sizes of margins for individual sides (top, right, bottom, left).
Margin properties can have the following values:
- Length in cm, px, pt, etc.
- Width % of the element.
- Margin calculated by the browser: auto.
Therefore, margin: 40px 100px 120px 80px signifies:
- top = 40px
- right = 100px
- bottom = 120px
- left = 80px
18. What is the difference between margin and padding?
- Margin is used to create space around elements and padding is used to create space around elements inside the border.
- We can set the margin property to auto but we cannot set the padding property to auto.
- In Margin property we can allow negative or float number but in padding we cannot allow negative values.
- Margin and padding target all the 4 sides of the element. Margin and padding will work without the border property also. The difference will be more clear with the following example.
Example:
<!DOCTYPE html> 
<html> 
<head> 
    <style> 
        h2 { 
            margin:50px; 
            border:70px solid green; 
            padding:80px; 
        } 
    </style> 
</head> 
<body> 
    <h1>GEEKSFORGEEKS</h1> 
    <h2> 
        Padding properties 
    </h2> 
</body> 
</html> 
Output:
19. What is CSS Box Model?
The CSS box model defines the layout of elements as rectangular boxes consisting of content, padding, border, and margin, used to control spacing and design.
- Content: The actual text or media inside the element.
- Padding: Space between content and border.
- Border: Surrounds padding and content.
- Margin: Outer space separating elements.
The following figure illustrates the box model.
 
20. What is the difference between CSS border and outline?
- CSS border properties allow us to set the style, color, and width of the border.
- CSS outline property allows us to draw a line around the element, outside the border.
Example:
<!DOCTYPE html>
<html lang="en">
<head>
    <style>      
        p {
            outline: 5px solid #ddd;
            border: 1px solid #000;
        }
    </style>
</head>
<body>
    <p>This is a paragraph.</p>
</body>
</html> 
Output:
Differences:
- Unlike borders, outlines don't allow us to set each edge to a different width, or set different colors and styles for each edge. An outline is the same on all sides.
- Outlines cannot be circular.
- Outlines do not take up space, because they are always placed on top of the box of the element.
21. How can we format text in CSS?
CSS text formatting properties are used to format text and style text.
CSS text formatting includes the following properties:
- Text-color
- Text-alignment
- Text-decoration
- Text-transformation
- Text-indentation
- Letter spacing
- Line height
- Text-direction
- Text-shadow
- Word spacing
22. What are the different CSS link states?
A link is a connection from one web page to another web page. CSS property can be used to style the links in various different ways.
States of Link: Before discussing CSS properties, it is important to know the states of a link. Links can exist in different states and they can be styled using pseudo-classes.
There are four states of links given below:
- a:link: This is a normal, unvisited link.
- a:visited: This is a link visited by a user at least once
- a:hover: This is a link when the mouse hovers over it
- a:active: This is a link that is just clicked.
23. Can we add an image as a list item marker?
To add an image as the list-item marker in a list, we use the list-style-image property in CSS.
Syntax:
list-style-image: none | url | initial | inherit;
24. How can we hide an element in CSS?
The style display property is used to hide and show the content of HTML DOM by accessing the DOM element using JavaScript/jQuery.
To hide an element, set the style display property to “none”.
display: "none";
To show an element, set the style display property to “block”.
display:"block";
Example:
<!DOCTYPE html>
<html>
<head>
    <style>
        .visible {
            display: block;
        }
        
        .hidden {
            display: none;
        }
    </style>
</head>
<body>
    <h1 class="visible">visible heading</h1>
    <h1 class="hidden">hidden heading</h1>
    <p>
        Note: The h1 element with display: none; 
        does not take up any space.
    </p>
</body>
</html>
Output:
The visibility property is used to hide or show the content of HTML elements. The visibility property specifies that the element is currently visible on the page. The ‘hidden’ value can be used to hide the element. This hides the element but does not remove the space taken by the element, unlike the display property.
Syntax:
visibility : 'hidden';
visibility :'visible';
Example:
<!DOCTYPE html>
<html>
<head>
    <style>
        .visible {
            visibility: visible;
        }
        .hidden {
            visibility: hidden;
        }
    </style>
</head>
<body>
    <h2 class="visible">This heading is visible</h2>
    <h2 class="hidden">This heading is hidden</h2>
    <p>Note: The hidden element still takes up space.</p>
</body>
</html>
Output:
25. What is the difference between display: none and visibility: hidden?
Both of the property is quite useful in CSS. The visibility: “hidden”; property is used to specify whether an element is visible or not in a web document but the hidden elements take up space in the web document. The visibility is a property in CSS that specifies the visibility behavior of an element and display: "none" is used to specify whether an element exists on the page or not.
Syntax:
visibility: visible| hidden | collapse | initial | inherit;
- Display property
display: none |  inline | block | inline-block;
So, the difference between display: “none”; and visibility: “hidden”;, right from the name itself we can tell the difference as display: “none”, completely removes the element from the layout, as it had never existed in the HTML page whereas visibility: “hidden”;, just makes the tag invisible it will still be on the HTML page occupying space it’s just invisible.
26. Can we overlap elements in CSS?
Creating an overlay effect simply means putting two divs together at the same place but both the div appear when needed i.e while hovering or while clicking on one of the div to make the second one appear. Overlays are very clean and give the webpage a tidy look. It looks sophisticated and is simple to design. Overlays can be created using two simple CSS properties:
The z-index property is used to displace elements on the z-axis i.e in or out of the screen. It is used to define the order of elements if they overlap with each other.
Syntax:
z-index: auto | number | initial | inherit;
The position property in CSS tells about the method of positioning for an element or an HTML entity.
27. What are the various positioning properties in CSS?
The position property in CSS tells about the method of positioning for an element or an HTML entity. There are five different types of position properties available in CSS:
- Fixed: Any HTML element with position: fixed property will be positioned relative to the viewport. An element with fixed positioning allows it to remain at the same position even as we scroll the page. We can set the position of the element using the top, right, bottom, and left.
- Static: This method of positioning is set by default. If we don’t mention the method of positioning for any element, the element has the position: static method by default. By defining Static, the top, right, bottom and left will not have any control over the element. The element will be positioned with the normal flow of the page.
- Relative: An element with position: relative is positioned relatively with the other elements which are sitting at top of it. If we set its top, right, bottom, or left, other elements will not fill up the gap left by this element.
- Absolute: An element with position: absolute will be positioned with respect to its parent. The positioning of this element does not depend upon its siblings or the elements which are at the same level.
- Sticky: Element with position: sticky and top: 0 played a role between fixed & relative based on the position where it is placed. If the element is placed in the middle of the document then when the user scrolls the document, the sticky element starts scrolling until it touches the top. When it touches the top, it will be fixed at that place in spite of further scrolling. We can stick the element at the bottom, with the bottom property.
28. What is CSS overflow?
- The CSS overflow controls the big content. It tells whether to clip content or to add scroll bars. The overflow contains the following property:
- Visible: The content is not clipped and is visible outside the element box.
- Hidden: The overflow is clipped and the rest of the content is invisible.
- Scroll: The overflow is clipped but a scrollbar is added to see the rest of the content. The scrollbar can be horizontal or vertical.
- Auto: It automatically adds a scrollbar whenever it is required.
- Overflow-x and Overflow-y: This property specifies how to change the overflow of elements. x deals with horizontal edges and y deals with vertical edges.
29. What does the CSS float property do?
Float is a CSS property written in a CSS file or directly in the style of an element. The float property defines the flow of content. Below are the types of floating properties:
| Float type | Usage | 
|---|---|
| float: left | Element floats on the left side of the container | 
| float: right | Element floats on the right side of the container | 
| float: inherit | The element inherits the floating property of its parent (div, table, etc…) | 
| float: none | Element is displayed as it is (Default). | 
30. What does display:inline-block do?
Inline-block: This feature uses both properties: block and inline. So, this property aligns the div inline but the difference is it can edit the height and the width of the block. Basically, this will align the div both in the block and inline fashion.
Example:
<!DOCTYPE html>
<html>
    <head>
        <title>CSS | Display property</title>
        <style>
        #main{
                height: 100px;
                width: 200px;
                background: teal;
                display: inline-block;
            
            }
            #main1{
                height: 100px;
                width: 200px;
                background: cyan;
                display: inline-block;
            
            }
            #main2{
                height: 100px;
                width: 200px;
                background: green;
                display: inline-block;
            }
            .gfg {
                margin-left:200px;
                font-size:42px;
                font-weight:bold;
                color:#009900;
            }
            .geeks {
                font-size:25px;
                margin-left:210px;
            }
            .main {
                margin:50px;
            }
        </style>
    </head>
    <body>
        <div class = "gfg">GeeksforGeeks</div>
        <div class = "geeks">display: Inline-block; property</div>
        <div class = "main">
            <div id="main"> BLOCK 1 </div>
            <div id="main1"> BLOCK 2</div>
            <div id="main2">BLOCK 3 </div>
        </div>
    </body>
</html>                 
Output:
31. How can we vertically center a text in CSS?
This solution will work for a single line and multiple lines of text, but it still requires a fixed height container:
div {
    height: 200px;
    line-height: 200px;
    text-align: center;
    border: 2px dashed #f69c55;
}
span {
    display: inline-block;
    vertical-align: middle;
    line-height: normal;
}
div{
    GeeksforGeeks 
}
32. How can we center an image in CSS?
Given an image and the task is to set the image to align to center (vertically and horizontally) inside a bigger div. It can be done by using the position property of the element.
Example: This example uses the position property to make the image align to the center.
<!DOCTYPE html> 
<html> 
<head>     
    <title> 
        Horizontal and Vertical alignment 
    </title> 
    
    <!-- Style to set horizontal and 
        vertical alignment -->
    <style> 
        #Outer { 
            border: 2px solid black; 
            height: 300px; 
            position: relative; 
        } 
        img { 
            position: absolute; 
            margin: auto; 
            top: 0; 
            left: 0; 
            right: 0; 
            bottom: 0; 
        } 
    </style> 
</head> 
<body> 
    <div id = "Outer"> 
        <img src= 
"https://media.geeksforgeeks.org/wp-content/uploads/gfgbg.png"/> 
    </div> 
</body> 
</html>                     
Output:
33. What are CSS Combinators?
CSS combinators are explaining the relationship between two selectors. CSS selectors are the patterns used to select the elements for style purposes. A CSS selector can be a simple selector or a complex selector consisting of more than one selector connected using combinators.
There are four types of combinators available in CSS which are discussed below:
- General Sibling selector: The general sibling selector is used to select the element that follows the first selector element and also shares the same parent as the first selector element. This can be used to select a group of elements that share the same parent element.
- Adjacent Sibling selector: The Adjacent sibling selector is used to select the element that is adjacent or the element that is next to the specified selector tag. This combinator selects only one tag that is just next to the specified tag.
- Child Selector: This selector is used to select the element that is the immediate child of the specified tag. This combinator is stricter than the descendant selector because it selects only the second selector if it has the first selector element as its parent.
- Descendant selector: This selector is used to select all the child elements of the specified tag. The tags can be the direct child of the specified tag or can be very deep in the specified tag. This combinator combines the two selectors such that selected elements have an ancestor same as the first selector element.
34. What are pseudo-classes in CSS?
A Pseudo class in CSS is used to define the special state of an element. It can be combined with a CSS selector to add an effect to existing elements based on their states. For Example, changing the style of an element when the user hovers over it, or when a link is visited. All of these can be done using Pseudo Classes in CSS.
Syntax:
selector: pseudo-class{
     property: value;
}
There are many Pseudo-classes in CSS but the ones which are most commonly used are as follows:
- :hover Pseudo-class: This pseudo-class is used to add a special effect to an element when our mouse pointer is over it. The below example demonstrates that when your mouse enters the box area, its background color changes from yellow to orange.
- :active Pseudo-class: This pseudo-class is used to select an element that is activated when the user clicks on it. The following example demonstrates that when you click on the box, its background color changes for a moment.
- :focus Pseudo-class: This pseudo-class is used to select an element that is currently focused by the user. It works on user input elements used in forms and is triggered as soon as the user clicks on it. In the following example, the background color of the input field which is currently focused changes.
- :visited Pseudo-class: This pseudo-class is used to select the links which have been already visited by the user. In the following example, the color of the link changes once it is visited.
Note: pseudo-class names are not case-sensitive.
35. What are pseudo-elements in CSS?
Pseudo-element in CSS is used to add style to specified parts of an element.
Example: Using style before or after an element.
Syntax:
selector::pseudo-element { 
    property:value; 
} 
Use of Pseudo-Element
- ::before Pseudo-element: It is used to add some CSS property before an element when that element is called.
- ::after Pseudo-element: It is used to add some CSS property after an element when that element is called.
- ::first-letter Pseudo-element: It is used to make changes to the first letter of an element.
- ::first-line Pseudo-element: It is used to make changes to the first line of an element.
36. How can we add gradients in CSS?
There are two types of Gradients:
1. Linear Gradients: It includes the smooth color transitions to going up, down, left, right, and diagonally. A minimum of two colors are required to create a linear gradient. More than two color elements can be possible in linear gradients. The starting point and the direction are needed for the gradient effect.
Syntax:
background-image: linear-gradient(direction, color-stop1, color-stop2, ...);
2. CSS Radial Gradients: A radial gradient differs from a linear gradient. It starts at a single point and emanates outward. By default, the first color starts at the center position of the element and then fades to the end color towards the edge of the element. Fade happens at an equal rate until specified.
Syntax:
background-image: radial-gradient(shape size at position, start-color, ..., l
37. Can we add 2D transformations to our project using CSS?
Yes, we can, a transformation modifies an element by its shape, size, and position. It transforms the elements along the X-axis and Y-axis.
There are six main types of 2D transformations which are listed below:
- translate(): Moves an element from its current position
- CSS .box { transform: translate(50px, 30px); }
- rotate(): Rotates an element by the given degree
- CSS .box { transform: rotate(45deg); }
- scale(): Increases or decreases the size of an element
- CSS .box { transform: scale(1.5, 2); }
- skewX(): Skews an element along the X-axis
- CSS .box { transform: skewX(30deg); }
- skewY(): Skews an element along the Y-axis
- CSS .box { transform: skewY(20deg); }
- matrix(): Combines multiple transforms in one
- CSS .box { transform: matrix(1, 0.5, -0.5, 1, 30, 20); }
38. Can we add 3D transformations to our project using CSS?
Yes, it allows changing elements using 3D transformations. In 3D transformation, the elements are rotated along the X-axis, Y-axis, and Z-axis.
There are three main types of transformation which are listed below:
- rotateX()
- rotateY()
- rotateZ()
39. What are CSS transitions?
- Transitions in CSS allow us to control the way in which transition takes place between the two states of the element.
- The transition allows us to determine how the change in color takes place.
- We can use the transitions to animate the changes and make the changes visually appealing to the user and hence, giving a better user experience and interactivity. In this article, we will show you how to animate the transition between the CSS properties.
- There are four CSS properties that you should use, all or in part (at least two, transition-property and transition-duration, is a must), to animate the transition.
All these properties must be placed along with other CSS properties of the initial state of the element:
- transition-property: This property allows you to select the CSS properties which you want to animate during the transition(change).
Syntax:
transition-property: none | all | property | property1,
property2, ..., propertyN;
- transition-duration: This property allows you to determine how long it will take to complete the transition from one CSS property to the other.
Syntax:
transition-duration: time;
Here, time can be in seconds(s) or milliseconds(ms), you should use ‘s’ or ‘ms’ after the number (without quotes).
- transition-timing-function: This property allows you to determine the speed of change and the manner of change, during the transition. Like, the change should be fast at the beginning and slow at the end, etc.
Syntax:
transition-timing-function: ease|ease-in|ease-out|ease-in-out|linear|
step-start|step-end;
- transition-delay: This property allows you to determine the amount of time to wait before the transition actually starts to take place.
Syntax:
transition-delay: time;
Here, again, time can be in seconds(s) or milliseconds(ms), and you should use ‘s’ or ‘ms’ after the number (without quotes).
- The Shorthand Property You can combine all the four transition properties mentioned above, into one single shorthand property, according to the syntax given below. This saves us from writing long codes and prevents us from getting messy. Note the ordering of property, it has significance.
Syntax:
transition: (property name) | (duration) | (timing function) | (delay);
40. How can we animate using CSS?
CSS animations enable dynamic changes in element appearance and behavior over time using defined properties and keyframes.
- Controls movement, transitions, and visual effects of elements.
- Uses animation properties to define duration, timing, and delay.
- Uses keyframes to specify animation steps and state changes.
The @keyframes rule: Keyframes are the foundations with the help of which CSS Animations works. They define the display of the animation at the respective stages of its whole duration. For example: In the following code, the paragraph changes its color with time. At 0% completion, it is red, at 50% completion it is of orange color and at full completion i.e. at 100%, it is brown.
Example:
<!DOCTYPE html> 
<html> 
    <head> 
        <style> 
            #gfg { 
                animation-name: color; 
                animation-duration: 25s; 
                padding-top:30px; 
                padding-bottom:30px; 
                font-family:Times New Roman; 
            } 
            #geeks { 
                font-size: 40px; 
                text-align:center; 
                font-weight:bold; 
                color:#090; 
                padding-bottom:5px; 
            } 
            #geeks1 { 
                font-size:17px; 
                font-weight:bold; 
                text-align:center; 
            } 
            @keyframes color { 
                0% { 
                    background-color: red; 
                } 
                50% { 
                    background-color: orange; 
                } 
                100% { 
                    background-color: brown; 
                } 
            } 
        </style> 
    </head> 
    <body> 
        <div id = "gfg"> 
            <div id = "geeks">GeeksforGeeks</div> 
            <div id = "geeks1">
                A computer science portal for geeks
            </div> 
        </div> 
    </body> 
</html>                                                             
Output:
41. What does the CSS box-sizing property do?
The box-sizing CSS property defines how the user should calculate the total width and height of an element i.e. padding and borders, are to be included or not.
Syntax:
box-sizing: content-box|border-box;
Property Values:
- content-box: This is the default value of the box-sizing property. In this mode, the width and height properties include only the content. Border and padding are not included in it i.e if we set an element’s width to 200 pixels, then the element’s content box will be 200 pixels wide, and the width of any border or padding will be added to the final rendered width.
- border-box: In this mode, the width and height properties include content, padding, and borders i.e if we set an element’s width to 200 pixels, that 200 pixels will include any border or padding we added, and the content box will shrink to absorb that extra width. This typically makes it much easier to size elements.
42. How can we make our website responsive using CSS?
Media query is used to create a responsive web design. It means that the view of a web page differs from system to system based on screen or media types.
Media queries can be used to check many things:
- width and height of the viewport
- width and height of the device
- Orientation
- Resolution
A media query consist of a media type that can contain one or more expression which can be either true or false. The result of the query is true if the specified media matches the type of device the document is displayed on. If the media query is true then a style sheet is applied.
Syntax:
@media not | only mediatype and (expression) {
    // Code content
}
43. What is CSS flexbox?
- Flexbox, also called the flexible box model, is a layout model for arranging items in a container.
- Unlike block (vertical) and inline (horizontal) layouts, Flexbox is more flexible.
- Designed for small-scale layouts; larger layouts often use CSS Grid.
- Works similarly to Bootstrap’s grid system.
- Responsive and mobile-friendly.
- To use Flexbox, create a flex container by setting display: flex.
Syntax:
.main-container {
    display: flex;
}
Flex Properties:
- flex-direction
- flex-wrap
- flex-flow
- justify-content
- align-items
- align-content
44. What is CSS Grid?
It is a CSS property that offers a grid-based layout system, with rows and columns, making it easier to design web pages without floats and positioning.
Syntax:
grid: none|grid-template-rows / grid-template-columns|grid-template-areas|
grid-template-rows / [grid-auto-flow] grid-auto-columns|[grid-auto-flow] 
grid-auto-rows / grid-template-columns|initial|inherit;
45. What is the difference between flexbox and grid?
1. Dimensionality and Flexibility:
- Flexbox offers greater control over alignment and space distribution between items. Being one-dimensional, Flexbox only deals with either columns or rows.
- The grid has two-dimension layout capabilities which allow flexible widths as a unit of length. This compensates for the limitations in Flex.
2. Alignment:
- Flex Direction allows developers to align elements vertically or horizontally, which is used when developers create and reverse rows or columns.
- CSS Grid deploys fractional measure units for grid fluidity and auto-keyword functionality to automatically adjust columns or rows.
3. Item Management
- Flex Container is the parent element while Flex Item represents the children. The Flex Container can ensure balanced representation by adjusting item dimensions. This allows developers to design for fluctuating screen sizes.
- Grid supports both implicit and explicit content placement. Its inbuilt automation allows it to automatically extend line items and copy values into the new creation from the preceding item.
| Grid | Flexbox | 
|---|---|
| Two-Dimensional | One-Dimensional | 
| Can flex combination of items through space-occupying Features | Can push content element to extreme alignment | 
| Layout First | Content First | 
46. What is the best way to include a CSS file? Why use @import?
The External Style Sheet (using HTML <link> Tag) is the best method that is used to link the element. Maintaining and re-using the CSS file across different pages is easy and efficient. The <link> tag is placed in the HTML <head> element. To specify a media type="text/css” for a Cascading Style Sheet <type> attribute which is used to ignore style sheet types that are not supported in a browser.
@import rule: The @import rule is used to import one style sheet into another style sheet. This rule also supports media queries so that the user can import the media-dependent style sheet. The @import rule must be declared at the top of the document after any @charset declaration.
Characteristics of @import:
- The @import at-rule is used to import a style sheet into an HTML page or another style sheet.
- The @import at-rule is also used to add media queries, therefore import is media-dependent.
- It is always to be declared at the top of the document.
Syntax:
@import url|string list-of-mediaqueries;
47. How case-sensitive is CSS?
All CSS style sheets are case-insensitive, except for portions that are not under the control of CSS. For example, the case sensitivity due to values of the HTML attributes "id" and "class", font names, and URIs lies outside the scope of this specification.
48. What does CSS Animations allow?
CSS allows the animation of HTML elements without using JavaScript. An animation lets an element systematically and with proper timing, change from one style to another. You can change whatever CSS properties you want, and end a number of times, as you want it. To use CSS animation, you must first specify some @keyframes for the animation. @keyframes will describe which styles that element will have at specific times. We will be using a basic example such as the animation of a battery charging.
The @keyframes property has the option to divide the animation time into parts/percentage and perform an activity that is specified for that part of the whole duration of the animation. The @keyframes property is given to each animation according to the name of that animation. It allows you to run the animation infinitely as well.
49. What is @keyframes used for?
Keyframes are the foundations with the help of which CSS Animations works. They define the display of the animation at the respective stages of its whole duration. For example: In the following code, the paragraph changes its color with time. At 0% completion, it is red, at 50% completion it is of orange color and at full completion i.e. at 100%, it is brown.
Example:
<!DOCTYPE html> 
<html> 
<head> 
    <style> 
        div { 
            width: 200px; 
            height: 200px; 
            margin: 200px; 
            border-radius: 100px; 
            background-color: red; 
            animation: circle 8s infinite; 
        } 
        @keyframes circle { 
            0% { 
                background-color: red; 
            } 
            25% { 
                background-color: yellow; 
            } 
            50% { 
                background-color: blue; 
            } 
            100% { 
                background-color: green; 
            } 
        } 
    </style> 
</head> 
<body> 
    <div></div> 
</body> 
</html> 
Output:
50. What are CSS counters?
Counters in CSS are basically variables that can be used for numbering and values of CSS counters may be incremented by CSS rules. For example, CSS counters can be used to increment the numbering of the headings automatically. In HTML, the <ol> tag is used to give the ordered numbers to list items but CSS contains a counter to give order elements in some other fashion.
CSS counters properties:
- counter-reset: It is used to reset a counter.
- counter-increment: It basically increments a counter value.
- content: It is used to generate content.
- counter() or counters() function: The value of a counter can be displayed using either the counter() or counters() function in a content property. These two functions basically used to add the value of a counter to the element.
Initialization of the CSS Counter: To use the CSS counter property firstly it must be created with the counter-reset property and the first step is resetting the counter. The counter by default initialized to a value 0(zero) with the counter-reset property.
Syntax:
counter-reset: myCounter;
Incrementation and Use of CSS Counter: To increment the counter use the CSS counter-increment property.
Syntax:
counter-increment: myCounter;
The counter() or counters() function in content is used to display the content in a particular order.
Syntax:
content: counter(myCounter);
51. What is meant by universal selector?
The * selector in CSS is used to select all the elements in an HTML document. It also selects all elements which are inside under another element. It is also called the universal selector.
Syntax:
* {
    // CSS property
} 
To know more about the topic refer to Universal selector.
52. What is RWD?
Responsive Web Design comprises two words i.e., responsive and web design. Responsive means to respond and web design means to design a website. Therefore, responsive web design generally means the website that responds to or resizes or adjusts itself depending upon the screen size it is being seen through.
It automatically adjusts to fit the user’s screen whether it’s desktop, laptop, mobile, tablet, etc. It only uses one layout for a web page and it can be done either using CSS and HTML or CSS3 and HTML5.
To know more about the topic refer to RWD .
53. What is the difference between class and id selector?
Id selector(“#”): The id selector selects the id attribute of an HTML element to select a specific element. An id is always unique within the page so it is chosen to select a single, unique element. It is written with the hash character (#), followed by the id of the element.
- Syntax:
#element_id_name{
    // CSS properties
}
Class Selector(“.”): The Class Selector selects HTML elements with a specific class attribute. It is used with a period character “.” (full stop symbol) followed by the class name.
- Syntax:
.element_class_name{
    // CSS properties
}
| Class "." | Id "#" | 
|---|---|
| Represents class="class_name" in HTML. | Represents id="id_name" in HTML. | 
| An element can have multiple classes. | An element can have only one ID. | 
| Classes are reusable across multiple elements. | IDs must be unique within a page. | 
| Selected using . (e.g., .box). | Selected using # (e.g., #header). | 
| Can be applied to multiple elements. | Applied to a single unique element. | 
54. How can we use pagination in CSS?
Pagination is the process of dividing the document into pages and providing them with numbers.
Types of Pagination:
- Simple Pagination
- Active and Hoverable Pagination
- Rounded Active and Hoverable Buttons
- Hoverable Transition Effect
- Bordered Pagination
- Rounded Border Pagination
- Centered Pagination
- Space between Pagination
- Pagination Size
Simple Pagination: This is the basic form of pagination.
Syntax:
.pagination {
    display:type
}
.pagination body {
    color:colorname
    decoration:type
}
55. What is CSS Image reflection?
The box-reflect property is used to create an image reflection.
Attributes:
- below: to create a reflection below the original image
- above: to create a reflection above the original image
- left: to create a reflection on the left side of the original image
- right: to create a reflection on the right side of the original image
Example:
<!DOCTYPE html>
<html>
<head>
    <style>
        img {
            -webkit-box-reflect: right;
        }
    </style>
</head>
<body>
    <h1>CSS Image Reflection</h1>
    <p>Shows the reflection of the image on right side:</p>
    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20210322123023/gfg2.png">
</body>
</html>
Output:
56. How can we create multiple columns of text-like newspapers using CSS?
The multiple columns are used to create column layouts on the web pages. There are many column properties in CSS which are listed below:
- column-count
- column-gap
- column-rule-style
- column-rule-width
- column-rule-color
- column-rule
- column-span
- column-width
Example:
<!DOCTYPE html>
<html>
    <head>
        <title>Column-count property</title>
        <style>
        .geeks_content {
            -webkit-column-count: 3;
            -moz-column-count: 3;
            column-count: 3;
            padding-top:35px;
            text-align:justify;
        }
        .gfg {
            text-align:center;
            font-size:40px;
            font-weight:bold;
            color:green;
        }
        .geeks {
            text-align:center;
        }
        </style>
    </head>
    <body>
        <div class="gfg">GeeksforGeeks</div>
        <div class = "geeks">A computer science portal for geeks</div>
        <div class="geeks_content">
            Sudo Placement: Prepare for the Recruitment
            drive of product based companies like Microsoft,
            Amazon, Adobe etc with a free online placement
            preparation course. The course focuses on
            various MCQ's & Coding question likely to be
            asked in the interviews & make your upcoming 
            placement season efficient and successful. 
            Placement preparation solely depends on the
            company for which you are preparing. There 
            are basically three different categories 
            into which we can divide the companies visiting 
            campuses for placements based on their recruitment 
            process. Mass Recruiters, Tech Giants, Others / Start-ups
            Companies belonging to the above categories have 
            their own recruitment process. In this course, we
            will try to cover every possible detail required
            to know for cracking interview of the companies 
            falling in each of the above categories.
        </div>
    </body>
</html>                 
Output:
57. How can we give a shadow effect to our text in CSS?
The approach of this article is to add a shadow using the text-shadow property in CSS. This property accepts a list of a comma-separated list of shadows to be applied to the text. The default value of the text-shadow property is “none”.
Syntax:
text-shadow: h-shadow v-shadow blur-radius color|none|initial|58. What is !important?
The !important property in CSS is used to provide more weight (importance) than normal property. In CSS, the !important means that “this is important”, ignore all the subsequent rules, and apply !important rule and the !important keyword must be placed at the end of the line, immediately before the semicolon.
- In other words, it adds importance to all the sub-properties that the shorthand property represents.
- In normal use, a rule defined in an external style sheet which is overruled by a style defined in the head of the document, which in turn, is overruled by an inline style within the element itself (assuming equal specificity of the selectors).
- Defining a rule with the !important attribute that discards the normal concerns as regards the later rule overriding the earlier ones.
- So, it is used for overriding the styles that are previously declared in other style sources, in order to achieve a certain design.
Syntax:
element {
    color: blue  !important;
    font-size: 14px !important; 
    ...
}
59. What is specificity in CSS?
When more than one set of CSS rules applies to the same element, the browser will have to decide which specific set will be applied to the element. The rules the browser follows are collectively called Specificity
Specificity Rules include:
- CSS style applied by referencing external stylesheet has the lowest precedence and is overridden by Internal and inline CSS.
- Internal CSS is overridden by inline CSS.
- Inline CSS has the highest priority and overrides all other selectors.
Specificity Hierarchy: Every element selector has a position in the Hierarchy.
- Inline style: Inline style has the highest priority.
- Identifiers(ID): ID has the second-highest priority.
- Classes, pseudo-classes, and attributes: Classes, pseudo-classes, and attributes have come next.
- Elements and pseudo-elements: Elements and pseudo-elements have the lowest priority.
60. What are the attribute selectors?
The CSS Attribute Selector is used to target and style elements based on their attributes or attribute values. It allows grouping elements with common attributes, making styling more precise and efficient.
There are several types of attribute selectors which are discussed below:
- [attribute] Selector: This type of attribute selector is used to select all the elements that have the specified attribute and applies the CSS property to that attribute. For example, the selector [class] will select all the elements with the style attribute.
- [attribute = “value”] Selector: This selector is used to select all the elements whose attribute has the value exactly the same as the specified value.
- [attribute~=”value”] Selector: This selector is used to select all the elements whose attribute value is a list of space-separated values, one of which is exactly equal to the specified value.
- [attribute|=”value”] Selector: This selector is used to select all the elements whose attribute has a hyphen-separated list of values beginning with the specified value. The value has to be a whole word either alone or followed by a hyphen.
- [attribute^=”value”] Selector: This selector is used to select all the elements whose attribute value begins with the specified value. The value doesn’t need to be a whole word.
- [attribute$=”value”] Selector: This selector is used to select all the elements whose attribute value ends with the specified value. The value doesn’t need to be a whole word.
- [attribute*=”value”] Selector: This selector selects all the elements whose attribute value contains the specified value present anywhere. The value doesn’t need to be a whole word.
