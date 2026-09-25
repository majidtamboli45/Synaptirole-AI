# HTML Lists

> Source: https://www.geeksforgeeks.org/html/html-lists

An HTML list organizes content into ordered or unordered formats, making information clear and easy to read.
- HTML lists organize content using tags like <ul>, <ol> & <li>.
- They improve readability by presenting data in a structured format.
Syntax
<ul>    
<li>Item 1</li>
<li>Item 2</li>
<li>Item 3</li>
</ul>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <h2>Welcome To GeeksforGeeks Learning</h2>
    <h5>List of available courses</h5>
    <ul>
        <li>Data Structures & Algorithm</li>
        <li>Web Technology</li>
        <li>Aptitude & Logical Reasoning</li>
        <li>Programming Languages</li>
    </ul>
    <h5>Data Structures topics</h5>
    <ol>
        <li>Array</li>
        <li>Linked List</li>
        <li>Stacks</li>
        <li>Queues</li>
        <li>Trees</li>
        <li>Graphs</li>
    </ol>
</body>
</html>
Html Tags
HTML (HyperText Markup Language) uses tags to define and structure elements on a webpage. Each tag tells the browser how to display the content - such as text, images, links, or layouts.
Types of HTML Lists
There are three main types of lists in HTML
1. Unordered List or Bulleted List
Unordered lists display items as bulleted points where the order of items does not matter, using the <ul> and <li> tags.
- Unordered lists are ideal for scenarios where the sequence of the items is not important.
- The unordered list items are marked with bullets, also known as bulleted lists.
- An unordered list starts with the <ul> tag, and each list item begins with the <li> tag.
Attribute: This tag contains two attributes which are listed below:
- compact: It will render the list smaller.
- type: It specifies which kind of marker is used in the list.
<!DOCTYPE html>
<html>
<head></head>
<body>
    <h2>Grocery list</h2>
    <ul>
        <li>Bread</li>
        <li>Eggs</li>
        <li>Milk</li>
        <li>Coffee</li>
    </ul>
</body>
</html>
2. HTML Ordered List
Ordered lists are used when the items need to follow a specific sequence.
In an ordered list, all list items are marked with numbers by default. An ordered list starts with the <ol> tag, and each list item begins with the <li> tag.
Attributes:
- compact: It defines the list should be compacted (compact attribute is not supported in HTML5. Use CSS instead.).
- reversed: reversed defines that the order will be descending.
- start: It defines from which number or alphabet the order will start.
- type: It defines which type(1, A, a, I, and i) of the order you want in your list of numeric, alphabetic, or roman numbers.
Syntax
<ol>    
<li>Item1</li>
<li>Item2</li>
<li>Item3</li>
</ol>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <h1 style="color: green">GeeksforGeeks</h1>
    <h3>HTML ol tag</h3>
    <p>reversed attribute</p>
    <ol reversed>
        <li>HTML</li>
        <li>CSS</li>
        <li>JS</li>
    </ol>
    <p>start attribute</p>
    <ol start="5">
        <li>HTML</li>
        <li>CSS</li>
        <li>JS</li>
    </ol>
    <p>type attribute</p>
    <ol type="i">
        <li>HTML</li>
        <li>CSS</li>
        <li>JS</li>
    </ol>
</body>
</html>
3. HTML Description List
A description list is a list of terms, with a description of each term. Description lists are less common but very useful for definitions, glossaries, or any other key-value pairs of items.
- The <dl> tag defines the description list, the <dt> tag defines the term name, and the <dd> tag describes each term.
- Here, <dt> (description term) is used for the term being defined, and <dd> (description details) is used for the description.
Syntax
<dl>
<dt>Item 1</dt>
<dd>Description of Item 1 </dd>
<dt>Item 2</dt>
<dd>Description of Item 2</dd>
</dl>
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <h2>A Description List</h2>
    <dl> 
        <dt>Coffee</dt>
        <dd>- 500 gms</dd>
        <dt>Milk</dt>
        <dd>- 1 ltr Tetra Pack</dd>
    </dl>
</body>
</html>
