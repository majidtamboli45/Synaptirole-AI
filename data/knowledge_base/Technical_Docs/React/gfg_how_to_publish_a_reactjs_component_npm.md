# How to publish a ReactJS component to NPM ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-publish-a-reactjs-component-to-npm/

Follow these simple steps in order to publish your own ReactJS component to NPM.
Step 1: Initial Setup
In order to publish any ReactJS Component to npm (node package manager), first we have to create a React component in the React app. Following are the instructions for creating any react app.
- Create a React application using the following command:
npx create-react-app foldername
- After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 2: Creating the Component
Open your project folder in your code editor you will see many folders, depending upon your choice make a folder called components, like in our case we had made the folder inside the src folder as shown below.
Then go to your created folder and create your ReactJs Component, like in your case we have created a Navbar component using react-bootstrap called Header.js.
import React from "react";
import {
    Nav,
    Navbar,
    NavDropdown,
    Form,
    FormControl,
    Button,
} from "react-bootstrap";
const Header = () => {
    return (
        <>
            <Navbar bg="light" expand="lg">
                <Navbar.Brand href="#home">
                    ReactNavbarComponent
                </Navbar.Brand>
                <Navbar.Toggle aria-controls="basic-navbar-nav" />
                <Navbar.Collapse id="basic-navbar-nav">
                    <Nav className="ml-auto">
                        <Nav.Link href="#home">Home</Nav.Link>
                        <Nav.Link href="#link">Link</Nav.Link>
                        <NavDropdown title="Dropdown" 
                                id="basic-nav-dropdown">
                            <NavDropdown.Item href="#action/3.1">
                                Action
                            </NavDropdown.Item>
                            <NavDropdown.Item href="#action/3.2">
                                Another action
                            </NavDropdown.Item>
                            <NavDropdown.Item href="#action/3.3">
                                Something
                            </NavDropdown.Item>
                            <NavDropdown.Divider />
                            <NavDropdown.Item href="#action/3.4">
                                Separated link
                            </NavDropdown.Item>
                        </NavDropdown>
                    </Nav>
                    <Form inline>
                        <FormControl type="text"
                            placeholder="Search"
                            className="mr-sm-2" />
                        <Button variant="outline-success">
                            Search
                        </Button>
                    </Form>
                </Navbar.Collapse>
            </Navbar>
        </>
    );
};
export default Header;
Step 3: Environment Setup for Publishing
Go to the components folder using your terminal & type npm init. You will see the following things in your command line.
Use `npm install <pkg>` afterward to install a package and
save it as a dependency in the package.json file.
Press ^C at any time to quit.
package name: (components) react-navbar
version: (1.0.0)
description: React-navbar
entry point: (Header.js)                      # Entry Point publishing
test command:
git repository:
keywords:
author: <Name>
license: (ISC)
About to write to C:\Users\Desktop\Tcw\app\src\components\package.json:
{
  "name": "react-navbar",
  "version": "1.0.0",
  "description": "React-navbar",
  "main": "Header.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "<Name>",
  "license": "ISC"
}
Is this OK? (yes)
Install all the dependencies needed for your component as peer dependencies. For this first, you have to go to your terminal and type the following command:
npm install (your dependencies name)
For our example, we have to install these two dependencies for our component using the following command:
npm install react
npm install react-bootstrap
Now go to the package.json file & change the dependencies as peer dependencies and delete the node_module folder from the components folder.
Now if you write npm install your terminal you will see the following instructions:
npm WARN react-navbar@1.0.0 requires a peer of react@^17.0.2 but none is installed. You must install peer dependencies yourself.
npm WARN react-navbar@1.0.0 requires a peer of react-bootstrap@^1.6.0 but none is installed. You must install peer dependencies yourself.
npm WARN react-navbar@1.0.0 No repository field.
up to date in 3.59s    
found 0 vulnerabilities
Step 4: Publishing to npm
Go to the npm website and create an account using your mail ID and password. Make sure that you are in the current directory that is the components directory and type the following commands:
npm login 
# Use your username and password what you have created in the npm website
# Then run this command
npm publish
Now your ReactJs component has been successfully published into the npm. Go to your npm account and there you can see your package as shown below.
