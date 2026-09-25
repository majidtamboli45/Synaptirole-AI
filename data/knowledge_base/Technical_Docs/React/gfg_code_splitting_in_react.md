# Code Splitting in React

> Source: https://www.geeksforgeeks.org/reactjs/code-splitting-in-react/

Code-Splitting is a feature supported by bundlers like Webpack, Rollup, and Browserify which can create multiple bundles that can be dynamically loaded at runtime.
- It allows React components to be loaded dynamically only when required instead of loading everything at once.
- Code splitting improves performance by reducing the initial bundle size of the application.
- It helps load additional code on demand as users interact with the app, improving load time and efficiency.
Bundling and its efficiency
Bundling is the method of combining imported files with a single file. It is done with the help of Webpack, Rollup, and Browserify as they can create many bundles that can be loaded dynamically at runtime.
With the help of code splitting, 'lazy load' can be implemented, which means just using the code which is currently needed.
The default way of importing is as follows:
import { add } from './math';
console.log(add(x, y)); // Here x, y are two numbers
Using code-splitting this can be done as follows:
import("./math").then(math => {
console.log(math.add(x, y));
});
// Here x, y are two numbers
- Webpack auto code-splits on dynamic imports and Create React App supports it by default.
- Follow the official Webpack documentation: https://webpack.js.org/guides/code-splitting/
- When using Babel use babel-plugin-syntax-dynamic-import and prevent Babel from transforming imports.
React.lazy and Suspense
As both React.lazy and Suspense are not available for rendering on the server yet now, it is recommended to use loadable-components for code-splitting in a server-rendered app. React.lazy is helpful for rendering dynamic import as a regular component.
Before:
import Component from './Component';
After:
const Component = React.lazy(() => import('./Component'));
The Bundle will be loaded on its own which contains the Component when this component is rendered first. 
The Lazy component should then be rendered inside Suspense Component which helps to reflect some fallback content meanwhile the lazy component loads.
import React, { Suspense } from 'react';
const Component = React.lazy(() => import('./Component'));
function MyComponent() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
         <Component />
      </Suspense>
    </div>);
}
export default MyComponent;
The fallback prop can accept any element of React which will be rendered while waiting for the loading of the Component. The Suspense Component can be placed anywhere above the lazy component. Moreover, multiple lazy components can be wrapped with a single Suspense Component.
import React, { Suspense } from 'react';
const ComponentOne = React.lazy(() => import('./ComponentOne'));
const ComponentTwo = React.lazy(() => import('./ComponentTwo'));
function MyComponent() {
  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        <ComponentOne />
        <ComponentTwo />
      </Suspense>
    </div>
  );
}
export default MyComponent;
Error Boundaries
Error Boundaries are React components that help when some modules fail to load due to any issue, an error will be triggered. These errors can be handled properly and provide a good experience to the user by the use of a suitable error page.
import React, { Suspense } from 'react';
import ErrorBoundary from './ErrorBoundary';
const ComponentOne = React.lazy(() => import('./ComponentOne'));
const ComponentTwo = React.lazy(() => import('./ComponentTwo'));
const MyComponent = () => (
  <div>
    <ErrorBoundary>
      <Suspense fallback={<div>Loading...</div>}>
        <ComponentOne />
        <ComponentTwo />
      </Suspense>
    </ErrorBoundary>
  </div>
);
export default MyComponent;
Route-Based Code Splitting
Code splitting divides an application into smaller chunks that are loaded on demand, improving performance and user experience.
Here you can see the example code for this.
import React, { Suspense, lazy } from 'react';
import { Route, Routes, BrowserRouter } from 'react-router-dom';
const HomePage = lazy(() => import('./routes/HomePage'));
const AboutUs = lazy(() => import('./routes/AboutUs'));
const App = () => {
    return (
        <BrowserRouter>
            <Suspense fallback={<div>Loading...</div>}>
                <Routes>
                    <Route path="/" element={<HomePage />} />
                    <Route path="/about" element={<AboutUs />} />
                </Routes>
            </Suspense>
        </BrowserRouter>
    );
};
export default App;
Named Exports
React.lazy currently supports only default exports. An intermediate module that re-exports as default has to be created if one wants to import a module that uses named exports. This ensures the working of tree shaking and prevents the pulling in of unused components.
import React,{lazy} from 'react';
// Components.js
export const Component = /* ... */;
export const MyUnusedComponent = /* ... */;
// Component.js
export { Component as default } from "./Components.js";
// MyApp.js
const Component = lazy(() => import("./Component.js"));
