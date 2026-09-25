# How to add theme to your React App?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-add-theme-to-your-react-app/

Themes play a crucial role in web applications, ensuring a cohesive visual identity. They serve to regulate and define various aspects such as color schemes, backgrounds, font properties, shadow levels, opacity, and more, thereby maintaining a consistent and harmonized aesthetic throughout the application.
Prerequisites:
Steps to create React Application And Installing Module:
Step 1: Create a React application using the following command.
npx create-react-app gfg
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd gfg
Step 3: After creating the ReactJS application, Install the material-uimodules using the following command.
npm install @material-ui/core
Step 4: Head to public/index.html and add the fonts to your <head>:
<link rel="stylesheet" href="https://fonts.googleapis.com/css2family=Open+Sans:wght@300&family=Raleway:wght@300&family=Roboto&display=swap">
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
    "@material-ui/core": "^4.12.4",
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-scripts": "5.0.1",
    "web-vitals": "^2.1.4",
}
Theming in Material-UI:
- ThemeProvider Usage:
  - Material UI provides a ThemeProvider component for injecting a theme into the application.
- Material UI provides a 
- Create Theme Object:
  - Begin by defining a theme object using createMuiTheme() .
- Begin by defining a theme object using 
- ThemeProvider Integration:
  - Pass the created theme object to the ThemeProvider component. This component wraps the entire template that needs to be themed.
- Pass the created theme object to the 
- Context Feature Utilization:
  - <ThemeProvider> utilizes React's context feature to propagate the theme to all components within the template.
- Default Styling:
  - Components inherit default styling properties from the theme. For example, an app bar's background color defaults to the primary color specified in the theme.
- Customization Possibilities:
  - Override or modify component colors and styles as needed. This can be achieved by explicitly setting values for individual components or by introducing another nested <ThemeProvider> with a different theme around the specific section requiring customization.
- Override or modify component colors and styles as needed. This can be achieved by explicitly setting values for individual components or by introducing another nested 
Defining a theme object:
The responsiveFontSizes() function enables us to have viewport responsive text sizes.
import { createMuiTheme, responsiveFontSizes }
    from '@materialui/core/styles';
    
const theme = responsiveFontSizes(createMuiTheme({
}));
Spacing: It helps create consistent spacing between the elements of our UI.
spacing: 4,
Typography:
Typography is where we define different font variants that are then used in the component templates via the ‘Typography’ component.
typography: {
    fontFamily: [ 'Roboto',
    'Raleway',
    'Open Sans',
    ].join(','),
    h1: {
        fontSize: '5rem',
        fontFamily: 'Raleway',
    }
    ,
    h2: {
        fontSize: '3.5rem',
        fontFamily: 'Open Sans',
        fontStyle: 'bold',
    }
    ,
    h3: {
        fontSize: '2.5rem',
        fontFamily: 'Roboto',
    }
    ,
}
Palette:
Palette is where we define the colors to be used in our React app. The theme exposes the following predefined palette colors – primary, secondary, error, warning, info, success, and text for typography colors.
palette: {
    background: {
        default: '#009900',
    },
    primary: {
    main: '#2B37D4',
    },
    secondary: {
    main: '#E769A6',
    },
    error: {
    main: '#D72A2A',
    },
    warning: {
    main: '#FC7B09',
    },
    info: {
    main: '#6B7D6A',
    },
    success: {
    main: '#09FE00',
    },
    text: {
        primary: '#000000',
        secondary: '#FFFFFF',
    },
}
Example: Below is the code example of the adding the theme to react app.
import React, { Component } from "react";
import "./App.css";
import CssBaseline from "@material-ui/core/CssBaseline";
import { ThemeProvider } from "@material-ui/styles";
import theme from "./theme";
import Container from "@material-ui/core/Container";
import Typography from "@material-ui/core/Typography";
import Button from "@material-ui/core/Button";
function App() {
    return (
        <React.Fragment>
            <ThemeProvider theme={theme}>
                <CssBaseline />
                <Container maxWidth="sm">
                    <Typography
                        component="h1"
                        variant="h1"
                        align="center"
                        color="textPrimary"
                        gutterBottom
                    >
                        Geeks for Geeks
                    </Typography>
                    <Typography
                        variant="h2"
                        align="center"
                        color="textSecondary"
                    >
                        h2 Typography with secondary text colour
                    </Typography>
                    <br />
                    <Typography
                        variant="h3"
                        align="center"
                        color="textPrimary"
                        paragraph
                    >
                        h3 Typography variant with primary text colour
                    </Typography>
                    <br />
                    <Button variant="contained" color="primary">
                        {" "}
                        Primary
                    </Button>
                    <Button variant="contained" color="secondary">
                        {" "}
                        Secondary
                    </Button>
                    {/* Since, color prop only takes primary and 
          secondary as values,we define other colors 
          in component's style */}
                    <Button
                        variant="contained"
                        style={{ background: theme.palette.error.main }}
                    >
                        Error{" "}
                    </Button>
                    <Button
                        variant="contained"
                        style={{ background: theme.palette.warning.main }}
                    >
                        Warning{" "}
                    </Button>
                    <Button
                        variant="contained"
                        style={{ background: theme.palette.info.main }}
                    >
                        Info{" "}
                    </Button>
                    <Button
                        variant="contained"
                        style={{ background: theme.palette.success.main }}
                    >
                        Success{" "}
                    </Button>
                    <br />
                    <br />
                </Container>
            </ThemeProvider>
        </React.Fragment>
    );
}
export default App;
//theme.js
import { createMuiTheme, responsiveFontSizes }
    from '@material-ui/core/styles';
const theme = responsiveFontSizes(createMuiTheme({
    spacing: 4,
    typography: {
        fontFamily: [
            'Roboto',
            'Raleway',
            'Open Sans',
        ].join(','),
        h1: {
            fontSize: '5rem',
            fontFamily: 'Raleway',
        },
        h2: {
            fontSize: '3.5rem',
            fontFamily: 'Open Sans',
            fontStyle: 'bold',
        },
        h3: {
            fontSize: '2.5rem',
            fontFamily: 'Roboto',
        },
    },
    palette: {
        background: {
            default: '#009900'//green
        },
        primary: {
            main: '#2B37D4',//indigo
        },
        secondary: {
            main: '#E769A6',//pink
        },
        error: {
            main: '#D72A2A',//red
        },
        warning: {
            main: '#FC7B09',//orange
        },
        info: {
            main: '#6B7D6A',//gray
        },
        success: {
            main: '#09FE00',//green
        },
        text: {
            primary: '#000000',//black
            secondary: '#FFFFFF',//white
        },
    },
}));
export default theme;
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output:
