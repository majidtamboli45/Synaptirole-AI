# Side Rendering Vs Client

> Source: https://www.geeksforgeeks.org/reactjs/how-does-ssrserver-side-rendering-differ-from-csrclient-side-rendering/

Server-Side Rendering (SSR) and Client-Side Rendering (CSR) differ in where and how content is generated, affecting performance, user experience, and application behavior.
- SSR sends fully structured HTML for faster first-time display while CSR loads a minimal HTML shell and builds UI dynamically.
- SSR is suitable for content-heavy websites while CSR is ideal for single-page applications with frequent updates.
- SSR handles routing and data fetching on the server while CSR manages them in the browser.
Steps to Initialize Node Application and Install Required Modules
Step 1: Create a NodeJS application using the following command:
npm init -y
Step 2: Install required Dependencies:
 npm i ejs express
The updated dependencies in package.json file will look like:
"dependencies": {
"ejs": "^3.1.9",
"express": "^4.19.2"
}
Folder Structure:
Example: The below example demonstrate the SSR and CSR.
<!-- File path: views/csr.js -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CSR Example</title>
</head>
<body>
    <h1 style="color: green;">GeeksForGeeks | Client Side Rendering</h1>
    <button onclick="showData()">Show Data</button>
    <div id="dataContainer"></div>
    <script>
        async function showData() {
            const response = await fetch('/api/data');
            const data = await response.json();
            document.getElementById('dataContainer').innerText = JSON.stringify(data);
        }
    </script>
</body>
</html>
<!-- File path: views/ssr.js -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SSR Example</title>
</head>
<body>
    <h1 style="color: green;">GeeksForGeeks | Server Side Rendering</h1>
    <p>Data from the server: <%= JSON.stringify(data) %></p>
</body>
</html>
//File path: /index.js
const express = require('express');
const app = express();
const port = 3000;
app.set('view engine', 'ejs');
// Sample data object
const data = {
    message: "Hello from the server!"
};
// SSR route
app.get('/ssr', (req, res) => {
    res.render('ssr', { data });
});
// CSR route
app.get('/csr', (req, res) => {
    res.render('csr');
});
// API endpoint to fetch data for CSR
app.get('/api/data', (req, res) => {
    res.json(data);
});
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});
To run the application use the following command
node index.js Output: Now go to http://localhost:3000/ssr and http://localhost:3000/csr in your browser:
Difference between SSR and CSR
Here are some differences:
| SSR | CSR | 
|---|---|
| SSR stands for Server-Side Rendering | CSR stands for Client-Side Rendering | 
| It renders the page at server side | It renders the page at client side | 
| User interactivity is Limited | User interactivity is Highly interactive | 
| It consumes the server resources | It consumes the client resources | 
| It gives better performance on low Powered Devices | It may not give better performance on low Powered Devices | 
| It may require more server resources to handle rendering tasks. | It doesn't require more server resources to handle rendering tasks. |
