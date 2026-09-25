# Virtual DOM in React JS

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-virtual-dom/

The Virtual DOM in React helps update the user interface efficiently by tracking changes in a lightweight copy of the real DOM.
- It is an in-memory representation of the actual DOM.
- React compares changes in the Virtual DOM before updating the real DOM.
- Only the modified parts of the UI are re-rendered, improving performance.
Working of Virtual DOM
- Rendering the Virtual DOM: React creates a virtual representation of the UI as a tree of JavaScript objects.
- Updating State: It generates a new virtual DOM tree to reflect the updated state when the application state changes.
- Diffing Algorithm: React compares the new Virtual DOM tree with the previous one using its efficient diffing algorithm to identify the minimal set of changes required.
- Updating the Real DOM: React applies only the necessary changes to the real DOM, optimizing rendering performance.
React Fiber
React Fiber is the new reconciliation engine that improves how React processes updates. It makes rendering more flexible by splitting work into smaller units, so the app stays responsive even during heavy updates.
- It allows React to pause, resume, and prioritize tasks.
- User interactions like clicks and animations get faster response.
- It improves overall performance and smoothness of React apps.
Features of Virtual DOM
- Efficient Updates: By minimizing direct interactions with the real DOM, React significantly reduces rendering time.
- Reconciliation Process: React’s reconciliation efficiently updates the UI based on changes in the Virtual DOM.
- Batching Updates: Multiple state updates are batched into a single re-render cycle, avoiding unnecessary computations.
- Cross-Browser Consistency: The Virtual DOM standardizes behaviour across different browsers, ensuring consistent rendering.
- Component-Based Architecture: Virtual DOM integrates seamlessly with React’s component-based architecture, promoting modular and reusable code.
Performance Optimization
- Avoids Full DOM Repaints: React calculates and applies only the changes needed instead of repainting the entire DOM.
- Optimized Rendering: Updates to the Virtual DOM are synchronized with browser rendering cycles, avoiding redundant operations.
- Reduces JavaScript Execution Time: Lightweight Virtual DOM trees are faster to manipulate than the actual DOM.
- Intelligent Rendering Decisions: React intelligently avoids rendering components that haven’t changed using techniques like memoization.
Frameworks and Libraries Using Virtual DOM
- React JS: React JS is the pioneer in using the Virtual DOM for efficient UI rendering.
- Vue.js: Vue.js employs a Virtual DOM to provide reactive and declarative UI development.
- Inferno: Inferno is a fast and lightweight React alternative that uses the Virtual DOM for high performance.
- Preact: Preact is a minimalistic version of React that uses a Virtual DOM for efficient and high-performance rendering.
Understanding Shadow DOM and Virtual DOM
Virtual DOM and Shadow DOM serve different purposes in modern web development. Virtual DOM focuses on improving rendering performance, while Shadow DOM focuses on component encapsulation and isolation.
- Virtual DOM optimizes UI updates by comparing changes before touching the real DOM.
- Shadow DOM creates isolated DOM trees with scoped styles and structure.
- Virtual DOM is a framework technique, while Shadow DOM is a browser-native standard.
Real Life Use Cases
Virtual DOM optimizes UI updates by efficiently applying only necessary changes to the real DOM.
- Used in platforms like Facebook, Instagram, Netflix, Twitter Lite, WhatsApp Web, and Airbnb for handling dynamic content.
- Efficiently updates only changed elements, reducing unnecessary DOM operations.
- Minimizes browser reflows and repaints for smoother performance.
- Handles frequent UI changes in real-time applications (feeds, chats, dashboards).
- Enhances user experience by making interfaces faster and more responsive.
Note: It is especially beneficial for single-page applications (SPAs) where responsiveness and speed are critical.
Real DOM Vs Virtual DOM Vs Shadow DOM
Below are the main differences between Real DOM, Virtual DOM, and Shadow DOM.
| Real DOM | Virtual DOM | Shadow DOM | 
|---|---|---|
| The actual structure of a web page, a tree-like representation of HTML. | A lightweight, in-memory representation of the Real DOM. | A web standard for encapsulating a subtree of DOM elements within a component | 
| Represents the UI, allowing programs to access and modify content. | Optimizes performance by minimizing direct Real DOM manipulations. | Encapsulation of component's internal structure, styles, and behavior. | 
| Directly manipulates on-screen elements. | Does not directly manipulate on-screen elements; it's a diffing mechanism. | Creates an isolated DOM subtree that doesn't affect the main DOM. | 
| Can be slow for frequent updates as it re-renders the entire tree. | Fast updates due to diffing algorithm and batching of changes. | Can enhance performance by isolating styles and behavior, reducing conflicts. | 
| No inherent encapsulation; styles and scripts are global | No inherent encapsulation; focuses on update efficiency. | Provides strong encapsulation for styles and JavaScript within a component. | 
| Native to web browsers. | Implemented by JavaScript libraries/frameworks (e.g., React, Vue). | Native web standard implemented by browsers. | 
| Fundamental for all web pages. | Used in modern JavaScript frameworks for efficient UI updates. | Building reusable, self-contained web components with scoped styles. | 
| Yes, direct changes are immediately visible. | No, updates are first applied to the virtual copy, then "patched" to the Real DOM. | No, it's an isolated part of the DOM, not the primary UI update mechanism. | 
| Global CSS, prone to conflicts. | Global CSS (unless handled by frameworks). | Scoped CSS, styles defined within a Shadow DOM stay within it. | 
- Virtual DOM is best for performance and update speed.
- Shadow DOM is ideal for encapsulation and managing complex UI components.
- Real DOM is less efficient and not preferred for dynamic or modern web applications.
