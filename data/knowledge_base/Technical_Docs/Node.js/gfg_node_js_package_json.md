# Node.js package.json

> Source: https://www.geeksforgeeks.org/node-js/node-js-package-json/

package.json is the central configuration file in a Node.js project that defines how the application is built, run, and managed.
- Stores essential project information and configuration settings.
- Manages application dependencies and development tools.
- Defines executable scripts for tasks like start, build, and test.
- Specifies the application entry point and runtime behavior.
- Helps ensure consistent project setup across environments.
Metadata and Functional Properties of package.json
The package.json file manages configuration and metadata for a Node.js project.
- Project identification details such as name, version, author, license, and description..
- Application entry point and runtime configuration.
- Project dependencies and development dependencies.
- Scripts for running and managing the application.
- Repository and related project information.
Generating package.json
A package.json file can be created in two ways:
Using npm init
Running the following command initializes a Node.js application, prompts the user for essential project details with editable default values, and automatically generates the package.json file.
npm init
Writing directly to file
One can directly write into file with all the required information and can include it in the Node project.
Example: A demo package.json file with the required information.
{
"name": "geeksforgeeks",
"version": "1.0.0",
"description": "GeeksForGeeks",
"main": "index.js",
"scripts": {
"test": "echo \"Error: no test specified\" && exit 1",
"start": "node start.js"
},
"engines": {
"node": ">=7.6.0",
"npm": ">=4.1.2"
},
"author": "GeeksForGeeks",
"license": "ISC",
"dependencies": {
"body-parser": "^1.17.1",
"express": "^4.15.2",
"express-validator": "^3.1.2",
"mongoose": "^4.8.7",
"nodemon": "^1.14.12"
},
"devDependencies": {},
"repository": {
"type": "git",
"url": "https://github.com/gfg/gfg"
},
"bugs": {
"url": "https://github.com/gfg/gfg/issues"
},
"homepage": "https://github.com/gfg/gfg#readme"
}
- name: Specifies the application or project name
- version: Defines the application version, following semantic versioning
- description: Briefly describes the application, its purpose, and technologies used
- main: Specifies the entry point file executed when the application starts
- scripts: Contains commands used to run and manage the application
- engines: Defines the required Node.js and npm versions for deployment
- keywords: Provides searchable terms that describe the application
- author: Contains author information such as name and contact details
- license: Specifies the license under which the application is distributed
- dependencies: Lists third-party packages required at runtime
- devDependencies: Lists packages required only during development
- repository: Provides repository type and URL for the source code
- bugs: Specifies where application issues or bugs should be reported
Note: Here, body-parser, express, express-validator, mongoose, and nodemon are third-party Node.js packages installed using npm (Node Package Manager).
Common Commands
- npm install: Installs all dependencies listed in package.json.
- npm install <package-name>: Installs a package and adds it to dependencies (use --save-dev to add it to devDependencies).
- npm update: Updates installed packages based on the version ranges specified in package.json.
- npm run <script-name>: Executes a script defined in the scripts section of package.json.
