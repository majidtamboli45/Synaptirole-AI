# Crowdfunding App using React

> Source: https://www.geeksforgeeks.org/reactjs/crowdfunding-app-using-react/

In this article, we will create a Crowdfunding App using React. The React crowdfunding app features multiple projects, each with a set fundraising goal. Users can contribute by entering donation amounts, and the app dynamically tracks progress toward each goal.
Preview of final output: Let us have a look at how the final output will look like:
Prerequisites:
Approach to create Crowdfunding App using React:
Here, a step-by-step approach for creating the Crowdfunding App project using React with a congratulatory message when the goal is reached:
- Set up a React app with multiple crowdfunding projects, each having a predefined fundraising goal.
- Users can contribute funds by entering donation amounts through a user-friendly interface.
- Dynamically track the progress of each project's fundraising goal based on user contributions.
- Implement validation checks to ensure users enter valid donation amounts.
- When a project's fundraising goal is met or exceeded, prompt the user for a valid goal amount.
- Display a congratulatory message when a project successfully reaches its fundraising target.
Steps to Create the React App:
Step 1: Create a new React project using Create React App.
npm create vite@latest << Project Name >> --template react
Step 2: Navigate to the project folder using
 cd << Project Name >>
Step 3: Install dependencies.
npm install
Step 4: Create a folder “components” in src file and add three new folders in it and name them as DonationForm, Project and Footer.
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
}
Example: Below is the code for the Crowdfunding App using React
/* App.css */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f0f0f0;
    text-align: center;
}
h1 {
    color: green;
    font-size: 40px;
    text-align: center;
    padding: 10px 10px;
}
.project-container {
    max-width: 85%;
    height: auto;
    margin: 0px auto;
    padding: 10px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    border: 3px solid green;
    box-shadow: 5px 5px 5px 0px rgb(6, 161, 19);
}
.project-list {
    display: grid;
    justify-content: space-between;
    align-items: center;
    grid-template-columns: repeat(2, 1fr);
    margin: 0px 10px;
    height: fit-content;
}
.project-container h1 {
    border: 2px solid red;
    color: rgb(39, 10, 105);
    margin: 10px 20px;
    border-radius: 10px;
    background-color: rgb(228, 236, 182);
}
.project {
    height: 90%;
    margin: 5px 15px;
    padding: 15px;
    border: 2px solid rgb(0, 26, 255);
    box-shadow: 0px 0px 5px 2px blue;
    border-radius: 8px;
    background-color: #f8f8f8;
}
.project:hover {
    border: 2px solid rgb(196, 8, 96);
    transform: scale(1.05);
    box-shadow: 0px 0px 5px 2px rgb(255, 0, 234);
}
.project-number {
    font-size: 30px;
    font-weight: 900;
    color: rgb(236, 32, 5);
    margin-bottom: 10px;
}
.project h2 {
    color: rgb(160, 35, 154);
    font-size: 25px;
}
.project p {
    color: rgb(255, 8, 132);
    font-size: 23px;
    font-family: 800;
}
.form-sect {
    margin: 0px;
}
input {
    height: 25px;
    width: 60%;
    border: 2px solid;
    border-radius: 5px;
    font-size: 15px;
    font-weight: 900;
    margin-right: 10px;
    padding-left: 10px;
}
button {
    border: 2px solid rgb(5, 57, 199);
    border-radius: 5px;
    height: 30px;
    font-size: large;
    padding: 3px 10px;
    font-weight: 800;
    background-color: rgba(10, 202, 202, 0.705);
}
button:hover {
    background-color: rgb(4, 253, 241);
    box-shadow: 3px 3px 2px 0px rgb(6, 156, 243);
}
.goal-reached h2 {
    color: rgb(179, 42, 18);
}
.goal-reached p {
    color: rgb(179, 42, 18);
    font-size: 25px;
    font-weight: 900;
}
/* ================== Media Query(Small Devices) ============== */
@media screen and (max-width: 650px) {
    .project-list {
        grid-template-columns: repeat(1, 1fr);
        height: fit-content;
    }
    input {
        margin-bottom: 5px;
    }
}
/* footer.css */
.footer {
    width: 100%;
    background-color: rgb(15, 14, 14);
    text-align: center;
    padding: 10px 0;
    display: flex;
    align-items: center;
    justify-content: center;
    bottom: 0;
    margin-top: 30px;
}
h2 {
    color: white;
}
// App.js
import React from 'react';
import Project from './components/Project';
import './App.css';
import Footer from './components/Footer'
const App = () => {
	return (
		<>
			<h1>GeeksForGeeks</h1>
			<div className='project-container'>
				<h1>CrowdFunding</h1>
				<div className="project-list">
					<Project goal={1000} projectNumber={1} />
					<Project goal={500} projectNumber={2} />
					<Project goal={2000} projectNumber={3} />
					<Project goal={1500} projectNumber={4} />
				</div>
			</div>
			<Footer />
		</>
	);
};
export default App;
// DonationForm.js
import React, { useState } from 'react';
const DonationForm = (
	{
		onDonate, goal,
		amountRaised
	}) => {
	const [donationAmount, setDonationAmount] = useState("");
	const [goalReached, setGoalReached] = useState(false);
	const handleDonate = () => {
		if (donationAmount <= 0) {
			alert('Please enter a valid donation amount.');
		} else {
			onDonate(donationAmount);
			setDonationAmount("");
		}
	};
	const remainingAmount = goal - amountRaised;
	if (remainingAmount <= 0 && !goalReached) {
		setGoalReached(true);
	}
	return (
		<div className="form-section">
			{goalReached ? (
				<div className="goal-reached">
					<h2>Congratulations! Goal Reached!</h2>
					<p>Thank You for the Support</p>
				</div>
			) : (
				<div>
					<input
						type="number"
						placeholder='Enter Amount here'
						value={donationAmount}
						onChange={
							(e) =>
								setDonationAmount(parseInt(e.target.value, 10))
						} />
					<button onClick={handleDonate}>
						Donate
					</button>
					{amountRaised >= goal && <p>
						Congratulations! Goal achieved.
					</p>
					}
					{amountRaised < goal && (
						<p>Remaining amount needed:
							${remainingAmount}</p>
					)}
				</div>
			)}
		</div>
	);
};
export default DonationForm;
// Project.js
import React, { useState } from 'react';
import DonationForm from './DonationForm';
import '../App.css';
const Project = ({ goal, projectNumber }) => {
	const [amountRaised, setAmountRaised] = useState(0);
	const handleDonation = (donationAmount) => {
		const newAmount = amountRaised + donationAmount;
		if (amountRaised + donationAmount > goal) {
			alert(`Thank you for contributing, 
				but we need Remaining Amount.`);
			return;
		}
		if (newAmount > goal) {
			alert('Congratulations! Goal achieved.');
			// You can add additional logic here (e.g., closing donations).
		} else {
			setAmountRaised(newAmount);
		}
	};
	return (
		<div className="project">
			<div className="project-number">Project {projectNumber}</div>
			<h2>Project Goal: ${goal}</h2>
			<p>Amount Raised: ${amountRaised}</p>
			<DonationForm onDonate={handleDonation}
				goal={goal} amountRaised={amountRaised} />
		</div>
	);
};
export default Project;
// footer.jsx
import React from 'react'
import './Footer.css';
function footer() {
return (
	<div className='footer'>
		<h2> © 2024 CrwodFunding. All rights reserved.</h2>
		</div>
)
}
export default footer
Output:
