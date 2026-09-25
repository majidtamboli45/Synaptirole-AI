# India Tourism Webite using React

> Source: https://www.geeksforgeeks.org/reactjs/india-tourism-webite-using-react/

This article guides you through building an engaging Indian tourism app using React, featuring destination exploration, travel experiences, and a visually appealing image carousel. Users can interact with the app and contact through a form, highlighting the beauty of India.
Preview of final output: Let us have a look at how the final output will look like.
Prerequisites
Approach to create India Tourism Website
- The app is structured with a navbar for easy navigation, a carousel to showcase beautiful images, and various routes for different sections like destinations and contact forms.
- React Bootstrap components are seamlessly integrated to enhance the overall user experience.
Steps to Create the React App
Step 1: Set up a new React project: Use the following command to create project:
npm create vite@latest india-tourism-app --template react
cd india-tourism-app
Step 2: Install React Router and React Bootstrap for enhanced functionality.
npm install react-router-dom react-bootstrap bootstrap
Step 3: Create DestinationList.js, DestinationDetail.js, ContactForm.js and destination.js under src.
Project Structure:
The updated dependencies in package.json file will look like:
"dependencies": {
"bootstrap": "^5.3.2",
"react": "^18.2.0",
"react-bootstrap": "^2.9.0",
"react-dom": "^18.2.0",
"react-router-dom": "^6.17.0",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
}
Example: Write the following code in respective files.
- DestinationDetail.js: The code defines a DestinationDetail component displaying details of a destination based on the provided match object and destination data.
  - It dynamically fetches the destination details using the destinationId from the URL parameters and renders information such as name, image, description, rating, and best time to visit.
  - Additionally, it includes a "Book Now" button (currently without functionality) within a styled container for a clean and consistent presentation of destination details.
- ContactForm.js: The code defines a ContactForm component using styled components for a styled form container, labels, inputs, textarea, and a submit button.
  - It creates a simple contact form with fields for name, email, and message, providing a clean and responsive design.
  - The form lacks a submit functionality, and submitting would typically involve integrating with a backend or API to handle the form data.
- DestinationList.js: The code defines a functional component DestinationList that renders a list of destinations using styled components for styling.
  - It utilizes React Router's Link component to navigate to detailed destination pages and includes a button to add/remove destinations from favorites.
  - State is managed using the useState hook, keeping track of favorite destinations based on user interaction.
- destination.js: The code defines an array of travel destinations, each represented by an object with properties like id, name, description, image, rating, and bestTime.
/* App.css */
.custom-navbar {
    background-color: #7fccff;
    padding: 10px 20px;
}
.brand-heading {
    font-size: 24px;
    font-weight: bold;
    color: #fff;
    text-decoration: none;
}
.nav-link,
.dropdown-item {
    color: #333;
    text-decoration: none;
    margin: 0 15px;
}
.nav-link:hover,
.dropdown-item:hover {
    color: #fff;
}
.custom-carousel {
    margin-top: 20px;
}
.carousel-image {
    height: 400px;
    object-fit: cover;
}
/* App.css */
/* ... Existing styles (unchanged) */
.custom-carousel {
    margin-top: 20px;
}
.carousel-image {
    height: 400px;
    object-fit: cover;
}
.custom-footer {
    background-color: #333;
    color: #fff;
    padding: 20px;
    display: flex;
    justify-content: space-around;
    align-items: flex-start;
    flex-wrap: wrap;
}
.footer-section {
    flex: 1 1 300px;
    margin: 10px;
}
.footer-section h3 {
    font-size: 18px;
}
.social-links {
    list-style: none;
    padding: 0;
}
.social-links li {
    margin-bottom: 8px;
}
.social-links a {
    text-decoration: none;
    color: #fff;
}
.social-links a:hover {
    text-decoration: underline;
}
form {
    display: flex;
    flex-direction: column;
}
input {
    margin-bottom: 10px;
    padding: 8px;
}
button {
    background-color: #3498db;
    color: #fff;
    border: none;
    padding: 10px;
    cursor: pointer;
}
button:hover {
    background-color: #2980b9;
}
/* App.css */
/* ... Existing styles (unchanged) */
.custom-carousel {
    margin-top: 20px;
}
.carousel-image {
    height: 400px;
    object-fit: cover;
}
.custom-footer {
    background-color: #333;
    color: #fff;
    padding: 20px;
    display: flex;
    justify-content: space-around;
    align-items: flex-start;
    flex-wrap: wrap;
}
.footer-section {
    flex: 1 1 300px;
    margin: 10px;
}
.footer-section h3 {
    font-size: 18px;
}
.social-links {
    list-style: none;
    padding: 0;
}
.social-links li {
    margin-bottom: 8px;
}
.social-links a {
    text-decoration: none;
    color: #fff;
}
.social-links a:hover {
    text-decoration: underline;
}
form {
    display: flex;
    flex-direction: column;
}
input {
    margin-bottom: 10px;
    padding: 8px;
}
button {
    background-color: #3498db;
    color: #fff;
    border: none;
    padding: 10px;
    cursor: pointer;
}
button:hover {
    background-color: #2980b9;
}
// App.js
import React from 'react';
import {
	BrowserRouter as Router,
	Routes, Route as RouteElement,
	Link
} from 'react-router-dom';
import {
	Navbar, Nav,
	NavDropdown, Carousel
} from 'react-bootstrap';
import DestinationList
	from './components/DestinationList';
