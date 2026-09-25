# ReactJS Reconciliation

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-reconciliation/

Reconciliation is the process React uses to determine how to efficiently update the DOM (Document Object Model) when changes occur in the UI. React aims to update the page as efficiently as possible, avoiding unnecessary re-renders and improving performance.
Reconciliation helps in the following ways:
- Minimizes unnecessary updates: React only changes the parts of the UI that actually need to be updated, rather than re-rendering the entire page.
- Improves performance: By optimizing the update process, React reduces the number of changes to the actual DOM, which improves the performance of your application.
- Ensures consistency: React ensures that the UI always matches the current state of your application, even as it changes over time.
How ReactJS Reconciliation Works
The reconciliation process involves the following steps:
1. Render Phase
- React calls the render() method of a component to generate a new virtual DOM representation.
- This new Virtual DOM is compared with the previous Virtual DOM snapshot.
2. Diffing Algorithm
- React compares the old and new virtual DOM trees to determine the differences.
- Instead of re-rendering the entire UI, React updates only the changed nodes.
3. Commit Phase
- Once the differences are determined, React applies the updates to the real DOM in the most efficient way.
- React batches updates and minimizes reflows and repaints for better performance.
Diffing Algorithm and Its Role in Reconciliation
The Diffing Algorithm plays a crucial role in the Reconciliation process. It is responsible for
- Identifying Differences: The diffing algorithm identifies the differences between the old and new Virtual DOM trees by comparing each element.
- Minimizing DOM Changes: The algorithm ensures that only the minimal number of changes are applied to the actual DOM.
- Optimization: The diffing algorithm optimizes updates by reusing elements where possible and only making necessary changes.
Strategies for Optimizing ReactJS Reconciliation
- Use shouldComponentUpdate: To prevent unnecessary re-renders when props or state don’t change, use shouldComponentUpdate() in class components.
- Use React.memo: Prevents re-renders in functional components when props don’t change using React.memo() .
- Use key Prop Efficiently in Lists: Assign unique keys to items in React lists to help efficiently update only changed elements.
- Avoid Inline Functions/Objects: Inline functions/objects in JSX recreate every render, triggering re-renders; move them outside or memoize with useCallback .
- Use React.PureComponent: React.PureComponent uses shallow prop/state comparison to prevent unnecessary re-renders.
