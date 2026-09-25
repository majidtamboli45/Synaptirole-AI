# HTML5 MathML Complete Reference

> Source: https://www.geeksforgeeks.org/html/html5-mathml-complete-reference

The MathML comes in HTML5. The current MathML version is 3. It was introduced in the year 2015. MathML stands for Mathematics Markup Language. It is used to represent mathematical equations or expressions in web browsers, like other HTML elements. MathML is used to describe mathematics as a basis for machine-to-machine communication. It is intended to be handled by specialized authoring tools such as equation editors, and it is meaningful to other applications as well.
Example:
<!DOCTYPE html>
<html>
<head>
    <title>HTML5 MathML</title>
</head>
<body style="text-align:center;">
    <h1 style="color:green">
        GeeksforGeeks
    </h1>
    <h3>HTML5 MathML</h3>
    <!--start tag of the whole representation-->
    <math>
        <!-- Creating Matrix -->
        <mrow>
            <mi>A</mi>
            <mo>=</mo>
            <mfenced open="[" close="]">
                <mtable>
                    <mtr>
                        <mtd>
                            <mi>a</mi>
                        </mtd>
                        <mtd>
                            <mi>b</mi>
                        </mtd>
                    </mtr>
                    <mtr>
                        <mtd>
                            <mi>x</mi>
                        </mtd>
                        <mtd>
                            <mi>y</mi>
                        </mtd>
                    </mtr>
                </mtable>
            </mfenced>
        </mrow>
        <!-- Creating equation -->
        <br><br>
        <msub>
            <mi>Geeks</mi>
            <mn>4</mn>
        </msub>
        <mo>+</mo>
        <mn>Geeks</mn>
        <mo>=</mo>
        <msub>
            <mi>G</mi>
        </msub>
        <mo>→</mo>
        <msub>
            <mi>e</mi>
            <mn>2</mn>
        </msub>
        <mo>→</mo>
        <mi>k</mi>
        <mi>s</mi>
        <mn>4
        </mn>
        <msub>
            <mi>G</mi>
        </msub>
        <mo>→</mo>
        <msub>
            <mi>e</mi>
            <mn>2</mn>
        </msub>
        <mo>→</mo>
        <mi>k</mi>
        <mi>s</mi>
    </math>
</body>
</html>
Output:
| MathML Tag | Description | 
|---|---|
| math | Write a single mathematical formula. | 
| maction | Show the bind action of any expression. | 
| menclose | Render the contents inside an enclosing notation specified by the notation attribute. | 
| merror | Wrap the expression in a box, makes that expression eye-catching. | 
| mfenched | Add custom open and closing parentheses. | 
| mfrac | Add fraction symbols between two digits or equations | 
| mglyph | Print non-standard symbols. | 
| mi | Such as any kind of symbol or function. | 
| mlabeledtr | Represent a label in a row, either on the left or on the right side inside of the <mtable> element. | 
| mmultiscripts | Create multi-dimensional matrices. | 
| mn | Display a numeric character which is normally a sequence of digits with a possible separator. | 
| mo | Print operator between elements. | 
| mover | This tag is used to attach an accent or a limit over an expression. | 
| mpadded | Extra padding and to set the general adjustment of the position and size of enclosed contents. | 
| mphantom | To render invisibly but the dimensional are still kept. | 
| mroot | Display the power of the root like root squire. | 
| mrow | Create a row that contains some mathematical expression or any random text. | 
| ms | Represent a string that will represent the mathematical expression by programming languages | 
| mspace | It is used to print blank space. | 
| msqrt | Display the root squire of the element content. | 
| style | Change the styles of the children’s elements. | 
| msub | Print the base power on any expression. | 
| msubsup | Print base power and power on any expression. | 
| msup | Print power on any expression. | 
| mtable | Create tables or matrices in HTML5 | 
| mtd | Create table data of a table or matrices in HTML5. | 
| mtext | Print any text before or after any expression. | 
| mtr | Create a row of a table or the matrices in HTML5. | 
| mth | Create a header of a table or the matrices in HTML5. It is similar to <th> of a table tag. | 
| munder | Attach any accent or limit under the expression. | 
| munderover | Attach any accent or limit under the expression plus over the expression. | 
| semantics | Markup mathematics there are two possible ways to markup mathematics. |