import DestinationDetail
	from './components/DestinationDetail';
import ContactForm
	from './components/ContactForm';
// Import the custom CSS file
import './App.css';
const App = () => {
	return (
		<Router>
			<div>
				<Navbar className="custom-navbar" expand="lg">
					<Navbar.Brand className="brand-heading">
						INCREDIBLE INDIA
					</Navbar.Brand>
					<Navbar.Toggle aria-controls="basic-navbar-nav" />
					<Navbar.Collapse id="basic-navbar-nav">
						<Nav className="ml-auto">
							<Link to="/" className="nav-link">
								Home
							</Link>
							<Link to="/contact"
								className="nav-link">
								Contact
							</Link>
							<NavDropdown title="Explore"
								id="basic-nav-dropdown">
								<Link to="/travel"
									className="dropdown-item">
									Travel
								</Link>
								<Link to="/destinations"
									className="dropdown-item">
									Destinations
								</Link>
								<Link to="/experience"
									className="dropdown-item">
									Experience
								</Link>
							</NavDropdown>
						</Nav>
					</Navbar.Collapse>
				</Navbar>
				{/* Carousel */}
				<Carousel className="custom-carousel">
					<Carousel.Item>
						<img
							className="d-block w-100 carousel-image"
							src=
"https://media.geeksforgeeks.org/wp-content/uploads/20240105125520/1st.jpg"
							alt="First slide"/>
					</Carousel.Item>
					<Carousel.Item>
						<img
							className="d-block w-100 carousel-image"
							src=
"https://media.geeksforgeeks.org/wp-content/uploads/20240105125527/2nd.jpg"
							alt="Second slide"/>
					</Carousel.Item>
					<Carousel.Item>
						<img
							className="d-block w-100 carousel-image"
							src=
"https://media.geeksforgeeks.org/wp-content/uploads/20240105125534/3rd.jpg"
							alt="Third slide"/>
					</Carousel.Item>
					<Carousel.Item>
						<img
							className="d-block w-100 carousel-image"
							src=
"https://media.geeksforgeeks.org/wp-content/uploads/20240105125539/4th.jpg"
							alt="Fourth slide"/>
					</Carousel.Item>
				</Carousel>
				<br />
				{/* Content of your app (unchanged) */}
				<Routes>
					<RouteElement path="/"
						element={<DestinationList />} />
					<RouteElement path="/destination/:id"
						element={<DestinationDetail />} />
					<RouteElement path="/contact"
						element={<ContactForm />} />
					{/* Add routes for travel, destinations, and experience */}
				</Routes>
				{/* Footer */}
				<div className="custom-footer">
					<div className="footer-section">
						<h3>Connect with us</h3>
						<ul className="social-links">
							<li><a href="https://www.facebook.com/"
								target="_blank"
								rel="noopener noreferrer">
								Facebook
							</a>
							</li>
							<li><a href="https://twitter.com/"
								target="_blank"
								rel="noopener noreferrer">
								Twitter
							</a>
							</li>
							<li><a href="https://www.instagram.com/"
								target="_blank"
								rel="noopener noreferrer">
								Instagram
							</a>
							</li>
						</ul>
					</div>
					<div className="footer-section">
						<h3>Contact us</h3>
						<p>Email: contact@incredibleindia.com</p>
						<p>Phone: +91 123 456 7890</p>
					</div>
					<div className="footer-section">
						<h3>Newsletter</h3>
						<p>
							Subscribe to our newsletter
							for updates and offers.
						</p>
						<form>
							<input type="email" placeholder="Your email" />
							<button type="submit">Subscribe</button>
						</form>
					</div>
				</div>
			</div>
		</Router>
	);
}
export default App;
// DestinationDetail.js
import React from 'react';
import styled from 'styled-components';
import destinations from './Destinations';
const DetailContainer = styled.div`
max-width: 600px;
margin: auto;
`;
const DetailImage = styled.img`
width: 100%;
height: auto;
border-radius: 8px;
margin-bottom: 20px;
`;
const DetailButton = styled.button`
background: #3498db;
color: #fff;
border: none;
padding: 10px;
border-radius: 4px;
cursor: pointer;
`;
const DestinationDetail = ({ match }) => {
	const destinationId =
		parseInt(match.params.id);
	const destination =
		destinations.find(
			dest =>
				dest.id === destinationId
		);
	if (!destination) {
		return <div style={
			{
				textAlign: 'center'
			}}>
			Destination not found
		</div>;
	}
	return (
		<DetailContainer>
			<h2>{destination.name}</h2>
			<DetailImage src={destination.image}
				alt={destination.name} />
			<p>{destination.description}</p>
			<p>Rating:
				{destination.rating || 'Not available'}
			</p>
			<p>
				Best time to visit:
				{destination.bestTime || 'Not specified'}
			</p>
			<DetailButton>Book Now</DetailButton>
		</DetailContainer>
	);
};
export default DestinationDetail;
// ContactForm.js
import React from 'react';
import styled from 'styled-components';
const ContactContainer = styled.div`
max-width: 600px;
margin: auto;
padding: 20px;
box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
background-color: #fff;
border-radius: 8px;
margin-top: 50px;
`;
const Form = styled.form`
display: flex;
flex-direction: column;
`;
const Label = styled.label`
margin-bottom: 8px;
`;
const Input = styled.input`
padding: 10px;
margin-bottom: 16px;
border: 1px solid #ccc;
border-radius: 4px;
font-size: 16px;
`;
const TextArea = styled.textarea`
padding: 10px;
margin-bottom: 16px;
border: 1px solid #ccc;
border-radius: 4px;
font-size: 16px;
`;
const SubmitButton = styled.button`
background-color: #3498db;
color: #fff;
padding: 12px;
border: none;
border-radius: 4px;
cursor: pointer;
font-size: 16px;
`;
const ContactForm = () => {
	return (
		<ContactContainer>
			<h2>Contact Us</h2>
			<Form>
				<Label htmlFor="name">
					Name
				</Label>
				<Input type="text"
					id="name"
					name="name" required />
				<Label htmlFor="email">
					Email
				</Label>
				<Input type="email"
					id="email"
					name="email" required />
				<Label htmlFor="message">
					Message
				</Label>
				<TextArea id="message"
					name="message"
					rows="4" required />
				<SubmitButton type="submit">
					Submit
				</SubmitButton>
			</Form>
		</ContactContainer>
	);
};
export default ContactForm;
// DestinationList.js
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';
import destinations from './Destinations';
const List = styled.ul`
list-style: none;
padding: 0;
display: flex;
justify-content: space-around;
flex-wrap: wrap;
`;
const ListItem = styled.li`
margin-bottom: 20px;
text-align: center;
`;
const Image = styled.img`
width: 100%;
height: auto;
border-radius: 8px;
`;
const Button = styled.button`
background: #3498db;
color: #fff;
border: none;
padding: 5px 10px;
border-radius: 4px;
cursor: pointer;
`;
const DestinationList = () => {
	const [favorites, setFavorites] = useState([]);
	const toggleFavorite = (id) => {
		if (favorites.includes(id)) {
			setFavorites(
				favorites
					.filter(favId =>
						favId !== id)
			);
		} else {
			setFavorites([...favorites, id]);
		}
	};
	return (
		<div style={
			{
				backgroundColor: "#c8e2fa",
				padding: "2%"
			}
		}>
			<List>
				{destinations.map((destination) => (
					<ListItem key={destination.id}>
						<Link to={`/destination/${destination.id}`}
							style={
								{
									textDecoration: 'none',
									color: '#333'
								}}>
							<Image src={destination.image}
								alt={destination.name} />
							<h3>{destination.name}</h3>
							<h5>{destination.bestTime}</h5>
							<h6>{destination.rating}</h6>
						</Link>
						<Button onClick={
							() =>
								toggleFavorite(destination.id)
						}>
							{
								favorites.includes(destination.id) ?
									'Remove from Favorites' :
									'Add to Favorites'
							}
						</Button>
					</ListItem>
				))}
			</List>
		</div>
	);
};
export default DestinationList;
// Destinations.js
const Destinations = [
	{
		id: 1, 
		name: 'Taj Mahal', 
		description: 'A symbol of love...', 
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133131/WhatsApp-Image-2024-01-05-at-10935-PM.jpeg', 
		rating: 4.5,
		bestTime: 'October to February'
	},
	// Add more destinations
	{
		id: 2,
		name: 'Jaipur City Palace',
		description: 'A magnificent palace...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133142/WhatsApp-Image-2024-01-05-at-11213-PM.jpeg',
		rating: 4.5,
		bestTime: 'October to February',
	},
	// 18 more destinations...
	{
		id: 3,
		name: 'Goa Beaches',
		description: 'Beautiful sandy beaches...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133150/WhatsApp-Image-2024-01-05-at-11221-PM.jpeg',
		rating: 4.6,
		bestTime: 'November to February',
	},
	{
		id: 4,
		name: 'Kerala Backwaters',
		description: 'Scenic beauty of backwaters...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133200/WhatsApp-Image-2024-01-05-at-11235-PM.jpeg',
		rating: 4.7,
		bestTime: 'September to March',
	},
	{
		id: 5,
		name: 'Hampi Ruins',
		description: 'Ancient ruins and temples...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133211/WhatsApp-Image-2024-01-05-at-11252-PM.jpeg',
		rating: 4.4,
		bestTime: 'October to March',
	},
	{
		id: 6,
		name: 'Rishikesh Yoga Retreats',
		description: 'Peaceful yoga retreats...',
		image: 
'https://images.unsplash.com/photo-1603867106100-0d2039fc8757?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cmlzaGlrZXNofGVufDB8fDB8fHww',
		rating: 4.9,
		bestTime: 'September to November',
	},
	{
		id: 7,
		name: 'Darjeeling Tea Gardens',
		description: 'Lush green tea gardens...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133234/WhatsApp-Image-2024-01-05-at-11258-PM.jpeg',
		rating: 4.5,
		bestTime: 'March to November',
	},
	{
		id: 8,
		name: 'Mysore Palace',
		description: 'Historical royal palace...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133255/WhatsApp-Image-2024-01-05-at-11307-PM.jpeg',
		rating: 4.6,
		bestTime: 'October to February',
	},
	{
		id: 9,
		name: 'Rann of Kutch',
		description: 'Endless white salt desert...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133305/WhatsApp-Image-2024-01-05-at-11314-PM.jpeg',
		rating: 4.7,
		bestTime: 'October to March',
	},
	{
		id: 10,
		name: 'Varanasi Ghats',
		description: 'Sacred river ghats...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133347/WhatsApp-Image-2024-01-05-at-11323-PM.jpeg',
		rating: 4.8,
		bestTime: 'October to March',
	},
	{
		id: 11,
		name: 'Andaman Islands',
		description: 'Exotic islands and beaches...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133355/WhatsApp-Image-2024-01-05-at-11332-PM.jpeg',
		rating: 4.6,
		bestTime: 'October to April',
	},
	{
		id: 12,
		name: 'Udaipur Lakes',
		description: 'Picturesque lakes and palaces...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133401/WhatsApp-Image-2024-01-05-at-11338-PM.jpeg',
		rating: 4.7,
		bestTime: 'September to March',
	},
	{
		id: 13,
		name: 'Ajanta and Ellora Caves',
		description: 'Ancient rock-cut caves...',
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20240105133407/WhatsApp-Image-2024-01-05-at-11343-PM.jpeg',
		rating: 4.8,
		bestTime: 'October to March',
	},
];
export default Destinations;
Step: Run the app with below command:
npm run dev
Output:
