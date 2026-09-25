# Interesting Facts About CSS Image Styling

> Source: https://www.geeksforgeeks.org/css/interesting-facts-about-css-image-styling

CSS provides a variety of ways to manipulate and enhance images in your layouts. Let’s explore some facts that will help you improve your image styling and create more dynamic, engaging websites.
1. Control Image Aspect Ratio with aspect-ratio
The aspect-ratio property is a game-changer for maintaining consistent image proportions, ensuring your images are responsive and always look well-aligned.
- Maintain Proportions: Use aspect-ratio to control the width and height ratio of your images.
- Responsive Design: Ensures images resize correctly on different screen sizes.
- No Extra Containers Needed: Unlike older methods, this doesn’t require wrapping elements or padding hacks.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        img {
            width: 100%;
            aspect-ratio: 16 / 9;
            object-fit: cover;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>    
<img 
src="https://media.geeksforgeeks.org/wp-content/uploads/20241129170413217901/InterestingFactsAboutCSS-min-1024x566_11zon.jpg" 
     alt="Image example">
</body>
</html>
<!--Driver Code Ends-->
- The aspect-ratio: 16 / 9 ensures the image keeps a 16:9 ratio no matter the width of the container.
- object-fit: cover ensures the image fully covers the space without stretching, while maintaining the aspect ratio.
2. Control How an Image Fills Its Container with object-fit
The object-fit property is a simple yet powerful way to control how images scale and fill their container, whether you want them to stretch, cover, or contain.
- Fit the container: object-fit: cover ensures the image covers the container, cropping it as needed.
- Contain within bounds: object-fit: contain ensures the whole image is visible without stretching.
- Responsive control: Perfect for responsive designs where you need images to adjust to various container sizes.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20241129170413217901/InterestingFactsAboutCSS-min-1024x566_11zon.jpg"
         alt="Image example">
</body>
</html>
<!--Driver Code Ends-->
- object-fit: cover ensures that the image covers the entire container, even if part of it gets cropped.
- The image resizes to maintain its aspect ratio and cover the entire available space.
3. Apply Effects to Images with CSS Filters
CSS filters like blur, brightness, and contrast provide a simple way to apply effects directly to images, giving you more creative control.
- Image enhancement: Use filter to adjust the appearance of images, such as adding a blur effect or increasing contrast.
- Dynamic effects: Filters can be applied on hover for interactive effects.
- No need for extra software: Filters are native CSS properties, so they don’t require external libraries or tools.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        img {
            width: 100%;
            height: 300px;
            transition: filter 0.3s ease;
        }
        img:hover {
            filter: blur(5px) brightness(80%);
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <img 
src="https://media.geeksforgeeks.org/wp-content/uploads/20241129170413217901/InterestingFactsAboutCSS-min-1024x566_11zon.jpg"
         alt="Image example">
</body>
</html>
<!--Driver Code Ends-->
- filter: blur(5px) applies a blur effect on hover, and brightness(80%) darkens the image.
- The transition property adds a smooth effect when hovering.
4. Round Image Corners with border-radius
The border-radius property allows you to easily round the corners of your images, adding a soft, modern touch to your design.
- Rounded corners: Use border-radius to create rounded edges, giving the image a more polished and soft look.
- Circular images: Set border-radius: 50% to create perfectly circular images.
- Works on all images: This can be applied to any image in your layout, whether it’s a profile picture or a banner image.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        img {
            width: 200px;
            height: 200px;
            border-radius: 50%;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <img 
src="https://media.geeksforgeeks.org/wp-content/uploads/20241129170413217901/InterestingFactsAboutCSS-min-1024x566_11zon.jpg" 
         alt="Image example">
</body>
</html>
<!--Driver Code Ends-->
- border-radius: 50% makes the image circular, which is commonly used for profile pictures or icons.
