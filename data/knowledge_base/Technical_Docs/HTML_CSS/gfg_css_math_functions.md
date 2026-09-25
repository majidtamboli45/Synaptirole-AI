# CSS Math Functions

> Source: https://www.geeksforgeeks.org/css/css-math-functions

CSS Math Functions allow you to perform calculations directly in stylesheets, enabling flexible and responsive designs. They help dynamically adjust values based on different conditions.
- Common functions include calc(), max(), and min() for dynamic sizing and spacing.
- Useful for creating responsive layouts without relying on JavaScript.
- Helps combine different units (like %, px, vw) in a single expression.
1. calc() Function
The calc() function allows you to perform mathematical calculations in CSS. It supports addition (+), subtraction (-), multiplication (*), and division (/).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: calc(50% - 20px);
            height: 100px;
            background-color: lightblue;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The width of the .box is set to 50% of the container's width, minus 20px for padding.
- This ensures the box takes up half of the container's width but with an offset of 20px on each side.
2. min() Function
The min() function returns the smallest value from a list of values. It’s useful when you want an element’s property to have a dynamic value that adjusts based on other conditions but doesn't exceed a certain limit.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: min(200px, 50%);
            height: 100px;
            background-color: lightgreen;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box width will be either 200px or 50% of the container width, whichever is smaller.
- This is useful in responsive designs where you don’t want the element to grow beyond a certain size.
3. max() Function
The max() function works the opposite of min(). It returns the largest value from a list of values. This is useful when you want an element's property to be at least a certain size but can grow larger if necessary.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: max(300px, 50%);
            height: 100px;
            background-color: lightcoral;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box width will be either 300px or 50% of the container width, whichever is larger.
- This ensures that the box always has a minimum width of 300px, but can expand further if the container allows.
4. clamp() Function
The clamp() function defines a value that is constrained within a defined minimum and maximum range, while allowing for a preferred value in between. This is perfect for creating responsive designs that adjust with the viewport size.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            font-size: clamp(14px, 5vw, 24px);
            height: 100px;
            background-color: lightgoldenrodyellow;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box">Responsive Text</div>
</body>
</html>
<!--Driver Code Ends-->
- The font-size is set to scale with the viewport width (5vw), but it will not go below 14px or exceed 24px.
- This is useful for making text responsive, ensuring readability across devices without it getting too small or too large.
5. var() Function
The var() function is used to access the value of a CSS custom property (variable). Custom properties allow you to store values and reuse them throughout your CSS, making the code more maintainable and flexible.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        :root {
            --box-width: 300px;
        }
        .box {
            width: var(--box-width);
            height: 100px;
            background-color: lightpink;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The :root selector defines a custom property --box-width with a value of 300px.
- The .box then uses this custom property to set its width, making it easy to reuse the value elsewhere in the stylesheet.
- If you need to change the width, you only need to update it in one place (--box-width).
Exponential functions
| Type | Syntax | Description | 
|---|---|---|
| pow() Function | width: calc(10px * pow(5,2)); | It calculates the base raised to the power of the number. | 
| sqrt() Function | width: calc(100px * sqrt(9)); | It calculates the square root of a number | 
| hypot() Function | width: hypot(3em, 4em); | It calculates the square root of the sum of the squares of its arguments. | 
| log() Function | width: calc(100px * log(8, 2)); /* 300px */ | It calculates the logarithm of a number | 
| exp() Function | width: calc(100px * exp(0)); /* 100px * 1 = 100px */ | It is used to calculate e raised to the power of a number. | 
Sign-related functions
| Type | Syntax | Description | 
|---|---|---|
| abs() Function | width: abs(20% - 100px); | It calculates the absolute value of the number | 
| sign() Function | top: sign(20vh - 100px); | It calculates the sign of the number | 
Stepped value functions
| Type | Syntax | Description | 
|---|---|---|
| round() Function | property: round(<rounding-strategy>, valueToRound, roundingInterval); | It calculates the rounded number based on the rounding strategy. | 
| mod() Function | mod(dividend, divisor) | It calculates the modulus by dividing one number by another. | 
| rem() Function | rem(dividend, divisor) | It calculates the remainder by dividing one number with another. | 
Best Practices for Using Math Functions in CSS
- Combine Units Easily: Use calc() to mix different CSS units (e.g., percentages and pixels) for more flexible layouts.
- Set Responsive Limits: Apply min(), max(), and clamp() to ensure elements adapt smoothly to various screen sizes.
- Keep Calculations Simple: Avoid overly complex expressions to maintain readability and ease of maintenance.
