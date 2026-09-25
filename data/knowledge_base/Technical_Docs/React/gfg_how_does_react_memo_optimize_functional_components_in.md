# How does React.memo() optimize functional components in React?

> Source: https://www.geeksforgeeks.org/reactjs/how-does-react-memo-optimize-functional-components-in-react/

React.memo() is a higher-order component that optimizes functional components by preventing re-renders when props don’t change. It uses shallow comparison to reuse the previously rendered output, improving performance.
How React.memo() works
- Reducing Re-renders: React compares previous and current render outputs; if unchanged, it skips re-rendering the component and its subtree, improving performance.
- Memoization: React.memo() caches results of functional components and reuses them when inputs (props) are the same.
- Comparing Props: React.memo() stores previous props and compares them with new ones; if unchanged, it reuses the previous render and skips re-rendering.
- Shallow Comparison: It uses Object.is() for a shallow (top-level) props comparison, not deep checks of nested data.
- Caveats: Use only when rendering is expensive and props are usually unchanged; frequent prop changes reduce its benefit.
When to use React.memo()
When incorporating React.memo(), it's crucial to exercise caution, as excessively memoizing components can lead to reduced performance by introducing unnecessary overhead. To optimize effectively, consider the following best practices:
- Memoize components with substantial rendering costs or intricate logic that infrequently changes, such as table rows or product cards.
- Memoize components that receive consistent props but may exhibit distinct internal states or behaviors.
- Memoize components integrated into frequently re-rendered lists, like those in tables or lists.
Steps to use React.memo()
React.memo() is easy to use and intuitive. Here's how to use React.memo() to memoize a functional component step-by-step:
Step 1: Import your React.memo() file at the top.
import React, { memo } from 'react';
Step 2: To define your functional component using the below syntax.
const FunctionalComponet = ({ prop1, prop2 }) => {   
return <div>{prop1} {prop2}</div>;
};
Step 3: To Memoize your component by wrapping it with React.memo():
const ToMemoized = memo(FuntionalComponent);
Step 4: To use your memoized component in your parent component using the following syntax:
const ComponentParent = () => {   
return (
<div>
<ToMemoized prop1="Hello" prop2="GeeksforGeeks" />
</div>
);
};
By applying React.memo() to your functional component, it is now memoized, ensuring that it will only re-render when there are changes in its props. The usage of memo is straightforward and simplifies the management of component rendering.
Example: In this example, `FuntionalComponent` is wrapped with `React.memo()`, which memoizes the component based on its props. If the `prop1` and `prop2` props remain the same between renders, React will reuse the previous render result, preventing unnecessary re-renders.
import React from 'react';
const FunctionalComponent = React.memo(({ prop1, prop2 }) => {
    // Component logic...
    return (
        <div>
            <p>Prop 1: {prop1}</p>
            <p>Prop 2: {prop2}</p>
        </div>
    );
});
export default FunctionalComponent;
import React from 'react';
import FunctionalComponent from './AnotherComponent';
const ComponentParent = () => {
    const exampleProp1 = "Hello";
    const exampleProp2 = 42;
    return (
        <div>
            <h2>Parent Component</h2>
            <FunctionalComponent
                prop1={exampleProp1} prop2={exampleProp2} />
        </div>
    );
};
export default ComponentParent;
Output:
Benefits of memoization using React.memo():
- For a component displaying the current date and time, where re-rendering with every parent component update is unnecessary, given the infrequent changes once per second.
- When dealing with a component showcasing a list of items subject to filtering or sorting, memoization can prevent unnecessary re-renders of each list item.
Strike a balance in optimizing and memoization efforts, avoiding unnecessary complexities while enhancing performance.
