# HTML Audio

> Source: https://www.geeksforgeeks.org/html/html-audio

The HTML <audio> element is used to add audio content to a webpage, allowing you to play music, sound effects, or other audio files directly in the browser.
Syntax
<audio>
<source src="sample.mp3" type="audio/mpeg">
</audio>.
<!DOCTYPE html>
<html lang="en">
<body>
	<audio>
		<source src=
"https://media.geeksforgeeks.org/wp-content/uploads/20241009180552641558/sample-12s.mp3" type="audio/mp3">
		<source src="" type="audio/ogg">
	</audio>
</body>
</html>
Note:The <audio> supports the global attributes and event attributes.
Functionality of HTML Audio
The HTML <audio> element allows embedding audio files with options for controls, autoplay, looping, source, and muting.
- The controls attribute adds play, pause, and volume controls to the audio player.
- The autoplay attribute makes the audio play automatically when the page loads.
- The loop attribute makes the audio play continuously, repeating the file.
- The src attribute defines the URL of the audio file.
- The muted attribute silences the audio when the page loads.
HTML Audio Media Types
HTML audio supports multiple media types, including MP3 (audio/mpeg), OGG (audio/ogg), and WAV (audio/wav).
- The mp3 file format with media type audio/mpeg.
- The ogg file format with media type audio/ogg.
- The wav file format with media type audio/wav.
More Examples of HTML Audio
Basic Autoplay Audio
<html lang="en">
<body>
	<audio autoplay>
		<source src="https://media.geeksforgeeks.org/wp-content/uploads/20241009180552641558/sample-12s.mp3"
                type="audio/mpeg">
	</audio>
</body>
</html>
- The <audio> element includes the autoplay attribute, causing the audio to play automatically upon page load.
- The <source> element specifies the audio file's URL and its MIME type.
To learn more about the HTML audio autoplay attribute, click here Link
Autoplay Audio with Controls and Styling
<!DOCTYPE html>
<html lang="en">
<head>
	<style>
		audio {
			display: block;
			margin: 20px auto;
			width: 80%;
		}
	</style>
</head>
<body>
	<audio controls autoplay>
		<source src=
"https://media.geeksforgeeks.org/wp-content/uploads/20241009180552641558/sample-12s.mp3" type="audio/mpeg">
	</audio>
</body>
</html>
- The <audio> element includes both controls and autoplay attributes, providing playback controls to the user while starting the audio automatically.
- The CSS styles center the audio player on the page and set its width to 80% of the container, enhancing its appearance.
Best Practices for HTML Audio
- Provide multiple audio formats to ensure compatibility across different browsers.
- Include the controls attribute to offer users playback options like play, pause, and volume control.
