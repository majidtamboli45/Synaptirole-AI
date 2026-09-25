# HTML DOM Audio/Video Complete Reference

> Source: https://www.geeksforgeeks.org/html/html-dom-audio-video-complete-reference

HTML DOM Audio/Video properties and methods allow developers to control audio and video elements programmatically.
- These controls include playing, pausing, stopping, and adjusting volume.
- DOM methods enable dynamic interaction and customization of media elements.
- They enhance the user experience by offering seamless media functionality.
<html>
<body>
	<audio controls>
		<source src="audiofile.mp3" type="audio/mpeg">
		audio element.
	</audio>
	<br><br>
	<video width="320" height="240" controls>
		<source src="videofile.mp4" type="video/mp4">
		video Element.
	</video>
</body>
</html>
- Audio Element: The <audio> tag adds audio playback with controls for the user.
- Video Element: The <video> tag displays a video with controls for play, pause, and volume.
The complete list of HTML DOM Audio/Video methods and properties is given below:
Best Practices for HTML DOM Audio/Video
- Use Multiple Formats: Provide audio and video files in various formats (e.g., MP4, WebM, Ogg) to ensure compatibility across different browsers.
- Include Fallback Content: Add alternative text or links within <audio> and <video> tags for browsers that do not support these elements.
- Implement Custom Controls: Utilize JavaScript to create custom playback controls, enhancing accessibility and providing a consistent user experience across browsers.
- Optimize File Sizes: Compress media files to reduce loading times, improving performance without compromising quality.
