# CSS overflow Property

> Source: https://www.geeksforgeeks.org/css/css-overflow-property

The CSS overflow property is used to set the overflow behavior of an element. It is the shorthand property of overflow-x and overflow-y properties. This property is used to control the large content.
Syntax:
overflow: visible | hidden | clip | scroll | auto;
Property Values:
- visible: The content is not clipped and is visible outside the element box.
- hidden: The overflow is clipped and the rest of the content is invisible.
- clip: It is used to clip the content to fit the padding box.
- scroll: The overflow is clipped but a scrollbar is added to see the rest of the content. The scrollbar can be horizontal or vertical.
- auto: It automatically adds a scrollbar whenever it is required.
Example 1: The following code demonstrates the CSS overflow: auto property.
<!DOCTYPE>
<html>
<head>
    <title>
        CSS overflow Property
    </title>
    <style>
        h1 {
            color: green;
        }
        p {
            width: 200px;
            height: 100px;
            border: 1px solid;
            overflow: auto;
            text-align: justify;
        }
    </style>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h3>CSS overflow Property</h3>
    <p>
        CSS (Cascading Style Sheets)is used to 
        apply styles to web pages. Cascading 
        Style Sheets are fondly referred to as 
        CSS. It is used to make web pages 
        presentable. The reason for using this 
        is to simplify the process of making web 
        pages presentable. It allows you to apply 
        styles on web pages. More importantly, 
        it enables you to do this independently 
        of the HTML that makes up each web page.
    </p>
</body>
</html>
Output:
Example 2: The following code shows that the overflow feature is hidden by using theoverflow:hidden property.
<!DOCTYPE>
<html>
<head>
    <title>  CSS overflow Property </title>
    <style>
        h1 {
            color: green;
        }
        p {
            width: 200px;
            height: 100px;
            border: 1px solid;
            overflow: hidden;
            text-align: justify;
        }
    </style>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h3>CSS overflow Property</h3>
    <p>
        CSS (Cascading Style Sheets)is used to 
        apply styles to web pages. Cascading 
        Style Sheets are fondly referred to as 
        CSS. It is used to make web pages 
        presentable. The reason for using this 
        is to simplify the process of making web 
        pages presentable. It allows you to apply 
        styles on web pages. More importantly, 
        it enables you to do this independently 
        of the HTML that makes up each web page.
    </p>
</body>
</html>
Output:
Supported Browsers:
- Chrome 1
- Edge 12
- Firefox 1
- Opera 7
- Safari 1
