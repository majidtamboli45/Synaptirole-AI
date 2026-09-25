# Controlled vs Uncontrolled Components in ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/controlled-vs-uncontrolled-components-in-reactjs/

Controlled components in React are the components whose state and behaviors are managed by React components using states, while the uncontrolled components manage their own state and control their behaviors with the help of DOM.
Controlled Components
A controlled component in React is an element whose state is controlled by React itself. This means that the component's state is handled using useState and can only be updated using its setter function.
Features of Controlled
- State Management: Form data is handled by the component's state using React's useState hook or this.state in class components.
- Data Flow: The input elements' values are set by the state, and any changes are reflected through state updates.
- Predictability: Since the state is managed by React, the component's behavior is predictable and consistent.
- Real-Time Validation: Enables immediate validation and formatting of user input.
- Single Source of Truth: The state serves as the single source of truth for the form data.
Uncontrolled Components
An uncontrolled component in React refers to a component where the form element's state is not directly controlled by React. Instead, the form element itself maintains its own state, and React only interacts with the element indirectly through references (refs).
Features of Uncontrolled Components
- DOM-Managed State: Form data is handled by the DOM itself, not by React state.
- Use of Refs: Access to form values is achieved using React's useRef() or createRef() to reference DOM elements directly.
- No State Management: Eliminates the need for state variables and event handlers for each input field.
- Simpler Implementation: Suitable for simple forms or when integrating with non-React libraries that manipulate the DOM directly.
- Less Predictable: Since the component's state is not synchronized with React, it can lead to less predictable behavior.
- Manual Validation: Validation and formatting need to be handled manually, often during form submission.
Differences Between Controlled and Uncontrolled Components
| Feature | Controlled Components | Uncontrolled Components | 
|---|---|---|
| Data Source | React state | DOM(internal State) | 
| Value Binding | value prop bound to state | No binding value uses default value | 
| How to Access Value | From state Variable | Via ref or document.querySelector | 
| State Management | Managed by React | Managed by DOM | 
| Real Time Validation | Easy to implement (validation on onChange ) | Harder, needs manual checks | 
| Re-rendering | Harder, needs manual checks | Fewer re-renders | 
| Ease of Debugging | Easier to debug and test | Slightly harder to debug | 
| Use Case | When you need to track and control user input | For quick/simple forms where state tracking isn’t needed | 
Performance Comparison
Following is the bar graph showing comparison of Controlled vs Uncontrolled components on different metrics:
It clearly shows that controlled components generally score higher in areas like data source, value binding, and validation. Uncontrolled components perform slightly better in fewer areas such as re-rendering and ease of debugging.
