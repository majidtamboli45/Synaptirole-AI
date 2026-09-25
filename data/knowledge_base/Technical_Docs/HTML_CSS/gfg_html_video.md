# HTML Video

> Source: https://www.geeksforgeeks.org/html/html5-video

The <video> element in HTML is used to show video content on web pages. It supports various video formats, including MP4, WebM, and Ogg. It is introduced in HTML5.
Syntax:
<video src="" controls>   </video>
or
<video controls="controls">
<source src="video_filename" type="video_type">
</video>
Generally, we prefer the syntax with the <source> tag wrapped between the video tag because:
- It allows you to specify multiple <source> elements for different formats of the video (e.g., MP4, WebM, Ogg), improving cross-browser compatibility.
- By including the type attribute, you can tell the browser the exact MIME type of the video file, helping it determine whether it can play the file.
Attributes of the <video> Element
The following attributes can be used with the <video> tag to enhance video playback:
| Attribute | Description | 
|---|---|
| controls | Adds playback controls such as play, pause, volume, etc. | 
| width | Specifies the width of the video player. | 
| height | Specifies the height of the video player. | 
| autoplay | Automatically starts playing the video when it's loaded. | 
| muted | Mutes the video by default. | 
| src | Specifies the video file’s path. | 
| type | Defines the format of the video (e.g., video/mp4 ,video/webm ). | 
Below is an example of using different attributes of video tag:
<html>
<body>
<video controls="" height="240" width="320">
<source src="https://media.geeksforgeeks.org/wp-content/uploads/20190616234019/Canvas.move_.mp4" type="video/mp4"/>
   Sample Video
        </video>
</body>
</html>
- The <video> tag defines the video player, with width and height attributes setting its dimensions.
- The controls attribute adds playback controls like play, pause, and volume.
Supported Formats
Three different formats are commonly supported by web browsers - mp4, Ogg, and WebM. The table below lists the formats supported by different browsers:
| Browser | MP4 | WebM | OGG | 
|---|---|---|---|
| Google Chrome | Yes | Yes | Yes | 
| Internet Explorer | Yes | No | No | 
| Firefox | Yes | Yes | Yes | 
| Opera | Yes | Yes | Yes | 
| Safari | Yes | Yes | No | 
Example 1: Responsive Video
<html>
<head>
<style>
   video {
			max-width: 100%;
			height: auto;
			display: block;
			margin: 0 auto;
		}
        </style>
</head>
<body>
<video controls="" poster="https://via.placeholder.com/640x360.png?text=Video+Loading">
<source src="https://media.geeksforgeeks.org/wp-content/uploads/20190616234019/Canvas.move_.mp4" type="video/mp4"/>
</video>
</body>
</html>
- The video is made responsive with CSS, adjusting its width to 100% of its container while maintaining the aspect ratio.
- The poster attribute displays a placeholder image before the video loads or plays, enhancing the user experience.
Example 2: Styled Video with Controls & Autoplay
<html>
<head>
<style>
   video {
			width: 640px;
			height: 360px;
			border: 2px solid #4CAF50;
			border-radius: 8px;
			background-color: #000;
		}
        </style>
</head>
<body>
<video autoplay="" controls="" loop="" muted="">
<source src="https://media.geeksforgeeks.org/wp-content/uploads/20241202174008478068/sample-vedio.mp4" type="video/mp4"/>
</video>
</body>
</html>
- The video is styled with a green border, rounded corners, and a black background to enhance its appearance.
- The autoplay, loop, and muted attributes ensure the video plays automatically, repeats indefinitely, and starts without sound, respectively.
Best Practices for Video Implementation
To ensure your videos are displayed correctly across all browsers, follow these best practices:
1. Use Multiple Video Sources
Since not all browsers support the same video formats, it's a good idea to provide multiple video formats (MP4, WebM, Ogg) in the <video> element. This will ensure that the video plays regardless of the browser the user is using.
<video controls> 
<source src="example.mp4" type="video/mp4">
<source src="example.ogg" type="video/ogg">
<source src="example.webm" type="video/webm">
Your browser does not support the video tag.
</video>
2. Optimize Video Size and Quality
To enhance user experience, make sure your videos are optimized for the web. Compress your video files without sacrificing too much quality. Use appropriate file sizes for faster loading times.
3. Implement Accessibility Features
Add captions, subtitles, or other accessibility features to make your videos more inclusive. You can use the <track> element to provide captions in various languages.
<video controls>
<source src="example.mp4" type="video/mp4">
<track src="subtitles_en.vtt" kind="subtitles" srclang="en" label="English">
Your browser does not support the video tag.
</video>
