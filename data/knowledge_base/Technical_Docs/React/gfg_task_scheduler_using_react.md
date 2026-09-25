# Task Scheduler using React

> Source: https://www.geeksforgeeks.org/reactjs/task-scheduler-using-react/

A Task Scheduler is a web application that helps users manage their tasks efficiently. It allows users to add new tasks by specifying details like the task name, priority, and deadline. The app organizes tasks into two categories: upcoming tasks, which are tasks that need to be completed, and completed tasks, which are tasks that have been marked as done.
Let's have a quick look at what the final application will look like:
Steps to Create the Task Scheduler:
Step 1: Create a react application by using this command
npm create vite@latest  task-scheduler-app
Step 2: After creating your project folder, i.e. task-scheduler-app, use the following command to navigate to it:
cd task-scheduler-app
Folder Structure:
The updated dependecies in package.json file will look like
 "dependencies": {
"react": "^19.1.0",
"react-dom": "^19.1.0"
},
"devDependencies": {
"@vitejs/plugin-react": "^4.6.0",
"vite": "^7.0.4"
}
Example: Write the below code in App.js file and App.css in the src directory
/* App.css */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    margin: 0;
    padding: 0;
    color: #333;
}
header {
    background-color: white;
    color: green;
    text-align: center;
    padding: 1rem 0;
    box-shadow: 0 4px 18px grey;
}
main {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background-color: #fff;
    box-shadow: 0 4px 18px grey;
    border-radius: 15px;
}
.task-form {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 20px;
}
.task-form input,
.task-form select,
.task-form button {
    padding: 10px;
    border: 1px solid #ccc;
    font-size: 16px;
    flex: 1;
    border-radius: 10px;
}
button {
    background-color: green;
    color: white;
    border: none;
    cursor: pointer;
}
.mark-done {
    padding: 10px;
    font-size: 16px;
    flex: 1;
    border-radius: 15px;
    background-color: crimson;
    color: white;
    border: none;
    cursor: pointer;
}
.task-list {
    border: 1px solid #ddd;
    padding: 10px;
}
table {
    width: 100%;
    margin-top: 20px;
    background-color: #fff;
    border: 1px solid #ddd;
}
table th,
table td {
    padding: 19px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}
table th {
    background-color: #eee;
    color: black;
    border-radius: 10px;
}
.completed-task-list {
    margin-top: 20px;
}
.completed-task {
    padding: 10px;
    border: 1px solid crimson;
    border-radius: 5px;
    background-color: #eaffea;
}
.completed-task h2 {
    color: #28a745;
}
h2 {
    font-size: 1.3rem;
}
.heading {
    padding-bottom: 10px;
}
.cheading {
    color: rgb(54, 54, 54);
}
//App.jsx
import React, { useState } from "react";
import "./App.css"; // Import your CSS file here
function App() {
    const [tasks, setTasks] = useState([]);
    const [completedTasks, setCompletedTasks] = useState([]);
    const [task, setTask] = useState("");
    const [priority, setPriority] = useState("top");
    const [deadline, setDeadline] = useState("");
    const handleTaskChange = (e) => {
        setTask(e.target.value);
    };
    const handlePriorityChange = (e) => {
        setPriority(e.target.value);
    };
    const handleDeadlineChange = (e) => {
        setDeadline(e.target.value);
    };
    const addTask = () => {
        if (task.trim() === "" || deadline === "") {
            alert("Please enter a task and select a valid deadline.");
            return;
        }
        const selectedDate = new Date(deadline);
        const currentDate = new Date();
        if (selectedDate <= currentDate) {
            alert("Please select a future date for the deadline.");
            return;
        }
        const newTask = {
            id: tasks.length + 1,
            task,
            priority,
            deadline,
            done: false,
        };
        setTasks([...tasks, newTask]);
        setTask("");
        setPriority("top");
        setDeadline("");
    };
    const markDone = (id) => {
        const updatedTasks = tasks.map((t) =>
            t.id === id ? { ...t, done: true } : t
        );
        setTasks(updatedTasks);
        const completedTask = tasks.find((t) => t.id === id);
        if (completedTask) {
            setCompletedTasks([...completedTasks, completedTask]);
        }
    };
    const upcomingTasks = tasks.filter((t) => !t.done);
    return (
        <div className="App">
            <header>
                <h1>Task Scheduler</h1>
            </header>
            <main>
                <div className="task-form">
                    <input
                        type="text"
                        id="task"
                        placeholder="Enter task..."
                        value={task}
                        onChange={handleTaskChange}
                    />
                    <select
                        id="priority"
                        value={priority}
                        onChange={handlePriorityChange}
                    >
                        <option value="top">Top Priority</option>
                        <option value="middle">Middle Priority</option>
                        <option value="low">Less Priority</option>
                    </select>
                    <input
                        type="date"
                        id="deadline"
                        value={deadline}
                        onChange={handleDeadlineChange}
                    />
                    <button id="add-task" onClick={addTask}>
                        Add Task
                    </button>
                </div>
                <h2 className="heading">Upcoming Tasks</h2>
                <div className="task-list" id="task-list">
                    <table>
                        <thead>
                            <tr>
                                <th>Task Name</th>
                                <th>Priority</th>
                                <th>Deadline</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            {upcomingTasks.map((t) => (
                                <tr key={t.id}>
                                    <td>{t.task}</td>
                                    <td>{t.priority}</td>
                                    <td>{t.deadline}</td>
                                    <td>
                                        {!t.done && (
                                            <button
                                                className="mark-done"
                                                onClick={() => markDone(t.id)}
                                            >
                                                Mark Done
                                            </button>
                                        )}
                                    </td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
                <div className="completed-task-list">
                    <h2 className="cheading">Completed Tasks</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Task Name</th>
                                <th>Priority</th>
                                <th>Deadline</th>
                            </tr>
                        </thead>
                        <tbody>
                            {completedTasks.map((ct) => (
                                <tr key={ct.id}>
                                    <td>{ct.task}</td>
                                    <td>{ct.priority}</td>
                                    <td>{ct.deadline}</td>
                                </tr>
                            ))}
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
    );
}
export default App;
Steps to run the Application:
- Type the following command in the terminal:
npm run dev
- Type the following URL in the browser:
http://localhost:5173/
Output:
