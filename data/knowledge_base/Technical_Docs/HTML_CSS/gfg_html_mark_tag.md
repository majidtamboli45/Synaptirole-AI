# HTML mark Tag

> Source: https://www.geeksforgeeks.org/html/html-mark-tag

The <mark> tag in HTML is used to define the marked text. It is used to highlight the part of the text in a paragraph. The <mark> tag is new in HTML 5.
Syntax
<mark> Contents... </mark>
Note: The <mark> tag also supports the Global Attributes and Event Attributes in HTML.
Example 1: In this example, we are using the <mark> tag to highlight specific text, such as "GeeksforGeeks" and "computer science," within a paragraph. The highlighted text is visually emphasized for readers.
<!DOCTYPE html>
<html>
<body>
    <h1 style="color: green;">GeeksforGeeks</h1>
    <h2>HTML mark Tag</h2>
    <p>
        <mark>GeeksforGeeks:</mark> It is a
        <mark>computer science</mark> portal for geeks
    </p>
</body>
</html>
Example 2: In this example we are using the <mark> tag with custom styling to highlight "GeeksforGeeks" and "computer science," changing the background to green and text color to white for emphasis.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<body>
    <h1>GeeksforGeeks</h1>
    <h2> HTML mark Tag</h2>
<!--Driver Code Ends-->
    <p>
        <mark>GeeksforGeeks:</mark> It is a
        <mark style="background-color: green; color: white;">
            computer science
        </mark> portal for geeks
    </p>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
