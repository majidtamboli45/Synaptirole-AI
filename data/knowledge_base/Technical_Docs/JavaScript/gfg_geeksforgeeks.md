# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/javascript/what-is-lazy-loading/

Lazy loading is a performance optimization technique that loads resources only when they are needed.
 It helps improve initial load time and overall efficiency in modern JavaScript applications.
- Improves page load speed by deferring non-critical resources.
- Reduces bandwidth usage and memory consumption.
- Enhances user experience, especially in large web applications.
Reasons to Use Lazy Loading
Lazy loading provides several benefits, such as
- Faster Initial Page Load: By only loading the necessary content first, users can start interacting with the website sooner.
- Reduced Bandwidth Usage: Unnecessary resources are not loaded unless required, saving data.
- Improved Performance and SEO: Since search engines prioritize fast-loading pages, lazy loading can help improve SEO rankings.
- Optimized Resource Utilization: Reduces server load and improves efficiency, especially for websites with a large number of assets.
Working of Lazy Loading in Images
Lazy loading in JavaScript loads images or videos only when they’re about to be seen on the screen. This speeds up page load times and saves bandwidth. This can be done using
- Initially, a low-resolution placeholder or a blank space is used instead of the actual image. When the image is about to enter the viewport, the actual image is loaded.
- This API detects when an image comes into the viewport and loads it dynamically.
- JavaScript event listeners track user scrolling and replace placeholders with actual images when needed.
- The HTML loading="lazy" attribute tells the browser to handle lazy loading automatically without JavaScript.
Lazy Loading Images using Intersection observer API
This code implements lazy loading in JavaScript with the help of Intersection Observer API. It is an API that helps load images after the UI is rendered. It is used to halt the general nature of loading for images.
<html>
<head>
    <style>
        img {
            width: 100%;
            max-width: 600px;
            display: block;
            margin: 20px auto;
            opacity: 0;
            transition: opacity 2s ease-in-out;
        }
        img.loaded {
            opacity: 1;
        }
    </style>
</head>
<body>
    <h1>Lazy Loading Images</h1>
    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20250113100739878238/how_to_get_60_marks_in_gate_cse_.webp" data-src="https://media.geeksforgeeks.org/wp-content/uploads/20250113100824388125/how_many_marks_required_in_gate_for_iit_bombay_cse_.webp" alt="Image1">
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            const lazyImages = document.querySelectorAll('img[data-src]');
            const imageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src;
                        img.removeAttribute('data-src');
                        img.classList.add('loaded');  
                        observer.unobserve(img);
                    }
                });
            });
            lazyImages.forEach(img => {
                imageObserver.observe(img);
            });
        });
    </script>
</body>
</html>
- The code uses lazy loading to improve page performance. Initially, images are not loaded; only a placeholder is shown. The real image is loaded when it becomes visible in the viewport as the user scrolls.
- The IntersectionObserver is used to detect when an image enters the viewport. When an image is about to be visible, it triggers the callback function, allowing the image to load by setting the src attribute to the value in data-src.
- The img element is initially hidden with opacity: 0. Once the image loads, the loaded class is added, which changes the opacity to 1, making the image fade in smoothly over 2 seconds.
- The script selects all images with a data-src attribute and observes each one. When an image enters the viewport, it updates the src attribute, removes the data-src, and stops further observation for that image to optimize performance.
Working of Lazy Loading in videos
Lazy loading in JavaScript is a technique to delay the loading of content, such as images or videos, until it is needed (e.g., when it comes into view).
- The content (image/video) is initially loaded with placeholder data or not loaded at all.
- The IntersectionObserver monitors when the content enters the viewport, signaling that it should be loaded.
- When the content is visible, the actual resource (e.g., image/video) is fetched by updating its src attribute.
- Once loaded, the content can be shown with a transition effect (like a fade-in) for a smooth user experience.
Lazy Loading videos using Intersection observer
<html>
<head>
    <style>
        video {
            width: 600px;
            opacity: 0;
            transition: opacity 1s ease-in-out; 
        }
        video.loaded {
            opacity: 1; 
        }
    </style>
</head>
<body>
    <h1>Lazy Loading Videos</h1>
    <video controls>
        <source type="video/mp4">
        Your browser does not support the video tag.
    </video>
    <script>
        const lazyVideos = document.querySelectorAll('video');
        lazyVideos.forEach(video => {
            const videoObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const source = entry.target.querySelector('source');
                        source.src = source.dataset.src; 
                        entry.target.load(); 
                        entry.target.classList.add('loaded'); 
                        observer.unobserve(entry.target);
                    }
                });
            });
            const sourceElement = video.querySelector('source');
            sourceElement.dataset.src = 'https://media.geeksforgeeks.org/wp-content/uploads/20241108121040706646/Output.mp4';
            videoObserver.observe(video);
        });
    </script>
</body>
</html>
- The code selects all <video> elements on the page using document.querySelectorAll('video') to apply lazy loading to each one.
- An IntersectionObserver is used to monitor when a video enters the viewport. It listens for changes in the visibility of the video element as the user scrolls.
- When a video enters the viewport (entry.isIntersecting), the observer updates the src attribute of the <source> tag with the actual video URL stored in data-src.
- Once the video starts loading, the load() method is called, and the loaded class is added to the video element, which triggers a fade-in effect using CSS.
- After the video has been loaded and displayed, the observer stops monitoring that specific video with observer.unobserve(entry.target) to optimize performance.
Working of Lazy Loading in Data Fetching
Lazy loading in data refers to fetching and loading data only when it is needed, such as when a user scrolls or interacts with the application.
- Initial Data Setup: Only a small subset or placeholder data is initially loaded to minimize the initial load time.
- User Interaction or Scroll: The system monitors user actions or scrolling to determine when more data should be loaded.
- Fetch Data on Demand: Once the user reaches a certain point or requests more data, additional data is fetched from the server or database.
- Optimize Resource Usage: After loading the necessary data, the system stops fetching more data until it is required, reducing unnecessary resource consumption.
Lazy Loading Files using JavaScript
<html>
<head></head>
<body>
    <h1>Defer vs Async Example</h1>
    <p>Check the console for script loading and execution behavior!</p>
    <!-- Async script -->
    <script async>
        console.log("Async script")
    </script>
    <!-- Defer script -->
    <script defer>
        console.log("Defer Script")
    </script>
    <script>
        console.log('Inline script: This runs after the HTML is parsed, before the external scripts.');
    </script>
</body>
</html>
- Async Script: The first <script> tag uses the async attribute, which tells the browser to load and execute the script asynchronously. This means it doesn’t block the HTML parsing and runs as soon as it's loaded.
- Defer Script: The second <script> tag uses the defer attribute, which ensures the script is executed only after the HTML is fully parsed. It loads in parallel with the HTML but executes after all HTML content is parsed.
- Inline Script: The third <script> tag is an inline script that runs after the HTML is parsed, but before the async and defer scripts are executed.
- Script Execution Order: The async script runs as soon as it’s loaded, the inline script runs after HTML parsing, and the defer script runs after the entire HTML document is parsed. The console will show the order of execution.
Advantages of using Lazy Loading
- Delays Loading: Lazy loading in JavaScript delays loading content, like images or videos, until it's needed (e.g., when it’s about to be visible on the screen).
- Improves Performance: By loading only what's necessary, lazy loading reduces the initial page load time and speeds up the website.
- Saves Bandwidth: It prevents loading resources that users may never see, saving bandwidth and reducing unnecessary network requests.
- Triggers on Scroll: Lazy loading often works when the user scrolls, loading resources only when they are close to entering the viewport.
- Enhances User Experience: It ensures that content appears smoothly as users interact with the page, without delays caused by loading everything upfront.
