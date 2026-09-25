# Lazy Loading in React

> Source: https://www.geeksforgeeks.org/reactjs/lazy-loading-in-react-and-how-to-implement-it/

Lazy Loading in React is a performance optimization technique that loads only the required content initially, improving page load speed. Additional components, images, or scripts are loaded only when needed, such as on user interaction or scrolling.
- Improves application performance by reducing initial load time.
- Loads components, modules, or assets asynchronously when required.
- Implemented using React.lazy() along with the Suspense component.
Syntax:
// Implement Lazy Loading with React.Lazy method
const MyComponent = React.lazy(() => import('./MyComponent'));
Approach
To implement the lazyloading in react follow the steps given below:
- Firstly, Recognize the component you want to Lazy Load. These are mostly Large or complex which is not necessary for all the users when the page loads.
- Import the lazy() and Suspense components from the React package
- Use the lazy() function to dynamically import the component you want to lazy load:
Note that the argument to the lazy() function should be a function that returns the result of the import() function.
- Wrap the lazy-loaded component in a Suspense component, which will display a fallback UI while the component is being loaded:
<Suspense fallback={<div>Loading...</div>}>
<MyComponent />
</Suspense>
Example: It uses the Suspense component and lazy method to implement the lazyloading for specific components.
import React from "react";
import { Suspense, lazy } from "react";
const Component1 = lazy(() => 
	import("../src/LazyContent/myComponent1"));
const Component2 = lazy(() => 
	import("../src/LazyContent/myComponent2"));
function App() {
	return (
		<>
			<h1> Lazy Load</h1>
			<Suspense
				fallback={<div>Component1 are loading please wait...</div>}
			>
				<Component1 />
			</Suspense>
			<Suspense
				fallback={<div>Component2 are loading please wait...</div>}
			>
				<Component2 />
			</Suspense>
		</>
	);
}
export default App;
Output:
- React.lazy() enables lazy loading through code splitting, where webpack divides the app into separate chunks loaded on demand.
- Components are loaded only when requested, reducing the initial bundle size.
- React Suspense is used to define fallback UI (like loaders or spinners) during asynchronous loading.
- Suspense improves user experience by preventing blank screens while components or data load.
- Code splitting boosts performance by minimizing initial load time, making large applications faster and more responsive.
Advantages
Here are some key advantages of lazy loading:
- Lazy loading allows you to use server resources more efficiently by loading only the resources you need.
- This is very important for high-traffic applications or when server resources are tight.
- A quicker initial load time can be achieved by using lazy loading, which minimizes the amount of code that must be downloaded and parsed when the page first loads.
- This can speed up your application's first load time greatly.
