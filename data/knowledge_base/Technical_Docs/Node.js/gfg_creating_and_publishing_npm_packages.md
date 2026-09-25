# Creating and Publishing npm Packages

> Source: https://www.geeksforgeeks.org/node-js/steps-to-create-and-publish-npm-packages/

Creating and publishing an npm package involves preparing your project, configuring it properly, and publishing it to the npm registry for public use.
- Initialize the project using npm init and configure the package.json file properly.
- Add your module code, test it, and ensure proper versioning and documentation.
- Login using npm login and publish the package with npm publish.
Steps for Building and Publishing an npm Package
It explains the complete lifecycle of an npm package, from initial setup and module creation to publishing, version management, and maintenance.
1. Initializing a module
To initialize a module, go to the terminal/command-line and type npm init and answer the prompts.
- Set a proper entry point (commonly src/index.js ) and add"type": "module" to enable ES modules.
- Provide package metadata such as the repository, author, and license.
- Include a README.md and maintain a clean project structure.
2. Building a module
This phase is the coding phase. If you have any experience in using NPM modules, you would know that NPM modules expose methods that are then used by the project. A typical control flow is:
Implement a simple function that adds two numbers in the npm module.
File Name: index.js
const gfgFns = {
    add: function addTwoNums(num1, num2) {
        return num1 + num2;
    }
};
export default gfgFns;
- index.js serves as the entry point of the npm module.
- gfgFns is an exported object containing the add method to add two numbers.
- The object is exported using export default gfgFns, allowing it to be imported in other files.
3. Publishing a module
Before publishing, ensure the package name is available, as duplicate names cannot be published, then publish the package using npm publish.
npm search packagename
If your package name is usable, it should show something like the image below.
If your module name already exists, go to the package.json file of the npm module project and change the module name to something else.
Now after checking the name availability, go to command-line/terminal and do the following:
npm publish
4. Updating and managing versions
As a package evolves, versioning is required to track bug fixes, minor updates, and major releases; npm supports semantic versioning.
Note: If the module is being re-published without bumping up the version, the NPM command line will throw an error. For example, look at the below image.
- Version bump required before publishing: npm throws an error if npm publish is executed without incrementing the version number.
- Version downgrade not allowed: A published version cannot be decreased (e.g., 0.1.2 cannot revert to 0.1.1).
- Updating for users: When a new version is published, users can install the latest version by running, npm install <packagename>
A package dependent on other packages: During npm package development, it is common to include external dependencies required for functionality, which are installed and managed through npm and recorded in the dependencies section of package.json.
- Install the required external dependencies in the npm module project using npm install <package-name>.
- The installed packages are automatically added under the "dependencies" section in package.json.
npm install packagename1[ packagename2]
- Ensure dependencies are listed under "dependencies" in package.json, as they are included during publishing.
- Bump the version if required and publish the package using npm publish.
> npm version minor
npm publish
- The above procedure should execute successfully, and the result should be available to see in the npm registry website like below:
Building a more complex module: Develop an npm module that reads a text file, extracts numerical values, computes their sum, and outputs the result to the console.
- Initialize the new project using:
npm init -y
- Install the published module:
npm install gfgnpmpkgupload
- Import the installed module into the project to utilize its functionality.
The datafiles should contain a numFile.txt that has the numbers that have to be added and displayed in the console.
// numFile.txt - sum = 55
1 2 3 4 5 6 7 8 9 10
To consume this numFile.txt, we will have a gfgapp.js that will do the actual addition.
To test this, go to command-line and run
node gfgapp.js
NPM module boilerplate: Preconfigured npm module boilerplates can be generated using Yeoman to streamline project scaffolding.
- Use the Yeoman Generator Search to find an npm module boilerplate.
- Select a suitable generator based on your preferred technology stack.
Unpublishing an NPM package: An npm package can be unpublished within 72 hours of its initial release using npm unpublish <package-name> and after 72 hours removal requires contacting the npm registry support.
npm unpublish packageName
Example: Use the published package to add two numbers. 
Filename: app.js 
import GFGFns from 'gfgnpmpkgupload';
console.log(GFGFns.add(4, 5));
Output:
