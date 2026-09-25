# CSS text-shadow Property

> Source: https://www.geeksforgeeks.org/css/css-text-shadow-property

The text-shadow property in CSS is used to add shadow effects to text, creating depth and visual emphasis. It allows developers to enhance the appearance of text elements with stylish shadow effects.
- Accepts values for horizontal offset, vertical offset, blur radius, and shadow color.
- Multiple shadow effects can be applied by separating values with commas.
- The default value is none, meaning no shadow effect is applied to the text.
Syntax
text-shadow: h-shadow v-shadow blur-radius color | none | initial | inherit;
Property values
Here are the property values for the text-shadow CSS property:
| Property | Description | 
|---|---|
| h-shadow | Defines the horizontal position of the shadow. Negative values move the shadow to the left. | 
| v-shadow | Controls the vertical position of the shadow. Negative values move the shadow upwards. | 
| blur-radius | Determines the blurriness of the shadow. The default is 0, meaning no blur. Optional. | 
| none | No shadow will be applied to the text. This is the default value. | 
| color | Specifies the color of the shadow. This value is optional. | 
| initial | Resets the  text-shadow property to its default value. | 
| inherit | Inherits the value of the  text-shadow property from its parent element. | 
CSS text-shadow Property Examples
Example 1: Adding a Simple Shadow
Here, we applies a green text shadow to the <h1> element with a horizontal offset of 5px, vertical offset of 5px, blur radius of 8px, and color #00FF00.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h1 {
            text-shadow: 5px 5px 8px #00FF00;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h1> GeeksforGeeks </h1>
</body>
</html>
<!--Driver Code Ends-->
Example 2: Creating a Glowing Text Effect
Here, we creates a glowing text effect for <h2> with multiple shadows using text-shadow, styled with contrasting background and padding for visibility.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h2 {
            font-size: 24px;
            text-shadow: 0 0 10px #FFD700, 
                         0 0 20px #FFA500, 
                         0 0 30px #FF6347;
            color: #fff;
            background-color: #333;
            padding: 20px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h2>Glowing Text Effect</h2>
</body>
</html>
<!--Driver Code Ends-->
Example 3: Adding Multiple Shadows for Depth
Here, we apply multiple shadows to an  <h3>  element to create a layered effect, simulating depth. The shadows are offset in different directions and colors. 
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        h3 {
            font-size: 24px;
            text-shadow: 3px 3px 2px rgba(0, 0, 0, 0.5), 
                         -3px -3px 2px rgba(255, 255, 255, 0.7);
            color: #FF4500;
            background-color: #f0f0f0;
            padding: 10px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <h3>Text Shadow with Depth</h3>
</body>
</html>
<!--Driver Code Ends-->
