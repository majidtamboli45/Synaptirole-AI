# Build a Portfolio Website Using React and Bootstrap

> Source: https://www.geeksforgeeks.org/reactjs/how-to-build-portfolio-website-using-react-bootstrap/

Building a portfolio website using React and Bootstrap is an excellent project for showcasing your skills and creating a professional online presence. In this article, we will guide you through the process of building a responsive and visually appealing portfolio website using React for the front end and Bootstrap for styling.
What are we going To Create?
We will build a Portfolio Website using React and Bootstrap, featuring the following key elements:
- Home Section: A brief introduction about yourself, highlighting your skills and experience.
- About Section: A detailed description of your background, education, and career journey.
- Projects Section: A showcase of your key projects with links to GitHub repositories or live demos.
- Skills Section: A list of your technical skills, including proficiency levels and related tools/libraries.
- Contact Section: A contact form to enable visitors to reach out to you easily.
- Responsive Design: The website will be fully responsive and look great on all devices by utilizing Bootstrap's grid system.
Project Preview
Create React Application and Installing Modules
Step 1: Use create-react-app to set up a new React project.
npm create vite@latest myapp --template react
cd myapp
Step 2: Install Bootstrap and Font Awesome using the below commands:
npm install bootstrap react-bootstrap
npm install react-router-dom
npm install @fortawesome/free-brands-svg-icons @fortawesome/fontawesome-svg-core @fortawesome/free-solid-svg-icons @fortawesome/react-fontawesome
Folder Strucure
Code Example
Create the required folders and files and add the following codes
/* Header.css */
.custom-navbar {
    background-color: #343a40;
    padding: 1rem 0;
}
.FontAwesomeIcon {
    color: white;
}
span {
    color: white;
}
.brand-name {
    font-family: 'Pacifico', cursive;
    font-size: 2rem;
    font-weight: bold;
    color: #fff;
    margin-left: 20px;
    text-decoration: none;
    transition: color 0.3s;
}
.brand-name:hover {
    color: #17a2b8;
}
.navbar-toggler-icon {
    background-color: #fff;
}
.nav-link {
    color: #fff;
    margin-right: 15px;
    display: flex;
    align-items: center;
    transition: color 0.3s;
}
.nav-link span {
    margin-right: 0.5rem;
}
.nav-link:hover,
.ho:hover,
.nav-link:hover span {
    color: #17a2b8 !important;
}
.navbar-toggler {
    border: none;
}
.navbar-toggler:focus {
    outline: none;
}
.ml-auto {
    margin-left: auto;
}
/* Font Awesome Icons */
.fa-lg {
    margin-right: 5px;
}
/* Responsive Styles */
@media (max-width: 768px) {
    .navbar-nav {
        margin-left: 0;
        text-align: center;
    }
    .navbar-toggler {
        margin-bottom: 10px;
    }
    .ml-auto {
        margin-left: 0;
        text-align: center;
        margin-top: 10px;
    }
}
/* style.css */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
    color: #ffffff;
}
.container {
    max-width: 1200px;
    margin: 0 auto;
}
/* About Section Styles */
#about {
    padding: 20px 0;
}
.section-title {
    font-size: 2.5rem;
    color: #17a2b8;
    margin-bottom: 20px;
}
.section-description {
    font-size: 1.2rem;
    line-height: 1.6;
    color: #555;
}
.card {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s;
}
.card:hover {
    transform: scale(1.05);
}
.resume-download-btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    font-weight: bold;
    text-align: center;
    text-decoration: none;
    background-color: #007bff;
    color: #fff;
    border-radius: 5px;
    transition: background-color 0.3s;
}
.resume-download-btn:hover {
    background-color: #0056b3;
}
.profile-image-container {
    overflow: hidden;
    border-radius: 50%;
    margin: auto;
    width: 200px;
    height: 200px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}
