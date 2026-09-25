# How to change the navbar color when you scroll in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-change-the-navbar-color-when-you-scroll-in-reactjs/

On scroll navbar color change in React highlights a sticky responsive navigation bar to navigate through web application pages. It provides an efficient way to navigate multiple pages in a single-page application. The following approach covers how to change the navbar color when you scroll through the page in ReactJS. It is a simple effect you can add to any ReactJS website.
Prerequisites
Approach for Nav Bar color change on scroll in React
This approach includes the use of an event listener and DOM window.scrollY function for scroll condition to change the navbar color in react.
Steps to create the application
Step 1: Create a React application using the following command.
npx create-react-app navbar-color-change
Step 2: After creating your project folder i.e. navbar-color-change, move to it using the following command.
cd navbar-color-change
Step 3: Install the dependencies required in this project by typing the given command in the terminal:
npm i --save styled-components react-icons
Now create the components folder in src then go to the components folder and create two files Navbar.js and NavbarStyles.js.
Project Structure
The file structure in the project will look like this:
Dependency list after installing libraries
{
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-icons": "^4.11.0",
"react-scripts": "5.0.1",
"styled-components": "^6.1.0",
"web-vitals": "^2.1.4"
}
}
Example: we will design a navbar with a useState variable named colorChange. Then a function is created by the name changeNavbarColor which sets the value of the state colorChange to true when we scroll down the page equal to or more than 80px with the help of window.scrollY function.
// App.js
import React, { Fragment } from "react";
import Navbar from "./components/Navbar";
function App() {
    return (
        <Fragment>
            <Navbar />
            <div
                style={{
                    overflowY: "scroll",
                    height: "800px",
                }}
            ></div>
        </Fragment>
    );
}
export default App;
// components/Navbar.js
import React, { useState, Fragment } from "react";
import { FaBars } from "react-icons/fa";
import {
    Nav,
    NavContainer,
    NavLogo,
    NavItem,
    NavLinks,
    NavMenu,
    MobileIcon,
} from "./NavbarStyles";
import "../App.css";
const Navbar = () => {
    const [colorChange, setColorchange] = useState(false);
    const changeNavbarColor = () => {
        if (window.scrollY >= 80) {
            setColorchange(true);
        } else {
            setColorchange(false);
        }
    };
    window.addEventListener("scroll", changeNavbarColor);
    return (
        <Fragment>
            <Nav
                className={
                    colorChange
                        ? "navbar colorChange"
                        : "navbar"
                }
            >
                <NavContainer>
                    <NavLogo href="#">
                        GeeksForGeeks
                    </NavLogo>
                    <MobileIcon>
                        <FaBars />
                    </MobileIcon>
                    <NavMenu>
                        <NavItem>
                            <NavLinks href="#">
                                About
                            </NavLinks>
                        </NavItem>
                        <NavItem>
                            <NavLinks href="#">
                                Services
                            </NavLinks>
                        </NavItem>
                        <NavItem>
                            <NavLinks href="#">
                                Events
                            </NavLinks>
                        </NavItem>
                        <NavItem>
                            <NavLinks href="#">
                                Contact
                            </NavLinks>
                        </NavItem>
                        <NavItem>
                            <NavLinks href="#">
                                Sign In
                            </NavLinks>
                        </NavItem>
                    </NavMenu>
                </NavContainer>
            </Nav>
        </Fragment>
    );
};
export default Navbar;
// components/NavbarStyles.js
import styled from "styled-components";
export const Nav = styled.nav`
    background: transparent;
    height: 80px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 1rem;
    /* Fix your navbar by using below two lines of code */
    position: sticky;
    top: 0;
    /* Fix your navbar by using above two lines of code */
    z-index: 10;
    @media screen and (max-width: 768px) {
        transition: 0.8s all ease;
    }
`;
export const NavContainer = styled.div`
    display: flex;
    justify-content: space-between;
    height: 80px;
    z-index: 1;
    width: 100%;
    padding: 0 24px;
    max-width: 1100px;
`;
export const NavLogo = styled.a`
    color: green;
    justify-self: flex-start;
    cursor: pointer;
    font-size: 1.5rem;
    display: flex;
    align-items: center;
    margin-left: 24px;
    font-weight: bold;
    text-decoration: none;
`;
export const MobileIcon = styled.div`
    display: none;
    @media screen and (max-width: 768px) {
        display: block;
        position: absolute;
        top: 0;
        right: 0;
        transform: translate(-100%, 60%);
        font-size: 1.8rem;
        cursor: pointer;
    }
`;
export const NavMenu = styled.div`
    display: flex;
    align-items: center;
    list-style: none;
    text-align: center;
    margin-right: -22px;
    @media screen and (max-width: 768px) {
        display: none;
    }
`;
export const NavItem = styled.li`
    height: 80px;
`;
export const NavLinks = styled.a`
    color: #808080;
    display: flex;
    align-items: center;
    text-decoration: none;
    padding: 0 1rem;
    height: 100%;
    cursor: pointer;
    &.active {
        color: #000000;
    }
`;
/* Filename - App.js */
.App {
  text-align: center;
}
.navbar {
    background-color: transparent;
}
.navbar.colorChange {
    background-color: #000;
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: See how navbar changes its color to black on scrolling down and becomes transparent again on returning to the top. Thi soutput will be visible on https://localhost:3000/ on browser.
