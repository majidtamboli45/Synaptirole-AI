# HTML Images

> Source: https://www.geeksforgeeks.org/html/html-images

The HTML <img> tag is used to embed an image in web pages by linking them. It creates a placeholder for the image, defined by attributes like src, width, height, and alt, and does not require a closing tag.
- There are two ways to insert the images into a webpage:
- By providing a full path or address (URL) to access an internet file.
- By providing the file path relative to the location of the current web page file.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20210915115837/gfg3-300x300.png" 
         alt="GFG image" />
</body>
</html>
- <img> tag is used to embed an image in a webpage.
- src specifies the image source URL.
- alt provides descriptive text if the image cannot be displayed.
HTML img Tag Attributes
| Attribute | Description | 
|---|---|
| src | Specifies the path to the image file. | 
| alt | Provides alternate text for the image, useful for accessibility and when the image cannot be displayed. | 
| crossorigin | Allows importing images from third-party sites with cross-origin access, typically used with canvas. | 
| height | Specifies the height of the image. | 
| width | Specifies the width of the image. | 
| ismap | Specifies an image as a server-side image map. | 
| loading | Specifies whether the browser should defer image loading or load it immediately. | 
| longdesc | Specifies a URL to a detailed description of the image. | 
| referrerpolicy | Specifies which referrer information to use when fetching the image. | 
| sizes | Specifies image sizes for different page layouts. | 
| srcset | Specifies a list of image files to use in different situations, allowing for responsive images. | 
| usemap | Specifies an image as a client-side image map. | 
HTML Image tag - alt Attribute
The alt attribute in the <img> tag provides alternative text when an image cannot be displayed and improves accessibility.
- Displays text if the image fails to load.
- Helps users with slow connections or broken image links.
- Essential for screen readers and accessibility support.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <img src=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/201907101022/download3.png"
        alt="This is GeeksforGeeks logo" />
</body>
</html>
Set Image Size - Width and Height Attribute
The width and height attributes in the <img> tag define the size of an image, with values specified in pixels by default.
- Control the displayed width and height of an image.
- Values are specified in pixels.
- Help maintain consistent layout and prevent page shifting.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <img src=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png"
        alt="GeeksforGeeks logo" 
        width="300" 
        height="300" />
</body>
</html>
Adding Titles to an Image
The title attribute adds a tooltip to an image that appears when a user hovers over it.
- Displays descriptive text on mouse hover.
- Added using the title attribute in the <img> tag.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <img src=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png"
        alt="GeeksforGeeks logo" 
        width="200" 
        height="200" 
        title="Logo of GeeksforGeeks" />
</body>
</html>
Setting Style of an Image
The border attribute is used to control the border appearance of an image.
- Specifies the thickness of the image border.
- Setting border="0" removes the border completely.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <img src=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png"
        alt="GeeksforGeeks logo" 
        width="200" 
        height="200" 
        border="5" />
</body>
</html>
- The border attribute adds a visible outline, showing how an image’s style can be adjusted.
- This demonstrates basic styling, though modern styling is done using CSS.
Set Image Alignment
Image alignment in HTML controls how an image is positioned within a webpage layout.
- Alignment is set using the align attribute in the <img> tag.
- Common values include left, right, and center.
- Helps improve page layout and visual presentation.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <img 
src="https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png"
        alt="GeeksforGeeks logo" 
        align="right" />
</body>
</html>
- The align="right" attribute positions the image on the right side of the webpage.
- It shows how image alignment worked in older HTML, though CSS is now the recommended method.
Adding Image as a Link
Wrap the <img> tag inside an <a> tag to make the image clickable and link it to another page or resource.
File paths are of two types:
- Absolute File Paths: It always contains the root element along with the complete directory list required to locate the file.
- Relative File Paths: Specify the location of a file or folder relative to the current directory.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <a href="https://www.geeksforgeeks.org/">
        <img src=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20190710102234/download3.png"
            alt="GeeksforGeeks logo" />
    </a>
</body>
</html>
Adding Animated Image
Animated images in HTML are added using GIF files to create motion effects on webpages.
- Use the <img> tag with a GIF file as the source.
- Animation plays automatically in supported browsers.
- Enhances visual appeal and user engagement.
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <img src="smiley.gif" 
         alt="smiley" 
         style="width: 200px; height: 200px" /> 
</body>
</html>
Image Formats
Here is the commonly used image file format that is supported by all the browsers.
| Abbreviation | File Type | Extension | 
|---|---|---|
| PNG | Portable Network Graphics. | .png | 
| JPEG. | Joint Photographic Expert Group image. | .jpg, .jpeg, .jfif, .pjpeg, .pjp | 
| SVG | Scalable Vector Graphics. | .svg. | 
| GIF | Graphics Interchange Format. | .gif | 
| ICO | Microsoft Icon. | .ico, .cur | 
| APNG | Animated Portable Network Graphics. | .apng | 
Tips for Using HTML Images Effectively
Use images wisely in HTML to improve performance, accessibility, and overall user experience.
- Optimize sizes: Compress images and choose the right format (JPEG for photos, PNG for limited colors, SVG for vectors).
- Use clear alt text: Describe the image’s purpose to improve accessibility and support screen readers.
- Make images responsive: Use srcset to serve different images for different devices and resolutions.
- Keep aspect ratios: Avoid stretching images to maintain visual quality.
- Respect copyrights: Use only images you own or have permission to use.
Question About HTML Images
