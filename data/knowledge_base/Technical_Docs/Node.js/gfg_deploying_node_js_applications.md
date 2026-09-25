# Deploying Node.js Applications

> Source: https://www.geeksforgeeks.org/node-js/deploying-node-js-applications/

Deploying a NodeJS application can be a smooth process with the right tools and strategies. This article will guide you through the basics of deploying NodeJS applications.
To show how to deploy a NodeJS app, we are first going to create a sample application for a better understanding of the process.
Steps to Create a Node Application
Step 1: Create a project folder.
mkdir example
Step 2: Initialize the node application
npm init -y
Folder Structure
Step 3: Create the files as shown in the folder structure and add the following codes.
<!-- head.html -->
<!DOCTYPE html>
<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <h1>This is the Homepage</h1>
    <p><a href="/tailPage">Go to Next Page</a></p>
</body>
</html>
<!-- tail.html -->
<!DOCTYPE html>
<html>
<head>
    <title>Hello World</title>
</head>
<body>
    <h1>WORKING</h1>
</body>
</html>
//app.js
var http = require('http');
var fs = require('fs'); // to get data from html file
http.createServer(function (req, res) {
    var url = req.url;
    if (url === "/") {
        fs.readFile("head.html", function (err, pgres) {
            if (err) {
                res.writeHead(404, { 'Content-Type': 'text/plain' });
                res.write("HEAD.HTML NOT FOUND");
                res.end();
            } else {
                res.writeHead(200, { 'Content-Type': 'text/html' });
                res.write(pgres);
                res.end();
            }
        });
    } else if (url === "/tailPage") {
        fs.readFile("tail.html", function (err, pgres) {
            if (err) {
                res.writeHead(404, { 'Content-Type': 'text/plain' });
                res.write("TAIL.HTML NOT FOUND");
                res.end();
            } else {
                res.writeHead(200, { 'Content-Type': 'text/html' });
                res.write(pgres);
                res.end();
            }
        });
    }
}).listen(3000, function () {
    console.log("SERVER STARTED PORT: 3000");
});
Step 4: Open the terminal and write the following command to run the server
node app.js 
To see your application running, type "localhost:3000" in your browser as URL. We have successfully created the sample application, we are now going to deploy it on the web. There's are many cloud platforms like AWS, Heroku, Digital Ocean, etc. 
Steps to Deploy Sample Application
For this example, we are going to use Heroku since it's easy to use and you can use it to test your apps for free.
NOTE: ALL THE COMMAND ARE PERFORMED INSIDE THE DIRECTORY/FOLDER WHICH CONTAINS YOUR PROJECT
Step 1: Go to https://www.heroku.com/ and register.
Step 2: After completing the registration process, login and go to https://dashboard.heroku.com/apps
Before Proceeding any further, make sure you have installed the latest version of Git on your PC.
Step 3: Go to Getting Started on Heroku with Node.js and download the Heroku Cli for your system.
You can check if Heroku CLI is successfully installed or not by typing the command. 
heroku -v
It should look like this
Step 4: Login to heroku using the command line
heroku login 
Press any key to continue, it will open a new tab in your browser asking you to login in your Heroku account.
Click on Log in Bottom. After you successfully log in, the command line will look like this
( Heroku might not connect to Git bash, so use Command Prompt or terminal if it's taking very long to connect i.e. if you were using git bash.
Step 5: Now, make sure we are using Git in the top level directory of our app. We can check if the directory have Git or not by the command.
git status
To make it a git directory, type the command
git init 
Now, add and save all the changes using the command.
git add .  
Now, we need to commit the files we have added to git. Type
git commit -m "initial commit"
Step 6: Create heruko app by command
heroku create
This will create a git remote which is connected to our local git repository
Step 7: Run the following command to deploy the app on heroku server.
git push heroku master
Step 8: After deploying the app run the following command to make sure one instance of app is running.
heroku ps:scale web=1 Step 9: Run the following command to open the app in your browser.
heroku open Now, you might be getting a screen like this
 
Go to command line and run the following command to check for error. It helps to debug the application.
heroku logs  
It says "npm ERR! missing script: start". To fix this problem, we need to set up a start script, the start script tells the server to run "node app.js" after installing the packages.
Step 10: To setup the start script, open package.json inside the example folder and type "start": "node app.js" inside the "scripts" tag.
Step 11: Type the following command in command line We need to push the app to Heroku every time we make changes in it.
git add .
git commit -m "another commit"
git push heroku master
heroku open
Step 12: There's still a problem. The problem is still not fixed. We are using PORT: 3000 but Heroku doesn't. Heroku uses a dynamic port, we cannot fix it to 3000. If we want our application to work on Heroku we need to add the following line in the app.js file
.listen(process.env.PORT || 3000, function(...));
// app.js
var http = require('http');
var fs = require('fs');
http.createServer(function (req, res) {
    var url = req.url;
    if (url === "/") {
        fs.readFile("head.html", function (err, pgres) {
            if (err)
                res.write("HEAD.HTML NOT FOUND");
            else {
                res.writeHead(200, { 'Content-Type': 'text/html' });
                res.write(pgres);
                res.end();
            }
        });
    }
    else if (url === "/tailPage") {
        fs.readFile("tail.html", function (err, pgres) {
            if (err)
                res.write("TAIL.HTML NOT FOUND");
            else {
                res.writeHead(200, { 'Content-Type': 'text/html' });
                res.write(pgres);
                res.end();
            }
        });
    }
}).listen(process.env.PORT || 3000, function () {
    console.log("SERVER STARTED PORT: 3000");
}); 
Step 13: Again run the following command.
git add .
git commit -m "another commit"
git push heroku master
heroku open
Output
Congratulations, you have successfully deployed your first web application.
Note: If your application uses MongoDB then you will have to deploy MongoDB server separately on some other cloud platform.
