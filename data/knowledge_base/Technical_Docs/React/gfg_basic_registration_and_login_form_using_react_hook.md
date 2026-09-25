# Basic Registration and Login Form Using React Hook Form

> Source: https://www.geeksforgeeks.org/reactjs/react-hook-form-create-basic-reactjs-registration-and-login-form/

In ReactJS, creating a form can be a nightmare as it involves handling and validating inputs. React-hook-form is a ReactJS library that simplifies the process of creating forms.
The library provides all the features that a modern form needs. It is simple, fast, and offers isolated re-renders for elements.
React Hook Form Library
React Hook Form is a popular third-party library that simplifies form management in React functional components by using hooks. It offers a complete set of tools to handle various aspects of forms, such as form state management, field handling, and form submission.
Some of the features of the React Hook Form Libraries are:
- Open-source
- Supports TypeScript
- Provides DevTool for inspecting form data
- Provides Form Builder – create forms by drag and drop
- Supports for React-native
Steps to Build a Registration and Login Page in React
Creating registration and login forms is an essential part of user management. Below are the steps to build a basic registration and login page using React and React Hook Form.
Step 1: Create a React Application
First, create a new React application using the following command:
npm create vite@latest shopping-cart --template react
Step 2: Navigate to the Project Folder
Once the project is created, go to the project folder:
cd shopping-cart
npm install
Step 3: Install React Hook Form Library
Install the React Hook Form library by running the below command:
npm install react-hook-form
Project Structure
Step 4: Storing Form Data in localStorage
As we are building a login form, we need to verify log-in credentials so we store the form data in local storage.
const onSubmit = (data) => {
localStorage.setItem(data.email, JSON.stringify({
name: data.name, password: data.password
}));
console.log(JSON.parse(localStorage.getItem(data.email)));
};
Step 5: Building login Page
import React from "react";
import { useForm } from "react-hook-form";
import "./App.css";
function Login() {
    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm();
    const onSubmit = (data) => {
        const userData = JSON.parse(localStorage.getItem(data.email));
        if (userData) {
            if (userData.password === data.password) {
                console.log(userData.name + " You Are Successfully Logged In");
            } else {
                console.log("Email or Password is not matching with our record");
            }
        } else {
            console.log("Email or Password is not matching with our record");
        }
    };
    return (
        <>
            <h2>Login Form</h2>
            <form className="App" onSubmit={handleSubmit(onSubmit)}>
                <input
                    type="email"
                    {...register("email", { required: true })}
                    placeholder="Email"
                />
                {errors.email && <span style={{ color: "red" }}>*Email* is mandatory</span>}
                <input
                    type="password"
                    {...register("password", { required: true })}
                    placeholder="Password"
                />
                {errors.password && <span style={{ color: "red" }}>*Password* is mandatory</span>}
                <input type="submit" style={{ backgroundColor: "#a1eafb" }} />
            </form>
        </>
    );
}
export default Login;
App {
  display: flex;
  flex-direction: column;
  gap: 10px;
  width: 300px;
  margin: 20px auto;
}
 
input {
  padding: 10px;
  font-size: 16px;
}
Output:
In this example:
- Form Handling with React Hook Form: Utilizes the useForm hook from react-hook-form to manage form state and validation.
- Form Fields: Includes email and password inputs, both marked as required fields.
- Validation: Displays error messages if the required fields are left empty.
- Form Submission: On form submission, checks if the entered email exists in localStorage. If found, compares the stored password with the entered one.
- Feedback: Logs appropriate messages to the console based on the login attempt's success or failure.
Step 6: Building Registration Form
import React from "react";
import { useForm } from "react-hook-form";
import "./App.css";
function Register() {
    const {
        register,
        handleSubmit,
        formState: { errors },
    } = useForm();
    const onSubmit = (data) => {
        const existingUser = JSON.parse(localStorage.getItem(data.email));
        if (existingUser) {
            console.log("Email is already registered!");
        } else {
            const userData = {
                name: data.name,
                email: data.email,
                password: data.password,
            };
            localStorage.setItem(data.email, JSON.stringify(userData));
            console.log(data.name + " has been successfully registered");
        }
    };
    return (
        <>
            <h2>Registration Form</h2>
            <form className="App" onSubmit={handleSubmit(onSubmit)}>
                <input
                    type="text"
                    {...register("name", { required: true })}
                    placeholder="Name"
                />
                {errors.name && <span style={{ color: "red" }}>*Name* is mandatory</span>}
                <input
                    type="email"
                    {...register("email", { required: true })}
                    placeholder="Email"
                />
                {errors.email && <span style={{ color: "red" }}>*Email* is mandatory</span>}
                <input
                    type="password"
                    {...register("password", { required: true })}
                    placeholder="Password"
                />
                {errors.password && <span style={{ color: "red" }}>*Password* is mandatory</span>}
                <input type="submit" style={{ backgroundColor: "#a1eafb" }} />
            </form>
        </>
    );
}
export default Register;
.App {
  display: flex;
  flex-direction: column;
  gap: 10px;
  width: 300px;
  margin: 20px auto;
}
 
input {
  padding: 10px;
  font-size: 16px;
}
Output
In this example
- Form Handling with React Hook Form: Utilizes the useForm hook from react-hook-form to manage form state and validation.
- Form Fields: Includes name, email, and password inputs, all marked as required fields.
- Validation: Displays error messages if any required fields are left empty.
- Form Submission: On form submission, checks if the entered email already exists in localStorage. If not, stores the new user's data.
- Feedback: Logs appropriate messages to the console based on the registration attempt's success or failure.
Advantages of using React Hook Form
- Easy to learn and build
- Provides form validation
- Easy to handle the form submission.
- We can watch any particular form field.
- We can integrate with any UI library.
- Provides schema validation
