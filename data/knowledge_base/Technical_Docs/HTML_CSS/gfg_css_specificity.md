# CSS Specificity

> Source: https://www.geeksforgeeks.org/css/css-specificity

CSS specificity is the set of rules browsers use to determine which CSS style is applied when multiple rules target the same element. The rule with the higher specificity value takes priority.
- Inline styles have the highest specificity.
- ID selectors override class, attribute, and element selectors.
- Class selectors override element and pseudo-element selectors.
- When specificity is equal, the rule written last is applied.
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" 
          type="text/css" 
          href="external.css">
    <style type="text/css">
        h1 {
            background-color: red;
            color: white;
        }
        h2 {
            color: blue;
        }
    </style>
</head>
<body>
    <h1>
        Internal CSS overrides external CSS
    </h1>
    <h2 style="color: green;">
        Inline CSS overrides internal CSS
    </h2>
</body>
</html>
/* external.css */
h1 {
    background-color: lightgreen;
}
h2 {
    color: pink;
}
CSS Specificity Rules
1. Inline CSS
- Inline CSS applied directly to an HTML element using the style attribute.
- Has the highest specificity and overrides both internal and external CSS rules.
2. Internal CSS
- Internal stylesheets defines inside the <style> tag within an HTML document.
- Specificity depends on the selector used (ID > class > element).
- Overrides external CSS when selectors have the same specificity.
3. External CSS
- External CSS Written in a separate .css file and linked using the <link> tag.
- Used to style multiple pages consistently.
- Specificity depends on the selectors used and is lower than inline and internal CSS.
Note:
- The Specificity is mainly determined by the Selectors themselves, rather than whether the styles are defined internally within a <style> tag or externally in a separate CSS file, in the case of specificity for external or internal CSS rules.
- If the selectors used in External and Internal CSS contain the same components, then their specificity will be the same, and it will not be affected by the location of the CSS rule.
- If any conflict exists for the styles of the same element, then the styles will be implemented based on the order of inclusion in the HTML document.
- When two or more selectors have equal specificity, then the last(latest) one counts.
- Universal selectors (like body and inherited selectors) have the least specificity.
Specificity Hierarchy
Every Selector has a position in the Hierarchy, which is described below:
| Priority | Description | 
|---|---|
| Inline style | Highest priority, directly applied using the style attribute. | 
| ID selectors | Second highest priority, identified by the unique id attribute of an element. | 
| Classes, pseudo-classes, | Medium level of specificity, targeted using class names, pseudo-classes like :hover, and | 
| attributes | attributes like [type="text"]. | 
| Elements and pseudo-elements | Lowest priority, applies to HTML elements and pseudo-elements such as ::before and ::after. | 
Example:
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
<!--Driver Code Ends-->
    <style type="text/css">
        h1 {
            background-color: red;
            color: white;
        }
        #second {
            background-color: black;
            color: white;
        }
        .third {
            background-color: pink;
            color: blue;
        }
        #second1 {
            color: blue;
        }
        .third1 {
            color: red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1 id="second" class="third">
        ID has highest priority.
    </h1>
    <h1>
        Element selectors has lowest priority.
    </h1>
    <h1 class="third">
        Classes have higher priority
        than element selectors.
    </h1>
    <h2 style="color: green;" 
        id="second1"
        class="third1">
        Inline CSS has highest priority.
      </h2>
</body>
</html>
<!--Driver Code Ends-->