.profile-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
}
/* Skills Component Styles */
.skills-container {
    margin-top: 40px;
}
.skills-title {
    font-size: 1.8rem;
    color: #17a2b8;
}
.skills-list {
    list-style: none;
    padding: 0;
    margin-top: 15px;
}
.skills-list li {
    background-color: #17a2b8;
    color: #fff;
    border-radius: 5px;
    padding: 8px 12px;
    margin-bottom: 8px;
    display: inline-block;
    margin-right: 10px;
}
.skills-list li:last-child {
    margin-right: 0;
}
/* Projects Section Styles */
#projects {
    padding: 0px 0;
}
.section-title {
    font-size: 2.5rem;
    color: #17a2b8;
    margin-top: 20px;
    margin-bottom: 20px;
}
/* Project Card Styles */
.card {
    border: none;
    transition: transform 0.3s;
}
.card:hover {
    transform: scale(1.05);
}
.card-title {
    font-size: 1.5rem;
    color: #333;
}
.card-text {
    font-size: 1.2rem;
    color: #555;
}
/* Resume Section Styles */
#resume {
    padding: 10px 0;
}
#resume h2 {
    font-size: 2.5rem;
    color: #17a2b8;
    margin-bottom: 20px;
}
#resume p {
    font-size: 1.2rem;
    line-height: 1.6;
    color: #555;
}
.resume-download-btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 1.2rem;
    text-align: center;
    text-decoration: none;
    background-color: #28a745;
    color: #fff;
    border-radius: 5px;
    transition: background-color 0.3s;
}
.resume-download-btn:hover {
    background-color: #218838;
}
/* Contact Section Styles */
#contact {
    padding: 10px 0;
}
#contact .section-title {
    font-size: 2.5rem;
    color: #17a2b8;
    margin-bottom: 20px;
}
#contact .section-description {
    font-size: 1.2rem;
    line-height: 1.6;
    color: #555;
}
.contact-list {
    list-style: none;
    padding: 0;
    display: flex;
    flex-direction: column;
}
.contact-list li {
    margin-bottom: 15px;
}
.contact-icon {
    margin-right: 10px;
    font-size: 24px;
    color: #17a2b8;
}
.contact-list a {
    color: #333;
    text-decoration: none;
}
/* Hover effect for contact links */
.contact-list a:hover {
    color: #17a2b8;
}
/* Skills Section Styles */
.skills-title {
    font-size: 1.8rem;
    color: #17a2b8;
    margin-top: 30px;
}
.skills-list {
    list-style: none;
    padding: 0;
    margin-top: 15px;
}
.skills-list li {
    background-color: #17a2b8;
    color: #fff;
    border-radius: 5px;
    padding: 8px 12px;
    margin-bottom: 8px;
    display: inline-block;
    margin-right: 10px;
}
.skills-list li:last-child {
    margin-right: 0;
}
/* Button Styles */
.btn-primary {
    background-color: #17a2b8;
    color: #fff;
    border: none;
    padding: 10px 20px;
    font-size: 1.2rem;
    text-decoration: none;
    border-radius: 5px;
    display: inline-block;
    margin-top: 20px;
    transition: background-color 0.3s ease;
}
.btn-primary:hover {
    background-color: #136b7d;
}
/* Footer Styles */
.footer {
    background-color: #343a40;
    color: #fff;
    padding: 20px 0;
    position: relative;
    bottom: 0;
    width: 100%;
}
.footer p {
    margin-bottom: 0;
}
.social-icons {
    display: flex;
    justify-content: flex-end;
}
.social-icons li {
    margin-right: 10px;
}
.social-icons a {
    color: #fff;
    font-size: 20px;
    text-decoration: none;
}
/* Hover effect for social icons */
.social-icons a:hover {
    color: #17a2b8;
}
/* Responsive Styles */
@media (max-width: 768px) {
    h2 {
        font-size: 2rem;
    }
    p {
        font-size: 1rem;
    }
}
.breadcrumb {
    background-color: #f8f9fa;
    /* Breadcrumb background color */
    padding: 10px;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
.breadcrumb-item a {
    color: #007bff;
    /* Breadcrumb link color */
    text-decoration: none;
}
.breadcrumb-item a:hover {
    text-decoration: underline;
}
.breadcrumb-item.active {
    color: #343a40;
    /* Active breadcrumb item color */
    font-weight: bold;
}
.breadcrumb-item span::before {
    display: none;
    /* Remove separator for the last breadcrumb */
}
//App.js 
import React from 'react'; 
import { BrowserRouter as Router, Routes, Route } from 'react-router-dom'; 
import Header from './components/Header'; 
import About from './components/About'; 
import Projects from './components/Projects'; 
import Resume from './components/Resume'; 
import Contact from './components/Contact'; 
import Footer from './components/Footer'; 
import Skills from './components/Skills'; 
function App() { 
return ( 
	<Router> 
	<div> 
		<Header /> 
		<Routes> 
		<Route path="/" element={<About />} /> 
		<Route path="/projects" element={<Projects />} /> 
		<Route path="/skills" element={<Skills />} /> 
		<Route path="/resume" element={<Resume />} /> 
		<Route path="/contact" element={<Contact />} /> 
		</Routes> 
		<Footer /> 
	</div> 
	</Router> 
); 
} 
export default App; 
//Header.js 
import React from 'react'; 
import { Navbar, Nav } from 'react-bootstrap'; 
import { FontAwesomeIcon } 
from '@fortawesome/react-fontawesome'; 
import { faGithub, faLinkedin } 
from '@fortawesome/free-brands-svg-icons'; 
import { 
faInfoCircle, faCode, 
faFileAlt, faEnvelope 
} 
from '@fortawesome/free-solid-svg-icons'; 
import { Link } from 'react-router-dom'; 
import './Header.css'; 
import './style.css'; 
const Header = () => { 
return ( 
	<Navbar bg="dark" expand="lg"
	className="custom-navbar shadow-sm"> 
	<Navbar.Brand as={Link} to="/"
		className="brand-name"> 
		<span className="display-4 text-white ho"> 
		Geek 
		</span> 
	</Navbar.Brand> 
	<button 
		className="navbar-toggler"
		type="button"
		data-toggle="collapse"
		data-target="#navbarNav"
		aria-controls="navbarNav"
		aria-expanded="false"
		aria-label="Toggle navigation"
	> 
		<span className="navbar-toggler-icon"></span> 
	</button> 
	<div className="collapse navbar-collapse text-white"
		id="navbarNav"> 
		<Nav className="ml-auto "> 
		<Nav.Link as={Link} to="/"> 
			<span>About</span> 
			<FontAwesomeIcon icon={faInfoCircle} 
			className="ml-2 text-light ho ho" /> 
		</Nav.Link> 
		<Nav.Link as={Link} to="/projects"> 
			<span>Projects</span> 
			<FontAwesomeIcon icon={faCode} 
			className="ml-2 text-light ho" /> 
		</Nav.Link> 
		<Nav.Link as={Link} to="/resume"> 
			<span>Resume</span> 
			<FontAwesomeIcon icon={faFileAlt} 
			className="ml-2 text-light ho" /> 
		</Nav.Link> 
		<Nav.Link as={Link} to="/contact"> 
			<span>Contact</span> 
			<FontAwesomeIcon icon={faEnvelope} 
			className="ml-2 text-light ho" /> 
		</Nav.Link> 
		</Nav> 
		<Nav className="ml-auto"> 
		<Nav.Link href="https://github.com/yourusername"> 
			<span className="sr-only">Github</span> 
			<FontAwesomeIcon icon={faGithub} size="lg"
			className='text-light ho' /> 
		</Nav.Link> 
		<Nav.Link href="https://www.linkedin.com/in/yourusername"> 
			<span className="sr-only">Linkedin</span> 
			<FontAwesomeIcon icon={faLinkedin} size="lg"
			className='text-light ho' /> 
		</Nav.Link> 
		</Nav> 
	</div> 
	</Navbar> 
); 
}; 
export default Header;
//About.js
import React from 'react';
import './style.css';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faUser } from '@fortawesome/free-solid-svg-icons';
const About = () => {
    return (
        <section id="about"
            className="container text-center">
            <div className="row">
                <div className="col-md-8 offset-md-2">
                    <div className="profile-image-container">
                        <h2 className="section-title">
                            <h2 className="section-title">
                                <FontAwesomeIcon icon={faUser} 
                                className="d-block mx-auto mb-2 text-primary" size="3x" />
                            </h2>
                        </h2>
                    </div>
                    <p className="section-description mt-4">
                        I am a skilled Internship Trainee with over 6 months of
                        hands-on experience in full-stack web development. My
                        expertise includes using technologies such as Node.js,
                        Java, JSP, HTML, CSS, and Bootstrap. As a problem solver,
                        I have successfully designed and developed user-friendly,
                        responsive web applications.
                    </p>
                </div>
            </div>
        </section>
    );
};
export default About;
// Projects.js 
import React from 'react'; 
import { FontAwesomeIcon } 
	from '@fortawesome/react-fontawesome'; 
import { faCode } from '@fortawesome/free-solid-svg-icons'; 
import Breadcrumbs from './Breadcrumbs'; 
import './style.css'; 
const Projects = () => { 
	const breadcrumbsPaths = 
		[ 
			{ title: 'Home', to: '/' }, 
			{ title: 'Projects', to: '/projects' } 
		]; 
	return ( 
		<section id="projects"
			className="container text-center"> 
			<Breadcrumbs paths={breadcrumbsPaths} /> 
			<h2 className="section-title"> 
				<FontAwesomeIcon icon={faCode} 
					className="mr-2" /> 
				Projects 
			</h2> 
			<div className="row"> 
				{/* Project 1 */} 
				<div className="col-md-6"> 
					<div className="card mb-4"> 
						<div className="card-body"> 
							<h5 className="card-title"> 
								Read For Speed - 
								Smart India Hackathon 2022 
							</h5> 
							<p className="card-text"> 
								Designed the UI and implemented 
								CSS styling for the website, 
								optimizing performance and design across 
								all pages. 
							</p> 
						</div> 
					</div> 
				</div> 
				{/* Project 2 */} 
				<div className="col-md-6"> 
					<div className="card mb-4"> 
						<div className="card-body"> 
							<h5 className="card-title"> 
								Training and Placement 
								Cell Website Official 
							</h5> 
							<p className="card-text"> 
								Designed and developed the official 
								Placement Website for the university using 
								HTML, CSS, JavaScript, jQuery, and Bootstrap. 
							</p> 
						</div> 
					</div> 
				</div> 
				{/* Project 3 */} 
				<div className="col-md-6"> 
					<div className="card mb-4"> 
						<div className="card-body"> 
							<h5 className="card-title"> 
								E-commerce Platform 
							</h5> 
							<p className="card-text"> 
								Built a fully functional e-commerce 
								platform with features like product listing, 
								cart management, and user authentication using 
								React, Node.js, and MongoDB. 
							</p> 
						</div> 
					</div> 
				</div> 
				{/* Project 4 */} 
				<div className="col-md-6"> 
					<div className="card mb-4"> 
						<div className="card-body"> 
							<h5 className="card-title"> 
								Social Media Dashboard 
							</h5> 
							<p className="card-text"> 
								Developed a social media dashboard 
								that allows users to view and manage 
								their social media accounts in one place, 
								integrating with APIs from major platforms. 
							</p> 
						</div> 
					</div> 
				</div> 
			</div> 
		</section> 
	); 
}; 
export default Projects;
// Contact.js 
import React from 'react'; 
import { FontAwesomeIcon } 
	from '@fortawesome/react-fontawesome'; 
import { faEnvelope, faPhone } 
	from '@fortawesome/free-solid-svg-icons'; 
import { faLinkedin, faGithub } 
	from '@fortawesome/free-brands-svg-icons'; 
import Breadcrumbs from './Breadcrumbs'; 
import './style.css'; 
const Contact = () => { 
	const breadcrumbsPaths = 
		[ 
			{ title: 'Home', to: '/' }, 
			{ title: 'Contact', to: '/contact' } 
		]; 
	return ( 
		<section id="contact" className="container"> 
			<Breadcrumbs paths={breadcrumbsPaths} /> 
			<h2 className="section-title">Contact</h2> 
			<p className="section-description"> 
				Feel free to reach out for
				collaboration or inquiries. 
			</p> 
			<ul className="contact-list list-unstyled"> 
				<li> 
					<FontAwesomeIcon icon={faEnvelope} 
						className="contact-icon" /> 
					sahilalixxxxxx@gmail.com 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faLinkedin} 
						className="contact-icon" /> 
					LinkedIn 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faGithub} 
						className="contact-icon" /> 
					GitHub 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faPhone} 
						className="contact-icon" /> 
					6393xxxxx4 
				</li> 
			</ul> 
		</section> 
	); 
}; 
export default Contact;
// Resume.js 
import React from 'react'; 
import { FontAwesomeIcon } 
	from '@fortawesome/react-fontawesome'; 
import { faFileDownload } 
	from '@fortawesome/free-solid-svg-icons'; 
import Breadcrumbs from './Breadcrumbs'; 
import Skills from './Skills'; 
import './style.css'; 
const Resume = () => { 
	const breadcrumbsPaths = 
		[ 
			{ title: 'Home', to: '/' }, 
			{ title: 'Resume', to: '/resume' } 
		]; 
	return ( 
		<section id="resume"
			className="container text-center"> 
			{/* Include the Breadcrumbs component */} 
			<Breadcrumbs paths={breadcrumbsPaths} /> 
			<div className="row justify-content-center align-items-center"> 
				<div className="col-md-8"> 
					<h2 className="section-title"> 
						<FontAwesomeIcon icon={faFileDownload} 
							className="mr-2" /> 
						Resume 
					</h2> 
					<p className="section-description"> 
						Download my resume to learn more 
						about my professional experience and skills. 
					</p> 
					<a href="path/to/your/resume.pdf"
						className="resume-download-btn" download> 
						Download Resume 
					</a> 
					{/* Include the Skills component here */} 
					<Skills /> 
				</div> 
			</div> 
		</section> 
	); 
}; 
export default Resume;
// Skills.js 
import React from 'react'; 
import { FontAwesomeIcon } 
	from '@fortawesome/react-fontawesome'; 
import { faCode, faLaptopCode } 
	from '@fortawesome/free-solid-svg-icons'; 
import { faCogs } 
	from '@fortawesome/free-solid-svg-icons'; 
import './style.css'; 
const Skills = () => { 
	return ( 
		<section id="skills"
			className="container"
			style={{ paddingLeft: '0px' }}> 
			<h2 className="section-title"> 
				<FontAwesomeIcon icon={faCogs} 
					className="mr-2" /> 
				Skills 
			</h2> 
			<ul className="skills-list"> 
				<li> 
					<FontAwesomeIcon icon={faCode} 
						className="mr-2" /> 
					HTML 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faCode} 
						className="mr-2" /> 
					CSS 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faCode} 
						className="mr-2" /> 
					JavaScript 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faLaptopCode} 
						className="mr-2" /> 
					React 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faLaptopCode} 
						className="mr-2" /> 
					Bootstrap 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faLaptopCode} 
						className="mr-2" /> 
					DSA 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faLaptopCode} 
						className="mr-2" /> 
					Node.js 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faLaptopCode} 
						className="mr-2" /> 
					Python 
				</li> 
				<li> 
					<FontAwesomeIcon icon={faLaptopCode} 
						className="mr-2" /> 
					Java 
				</li> 
				{/* Add more skills as needed */} 
			</ul> 
		</section> 
	); 
}; 
export default Skills;
// Footer.js 
import React from 'react'; 
import { FontAwesomeIcon } 
	from '@fortawesome/react-fontawesome'; 
import { faLinkedin, faGithub, faTwitter } 
	from '@fortawesome/free-brands-svg-icons'; 
import './style.css'; // Import your custom CSS file 
const Footer = () => { 
return ( 
	<footer className="footer"> 
	<div className="container"> 
		<div className="row"> 
		<div className="col-md-6"> 
			<p>© 2023 Geek. All rights reserved.</p> 
		</div> 
		<div className="col-md-6 text-md-right"> 
			<ul className="social-icons list-unstyled"> 
			<li> 
				<a 
href="https://www.linkedin.com/in/yourusername" target="_blank" rel="noopener noreferrer"> 
				<FontAwesomeIcon icon={faLinkedin} /> 
				</a> 
			</li> 
			<li> 
				<a href= 
"https://github.com/yourusername" target="_blank" rel="noopener noreferrer"> 
				<FontAwesomeIcon icon={faGithub} /> 
				</a> 
			</li> 
			<li> 
				<a href= 
"https://twitter.com/yourusername" target="_blank" rel="noopener noreferrer"> 
				<FontAwesomeIcon icon={faTwitter} /> 
				</a> 
			</li> 
			</ul> 
		</div> 
		</div> 
	</div> 
	</footer> 
); 
}; 
export default Footer;
// Breadcrumbs.js 
import React from 'react'; 
import { Link } from 'react-router-dom'; 
import { FontAwesomeIcon } 
	from '@fortawesome/react-fontawesome'; 
import { faHome } 
	from '@fortawesome/free-solid-svg-icons'; 
const Breadcrumbs = ({ paths }) => { 
	return ( 
		<nav aria-label="breadcrumb"> 
			<ol className="breadcrumb bg-light p-3 rounded"> 
				<li className="breadcrumb-item"> 
					<Link to="/"> 
						<FontAwesomeIcon icon={faHome} 
							className="mr-2" /> 
						{/* Home */} 
					</Link> 
				</li> 
				{paths.map((path, index) => ( 
					<li key={index} 
						className={ 
							`breadcrumb-item${index === paths.length - 1 ? 
								' active' : ''}` 
						}> 
						{index !== paths.length - 1 ? ( 
							<Link to={path.to}> 
								{path.title} 
							</Link> 
						) : ( 
							<span>{path.title}</span> 
						)} 
					</li> 
				))} 
			</ol> 
		</nav> 
	); 
}; 
export default Breadcrumbs;
In this example
- App.js: Sets up routing with BrowserRouter and defines routes for different pages like About, Projects, Resume, Skills, and Contact.
- Header.js: Displays a navigation bar with links to the different routes and social media icons, styled using Bootstrap and custom CSS.
- About.js, Projects.js, Resume.js, Skills.js, Contact.js: These components represent individual pages and their content, such as text and images.
- FontAwesome Icons: Used for visual enhancement, particularly for social media icons and other UI elements.
- CSS Styling: Custom styling is applied to components for layout and appearance, with additional styles imported from Bootstrap for responsiveness.
Steps to Run the Application
Step 1. Open the project folder in your chosen code editor.
cd myapp
Step 2. Start the development server.
npm run dev
Output:
Follow the given link to Build and Host your own portfolio website using HTML,CSS and JavaScript.
