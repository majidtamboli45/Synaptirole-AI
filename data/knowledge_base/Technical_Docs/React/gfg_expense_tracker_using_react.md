# Expense Tracker using React

> Source: https://www.geeksforgeeks.org/reactjs/expense-tracker-using-react/

The Expense Tracker project is a web application developed using React. Its main purpose is to assist users in keeping track of their expenses. With this app, users can easily add and delete expenses to view a summary of their spending habits as well as it will show the available balance the user has left. Building an Expense Tracker with React helps users learn. Also allows them to practice creating web applications.
Let's have a quick look at what the final application will look like:
Steps to Create Expense Tracker in React
Step 1: Create a new React JS project using the following command
npm create vite@latest expense
Step 2: Change to the project directory
cd expense
Step 3: Install the requires modules
npm i styled-components
Folder Structure:
The updated dependencies in package.json will look like this:
"dependencies": {
"react": "^19.1.0",
"react-dom": "^19.1.0",
"styled-components": "^6.1.19"
},
"devDependencies": {
"@vitejs/plugin-react": "^4.6.0",
"vite": "^7.0.4"
}
Example: Write the following code in respective files
- App.js: This component is responsible, for rendering the layout of the application.
- AddTransaction.js: This component allows users to add transactions.
- OverviewComponent.js: This component displays the balance along with an "Add" button.
- Tracker.js: The component that brings together parts of the application such as overview transaction list and addition of transactions.
- TransactionItem.js: This component is responsible, for displaying transaction details including description, amount and a button to remove it from the list.
- TransactionsContainer.js: This component. Filters the list of transactions. It offers a search input field and displays only filtered transaction items.
// FileName: App.js
import styled from "styled-components";
import Tracker from "./components/Tracker";
import GlobalStyles from "./globalStyles";
const Main = styled.div`
  display: flex;
  justify-content: center;
  align-items: center;
`;
const App = () => {
  return (
    <Main>
      <GlobalStyles />
      <Tracker />
    </Main>
  )
}
export default App;
// FileName: globalStyles.js
import { createGlobalStyle } from "styled-components";
const GlobalStyles = createGlobalStyle`
    *{
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: 'Poppins', sans-serif;
    }
`
export default GlobalStyles;
// FileName: AddTransaction.js
import { useState } from "react";
import styled from "styled-components";
const Container = styled.div`
  text-align: center;
  border: 1px solid #000;
  padding: 20px;
  border-radius: 5px;
  margin-bottom: 25px;
`;
const Input = styled.input`
  width: 100%;
  padding: 15px 20px;
  outline: none;
  border-radius: 5px;
  margin: 5px 0;
  border: 1px solid #000;
`;
const RadioContainer = styled.div`
  display: flex;
  align-items: center;
  justify-content: center;
`;
const Label = styled.label`
  margin-left: 10px;
  cursor: pointer;
`;
const RadioBtn = styled(RadioContainer)`
  margin: 10px 20px 10px 0;
`;
const SubmitBtn = styled.button`
  background-color: #44E610;
  color: #fff;
  border-radius: 5px;
  padding: 10px 20px;
  border: none;
  outline: none;
  cursor: pointer;
  &:hover {
    background-color: #44E610;
  }
`;
const AddTransaction = ({ setToggle, AddTransactions }) => {
  const [amount, setAmount] = useState("");
  const [details, setDetails] = useState("");
  const [transType, setTransType] = useState("expense");
  const AddTransactionData = () => {
    AddTransactions({
      amount: Number(amount),
      details,
      transType,
      id: Date.now(),
    });
    setToggle();
  };
  return (
    <Container>
      <Input
        type={"number"}
        placeholder="Enter Amount"
        value={amount}
        onChange={(e) => setAmount(e.target.value)}
      />
      <Input
        type={"text"}
        placeholder="Enter Details"
        value={details}
        onChange={(e) => setDetails(e.target.value)}
      />
      <RadioContainer>
        <RadioBtn>
          <input
            type="radio"
            id="expense"
            name="type"
            value={"expense"}
            checked={transType === "expense"}
            onChange={(e) => setTransType(e.target.value)}
          />
          <Label htmlFor="expense">Expense</Label>
        </RadioBtn>
        <RadioBtn>
          <input
            type="radio"
            id="income"
            name="type"
            value={"income"}
            checked={transType === "income"}
            onChange={(e) => setTransType(e.target.value)}
          />
          <Label htmlFor="income">Budget</Label>
        </RadioBtn>
      </RadioContainer>
      <SubmitBtn onClick={AddTransactionData}>Add Transaction</SubmitBtn>
    </Container>
  );
};
export default AddTransaction;
// FileName: OverviewComponent.js
import styled from "styled-components";
const Container = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 25px;
`;
const Balance = styled.h2`
  font-weight: 500;
  & span {
    font-weight: bold;
  }
`;
const AddBtn = styled.button`
  cursor: pointer;
  background-color: rgb(68, 230, 16);
  color: rgb(255, 255, 255);
  padding: 7px 20px;
  font-size: 16px;
  border: none;
  text-transform: uppercase;
  border-radius: 5px;
`;
const OverviewComponent = ({ toggle, setToggle, income, expense }) => {
  const bal = income - expense;
  return (
    <Container>
      <Balance>
        Balance <span>₹{bal}</span>
      </Balance>
      <AddBtn onClick={() => setToggle(!toggle)}>
        {toggle ? "Cancel" : "Add"}
      </AddBtn>
    </Container>
  );
};
export default OverviewComponent;
// FileName: Tracker.js
import React, { useEffect, useState } from "react";
import styled from "styled-components";
import AddTransaction from "./AddTransaction";
import OverviewComponent from "./OverviewComponent";
import TransactionsContainer from "./TransactionsContainer";
const Container = styled.div`
  display: flex;
  flex-direction: column;
  width: 600px;
  max-width: 100%;
  background-color: #fff;
  padding: 30px 20px;
  border: 1px solid #000;
  border-radius: 5px;
  margin: 10px;
`;
const Heading = styled.h1`
  font-size: 30px;
  font-weight: bold;
  text-align: center;
  margin-bottom: 20px;
`;
const TransactionDetails = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  gap: 20px;
  margin-bottom: 25px;
`;
const THeading = styled.div`
font-size: 30px;
font-weight: bold;
text-align: center;
margin-bottom: 20px;
color: #44E610;
`;
const ExpenseBox = styled.div`
  flex: 1;
  border: 1px solid #000;
  border-radius: 5px;
  padding: 10px 20px;
  background-color: #fff;
  & span {
    font-weight: bold;
    font-size: 25px;
    display: block;
    color: ${(props) => (props.isExpense ? "red" : "green")};
  }
`;
const IncomeBox = styled(ExpenseBox)``;
const Tracker = () => {
  const [toggle, setToggle] = useState(false);
  const [transactions, setTransactions] = useState([]);
  const [expense, setExpense] = useState(0);
  const [income, setIncome] = useState(0);
  const AddTransactions = (payload) => {
    const transactionArray = [...transactions];
    transactionArray.push(payload);
    setTransactions(transactionArray);
  };
  const removeTransaction = (id) => {
    const updatedTransactions = transactions
                                .filter((transaction) => transaction.id !== id);
    setTransactions(updatedTransactions);
  };
  const calculateTransactions = () => {
    let exp = 0;
    let inc = 0;
    transactions.map((item) => {
      item.transType === "expense"
        ? (exp = exp + item.amount)
        : (inc = inc + item.amount);
    });
    setExpense(exp);
    setIncome(inc);
  };
  useEffect(() => {
    calculateTransactions();
  }, [transactions]);
  return (
    <Container>
        <THeading>GeeksforGeeks</THeading>
      <Heading>Expense Tracker</Heading>
      <OverviewComponent
        toggle={toggle}
        setToggle={setToggle}
        expense={expense}
        income={income}
      />
      {toggle && (
        <AddTransaction
          setToggle={setToggle}
          AddTransactions={AddTransactions}
        />
      )}
      <TransactionDetails>
        <ExpenseBox isExpense>
          Expense <span>₹{expense}</span>
        </ExpenseBox>
        <IncomeBox>
          Budget <span>₹{income}</span>
        </IncomeBox>
      </TransactionDetails>
      <TransactionsContainer
        transactions={transactions}
        removeTransaction={removeTransaction}
      />
    </Container>
  );
};
export default Tracker;
// FileName: TransactionItem.js
import React from "react";
import styled from "styled-components";
const Item = styled.div`
  display: flex;
  justify-content: space-between;
  align-items: center;
  border: 1px solid #e6e8e9;
  background-color: #fff;
  border-radius: 5px;
  padding: 10px 20px;
  border-right: 5px solid ${(props) => (props.isExpense ? "red" : "green")};
  margin-bottom: 10px;
  cursor: pointer;
`;
const RemoveButton = styled.button`
  background-color: #44E610;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 3px;
  cursor: pointer;
`;
const TransactionItem = ({ transaction, removeTransaction }) => {
  return (
    <Item isExpense={transaction?.transType === "expense"}>
      <span>{transaction.details}</span>
      <span>₹{transaction.amount}</span>
      <RemoveButton onClick={() => removeTransaction(transaction.id)}>
        Remove
      </RemoveButton>
    </Item>
  );
};
export default TransactionItem;
// FileName: TransactionsContainer.js
import React, { useEffect, useState } from "react";
import styled from "styled-components";
import TransactionItem from "./TransactionItem";
const Container = styled.div``;
const Heading = styled.h2`
  font-size: 25px;
  font-weight: 600;
`;
const SearchInput = styled.input`
  width: 100%;
  padding: 15px 20px;
  outline: none;
  border-radius: 5px;
  margin: 5px 0;
  border: 1px solid #e6e8e9;
  background-color: #e6e8e9;
  margin-bottom: 25px;
`;
const TransactionItems = styled.div``;
const TransactionsContainer = ({ transactions, removeTransaction }) => {
  const [searchInput, setSearchInput] = useState("");
  const [filteredTransactions, setFilteredTransactions] = useState(transactions);
  const filteredData = (searchInput) => {
    if (!searchInput || !searchInput.trim().length) {
      setFilteredTransactions(transactions);
      return;
    }
    let filtered = [...filteredTransactions];
    filtered = filtered.filter(
      (item) =>
        item.details.toLowerCase().includes(searchInput.toLowerCase().trim())
    );
    setFilteredTransactions(filtered);
  };
  useEffect(() => {
    filteredData(searchInput);
  }, [transactions, searchInput]);
  return (
    <Container>
      <Heading>Transactions</Heading>
      <SearchInput
        type="text"
        placeholder="Search here"
        value={searchInput}
        onChange={(e) => setSearchInput(e.target.value)}
      />
      <TransactionItems>
        {filteredTransactions?.length ? (
          filteredTransactions.map((transaction) => (
            <TransactionItem
              transaction={transaction}
              key={transaction.id}
              removeTransaction={removeTransaction}
            />
          ))
        ) : (
          <p>No Transactions</p>
        )}
      </TransactionItems>
    </Container>
  );
};
export default TransactionsContainer;
Steps to run the project:
- Type the following command in terminal.
npm run dev
- Open web-browser and type the following URL
http://localhost:5173/
Output:
