# Event Calendar using React

> Source: https://www.geeksforgeeks.org/reactjs/event-calendar-using-react/

The Event calender using react basically displays a calendar with the additional feature of adding an event on a particular date by selecting it. User can also delete the event if he/she wants to delete it. All this logic of event creation and deletion is implemented using JSX. This project is useful in making applications where we have to create an event and set a reminder.
Event Calendar using React Preview Image
Let’s have a look at what our final project will look like:
Technologies Used/Pre-requisites for Event Calender in using React
Approach to Create Event Calender Using React:
To create the event calender using React we will be using the react-calender npm package. Style the calender using CSS classes. The calender :
- will provide users with a user-friendly interface for displaying dates and organizing events.
- includes input field, in which the user is prompted to enter the Event name, Date of event, and the Card which shows the information of the created event.
- Users can also delete the event as per their needs.
- The states are managed using the useState hook of ReactJS.
The updated dependencies in package.json will look like this:
{
"name": "event-calendar",
"version": "1.0.0",
"scripts": {
"dev": "vite",
"build": "vite build",
"serve": "vite preview"
},
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"react-calendar": "^3.5.0",
"vite": "^4.0.0"
},
"devDependencies": {
"vite": "^4.0.0"
}
}
Event Calender Using React Example
This example demostrate the Event calender using react with the help of react-calendar package.
/* App.css */
body {
    font-family: Arial, sans-serif;
    background-color: #f5f7fa;
    margin: 0;
    padding: 0;
}
.app {
    text-align: center;
    margin: 20px;
}
h1 {
    font-size: 2.5rem;
    margin-bottom: 20px;
    color: #05ca40ce;
}
.container {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    align-items: flex-start;
    margin-top: 2rem;
}
.calendar-container {
    flex: 1;
    max-width: 500px;
    margin-right: 2rem;
}
.event-container {
    flex: 1;
    max-width: 500px;
}
@media screen and (max-width: 768px) {
    .container {
        flex-direction: column;
    }
    .calendar-container,
    .event-container {
        max-width: 100%;
        margin-right: 0;
        margin-bottom: 2rem;
    }
}
.react-calendar {
    width: 100%;
    max-width: 500px;
    background: rgba(255, 255, 255, 0.9);
    border: 1px solid #ccc;
    font-family: Arial, Helvetica, sans-serif;
    line-height: 1.125em;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    border-radius: 8px;
    padding: 10px;
    transition: background-color 0.2s;
}
.react-calendar--doubleView {
    width: 100%;
}
.react-calendar--doubleView .react-calendar__viewContainer {
    display: flex;
    margin: -0.5em;
}
.react-calendar--doubleView .react-calendar__viewContainer>* {
    width: 50%;
    margin: 0.5em;
}
.react-calendar,
.react-calendar *,
.react-calendar *:before,
.react-calendar *:after {
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.react-calendar button {
    margin: 0;
    border: 0;
    outline: none;
}
.react-calendar button:enabled:hover {
    cursor: pointer;
}
.react-calendar__navigation {
    display: flex;
    height: 44px;
    margin-bottom: 1em;
}
.react-calendar__navigation button {
    min-width: 44px;
    background: none;
}
.react-calendar__navigation button:disabled {
    background-color: #f0f0f0;
}
.react-calendar__navigation button:enabled:hover,
.react-calendar__navigation button:enabled:focus {
    background-color: #e6e6e6;
}
.react-calendar__month-view__weekdays {
    text-align: center;
    text-transform: uppercase;
    font-weight: bold;
    font-size: 0.8rem;
}
.react-calendar__month-view__weekdays__weekday {
    padding: 0.5em;
}
.react-calendar__month-view__weekNumbers .react-calendar__tile {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.75em;
    font-weight: bold;
}
.react-calendar__month-view__days__day--weekend {
    color: #d10000;
}
.react-calendar__month-view__days__day--neighboringMonth {
    color: #757575;
}
.react-calendar__year-view .react-calendar__tile,
.react-calendar__decade-view .react-calendar__tile,
.react-calendar__century-view .react-calendar__tile {
    padding: 2em 0.5em;
}
.react-calendar__tile {
    max-width: 100%;
    padding: 10px 6.6667px;
    background: none;
    text-align: center;
    line-height: 16px;
}
.react-calendar__tile:disabled {
    background-color: #f0f0f0;
}
.react-calendar__tile:enabled:hover,
.react-calendar__tile:enabled:focus {
    background-color: #e6e6e6;
}
.react-calendar__tile--now {
    background: #ffff76;
}
.react-calendar__tile--now:enabled:hover,
.react-calendar__tile--now:enabled:focus {
    background: #ffffa9;
}
.react-calendar__tile--hasActive {
    background: #76baff;
}
.react-calendar__tile--hasActive:enabled:hover,
.react-calendar__tile--hasActive:enabled:focus {
    background: #a9d4ff;
}
.react-calendar__tile--active {
    background: #007bff;
    color: white;
}
.react-calendar__tile--active:enabled:hover,
.react-calendar__tile--active:enabled:focus {
    background: #0056b3;
}
.react-calendar--selectRange .react-calendar__tile--hover {
    background-color: #e6e6e6;
}
.event-form {
    margin-bottom: 20px;
}
.event-form h2 {
    margin-bottom: 10px;
    color: #007bff;
}
.event-form p {
    font-size: 1.2rem;
    color: #1403f6;
}
.event-form input {
    padding: 8px;
    font-size: 1rem;
    margin-right: 10px;
}
.create-btn {
    padding: 8px 16px;
    background-color: #ff4081;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.2s;
}
.create-btn:hover {
    background-color: #ff267f;
}
.event-list {
    margin-top: 20px;
}
.event-cards {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}
.event-card {
    width: 300px;
    background-color: rgba(255, 255, 255, 0.9);
    border-radius: 8px;
    margin: 10px;
    padding: 10px;
    cursor: pointer;
    transition: transform 0.2s, box-shadow 0.2s;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}
.event-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.event-card-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 10px;
}
.event-date {
    font-size: 1rem;
    color: #f07809;
}
.event-actions {
    display: flex;
}
.update-btn,
.delete-btn {
    padding: 8px 12px;
    margin-left: 5px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 0.9rem;
    cursor: pointer;
    transition: background-color 0.2s;
}
.update-btn:hover,
.delete-btn:hover {
    background-color: #0056b3;
}
.event-card-body {
    padding-bottom: 10px;
}
.event-title {
    font-size: 1.5rem;
    color: #fd0000;
}
.selected {
    background-color: #ff4081 !important;
    color: white;
}
.event-marked {
    background-color: #ff4081;
    color: white;
}
/* node_modules\react-calendar\dist\Calendar.css */
.react-calendar {
    width: 350px;
    max-width: 100%;
    background: white;
    border: 1px solid #a0a096;
    font-family: Arial, Helvetica, sans-serif;
    line-height: 1.125em;
}
.react-calendar--doubleView {
    width: 700px;
}
.react-calendar--doubleView .react-calendar__viewContainer {
    display: flex;
    margin: -0.5em;
}
.react-calendar--doubleView .react-calendar__viewContainer>* {
    width: 50%;
    margin: 0.5em;
}
.react-calendar,
.react-calendar *,
.react-calendar *:before,
.react-calendar *:after {
    -moz-box-sizing: border-box;
    -webkit-box-sizing: border-box;
    box-sizing: border-box;
}
.react-calendar button {
    margin: 0;
    border: 0;
    outline: none;
}
.react-calendar button:enabled:hover {
    cursor: pointer;
}
.react-calendar__navigation {
    display: flex;
    height: 44px;
    margin-bottom: 1em;
}
.react-calendar__navigation button {
    min-width: 44px;
    background: none;
}
.react-calendar__navigation button:disabled {
    background-color: #f0f0f0;
}
.react-calendar__navigation button:enabled:hover,
.react-calendar__navigation button:enabled:focus {
    background-color: #e6e6e6;
}
.react-calendar__month-view__weekdays {
    text-align: center;
    text-transform: uppercase;
    font-weight: bold;
    font-size: 0.75em;
}
.react-calendar__month-view__weekdays__weekday {
    padding: 0.5em;
}
.react-calendar__month-view__weekNumbers .react-calendar__tile {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 0.75em;
    font-weight: bold;
}
.react-calendar__month-view__days__day--weekend {
    color: #d10000;
}
.react-calendar__month-view__days__day--neighboringMonth {
    color: #757575;
}
.react-calendar__year-view .react-calendar__tile,
.react-calendar__decade-view .react-calendar__tile,
.react-calendar__century-view .react-calendar__tile {
    padding: 2em 0.5em;
}
.react-calendar__tile {
    max-width: 100%;
    padding: 10px 6.6667px;
    background: none;
    text-align: center;
    line-height: 16px;
}
.react-calendar__tile:disabled {
    background-color: #f0f0f0;
}
.react-calendar__tile:enabled:hover,
.react-calendar__tile:enabled:focus {
    background-color: #e6e6e6;
}
.react-calendar__tile--now {
    background: #ffff76;
}
.react-calendar__tile--now:enabled:hover,
.react-calendar__tile--now:enabled:focus {
    background: #ffffa9;
}
.react-calendar__tile--hasActive {
    background: #76baff;
}
.react-calendar__tile--hasActive:enabled:hover,
.react-calendar__tile--hasActive:enabled:focus {
    background: #a9d4ff;
}
.react-calendar__tile--active {
    background: #006edc;
    color: white;
}
.react-calendar__tile--active:enabled:hover,
.react-calendar__tile--active:enabled:focus {
    background: #1087ff;
}
.react-calendar--selectRange .react-calendar__tile--hover {
    background-color: #e6e6e6;
}
import React, { useState } from "react";
import Calendar from "react-calendar";
import "react-calendar/dist/Calendar.css";
import "./App.css";
const App = () => {
    const [selectedDate, setSelectedDate] = useState(null);
    const [eventName, setEventName] = useState("");
    const [events, setEvents] = useState([]);
    const Date_Click_Fun = (date) => {
        setSelectedDate(date);
    };
    const Event_Data_Update = (event) => {
        setEventName(event.target.value);
    };
    const Create_Event_Fun = () => {
        if (selectedDate && eventName) {
            const newEvent = {
                id: new Date().getTime(),
                date: selectedDate,
                title: eventName,
            };
            setEvents([...events, newEvent]);
            setSelectedDate(null);
            setEventName("");
            setSelectedDate(newEvent.date);
        }
    };
    const Update_Event_Fun = (eventId, newName) => {
        const updated_Events = events.map((event) => {
            if (event.id === eventId) {
                return {
                    ...event,
                    title: newName,
                };
            }
            return event;
        });
        setEvents(updated_Events);
    };
    const Delete_Event_Fun = (eventId) => {
        const updated_Events = events.filter((event) => event.id !== eventId);
        setEvents(updated_Events);
    };
    return (
        <div className="app">
            <h1> GeeksforGeeks Calendar Application </h1>
            <div className="container">
                <div className="calendar-container">
                    <Calendar
                        value={selectedDate}
                        onClickDay={Date_Click_Fun}
                        tileClassName={({ date }) =>
                            selectedDate &&
                            date.toDateString() === selectedDate.toDateString()
                                ? "selected"
                                : events.some(
                                      (event) =>
                                          event.date.toDateString() ===
                                          date.toDateString(),
                                  )
                                ? "event-marked"
                                : ""
                        }
                    />{" "}
                </div>
                <div className="event-container">
                    {" "}
                    {selectedDate && (
                        <div className="event-form">
                            <h2> Create Event </h2>{" "}
                            <p>
                                {" "}
                                Selected Date: {selectedDate.toDateString()}{" "}
                            </p>{" "}
                            <input
                                type="text"
                                placeholder="Event Name"
                                value={eventName}
                                onChange={Event_Data_Update}
                            />{" "}
                            <button
                                className="create-btn"
                                onClick={Create_Event_Fun}
                            >
                                Click Here to Add Event{" "}
                            </button>{" "}
                        </div>
                    )}
                    {events.length > 0 && selectedDate && (
                        <div className="event-list">
                            <h2> My Created Event List </h2>{" "}
                            <div className="event-cards">
                                {" "}
                                {events.map((event) =>
                                    event.date.toDateString() ===
                                    selectedDate.toDateString() ? (
                                        <div
                                            key={event.id}
                                            className="event-card"
                                        >
                                            <div className="event-card-header">
                                                <span className="event-date">
                                                    {" "}
                                                    {event.date.toDateString()}{" "}
                                                </span>{" "}
                                                <div className="event-actions">
                                                    <button
                                                        className="update-btn"
                                                        onClick={() =>
                                                            Update_Event_Fun(
                                                                event.id,
                                                                prompt(
                                                                    "ENTER NEW TITLE",
                                                                ),
                                                            )
                                                        }
                                                    >
                                                        Update Event{" "}
                                                    </button>{" "}
                                                    <button
                                                        className="delete-btn"
                                                        onClick={() =>
                                                            Delete_Event_Fun(
                                                                event.id,
                                                            )
                                                        }
                                                    >
                                                        Delete Event{" "}
                                                    </button>{" "}
                                                </div>{" "}
                                            </div>{" "}
                                            <div className="event-card-body">
                                                <p className="event-title">
                                                    {" "}
                                                    {event.title}{" "}
                                                </p>{" "}
                                            </div>{" "}
                                        </div>
                                    ) : null,
                                )}{" "}
                            </div>{" "}
                        </div>
                    )}{" "}
                </div>{" "}
            </div>{" "}
        </div>
    );
};
export default App;
Output:
