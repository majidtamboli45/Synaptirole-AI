# Blog app using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/blog-app-using-reactjs/

In this article, we have created the blog app using react js, First of all, we have created the project name blog by entering the command npx create-react-app blog and installing all modules. Then we create the folder name component under src and make two jsx file post.jsx and posts.jsx and styling the jsx component by post.css and posts.css. And last we import the component into App.js and styling the main into App.css.
Lets have a look at how the final application will look like.
Steps to create the application:
Step 1: Create React Project
npm create vite@latest blog --template react
Step 2: Change your directory and enter your main folder MY-APP as :
cd blog
Step 3: Install the required modules using the command
npm install bootstrap
npm install react-bootstrap
Step 4: Create a folder call components and create the files BlogNav.js, Posts.js, Post1.js, Post2.js, Post3.js, Post4.js
Project Structure: After following the above steps the project structure will look like
The dependencies in package.json will look like:
package.json
{
"dependencies": {
"bootstrap": "^5.3.0",
"react": "^18.2.0",
"react-bootstrap": "^2.7.4",
"react-dom": "^18.2.0",
"vite": "^4.0.0"
},
"devDependencies": {
"@vitejs/plugin-react": "^3.0.0"
}
}
Example: Write the following code in your files
- App.js: This file imports all the components and displays it
- BlogNav.js: This file is used to create the navigation bar
- Posts.js: This file renders the posts
- Post1.js, Post2.js, Post3.js, Post4.js: These files contain the content of the blog
// App.js
import React from "react";
import "./App.css";
import Posts from "./components/Posts";
import Navbar from "./components/BlogNav"
const App = () => {
    return (
        <div className="main-container" style={{backgroundColor: "aliceblue"}}>
            <Navbar />
            <Posts />
        </div>
    );
};
export default App;
// Posts.js
import React from "react";
import Post1 from "./Post1";
import Post2 from "./Post2";
import Post3 from "./Post3";
import Post4 from "./Post4";
import { Container, Row, Col, Card } from 'react-bootstrap';
const Posts = () => {
    return (
        <Container>
            <Row className="justify-content-between">
                <Col md={8} className="mb-4 mt-4">
                    <Post1 />
                </Col>
                <Col md={2} className="mt-4 float-right">
                    <Card>
                        <Card.Body>
                            <Card.Title>Recent Posts</Card.Title>
                            <ul className="list-unstyled">
                                <li><a href="#">JavaScript</a></li>
                                <li><a href="#">Data Structure</a></li>
                                <li><a href="#">Algorithm</a></li>
                                <li><a href="#">Computer Network</a></li>
                            </ul>
                        </Card.Body>
                    </Card>
                </Col>
                <Col md={8} className="mb-4">
                    <Post2 />
                </Col>
                <Col md={8} className="mb-4">
                    <Post3 />
                </Col>
                <Col md={8} className="mb-4">
                    <Post4 />
                </Col>
            </Row>
        </Container>
    );
};
export default Posts;
// BlogNav.js
import React from "react";
import 'bootstrap/dist/css/bootstrap.css';
import { Navbar, Nav, Form, FormControl } from 'react-bootstrap';
const BlogNav = () => {
    return (
        <div>
            <Navbar style={{
                backgroundColor:"#A3C1D4"
            }}>
                <img
              src='https://media.geeksforgeeks.org/gfg-gg-logo.svg'
              height='30'
              alt=''
              loading='lazy'
            />
                <Navbar.Brand href="#home" style={{color:"white", marginLeft:"10px"}}>GeeksforGeeks</Navbar.Brand>
                <Navbar.Toggle />
                <Navbar.Collapse id="basic-navbar-nav" className="d-flex justify-content-end">
                    <Nav>
                        <Nav.Link href="#home" style={{color:"white"}}>
                            JavaScript
                        </Nav.Link>
                        <Nav.Link href="#about" style={{color:"white"}}>
                            Data Structure
                        </Nav.Link>
                        <Nav.Link href="#services" style={{color:"white"}}>
                            Algorithm
                        </Nav.Link>
                        <Nav.Link href="#contact" style={{color:"white"}}>
                            Computer Network
                        </Nav.Link>
                    </Nav>
                    <Form inline>
                        <FormControl type="text" placeholder="Search" className="ml-auto"  />
                    </Form>
                </Navbar.Collapse>
            </Navbar>
        </div>
    )
}
export default BlogNav;
// Post1.js
import { Card } from "react-bootstrap";
const Post1 = () => {
    return (
        <Card>
            <Card.Img
                variant="top"
                src=
                "https://media.geeksforgeeks.org/wp-content/cdn-uploads/20230305183140/Javascript.jpg"
                width={20}
                height={250}
            />
            <Card.Body>
                <Card.Title>JAVASCRIPT</Card.Title>
                <Card.Text>
                    JavaScript is the world most popular
                    lightweight, interpreted compiled programming
                    language. It is also known as scripting
                    language for web pages. It is well-known for
                    the development of web pages, many non-browser
                    environments also use it. JavaScript can be
                    used for Client-side developments as well as
                    Server-side developments
                </Card.Text>
                <a href="#" className="btn btn-primary">Read More</a>
            </Card.Body>
        </Card>
    );
};
export default Post1;
// Post2.js
import { Card } from "react-bootstrap";
const Post2 = () => {
    return (
        <Card>
            <Card.Img
                variant="top"
                src=
"https://media.geeksforgeeks.org/img-practice/banner/coa-gate-2022-thumbnail.png"
                width={20}
                height={250}
            />
            <Card.Body>
                <Card.Title>Data Structure</Card.Title>
                <Card.Text>
                    The word Algorithm means “a process
                    or set of rules to be followed in calculations
                    or other problem-solving operations”. Therefore
                    Algorithm refers to a set of rules/instructions
                    that step-by-step define how a work is to be
                    executed upon in order to get the expected
                    results.
                </Card.Text>
                <a href="#" className="btn btn-primary">Read More</a>
            </Card.Body>
        </Card>
    )
}
export default Post2;
// Post3.js
import { Card } from "react-bootstrap";
const Post3 = () => {
    return (
        <Card>
            <Card.Img
                variant="top"
                src=
"https://media.geeksforgeeks.org/img-practice/banner/google-test-series-thumbnail.png"
                width={20}
                height={250}
            />
            <Card.Body>
                <Card.Title>Algorithm</Card.Title>
                <Card.Text>
                    The word Algorithm means “a process
                    or set of rules to be followed in calculations
                    or other problem-solving operations”. Therefore
                    Algorithm refers to a set of rules/instructions
                    that step-by-step define how a work is to be
                    executed upon in order to get the expected
                    results.
                </Card.Text>
                <a href="#" className="btn btn-primary">Read More</a>
            </Card.Body>
        </Card>
    )
}
export default Post3;
// Post4.js
import { Card } from "react-bootstrap";
const Post4 = () => {
    return (
        <Card>
            <Card.Img
                variant="top"
                src=
"https://media.geeksforgeeks.org/img-practice/banner/cp-maths-java-thumbnail.png"
                width={20}
                height={250}
            />
            <Card.Body>
                <Card.Title>Computer Network</Card.Title>
                <Card.Text>
                    An interconnection of multiple devices,
                    also known as hosts, that are connected using
                    multiple paths for the purpose of sending/
                    receiving data media. Computer networks can
                    also include multiple devices/mediums which
                    help in the communication between two different
                    devices; these are known as Network devices
                    and include things such as routers, switches,
                    hubs, and bridges.
                </Card.Text>
                <a href="#" className="btn btn-primary">Read More</a>
            </Card.Body>
        </Card>
    )
}
export default Post4;
Step to run the application: Open the terminal and run the project using the command.
npm run dev
Output: Your project is shown in the URL http://localhost:5173/
