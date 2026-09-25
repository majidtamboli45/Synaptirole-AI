# HTML Ordered Lists

> Source: https://www.geeksforgeeks.org/html/html-ordered-lists

HTML ordered lists use the <ol> tag to present items in a defined sequence, ensuring clear and structured display of step-based or ranked content.
- Uses <ol> to create a list with a specific order or sequence.
- Each item is defined using the <li> tag.
- Items are automatically numbered or lettered by the browser.
- Numbering style can be customized using attributes or CSS.
- Commonly used for instructions, steps, and rankings.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>My To-Do List</h2>
<!--Driver Code Ends-->
    <ol>
        <li>Go grocery shopping</li>
        <li>Pay utility bills</li>
        <li>Prepare dinner</li>
    </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
Syntax
<ol>
<li>Milks</li>
<li>Eggs</li>
<li>Breads</li>
<li>Butter</li>
</ol>
Different Type Attributes in HTML Ordered List
The type attribute of <ol> tag specifies the order we want to create.
- type="1": This will list the items with numbers (default)
- type="A": This will list the items in uppercase letters.
- type="a": This will list the items in lowercase letters.
- type="I": This will list the items with uppercase Roman numbers.
- type="i": This will list the items with lowercase Roman numbers.
1. Numbered Ordered List
To create an ordered list in HTML with numerical markers, which is the default behavior for ordered lists, you simply use the <ol> (ordered list) tag without specifying a type attribute.
Example: Implementation of a default ordered list where items are displayed in numeric sequence.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>Ordered List with Numbers</h2>
<!--Driver Code Ends-->
    <ol>
        <li>JavaScript</li>
        <li>Python</li>
        <li>Java</li>
        <li>C++</li>
        <li>C#</li>
    </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
2. Uppercase Letters Ordered List
To create an ordered list in HTML that uses uppercase letters for the list markers, you can use the type attribute on the <ol> tag and set it to "A".
Example: Implementation of an ordered list using the type="A" attribute to display items in uppercase alphabetical order.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>Uppercase Letters Ordered List</h2>
<!--Driver Code Ends-->
    <ol type="A">
        <li>Apple</li>
        <li>Banana</li>
        <li>Cherry</li>
        <li>Date</li>
    </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
3. Lowercase Letters Ordered List
To create an ordered list in HTML that uses lowercase letters for the list markers, you can use the type attribute on the <ol> tag and set it to "a".
Example: Implementation of an ordered list using the type="a" attribute to display items in lowercase alphabetical order.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>Lowercase Letters Ordered List</h2>
<!--Driver Code Ends-->
    <ol type="a">
        <li>RCB</li>
        <li>CSK</li>
        <li>DC</li>
        <li>MI</li>
    </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
4. Uppercase Roman Numbers Ordered List
To create an ordered list in HTML with uppercase Roman numerals as the markers, you can use the type attribute on the <ol> tag and set it to "I".
Example: Implementation of an ordered list using the type="I" attribute to display items in uppercase Roman numerals.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2> Uppercase Roman Numbers Ordered List </h2>
<!--Driver Code Ends-->
    <ol type="I">
        <li>First item</li>
        <li>Second item</li>
        <li>Third item</li>
        <li>Fourth item</li>
    </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
5. Lowercase Roman Numbers Ordered List
To create an ordered list in HTML with lowercase Roman numerals as the markers, you can use the type attribute on the <ol> tag and set it to "i".
Example: Implementation of an ordered list using the type="i" attribute to display items in lowercase Roman numerals.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
  <h2>Lowercase Roman Numerals Ordered List</h2>
<!--Driver Code Ends-->
  <ol type="i">
    <li>First item</li>
    <li>Second item</li>
    <li>Third item</li>
    <li>Fourth item</li>
  </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
6. Reverse Ordered List in HTML
To create a reverse-ordered list in HTML, you can use the 'reversed' attribute in the <ol> tag. This will make the list count down from the highest number.
Example: Implementation of an ordered list using the reversed attribute to display items in descending order.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h1>Top 5 Movies to Watch</h1>
<!--Driver Code Ends-->
    <ol reversed>
        <li>The Shawshank Redemption</li>
        <li>The Godfather</li>
        <li>Inception</li>
        <li>Interstellar</li>
        <li>Pulp Fiction</li>
    </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
7. Control List Counting
To control list counting, use the start attribute in the <ol> tag to set the starting number for the ordered list.
Example: Showcase an ordered list starting from the number 5, controlled by the “start” attribute within the <ol> tag, customizing list counting
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>Control List Counting</h2>
<!--Driver Code Ends-->
    <ol start="5">
        <li>Item 5</li>
        <li>Item 6</li>
        <li>Item 7</li>
        <li>Item 8</li>
    </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
8. Nested Ordered Lists
Nested ordered lists use <ol> inside <li> tags to create sublists, making content more organized.
Example: Creating nested ordered list, listing programming languages with their respective frameworks as subitems
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>Nested Ordered List</h2>
<!--Driver Code Ends-->
    <ol>
        <li>
            JavaScript
            <ol>
                <li>React</li>
                <li>Angular</li>
                <li>Vue.js</li>
            </ol>
        </li>
        <li>
            Python
            <ol>
                <li>Django</li>
                <li>Flask</li>
                <li>Pyramid</li>
            </ol>
        </li>
    </ol>
<!--Driver Code Starts-->
</body>
</html>
<!--Driver Code Ends-->
