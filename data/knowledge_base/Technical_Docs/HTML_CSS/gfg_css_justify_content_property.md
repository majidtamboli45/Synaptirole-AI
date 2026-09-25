# CSS justify-content Property

> Source: https://www.geeksforgeeks.org/css/css-justify-content-property

The justify-content property in CSS is used to align the flexible box container's items along the main axis of a flex container. This property manages space distribution between and around content items in a flex container.
Note: This property does not align items along the vertical axis. For vertical alignment, use the align-items property.
The alignment is possible after applying the lengths and auto margins properties, ie., if there is at least one flexible element, with flex-grow property, other than 0, in a Flexbox layout then it will not impact & have any effect as there won't be any available space.
Syntax
justify-content: flex-start | flex-end | center | space-between | space-around | space-evenly | initial | inherit;
Property Values
Here are the different property values used in CSS flexbox alignment, along with their descriptions:
| Value | Description | 
|---|---|
| flex-start | Align flex items at the start of the container. | 
| flex-end | Align flex items at the end of the container. | 
| center | Align flex items at the center of the container. | 
| space-between | Distributes items evenly with the first item at the start and the last item at the end. | 
| space-around | Distributes items with equal spacing before, between, and after each item. | 
| space-evenly | Distributes items with equal spacing between them, and the spacing from the edges is also equal. | 
| initial | Sets the property to its default value. | 
| inherit | Inherits the value from its parent element. | 
Understanding Each Property
Below is a detailed explanation of each property, including its syntax and an example for better understanding:
1 . flext-start
The flex-start value aligns flex items at the start of the container, positioning them from the left side (or top in case of vertical alignment).
Syntax:
justify-content: flex-start;
Example: This example illustrates the justify-content property where the property value is set to flex-start to align the item from the start of the container.
<!DOCTYPE html>
<html>
<head>
    <title> CSS justify-content Property </title>
    <style>
        #box {
            display: flex;
            border: 1px solid black;
            justify-content: flex-start;
        }
        #box div {
            width: 110px;
            height: 120px;
            border: 1px solid black;
            background: linear-gradient(green, silver);
        }
    </style>
</head>
<body>
    <div id="box">
        <div>1
            <p>GeeksforGeeks</p>
        </div>
        <div>2
            <p>GeeksforGeeks</p>
        </div>
        <div>3
            <p>GeeksforGeeks</p>
        </div>
        <div>4
            <p>GeeksforGeeks</p>
        </div>
    </div>
</body>
</html>
Output:
2. Flex-End
The flex-end value aligns flex items at the end of the container, positioning them to the right side (or bottom in case of vertical alignment).
Syntax:
justify-content: flex-end;
Example: This example illustrates the justify-content property where the property value is set to flex-end.
<!DOCTYPE html>
<html>
<head>
    <title> CSS justify-content Property </title>
    <style>
        #box {
            display: flex;
            border: 1px solid black;
            justify-content: flex-end;
        }
        #box div {
            width: 110px;
            height: 120px;
            border: 1px solid black;
            background: linear-gradient(green, silver);
        }
    </style>
</head>
<body>
    <div id="box">
        <div>1
            <p>GeeksforGeeks</p>
        </div>
        <div>2
            <p>GeeksforGeeks</p>
        </div>
        <div>3
            <p>GeeksforGeeks</p>
        </div>
        <div>4
            <p>GeeksforGeeks</p>
        </div>
    </div>
</body>
</html>
Output:
3. Center
The center value aligns flex items at the center of the container, placing them equally between the start and end.
Syntax:
justify-content: center;
Example: This example illustrates the justify-content property where the property value is set to center.
<!DOCTYPE html>
<html>
<head>
    <title> CSS justify-content Property </title>
    <style>
        #box {
            display: flex;
            border: 1px solid black;
            justify-content: center;
        }
        #box div {
            width: 110px;
            height: 120px;
            border: 1px solid black;
            background: linear-gradient(green, silver);
        }
    </style>
</head>
<body>
    <div id="box">
        <div>1
            <p>GeeksforGeeks</p>
        </div>
        <div>2
            <p>GeeksforGeeks</p>
        </div>
        <div>3
            <p>GeeksforGeeks</p>
        </div>
        <div>4
            <p>GeeksforGeeks</p>
        </div>
    </div>
</body>
</html>
Output:
4. Space-Between
The space-between value distributes flex items evenly across the container, with the first item aligned at the start and the last item aligned at the end.
Syntax:
justify-content: space-between;
Example: This example illustrates the justify-content property where the property value is set to space-between.
<!DOCTYPE html>
<html>
<head>
    <title> CSS justify-content Property </title>
    <style>
        #box {
            display: flex;
            border: 1px solid black;
            justify-content: space-between;
        }
        #box div {
            width: 110px;
            height: 120px;
            border: 1px solid black;
            background: linear-gradient(green, silver);
        }
    </style>
