# CSS align-items Property

> Source: https://www.geeksforgeeks.org/css/css-align-items-property

The align-items property in CSS is used to align flex items along the cross-axis within a flex container. It accepts values like flex-start, flex-end, center, baseline, and stretch, controlling the vertical alignment of items in a flexbox.
Syntax
align-items: normal | stretch | center | flex-start | flex-end | baseline | first baseline | last baseline | 
start | end | self-start | self-end | safe center | unsafe center | initial | inherit;
Default Value
stretch
Property Values
| Values | Description | 
|---|---|
| stretch value | Stretches the items to fill the available space on the cross-axis | 
| center value | Centers the items on the cross-axis. | 
| flex-start value | Align the items to the start edge of the container on the cross-axis. | 
| flex-end value | Align the items to the end edge of the container on the cross-axis. | 
| baseline value | Aligns the items based on the baseline of their first line of text. | 
| initial value | Sets the value of the property to its default value. | 
| inherit value | Inherits the value of the property from the parent element. | 
Here we will explore each property value with their examples:
1. Normal Value
The normal value behaves as the default alignment in the flex container. It generally acts like stretch in most cases, making items fill the container's cross-axis, but it can also behave differently depending on the flex context or item-specific properties.
Syntax:
align-items: normal;
Example: In this example, we are demonstrating the align-items: normal property in a flex container. The normal div has two child divs with blue and red backgrounds, and by default, they align according to the container's natural flow, stretching to fit the available space as needed.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS align-items: normal Property
    </title>
    <style>
        #normal {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: normal;
        }
    </style>
</head>
<body>
    <center>
        <h1 style="color:green;">GeeksforGeeks</h1>
        <div id="normal">
            <div style="background-color:blue;">
                Blue
            </div>
            <div style="background-color:red;">
                Red
            </div>
        </div>
    </center>
</body>
</html>
Output:
2. stretch value
The stretch value makes flex items fill the container's cross-axis, adjusting their height or width to match the container.
Syntax:
align-items: stretch;
Example: In this example we demonstrating align-items: stretch property in a flex container. The #stretch div has two child divs with purple and yellow backgrounds, stretching to fill the container's height.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS align-items Property
    </title>
    <style>
        #stretch {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: stretch;
        }
    </style>
</head>
<body>
    <center>
        <h1 style="color:green;">GeeksforGeeks</h1>
        <div id="stretch">
            <div style="background-color:Purple;">
                Purple
            </div>
            <div style="background-color:Yellow;">
                Yellow
            </div>
        </div>
    </center>
</body>
</html>
Output:
3. center value
The align-items: center value vertically centers flex items along the container's cross-axis, aligning them in the middle.
Syntax:
align-items: center;
Example: In this example we are using align-items: center in a flex container. The #center div contains purple and yellow child divs, centered vertically within the container.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS align-items Property
    </title>
    <style>
        #center {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: center;
        }
    </style>
</head>
<body>
    <center>
        <h1 style="color:green;">GeeksforGeeks</h1>
        <div id="center">
            <div style="background-color:Purple;">
                Purple
            </div>
            <div style="background-color:Yellow;">
                Yellow
            </div>
        </div>
    </center>
</body>
</html>
Output:
4. flex-start value
The align-items: flex-start value aligns flex items to the start of the container's cross-axis, positioning them at the top.
Syntax:
align-items: flex-start;
Example: In this example we are using align-items: flex-start in a flex container. The #flex-start div contains purple and yellow child divs, aligned at the top within the container.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS | align-items Property
    </title>
    <style>
        #flex-start {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: flex-start;
        }
    </style>
</head>
<body>
    <center>
        <h1 style="color:green;">GeeksforGeeks</h1>
        <div id="flex-start">
            <div style="background-color:Purple;">
                Purple
            </div>
            <div style="background-color:Yellow;">
                Yellow
            </div>
        </div>
    </center>
</body>
</html>
Output:
5. flex-end value
The align-items: flex-end value aligns flex items to the end of the container's cross-axis, positioning them at the bottom.
Syntax:
align-items: flex-end;
Example: In this example we are using align-items: flex-end in a flex container. The #flex-end div contains purple and yellow child divs, aligned at the bottom within the container.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS | align-items Property
    </title>
    <style>
        #flex-end {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: flex-end;
        }
    </style>
</head>
<body>
    <center>
        <h1 style="color:green;">GeeksforGeeks</h1>
        <div id="flex-end">
            <div style="background-color:Purple;">
                Purple
            </div>
            <div style="background-color:Yellow;">
                Yellow
            </div>
        </div>
    </center>
</body>
</html>
Output:
6. baseline value
The align-items: baseline value aligns flex items along the container's cross-axis based on their baseline, ensuring text alignment consistency.
Syntax:
align-items: baseline;
Example: In this example we are using align-items: baseline in a flex container. The #baseline div contains purple and yellow child divs, aligned along their baselines within the container.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS | align-items Property
    </title>
    <style>
        #flex-end {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: flex-end;
        }
    </style>
</head>
<body>
    <center>
        <h1 style="color:green;">GeeksforGeeks</h1>
        <div id="flex-end">
            <div style="background-color:Purple;">
                Purple
            </div>
            <div style="background-color:Yellow;">
                Yellow
            </div>
        </div>
    </center>
</body>
</html>
Output:
7. initial value
The align-items: initial value sets the property to its default value, which is `stretch`, aligning items to fill the container.
Syntax:
align-items: initial;
Example: In this example we are using align-items: initial in a flex container. The #initial div contains purple and yellow child divs, aligned based on the browser's default setting within the container.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS align-items Property
    </title>
    <style>
        #initial {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: initial;
        }
    </style>
</head>
<body>
    <center>
        <h1 style="color:green;">GeeksforGeeks</h1>
        <div id="initial">
            <div style="background-color:Purple;">
                Purple
            </div>
            <div style="background-color:Yellow;">
                Yellow
            </div>
        </div>
    </center>
</body>
</html>
Output:
8. inherit Value 
The inherit value for the align-items property causes the element to inherit the alignment behavior from its parent element. This means the items within the element will be aligned in the same way as the items within the parent element.
Syntax:
align-items: inherit;
Example: In this example, we're using align-items: inherit in a flex container. The #inherit div contains purple and yellow child divs, aligned based on the alignment of the parent flex container, which is set to align-items: flex-end.
<!DOCTYPE html>
<html>
<head>
    <title>
        CSS align-items Property
    </title>
    <style>
        #initial {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: flex-end; /* Parent container's alignment */
        }
        #inherit {
            width: 320px;
            height: 200px;
            border: 2px solid black;
            display: flex;
            align-items: inherit;
        }
    </style>
</head>
<body>
    <center>
        <h1 style="color:green;">GeeksforGeeks</h1>
        <div id="initial">
            <div style="background-color:Purple;">
                Purple
            </div>
            <div style="background-color:Yellow;">
                Yellow
            </div>
        </div>
        <div id="inherit">
            <div style="background-color:Purple;">
                Purple
            </div>
            <div style="background-color:Yellow;">
                Yellow
            </div>
        </div>
    </center>
</body>
</html>
Output:
Supported Browsers
The browser supported by CSS align-items property are listed below:
Most modern browsers support these properties. However, some older or less common browsers may not fully support the align-items property, including:
- Internet Explorer (partially supported in IE 11 with limited flexbox features)
- Opera Mini (lacks full support for flexbox and related properties)
