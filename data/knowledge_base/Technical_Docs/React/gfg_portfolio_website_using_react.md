# Portfolio Website Using React

> Source: https://www.geeksforgeeks.org/reactjs/portfolio-webpage-using-react/

A portfolio website built with React showcases your skills, projects, and professional details online, serving as a key tool for personal branding.
- Highlights your talent, past work, and expertise in an interactive, user-friendly format.
- Provides contact information and a professional presence accessible to employers or clients.
Steps to Create Portfolio Webpage
Step 1: Set up the React project with Vite:
npm create vite@latest portfolio-website --template react
Step 2: Install necessary dependencies:
cd portfolio-website
npm install
Step 3: Styling and design with Tailwind CSS:
npm install -D tailwindcss postcss autoprefixer
Step 4: Initialize the Tailwind CSS configuration:
npx tailwindcss init
Approach
To build a portfolio website using React, follow a structured component-based approach.
- Create multiple function-based components such as Navbar, Hero, About, Skills, Projects, Contact, and Footer, and integrate them into the App.js file.
- Implement styling using Tailwind CSS. Tailwind can be connected via CDN inside the index.html file, allowing the project to run locally without installing Tailwind separately.
- Store all components inside a dedicated components folder for better organization.
- Connect assets and external resources using hyperlinks wherever required.
The approach outlined above has been implemented in the provided code.
<!-- Index.html -->
<!DOCTYPE html>
<html lang="en" class="scroll-smooth scroll-pt-20">
<head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta name="description" content="Web site created using create-react-app" />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>
        Project | PortFolio WebPage using React
    </title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
</head>
<body class="bg-emerald-100">
    <noscript>You need to enable JavaScript
        to run this app.</noscript>
    <div id="root"></div>
</body>
</html>
// Index.js
import React from 'react';
import ReactDOM from 'react-dom/client';
import App from './App';
const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        <App />
    </React.StrictMode>
);
// App.js
import Navbar from "./components/Navbar";
import About from "./components/About";
import Skills from "./components/Skills";
import Projects from "./components/Projects";
import Contact from "./components/Contact";
import Footer from "./components/Footer";
import Hero from "./components/Hero";
export default function App() {
    return (
        <>
            <Navbar />
            <Hero />
            <About />
            <Skills />
            <Projects />
            <Contact />
            <Footer />
        </>
    );
}
// Navbar.js
export default function Navbar() {
    return (
        <nav className="w-full px-5 sm:px-10 py-5 shadow-xl 
                        backdrop-blur-lg fixed top-0 z-10">
            <div className="container flex flex-col lg:flex-row
                            gap-5 justify-between w-full 
                            items-center max-w-5xl mx-auto">
                <h3 className="text-3xl text-emerald-500 font-bold">
                    GeeksforGeeks
                </h3>
                <ul className="flex gap-3 align-center p-1 flex-wrap">
                    <li>
                        <a className="text-sm sm:text-base px-2 lg:px-5 
                                      py-2 transition rounded hover:text-white 
                                      hover:bg-emerald-600"
                           href="#about">
                        About
                        </a>
                    </li>
                    <li>
                        <a className="text-sm sm:text-base px-2 lg:px-5 py-2 
                                      transition rounded hover:text-white 
                                      hover:bg-emerald-600"
                            href="#skills">
                            Skills
                        </a>
                    </li>
                    <li>
                        <a className="text-sm sm:text-base px-2 lg:px-5 py-2 
                                      transition rounded hover:text-white 
                                      hover:bg-emerald-600"
                            href="#projects">
                            Projects
                        </a>
                    </li>
                    <li>
                        <a className="text-sm sm:text-base px-2 lg:px-5 py-2 
                                      transition rounded hover:text-white 
                                      hover:bg-emerald-600"
                            href="#contact">
                            Contact
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
    );
}
// Hero.js
export default function Hero() {
    return (
      <section
        id="hero"
        className="px-10 w-full flex gap-12 flex-col lg:flex-row 
                   justify-center items-center align-center mt-40 
                   mb-16 lg:mt-10 max-w-5xl mx-auto lg:gap-0 h-[80vh]">
        <div className="flex-1 flex flex-col justify-center items-center gap-5">
          <div>
            <h4 className="text-center text-xl font-bold">
                Hi and welcome to
            </h4>
            <h2 className="text-center text-emerald-500 text-5xl font-bold">
              My Portfolio Website
            </h2>
          </div>
          <p className="text-center">
            I am your friendly neighbourhood osm developer...
          </p>
        </div>
        <div className="flex-1">
          <img src=
  "https://media.geeksforgeeks.org/gfg-gg-logo.svg"
               alt="Hello.svg"
               className="w-full h-full bg-cover"/>
        </div>
      </section>
    );
  }
// About.js
export default function About() {
    return (
        <section
            id="about"
            className="px-10 w-full flex flex-col lg:flex-row py-20 
                       align-center bg-emerald-200 max-w-5xl mx-auto">
            <div className="flex-1">
                <img src=
"https://media.geeksforgeeks.org/img-practice/Asset1-1641910145.svg"
                    alt="About"
                    className="w-full h-full bg-cover"/>
            </div>
            <div className="flex-1 flex flex-col justify-center
                            items-center gap-5 px-6">
                <div>
                    <h2 className="text-center text-emerald-500 
                                   text-5xl font-bold">
                        About Me :
                    </h2>
                </div>
                <p>
                    As I said, I am your friendly
                    neighbourhood osm developer...
                </p>
                <p>
                    I am a passionate self taught developer
                    (which is quite a subjective thing as i learnt from
                    teachers on youtube so does that really counts?
                    idk). I am having an experience of about 4 years
                    and had a deep understanding of creating web products.
                </p>
            </div>
        </section>
    );
}
// Skills.js
export default function Skills() {
    const skills = ["Python", "HTML", "CSS", "Javascript", "React", "NextJs"];
    return (
        <section id="skills"
            className="px-10 w-full my-40 max-w-5xl mx-auto">
            <h2 className="text-center text-6xl text-emerald-500 font-bold">
                My Skills...
            </h2>
            <div className="mt-10 flex gap-5 justify-center 
                            flex-wrap mx-auto max-w-xl">
                {skills.map((skill, index) => {
                    return (
                        <div key={index}
                             className="cursor-pointer px-12 py-10 
                                        rounded bg-emerald-200 text-lg 
                                        flex items-center justify-center 
                                        font-bold hover:shadow-xl">
                            {skill}
                        </div>
                    )})}
            </div>
        </section>
    )
}
// Projects.js
export default function Projects() {
    return (
        <section id="projects"
                 className="my-20 w-full flex flex-col gap-5 align-center max-w-5xl mx-auto">
            <h2 className="text-5xl text-emerald-500 font-bold text-center">
                My Projects
            </h2>
            <div className="p-10 bg-emerald-200 flex flex-col justify-center items-center
                            gap-5 lg:flex-row max-w-5xl mx-auto shadow transition 
                            hover:shadow-xl hover:scale-[102%] w-full">
                <div className="w-80 rounded">
                    <a href=
"https://www.geeksforgeeks.org/reactjs/progress-tracker-using-react-and-local-storage/"
                        className="w-full h-full">
                        <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20230927120905/gfg.png"
                             alt="Project 1"
                             className="w-full h-full 
                                        bg-cover rounded"/>
                    </a>
                </div>
                <div className="flex flex-col align-center mx-auto gap-4 justify-center flex-1">
                    <h2 className="font-bold text-3xl text-center">
                        <a className="hover:underline"
                            href=
"https://www.geeksforgeeks.org/reactjs/progress-tracker-using-react-and-local-storage/">
                            DSA Progress Tracker
                        </a>
                    </h2>
                    <p>
                        This is a project built on react which tracks your progess in dsa 
                        and stores that in the local storage.
                    </p>
                </div>
            </div>
            <div className="p-10 bg-emerald-200 flex flex-col justify-center items-center gap-5 
                            lg:flex-row-reverse max-w-5xl mx-auto shadow transition hover:shadow-xl 
                            hover:scale-[102%] w-full">
                <div className="w-80 rounded">
                    <a href=
"https://www.geeksforgeeks.org/reactjs/15-puzzle-game-using-reactjs/"
                       className="w-full h-full">
                        <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20230904150620/gfg.png"
                             alt="Project 2"
                             className="w-full h-full bg-cover rounded" />
                    </a>
                </div>
                <div className="flex flex-col align-center mx-auto gap-4 justify-center flex-1">
                    <h2 className="font-bold text-3xl text-center">
                        <a className="hover:underline" href=
"https://www.geeksforgeeks.org/reactjs/15-puzzle-game-using-reactjs/">
                            15 Puzzle Game
                        </a>
                    </h2>
                    <p>
                        15 puzzle game is basically a tile-based game in which there are 16 tiles
                        out of which 1 tile is left empty and the remaining tiles are filled with
                        numbers from 1 to 15 in random order. The user has to arrange all the tiles 
                        in numerical order with the rule that they can only move the tile that is 
                        a direct neighbor of the empty tile.
                    </p>
                </div>
            </div>
        </section>
    );
}
// Contact.js
export default function Contact() {
    return (
        <section id="contact"
                 className="my-40 align-center max-w-5xl mx-auto p-3">
            <h2 className="text-5xl font-bold text-emerald-500 text-center">
                Contact
            </h2>
            <div className="flex gap-5 justify-center 
                        my-10">
                <a rel="noreferrer"
                   target="_blank"
                   className="text-center hover:underline"
                   href=
"https://www.instagram.com/accounts/login/?next=https%3A%2F%2Fwww.instagram.com%2Fgeeks_for_geeks%2F&is_from_rle">
                    Instagram:
                    <span className="font-bold">
                        @geeks_for_geeks
                    </span>
                </a>
                <a rel="noreferrer"
                   target="_blank"
                   className="text-center hover:underline"
                   href=
"https://twitter.com/geeksforgeeks">
                    Twitter:
                    <span className="font-bold">
                        @geeksforgeeks
                    </span>
                </a>
            </div>
        </section>
    );
}
// Footer.js
export default function Footer() {
    return (
        <section className="p-10 bg-emerald-200 flex justify-center">
            <p className="font-bold">
                ©Copyright 2023. All rights are reserved by Geeks for Geeks
            </p>
        </section>
    );
}
Run and Test Your Application:
npm run dev
Output:
Follow the given link to Build and Host your own Portfolio Website using HTML,CSS and JavaScript.
