# Dynamic Resume Creator using HTML CSS and JavaScript

> Source: https://www.geeksforgeeks.org/javascript/dynamic-resume-creator-using-html-css-and-javascript/

This article introduces a Resume Creator project that helps users build professional and well-structured resumes easily using a simple and user-friendly interface. It eliminates common challenges like formatting and organizing details.
- Provides an easy way to create polished and professional resumes quickly.
- Saves time by automating formatting and layout design.
- Improves presentation, helping users stand out in job applications.
Prerequisites: HTML, CSS, JavaScriptStep-by-Step
Step-by-Step Guide for Resume Creator Project
- Step 1: Create an HTML form with input fields for resume information.
- Step 2: Use JavaScript to toggle between the input form and resume preview.
- Step 3: Retrieve user input from the form and dynamically populate the preview.
- Step 4: Include a button for printing the resume.
- Step 5: Style the elements using CSS for the desired layout and design.
<!-- index.html  -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Resume Creator</title>
    <!-- style link here -->
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <!-- input container starts here -->
    <section class="resume-builder">
        <div class="container">
            <h1>Resume Creator</h1>
            <div class="resume_container">
                <form class="inputField">
                    <input type="text" 
                           name="name" 
                           placeholder="Your Name" 
                           title="Enter Your Name" />
                    <input type="text" 
                           name="title" 
                           placeholder="Title/Sub Heading" 
                           title="Enter Title/Sub Heading" />
                    <textarea name="work_experience" 
                              placeholder="Work Experience" 
                              cols="40" rows="3"
                              title="Enter Your Work Experience">
                    </textarea>
                    <textarea name="academic_details" 
                              placeholder="Academic Details" 
                              cols="40" rows="3"
                              title="Enter Your Academic Details">
                    </textarea>
                    <input type="text" placeholder="Objective" 
                           title="Enter Your Objective" 
                           name="objective" />
                    <textarea name="skills" 
                              title="Enter Your Skills" 
                              placeholder="Skills" cols="40"
                              rows="3">
                    </textarea>
                    <textarea name="projects" 
                              title="Enter Your Projects" 
                              placeholder="Projects" 
                              cols="40"
                              rows="3">
                    </textarea>
                    <textarea name="achievements" 
                              placeholder="Achievements" 
                              cols="40" rows="3"
                              title="Enter Your Achievements">
                    </textarea>
                    <textarea name="contact" 
                              placeholder="Contact Information" 
                              cols="40" rows="3"
                              title="Enter Your Contact Information">
                    </textarea>
                </form>
            </div>
            <p class="credit">
                Created by
                <a href=
"https://www.geeksforgeeks.org/user/lunatic1/contributions/" 
                   target="_blank">
                      lunatic1
                </a>
            </p>
            <p class="tip">
                **You can use markup in the text area for text decoration**
            </p>
        </div>
    </section>
    <!-- input container ends here -->
    <!-- output container starts here -->
    <div class="output_container"></div>
    <!-- output container ends here -->
    <!-- preview button -->
    <button onclick="hide()">
          Generate / Edit
      </button>
    <!-- script link here -->
    <script src="script.js"></script>
