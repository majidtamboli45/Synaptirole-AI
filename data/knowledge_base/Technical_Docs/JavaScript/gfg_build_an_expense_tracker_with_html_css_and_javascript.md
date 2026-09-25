# Build an Expense Tracker with HTML CSS and JavaScript

> Source: https://www.geeksforgeeks.org/javascript/build-an-expense-tracker-with-html-css-and-javascript/

This article shows how to build a simple Expense Tracker using HTML, CSS, and JavaScript to manage daily spending effectively. It helps users monitor their financial habits through an easy-to-use web application.
- Allows users to add and delete expenses dynamically.
- Helps track spending and maintain better financial control.
- Built using HTML for layout, CSS for styling, and JavaScript for functionality.
Approach
- Create the basic HTML file with a title, heading, form, and expense list container.
- Apply basic CSS styles for a visually appealing look.
- Capture the expense name, amount, category, and date from the form inputs.
- Validate the inputs to ensure all fields are filled correctly. Create an expense object with the captured inputs.
- Store the expense object in an array.
- Loop through the expense array.
- Create HTML elements to display each expense, including name, amount, category, date, and action buttons.
- Implement a edit functionality to modify expenses.
- Implement a delete functionality to remove expenses.
- Implement filter functionality to filter the displayed expenses based on the selected category.
<!DOCTYPE html>
<html>
<head>
    <title>Expense Tracker</title>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <div class="container">
        <h1>Expense Tracker</h1>
        <form id="expense-form">
            <input type="text" id="expense-name" placeholder="Expense Name" required />
            <input type="number" id="expense-amount" placeholder="Amount" required />
            <select id="expense-category" required>
                <option value="" disabled selected>Select Category</option>
                <option value="Food">Food</option>
                <option value="Transport">Transport</option>
                <option value="Entertainment">Entertainment</option>
                <option value="Other">Other</option>
            </select>
            <input type="date" id="expense-date" required />
            <button type="submit">Add Expense</button>
        </form>
        <div class="expense-table">
            <table>
                <thead>
                    <tr>
                        <th>Expense Name</th>
                        <th>Amount</th>
                        <th>Category</th>
                        <th>Date</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody id="expense-list"></tbody>
            </table>
            <div class="total-amount">
                <strong>Total:</strong> $<span id="total-amount">0</span>
            </div>
        </div>
        <div class="filter">
            <label for="filter-category">Filter by Category:</label>
            <select id="filter-category">
                <option value="All">All</option>
                <option value="Food">Food</option>
                <option value="Transport">Transport</option>
                <option value="Entertainment">Entertainment</option>
                <option value="Other">Other</option>
            </select>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
/* style.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
}
.container {
    max-width: 800px;
    margin: 50px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
}
h1 {
    text-align: center;
    margin-bottom: 20px;
}
form {
    display: flex;
    gap: 10px;
    margin-bottom: 20px;
}
form input, form select, form button {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
form button {
    background-color: #28a745;
    color: white;
    border: none;
    cursor: pointer;
}
form button:hover {
    background-color: #218838;
}
.expense-table table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
}
.expense-table th, .expense-table td {
    padding: 10px;
    border: 1px solid #ddd;
    text-align: left;
}
.expense-table th {
    background-color: #f8f8f8;
}
.total-amount {
    text-align: right;
    font-size: 18px;
}
.filter {
    margin-bottom: 20px;
    text-align: right;
}
.filter label {
    margin-right: 10px;
}
.filter select {
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
//script.js
document.addEventListener("DOMContentLoaded", () => {
    const expenseForm = document.getElementById("expense-form");
    const expenseList = document.getElementById("expense-list");
    const totalAmount = document.getElementById("total-amount");
    const filterCategory = document.getElementById("filter-category");
    let expenses = [];
    expenseForm.addEventListener("submit", (e) => {
        e.preventDefault();
        const name = document.getElementById("expense-name").value;
        const amount = parseFloat(document.getElementById("expense-amount").value);
        const category = document.getElementById("expense-category").value;
        const date = document.getElementById("expense-date").value;
        const expense = {
            id: Date.now(),
            name,
            amount,
            category,
            date
        };
        expenses.push(expense);
        displayExpenses(expenses);
        updateTotalAmount();
        expenseForm.reset();
    });
    expenseList.addEventListener("click", (e) => {
        if (e.target.classList.contains("delete-btn")) {
            const id = parseInt(e.target.dataset.id);
            expenses = expenses.filter(expense => expense.id !== id);
            displayExpenses(expenses);
            updateTotalAmount();
        }
        if (e.target.classList.contains("edit-btn")) {
            const id = parseInt(e.target.dataset.id);
            const expense = expenses.find(expense => expense.id === id);
            document.getElementById("expense-name").value = expense.name;
            document.getElementById("expense-amount").value = expense.amount;
            document.getElementById("expense-category").value = expense.category;
            document.getElementById("expense-date").value = expense.date;
            expenses = expenses.filter(expense => expense.id !== id);
            displayExpenses(expenses);
            updateTotalAmount();
        }
    });
    filterCategory.addEventListener("change", (e) => {
        const category = e.target.value;
        if (category === "All") {
            displayExpenses(expenses);
        } else {
            const filteredExpenses = expenses.filter(expense => expense.category === category);
            displayExpenses(filteredExpenses);
        }
    });
    function displayExpenses(expenses) {
        expenseList.innerHTML = "";
        expenses.forEach(expense => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${expense.name}</td>
                <td>$${expense.amount.toFixed(2)}</td>
                <td>${expense.category}</td>
                <td>${expense.date}</td>
                <td>
                    <button class="edit-btn" data-id="${expense.id}">Edit</button>
                    <button class="delete-btn" data-id="${expense.id}">Delete</button>
                </td>
            `;
            expenseList.appendChild(row);
        });
    }
    function updateTotalAmount() {
        const total = expenses.reduce((sum, expense) => sum + expense.amount, 0);
        totalAmount.textContent = total.toFixed(2);
    }
});
Output:
