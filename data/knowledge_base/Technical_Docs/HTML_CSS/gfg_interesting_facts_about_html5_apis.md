# Interesting Facts About HTML5 APIs

> Source: https://www.geeksforgeeks.org/html/interesting-facts-about-html5-apis

HTML5 APIs, though often operating behind the scenes, are fundamental to enhancing web functionality and user experience. These APIs serve as powerful tools, enabling developers to create dynamic, interactive, and feature-rich web applications.
1. Geo API is used to catch the location
It helps to get a user's real-time location using GPS. It can be used for maps, tracking, or location-based services.
navigator.geolocation.getCurrentPosition(pos => console.log(pos.coords));
2. Web Storage API stores data locally without expiration
Stores data locally in the browser without expiration. Unlike cookies, it does not send data to the server with every request.
localStorage.setItem("username", "Alex");
console.log(localStorage.getItem("username"));
3. Canvas API enables dynamic drawing of graphics
Enables dynamic drawing of graphics, animations, and charts.It provides a powerful way to create interactive visual content on webpages.
<canvas id="canvas" width="200" height="100"></canvas>
<script>
  let ctx = document.getElementById("canvas").getContext("2d");
  ctx.fillStyle = "blue";
  ctx.fillRect(20, 20, 100, 50);
</script>
4. Fetch API allows fetching data asynchronously
Allows fetching data from servers asynchronously. It replaces older XMLHttpRequest with a cleaner and simpler syntax.
5. Vibration API makes the device vibrate for notifications
Makes the device vibrate for notifications or alerts.This feature is useful in gaming, messaging, and user interactions.
6. Speech Recognition API converts spoken words into text
Converts spoken words into text. It allows voice commands and dictation in web applications.
7. Fullscreen API enables fullscreen mode for better UX
Enables fullscreen mode for better user experience.Useful for video players, presentations, or immersive applications.
document.documentElement.requestFullscreen();
8. Gamepad API detects and interacts with connected controllers
Detects and interacts with connected game controllers. It enables using controllers for gaming directly in web apps.
window.addEventListener("gamepadconnected", e => console.log("Gamepad connected:", e.gamepad));
