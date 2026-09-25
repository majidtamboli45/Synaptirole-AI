# How to add styles to autocomplete in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-add-styles-to-autocomplete-in-reactjs/

Autocomplete functionality in web applications is common for predictive user input. This article focuses on enhancing the visual appearance of ReactJS autocomplete components using Material-UI's package, offering customization options for seamless integration with the overall application design.
Prerequisites:
Approach:
- On the Autocomplete element, className doesn't apply to the text input as you might expect. You can't use the className on the autocomplete component, you have to use the inputProps property.
- The inputProps is commonly used for (but not limited to) placeholder, event handlers (onFocus, onBlur, etc.), autoFocus, etc.
- You can customize the styles in inputProps in the above code.
- In the renderItem prop, you can add style as a set of styles that can be applied to improve the look of the items in the dropdown menu.
Steps to Create the React Application And Installing Module:
Step 1: Create a React application using the following command:
npx create-react-app materialuiTable
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd materialuiTable
Step 3: After creating the ReactJS application, Install the required module using the following command:
npm install --save react-autocomplete
Project Structure:
package.json:
  "dependencies": {
"react-autocomplete": "^1.8.1",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
}
Example: Now write down the following code in the App.js file
import React, { useState } from 'react'
import Autocomplete from 'react-autocomplete'
function App() {
    // Defining a state named value, which
    // we can update by calling setValue 
    // Value will store the typed value or
    // selected suggestion by the user
    const [value, setValue] = useState('');
    return (
        <div style={{
            display: 'flex', flexDirection: 'column',
            alignItems: 'center'
        }}>
            <div>
                {/* Inline css*/}
                <h4 style={{
                    padding: '15px',
                    border: '13px solid #b4f0b4',
                    color: 'rgb(11, 167, 11)'
                }}>
                    Geeks for Geeks : React
                    Autocomplete Component Styling
                </h4>
            </div>
            <div>
                <Autocomplete
                    // Items is the list of suggestions 
                    // displayed while the user type
                    items={[
                        { label: 'C++' },
                        { label: 'C' },
                        { label: 'Python' },
                        { label: 'JavaScript' },
                        { label: 'Julia' },
                        { label: 'Java' },
                        { label: 'Objective C' },
                        { label: 'C#' },
                        { label: 'Dart' },
                        { label: 'Perl' }
                    ]}
                    // To handle the case that when
                    // the user type, suggested 
                    // values should be independent
                    // of upper or lower case 
                    shouldItemRender={(item, value
                    ) => item.label.toLowerCase()
                        .indexOf(value.toLowerCase()) > -1}
                    getItemValue={item => item.label}
                    renderItem={(item, isHighlighted) =>
                        // Styling to highlight selected item
                        <div style={{
                            background: isHighlighted ?
                                '#bcf5bc' : 'white'
                        }}
                            key={item.id}>
                            {item.label}
                        </div>
                    }
                    value={value}
                    // The onChange event watches for
                    // changes in an input field
                    onChange={e => setValue(e.target.value)}
                    // To set the state variable to value
                    // selected from dropdown
                    onSelect={(val) => setValue(val)}
                    // Added style in Autocomplete component
                    inputProps={{
                        style: {
                            width: '300px', height: '20px',
                            background: '#e4f3f7',
                            border: '2px outset lightgray'
                        },
                        placeholder: 'Search language'
                    }}
                />
            </div>
        </div>
    );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000
