# How to create Dark Mode in ReactJS using Material UI ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-dark-mode-in-reactjs-using-material-ui/

Over the past few years, dark mode has gained widespread popularity as a feature in various applications and websites. It provides a visually pleasing and more comfortable viewing experience, particularly in low-light environments. If you're using ReactJS and Material UI, incorporating dark mode functionality into your web application is a straightforward process.
Prerequisites:
Steps for Creating React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. folder name, move to it using the following command:
cd foldername
Step 3: After creating the React.js application, install the material-UI modules using the following command.
npm install @material-ui/core
npm install @material-ui/icons
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@material-ui/core": "^4.12.4",
"@material-ui/icons": "^4.11.3",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Explanation: Material-UI comes with two palette types; light (the default) and dark. You can make the theme dark by setting the type: 'dark'.
//App.js
import React, { useState } from "react";
import SmallComponent from "./SmallComponent";
import { createMuiTheme, ThemeProvider }
    from "@material-ui/core/styles";
function App() {
    const [toggleDark, settoggleDark] = useState(false);
    const myTheme = createMuiTheme({
        // Theme settings
        palette: {
            type: toggleDark ? "dark" : "light",
        },
    });
    return (
        // Wrapping code in ThemeProvider
        <ThemeProvider theme={myTheme}>
            <SmallComponent toggleDark={toggleDark}
                settoggleDark={settoggleDark} />
        </ThemeProvider>
    );
}
export default App;
//SmallComponent.js
import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Card from "@material-ui/core/Card";
import CardHeader from "@material-ui/core/CardHeader";
import CardMedia from "@material-ui/core/CardMedia";
import CardContent from "@material-ui/core/CardContent";
import CardActions from "@material-ui/core/CardActions";
import Avatar from "@material-ui/core/Avatar";
import IconButton from "@material-ui/core/IconButton";
import Typography from "@material-ui/core/Typography";
import { red } from "@material-ui/core/colors";
import FavoriteIcon from "@material-ui/icons/Favorite";
import ShareIcon from "@material-ui/icons/Share";
import Grid from "@material-ui/core/Grid";
import MoreVertIcon from "@material-ui/icons/MoreVert";
// Import your profile image in images folder
import myImg from "./images/nikita-img.jpeg";
// Import your background image in images folder
import backImg2 from "./images/nik2.jpg";
import Switch from "@material-ui/core/Switch";
const useStyles = makeStyles((theme) => ({
    // Styling material components
    root: {
        width: "100%",
        height: "100vh",
        backgroundColor: theme.palette.background.default,
        [theme.breakpoints.down("xs")]: {
            paddingTop: theme.spacing(2),
        },
    },
    media: {
        height: 56,
        paddingTop: "56.25%", // 16:9
    },
    avatar: {
        backgroundColor: red[500],
    },
}));
export default function SmallComponent({
    toggleDark, settoggleDark }) {
    const classes = useStyles();
    // Trigger toggle using onChange Switch
    const handleModeChange = () => {
        settoggleDark(!toggleDark);
    };
    return (
        <Grid
            className={classes.root}
            container
            justify="center"
            alignItems="center"
        >
            <Card elevation={8}>
                {/* you can modify the image avatar,
         background and title name to yours*/}
                <CardHeader
                    avatar={
                        <Avatar alt="Nikita Chaudhari"
                            src={myImg} />
                    }
                    action={
                        <IconButton aria-label="settings">
                            <MoreVertIcon />
                        </IconButton>
                    }
                    title="Nikita Pradip Chaudhari"
                    subheader="nikita12c"
                />
                <CardMedia
                    className={classes.media}
                    image={backImg2}
                    title="Paella dish"
                />
                <CardContent>
                    <Typography variant="body2"
                        color="textSecondary"
                        component="p">
                        Geeks For Geeks : Dark Mode
                    </Typography>
                </CardContent>
                <CardActions disableSpacing>
                    <IconButton
                        aria-label="add to favorites">
                        <FavoriteIcon />
                    </IconButton>
                    <IconButton aria-label="share">
                        <ShareIcon />
                    </IconButton>
                    {/* switching between dark and light mode */}
                    <Switch
                        checked={toggleDark}
                        onChange={handleModeChange}
                        name="toggleDark"
                        color="default"
                    />
                </CardActions>
            </Card>
        </Grid>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000
