# Interesting Facts About CSS Flexbox

> Source: https://www.geeksforgeeks.org/css/interesting-facts-about-css-flexbox

CSS Flexbox is a powerful layout tool that allows us to design complex layouts with ease. Below, we explore some key facts and examples that can help you work with Flexbox more efficiently.
1. Center Items with Just a Few Lines of Code
Flexbox makes centering elements both vertically and horizontally incredibly easy. No more complex margin or positioning tricks!
- Simple centering: You can center elements in one step.
- Responsive: It works well on any screen size.
- No extra CSS: No need for extra wrapper elements or margin hacks.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .box {
            width: 200px;
            height: 100px;
            background-color: lightblue;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="box"></div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- justify-content: center horizontally centers the box.
- align-items: center vertically centers the box within the container.
- height: 100vh makes sure the container takes the full height of the screen.
2. Flex Items Can Grow or Shrink Based on Available Space
Flexbox is great for creating layouts where elements grow or shrink based on the available space, which is perfect for responsive design.
- Flexible sizing: Items adjust their size automatically.
- Avoids overflow: No need to worry about content overflowing the container.
- Ideal for fluid layouts: Perfect for creating grids and fluid designs.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            display: flex;
            gap: 10px;
        }
        .item {
            flex: 1;
            background-color: lightgreen;
            height: 100px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="item"></div>
        <div class="item"></div>
        <div class="item"></div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- flex: 1 allows each item to grow and take equal space within the container.
- gap: 10px adds spacing between the items.
3. Flexbox Can Create Simple Grids
You can create grid-like layouts with Flexbox without needing to use CSS Grid, especially for simpler layouts like equal-width columns.
- Easy grid system: Flexbox automatically arranges items in rows or columns.
- No complex setups: Ideal for simple layouts without the complexity of CSS Grid.
- Responsive: Items adjust their layout as needed.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }
        .item {
            flex: 1 1 30%; /* Flex items take up 30% of the width */
            background-color: lightcoral;
            height: 150px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="item"></div>
        <div class="item"></div>
        <div class="item"></div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- flex: 1 1 30% ensures each item takes up about 30% of the container’s width, and will adjust as the container resizes.
- flex-wrap: wrap allows the items to wrap to the next line if there’s not enough space.
4. Flexbox Can Collapse Items Without Affecting Layout
You can hide items using visibility: collapse, which keeps their layout space intact but hides the item visually.
- Preserves layout: The hidden element’s space is still accounted for.
- Useful for dynamic UIs: Great for things like dropdowns or collapsible panels.
- Doesn’t affect flow: The layout won’t shift when items are collapsed.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .container {
            display: flex;
            gap: 20px;
        }
        .item {
            flex: 1;
            background-color: lightseagreen;
            height: 100px;
        }
        .collapsed {
            visibility: collapse; /* Hide the item but keep its space */
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="container">
        <div class="item"></div>
        <div class="item collapsed"></div> <!-- Collapsed item -->
        <div class="item"></div>
    </div>
</body>
</html>
<!--Driver Code Ends-->
- The second .item is hidden using visibility: collapse, but its space is still maintained within the container.
- The other items adjust based on the remaining space, making this technique useful for dynamic content.