</body>
</html>
/* style.css */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    background-image: linear-gradient(rgb(30, 30, 30), rgb(80, 80, 80));
    background-attachment: fixed;
    font-family: Arial, Helvetica, sans-serif;
}
.resume-builder {
    padding: 27px 100px;
}
.container {
    padding: 10px 30px;
    background: rgb(240, 240, 240);
    border-radius: 10px;
    height: auto;
    width: 60%;
    margin: auto;
}
.container h1 {
    text-align: center;
    background-color: rgb(50, 50, 50);
    padding: 10px;
    color: white;
    margin-bottom: 20px;
}
input,
textarea {
    background-color: transparent;
    margin: 10px 0;
    padding: 5px;
    outline: none;
    border: none;
    border-bottom: 2px solid black;
    display: block;
    width: 100%;
}
button {
    border: none;
    background-color: white;
    padding: 15px;
    border-radius: 7px;
    font-weight: bold;
    cursor: pointer;
    display: block;
    margin: auto;
    margin-bottom: 20px;
}
button:hover {
    font-size: medium;
}
.output-container {
    display: none;
    width: 60%;
    margin: 10px auto;
}
.output {
    background-color: white;
    border: 2px solid white;
    margin-bottom: 10px;
}
.heading {
    padding: 20px 10px;
    text-align: center;
    color: white;
    background-color: rgb(50, 50, 50);
    text-transform: uppercase;
}
.heading h4 {
    color: rgb(200, 200, 200);
    padding-top: 9px;
}
.info {
    display: flex;
    padding: 20px;
}
.left {
    width: 40%;
    border-right: 2px dashed black;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
}
.right {
    width: 60%;
    padding-left: 20px;
    display: flex;
    flex-direction: column;
    justify-content: space-evenly;
}
.box {
    margin: 10px 0;
    padding: 5px 10px;
    height: auto;
    overflow-wrap: break-word;
}
.box h2,
.box p {
    margin-bottom: 5px;
}
.tip {
    font-size: small;
    color: gray;
    text-align: center;
}
.credit {
    text-align: center;
    font-weight: bold;
    padding: 10px 3px;
    color: rgb(80, 80, 80);
}
a {
    color: black;
}
a:hover {
    color: rgb(247, 28, 12);
    font-weight: bold;
}
/* media queries begin */
@media screen and (max-width: 920px) {
    .container {
        width: 100%;
    }
    .output-container {
        width: 87%;
    }
}
@media screen and (max-width: 600px) {
    .resume-builder {
        padding: 10px 30px;
    }
    h1 {
        font-size: 160%;
    }
    .info {
        flex-direction: column;
    }
    .left {
        border-right: none;
        width: 100%;
    }
    .right {
        padding-left: 0;
        width: 100%;
    }
}
/* media queries end here */
// script.js 
// Taking elements from HTML
const inputField = document.querySelector(".inputField");
const main = document.querySelector(".resume-builder");
const outputContainer = document.querySelector(".output_container");
let isHidden = true;
// Function to toggle between input form and resume preview
function hide() {
    if (isHidden) {
    
        // Hide the input form and show the resume preview
        main.style.display = "none";
        isHidden = false;
        outputContainer.style.display = "block";
        outputContainer.innerHTML = `
            <div class="output">
                <div class="heading">
                    <h1>${inputField["name"].value}</h1>
                    <h4>${inputField["title"].value}</h4>
                </div>
                <div class="info">
                    <div class="left">
                        <div class="box">
                            <h2>Objective</h2>
                            <p>${inputField["objective"].value}</p>
                        </div>
                        <div class="box">
                            <h2>Skills</h2>
                            <p>${inputField["skills"].value}</p>
                        </div>
                        <div class="box">
                            <h2>Academic Details</h2>
                            <p>${inputField["academic_details"].value}</p>
                        </div>
                        <div class="box">
                            <h2>Contact</h2>
                            <p>${inputField["contact"].value}</p>
                        </div>
                    </div>
                    <div class="right">
                        <div class="box">
                            <h2>Work Experience</h2>
                            <p>${inputField["work_experience"].value}</p>
                        </div>
                        <div class="box">
                            <h2>Achievements</h2>
                            <p>${inputField["achievements"].value}</p>
                        </div>
                        <div class="box">
                            <h2>Projects</h2>
                            <p>${inputField["projects"].value}</p>
                        </div>
                    </div>
                </div>
            </div>
            <button onclick="print()">Print Resume</button>
        `;
    } else {
        // Show the input form and hide the resume preview
        main.style.display = "block";
        isHidden = true;
        outputContainer.style.display = "none";
        outputContainer.innerHTML = "";
    }
}
Output:
