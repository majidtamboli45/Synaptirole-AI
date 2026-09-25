# CSS text-align Property

> Source: https://www.geeksforgeeks.org/css/css-text-align-property

The text-align property in CSS is used to control the horizontal alignment of text inside an element.
- Aligns text to left, right, center, or justify.
- Applies to block-level elements like <div>, <p>, etc.
- Inherited by child elements from the parent.
- Common values: left, right, center, justify.
Syntax:
text-align: left|right|center|justify|initial|inherit;
Default Value: left if the direction is ltr, and right if the direction is rtl
Property Value
- left: It is used to set the text alignment to the left. This is the default property.
- right: It is used to set the text-alignment to right.
- center: It is used to set the text alignment into the center.
- justify: justify is used to spread the words into the complete line i.e., by stretching the content of an element.
- initial: initial is used to set an element’s CSS property to its default value.
- inherit: inherit is used to inherit a property to an element from its parent element property value.
Please refer to the CSS Align article for further details.
Example: This example illustrates the use of the text-align property, to align it to specified values.
<!DOCTYPE html>
<html>
<head>
    <title>text-align property</title>
    <style>
    h1 {
        color: green;
    }
    
    .main {
        border: 1px solid black;
    }
    
    .gfg1 {
        text-align: left;
    }
    
    .gfg2 {
        text-align: right;
        ;
    }
    
    .gfg3 {
        text-align: center;
    }
    
    .gfg4 {
        text-align: justify;
    }
    </style>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h2>text-align property</h2>
    <div class="main">
        <h3>text-align: left;</h3>
        <div class="gfg1"> 
        The course is designed for students 
        as well as working professionals to 
        prepare for coding interviews. This 
        course is going to have coding questions 
        from school level to the level needed 
        for product based companies like Amazon, 
        Microsoft, Adobe, etc. 
        </div>
    </div>
    <br>
    <div class="main">
        <h3 style="text-align: right;">text-align: right;</h3>
        <div class="gfg2"> 
        The course is designed for students 
        as well as working professionals to 
        prepare for coding interviews. This 
        course is going to have coding questions 
        from school level to the level needed 
        for product based companies like Amazon, 
        Microsoft, Adobe, etc. 
        </div>
    </div>
    <br>
    <div class="main">
        <h3 style="text-align: center;">text-align: center;</h3>
        <div class="gfg3"> 
        The course is designed for students 
        as well as working professionals to 
        prepare for coding interviews. This 
        course is going to have coding questions 
        from school level to the level needed for 
        product based companies like Amazon, 
        Microsoft, Adobe, etc. 
        </div>
    </div>
    <br>
    <div class="main">
        <h3 style="text-align: justify;">text-align: justify;</h3>
        <div class="gfg4"> 
        The course is designed for students 
        as well as working professionals to 
        prepare for coding interviews. This 
        course is going to have coding questions 
        from school level to the level needed 
        for product based companies like Amazon, 
        Microsoft, Adobe, etc. 
        </div>
    </div>
</body>
</html>
