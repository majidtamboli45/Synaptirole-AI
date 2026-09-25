# CSS Media Queries

> Source: https://www.geeksforgeeks.org/css/css-media-queries

CSS Media Queries enable web pages to adjust their layout and styles based on different screen sizes, devices, or orientations. They are essential for building responsive and adaptable web designs.
- Apply CSS rules conditionally based on screen width or height.
- Help create responsive layouts for mobile, tablet, and desktop devices.
- Support conditions like orientation, resolution, and device type.
- Improve user experience across different devices.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .gfg {
            color: black;
        }
        @media screen and (max-width: 500px) {
            .gfg {
                color: green;
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="gfg">Sample Example of Media Query</div>
</body>
</html>
<!--Driver Code Ends-->
- Media queries apply CSS rules based on device characteristics like screen width.
- In your code, screens ≤500px wide change .gfg text color to green.
Syntax:
@media mediatype and (condition) {  /* CSS styles */}
Note: It is compulsory to add the viewport meta tag for media queries to work correctly. Learn more about it here.
Media Types in CSS
Media types specify which devices the styles should apply to. Commonly used types include:
| Media Type | Description | 
|---|---|
| all | Suitable for all media devices. | 
|  | Used for printers. | 
| screen | Targeted at computer screens, tablets, smartphones, etc. | 
| speech | Designed for screen readers that read the content aloud. | 
Media Queries for Multiple Screen Sizes
<!--Driver Code Starts-->
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--Driver Code Ends-->
    <style>
        .gfg {
            color: black;
        }
        @media screen and (max-width: 800px) {
            .gfg {
                color: blue;
            }
        }
        @media screen and (max-width: 500px) {
            .gfg {
                color: green;
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="gfg">Sample Example of Media Query</div>
</body>
</html>
<!--Driver Code Ends-->
- Styles adjust dynamically based on screen width using media queries.
- For screens 800px or smaller, the text color changes to blue.
- For screens 500px or smaller, the text color changes to green.
Media Queries for Multiple Screen Sizes with Additional Styles
<!--Driver Code Starts-->
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<!--Driver Code Ends-->
    <style>
        .gfg {
            color: black;
            font-size: 20px;
            padding: 10px;
        }
        @media screen and (max-width: 800px) {
            .gfg {
                color: blue;
                font-size: 18px;
            }
        }
        @media screen and (max-width: 500px) {
            .gfg {
                color: green;
                font-size: 16px;
                text-align: center;
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="gfg">Sample Example of Media Query</div>
</body>
</html>
<!--Driver Code Ends-->
- Styles dynamically adjust based on screen width using media queries.
- For screens 800px or smaller, the text color becomes blue, and the font size decreases to 18px.
- For screens 500px or smaller, the text color changes to green, the font size reduces to 16px, and the text is center-aligned.
CSS Media Query Features
Media queries allow developers to check various device characteristics. Here are some important features:
| Feature | Description | 
|---|---|
| color | Specifies the number of bits per color component for the device. | 
| grid | Checks whether the device is grid or bitmap. | 
| height | Represents the height of the viewport. | 
| aspect ratio | Defines the width-to-height ratio of the viewport. | 
| color-index | Indicates how many colors the device can display. | 
| max-resolution | The highest resolution the device can achieve, measured in dpi or dpcm. | 
| monochrome | Shows the number of bits per color on a monochrome device. | 
| scan | Refers to the method of scanning used by the output device. | 
| update | Describes how fast the device can update its display. | 
| width | Represents the width of the viewport. |
