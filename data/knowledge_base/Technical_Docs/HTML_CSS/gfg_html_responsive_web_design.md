# HTML Responsive Web Design

> Source: https://www.geeksforgeeks.org/html/html-responsive-web-design

Responsive Web Design (RWD) is a web development approach that ensures web pages automatically adjust their layout and elements to look and function properly on any device. It allows content to resize, reposition, or hide dynamically for an optimal viewing experience.
- Uses flexible grids and layouts that adapt to different screen sizes.
- Employs CSS media queries to apply styles based on device characteristics.
- Ensures images and media scale proportionally across all screen sizes.
- Improves user experience while eliminating the need for separate mobile and desktop websites.
HTML Responsive Web Design can be implemented using various techniques such as viewport settings, flexible images, scalable text, media queries, and modern layout systems.
1. HTML Viewport meta Tag
The HTML viewport defines the visible area of a webpage on a device screen. It helps control how a webpage is scaled and displayed across different devices.
- Sets the page width to match the device width for proper scaling.
- Ensures content adapts correctly to different screen sizes for responsive layouts.
Syntax:
<meta name="viewport" content= "width=device-width, initial-scale=1.0">
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        .gfg {
            font-size: 40px;
            font-weight: bold;
            color: green;
            text-align: center;
        }
        .geeks {
            font-size: 17px;
            text-align: center;
        }
        p {
            text-align: justify;
        }
    </style>
</head>
<body>
    <div class="gfg">GeeksforGeeks</div>
    <div class="geeks">HTML Introduction</div>
    <p>
        HTML stands for HyperText Markup Language. It is
        used to design web pages using a markup
        language. HTML is a combination of Hypertext and
        Markup language. Hypertext defines the link
        between web pages. A markup language is used to
        define the text document within the tag which
        defines the structure of web pages. This
        language is used to annotate (make notes for the
        computer) text so that a machine can understand
        it and manipulate text accordingly. Most markup
        languages (e.g. HTML) are human-readable. The
        language uses tags to define what manipulation
        has to be done on the text.
    </p>
</body>
</html>
Output:
2. Responsive Images
Responsive images play a key role in responsive websites. These are images that can adjust their size, getting bigger or smaller, based on the width of the browser. By being responsive, images enhance user experience across different devices with varying screen sizes.
The following are the techniques to use the responsive images:
1. Using width Property
The image can be responsive & scale up & down with the help of CSS width property by setting its value as 100%.
Syntax:
<img src="..." style="width:100%;">
Example: In this example, we will use the image width property to occupy 100% of the screen width.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <img class=".img-fluid" src=
"https://media.geeksforgeeks.org/wp-content/uploads/20220201191443/logo-200x32.png"
         style="width: 100%" />
    <h2>Responsive Images</h2>
    <p>
        Responsive images are just a part of Responsive
        websites. Images that can change their
        dimensions, scaling them up or down, according
        to the browser width are responsive images. The
        above image is responsive as it is adjusting
        itself according to the width of the browser.
    </p>
</body>
</html>
Output:
2. Using the max-width Property
The max-width property defines the maximum width an element can expand to, preventing it from exceeding a specified value. It helps maintain responsiveness by ensuring elements do not overflow their container.
- Prevents images or elements from growing beyond their original or container width.
- Commonly used with height: auto; to maintain proper aspect ratio in responsive designs.
Syntax:
<img src="..." style="max-width:100%; height:auto;">
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <img class=".img-fluid"
         src=
"https://media.geeksforgeeks.org/wp-content/uploads/20220201191443/logo-200x32.png"
         style="max-width:100%;
                height:auto;" />
    <h2>Responsive Images</h2>
    <p>
        Responsive images are just a part of Responsive
        websites. Images that can change their
        dimensions, scaling them up or down, according
        to the browser width are responsive images. The
        above image is responsive as it is adjusting
        itself according to the width of the browser.
    </p>
</body>
</html>
Output
3. Responsive Images for Different Screen Sizes
The <picture> element allows developers to display different images based on the screen size or device characteristics. It provides flexibility to serve the most appropriate image depending on the browser width.
- Uses multiple <source> elements with media conditions to define breakpoints.
- Improves performance and responsiveness by loading optimized images for each screen size.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body style="text-align: center;">
    <h1 style="color: green;">GeeksforGeeks</h1>
    <h2>HTML picture Tag</h2>
    <picture>
        <source media="(min-width: 700px)"
                srcset=
"https://media.geeksforgeeks.org/wp-content/uploads/20190825000042/geeks-221.png">
        <source media="(min-width: 450px)"
                srcset=
"https://media.geeksforgeeks.org/wp-content/uploads/20190802021607/geeks14.png">
        <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20190808102629/geeks15.png"
             alt="GFG">
    </picture>
</body>
</html>
Output:
3. Responsive Texts
Responsive text adjusts its size based on the screen or viewport dimensions using relative units instead of fixed pixel values, ensuring better readability across devices.
- Uses relative units like %, vw, vh, em, and rem for dynamic scaling.
- Adjusts automatically according to viewport width and height.
- Maintains readability and layout consistency across different screen sizes.
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            max-width: 100%;
        }
        .gfg {
            font-size: 7vw;
            font-weight: bold;
            color: green;
            text-align: center;
        }
        .geeks {
            font-size: 5vw;
            text-align: center;
        }
        p {
            font-size: 3vw;
            text-align: justify;
        }
    </style>
</head>
<body>
    <div class="gfg">GeeksforGeeks</div>
    <div class="geeks">HTML Introduction</div>
    <p>
        HTML stands for HyperText Markup Language. It is
        used to design web pages using a markup
        language. HTML is a combination of Hypertext and
        Markup language. Hypertext defines the link
        between web pages. A markup language is used to
        define the text document within the tag which
        defines the structure of web pages. This
        language is used to annotate (make notes for the
        computer) text so that a machine can understand
        it and manipulate text accordingly. Most markup
        languages (e.g. HTML) are human-readable. The
        language uses tags to define what manipulation
        has to be done on the text.
    </p>
</body>
</html>
Output:
4. CSS Media Queries
The Media query in CSS is essential for crafting responsive web designs. It ensures that web pages adapt to various screen sizes and device types. Breakpoints are set to define when the content starts to adjust or change layout based on the device's width.
Media queries can be used to check many things:
- width and height of the viewport
- width and height of the device
- Orientation
- Resolution
Syntax:
@media not | only mediatype and (expression) {
// Code content
}
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        .gfg {
            font-size: 100px;
            font-weight: bold;
            color: green;
            text-align: center;
        }
        .geeks {
            font-size: 50px;
            text-align: center;
        }
        p {
            font-size: 25px;
            text-align: justify;
        }
        @media screen and (max-width: 800px) {
            body {
                background-color: aqua;
            }
            .gfg {
                font-size: 50px;
            }
            .geeks {
                font-size: 25px;
            }
            p {
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="gfg">GeeksforGeeks</div>
    <div class="geeks">HTML Introduction</div>
    <p>
        HTML stands for HyperText Markup Language. It is
        used to design web pages using a markup
        language. HTML is a combination of Hypertext and
        Markup language. Hypertext defines the link
        between web pages. A markup language is used to
        define the text document within the tag which
        defines the structure of web pages. This
        language is used to annotate (make notes for the
        computer) text so that a machine can understand
        it and manipulate text accordingly. Most markup
        languages (e.g. HTML) are human-readable. The
        language uses tags to define what manipulation
        has to be done on the text.
    </p>
</body>
</html>
Output: Background color and font size transition for width less than 800px.
Note: Sometimes, this method doesn't show the correct output on Google Chrome.
5. Responsive Layouts
Responsive layouts in CSS use modern layout systems like Flexbox, Grid, and Multi-Column to automatically adjust content based on screen size. The responsive layout module of CSS includes the following properties:
1. Using flexbox property
In this approach, we will use CSS display property to make the page responsive. Display layouts like flexbox, inline, blocks, and grids can be used to make the design responsive. CSS flexbox property auto adjusts the content (no. of columns in a row) according to the screen width as shown in the output gif.
Syntax:
.container{
display: flexbox;
}
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        body {
            background-color: aqua;
        }
        .gfg {
            font-size: 5vw;
            font-weight: bold;
            color: green;
            text-align: center;
        }
        button {
            width: 300px;
            font-size: larger;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
        }
    </style>
</head>
<body>
    <div class="gfg">GeeksforGeeks</div>
    <div class="container">
        <button>HTML</button>
        <button>CSS</button>
        <button>JavaScript</button>
    </div>
</body>
</html>
Output:
Note: Sometimes, this method doesn't show the correct output on Google Chrome.
2 Using CSS Grids
This approach uses a CSS display grid to create a 2D layout along with other grid options. It allows us to decide the number of columns we want to keep and instead of rearranging the columns like Flexbox, it adjusts the content within individual column elements.
Syntax
.container{
display: grid;
/* To define colums*/
grid-template-columns: 1fr 1fr;
}
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        body {
            background-color: aqua;
        }
        .gfg {
            font-size: 5vw;
            font-weight: bold;
            color: green;
            text-align: center;
        }
        .container {
            font-size: x-large;
            text-align: center;
            display: grid;
            grid-template-columns: 1fr 1fr;
        }
        .grid-item {
            background-color: rgb(220, 208, 232);
            border: 2px solid rgb(70, 54, 84);
        }
    </style>
</head>
<body>
    <div class="gfg">GeeksforGeeks</div>
    <div class="container">
        <div class="grid-item">HTML</div>
        <div class="grid-item">CSS</div>
        <div class="grid-item">JavaScript</div>
        <div class="grid-item">Bootstrap</div>
    </div>
</body>
</html>
Output:
Note: Sometimes, this method doesn't show the correct output on Google Chrome.
3 Using CSS Multi-Column
CSS Multi-Column layout is used to divide content into multiple vertical columns within a container. It automatically distributes text across the defined number of columns, improving readability in content-heavy layouts.
Syntax:
.container{
column-count: 3; /* Number of columns*/
column-gap: 20px; /* Gap between columns*/
column-width: 200px; /* Width of each column*/
/* Other column properties*/
}
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        body {
            background-color: aqua;
        }
        .gfg {
            font-size: 5vw;
            font-weight: bold;
            color: green;
            text-align: center;
        }
        .container {
            font-size: x-large;
            text-align: left;
            column-count: 3;
            column-gap: 5%;
        }
    </style>
</head>
<body>
    <div class="gfg">GeeksforGeeks</div>
    <div class="container">
        <div>
            HTML stands for HyperText Markup Language.
            It is used to design web pages using a
            markup language. HTML is a combination of
            Hypertext and Markup language. Hypertext
            defines the link between web pages. A markup
            language is used to define the text document
            within the tag which defines the structure
            of web pages. This language is used to
            annotate (make notes for the computer) text
            so that a machine can understand it and
            manipulate text accordingly. Most markup
            languages (e.g. HTML) are human-readable.
            The language uses tags to define what
            manipulation has to be done on the text.
        </div>
    </div>
</body>
</html>
