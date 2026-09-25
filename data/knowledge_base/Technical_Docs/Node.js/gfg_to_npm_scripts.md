# Introduction to NPM scripts

> Source: https://www.geeksforgeeks.org/node-js/introduction-to-npm-scripts/

NPM is a Node Package Manager. It is the world's largest Software Registry. This registry contains over 800,000 code packages. Many Open-source developers use npm to share software. Many organizations also use npm to manage private development.
"npm scripts" are the entries in the scripts field of the package.json file. The scripts field holds an object where you can specify various commands and scripts that you want to expose. These can be executed using the following command-
npm run <script-name>
NPM scripts are used to automate tasks like minifying CSS, uglifying JavaScript, building project. NPM scripts are versatile and simple and by learning fewer tools, we can automate tasks in our web project.
For example, this is our package.json file.
{
  "name": "example",
  "scripts": {
    "test": "echo 'hello world'"
  }
}
and it can be run by using the following command -
npm run test
This is very useful when we have repetitive tasks and we have to automate them.
NPM scripts within another NPM scripts:
{
  "name": "example",
  "scripts": {
    "start": "npm run lite",
    "lite": "lite-server" 
  }
}
So by using npm start, it will run another command npm run lite, lite is lite-server. So the command that run is npm run lite-server, this will cause node server to run.
Web development and deployment requires a lot of repetitive tasks, So there was a need for tools that automate these tasks.
So here are some tasks which can be automated.
CSS Tasks:
- Compiling Sass or Less into CSS.
- Running Autoprefixer to add vendor prefixes that are needed.
- Minification: removing unnecessary characters (white spaces, newlines, comments) from source code without compromising functionality.
- Concatenation
JavaScript Tasks:
- JSHint: Checking JavaScript code for errors and potential problems (static code analysis).
- Concatenation
- Uglification: minification + mangling (reduce local variables to single letters).
- Rechecking for errors.
Building Project:
- Projects can be build that consists of all files and folders requires and several dependencies.
- some of the packages which is used are rimraf, copyfiles, usemin, cssmin, htmlmin, uglifyjs.
Image Compression & BrowserSync:
- Images are compressed using imagemin.
- Automatically browser is rendered when changes are done using onchange, watch.
