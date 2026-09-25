# Webpage using parallax in React

> Source: https://www.geeksforgeeks.org/reactjs/webpage-using-parallax-in-react/

In this example, we will see how we can implement the webpage using parallax in React. Parallax involves the movement of background elements at different speeds as the user scrolls, providing a 3D-like experience. This effect adds a visually appealing depth to the webpage as you scroll, making it more interactive and engaging for the user.
Preview of final output: Let us have a look at how the final application will look like.
Prerequisites:
- Node JS
- npm (Node Package Manager)
- React
- CSS Parallax
Steps to create React App
Step 1: Create a React App
npm create vite@latest my-app --template react
cd my-app
Step 2: Install styled-components and react-parallax
npm install styled-components
npm install react-parallax
Note: A parallax effect is produced by the project using styled-components-styled React components. The sense of depth and immersion is created as the user scrolls down by multiple levels with differing depths moving at varied speeds.
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"@vitejs/plugin-react": "^3.0.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-parallax": "^3.5.1",
"styled-components": "^6.1.1",
"vite": "^4.0.0"
}
Example: In this example we will see the implementation of above approach.
//Home.jsx
import React from "react";
import "./App.css"
import { Parallax } from "react-parallax";
const Home = () => {
	return (
		<div>
			<h1 style={{ textAlign: "center", color: "green" }}>
				GeeksforGeeks
			</h1>
			<h1 style={{ textAlign: "center", color: "black" }}>
				Parallax Page
			</h1>
			<div className="container">
				<Parallax
					bgImage=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230202143636/NEXT-js-tutorial-1.png"
					strength={200} style={{
						// width:"50vw",
						height: "100vh",
						backgroundSize: "cover",
						backgroundRepeat: "no-repeat",
					}}>
					<div style={{ height: 400 }}>
						<p>Text Here</p>
					</div>
				</Parallax>
				<Parallax
					bgImage=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230310153232/ReactJS-Tutorial.jpg"
					strength={200} style={{
						height: "100vh",
						backgroundSize: "cover",
						backgroundRepeat: "no-repeat",
					}}>
					<div style={{ height: 400 }}>
						<p>Text Here</p>
					</div>
				</Parallax>
				<Parallax
					bgImage=
"https://media.geeksforgeeks.org/wp-content/uploads/20230427130955/CSS-Tutorial.webp"
					strength={200} style={{ marginTop: "2rem" }} style={{
						// width:"50vw",
						height: "100vh",
						backgroundSize: "cover",
						backgroundRepeat: "no-repeat",
					}} >
					<div style={{ height: 400 }}>
						<p>Text Here</p>
					</div>
				</Parallax>
				<Parallax
					bgImage=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230310132605/Bootstrap-Tutorial.jpg"
					strength={200} style={{
						marginTop: "2rem", height: "100vh",
						backgroundSize: "cover",
						backgroundRepeat: "no-repeat",
					}}>
					<div style={{ height: 400 }}>
						<p>Text Here</p>
					</div>
				</Parallax>
			</div>
			<h1 style={{ textAlign: "center", color: "black", marginTop: "-95px" }}>
				Thank You!
			</h1>
		</div>
	);
};
export default Home;
// App.jsx
import React from 'react';
import Home from './Home.';
import "./App.css"
function App() {
return (
	<div className="App">
	<Home />
	</div>
);
}
export default App;
Steps to Run the Application:
Step 1: Start Development Server
npm run dev   Step 2: Open the browser and navigate to http://localhost:5173.
Output:
