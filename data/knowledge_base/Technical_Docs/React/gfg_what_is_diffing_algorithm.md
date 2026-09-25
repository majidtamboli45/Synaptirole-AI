# What is Diffing Algorithm

> Source: https://www.geeksforgeeks.org/reactjs/what-is-diffing-algorithm/

A diffing algorithm is a reconciliation technique used by React to compare two virtual DOM trees and determine the exact differences between them. Based on this comparison, React generates a set of changes that represent how the user interface has evolved from one render to the next.
- It compares the previous virtual DOM tree with the newly generated virtual DOM tree.
- It identifies which elements, attributes, or content have changed between renders.
- The comparison results are used to create a list of updates required to synchronize the UI state.
Assumption for Diffing Algorithm
React uses a heuristic Diffing Algorithm for reconciliation based on the following assumptions:
- Elements of different types: Whenever the type of a root element changes, React removes the old tree and creates a new tree from scratch.
- Static elements can be identified: Developers can use keys to help React identify elements that remain unchanged between renders.
- React compares from the root: React starts checking for changes from the root element, and the update process depends on the type of the compared elements.
- Elements of the same type: When two elements have the same type, React compares their attributes and updates only the changed parts without rebuilding the entire tree.
Working of Diffing Algorithm
- Initial Render: React renders the UI and creates a Virtual DOM tree corresponding to the real DOM.
- State or Props Change: A user action or new data causes a change in the component's state or props.
- Create a New Virtual DOM: React generates a new Virtual DOM tree that reflects the updated UI.
- Compare Old and New Virtual DOM: React's diffing algorithm compares the previous Virtual DOM tree with the new one.
- Identify Differences: React determines which elements, attributes, or components have changed.
- Generate Minimal Updates: Based on the detected differences, React creates the smallest possible set of DOM update operations.
- Update the Real DOM: React applies only the necessary changes to the real DOM.
- Re-render Changed Parts: Only the affected parts of the webpage are re-rendered, improving performance.
Note: This is the reason why we should always use unique keys in the elements so that it will be easy for React to determine changes in the elements.
Challanges of the Diffing Algorithm
While the diffing algorithm is highly efficient, there are some cases where improper use can lead to performance issues
- Missing or duplicate keys: Not providing unique keys for list items can result in unnecessary re-renders.
- Complex nested structures: In deeply nested components, the diffing process may take longer, although it is still optimized compared to manual DOM manipulation.
Use cases of Diffing Algorithm
- Efficient UI Updates: Updates only the changed parts of the interface instead of re-rendering the entire page.
- Virtual DOM Reconciliation: Compares the old and new Virtual DOM trees to identify the minimum required updates.
- Handling Dynamic Content: Efficiently manages frequently changing content such as chat messages, feeds, and dashboards.
- Performance Optimization: Reduces unnecessary DOM manipulations, improving rendering speed and responsiveness.
- Real-Time Applications: Enables smooth and efficient updates in applications like collaborative editors, live scoreboards, and messaging platforms.
