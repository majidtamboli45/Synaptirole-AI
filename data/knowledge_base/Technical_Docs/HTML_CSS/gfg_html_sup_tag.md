# HTML sup Tag

> Source: https://www.geeksforgeeks.org/html/html-sup-tag

The <sup> tag in HTML describes the text as a superscript text. Here the text is above the baseline of the text and that text appears in a smaller font.
Syntax:
<sup> Content... </sup>
Example 1:
<!DOCTYPE html> 
<html> 
    <head> 
        <title></title> 
    </head> 
    <body style="text-align: center;"> 
        <h1 style="color: green;"> GeeksforGeeks </h1> 
        <h3>HTML <sup> Tag</h3> 
        <p>a<sup>2</sup></p> 
    </body> 
</html>
Output:
Example 2:
<!DOCTYPE html> 
<html> 
    <head> 
        <title></title> 
        <style> 
            sup { 
                    vertical-align: super; 
                    font-size: medium; 
                } 
        </style> 
    </head> 
    <body> 
        <p> Examples to demonstrate superscript text </p> 
        <p>2 <sup>4</sup>=16</p> 
        <p>X <sup>4</sup>+ Y<sup>6</sup></p> 
        <p>9<sup>th</sup> of september</p> 
        <p> Change the default CSS settings to see the effect. </p> 
    </body> 
</html>
Output:
