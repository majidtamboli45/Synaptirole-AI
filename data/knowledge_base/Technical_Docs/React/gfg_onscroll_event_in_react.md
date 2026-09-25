# onScroll Event in React

> Source: https://www.geeksforgeeks.org/reactjs/react-onscroll-event/

onScroll is a React event triggered when a user scrolls an element or the window, enabling tracking of scroll position and dynamic UI updates.
- Triggered on Scroll: Fires when scrolling occurs on an element or window.
- Track Position: Used to monitor scroll position.
- Infinite Scrolling: Helps load more content dynamically.
- Lazy Loading: Loads content only when it enters the viewport.
- UI Updates: Enables effects like sticky headers or animations.
Syntax:
<element onScroll={handlerFunction} />
- element: The JSX element (e.g., <div>, <section>, or <body>) to which the scroll event is attached.
- onScroll: The event handler prop in camelCase.
- handlerFunction: The function that will be called whenever the scroll event is triggered.
Working
The onScroll event in React is triggered whenever the user scrolls an element (like a div) or the window. It helps track how far the user has scrolled.
1. Triggered on Scroll: The onScroll event is fired when the user scrolls an element or the window.
2. Access Scroll Properties: Inside the event handler, you can access the following properties:
- scrollTop: The number of pixels the content has been scrolled.
- scrollHeight: The total height of the content inside the scrollable area.
- clientHeight: The visible height of the scrollable element.
Example 1: Basic implementation of onScroll() event to get the scroll position.
import React, { useState } from "react";
function App() {
  // State to store the scroll position
  const [scrollPosition, setScrollPosition] = useState(0);
  // Event handler for the scroll event
  const handleScroll = (event) => {
    // The target of the event is the div that is being scrolled
    const scrollTop = event.target.scrollTop;
    setScrollPosition(scrollTop); // Update the scroll position in state
  };
  return (
    <div>
      {/* Fixed position to display scroll position */}
      <h1 style={{ position: "fixed", top: "20px", left: "20px", color: "red" }}>
        Scroll Position: {scrollPosition}px
      </h1>
      {/* Scrollable div */}
      <div
        className="scrollable-element"
        style={{
          height: "300px",
          width: "100%",
          overflowY: "scroll",
          border: "1px solid #ccc",
          paddingTop: "40px", // Space to avoid overlap with the fixed h1
        }}
        onScroll={handleScroll}
      >
        {/* Content with enough height to enable scrolling */}
        <p>
          Scroll down to see the position update. Lorem ipsum dolor sit amet, consectetur adipiscing elit. 
          Curabitur sit amet velit ut purus condimentum tincidunt. Suspendisse sit amet purus quam. 
          Nulla facilisi. Sed vel felis leo. Pellentesque ut dui quam.
        </p>
        <p>
          Nulla convallis lectus eget turpis tempor, sed elementum lacus aliquet. Sed maximus ligula at dolor 
          vehicula, ac consequat nunc pellentesque. Cras auctor volutpat interdum. Sed vel felis leo. 
          Pellentesque ut dui quam. Suspendisse sit amet purus quam.
        </p>
        <p>
          Curabitur in velit sit amet velit ullamcorper iaculis non id urna. Aenean nec ante erat. 
          Maecenas sollicitudin neque in quam elementum placerat. Phasellus feugiat dolor ac odio mollis, 
          euismod feugiat nisi ullamcorper. Mauris sed velit mi.
        </p>
        <p>
          Donec vitae libero vitae felis pharetra fermentum. Integer malesuada venenatis est in laoreet. 
          Vestibulum feugiat laoreet nunc at scelerisque. Etiam convallis felis nec justo iaculis, et elementum 
          enim sodales. Sed convallis volutpat orci in volutpat. Suspendisse facilisis sollicitudin.
        </p>
        <p>
          Integer malesuada venenatis est in laoreet. Vestibulum feugiat laoreet nunc at scelerisque. 
          Etiam convallis felis nec justo iaculis, et elementum enim sodales. Sed convallis volutpat orci in volutpat.
        </p>
      </div>
    </div>
  );
}
export default App;
Output:
Example 2: Basic implementation of onScroll() event to change the background color according to scroll position.
import React, { useState } from "react";
function App() {
	const [backgroundColor, setBackgroundColor] = useState("white");
	const handleScroll = (event) => {
		const { scrollTop, scrollHeight, clientHeight } = event.target;
		const scrollRatio = scrollTop / (scrollHeight - clientHeight);
		if (scrollRatio > 0.5) {
			setBackgroundColor("lightblue");
		} else {
			setBackgroundColor("white");
		}
	};
	return (
		<div
			className="scrollable-section"
			style={{
				height: "300px",
				overflowY: "scroll",
				border: "1px solid #ccc",
				backgroundColor: backgroundColor,
				transition: "background-color 0.5s ease",
			}}
			onScroll={handleScroll}
		>
			<p style={{ paddingTop: "200px", textAlign: "center" }}>
				Scrollable Section
			</p>
			<p style={{ paddingTop: "500px", textAlign: "center" }}>
				Keep scrolling...
			</p>
			<p style={{ paddingTop: "800px", textAlign: "center" }}>
				Background Changes on Scroll
			</p>
		</div>
	);
}
export default App;
Note: It is similar to the HTML DOM onscroll event but uses the camelCase convention in React.
Best Practices
Handling the onScroll event in React is straightforward, but to ensure smooth performance and a better user experience, there are a few best practices you should follow.
- Avoid Direct DOM Manipulation: Always use React state instead of directly manipulating the DOM. This keeps your app efficient.
- Update State Only When Needed: Don’t update the state on every scroll event. Only update it when necessary to avoid performance issues.
- Optimize Re-renders: Use React.memo or useMemo to prevent unnecessary re-renders when only the scroll data changes.
- Track Scroll Using Relevant Properties: Use scrollTop, scrollHeight, and clientHeight to calculate the scroll position and handle logic like infinite scroll or sticky elements.
