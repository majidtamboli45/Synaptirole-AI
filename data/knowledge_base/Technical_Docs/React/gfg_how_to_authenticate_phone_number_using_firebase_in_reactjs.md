# How to authenticate phone number using firebase in ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-authenticate-phone-number-using-firebase-in-reactjs/

User authentication is a critical aspect of many web applications, and phone number authentication has become increasingly popular for its convenience and security. Firebase, a powerful platform developed by Google, offers various authentication methods, including phone number authentication.
Prerequisites
Approach
To authenticate phone numbers using Firebase in React JS we will install the Firebase module and configure the credentials. Create a login form component that accepts the phone number and authenticate it using the Firebase.
Steps to create React Application
Step 1: Create a React myapp using the following command:
npx create-react-app myapp
Step 2: After creating your project folder i.e. myapp, move to it using the following command:
cd myapp
Project Structure:
Step 3: After creating the ReactJS application, Install the firebase module using the following command:
npm i --save firebase@8.3.1  react-firebase-hooks
Dependencies list after installing packages
{
"dependencies": {
"@testing-library/jest-dom": "^5.17.0",
"@testing-library/react": "^13.4.0",
"@testing-library/user-event": "^13.5.0",
"firebase": "^8.3.1",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-firebase-hooks": "^5.1.1",
"react-scripts": "5.0.1",
"web-vitals": "^2.1.4"
}
}
Step 4: Go to your firebase dashboard and create a new project and copy your credentials.
const firebaseConfig = {
apiKey: "your api key",
authDomain: "your credentials",
projectId: "your credentials",
storageBucket: "your credentials",
messagingSenderId: "your credentials",
appId: "your credentials"
};
Example: It shows alogin form acception number input to authenticate using the firebase by sending an OTP.
// Filename - App.js
import React from "react";
import { auth } from "./firebase";
import { useAuthState } from "react-firebase-hooks/auth";
import Login from "./login";
import Mainpage from "./main";
function App() {
    const [user] = useAuthState(auth);
    return user ? <Mainpage /> : <Login />;
}
export default App;
// Filename - main.js
import React from "react";
import { auth } from "./firebase";
const Mainpage = () => {
    const logout = () => {
        auth.signOut();
    };
    return (
        <div style={{ marginTop: 250 }}>
            <center>
                <h3>
                    Welcome 
                    {auth.currentUser.phoneNumber}
                </h3>
                <button
                    style={{ marginLeft: "20px" }}
                    onClick={logout}
                >
                    Logout
                </button>
            </center>
        </div>
    );
};
export default Mainpage;
// Filename - login.js
import React, { useState } from "react";
import { firebase, auth } from "./firebase";
const Login = () => {
    // Inputs
    const [mynumber, setnumber] = useState("");
    const [otp, setotp] = useState("");
    const [show, setshow] = useState(false);
    const [final, setfinal] = useState("");
    // Sent OTP
    const signin = () => {
        if (mynumber === "" || mynumber.length < 10) return;
        let verify = new firebase.auth.RecaptchaVerifier(
            "recaptcha-container"
        );
        auth.signInWithPhoneNumber(mynumber, verify)
            .then((result) => {
                setfinal(result);
                alert("code sent");
                setshow(true);
            })
            .catch((err) => {
                alert(err);
                window.location.reload();
            });
    };
    // Validate OTP
    const ValidateOtp = () => {
        if (otp === null || final === null) return;
        final
            .confirm(otp)
            .then((result) => {
                // success
            })
            .catch((err) => {
                alert("Wrong code");
            });
    };
    return (
        <div style={{ marginTop: "200px" }}>
            <center>
                <div
                    style={{
                        display: !show ? "block" : "none",
                    }}
                >
                    <input
                        value={mynumber}
                        onChange={(e) => {
                            setnumber(e.target.value);
                        }}
                        placeholder="phone number"
                    />
                    <br />
                    <br />
                    <div id="recaptcha-container"></div>
                    <button onClick={signin}>
                        Send OTP
                    </button>
                </div>
                <div
                    style={{
                        display: show ? "block" : "none",
                    }}
                >
                    <input
                        type="text"
                        placeholder={"Enter your OTP"}
                        onChange={(e) => {
                            setotp(e.target.value);
                        }}
                    ></input>
                    <br />
                    <br />
                    <button onClick={ValidateOtp}>
                        Verify
                    </button>
                </div>
            </center>
        </div>
    );
};
export default Login;
// Filename - firebase.js
import firebase from 'firebase';
const firebaseConfig = {
    // Add your firebase credentials
    apiKey: "your api key",
    authDomain: "your credentials",
    projectId: "your credentials",
    storageBucket: "your credentials",
    messagingSenderId: "your credentials",
    appId: "your credentials"
};
firebase.initializeApp(firebaseConfig);
let auth = firebase.auth();
export { auth, firebase };
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output: Now open your browser and go to http://localhost:3000/, you will see the following output:
