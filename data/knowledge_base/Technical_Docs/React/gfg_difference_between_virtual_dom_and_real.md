# Difference Between Virtual DOM and Real DOM

> Source: https://www.geeksforgeeks.org/reactjs/difference-between-virtual-dom-and-real-dom/

Understanding the difference between Virtual DOM and Real DOM is important in ReactJS. Real DOM is the actual structure represented in the User Interface and the virtual DOM object is the same as a real DOM object, except that it is a lightweight copy.
Virtual DOM
The Virtual DOM is a concept used by modern frameworks like React to optimize the rendering process. It is a lightweight, in-memory representation of the Real DOM that allows developers to make changes without directly manipulating the on-screen elements.
A Virtual DOM Object is the Same as a Real DOM Object:
A virtual DOM object is the same as a real DOM object, except that it is a lightweight copy. This means that it cannot manipulate on-screen elements. Moreover, upon any change of a property, it only updates the corresponding nodes and not the entire tree. That makes it a quick and efficient alternative.
How Does the Virtual DOM Work?
The Virtual DOM works by creating an in-memory representation of the Real DOM, allowing developers to make changes without directly affecting the actual page. Here’s how it works:
- Virtual DOM Creation: When the application state changes, the Virtual DOM creates a new virtual tree.
- Diffing Algorithm: The new Virtual DOM tree is compared with the previous version, and the differences (known as "diffs") are calculated.
- Batch Updates: Instead of updating the entire Real DOM, only the nodes that have changed are updated, leading to faster rendering.
This approach ensures that the updates are efficient, minimizing the time taken to render changes on the screen.
Why Do Modern Frameworks Use the Virtual DOM?
Frameworks like React.js use the Virtual DOM to improve the performance of web applications. When an app’s state changes, the Virtual DOM creates a new representation of the UI and compares it with the previous one using a diffing algorithm. This approach allows for:
- Faster Re-Renders: Since only the changed nodes are updated, it avoids unnecessary re-renders of the entire tree.
- Smooth User Interfaces: Updates happen quickly, providing a better user experience in dynamic web applications.
- Efficient Memory Use: By minimizing the need for complete tree re-renders, the memory footprint is reduced.
Real DOM
The Real DOM (Document Object Model) represents the structure of an HTML document in the form of a tree, where each node corresponds to an element in the document. It is an interface that allows programming languages, such as JavaScript, to manipulate and interact with the content, structure, and style of a webpage.
Characteristics of the Real DOM:
- Directly Manipulates On-Screen Elements: Any changes made to the Real DOM immediately reflect on the user interface.
- Slow Updates for Large Trees: When updating an element, the entire DOM tree needs to be re-rendered, which can be time-consuming, especially for complex applications.
- Full Tree Re-Renders: Even minor changes require traversing the entire DOM tree, which affects performance.
Differences between Real Dom and Virtual Dom
Understanding the distinctions between the Virtual DOM and Real DOM is crucial for optimizing performance in React applications.
| Real DOM | Virtual DOM | 
|---|---|
| Real DOM represent actual structure of the webpage. | Virtual DOM represent the virtual/memory representation of the Webpage. | 
| DOM manipulation is very expensive | DOM manipulation is very easy | 
| There is too much memory wastage | No memory wastage | 
| It updates Slow | It updates fast | 
| It can directly update HTML | It can't update HTML directly | 
| Creates a new DOM if the element updates. | Update the JSX if the element update | 
| It allows us to directly target any specific node (HTML element) | It can produce about 200,000 Virtual DOM Nodes / Second. | 
| It represents the Ul of your application | It is only a virtual representation of the DOM |
