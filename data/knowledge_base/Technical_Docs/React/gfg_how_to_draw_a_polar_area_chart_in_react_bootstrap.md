# How to draw a polar area chart in react bootstrap ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-draw-a-polar-area-chart-in-react-bootstrap/

Polar Area charts use a polar coordinate system, where its x-axis looks like a circle with the origin point as a center, and each point is determined by distance from a fixed point and angle from a fixed direction.
Prerequisites:
Steps to Create the React Application And Installing Module:
Step 1: Create a React application using the following command
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the required modules using the following command.
npm install --save mdbreact react-chartjs-2
Step 4: Add Bootstrap CSS and fontawesome CSS to index.js.
import '@fortawesome/fontawesome-free/css/all.min.css';  
import 'bootstrap-css-only/css/bootstrap.min.css';
import 'mdbreact/dist/css/mdb.css';
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"mdbreact": "^5.2.0",
"react": "^18.2.0",
"react-chartjs-2": "^5.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
import React from "react";
import { MDBContainer } from "mdbreact";
import { Polar } from "react-chartjs-2";
  
const App = () => {
  
  // Sample data
  const data = {
    labels: ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"],
      datasets: [
        {
          label: "Hours Studied in Geeksforgeeks",
          data: [2, 5, 6, 7, 3],
          backgroundColor: ["blue", "green", "yellow", "pink", "orange"],
        }
      ]
  }
  
  return (
    <MDBContainer>
      <Polar data={data} />
    </MDBContainer>
  );
}
  
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000
