# CSS Properties Mini Project

> Source: https://www.geeksforgeeks.org/css/css-properties-mini-project

You are tasked with building a simple developer profile card using HTML and CSS. The page should present a developer's profile, role, introduction, skills, and contact option in a clean and organized layout.
You must build the project using the CSS properties covered in this module, including display, background, fonts, margins, borders, and padding.
Your project must meet the following requirements:
- Backgrounds: Add a page background and use background properties to control its appearance.
- Font: Use font properties such as font family, size, weight, style, line height, and letter spacing.
- Margins: Use margin to create proper spacing between elements and position the profile card.
- Borders: Add borders and rounded corners to the profile card, image, skill tags, and button.
- Display: Use inline-block for the skill tags and contact link.
- Padding: Use padding to create proper internal spacing within the profile card, skill tags, and contact button.
Step-by-Step Implementation
1. Create the Page Background and Profile Card
Start with the developer profile structure and use background, margin, padding, border, and display properties to create the main layout.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Developer Profile Card</title>
    <style>
<!--Driver Code Ends-->
        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #e8f5f2;
            background-image: linear-gradient(135deg, #e8f5f2, #d8ecff);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        .profile-card {
            width: 360px;
            padding: 30px;
            background-color: white;
            border: 2px solid #d5d5d5;
            border-radius: 18px;
            text-align: center;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="profile-card">
        <img
            class="profile-image"
            src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png"
            alt="Profile photo"
        >
        <h1 class="profile-name">Alex Johnson</h1>
        <p class="profile-role">Frontend Developer</p>
        <p class="profile-description">
            I enjoy building simple, accessible, and user-friendly
            web experiences using modern web technologies.
        </p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
The page background uses background properties, while margin, padding, border, and border-radius create the profile card.
2. Style the Profile Image and Text
Add the image styling and use font properties to create a clear hierarchy between the developer's name, role, and description.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Developer Profile Card</title>
    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #e8f5f2;
            background-image: linear-gradient(135deg, #e8f5f2, #d8ecff);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        .profile-card {
            width: 360px;
            padding: 30px;
            background-color: white;
            border: 2px solid #d5d5d5;
            border-radius: 18px;
            text-align: center;
        }
        .profile-image {
<!--Driver Code Ends-->
            width: 110px;
            height: 110px;
            margin-bottom: 20px;
            border: 4px solid #0b8f72;
            border-radius: 50%;
        }
        .profile-name {
            margin: 10px 0 5px;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: capitalize;
        }
        .profile-role {
            margin: 0 0 18px;
            color: #0b8f72;
            font-size: 16px;
            font-weight: 600;
            font-style: italic;
        }
        .profile-description {
            margin: 0 0 24px;
            color: #555;
            font-size: 15px;
            line-height: 1.6;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="profile-card">
        <img
            class="profile-image"
            src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png"
            alt="Profile photo"
        >
        <h1 class="profile-name">Alex Johnson</h1>
        <p class="profile-role">Frontend Developer</p>
        <p class="profile-description">
            I enjoy building simple, accessible, and user-friendly
            web experiences using modern web technologies.
        </p>
    </div>
</body>
</html>
<!--Driver Code Ends-->
This demonstrates font-size, font-weight, font-style, line-height, letter-spacing, text-transform, and margin.
3. Add Skill Tags and Contact Link
Add the developer's skills and contact option. Use inline-block, padding, background, borders, and font properties.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Developer Profile Card</title>
    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #e8f5f2;
            background-image: linear-gradient(135deg, #e8f5f2, #d8ecff);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        .profile-card {
            width: 360px;
            padding: 30px;
            background-color: white;
            border: 2px solid #d5d5d5;
            border-radius: 18px;
            text-align: center;
        }
        .profile-image {
            width: 110px;
            height: 110px;
            margin-bottom: 20px;
            border: 4px solid #0b8f72;
            border-radius: 50%;
        }
        .profile-name {
            margin: 10px 0 5px;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: capitalize;
        }
        .profile-role {
            margin: 0 0 18px;
            color: #0b8f72;
            font-size: 16px;
            font-weight: 600;
            font-style: italic;
        }
        .profile-description {
            margin: 0 0 24px;
            color: #555;
            font-size: 15px;
            line-height: 1.6;
        }
        .skills {
<!--Driver Code Ends-->
            margin-bottom: 25px;
        }
        .skill {
            display: inline-block;
            margin: 5px;
            padding: 8px 12px;
            background-color: #e5f7f2;
            border: 1px solid #0b8f72;
            border-radius: 20px;
            color: #08745d;
            font-size: 13px;
            font-weight: 600;
        }
        .contact-button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #0b8f72;
            border: 2px solid #0b8f72;
            border-radius: 8px;
            color: white;
            font-size: 15px;
            font-weight: 700;
            text-decoration: none;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="profile-card">
        <img
            class="profile-image"
            src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo-100.png"
            alt="Profile photo"
        >
        <h1 class="profile-name">Alex Johnson</h1>
        <p class="profile-role">Frontend Developer</p>
        <p class="profile-description">
            I enjoy building simple, accessible, and user-friendly
            web experiences using modern web technologies.
        </p>
        <div class="skills">
            <span class="skill">HTML</span>
            <span class="skill">CSS</span>
            <span class="skill">JavaScript</span>
        </div>
        <a href="#" class="contact-button">Contact Me</a>
    </div>
</body>
</html>
<!--Driver Code Ends-->
display: inline-block allows the skill tags and contact link to accept padding and border while remaining in an inline layout.
Final Source Code
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Developer Profile Card</title>
    <style>
        body {
            margin: 0;
            min-height: 100vh;
            font-family: Arial, Helvetica, sans-serif;
            background-color: #e8f5f2;
            background-image: linear-gradient(135deg, #e8f5f2, #d8ecff);
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
        .profile-card {
            width: 360px;
            padding: 30px;
            background-color: white;
            border: 2px solid #d5d5d5;
            border-radius: 18px;
            text-align: center;
        }
        .profile-image {
            display: block;
            width: 110px;
            height: 110px;
            margin: 0 auto 20px;
            border: 4px solid #0b8f72;
            border-radius: 60%;
        }
        .profile-name {
            margin: 10px 0 5px;
            font-size: 28px;
            font-weight: 700;
            letter-spacing: 0.5px;
            text-transform: capitalize;
        }
        .profile-role {
            margin: 0 0 18px;
            color: #0b8f72;
            font-size: 16px;
            font-weight: 600;
            font-style: italic;
        }
        .profile-description {
            margin: 0 0 24px;
            color: #555;
            font-size: 15px;
            line-height: 1.6;
        }
        .skills {
            margin-bottom: 25px;
        }
        .skill {
            display: inline-block;
            margin: 5px;
            padding: 8px 12px;
            background-color: #e5f7f2;
            border: 1px solid #0b8f72;
            border-radius: 20px;
            color: #08745d;
            font-size: 13px;
            font-weight: 600;
        }
        .contact-button {
            display: inline-block;
            padding: 12px 24px;
            background-color: #0b8f72;
            border: 2px solid #0b8f72;
            border-radius: 8px;
            color: white;
            font-size: 15px;
            font-weight: 700;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div class="profile-card">
        <img
            class="profile-image"
            src="https://media.geeksforgeeks.org/wp-content/uploads/20251217100826943000/gfglogo.png"
            alt="Profile photo"
        >
        <h1 class="profile-name">Alex Johnson</h1>
        <p class="profile-role">Frontend Developer</p>
        <p class="profile-description">
            I enjoy building simple, accessible, and user-friendly
            web experiences using modern web technologies.
        </p>
        <div class="skills">
            <span class="skill">HTML</span>
            <span class="skill">CSS</span>
            <span class="skill">JavaScript</span>
        </div>
        <a href="#" class="contact-button">Contact Me</a>
    </div>
</body>
</html>
Output
Note:
- CSS background properties control the appearance of the page background.
- margin andpadding control spacing around and inside elements.
-  Borders and border-radius help create the profile card and rounded elements.
- Font properties control the appearance and readability of text.
- display: inline-block allows the skill tags and contact link to use padding and borders while staying in an inline layout.
