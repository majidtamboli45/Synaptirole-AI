# ReactJS componentDidUpdate() Method

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-componentdidupdate-method/

componentDidUpdate() is a React lifecycle method that runs immediately after a component’s updates are applied to the DOM. It is useful for performing actions that depend on updated props or state.
- Fetch new data when props or state change.
- Update external APIs or trigger side-effects after updates.
- Perform DOM manipulations based on updated values.
- Log changes or track component updates for debugging.
Syntax:
componentDidUpdate(prevProps, prevState, snapshot) {   /
/ Your code here
}
- prevProps: This parameter contains the props that the component had before the update.
- prevState: This parameter contains the state of the component before the update.
- snapshot(optional): This is rarely used but they return value using the getSnapshotBeforeUpdate() method.
Time to Call componentDidUpdate()
componentDidUpdate() is called after the component’s updates are flushed to the DOM. This typically happens
- When the component’s props or state has changed, causing a re-render.
- After React applies these updates to the DOM and ensures the user sees the new UI.
- As a phase to handle side-effects that rely on the updated DOM or new state values.
It’s important to note that componentDidUpdate() is part of the React class component lifecycle. In modern React applications, functional components with hooks (like useEffect()) are more commonly used, offering a similar post-update side-effect capability.
Implementing componentDidUpdate() Method
It Use this method to perform actions after a component updates, such as fetching data, updating the DOM, logging changes, or triggering side-effects based on new props or state.
Tracking Scroll Position
The user scroll position and updates the component state. If the user scrolls past a certain threshold, the component can trigger additional actions or display messages.
import React, { Component } from "react";
class ScrollTracker extends Component {
    state = { scrollPosition: 0 };
    componentDidMount() {
        window.addEventListener("scroll", this.handleScroll);
    }
    componentDidUpdate(prevProps, prevState) {
        if (this.state.scrollPosition !== prevState.scrollPosition) {
            console.log(`Scroll position updated: ${this.state.scrollPosition}px`);
            if (this.state.scrollPosition > 300) {
                console.log("You've scrolled past 300px!");
            }
        }
    }
    componentWillUnmount() {
        window.removeEventListener("scroll", this.handleScroll);
    }
    handleScroll = () => {
        this.setState({ scrollPosition: window.scrollY });
    };
    render() {
        return (
            <div>
                <h1>Scroll down and check the console</h1>
                <p style={{ height: "1500px" }}>Keep scrolling...</p>
            </div>
        );
    }
}
export default ScrollTracker;
Output:
- The code listens for the window’s scroll event and records the current scroll position in the component’s state.
- When the scroll position changes, componentDidUpdate() logs the new position and prints a message if the user scrolls past 300 pixels.
- In componentWillUnmount(), the code removes the scroll event listener to prevent memory leaks and unnecessary updates.
- The rendered component displays a heading and a long paragraph, encouraging the user to scroll and see the updates in the console.
Time To Use componentDidUpdate()
It Use it to perform actions that depend on updated props or state, such as fetching new data, updating the DOM, or triggering side-effects after a component re-renders.
After Props or State Change
Use componentDidUpdate() when you need to perform actions in response to changes in props or state. This is common when you want to trigger side effects like making a new API call or updating data that depends on new props.
Example: If a component’s userId prop changes, you may want to fetch new data for that user
componentDidUpdate(prevProps) {  
if (this.props.userId !== prevProps.userId) {
this.fetchData(this.props.userId);
}
}
To Trigger Side Effects
After a state or prop change, use componentDidUpdate() to trigger side effects like updating external libraries, interacting with third-party tools, or performing non-UI operations.
Example: You can use it to trigger animations when the component’s state changes
componentDidUpdate(prevState) {  
if (this.state.isVisible !== prevState.isVisible) {
this.startAnimation();
}
}
Compare Old and New State or Props
If you need to compare the previous and current values of props or state, componentDidUpdate() can be used. This comparison can help decide whether or not to trigger another state change or effect.
Example: When a filter changes, you might want to recalculate or re-fetch data only if the filter has actually changed
componentDidUpdate(prevProps) {  
if (this.props.filter !== prevProps.filter) {
this.calculateResults();
}
}
For DOM Manipulation (Post Update)
While it’s best to avoid direct DOM manipulation in React, componentDidUpdate() can be used for the conditions where you need to make sure the component is updated and ready before manipulating the DOM.
Example: After updating the component, you might want to adjust the scroll position or focus an element:
componentDidUpdate() {  
if (this.state.scrollToBottom) {
window.scrollTo(0, document.body.scrollHeight);
}
}
Best Practices
It Perform actions like data fetching or animations after updates, always compare previous and current props/state to avoid unnecessary operations, and use getSnapshotBeforeUpdate() when you need information from the DOM before it changes.
- Handle post-update tasks such as fetching data or triggering animations.
- Compare previous and current props/state to prevent redundant operations.
- Use getSnapshotBeforeUpdate() to capture DOM info before updates.
- Keep logic efficient to avoid slowing down rendering or causing side-effects.
Situations to Avoid Using componentDidUpdate()
There are certain scenarios where using componentDidUpdate() might be unnecessary:
- No Additional Operations After Updates: If your component updates do not require running side effects—like network calls or DOM manipulations—then you don’t need to implement componentDidUpdate().
- Simple Components Without Dependencies: If your component only depends on its props and state for rendering, and you don’t need to trigger any external updates or actions, then componentDidUpdate() isn’t needed.
