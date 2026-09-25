# Survey Website using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/survey-website-using-reactjs/

In this article, we will create a survey website template using ReactJS. This project basically creates a single page website which will take input from user in multiple states and stores it to be displayed later. The user has to enter basic details like name, email-Id and contact number. After filling all of these, only then user will be allowed to answer next questions. Information filled by user will be displayed to user for conformation, which user has to conform and submit. All the logic and backend of website is done using JSX.
Final Output of Website will look something like this:
Technologies Used/Pre-requisites
Approach:
In order to create a multi state survey application in react we start by creating all form components required. We create a 'basicDetails' component which will take basic details of user and store it. We will create a questionnaire next which contain survey questions. Third page will display all details entered by user, and a submit button to conform submission which redirects us to 'ThankYou' page. We will also have additional components such as 'Header', 'Footer' and 'About' sections. We will create a backend by 'useState' hook to take values for all inputs in forms, and make sure they are changed before the final 'EnteredDetails' page by implementing 'useEffect' hook. For storing temporary data we will use localStorage to store user data. Styling will be done by using Bootstrap. We will navigate in our website using 'react-router-dom' package of React.
Steps to create the application:
Step 1: Setup React Project: Open a terminal and run following command to create a new React project (enter name of the project in '< >')
npm create vite@latest <name-of-project> --template react
Step 2: Change Directory: Go to directory of project.
cd <<name of project>>
Step 3: Install router package: Install React router package, which will enable us navigating in our website.
npm install react-router-dom
Step 4: Import Bootstrap css and js import files from Bootstrap website into the index.html in public folder, which will enable us to use styles and methods of Bootstrap.
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
rel="stylesheet"
integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
crossorigin="anonymous">
</script>
Step 5: Create a folder called Components in src directory and create the files About.js, AdditionalQuestions.js, BasicInfo.js, EnteredDetails.js, Footer.js, Header.js, ThankYouPage.js
Project Structure:
The dependencies in 'package.json' should look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-router-dom": "^6.14.1",
"vite": "^4.1.0",
"bootstrap": "^5.0.2"
}
Example: Write the following code in respective files:
- App.js: This file imports all the components and renders it on the webpage
- App.css: This file contains the styling of the application.
/* App.css */
body{
  background-color: #F2EAD3;
}
.navbar{
  width : 59vw;
  text-decoration: none;
  height: 5vh;
  top: 0%;
  position: fixed;
}
.qform{
  margin-top: 10vh;
  margin-bottom: 5vh;
  z-index: 0;
}
.badge{
  color: black;
  
}
.footer {
  background-color: green;
  position: fixed;
  width: 100%;
  bottom: 0;
  color: white;
}
// App.js
import './App.css';
import React, { useEffect, useState } from 'react';
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom';
import BasicInfo from './Components/BasicInfo';
import AdditionalQuestions from './Components/AdditionalQuestions';
import EnteredDetails from './Components/EnteredDetails';
import ThankYouPage from './Components/ThankYouPage';
import { About } from './Components/About';
function App() {
  // Initialize basicData state from localStorage or an empty object
  const initBasicData = JSON.parse(localStorage.getItem('data')) || {};
  // Initialize questionData state from localStorage or an empty object
  const initQuestionsData = JSON.parse(localStorage.getItem('questiondata')) || {};
  // Set up state hooks for basicData and questionData
  const [basicData, setBasicData] = useState(initBasicData);
  const [questionData, setQuestionData] = useState(initQuestionsData);
  // Update localStorage whenever basicData changes
  useEffect(() => {
    localStorage.setItem('data', JSON.stringify(basicData));
  }, [basicData]);
  // Update localStorage whenever questionData changes
  useEffect(() => {
    localStorage.setItem('questiondata', JSON.stringify(questionData));
  }, [questionData]);
  // Function to add basicData to state and localStorage
  const addBasicData = (name, email, contact) => {
    // Create an object with the provided basic data
    const myBasicData = {
      name: name,
      email: email,
      contact: contact
    };
    // Update the basicData state with the new data
    setBasicData(myBasicData);
    // Update the localStorage with the new basicData
    localStorage.setItem("data", JSON.stringify(myBasicData));
  }
  // Function to add questionData to state and localStorage
  const addQuestionData = (profession, interest, reference) => {
    // Create an object with the provided question data
    const myQuestionData = {
      profession: profession,
      interest: interest,
      reference: reference
    };
    // Update the questionData state with the new data
    setQuestionData(myQuestionData);
    // Update the localStorage with the new questionData
    localStorage.setItem("questiondata", JSON.stringify(myQuestionData));
  }
  // Render the application
  return (
    <Router>
      {/* Define the routes */}
      <Routes>
        {/* Render the BasicInfo component with the addBasicData function */}
        <Route path='/' element={<BasicInfo addBasicData={addBasicData} />} />
        {/* Render the AdditionalQuestions component with the addQuestionData function */}
        <Route
          path='/questions'
          element={<AdditionalQuestions addQuestionData={addQuestionData} />}
        />
        {/* Render the EnteredDetails component with basicData and questionData */}
        <Route
          path='/details'
          element={<EnteredDetails data={basicData} questiondData={questionData} />}
        />
        {/* Render the ThankYouPage component */}
        <Route
          path='/thanks'
          element={<ThankYouPage />}
        />
        {/* Render the About component */}
        <Route
          path='/about'
          element={<About />}
        />
      </Routes>
    </Router>
  );
}
// Export the App component as the default export
export default App;
Write the following code in files created in the Components folder
- BasicInfo.js: Here the user's basic information is collected
- AdditionalQuestions.js: Here, extra information provided by user is collected
- EnteredDetails.js: Here, the details entered are shown again after all the data is submitted
- Header.js: This component displays the header of the webpage
- Footer.js: This component displays the footer of the webpage
- ThankYouPage.js: This page displays after all the information is collected
- About.js: Extra information about webpage is shown in this page.
// BasicInfo.js
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
export default function BasicInfo({ addBasicData }) {
  // State variables to store user input
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [contact, setContact] = useState("");
  
  // Navigation function for programmatic routing
  const navigate = useNavigate();
  // Function to handle form submission
  const submit = (e) => {
    e.preventDefault();
    if (!name || !email || !contact) {
      // Alert if any field is missing
      alert("All fields necessary!");
    } else {
      // Call the addBasicData function provided by the parent component
      addBasicData(name, email, contact);
      // Navigate to the '/questions' route
      navigate('/questions');
    }
  }
  return (
    <div className="container-fluid qform">
      <div className="col-md-5 m-auto">
        <div className="mt-3">
          <div className="card text-left h-100">
            <div className="card-body my-3">
              <form onSubmit={submit}>
                <label htmlFor="">
                  <h4>Basic Details</h4>
                </label>
                <div className="form-group my-3">
                  <label htmlFor="">
                    <b>1.</b> Name
                  </label>
                  {/* Input field for name */}
                  <input
                    type="text"
                    name="name"
                    value={name}
                    onChange={(e) => { setName(e.target.value) }}
                    className='form-control my-2'
                    placeholder='Enter your Name'
                    autoComplete='off'
                  />
                </div>
                <div className="form-group my-3">
                  <label htmlFor="">
                    <b>2.</b> Email
                  </label>
                  {/* Input field for email */}
                  <input
                    type="email"
                    name='email'
                    value={email}
                    onChange={(e) => { setEmail(e.target.value) }}
                    className='form-control my-2'
                    placeholder='Enter your Email'
                    autoComplete='off'
                  />
                </div>
                <div className="form-group my-3">
                  <label htmlFor="">
                    <b>3.</b> Contact No.
                  </label>
                  {/* Input field for contact number */}
                  <input
                    type="tel"
                    name='contact'
                    value={contact}
                    onChange={(e) => { setContact(e.target.value) }}
                    className='form-control my-2'
                    placeholder='Enter your Contact No.'
                    autoComplete='off'
                  />
                </div>
                {/* Submit button */}
                <button type='submit' className='btn btn-success mx-3'>Next</button>
              </form>
              {/* Step indicators */}
              <center>
                <span className="badge badge-pill bg-success"><b>1</b></span>
                <span className="badge rounded-pill disabled">2</span>
                <span className="badge rounded-pill disabled">3</span>
              </center>
            </div>
          </div>
        </div>
      </div>
    </div>
  )
}
// AdditionalQuestions.js
import React, { useState } from 'react';
import { useNavigate } from 'react-router-dom';
export default function AdditionalQuestions({ addQuestionData }) {
  // State variables to store user inputs
  const [profession, setProfession] = useState("");
  const [interest, setInterest] = useState("");
  const [reference, setReference] = useState("");
  const [otherProfession, setOtherProfession] = useState("");
  const [otherInterest, setOtherInterest] = useState("");
  const [otherReference, setOtherReference] = useState("");
  
  const navigate = useNavigate();
  // Function to handle form submission
  const submit = (e) => {
    e.preventDefault();
    // Check if all fields are filled
    if (!profession || !interest || !reference) {
      alert("All fields necessary!");
    } else {
      // If the selected option is "Others", use the value from the corresponding text input
      if (profession === "Others") {
        profession = otherProfession;
      }
      if (interest === "Others") {
        interest = otherInterest;
      }
      if (reference === "Others") {
        reference = otherReference;
      }
      // Log the selected options and call the addQuestionData function with the data
      console.log(profession, interest, reference);
      addQuestionData(profession, interest, reference);
      // Navigate to the next page
      navigate('/details');
    }
  };
  // Event handler for changes in the profession radio buttons
  const handleProfessionChange = (e) => {
    setProfession(e.target.value);
  };
  // Event handler for changes in the interest radio buttons
  const handleInterestChange = (e) => {
    setInterest(e.target.value);
  };
  // Event handler for changes in the reference radio buttons
  const handleReferenceChange = (e) => {
    setReference(e.target.value);
  };
  return (
    <div className="container-fluid qform">
      <div className="col-md-5 m-auto">
        <div className="mt-3">
          <div className="card text-left h-100">
            <div className="card-body">
              <form onSubmit={submit}>
                <label htmlFor="">
                  <h4>Additional Questions</h4>
                </label>
                {/* Profession options */}
                <div className="form-group m-2" onChange={handleProfessionChange}>
                  <label htmlFor="q1">
                    <b>1.</b> What is your profession?
                  </label>
                  <br />
                  <input
                    type="radio"
                    name="ProfessionRadio"
                    id="student"
                    autoComplete="off"
                    className="m-2"
                    value="Student"
                  />
                  <label htmlFor="student"> Student</label>
                  <br />
                  {/* Other options for profession with text input */}
                  <input
                    type="radio"
                    name="ProfessionRadio"
                    id="sde"
                    autoComplete="off"
                    className="m-2"
                    value="Software Engineer"
                  />
                  <label htmlFor="sde"> Software Engineer</label>
                  <br />
                  <input
                    type="radio"
                    name="ProfessionRadio"
                    id="teacher"
                    autoComplete="off"
                    className="m-2"
                    value="Teacher"
                  />
                  <label htmlFor="teacher"> Teacher</label>
                  <br />
                  <input
                    type="radio"
                    name="ProfessionRadio"
                    id="others"
                    autoComplete="off"
                    className="m-2"
                    value="Others"
                  />
                  <label htmlFor="others">  Others:</label>
                  <input
                    type="text"
                    id="otherProfession"
                    autoComplete="off"
                    className="form-control m-2"
                    value={otherProfession}
                    onChange={(e) => { setOtherProfession(e.target.value) }}
                  />
                  <hr />
                </div>
                {/* Interest options */}
                <div className="form-group m-2" onChange={handleInterestChange}>
                  <label htmlFor="q2">
                    <b>2.</b> What are your interests?
                  </label>
                  <br />
                  <input
                    type="radio"
                    name="interestRadio"
                    id="dsa"
                    autoComplete="off"
                    className="m-2"
                    value="DSA"
                  />
                  <label htmlFor="dsa"> DSA</label>
                  <br />
                  {/* Other options for interest with text input */}
                  <input
                    type="radio"
                    name="interestRadio"
                    id="fullstack"
                    autoComplete="off"
                    className="m-2"
                    value="Full Stack Development"
                  />
                  <label htmlFor="fullstack"> Full Stack Development</label>
                  <br />
                  <input
                    type="radio"
                    name="interestRadio"
                    id="dataScience"
                    autoComplete="off"
                    className="m-2"
                    value="Data Science"
                  />
                  <label htmlFor="dataScience"> Data Science</label>
                  <br />
                  <input
                    type="radio"
                    name="interestRadio"
                    id="compeProgramming"
                    autoComplete="off"
                    className="m-2"
                    value="Competitive Programming"
                  />
                  <label htmlFor="compeProgramming"> Competitive Programming</label>
                  <br />
                  <input
                    type="radio"
                    name="interestRadio"
                    id="others"
                    autoComplete="off"
                    className="m-2"
                    value="Others"
                  />
                  <label htmlFor="others"> Others:</label>
                  <input
                    type="text"
                    id="otherInterest"
                    autoComplete="off"
                    className="form-control m-2"
                    value={otherInterest}
                    onChange={(e) => { setOtherInterest(e.target.value) }}
                  />
                  <hr />
                </div>
                {/* Reference options */}
                <div className="form-group m-2" onChange={handleReferenceChange}>
                  <label htmlFor="q3">
                    <b>3.</b> Where did you hear about us?
                  </label>
                  <br />
                  <input
                    type="radio"
                    name="referenceRadio"
                    id="news"
                    autoComplete="off"
                    className="m-2"
                    value="News Paper"
                  />
                  <label htmlFor="news"> News Paper</label>
                  <br />
                  <input
                    type="radio"
                    name="referenceRadio"
                    id="LinkedIn"
                    autoComplete="off"
                    className="m-2"
                    value="LinkedIn"
                  />
                  <label htmlFor="LinkedIn"> LinkedIn</label>
                  <br />
                  <input
                    type="radio"
                    name="referenceRadio"
                    id="Instagram"
                    autoComplete="off"
                    className="m-2"
                    value="Instagram"
                  />
                  <label htmlFor="Instagram"> Instagram</label>
                  <br />
                  <input
                    type="radio"
                    name="referenceRadio"
                    id="others"
                    autoComplete="off"
                    className="m-2"
                    value="Others"
                  />
                  <label htmlFor="others"> Others:</label>
                  <input
                    type="text"
                    id="otherReference"
                    autoComplete="off"
                    className="form-control m-2"
                    value={otherReference}
                    onChange={(e) => { setOtherReference(e.target.value) }}
                  />
                  <br />
                </div>
                {/* Submit button */}
                <button type="submit" className="btn btn-success mx-3">
                  Next
                </button>
              </form>
              {/* Progress indicators */}
              <center>
                <span className="badge rounded-pill disabled">1</span>
                <span className="badge badge-pill bg-success">
                  <b>2</b>
                </span>
                <span className="badge rounded-pill disabled">3</span>
              </center>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
// EnteredDetails.js
import { useNavigate } from 'react-router-dom';
export default function EnteredDetails(props) {
  const navigate = useNavigate();
  // Function to handle form submission
  const submit = () => {
    console.log(props.data); // Log basicData object
    console.log(props.questiondData); // Log questionData object
    navigate('/thanks'); // Navigate to the thanks page
  };
  return (
    <div className="container-fluid qform">
      <div className="col-md-5 m-auto">
        <div className="mt-3">
          <div className="card text-left h-100">
            <div className="card-body my-3">
              <h4>Entered Details</h4>
              {/* Display basicData */}
              <p>
                <b>Name:</b> {props.data.name}
              </p>
              <p>
                <b>Email:</b> {props.data.email}
              </p>
              <p>
                <b>Contact No.:</b> {props.data.contact}
              </p>
              <h4>Responses</h4>
              {/* Display questionData */}
              <p>
                <b>Profession:</b> {props.questiondData.profession}
              </p>
              <p>
                <b>Interests:</b> {props.questiondData.interest}
              </p>
              <p>
                <b>Reference:</b> {props.questiondData.reference}
              </p>
              {/* Submit button */}
              <button type="submit" onClick={submit} className="btn btn-success">
                Submit
              </button>
              {/* Page numbers */}
              <center>
                <span className="badge rounded-pill disabled">1</span>
                <span className="badge rounded-pill disabled">2</span>
                <span className="badge badge-pill bg-success">
                  <b>3</b>
                </span>
              </center>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
// ThankYouPage.js
import React from 'react';
function ThankYouPage() {
  return (
    <div className="container-fluid qform">
            <div className="col-md-5 m-auto">
                <div className="mt-3">
                    <div className="card text-left h-100">
                        <div className="card-body my-3">
                            <h3>Thank You for your Response!</h3>
                            <h6>You may close this tab now.</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
  );
}
export default ThankYouPage;
// About.js
import React from 'react'
export const About = () => {
  return (
    <div className='text-center qform'>
        <h3>This is About Section</h3>
        <p>This is a survey website example using ReactJS</p>
    </div>
  )
}
Steps to run the application:
Step 1: To run website, open a terminal in directory of website and run following command.
npm run dev
Step 2: Open web browser and type the following URL( Default):
http://localhost:5173/
Output:
