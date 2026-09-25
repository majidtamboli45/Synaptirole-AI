# Way to Apply Concept of Inheritance in CSS

> Source: https://www.geeksforgeeks.org/css/how-to-apply-concept-of-inheritance-in-css

Inheritance in CSS allows certain properties to pass from parent elements to their child elements automatically. This helps maintain consistency and reduces repetitive code.
- Use inherited properties like color, font-family, and line-height on parent elements to style multiple child elements at once.
- Apply inherit value explicitly (e.g., color: inherit;) to force inheritance where it's not default.
- Structure HTML logically so parent elements control common styles, improving maintainability.
Syntax:
<style>
#parentclass {
color: red;
}
</style>
<div id="parentclass">
Parent Div
<div id="div1Child">Child Div 1</div>
<div id="div2Child">Child Div 2</div>
</div>
- Parent has color: red.
- color is an inheritable CSS property.
- Child divs have no color set.
- They automatically inherit red from the parent.
- Result: child divs display red text.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        #parentclass {
            color: black;
        }
        #child1 {
            color: green;
        }
        #childchild1 {
            color: red;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div id="div1">
        Parent
        <div id="child1">
            Child 1
            <div id="childchild1">
                Child Child 1
                <div id="childchildchild1">
                    Child Child Child
                </div>
            </div>
            <div id="childchild2">
                Child Child 2
            </div>
        </div>
        <div id="child2">
            Child 2
        </div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- Parent has color: black.
- color is an inheritable CSS property.
- #child1 has color: green : overrides parent (specificity).
- #child2 has no color -inherits black from parent.
- #childchild1 has color: red -overrides both parent and child1.
- Result: child1 shows green, child2 shows black, childchild1 shows red.
We cannot inherit all the properties /rules of CSS. All font-* properties are naturally inherited like
- font-size
- font-family
- font-weight
- font-style, etc.
The color property is also inherited.
CSS properties such as height, border, padding, margin, width, etc. are not inherited naturally. We can do inheritance on noninheritable CSS properties. We use inherit for doing so.
CSS Inherit
We use inherit on a CSS property for taking up its parent's element property. Let’s say we have a code:
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        #parentclass {
            padding: 30px;
            color: red;
        }
        #Child {
            padding: inherit;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div id="parentclass">
        Parent
        <div id="Child">Child</div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- Non-inheritable CSS properties (like height, width, margin) can be made to inherit using the inherit keyword.
- Only the direct child inherits it; grandchildren do not and will use their default or browser-computed value.
