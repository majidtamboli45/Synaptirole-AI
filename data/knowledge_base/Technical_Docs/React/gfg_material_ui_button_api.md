# Material UI Button API

> Source: https://www.geeksforgeeks.org/reactjs/material-ui-button-api/

Material-UI is a user interface library that provides predefined and customizable React components for faster and easy web development, these Material-UI components are based on top of Material Design by Google. In this article let’s discuss the Button component in the Material-UI library.
Buttons are one of the ways in which user communicates in the application. Material UI provides a customizable <Button/> component that can be used for several purposes through its props.
Syntax:
<Button> This ia a Button </Button> 
Installing React App:
- Step1: Create a React app using the following command. npx create-react-app button-example
- Step 2: Now get into the project directory cd button-example
Installing Material-UI: Installing Material-UI’s source files via npm/yarn, and they take care of injecting the CSS needed.
npm install @material-ui/core
OR
yarn add @material-ui/core
Importing AppBar and Toolbar:
import Button from '@material-ui/core/Button';
Contained Buttons: Contained buttons use elevation and fill to give high-emphasis to the users. They are of several types
- Default
- Primary
- Secondary
- Link
- Disabled
Props list:
- children: It is the content of the button.
- classes: It is to override or extend the styles applied to the component.
- size: It is used to customize the size of the button.
- disableElevation: It is the boolean value to determine the elevation for the button.
- fullWidth: It is the boolean value that determines whether it covers the entire width of the container or not.
- disabled: It is the Boolean value to enable or disable the button.
- disableElevation: It is the boolean value to enable or disable the button's elevated appearance.
- disableFocusRipple: It is the boolean value to enable or disable the keyboard focus ripple effect.
- startIcon: Element before the children.
- endIcon: Element after the children.
- href: Its URL to link to when the button is clicked.
- color: It is the color of the component.
- disableRipple: It is the boolean value to disable or enable the ripple effect.
Example:
import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
const useStyles = makeStyles((theme) => ({
  root: {
    textAlign: "center",
    marginTop: "50px"
  },
  btns:{
      '& > *': {
      margin: theme.spacing(1),
    },
      marginTop: "40px"
  }
}));
export default function SimpleContainer() {
  const classes = useStyles();
  return (
    <div className={classes.root}>
      <Typography variant="h4" component="h4">
          Welcome to GFG
      </Typography>
      <div className={classes.btns}>
        <Button variant="contained">Default</Button>
        <Button variant="contained" color="primary">
          Primary
        </Button>
        <Button variant="contained" color="secondary">
          Secondary
        </Button>
        <Button variant="contained" disabled>
          Disabled
        </Button>
        <Button variant="contained" color="primary" 
                href="#contained-buttons">
          Link
        </Button>
      </div>
    </div>
  );
}
Output:
Text Buttons: Text Buttons are more emphasized on the content of the button rather than the appearance of the button.
Example:
import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
const useStyles = makeStyles((theme) => ({
  root: {
    textAlign: "center",
    marginTop: "50px"
  },
  btns:{
      '& > *': {
      margin: theme.spacing(1),
    },
      marginTop: "40px"
  }
}));
export default function SimpleContainer() {
      const classes = useStyles();
  return (
    <div className={classes.root}>
        <Typography variant="h4" component="h4">
              Welcome to GFG
            </Typography>
            <div className={classes.btns}>
      <Button>Default</Button>
      <Button color="primary">Primary</Button>
      <Button color="secondary">Secondary</Button>
      <Button disabled>Disabled</Button>
      <Button href="#text-buttons" color="primary">
        Link
      </Button>
      </div>
    </div>
  );
}
Output:
Outlined Buttons: They are text buttons wrapped with a border
Example:
import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import Typography from '@material-ui/core/Typography';
const useStyles = makeStyles((theme) => ({
  root: {
    textAlign: "center",
    marginTop: "50px"
  },
  btns:{
      '& > *': {
      margin: theme.spacing(1),
    },
      marginTop: "40px"
  }
}));
export default function SimpleContainer() {
      const classes = useStyles();
  return (
    <div className={classes.root}>
      <Typography variant="h4" component="h4">
          Welcome to GFG
      </Typography>
      <div className={classes.btns}>
        <Button variant="outlined">Default</Button>
        <Button variant="outlined" color="primary">
          Primary
        </Button>
        <Button variant="outlined" color="secondary">
          Secondary
        </Button>
        <Button variant="outlined" disabled>
          Disabled
        </Button>
        <Button variant="outlined" color="primary" 
                href="#outlined-buttons">
          Link
        </Button>
      </div>
    </div>
  );
}
Output:
Reference: https://mui.com/material-ui/api/button/
