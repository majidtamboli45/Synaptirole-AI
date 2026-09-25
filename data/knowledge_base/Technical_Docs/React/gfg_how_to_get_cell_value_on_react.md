# How to get cell value on React

> Source: https://www.geeksforgeeks.org/reactjs/how-to-get-cell-value-on-react-table/

React-Table is a powerful library that allows you to create flexible and feature-rich tables in your React applications. It provides various functionalities to manipulate and interact with table data. One common requirement is to retrieve the value of a specific cell in React-Table. In this article, we will explore React Table.
Prerequisites:
Approach
To get the cell values on react table we will use useState to store the selected cell value. This value will be updated on click event on each table cell. Generate the table using useTable hook and use cell.value to access, update, and display the value.
Steps to Create React Application And Installing Module
Step 1: Create a React application using the following command.
npx create-react-app foldername
Step 2: After creating your project folder i.e. foldername, move to it using the following command.
cd foldername
Step 3: After creating the ReactJS application, Install the react-table using the following command.
npm i react-table
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-table": "^7.8.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
Example: Now write down the following code in the App.js file. Here, App is our default component where we have written our code.
//App.js
import React, { useState } from 'react';
import { useTable } from 'react-table';
const App = () => {
    // Define state
    const [cellValue, setCellValue] = useState('');
    // Add data here to show in table
    const data = React.useMemo(
        () => [
            {
                reactCol1: 'Hey',
                reactCol2: 'World',
            },
            {
                reactCol1: 'Here',
                reactCol2: 'is the',
            },
            {
                reactCol1: 'Example',
                reactCol2: 'of react-table',
            },
        ],
        []
    )
    // Define column of the table
    const columns = React.useMemo(
        () => [
            {
                Header: 'React',
                // Accessor is the "key" in the data
                accessor: 'reactCol1',
            },
            {
                Header: 'Table',
                accessor: 'reactCol2',
            },
        ],
        []
    )
    // Function to get cell value
    const getCellValue = (cell) => {
        setCellValue(cell.value)
    }
    // Create the instance of table by 
    // using hooks of react-table
    const {
        getTableProps,
        getTableBodyProps,
        headerGroups,
        rows,
        prepareRow,
    } = useTable({ columns, data })
    return (
        <>
            {/* Showing cell value */}
            <h3>Selected Cell Value: {cellValue}</h3>
            <table {...getTableProps()}
                style={{ border: 'solid 1px blue' }}>
                <thead>
                    {headerGroups.map(headerGroup => (
                        <tr {...headerGroup.getHeaderGroupProps()}>
                            {headerGroup.headers.map(column => (
                                <th
                                    {...column.getHeaderProps()}
                                    style={{
                                        borderBottom: 'solid 3px red',
                                        background: 'aliceblue',
                                        color: 'black',
                                        fontWeight: 'bold',
                                    }}
                                >
                                    {column.render('Header')}
                                </th>
                            ))}
                        </tr>
                    ))}
                </thead>
                <tbody {...getTableBodyProps()}>
                    {rows.map(row => {
                        prepareRow(row)
                        return (
                            <tr {...row.getRowProps()}>
                                {row.cells.map(cell => {
                                    return (
                                        <>
                                            {/* Here added onClick function 
                                            to get cell value */}
                                            <td
                                                onClick={() => getCellValue(cell)}
                                                {...cell.getCellProps()}
                                                style={{
                                                    padding: '10px',
                                                    border: 'solid 1px gray',
                                                    background: 'papayawhip',
                                                }}
                                            >
                                                {cell.render('Cell')}
                                            </td>
                                        </>
                                    )
                                })}
                            </tr>
                        )
                    })}
                </tbody>
            </table>
        </>
    )
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project.
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output by clicking the of react-table cell.
