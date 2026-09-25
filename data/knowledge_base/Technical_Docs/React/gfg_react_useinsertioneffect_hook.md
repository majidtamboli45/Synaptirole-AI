# React useInsertionEffect Hook

> Source: https://www.geeksforgeeks.org/reactjs/react-useinsertioneffect-hook/

The useInsertionEffect hook is designed specifically for CSS-in-JS library authors to synchronously inject global DOM nodes, like dynamic <style> tags or SVG <defs>—on the client side. By executing just before any layout effects fire, it ensures styles are inserted at the exact right moment during the rendering process.
- It avoids layout thrashing by ensuring the browser doesn't calculate layouts before the new styles are injected.
- It restricts access to React refs and prevents scheduling state updates due to its unique timing in the lifecycle.
- It is intended exclusively for library development rather than general application code.
Syntax:
useInsertionEffect(setup, dependencies?)
// Example
useInsertionEffect(() => {
// insert dynamic styles before layout effects fire
return () => {
// cleanup
};
}, []);
- The effect runs once on mount since the dependency array is empty ([ ] ) .
- The callback function contains the logic where styles (or DOM nodes) would be inserted .
- The returned function is a cleanup that runs when the component unmounts.
Example 1: In the below example, we have used the userInsertionEffect hook, where a dynamic color style is applied to the text element with the class as "dynamic-element". The color of the text changes from green to red on each button click, which demonstrates the hook's task to insert and update styles before layout effects are fired.
//App.js
import React, { useState } from 'react';
import { useInsertionEffect } from 'react';
function App() {
	const [dyna_color, set_Dyna_Color] = useState('green');
	const dStyle = `
	.dynamic-element {
	color: ${dyna_color};
	transition: color 0.5s ease;
	}
`;
	useInsertionEffect(() => {
		const styleEle = document.createElement('style');
		styleEle.innerHTML = dStyle;
		document.head.appendChild(styleEle);
		return () => {
			document.head.removeChild(styleEle);
		};
	}, [dyna_color]);
	const btnFn = () => {
		set_Dyna_Color('red');
	};
	return (
		<div className="dynamic-element">
			<h1>Hello, GeeksforGeeks!</h1>
			<h3>useInsertionEffect Hook - Example 1</h3>
			<button onClick={btnFn}>Change Color</button>
		</div>
	);
}
export default App;
Output:
Example 2: In the below example, we are using the React useInsertionEffect Hook to dynamically inject and update the styles for the button. The theme state and updating the button's appearance based on button clicks are done using the hook.
// App.js
import React, { useState } from 'react';
import { useInsertionEffect } from 'react';
function App() {
	const [btn_Theme, set_btn_Theme] = useState('dark');
	const [count, set_Count] = useState(0);
	useInsertionEffect(() => {
		const rule = styleRuleFn(btn_Theme);
		document.head.appendChild(rule);
		return () => document.head.removeChild(rule);
	}, [btn_Theme, count]);
	const btnFn = () => {
		set_Count((prevCounter) => prevCounter + 1);
		set_btn_Theme(btn_Theme === 'dark' ? 'light' : 'dark');
	};
	return (
		<div>
			<h1 style={{ color: 'green' }}>GeeksforGeeks</h1>
			<h3>useInsertionEffect Hook - Example 2</h3>
			<button onClick={btnFn}>
				{btn_Theme === 'dark' ? 'Light Mode' : 'Dark Mode'} - Click Count: {count}
			</button>
		</div>
	);
}
const styleRuleFn = (theme) => {
	const tag = document.createElement('style');
	tag.innerHTML = `
	button {
	color: ${theme === 'dark' ? 'white' : 'black'};
	background-color: ${theme === 'dark' ? 'black' : 'white'};
	transition: color 0.5s, background-color 0.5s;
	}
`;
	return tag;
};
export default App;
Output:
