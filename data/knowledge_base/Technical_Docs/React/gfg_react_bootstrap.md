# React Bootstrap Introduction

> Source: https://www.geeksforgeeks.org/reactjs/react-bootstrap-introduction/

The most popular CSS framework for responsive layouts is Bootstrap. This open-source toolkit includes Sass variables, a responsive grid framework, and a large number of JavaScript plugins. It has now been redesigned in React so that it can work with React apps. Bootstrap 4 relies on jQuery, however, jQuery isn't ideal for React because it manipulates the DOM directly, whereas React works with a virtual DOM. This leads to need of a module called React Bootstrap which effectively integrates Bootstrap with React
What is React Bootstrap ?
React Bootstrap is a replacement of Bootstrap JavaScript which effectively embeds Bootstrap components into a React Application without the need of external libraries like JQuery. Each component of React Bootstrap is a true React Component and this module is one of the oldest React libraries which keeps evolving with time and helps to create an excellent UI.
Why React Bootstrap?
Since React Bootstrap completely re-implements Bootstrap components and has no dependency so it does not completely manipulate the DOM on minor changes and only the required component gets re-rendered which makes it completely suitable to React architecture and UI can be easily created without the need of writing extra coding.
React Bootstrap vs Bootstrap Alone
Using plain Bootstrap requires a lot of coding and a good knowledge of JavaScript and JQuery and we have to write multiple lines of code to implement our custom design in React Application whereas React Bootstrap encapsulates all the JavaScript code into small components which can be easily manipulated and used according to our needs.
React-Bootstrap Terminologies
Component Library
Components are elements which can be reused and helps to build basic blocks of a websites frontend. A Component Library is a collections of components usually cloud-based which can be used by developers to create webpages.
CDN (Content Delivery Network)
A CDN is a group of servers which work together to provide internet content at a high speed. It generally loads assests such as HTML pages, stylesheets, images etc.
npm (Node Package Manager)
NPM (Node Package Manager) is the default package manager for Node.js and is written entirely in Javascript. It contains all the files needed for a module and modules are the JavaScript libraries that can be included in Node project according to the requirement of the project.
Important React Bootstrap Components
Accordion
Accordion Component provides a way to control our card components so that we can open them one at a time. It helps to display text on screen without making huge block of texts
Breadcrumb
Breadcrumb Component provides a way to indicate the location of the current page and that too within a navigational hierarchy. It helps in easy navigation of the website
React-Bootsrap NavBar
NavBar Component is a navigation header that is responsive and powerful. It supports navigation, branding, and many more other related features. It gives options for positioning, composition and menu selections
Features of React-Bootstrap
- React Bootstrap helps to create interactive and responsive web applications
- Components of React bootstrap do not have any dependency on libraries of JavaScript which makes them lightweight and easy to use
- Components do cause re-rendering of the entire application when updated so it makes the webpages faster and easy to navigate
- React Bootstrap Components are customizable which allows developers to create their own custom themes.
How to setup and use React-Bootstrap ?
Installing React Bootstrap: We can install it using npm or yarn.
npm install react-bootstrap
Now let’s understand the working of React Bootstrap using an example.
Creating react app: To build a react application follow the below steps:
Step 1: Create a react application using the following command
npx create-react-app foldername
Step 2: Once it is done change your directory to the newly created application using the following command
cd foldername
Step 3: Install Bootstrap dependency
npm install bootstrap
Project Structure: It will look like the following.
Example: In this example, we will create an animated progress bar using react-bootstrap.
// App.js
import Progress from "./Progress";
function App() {
return (
	<div className="App">
	<Progress />
	</div>
);
}
export default App;
// Progress.js
import React from "react";
import ProgressBar from 'react-bootstrap/ProgressBar'
function Progress() {
	return (
		<div>
			<h1 style={{ color: 'green' }}>
				<center>GeeksforGeeks</center>
			</h1>
			<div class="container">
			<div className="progress-bar bg-primary
							progress-bar-striped
							progress-bar-animated"
							style={{width:'50%'}}>50%</div>
			<br></br>
			<div className="progress-bar bg-success
							progress-bar-striped
							progress-bar-animated"
							style={{width:'90%'}}>90%</div>
			<br></br>
			<div className="progress-bar bg-warning
							progress-bar-striped
							progress-bar-animated"
							style={{width:'30%'}}>30%</div>
			<br></br>
			<div className="progress-bar bg-danger
							progress-bar-striped
							progress-bar-animated"
							style={{width:'10%'}}>10%</div>
			<br></br>
			<div className="progress-bar bg-info
							progress-bar-striped
							progress-bar-animated"
							style={{width:'70%'}}>70%</div>
			</div> 
		</div>
	)
}
export default Progress;
Step to run the Application: Enter the following command to run the application.
npm start
Output:
