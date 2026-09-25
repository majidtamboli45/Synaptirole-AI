# Create GeeksforGeeks Logo Using HTML and CSS

> Source: https://www.geeksforgeeks.org/css/create-geeksforgeeks-logo-using-html-and-css

Designing a logo using HTML and CSS helps create scalable and lightweight graphics directly in the browser.
- Uses HTML elements and CSS styling to build logo shapes and design.
- Provides better scalability and easy customization without using images.
Steps to create a Logo
Follow these steps to build the GeeksforGeeks logo structure and style it using CSS.
Step 1: Create the Basic Structure
- To create the GFG logo, use two inline divs for circles, wrapped in a flex-display wrapper div.
- Apply a 10px solid green border for the outline.
Step 2: Add Triangles Using Pseudo-Elements
- Now create a triangle on both the circles using the pseudo-element: "after" and absolute position property.
- After applying the triangle we will get the shape like this.
After applying the white background color into the triangles the result is:
Step 3: Add a Square Between Circles
- Now using the pseudo-element :before and position absolute property, create a square.
- You can apply this rule to any of the circles. The resulting logo looks like this:
Approach
To design the GFG logo using HTML and CSS, we create structured elements and style them step by step using CSS properties and pseudo-elements.
- Create two divs (circle1, circle2) inside a parent wrapper div.
- Style the wrapper and both circles using CSS.
- Add invisible triangles using the :after pseudo-element.
- Add a square using the :before pseudo-element.
<!DOCTYPE html>
<html>
<head>
    <style>
        .wrapper {
            display: flex
        }
        .circle {
            height: 100px;
            width: 100px;
            border: 20px solid green;
            border-radius: 100px;
            position: relative;
        }
        .circle:after {
            content: "";
            position: absolute;
            border-top: 100px solid transparent;
            top: -35px;
        }
        .circle1:after {
            border-left: 140px solid #EFEFEF;
            left: -50px;
            top: -35px;
        }
        .circle2:after {
            border-right: 140px solid #EFEFEF;
            right: -50px;
        }
        .circle1:before {
            content: "";
            height: 20px;
            width: 276px;
            position: absolute;
            background: green;
            left: -18px;
            top: 45px;
            z-index: 1;
        }
    </style>
</head>
<body>
    <div class="wrapper">
        <div class="circle circle1"></div>
        <div class="circle circle2"></div>
    </div>
</body>
</html>
Output:
