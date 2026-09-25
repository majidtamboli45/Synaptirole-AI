# React MUI Shadows

> Source: https://www.geeksforgeeks.org/reactjs/react-mui-shadows/

Material UI is an open-source design framework that showcases different components made in react. It is developed and maintained by Google since 2014.
What is Shadows API offered by Material UI?
The Shadows API, provided by MUI, allows us to add or remove box shadows to the DOM elements that have box-shadow utilities.
Shadows API props:
- boxShadow: It denotes the box-shadow the DOM element it is passed to.
Creating React Application And Installing Module
Step 1: Create a React application using the following command:
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install @mui/material
npm install @mui/system
Project Structure: It will look like the following.
Example 1: Now, let's create a simple application that utilizes Shadows API by giving us different box shadows on different DOM elements. Change your App.js like below:
import * as React from 'react';
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
export default function App() {
    return (
        <Grid container>
            <Box
                sx={{
                    boxShadow: 0,
                    width: '140px',
                    height: '140px',
                    p: 1,
                    m: 1,
                    textAlign: 'center',
                    fontSize: '14px',
                }}
            >
                boxShadow: 0
            </Box>
            <Box
                sx={{
                    boxShadow: 1,
                    width: '140px',
                    height: '140px',
                    p: 1,
                    m: 1,
                    textAlign: 'center',
                    fontSize: '14px',
                }}
            >
                boxShadow: 1
            </Box>
            <Box
                sx={{
                    boxShadow: 2,
                    width: '140px',
                    height: '140px',
                    p: 1,
                    m: 1,
                    textAlign: 'center',
                    fontSize: '14px',
                }}
            >
                boxShadow: 2
            </Box>
            <Box
                sx={{
                    boxShadow: 3,
                    width: '140px',
                    height: '140px',
                    p: 1,
                    m: 1,
                    textAlign: 'center',
                    fontSize: '14px',
                }}
            >
                boxShadow: 3
            </Box>
        </Grid>
    );
}
Step to run the application: Open the terminal and type the following command. 
npm start
Output:
Example 2: Now, let's increase the boxShadow number to see the significant increase in box shadows of the DOM elements. Change your App.js like below:
import * as React from 'react';
import Grid from '@mui/material/Grid';
import Box from '@mui/material/Box';
export default function App() {
    return (
        <Grid container>
            <Box
                sx={{
                    boxShadow: 6,
                    width: '140px',
                    height: '140px',
                    p: 1,
                    m: 1,
                    textAlign: 'center',
                    fontSize: '14px',
                }}
            >
                boxShadow: 6
            </Box>
            <Box
                sx={{
                    boxShadow: 7,
                    width: '140px',
                    height: '140px',
                    p: 1,
                    m: 1,
                    textAlign: 'center',
                    fontSize: '14px',
                }}
            >
                boxShadow: 7
            </Box>
            <Box
                sx={{
                    boxShadow: 8,
                    width: '140px',
                    height: '140px',
                    p: 1,
                    m: 1,
                    textAlign: 'center',
                    fontSize: '14px',
                }}
            >
                boxShadow: 8
            </Box>
            <Box
                sx={{
                    boxShadow: 9,
                    width: '140px',
                    height: '140px',
                    p: 1,
                    m: 1,
                    textAlign: 'center',
                    fontSize: '14px',
                }}
            >
                boxShadow: 9
            </Box>
        </Grid>
    );
}
Step to run the application: Open the terminal and type the following command. 
npm start
Output:
Reference: https://mui.com/system/shadows/
