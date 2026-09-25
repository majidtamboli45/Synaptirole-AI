# React MUI DialogContent API

> Source: https://www.geeksforgeeks.org/reactjs/react-mui-dialogcontent-api/

React MUI is a UI library providing predefined robust and customizable components for React for easier web development. The MUI design is based on top of Material Design by Google. Material-UI is a user interface library that provides predefined and customizable React components for faster and easy web development, these Material-UI components are based on top of Material Design by Google.
In this article, we are going to discuss the React MUI DialogContentAPI. The Dialogue component allows the user to show extra information on the user click action.
Import DialogContent API:
import Dialog from '@mui/material/Dialog';
import DialogContent from '@mui/material/DialogContent'
Props list:
- children: It is used to denote the content of the divider.
- classes: It is to override or extend the styles applied to the component.
- dividers: It takes a boolean value to display top and bottom dividers,
- sx: It is used to add custom CSS styles to the divider.
CSS Rules:
- root (MuiDivider-root): It is the style applied to the root element.
- dividers (MuiDialogContent-dividers): It applies styles when the divider is true.
Approach: Let us create a React project and install React MUI module. Then we will create a UI that will showcase React MUI DialogContent API.
Creating React Project:
Step 1: To create a react app, you need to install react modules through npx command. "npx" is used instead of "npm" because you will be needing this command in your app's lifecycle only once.
npx create-react-app project_name
Step 2: After creating your react project, move into the folder to perform different operations.
cd project_name
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install @mui/material @emotion/react
npm install @mui/lab @emotion/styled
Project Structure: After running the commands mentioned in the above steps, if you open the project in an editor you can see a similar project structure as shown below. The new component user makes or the code changes, we will be performing will be done in the source folder.
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Example 1: We are creating a UI that shows React MUI DialogContent API.
import * as React from 'react';
import Button from '@mui/material/Button';
import DialogTitle from '@mui/material/DialogTitle';
import Dialog from '@mui/material/Dialog';
import DialogContent from '@mui/material/DialogContent';
function SimpleDialog(props) {
    const { onClose, open } = props;
    const handleClose = () => {
        onClose();
    };
    return (
        <Dialog onClose={handleClose} open={open}>
            <DialogTitle style={{ color: 'green' }}>
                 DSA Self Paced Course</DialogTitle>
            <DialogContent dividers>
                <p style={{ margin: 20 }}>
                    Most popular course on DSA trusted by
                    over 75,000 students! Built with years
                    of experience by industry experts and
                    gives you a complete package of video
                    lectures, practice problems, quizzes,
                    discussion forums and contests.<br />
                    Start Today !</p>
            </DialogContent>
        </Dialog>
    );
}
export default function SimpleDialogDemo() {
    const [open, setOpen] = React.useState(false);
    const handleClickOpen = () => {
        setOpen(true);
    };
    const handleClose = () => {
        setOpen(false);
    };
    return (
        <div style={{ margin: 100 }}>
            <h1 style={{ color: 'green' }}>GeeksforGeeks</h1>
            <h3><u>React MUI DialogContent API</u></h3>
            <br />
            <Button variant="outlined" 
                onClick={handleClickOpen}>
                DSA Self Paced Course
            </Button>
            <SimpleDialog
                open={open}
                onClose={handleClose}
            />
        </div>
    );
}
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
Example 2: We are creating a UI that shows React MUI DialogContent API.
import * as React from 'react';
import Button from '@mui/material/Button';
import Dialog from '@mui/material/Dialog';
import DialogTitle from '@mui/material/DialogTitle';
import DialogContent from '@mui/material/DialogContent';
import DialogActions from '@mui/material/DialogActions';
function SimpleDialog(props) {
    const { onClose, open } = props;
    const handleClose = () => { onClose(); };
    return (
        <Dialog onClose={handleClose} open={open}>
            <DialogTitle>Download Alert</DialogTitle>
            <DialogContent dividers>
                <p>Are you sure you want to Download?</p>
            </DialogContent>
            <DialogActions>
                <Button variant="outlined" color="success">
                  Download
                </Button>
            </DialogActions>
        </Dialog>
    );
}
export default function Demo() {
    const [open, setOpen] = React.useState(false);
    const handleClickOpen = () => { setOpen(true); };
    const handleClose = () => { setOpen(false); };
    return (
        <div style={{ margin: 100, textAlign: "center" }}>
            <h1 style={{ color: 'green' }}>
               GeeksforGeeks
            </h1>
            <h3><u>React MUI DialogTitle API</u></h3><br />
            <Button variant="outlined" 
               color="success" 
               onClick={handleClickOpen}>
               Download Files</Button>
            <SimpleDialog open={open} 
               onClose={handleClose} />
        </div>
    );
}
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
