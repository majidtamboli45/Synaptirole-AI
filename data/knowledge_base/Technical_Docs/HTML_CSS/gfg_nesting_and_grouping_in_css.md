# Nesting and grouping in CSS

> Source: https://www.geeksforgeeks.org/css/explain-nesting-and-grouping-in-css

CSS Nesting & Grouping are techniques used to write efficient and organized stylesheets. They help reduce code repetition and improve readability and performance.
- Nesting allows writing styles inside parent selectors for better structure (mainly in preprocessors or modern CSS).
- Grouping lets you apply the same styles to multiple selectors using commas.
- Reduces redundancy, making code cleaner and easier to maintain.
Understanding Nesting in CSS
Nesting in CSS allows you to nest one style rule inside another. The child rule's selector is relative to the parent rule's selector. This method enhances the modularity and maintainability of CSS stylesheets, making the code more readable.
Syntax
class1_selector class2_selector id_selector  {
property: value;
}
Example
table tr th {
background-color: beige;
}
Approach
- Select the id/class selector & add a space to separate one from the other.
- Add the style properties for the elements.
Note: Be specific with the order of nesting.
Example: Nesting the <a> tag inside the <p> tag and <th> tag inside the <tr> tag.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
<!--Driver Code Ends-->
    <style>
        p a {
            color: green;
        }
        table tr th {
            background-color: beige;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <p>
        This is a
        <a href="https://www.geeksforgeeks.org/community/">link</a>
        within a paragraph element.
    </p>
    <table style="width: 100%">
        <tr>
            <th>Name</th>
            <th>Age</th>
        </tr>
        <tr>
            <td>Roy</td>
            <td>50</td>
        </tr>
        <tr>
            <td>Sebin</td>
            <td>65</td>
        </tr>
        <tr>
            <td>Nicol</td>
            <td>26</td>
        </tr>
    </table>
</body>
</html>
<!--Driver Code Ends-->
Output: We got <a> tag as green color and <th> of beige color using nesting.
Understanding Grouping in CSS
Grouping allows you to apply common styling properties to multiple elements at once. This reduces the length of your code, makes it easier to read, and speeds up page load times.
selector1, selector2 {
property: value;
}
Example (Without Grouping)
Instead of writing this long code, specifying the same properties to different selectors:
h1 {
padding: 5px;
color: grey;
}
p {
padding: 5px;
color: grey;
}
We can group them and write like this & we need the comma(,) to group the various selectors.
h1, p {
padding: 5px;
color: grey;
}
Approach
- Add <style>tag inside <head> tag.
- Add various tags inside <body> tag with content.
- Inside <style> tag, we can group our selectors containing the same properties.
Example: Here, we will group various selectors together.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1, h2, p, a {
            text-align: center;
            color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1>GeeksForGeeks</h1>
    <h2>Smaller heading!</h2>
    <p>This is
        <a href="https://www.geeksforgeeks.org/community/">
            anchor tag
        </a>
    </p>
    <p>This is a paragraph.</p>
</body>
</html>
<!--Driver Code Ends-->
Difference between Nesting & Grouping
Here are some differences:
| Nesting | Grouping | 
|---|---|
| One style rule is written inside another; child selector is relative to parent. | Same properties and values applied to multiple selectors at once. | 
| Organizes styles based on parent–child relationships. | Reduces repetition by styling multiple elements together. | 
| Can become difficult to manage with deep nesting. | Easy to manage even for large stylesheets. | 
| Modifying a specific element requires manual changes in nested rules. | Changing a style affects all grouped selectors at once. | 
| Less efficient for large codebases with many nested rules. | More efficient and cleaner for shared styles. | 
| Excessive nesting can reduce readability. | No restrictions on usage. |