</head>
<body>
    <div id="box">
        <div>1
            <p>GeeksforGeeks</p>
        </div>
        <div>2
            <p>GeeksforGeeks</p>
        </div>
        <div>3
            <p>GeeksforGeeks</p>
        </div>
        <div>4
            <p>GeeksforGeeks</p>
        </div>
    </div>
</body>
</html>
Output:
5. Space-Around
The space-around value distributes flex items with equal space around them, meaning there is equal space before, between, and after each item.
Syntax:
justify-content: space-around;
Example: This example illustrates the justify-content property where the property value is set to space-around.
<!DOCTYPE html>
<html>
<head>
    <title> CSS justify-content Property </title>
    <style>
        #box {
            display: flex;
            border: 1px solid black;
            justify-content: space-around;
        }
        #box div {
            width: 110px;
            height: 120px;
            border: 1px solid black;
            background: linear-gradient(green, silver);
        }
    </style>
</head>
<body>
    <div id="box">
        <div>1
            <p>GeeksForGeeks</p>
        </div>
        <div>2
            <p>GeeksForGeeks</p>
        </div>
        <div>3
            <p>GeeksForGeeks</p>
        </div>
        <div>4
            <p>GeeksForGeeks</p>
        </div>
    </div>
</body>
</html>
Output:
6. Space-Evenly
The space-evenly value distributes flex items with equal space between them, including equal space at the start and end of the container.
Syntax:
justify-content: space-evenly;
Example: This example illustrates the justify-content property where the property value is set to space-evenly.
<!DOCTYPE html>
<html>
<head>
    <title> CSS justify-content Property </title>
    <style>
        #box {
            display: flex;
            border: 1px solid black;
            justify-content: space-evenly;
        }
        #box div {
            width: 110px;
            height: 120px;
            border: 1px solid black;
            background: linear-gradient(green, silver);
        }
    </style>
</head>
<body>
    <div id="box">
        <div>1
            <p>GeeksforGeeks</p>
        </div>
        <div>2
            <p>GeeksforGeeks</p>
        </div>
        <div>3
            <p>GeeksforGeeks</p>
        </div>
        <div>4
            <p>GeeksforGeeks</p>
        </div>
    </div>
</body>
</html>
Output:
7. Initial
The initial value resets the justify-content property to its default value, which is usually flex-start in most cases.
Syntax:
justify-content: initial;
Example: This example illustrates the justify-content property where the property value is set to initial.
<!DOCTYPE html>
<html>
<head>
    <title> CSS justify-content Property </title>
    <style>
        #box {
            display: flex;
            border: 1px solid black;
            justify-content: initial;
        }
        #box div {
            width: 110px;
            height: 120px;
            border: 1px solid black;
            background: linear-gradient(green, silver);
        }
    </style>
</head>
<body>
    <div id="box">
        <div>1
            <p>GeeksforGeeks</p>
        </div>
        <div>2
            <p>GeeksforGeeks</p>
        </div>
        <div>3
            <p>GeeksforGeeks</p>
        </div>
        <div>4
            <p>GeeksforGeeks</p>
        </div>
    </div>
</body>
</html>
Output:
8. Inherit
The inherit value makes the flex items inherit the justify-content property from their parent element.
Syntax:
justify-content: inherit;
Example: This example illustrates the justify-content property where property value is set to inherit.
<!DOCTYPE html>
<html>
<head>
    <title> CSS justify-content Property </title>
    <style>
        #box {
            display: flex;
            border: 1px solid black;
            justify-content: inherit;
        }
        #box div {
            width: 110px;
            height: 120px;
            border: 1px solid black;
            background: linear-gradient(green, silver);
        }
    </style>
</head>
<body>
    <div id="box">
        <div>1
            <p>GeeksforGeeks</p>
        </div>
        <div>2
            <p>GeeksforGeeks</p>
        </div>
        <div>3
            <p>GeeksforGeeks</p>
        </div>
        <div>4
            <p>GeeksforGeeks</p>
        </div>
    </div>
</body>
</html>
Output:
Supported Browsers
The browser supported by CSS justify-content property are listed below:
- Google Chrome 29.0 and above
- Internet Explorer 11.0 and above
- Microsoft Edge 12.0 and above
- Firefox 20.0 and above
- Opera 12.1 and above
- Safari 9.0 and above
Note: While most modern browsers support the justify-content property, it’s important to test your layout in older versions or fallback for Internet Explorer, which may have partial support for flexbox features.
