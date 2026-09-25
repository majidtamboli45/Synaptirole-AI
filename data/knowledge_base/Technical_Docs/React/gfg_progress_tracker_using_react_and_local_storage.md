# Progress Tracker using React and Local Storage

> Source: https://www.geeksforgeeks.org/reactjs/progress-tracker-using-react-and-local-storage/

Progress Tracker using React and local storage is a basic website that lists the tasks that the user has to complete. When the user completes any one of the topics, he/she can tick mark the topic as completed and the progress will be shown to him/her. To store this progress, so that the user can come back later and find the previously made progress, we use local storage in the browser for storing the progress. We also have a progress bar fixed at the top to show the overall progress of individual tasks.
Preview of Final Output:
Technologies used/ Pre-requisites
Approach: Containers are Stateful React components (class Based). Components are Stateless React Components (function based). In this project, we have used React Functional Components and React Hooks, specifically useState and useEffect hooks to build the website. The components are written in JSX to render the UI as well as the logic is written in it. All of this work happens on React which works over Javascript.
Project Structure:
Steps:
Step 1: Set up React project using the command
npm create vite@latest <project-name> --template react
Step 2: Navigate to the project folder using
cd <project-name>
Step 3: Install dependencies
npm install
Step 4: Create a folder named "components" for storing the components and a folder named "utils" where we'll create the utility variables and functions to store the initial state of the progress of each concept and to calculate the progress made.
Inside the "components" folder, add 3 files namely "DSAList.js", "Section.js", "SubSection.js" and inside the "utils" folder create a file named "calculateProgress.js" and "dsaTrackerList.js".
Step 5: To add tailwindcss in your project, add the following script tag in the "index.html".
<script src="https://cdn.tailwindcss.com/3.4.16"></script>
Write the following code in different files (The name of the files is mentioned in the first line of each code block)
Examples:
- index.html: Automatically created file where we need to import the tailwindcss tag.
- index.js: Automatically created which React uses for final rendering.
- App.js: This file imports the DSAList component and exports it along with exporting the headings and name of the app.
- DSAList.js: This file container the overall logic of the website and all the required components.
- Section.js: This component is for defining the UI and logic of individual section.
- SubSection.js: This component is for defining the UI and logic of individual sub-section.
- calculateProgess.js: This file is used to calculate progress made by the user in each topic along with the overall progress.
- dsaTrackerList.js: This file stores the initial state of the progress object.
<!-- index.html -->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <link rel="icon" href="%PUBLIC_URL%/favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta name="theme-color" content="#000000" />
    <meta
      name="description"
      content="Web site created using create-react-app"
    />
    <link rel="apple-touch-icon" href="%PUBLIC_URL%/logo192.png" />
    <link rel="manifest" href="%PUBLIC_URL%/manifest.json" />
    <title>Project | DSA Tracker</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
  </head>
  <body class="bg-gray-800 text-gray-300">
    <noscript>You need to enable JavaScript to run this app.</noscript>
    <div id="root"></div>
  </body>
</html>
// App.js
import DSAList from "./components/DSAList";
export default function App() {
    return (
        <>
            <div className="flex flex-col justify-center items-center mt-4">
                <h1 className="text-emerald-500 font-bold text-3xl">
                    GeeksforGeeks
                </h1>
                <h3 className="bg-clip-text text-transparent bg-gradient-to-r 
                               from-purple-500 to-pink-500 font-bold text-xl mb-4">
                    DSA Tracker
                </h3>
                <DSAList />
            </div>
        </>
    );
}
// DSAList.js
import { useState, useEffect } from "react";
import {
    findSectionProgress,
    findOverallProgress,
} from "../utils/calculateProgress";
import dsaTrackerList from "../utils/dsaTrackerList";
import Section from "./Section";
export default function DSAList() {
    const [dsaList, setDsaList] = useState([]);
    const [overallProgress, setOverallProgress] = useState(0);
    useEffect(() => {
        const localList = JSON.parse(localStorage.getItem("dsalist")) || [];
        setDsaList(localList.length !== 0 ? localList : dsaTrackerList);
    }, []);
    useEffect(() => {
        setOverallProgress(findOverallProgress(dsaList));
    }, [dsaList]);
    const updateList = (index, indexOfSub) => {
        const newDSAList = [...dsaList];
        newDSAList[index].subsections[indexOfSub].completed =
            !newDSAList[index].subsections[indexOfSub].completed;
        newDSAList[index].progress = findSectionProgress(
            newDSAList[index].subsections
        );
        setDsaList(newDSAList);
        localStorage.setItem("dsalist", JSON.stringify(newDSAList));
    };
    return (
        <div className="flex flex-col gap-10 w-[60%] mb-40 relative">
            {overallProgress === 100 && (
                <h1 className="text-center text-4xl text-emerald-500">
                    Successfully Completed! Hurray.
                </h1>
            )}
            <p>Progress: {overallProgress}%</p>
            <div
                className={`-mt-5 rounded sticky top-0 
                            bg-gradient-to-r from-purple-500 
                            to-pink-500 transition-all h-2 w-[${overallProgress}%]`}>
            </div>
            {dsaList.map((section, index) => {
                return (
                    <Section
                        index={index}
                        updateList={updateList}
                        key={index}
                        section={section}
                    />
                );
            })}
        </div>
    );
}
// Section.js
import { useState } from "react";
import SubSection from "./SubSection";
export default function Section({ section, index, updateList }) {
    const [open, setOpen] = useState(false);
    return (
        <div
            className="bg-gray-200 px-10 py-6 w-full 
                        text-slate-800 rounded shadow-lg 
                        transition hover:shadow-2xl 
                        hover:-translate-y-2 hover:scale-[101%]"
        >
            <div className="flex w-full justify-between items-center cursor-pointer">
                <h3
                    className="font-bold text-xl flex-1"
                    onClick={() => setOpen((prev) => !prev)}
                >
                    {section.title}
                </h3>
                <div className="flex gap-4 items-center">
                    <p className="font-bold text-slate-800">
                        {section.progress}%
                    </p>
                    <button
                        onClick={() => setOpen((prev) => !prev)}
                        className="bg-gray-800 text-white px-5 py-3 
                                   rounded hover:bg-gray-600"
                    >
                        {open ? "Close" : "Open"}
                    </button>
                </div>
            </div>
            {open && (
                <div className="flex flex-col w-full my-10 gap-4">
                    {section.subsections.map((sub, i) => {
                        return (
                            <SubSection
                                key={i}
                                index={i}
                                sectionIndex={index}
                                updateList={updateList}
                                subtitle={sub.subtitle}
                                completed={sub.completed}
                            />
                        );
                    })}
                </div>
            )}
        </div>
    );
}
// SubSection.js
export default function SubSection({
    subtitle,
    completed,
    index,
    sectionIndex,
    updateList,
}) {
    return (
        <div className="flex w-full justify-between items-center">
            <h4 className="font-bold text-lg">
                <span className="inline-block mr-4">{index}.</span> {subtitle}
            </h4>
            <input
                onChange={() => {
                    updateList(sectionIndex, index);
                }}
                checked={completed || false}
                type="checkbox"
                className="border rounded w-4 h-4 accent-emerald-500"
            />
        </div>
    );
}
// dsaTrackerList.js
const dsaTrackerList = [
    {
        title: "Arrays",
        progress: 0,
        subsections: [
            { subtitle: "Introduction to Arrays", completed: false },
            { subtitle: "Array Operations", completed: false },
            { subtitle: "Common Array Problems", completed: false },
        ],
    },
    {
        title: "Linked Lists",
        progress: 0,
        subsections: [
            { subtitle: "Singly Linked Lists", completed: false },
            { subtitle: "Doubly Linked Lists", completed: false },
            { subtitle: "Linked List Operations", completed: false },
        ],
    },
    {
        title: "Stacks",
        progress: 0,
        subsections: [
            { subtitle: "Introduction to Stacks", completed: false },
            { subtitle: "Stack Operations", completed: false },
            { subtitle: "Applications of Stacks", completed: false },
        ],
    },
    {
        title: "Queues",
        progress: 0,
        subsections: [
            { subtitle: "Introduction to Queues", completed: false },
            { subtitle: "Queue Operations", completed: false },
            { subtitle: "Applications of Queues", completed: false },
        ],
    },
    {
        title: "Trees",
        progress: 0,
        subsections: [
            { subtitle: "Binary Trees", completed: false },
            { subtitle: "Binary Search Trees", completed: false },
            { subtitle: "Tree Traversal", completed: false },
            { subtitle: "Balanced Trees", completed: false },
        ],
    },
    {
        title: "Sorting Algorithms",
        progress: 0,
        subsections: [
            { subtitle: "Bubble Sort", completed: false },
            { subtitle: "Insertion Sort", completed: false },
            { subtitle: "Merge Sort", completed: false },
            { subtitle: "Quick Sort", completed: false },
        ],
    },
    {
        title: "Graphs",
        progress: 0,
        subsections: [
            { subtitle: "Graph Representation", completed: false },
            { subtitle: "Graph Traversal", completed: false },
            { subtitle: "Shortest Path Algorithms", completed: false },
            { subtitle: "Minimum Spanning Tree", completed: false },
        ],
    },
];
export default dsaTrackerList;
// calculateProgress.js
export function findSectionProgress(subsections) {
    let completed = 0;
    for (let i = 0; i < subsections.length; i++) {
        if (subsections[i].completed) completed++;
    }
    return Math.round((completed / subsections.length) * 100);
}
export function findOverallProgress(dsalist) {
    let totalProgress = 0;
    for (let i = 0; i < dsalist.length; i++) {
        totalProgress += dsalist[i].progress;
    }
    return Math.round((totalProgress / (dsalist.length * 100)) * 100);
}
Steps to run the application:
Step 1: Type the following command in the terminal:
npm run dev
Step 2: Open the following URL in the web browser:
http://localhost:5173/
