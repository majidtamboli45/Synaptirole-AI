# ReactJS Pure Components

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-pure-components/

ReactJS Pure Components are similar to regular class components but with a key optimization. They skip re-renders when the props and state remain the same. While class components are still supported in React, it's generally recommended to use functional components with hooks in new code for better performance and simplicity.
In this article, we will explore what a Pure Component is in React, along with its key features and use cases, with some examples.
Prerequisites
import React from "react";
export default class Test extends React.PureComponent {
    render() {
        return <h1>Welcome to GeeksforGeeks</h1>;
    }
}
Output
How Does a Pure Component Work?
A PureComponent works by implementing the shouldComponentUpdate() lifecycle method with a shallow comparison of props and state. This method determines whether a component needs to re-render. When the component's state or props are updated, React performs the shallow comparison and decides if the component should update.
- If the props or state of the component have changed (using a shallow comparison), the component re-renders.
- If they haven’t changed, React skips the re-render, thus improving performance by preventing unnecessary updates.
When Should You Use Pure Components?
Pure Components are most beneficial in scenarios where performance is a concern, especially when dealing with large and dynamic applications. Here are some common use cases.
- Performance Optimization: If your application has many components that don’t need to re-render on every update (e.g., static or rarely changing data), using Pure Components can help improve performance by reducing unnecessary re-renders.
- Large Lists and Tables: When working with large lists or tables where only a small subset of data changes at a time, Pure Components can significantly reduce the amount of rendering. For instance, if you're rendering hundreds of rows in a table and only a few of them need updating, a Pure Component ensures that only those rows are re-rendered.
- Immutable Data: If your app relies on immutable data structures (such as using libraries like Immutable.js or always creating new objects/arrays), Pure Components are highly effective because they will correctly detect changes based on reference equality.
When to Use React.memo()
- Nested Data Structures: If you’re dealing with nested objects or arrays in functional components, React.memo() won’t perform deep comparisons, but you can optimize the comparison by providing a custom comparison function if necessary.
- Pure Functional Components: When working with functional components and you want to prevent unnecessary re-renders for components that receive the same props, React.memo() can be used.
Difference Between Pure Components and Regular Components
Here is the difference between pure components and regular components.
| Regular Component | Pure Component | 
|---|---|
| Re-renders every time the parent component re-renders, regardless of whether props or state have changed. | Re-renders only if props or state have changed (based on a shallow comparison). | 
| Can cause unnecessary re-renders, which may impact performance, especially with large applications. | Optimized for performance as it avoids unnecessary re-renders. | 
| The shouldComponentUpdate() method must be manually implemented to control re-renders (if needed). | Automatically implements shouldComponentUpdate() with shallow prop/state comparison. | 
| Best for components that need to re-render whenever the state or props change. | Best for components with static or immutable data that don’t require frequent updates. | 
| Does not implement shallow comparison. React always compares the entire props/state. | Implements shallow comparison for props and state. Only re-renders when references change. | 
| Works fine with both mutable and immutable data but may lead to unnecessary re-renders with mutable data. | Best used with immutable data. Mutations can lead to issues as React won't detect changes based on shallow comparison. | 
| Typically used in most class components where re-renders are necessary or expected frequently. | Used for optimization when you have components that should re-render only when necessary. | 
| No functional equivalent. Must use React.Component. | Functional equivalent is React.memo() for functional components. | 
Conclusion
Pure Components in React provide an efficient way to avoid unnecessary re-renders by only updating when there are changes in props or state. This optimization improves performance, especially in larger applications. While class components are still useful, it's recommended to use functional components with hooks in modern React development for better performance and simplicity.
