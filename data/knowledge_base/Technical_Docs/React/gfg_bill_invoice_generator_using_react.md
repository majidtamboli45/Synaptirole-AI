# Bill/Invoice Generator using React

> Source: https://www.geeksforgeeks.org/reactjs/bill-invoice-generator-using-react/

Bill/Invoice Generator website using React helps users easily make, customize, and print invoices and can add or delete items. It uses React's building blocks to make the design easy to update and reuse. The user also has a feature of downloading the pdf version of the generated bill
Preview of final output: Let us have a look at how the final output will look like.
Prerequisites:
Approach:
- Create a component (React Component) folder in src folder and inside that folder make three JS file i.e.
- In BillDetails.js file it is responsible for capturing user input for individual items in a bill or invoice. It includes fields for item names, quantities, and prices, along with functionality for adding items to the list and deleting the last entered item.
- In ItemsList.js file is dynamically renders and displays the list of items in a bill or invoice.
- The TotalAmount.js file is for calculating and displaying the total amount of the bill or invoice. It receives the list of items as props (Props), performs the necessary calculations, and presents the total amount in a clear and formatted manner.
- App.js file is the main React component for the the project. It manages the overall state, handles user interactions such as adding and deleting items, calculates the total amount, and integrates PDF generation functionality, providing the core logic for the entire web application.
- Index.js file is the entry point for a React application. It uses the ReactDOM library to render the root component (in this case, the App component) into the HTML document. And similarly index.css is the main css of web application for giving designing and animation to projects.
- Once all the code is done and compiled successfully , you will see a page where you have to input item name then its quantity and each price.
- Then click on Add item button to add on the list. and you also delete the items according to your wish.
- Also you can download the bill in pdf form by clicking on download button.
Steps to Create the React App
Step 1: Set up React Project using the Command:
npm create vite@latest <name of project> --template react
Step 2: Navigate to the Project folder using:
cd <name of project>
Step 3: Installing the dependencies.
npm install jspdf
Step 3: Create a folder “components” and add three new files in it namely BillDetails.js, ItemList.js and TotalAmount.js.
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"jspdf": "^2.5.1",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
}
Example: Below is the code example of the invoice generator react app.
/* src/App.css */
*{
    color: black;
}
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}
.App {
    max-width: 600px;
    margin: 30px auto;
    background-color: #fff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
label {
    display: block;
    margin-bottom: 5px;
}
input {
    width: 100%;
    padding: 8px;
    margin-bottom: 15px;
    box-sizing: border-box;
}
button {
    background-color: #4caf50;
    color: #fff;
    border: none;
    padding: 10px;
    cursor: pointer;
    border-radius: 4px;
}
button:hover {
    background-color: #45a049;
}
.item-list {
    margin-top: 20px;
}
.item {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
}
.total {
    font-weight: bold;
    font-size: 18px;
    margin-top: 20px;
}
.download-btn {
    background-color: #008CBA;
    color: #fff;
    padding: 10px;
    border: none;
    cursor: pointer;
    border-radius: 4px;
    margin-top: 15px;
}
.download-btn:hover {
    background-color: #005684;
}
// App.js
import React from 'react';
import BillDetails from './Component/About';
import ItemList from './Component/Contact';
import TotalAmount from './Component/Header';
import { jsPDF } from 'jspdf';
import './App.css';
function App() {
    const [items, setItems] = React.useState([]);
    const handleAddItem = (item) => {
        setItems([...items, item]);
    };
    const handleDeleteItem = (index) => {
        const updatedItems = [...items];
        updatedItems.splice(index, 1);
        setItems(updatedItems);
    };
    const calculateTotalAmount = () => {
        return items.reduce(
            (total, item) =>
                total +
                item.quantity *
                item.price, 0);
    };
    const handleDownloadPDF = () => {
        const pdf = new jsPDF();
        pdf.text('Invoice', 20, 20);
        // Add items to PDF
        items.forEach((item, index) => {
            const yPos = 30 + index * 10;
            pdf.text(
                `Item: ${item.item}, 
                    Quantity: ${item.quantity}, 
                    Price: ${item.price}`, 20, yPos);
        });
        // Add total amount to PDF
        const totalAmount =
            calculateTotalAmount();
        pdf.text(
            `Total Amount: 
                    $${totalAmount.toFixed(2)}`, 20, 180);
        // Save the PDF
        pdf.save('invoice.pdf');
    };
    return (
        <div className="App">
            <h1>Bill/Invoice Generator</h1>
            <BillDetails onAddItem={handleAddItem} />
            <ItemList items={items}
                onDeleteItem={handleDeleteItem} />
            <TotalAmount
                total={calculateTotalAmount()} />
            <button
                onClick={handleDownloadPDF}>Download PDF</button>
        </div>
    );
}
export default App;
// components/BillDetails.js
import React, { useState } from 'react';
const BillDetails = ({ onAddItem, onDeleteItem }) => {
    const [item, setItem] = useState('');
    const [quantity, setQuantity] = useState(1);
    const [price, setPrice] = useState(0);
    const [errorMessage, setErrorMessage] = useState('');
    const handleAddItem = () => {
        if (!item.trim()) {
            setErrorMessage(`Please input data in the Item section.`);
            return;
        }
        // Check if the item contains only alphabetical characters
        if (!/^[a-zA-Z]+$/.test(item)) {
            setErrorMessage(`Item should only contain 
                alphabetical characters.`);
            return;
        }
        const newItem = { item, quantity, price };
        onAddItem(newItem);
        setItem('');
        setQuantity(1);
        setPrice(0);
        setErrorMessage('');
    };
    return (
        <div>
            <label>Item:</label>
            <input type="text"
                value={item}
                onChange={
                    (e) =>
                        setItem(e.target.value)} />
            <label>Quantity:</label>
            <input type="number"
                value={quantity}
                onChange={
                    (e) =>
                        setQuantity(e.target.value)} />
            <label>Price:</label>
            <input type="number"
                value={price}
                onChange={
                    (e) =>
                        setPrice(e.target.value)} />
            <button
                onClick={handleAddItem}>
                Add Item
            </button>
            <p style={{ color: 'red' }}>{errorMessage}</p>
        </div>
    );
};
export default BillDetails;
// components/ItemList.js
import React from 'react';
const ItemList = ({ items, onDeleteItem }) => {
    return (
        <div className="item-list">
            <h2>Item List</h2>
            {items.map((item, index) => (
                <div className="item" key={index}>
                    <div>{item.item}</div>
                    <div>
                        Quantity:
                        {item.quantity}
                    </div>
                    <div>Price: ${item.price}</div>
                    <button onClick={
                        () =>
                            onDeleteItem(index)}>
                        Delete
                    </button>
                </div>
            ))}
        </div>
    );
};
export default ItemList;
// components/TotalAmount.js
import React from 'react';
const TotalAmount = ({ total }) => {
    return (
        <div className="total">
            <h3>
                Total Amount:
                ${total.toFixed(2)}
            </h3>
        </div>
    );
};
export default TotalAmount;
Steps to Run the Application:
Step 1: Type the following Command in terminal:
npm run dev
Output: open web-browser and type the following url: http://localhost:5173/
