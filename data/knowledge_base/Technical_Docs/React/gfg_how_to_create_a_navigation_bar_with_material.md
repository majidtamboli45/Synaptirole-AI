# How to Create a Navigation Bar with Material

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-navigation-bar-with-material-ui/

The Navigation Bar Material UI component provides an efficient way to navigate through web application pages. React utilizes material UI NavBar for responsive and flexible navigation that is easy to implement and also provides animated transitions.
Approach
To create responsive top Navigation Bar Material UI provide multiple componentes MUI Appbar, Toolbar, Buttons mediaQuery that simply adds style to the projects. Also the collapsable list items are utilized for the hamburger Menu for small screen devices.
Steps to create the application:
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. folder name, move to it using the following command.
cd foldername
Step 3: After creating the React.js application, install the material-UI modules using the following command.
npm i @material-ui/core @material-ui/icons @mui/icons-material 
@mui/material @emotion/core @emotion/react @emotion/styled
Project Structure
The updated dependencies in package.json will look like:
{
"name": "myreactapp",
"version": "0.1.0",
"private": true,
"dependencies": {
"@emotion/core": "^11.0.0",
"@emotion/react": "^11.11.1",
"@emotion/styled": "^11.11.0",
"@material-ui/core": "^4.12.4",
"@material-ui/icons": "^4.11.3",
"@mui/icons-material": "^5.14.13",
"@mui/material": "^5.14.13",
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
},
}
Example: Example includes a navbar with responsive hamburger option to show listed menu items for small screens and a simple navbar for bigger screen devices.
// Filename - App.js
// Importing the navbar component inside
// the main app file
import Navbar from "./components/Navbar";
const App = () => {
    return (
        <>
            <Navbar />
        </>
    );
};
export default App;
// FileName - Navbar.js
// Importing files from Material-UI
import React, { useState } from "react";
import { makeStyles } from "@material-ui/core/styles";
import AppBar from "@material-ui/core/AppBar";
import Toolbar from "@material-ui/core/Toolbar";
import Typography from "@material-ui/core/Typography";
import MenuIcon from "@material-ui/icons/Menu";
import Button from "@material-ui/core/Button";
import useMediaQuery from "@mui/material/useMediaQuery";
import {
    List,
    ListItem,
    ListItemText,
    Collapse,
} from "@mui/material";
import ExpandLess from "@mui/icons-material/ExpandLess";
import ExpandMore from "@mui/icons-material/ExpandMore";
// Using Inline Styling
const useStyles = makeStyles((theme) => ({
    root: {
        flexGrow: 1,
    },
    menuButton: {
        marginRight: theme.spacing(2),
    },
}));
// Exporting Default Navbar to the App.js File
export default function Navbar() {
    const classes = useStyles();
    const small = useMediaQuery("(max-width:600px)");
    const full = useMediaQuery("(min-width:600px)");
    const [open, setOpen] = useState(false);
    const handleClick = () => {
        setOpen(!open);
    };
    return (
        <div className={classes.root}>
            <AppBar position="static">
                <Toolbar variant="dense">
                    {small && (
                        <>
                            <List>
                                <ListItem button>
                                    <Button
                                        onClick={
                                            handleClick
                                        }
                                    >
                                        <MenuIcon />
                                        {open ? (
                                            <ExpandLess />
                                        ) : (
                                            <ExpandMore />
                                        )}
                                    </Button>
                                    <Typography
                                        variant="h6"
                                        color="inherit"
                                        onClick={() => {
                                            console.log(
                                                "logo clicked"
                                            );
                                            setOpen(false);
                                        }}
                                    >
                                        Geeks for Geeks
                                    </Typography>
                                </ListItem>
                                <Collapse
                                    in={open}
                                    timeout="auto"
                                    unmountOnExit
                                >
                                    <List
                                        component="div"
                                        disablePadding
                                    >
                                        <ListItem button>
                                            <ListItemText primary="Home" />
                                        </ListItem>
                                        <ListItem button>
                                            <ListItemText primary="About" />
                                        </ListItem>{" "}
                                        <ListItem button>
                                            <ListItemText primary="Contact" />
                                        </ListItem>
                                    </List>
                                </Collapse>
                            </List>
                        </>
                    )}
                    {full && (
                        <>
                            <Typography
                                variant="h6"
                                color="inherit"
                            >
                                Geeks for Geeks
                            </Typography>
                            <Button color="inherit">
                                Home
                            </Button>
                            <Button color="inherit">
                                About
                            </Button>
                            <Button color="inherit">
                                Contact
                            </Button>
                        </>
                    )}
                </Toolbar>
            </AppBar>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
