# CSS box-shadow Property

> Source: https://www.geeksforgeeks.org/css/css-box-shadow-property

The CSS box-shadow property is used to add a shadow effect to the edges of an element. You can apply multiple shadows by separating them with commas. The shadow is defined by the X and Y offsets (which position the shadow), a blur radius, a spread radius, and a color.
By default, the value is set to none, meaning no shadow is applied. This property allows you to easily create depth and emphasis in web design.
Syntax
box-shadow: h-offset v-offset blur-radius spread-radius color | none | inset | initial | inherit;
Property Values
All the properties are described below:
| Value | Description | 
|---|---|
| none | The default value; no shadow is applied to the element. | 
| h-offset | Controls the horizontal position of the shadow. Positive values move the shadow to the right, while negative values move it to the left. | 
| v-offset | This controls the shadow's vertical position. Positive values move the shadow below the element, and negative values move it above. | 
| blur | Optional: Adds a blur effect to the shadow. The higher the value, the blurrier the shadow becomes. | 
| color | Optional: Defines the color of the shadow. You can use color names, hex codes, or RGB values. | 
| spread | Adjusts the size of the shadow. Positive values increase the shadow's length, while negative values reduce it. | 
| inset | Changes the shadow from browsers to inside the element, creating an inner shadow effect. | 
| initial | Resets the box-shadow property to its default value (none). | 
| inherit | Inherits the box-shadow property from the parent element. | 
CSS Box Shadow Examples
Here are some examples to help you understand how to use the CSS box-shadow property effectively:
Example 1: Basic Box Shadow with Horizontal, Vertical Offset, and Blur
In this example, we apply the CSS box-shadow property to two div elements. The first element has a shadow with a horizontal offset of 5px, a vertical offset of 10px, and a blur radius of 10px. The second element uses a similar shadow, but with a larger blur radius of 28px, giving a softer effect. This property enhances the visual depth of the boxes.
<!DOCTYPE html>
<html>
<head>
    <title>CSS box-shadow Property</title>
    <style>
        .gfg1 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: h-offset v-offset blur */
            box-shadow: 5px 10px 10px;
        }
        .gfg2 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: h-offset v-offset blur */
            box-shadow: 5px 10px 28px;
        }
    </style>
</head>
<body>
    <div class="gfg1">
        <h1>Welcome to GeeksforGeeks!</h1>
    </div>
    <br><br>
    <div class="gfg2"> A computer Science portal </div>
</body>
</html>
Output:
Example 2: Box Shadow with Spread
This example adds a spread value to the box-shadow property. The first box has a shadow with a spread of 10px, while the second box has a larger shadow with a spread of 20px, making the shadows appear bigger and more defined.
<!DOCTYPE html>
<html>
<head>
    <title>CSS box-shadow Property</title>
    <style>
        .gfg1 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: h-offset
                       v-offset blur spread */
            box-shadow: 5px 10px 10px 10px;
        }
        .gfg2 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: h-offset
                       v-offset blur spread */
            box-shadow: 5px 10px 28px 20px;
        }
    </style>
</head>
<body>
    <div class="gfg1">
        <h1>Welcome to GeeksforGeeks!</h1>
    </div>
    <br><br>
    <div class="gfg2"> A computer Science portal </div>
</body>
</html>
Output:
Example 3: Box Shadow with Custom Color
In this example, the box-shadow property includes a custom color (green) for the shadow. The first box has a shadow with a 10px spread and green color, while the second box has a larger shadow with a 20px spread, also in green. This adds a distinct visual style with the colored shadow.
<!DOCTYPE html>
<html>
<head>
    <title>CSS box-shadow Property</title>
    <style>
        .gfg1 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: h-offset v-offset blur 
                spread color */
            box-shadow: 5px 10px 10px 10px green;
        }
        .gfg2 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: h-offset v-offset blur 
                spread color */
            box-shadow: 5px 10px 28px 20px green;
        }
    </style>
</head>
<body>
    <div class="gfg1">
        <h1>Welcome to GeeksforGeeks!</h1>
    </div>
    <br><br>
    <div class="gfg2"> A computer Science portal </div>
</body>
</html>
Output:
Example 4: Inset Shadow Inside the Box
In this example, the inset keyword is used with the box-shadow property to create a shadow inside the box. The first box has an inset green shadow with a 10px spread, while the second box has a larger inset shadow with a 20px spread, both giving a recessed effect inside the element.
<!DOCTYPE html>
<html>
<head>
    <title>CSS box-shadow Property</title>
    <style>
        .gfg1 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: h-offset v-offset blur 
                spread color inset */
            box-shadow: 5px 10px 10px 10px green inset;
        }
        .gfg2 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: h-offset v-offset blur 
                spread color inset */
            box-shadow: 5px 10px 28px 20px green inset;
        }
    </style>
</head>
<body>
    <div class="gfg1">
        <h1>Welcome to GeeksforGeeks!</h1>
    </div>
    <br><br>
    <div class="gfg2"> A computer Science portal </div>
</body>
</html>
Output:
Example 5: Resetting Box Shadow to Default with Initial
In this example, the box-shadow property is set to initial, which resets the box shadow to its default value (no shadow). Both boxes in this case will not display any shadow, returning the elements to their original, unstyled state.
<!DOCTYPE html>
<html>
<head>
    <title>CSS box-shadow Property</title>
    <style>
        .gfg1 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: initial */
            box-shadow: initial;
        }
        .gfg2 {
            border: 1px solid;
            padding: 10px;
            /* box-shadow: initial */
            box-shadow: initial;
        }
    </style>
</head>
<body>
    <div class="gfg1">
        <h1>Welcome to GeeksforGeeks!</h1>
    </div>
    <br><br>
    <div class="gfg2"> A computer Science portal </div>
</body>
</html>
Output:
Supported Browsers
The box-shadow property is supported by the following browsers:
- Google Chrome : 10.0 and above
- Microsoft Edge : 12.0 and above
- Firefox : 4.0 and above
- Safari : 5.1 and above
- Opera : 10.5 and above
Note: Older versions of Internet Explorer (below IE 9) do not support the box-shadow property. For cross-browser compatibility, you may need to use vendor prefixes (-webkit-, -moz-) for older browser versions.
