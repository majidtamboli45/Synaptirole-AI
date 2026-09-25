# CSS Overflow

> Source: https://www.geeksforgeeks.org/css/css-overflow

CSS overflow controls how content is handled when it doesn’t fit inside an element’s box. It helps manage scrolling and visibility of extra content.
- Can hide, scroll, or show overflowing content.
- Common values include visible, hidden, scroll, and auto.
- Useful for keeping layouts neat and preventing content overlap.
Try It:
Currently Active Property:
overflow: hidden; 
Now let's understand this with the help of example:
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
<!--Driver Code Ends-->
<style>
div {
  width: 200px;
  height: 40px;
  border: 1px solid black;
  overflow: auto;
}
</style>
<!--Driver Code Starts-->
</head>
<body>
<div>
  This is an example of CSS overflow. When the content inside the box is too long to fit, a scrollbar appears to let you see the rest.
</div>
</body>
</html>
<!--Driver Code Ends-->
- The overflow: auto; property adds a scrollbar when the content is larger than the box.
- The box has a fixed width and height with a black border.
- Extra text can be viewed by scrolling inside the box.
Syntax:
overflow: visible | hidden | scroll | auto;
Property Values
The overflow property contains the following values:
- visible: The content is not clipped and is visible outside the element box.
- hidden: The overflow is clipped and the rest of the content is invisible.
- scroll: The overflow is clipped but a scrollbar is added to see the rest of the content. The scrollbar can be horizontal or vertical.
- auto: It automatically adds a scrollbar whenever it is required.
overflow-x and overflow-y: This property specifies how to change the overflow of elements. x deals with horizontal edges and y deals with vertical edges.
CSS Overflow Examples
Example 1: Here, we are using overflow: visible; property.
<!--Driver Code Starts-->
<!DOCTYPE>
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 100px;
            height: 80px;
            border: 1px solid;
            overflow: visible;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>
        GEEKSFORGEEKS
    </h2>
    <p>
        The CSS overflow controls big content.
        It tells whether to clip content or to
        add scroll bars.
    </p>
</body>
</html>
<!--Driver Code Ends-->
Example 2: Here, we are using overflow: scroll; property.
<!--Driver Code Starts-->
<!DOCTYPE>
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 120px;
            height: 100px;
            border: 1px solid;
            overflow: scroll;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>
        GEEKSFORGEEKS
    </h2>
    <p>
        The CSS overflow controls big content.
        It tells whether to clip content or
        to add scroll bars.
    </p>
</body>
</html>
<!--Driver Code Ends-->
Example 3: Here, we are the overflow: auto; property.
<!--Driver Code Starts-->
<!DOCTYPE>
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p {
            width: 120px;
            height: 100px;
            border: 1px solid;
            overflow: auto;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>
        GEEKSFORGEEKS
    </h2>
    <p>
        The CSS overflow controls big content.
        It tells whether to clip content or
        to add scroll bars.
    </p>
</body>
</html>
<!--Driver Code Ends-->
