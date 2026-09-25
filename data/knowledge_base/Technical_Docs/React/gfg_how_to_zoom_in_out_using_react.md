# How to Zoom in/Zoom out using React

> Source: https://www.geeksforgeeks.org/reactjs/how-to-zoom-in-zoom-out-using-react-pdf-in-reactjs/

Zooming in or out in React-PDF within a React JS application is achieved by using the 'scale' prop inside the `<Page />` component. The 'scale' prop accepts decimal values; values greater than 1 zoom in, while values less than 1 zoom out the page.
Prerequisites:
Syntax:
<page scale = {value} />
// When we want to pass an integer value to scale.
<Page width={900} scale={30.0} className="page" pageNumber={1} />
Approach to Zoom in/out PDF using React:
This React code utilizes the 'react-pdf' library to render a PDF file ('sample.pdf'). The App component includes a Document component with a specified PDF file, and within it, a Page component renders the first page with a scale of 2.0.
Steps to Create React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app pdfapp
Step 2: After creating your project folder i.e. pdfapp, move to it using the following command:
cd pdfapp
Step 3: After creating the React JS application, Install the required module using the following command:
npm install react-pdf
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
    "react": "^18.2.0",
    "react-dom": "^18.2.0",
    "react-pdf": "^7.6.0",
    "react-scripts": "5.0.1",
    "web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file.
import React from 'react';
import { Document, Page }
    from 'react-pdf/dist/esm/entry.webpack';
// Importing your sample PDF
import pdfFile from './sample.pdf'
// Defining our App Component
const App = () => {
    // Returning our JSX code
    return <>
        <div>
            <Document file={pdfFile}>
                <Page scale={2.0}
                    pageNumber={1} />
            </Document>
        </div>
    </>;
}
// Exporting your Default App Component
export default App
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000
