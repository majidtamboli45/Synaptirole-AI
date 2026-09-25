# React MUI Card API

> Source: https://www.geeksforgeeks.org/reactjs/react-mui-card-api/

React MUI is a UI library providing predefined robust and customizable components for React for easier web development. The MUI design is based on top of Material Design by Google. Material-UI is a user interface library that provides predefined and customizable React components for faster and easy web development, these Material-UI components are based on top of Material Design by Google.
In this article, we are going to discuss the React MUI Card API. The Card component allows the user to show content related to a single subject in a rectangular box.
Import Card API:
import Card from '@mui/material/Card';
Props list:
- children: It is used to denote the content of the card.
- classes: It is to override or extend the styles applied to the component.
- raised: It takes a boolean value. It is used to provide raised style to the card.
- sx: It is used to add custom CSS styles to the card.
CSS Rules:
- root (MuiCard-root): It is the style applied to the root element.
Approach: Let us create a React project and install React MUI module. Then we will create a UI that will showcase React MUI Card API.
Creating React Project:
Step 1: To create a react app, you need to install react modules through npx command. "npx" is used instead of "npm" because you will be needing this command in your app's lifecycle only once.
npx create-react-app project_name
Step 2: After creating your react project, move into the folder to perform different operations.
cd project_name
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install @mui/material @emotion/react @emotion/styled
Project Structure: After running the commands mentioned in the above steps, if you open the project in an editor you can see a similar project structure as shown below. The new component user makes or the code changes, we will be performing will be done in the source folder.
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Example 1: We are creating a UI that shows React MUI Card API.
import * as React from 'react';
import { Button, Card, CardMedia, CardActions, CardContent } 
from '@mui/material';
export default function Demo() {
    return (
        <div style={{ margin: 100 }}>
            <h1 style={{ color: 'green' }}>GeeksforGeeks</h1>
            <h3><u>React MUI Card API</u></h3>
            <Card raised={true} sx={{ maxWidth: 400 }}>
                <CardMedia
                    component="img"
                    height="200"
                    image=
'https://media.geeksforgeeks.org/wp-content/cdn-uploads/gfg_200x200-min.png'
                    alt="GFG Logo"
                />
                <CardContent sx={{ bgcolor: "#E8E8E8" }}>
                    <h3>DSA Self Paced Course</h3>
                    <h4 style={{ color: "green" }}>
                        Most popular course on DSA trusted by
                        over 75,000 students! Built with years
                        of experience by industry experts and
                        gives you a complete package of video
                        lectures, practice problems, quizzes,
                        discussion forums and contests.<br />
                        Start Today !
                    </h4>
                </CardContent>
                <CardActions >
                    <Button variant="contained" color="warning">
                       Share
                     </Button>
                    <Button variant="contained" color="success">
                       Enroll
                    </Button>
                </CardActions>
            </Card>
        </div>
    );
}
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Example 2: We are creating a UI that shows React MUI Card API.
import * as React from 'react';
import Card from '@mui/material/Card';
import CardActions from '@mui/material/CardActions';
import CardContent from '@mui/material/CardContent';
import Button from '@mui/material/Button';
export default function Demo() {
    return (
        <div style={{ margin: 100 }}>
            <h1 style={{ color: 'green' }}>GeeksforGeeks</h1>
            <h3><u>React MUI Card API</u></h3>
            <Card raised={true} sx={{ bgcolor: "#E8E8E8" }} >
                <CardContent>
                    <h1>Alert !!</h1>
                    <h3>Are you sure you want to download ?</h3>
                </CardContent>
                <CardActions >
                    <Button variant="outlined" color="success">
                         Download
                   </Button>
                    <Button variant="outlined" color="error">
                         Cancel
                    </Button>
                </CardActions>
            </Card>
        </div>
    );
}
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Reference: https://mui.com/material-ui/api/card/
