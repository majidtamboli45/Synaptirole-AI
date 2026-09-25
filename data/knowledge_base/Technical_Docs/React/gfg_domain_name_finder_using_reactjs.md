# Domain name finder using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-domain-name-finder-app-in-reactjs/

In this article, we are going to make a domain name generator app that generates plenty of domain names related to our input keyword available to buy. In this domain name generator, we will take a text given by the user and will generate plenty of names related to the input text given, and by clicking on any of those we will be redirected to the domain buying website.
Let us have a look at how the final application will look like
Prerequisites: The pre-requisites for this project are.
Approach:
We will divide the project into minor components and style each component individually. We will create functional components. The main component of our application will be class component which imports all the the other components and render accordingly. The suggestions will be fetched through a URL.
Steps to create the application:
Step 1: Start a project by the following command:
npm create vite@latest foldername --template react
Step 2: Now, go to the project folder i.e foldername:
cd foldername
Step 3: Now, go to the src folder and create a components folder. Under the components folder, create the following folders and their respective JSX files and CSS files:
- App:
  - App.jsx
  - App.css
- Header:
  - Header.jsx
  - Header.css
- NameCard:
  - NameCard.jsx
  - NameCard.css
- ResultContainer:
  - ResultContainer.jsx
  - ResultContainer.css
- SearchBox:
  - SearchBox.jsx
  - SearchBox.css
Step 4: Create another folder image. Import the image you want to use.(optional)
Step 5: Now, open the console and install the following package:
npm install @rstacruz/startup-name-generator
Note: The above-mentioned package is open sourced at GitHub: https://github.com/rstacruz/startup-name-generator
Project Structure: It will look like the following.
The updated dependencies in package.json will look like:
"dependencies": {
"@rstacruz/startup-name-generator": "^0.3.0",
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4",
"vite": "^4.2.0"
}
Example: Write the code below in the mentioned file names in code block.
The below code contains the logic portion of each JSX file
// index.js
import React from 'react';
import ReactDOM from 'react-dom';
import App from './components/App/App';
ReactDOM.render(<React.StrictMode >
    <App />
</React.StrictMode>,
    document.getElementById('root')
);
// App.jsx
import React from 'react';
import Header from '../Header/Header';
import ResultContainer from '../ResultContainer/ResultContainer';
import SearchBox from '../SearchBox/SearchBox';
import './App.css';
const name = require('@rstacruz/startup-name-generator');
// Class based component
class App extends React.Component {
    state = {
        headerText: "Just Name It!!",
        headerExpanded: true,
        suggestedNames: [],
    };
    // Animation
    handleInputChange = (inputText) => {
        this.setState({ headerExpanded: !(inputText.length > 0), 
        suggestedNames: (inputText.length > 0) ? 
                        name(inputText) : [], });
    };
    render() {
        return (
            <div>
                <Header
                    headTitle={this.state.headerText}
                    headerExpanded={this.state.headerExpanded} />
                <SearchBox onInputChange={this.handleInputChange} />
                <ResultContainer suggestedNames=
                    {this.state.suggestedNames} />
            </div>
        );
    }
}
export default App;
// Header.jsx
import React from 'react';
import'./Header.css';
const Header=({headTitle , headerExpanded})=>{
    return(
        <div className="head-container">
            <h1 className="head-text">{headTitle}</h1>
        </div>
    );
};
export default Header;
// NameCard.jsx
import React from 'react';
import './NameCard.css';
const nameCheapUrl = 
"https://www.namecheap.com/domains/registration/results/?domain=";
const NameCard = ({ suggestedName }) => {
    return (
        <a
            target="_blank"
            rel="noreferrer"
            className="card-link" href={`${nameCheapUrl}${suggestedName}`}>
            <div className="result-name-card">
                <p className="result-name">{suggestedName}</p>
            </div>
        </a>
    );
};
export default NameCard;
// ResultContainer.jsx
import React from 'react';
import NameCard from '../NameCard/NameCard';
import './ResultContainer.css'
const ResultContainer =({suggestedNames})=>{
    const suggestedNamesJsx = suggestedNames.map((suggestedName)=>{
        return <NameCard key={suggestedName} suggestedName={suggestedName}/>;
    });
    return(
        <div className="results-container">
            {suggestedNamesJsx}
        </div>
    );
};
export default ResultContainer;
// SearchBox.jsx
import React from 'react';
import './SearchBox.css';
const SearchBox = ({ onInputChange }) => {
    return (
        <div className="search-container">
            <input onChange={(event) => onInputChange(event.target.value)} 
            placeholder="Type keywords" className="search-input" />
        </div>
    );
};
export default SearchBox;
The below files contain the styling of each document
/* App.css */
body {
   background: #0f1228;
   overflow-x: hidden;
   color: #e7e9f0;
   font-family: 'Lato', sans-serif;
}
/* Header.css */
.head-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    margin-top: 60px;
}
.head-image {
    width: auto;
    transition: max-width 1s, min-width 1.5s;
}
.head-image-expanded {
    min-width: 300px;
    max-width: 280px;
}
.head-image-contracted {
    min-width: 100px;
    max-width: 120px;
}
.head-text {
    font-family: 'Hachi Maru Pop', cursive;
    margin: 5px 0 15px 0;
}
/* NameCard.css */
.result-name-card {
    color: #e7e9f0;
    background: #282d4f;
    margin: 10px 15px;
    min-width: 75px;
    padding: 10px 20px;
    border-radius: 10px;
    box-shadow: 0px 0px5pxrgba(255, 255, 255, 0.1);
    transition: background 0.35s;
    display: flex;
    justify-content: center;
}
.card-link {
    text-decoration: none;
}
.result-name-card:hover {
    background: #4a5079;
    box-shadow: 0 0 5px rgba(255, 255, 255, 0.2);
}
.result-name {
    margin: 0;
    font-weight: 100;
}
/* ResultContainer.css */
.results-container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    padding: 20px 40px;
}
/* SearchBox.css */
.search-container {
    display: flex;
    justify-content: center;
    margin: 10px;
}
.search-input {
    padding: 18px 25px;
    font-size: 25px;
    width: 350px;
    border-width: 0;
    background: #a592f2;
    color: #e7e9f0;
    border-radius: 50px;
    box-shadow: 0 0 5px rgba(255, 255, 255, 0.5);
}
.search-input::placeholder {
    color: #e7e9f0;
}
.search-input:focus {
    outline: navy;
}
Steps to run the application:
Step 1: Type the following command in terminal of your project directory
npm run dev Step 2: Open http://localhost:5173/nameIt URL in the browser.
Output
