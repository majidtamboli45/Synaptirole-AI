# React onResize Event

> Source: https://www.geeksforgeeks.org/reactjs/react-onresize-event/

React onResize() event is not like onClick() or onChange(). Instead, developers can leverage the window object's resize event within the useEffect() hook to handle resizing events.
It is similar to the HTML DOM onresize event but uses the camelCase convention in React.
Syntax:
const handleResize = () => {setWindowWidth(window.innerWidth); };
Parameter: onResize() is not a direct prop or event handler. Therefore, it doesn't have a specific parameter.
Return type: The return type of the function attached to onResize doesn't have a return value or a defined return type. Its purpose is execute logic in response to the window or element resizing.
Example 1: This example displays screen size on browser window when screen is resized
// App.js
import React, { useState, useEffect } from "react";
function App() {
    const [windowWidth, setWindowWidth] = useState(window.innerWidth);
    useEffect(() => {
        const handleResize = () => {
            setWindowWidth(window.innerWidth);
        };
        window.addEventListener("resize", handleResize);
        return () => {
            window.removeEventListener("resize", handleResize);
        };
    }, []);
    return (
        <div>
            <h2>Window Width: {windowWidth}px</h2>
            {windowWidth > 768 ? (
                <p>This is a wide screen layout.</p>
            ) : (
                <p>This is a mobile-friendly layout.</p>
            )}
        </div>
    );
}
export default App;
Output:
Example 2: Basic implementation of onResize() event to change the background color according to screen size.
// App.js
import React, { useState, useEffect } from "react";
function App() {
    const [bgColor, setBgColor] = useState("lightblue");
    useEffect(() => {
        const handleResize = () => {
            if (window.innerWidth > 768) {
                setBgColor("lightgreen");
            } else {
                setBgColor("lightblue");
            }
        };
        window.addEventListener("resize", handleResize);
        // Cleanup: Remove event listener on component unmount
        return () => {
            window.removeEventListener("resize", handleResize);
        };
    }, []);
    return (
        <div style={{ height: "200px", backgroundColor: bgColor }}>
            <h2>Dynamic Background Color</h2>
            <p>The background color changes based on window width.</p>
        </div>
    );
}
export default App;
Output:
