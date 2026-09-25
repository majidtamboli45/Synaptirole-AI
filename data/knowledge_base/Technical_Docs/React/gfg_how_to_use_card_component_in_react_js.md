# How to use Card Component in React JS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-card-component-in-reactjs/

Cards contain content and actions about a single subject. Material UI for React has this component available for us, and it is very easy to integrate. We can use the Card Component in ReactJS using the following approach.
Prerequisites:
Approach
To use Card Component in React we will be using Material UI, a React UI component library. We will import the predefined card from the material ui. Define the content and actions in CardContent, Typography, and CardActions and render the card in react app.
Steps to create React Application And Installing Module
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the material-ui modules using the following command.
npm install @material-ui/core
If you are getting errors in installation then use
npm install @material-ui/core --legacy-peer-deps
Project Structure:
The updated dependencies in the package.json file are:
"dependencies": {
    "@material-ui/core": "^4.12.4",
    "@testing-library/jest-dom": "^5.17.0",
    "@testing-library/react": "^13.4.0",
    "@testing-library/user-event": "^13.5.0",
    "react": "^18.3.1",
    "react-dom": "^18.3.1",
    "react-scripts": "5.0.1",
    "web-vitals": "^2.1.4"
},
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from "react";
import Card from "@material-ui/core/Card";
import CardContent from "@material-ui/core/CardContent";
import Typography from "@material-ui/core/Typography";
import Button from "@material-ui/core/Button";
import CardActions from "@material-ui/core/CardActions";
export default function App() {
    return (
        <div style={{}}>
            <h4>How to use CardComponent in ReactJS?</h4>
            <Card
                style={{
                    width: 400,
                    backgroundColor: "yellow",
                }}
            >
                <CardContent>
                    <Typography
                        style={{ fontSize: 14 }}
                        color="textSecondary"
                        gutterBottom
                    >
                        Greetings of the day
                    </Typography>
                    <Typography variant="h5" component="h2">
                        How are you ?
                    </Typography>
                    <Typography
                        style={{
                            marginBottom: 12,
                        }}
                        color="textSecondary"
                    >
                        Keep Motivated
                    </Typography>
                    <Typography variant="body2" component="p">
                        Stay Happy
                    </Typography>
                </CardContent>
                <CardActions>
                    <Button size="small">Stay Safe.....</Button>
                </CardActions>
            </Card>
        </div>
    );
}
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output.
Reference:https://mui.com/material-ui/api/card/
