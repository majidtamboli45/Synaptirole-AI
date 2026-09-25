# Build a Password Manager using React

> Source: https://www.geeksforgeeks.org/reactjs/build-a-password-manager-using-react/

Password manager using ReactJS provides a secure and user-friendly environment for users to store and manage their credentials. It offers convenient features like adding, editing, and deleting password entries. The user can show/hide their password by clicking on a particular button.
Let's have a quick look at what the final application will look like:
Approach to create the Password Manager:
- The component's state is initialized by the constructor with values such as website, username, password, passwords array, and various flags.
- After the component is mounted, the "componentDidMount" function triggers the execution of "showPasswords()". This action effectively resets the formand editing mode.
- The component's structure is defined in the rendering process, which involves handling password entries, alerts, and input fields. Additionally, its behavior is adjusted to accommodate the addition or editing of entries.
Functionalities to create the Password Manager:
- maskPassword: Masks the password with asterisks ('*').
- copyPassword: Asynchronously copies a password to the clipboard.
- deletePassword: Deletes a password entry and shows a success alert.
- showPasswords: Resets the component's state, clearing the form and editing mode.
- savePassword: Adds or updates password entries based on user input.
- editPassword: Allows editing of existing password entries.
- renderPasswordList: Generates HTML elements for displaying password entries.
Steps to Create the Password Manager :
Step 1: Create a react application by using this command
npm create vite@latest  password-manager-app
Step 2: After creating your project folder, i.e. password-manager-app, use the following command to navigate to it:
cd password-manager-app
Folder Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^19.1.0",
"react-dom": "^19.1.0",
},
"devDependencies": {
"@vitejs/plugin-react": "^4.6.0",
"vite": "^7.0.4"
}
Example: Write the below code in App.js file and App.css in the src directory
body {
  background-color: #f0f0f0;
  font-family: 'Arial', sans-serif;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100vh;
  margin: 0;
}
.container {
  width: 100%;
  text-align: center;
  background-color: #fff;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
  padding: 20px;
}
.heading {
  font-size: 28px;
  margin-bottom: 20px;
  color: #333;
}
.subHeading {
  font-size: 20px;
  margin-bottom: 15px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}
#alert {
  color: green;
  margin-left: 5px;
}
.input {
  width: 90%;
  padding: 12px;
  border: 2px solid #ccc;
  border-radius: 5px;
  margin: 10px 0;
  font-size: 16px;
}
.table {
  margin: 2rem 0;
}
.passwordItem {
  background-color: #f9f9f9;
  border: 1px solid #ccc;
  border-radius: 10px;
  padding: 15px;
  margin-bottom: 15px;
}
.listItem {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 10px;
  margin-right: 10px;
}
.listValue {
  margin-right: 15px;
}
.listLabel {
  font-weight: bold;
  width: 100px;
  padding: 12px;
  font-size: 18px;
}
.showPasswordIcon {
  cursor: pointer;
  margin-left: 16px;
  color: #007bff;
  font-size: 20px;
  transition: color 0.3s;
}
.showPasswordIcon:hover {
  color: #0056b3;
}
.copyIcon,
editIcon,
deleteIcon {
  cursor: pointer;
  color: #555;
  font-size: 20px;
  transition: color 0.3s;
  margin-left: 10px;
}
.copyIcon:hover,
editIcon:hover,
deleteIcon:hover {
  color: #007bff;
}
.submitButton {
  background: #007bff;
  color: #fff;
  padding: 12px 24px;
  text-align: center;
  border: none;
  border-radius: 5px;
  cursor: pointer;
  margin: 12px 0;
  font-weight: bold;
  font-size: 18px;
}
.noData {
  text-align: center;
  color: #777;
  margin-top: 20px;
  font-size: 18px;
}
import React, { Component } from 'react';
import './App.css';
import { FaCopy, FaEdit, FaTrash } from 'react-icons/fa';
class App extends Component {
  // Constructor to initialize the component's state
  constructor(props) {
    super(props);
    this.state = {
      website: '',
      username: '',
      password: '',
      passwords: [],
      alertVisible: false,
      editing: false,
      editIndex: null,
      showPassword: false,
    };
  }
  componentDidMount() {
    this.showPasswords();
  }
  // Function to copy a password to the clipboard
  copyPassword = async (pass) => {
    try {
      const textArea = document.createElement('textarea');
      textArea.value = pass;
      document.body.appendChild(textArea);
      textArea.select();
      document.execCommand('copy');
      document.body.removeChild(textArea);
      this.setState({ alertVisible: true });
      setTimeout(() => {
        this.setState({ alertVisible: false });
      }, 2000);
    } catch (error) {
      console.error('Error copying text:', error);
    }
  };
  // Function to delete a password entry
  deletePassword = (website) => {
    const updatedPasswords = this.state.passwords.filter(
      (e) => e.website !== website
    );
    this.setState({ passwords: updatedPasswords });
    alert(`Successfully deleted ${website}'s password`);
  };
  // Function to clear the form and reset editing mode
  showPasswords = () => {
    this.setState({
      passwords: [],
      website: '',
      username: '',
      password: '',
      editing: false,
      editIndex: null,
      showPassword: false,
    });
  };
  savePassword = () => {
    const { website, username, password, editing, editIndex, passwords } =
      this.state;
    if (!website || !username || !password) {
      alert('Please fill in all fields.');
      return;
    }
    if (editing && editIndex !== null) {
      // Replace the old entry with the updated one
      const updatedPasswords = [...passwords];
      updatedPasswords[editIndex] = {
        website,
        username,
        password,
      };
      this.setState({
        passwords: updatedPasswords,
        editing: false,
        editIndex: null,
        website: '',
        username: '',
        password: '',
      });
    } else {
      const newPassword = {
        website,
        username,
        password,
      };
      this.setState((prevState) => ({
        // Add the new entry to passwords array
        passwords: [...prevState.passwords, newPassword],
        website: '',
        username: '',
        password: '',
      }));
    }
  };
  // Function to edit a password entry
  editPassword = (index) => {
    const { passwords } = this.state;
    this.setState({
      editing: true,
      editIndex: index,
      website: passwords[index].website,
      username: passwords[index].username,
      password: passwords[index].password,
    });
  };
  // Function to toggle password visibility
  togglePasswordVisibility = () => {
    this.setState((prevState) => ({
      showPassword: !prevState.showPassword,
    }));
  };
  renderPasswordList = () => {
    const { passwords, showPassword } = this.state;
    return passwords.map((item, index) => (
      <div className="passwordItem" key={index}>
        <div className="listItem">
          <div className="listLabel">Website:</div>
          <div className="listValue">{item.website}</div>
          <div className="listLabel">Username:</div>
          <div className="listValue">{item.username}</div>
          <div className="listLabel">Password:</div>
          <div className="listValue">
            <span className="passwordField">
              {showPassword ? item.password : item.password.replace(/./g, '*')}
            </span>
          </div>
          <div className="passwordButtons">
            <button
              className="showPasswordButton"
              onClick={this.togglePasswordVisibility}
            >
              {showPassword ? 'Hide' : 'Show'}
            </button>
          </div>
          <div className="iconContainer">
            <div
              className="icon"
              onClick={() => this.copyPassword(item.password)}
            >
              <FaCopy size={20} color="#555" />
            </div>
            <div className="icon" onClick={() => this.editPassword(index)}>
              <FaEdit size={20} color="#555" />
            </div>
            <div
              className="icon"
              onClick={() => this.deletePassword(item.website)}
            >
              <FaTrash size={20} color="#555" />
            </div>
          </div>
        </div>
      </div>
    ));
  };
  render() {
    const { website, username, password, editing } = this.state;
    return (
      <div className="container">
        <div className="content">
          <h1 className="heading">Password Manager</h1>
          <h2 className="subHeading">
            Your Passwords
            {this.state.alertVisible && <span id="alert">(Copied!)</span>}
          </h2>
          {this.state.passwords.length === 0 ? (
            <p className="noData">No Data To Show</p>
          ) : (
            <div className="table">{this.renderPasswordList()}</div>
          )}
          <h2 className="subHeading">
            {editing ? 'Edit Password' : 'Add a Password'}
          </h2>
          <input
            className="input"
            placeholder="Website"
            value={website}
            onChange={(e) => this.setState({ website: e.target.value })}
          />
          <input
            className="input"
            placeholder="Username"
            value={username}
            onChange={(e) => this.setState({ username: e.target.value })}
          />
          <input
            className="input"
            placeholder="Password"
            type="password"
            value={password}
            onChange={(e) => this.setState({ password: e.target.value })}
          />
          <div className="submitButton" onClick={this.savePassword}>
            <span className="submitButtonText">
              {editing ? 'Update Password' : 'Add Password'}
            </span>
          </div>
        </div>
      </div>
    );
  }
}
export default App;
Steps to run the Application:
- Type the following command in the terminal:
npm run dev - Type the following URL in the browser:
http://localhost:5173/
Output:
