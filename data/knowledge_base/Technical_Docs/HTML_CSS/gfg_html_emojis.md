# HTML Emojis

> Source: https://www.geeksforgeeks.org/html/html-emojis

Unicode is a universal character encoding standard that assigns unique code points to all characters, including emojis, ensuring consistent display across devices and platforms. In HTML, emojis are treated as text and can be inserted directly or using Unicode escape codes like 😀.
- Unicode supports characters from all languages, symbols, and emojis worldwide.
- Emojis are Unicode characters rendered visually by browsers.
- HTML allows emojis via direct insertion or numeric Unicode entities.
- UTF-8 is the most widely used Unicode encoding on the web.
- Over 90% of websites rely on Unicode for multilingual and emoji-rich content.
Note: Emojis are just special Unicode characters displayed as images.
Adding Emojis in HTML Code
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<!--Driver Code Ends-->
<body>
    <p>Here is a smiley face: 😊</p>
	<p>Here is a smiley face: 😊</p>
</body>
<!--Driver Code Starts-->
</html>
<!--Driver Code Ends-->
Examples 1: HTML Emojis using Unicode Decimal reference
HTML Emojis are represented using Unicode decimal references like 😄 to display emojis, enabling the rendering of various symbols and icons in web content.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<!--Driver Code Ends-->
<body>
    <h1>HTML Emojis Example</h1>
    <p>
        😄 This is a smiling face with open mouth
        and smiling eyes emoji.
    </p>
    <p>✌ This is a victory hand emoji.</p>
    <p>⌚ This is a watch emoji.</p>
</body>
<!--Driver Code Starts-->
</html>
<!--Driver Code Ends-->
- Define the document type with <!DOCTYPE html>. Set charset with <meta charset="UTF-8">.
- Ensure proper display across devices with <meta name="viewport" content="width=device-width, initial-scale=1.0">.
- 😄 : Smiling face with open mouth and smiling eyes.
- ✌️: Victory hand emoji.
- ⌚: Watch emoji.
- Emojis represented using Unicode values in HTML.
| Emoji | Decimal | Hexadecimal | 
|---|---|---|
| 😄 | 128516 | 1F604 | 
| ✌ | 9996 | 270C | 
| ⌚ | 128350 | 1F55E | 
Example 2: HTML Emojis using Unicode hexadecimal reference
HTML Emojis are displayed using Unicode hexadecimal references like 😄, allowing the inclusion of diverse symbols and icons in web content.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<!--Driver Code Ends-->
<body>
    <h1>HTML Emojis Example using Unicode hexadecimal </h1>
    <p>
        😄 This is a smiling face with open mouth
        and smiling eyes emoji
    </p>
    <p>✌ This is a victory hand emoji</p>
    <p>⌚ This is a watch emoji</p>
</body>
<!--Driver Code Starts-->
</html>
<!--Driver Code Ends-->
- Unicode hexadecimal references used for emojis, like 😄, ✌, and ⌚.
- Emojis represented by Unicode code points, enclosed in &#x and ;.
- Each emoji has a unique hexadecimal Unicode value.
- Emojis render according to their Unicode representations in modern web browsers.
Note: Since Emojis are characters, they can be copied, displayed and sized just like any other character in HTML.
Example 3: Change Size of Emoji Using CSS
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
    <style>
        .large {
            font-size: 2em;
        }
    </style>
</head>
<!--Driver Code Ends-->
<body>
    <h1>HTML Emojis Example</h1>
    <h3>Transport symbols</h3>
    <p>
        🚂 Train   
        <span class="large">🛥</span> Tram
    </p>
    <h3>Office emojis</h3>
    <p>
        🏢 Office Building   
        <span class="large">💼</span> Laptop
    </p>
    <h3>People emojis</h3>
    <p>
        👨 Man   
        <span class="large">👩</span> Woman
    </p>
    <h3>People emojis</h3>
    <p>
        🐶 Dog   
        <span class="large">🦁</span> Lion
    </p>
</body>
<!--Driver Code Starts-->
</html>
<!--Driver Code Ends-->
- Defines emojis using Unicode hexadecimal references across categories like transport, office, people, and animals.
- Each category includes two emojis, with the second one styled larger using CSS.
- Displays emojis alongside descriptive text to indicate their meaning.
HTML Emojis Examples
| HTML Emojis | Symbols | 
|---|---|
| HTML Emoji Food Symbols | 🍕 🍔 🌮 🍩 🍎 | 
| HTML Emoji Transport Symbols | 🚗 ✈️ 🚂 🚲 🚢 | 
| HTML Emoji Plant Symbols | 🌵 🌻 🌲 🌼 🌱 | 
| HTML Emoji Office Symbols | 🖥️ 📠 🖋️ 📅 📋 | 
| HTML Emoji People Symbols | 👨💻 👩⚕️ 🧑🎓 👨🏫 👩🚀 | 
| HTML Emoji Animals Symbols | 🐱 🐶 🦁 🐘 🐸 | 
| HTML Emoji Places Symbols | 🏙️ 🏖️ 🏞️ 🏰 🗽 | 
| HTML Emoji Face Symbols | 😀 😁 😍 😎 🤔 |
