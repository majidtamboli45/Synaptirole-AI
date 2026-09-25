# React.js useImperativeHandle Additional Hook

> Source: https://www.geeksforgeeks.org/reactjs/react-js-useimperativehandle-additional-hook/

The useImperativeHandle is an additional React hook that customizes the value exposed through a ref. Used with forwardRef, it allows a child component to control what is accessible through the ref instead of exposing its entire internal instance or DOM element.
-  Works together with forwardRef to customize ref values.
- Controls what a child component exposes through a ref.
- Helps keep internal component details encapsulated
Syntax:
useImperativeHandle(ref, createHandle, dependencies?)
where,
- ref: The ref object passed from the parent component.
- createHandle: A function that returns the value or methods to expose through the ref.
- dependencies (optional): An array of dependencies that determines when the handle should be recreated.
Return Value: It does not return any value. It customizes the value exposed through a ref.
The useImperativeHandle hook works in the similar phase of useRef hook but only it allows us to modify the instance that is going to be passed with the ref object which provides a reference to any DOM element. Although this hook is used in rare cases, it has some most advanced functionality.
Example: This example demonstrates how to use useImperativeHandle to expose the focus method from a child to its parent allowing the parent to focus the input field.
import React, { useRef } from "react";
import Input from "./Input";
const App = () => {
	const inputRef = useRef(null);
	return (
		<div>
			<Input onFocus={() => inputRef.current.focus()} ref={inputRef} />
		</div>
	);
};
export default App;
import React, { useRef, useImperativeHandle, forwardRef } from "react";
function Input(props, ref) {
	const btn = useRef();
	useImperativeHandle(ref, () => ({
		focus: () => {
			console.log("Input is in focus");
		}
	}));
	return <input ref={btn} {...props} placeholder="type here" />;
}
export default forwardRef(Input);
Output:
Use Cases of useImperativeHandle
- Exposing specific methods of a child component to its parent.
- Restricting access to internal component implementation details.
- Creating a controlled public API for reusable components and customizing the value returned through a ref.
- Allowing parent components to interact with child components without exposing the entire DOM element or component instance.
