# How to use AppBar Component in Material UI ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-appbar-component-in-material-ui/

Using AppBar component in Material UI provides a flexible and customizable navigation bar for your web applications. The App Bar displays information and actions relating to the current screen. Material UI for React has this component available for us and it is very easy to integrate.
Prerequisites
Approach
To use AppBar Component in Material UI in React JS, we will create a top bar or Nav consisting of the AppBar component, Toolbar, IconButton, MenuIcons and Typegraphy components to implement a Nav along with functionality like logins, dropdown etc.
We can use the AppBar Component in ReactJS using the following approach.
Steps to Create React Application
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the MUI modules using the following command:
npm i @mui/material @mui/icons-material @emotion/styled
Project Structure
It will look like the following.
Dependencies list in package.json
{
"dependencies": {
"@emotion/styled": "^11.11.0",
"@mui/icons-material": "^5.14.14",
"@mui/material": "^5.14.14",
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-router": "^6.17.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
}
Example 1: In this example, we will create a basic app bar application, that will have a menu icon and some text.
// Filename - App.js
import * as React from 'react';
import AppBar from '@mui/material/AppBar';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import Button from '@mui/material/Button';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';
export default function ButtonAppBar() {
    return (
        <AppBar>
            <Toolbar>
                <IconButton
                    size="large"
                    edge="start"
                    color="inherit"
                    aria-label="menu"
                    sx={{ mr: 2 }}
                >
                    <MenuIcon />
                </IconButton>
                <Typography variant="h6"
                    component="div" sx={{ flexGrow: 1 }}>
                    Geeksforgeeks
                </Typography>
                <Button color="inherit">Logout</Button>
            </Toolbar>
        </AppBar>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Example 2: In this example, we will create a simple app bar application with a toggle-able menu.
// Filename - App.js
import * as React from 'react';
import AppBar from '@mui/material/AppBar';
import Box from '@mui/material/Box';
import Toolbar from '@mui/material/Toolbar';
import Typography from '@mui/material/Typography';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';
import Switch from '@mui/material/Switch';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormGroup from '@mui/material/FormGroup';
export default function MenuAppBar() {
    const [auth, setAuth] = React.useState(true);
    const handleChange = (event) => {
        setAuth(event.target.checked);
    };
    return (
        <Box sx={{ flexGrow: 1 }}>
            <FormGroup>
                <FormControlLabel
                    control={
                        <Switch
                            checked={auth}
                            onChange={handleChange}
                            aria-label="login switch"
                        />
                    }
                    label={auth ? 'Hide Menu' : 'Show Menu'}
                />
            </FormGroup>
            <AppBar position="static">
                <Toolbar>
                    <IconButton
                        size="large"
                        edge="start"
                        color="inherit"
                        aria-label="menu"
                        sx={{ mr: 2 }}
                    >
                        <MenuIcon />
                    </IconButton>
                    <Typography variant="h6" component="div"
                        sx={{ flexGrow: 1 }}>
                        Geeksforgeeks
                    </Typography>
                    {auth && (
                        <div style={{ display: 'flex', gap: '10px' }}>
                            <Typography>Contact US</Typography>
                            <Typography>About US</Typography>
                        </div>
                    )}
                </Toolbar>
            </AppBar>
        </Box>
    );
}
Steps to run the application:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Reference: https://mui.com/material-ui/react-app-bar/
