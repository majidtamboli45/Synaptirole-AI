# Motion Introduction and Installation

> Source: https://www.geeksforgeeks.org/reactjs/framer-motion-introduction-and-installation/

Framer Motion is an open-source animation and gesture library for React, offering a high-level API for adding smooth animations and gestures. It works with React to create smooth animations and dynamic user interactions.
- Declarative Animations: Motion allows defining animations directly in JSX for ease of use.
- Smooth Transitions: Provides built-in support for seamless transitions like opacity, position, and scale.
- Gesture-based Animations: Triggers animations based on user gestures like hover, tap, and drag.
- Page Transitions: Supports smooth transitions between pages in SPAs.
- Customizable and Flexible: Offers control over timing, easing, and variants for tailored animations.
Install and Implement Framer Motion
Here are the steps to install and implement Framer Motion.
Step 1: Creating React Application
Create a React application using the following command.
npx create-react-app demo
cd demo
Step 2: Install Framer Motion
First, ensure that you have the Framer Motion library installed. Open your terminal and run the following command:
npm install framer-motion
Step 3: Import motion from Framer Motion
In your App.js file, you need to import the motion component from the framer-motion library to animate the elements.
import { motion } from "framer-motion";
Step 4: Create a Motion Component
You can now replace your standard JSX tags with their animated versions provided by Framer Motion. In this example, we are using <motion.div> instead of <div>. This allows us to apply animations to the <div> element.
<motion.div style={{
    color: 'green',
    fontSize: 20,
    width: '300px',
    height: '30px',
    textAlign: 'center',
    border: '2px solid green',
    margin: '40px'
}}>
    GeeksforGeeks
</motion.div>
Step 5: Add Hover Effect
Framer Motion simplifies interactive animations. In this example, the whileHover animation scales the element down on hover.
<motion.div
    style={{
        color: 'green',
        fontSize: 20,
        width: '300px',
        height: '30px',
        textAlign: 'center',
        border: '2px solid green',
        margin: '40px'
    }}
    whileHover={{ scale: 0.5 }} 
>
    GeeksforGeeks
</motion.div>
Final App.js file
import React from "react";
import { motion } from "framer-motion";
function App() {
    return (
        <motion.div style={{
            color: 'green',
            fontSize: 20,
            width: '300px',
            height: '30px',
            textAlign: 'center',
            border: '2px solid green',
            margin: '40px'
        }}
            whileHover={{ scale: 0.5 }}
        >
            GeeksforGeeks
        </motion.div>
    );
}
export default App;
Output:
- Motion Component: The motion.div is a Framer Motion component that adds animation capabilities to the regular div element. It allows you to animate its properties such as scale, opacity, and position.
- Hover Animation: The whileHover prop is used to animate the div when the user hovers over it. In this case, the scale property is set to 0.5, causing the element to shrink on hover.
- Inline Styling: The div has inline styles applied to it, including color, font size, width, height, border, and margin, making it visually distinct and positioned in the center of the page.
Framer Motion Events
Framer Motion offers event handlers to control and trigger actions during animations, giving more control over their lifecycle. Here are some key Framer Motion events:
1. onAnimationComplete
The onAnimationComplete event is triggered when an animation finishes. It allows you to perform actions after the animation, such as navigating to a new page, displaying a success message, or starting another animation.
<motion.div
    initial={{ opacity: 0 }}
    animate={{ opacity: 1 }}
    onAnimationComplete={() => console.log("Animation completed!")}
>
    Content fades in
</motion.div>
2. onUpdate
The onUpdate event is triggered continuously during an animation's lifecycle. It enables real-time tracking of animation progress or updates, such as dynamically adjusting a progress bar based on the animation's values.
<motion.div
    animate={{ x: 100 }}
    transition={{ duration: 2 }}
    onUpdate={(latest) => console.log(latest)}
>
    Moving div
</motion.div>
3. onHoverStart and onHoverEnd
These events are triggered when the user interacts with an element by hovering over it (onHoverStart) and when the user stops hovering (onHoverEnd).
<motion.div
    onHoverStart={() => console.log("Hovered!")}
    onHoverEnd={() => console.log("Hover ended!")}
    whileHover={{ scale: 1.2 }}
>
    Hover over me!
</motion.div>
4. onTapStart, onTap, and onTapEnd
These events are triggered during tap gestures on mobile devices, but they can also be used for clicks on any device.
<motion.button
    onTapStart={() => console.log("Tap started")}
    onTap={() => console.log("Tapped")}
    onTapEnd={() => console.log("Tap ended")}
>
    Tap me!
</motion.button>
5. onDragStart, onDrag, and onDragEnd
These events are used with draggable elements. They allow you to handle the start, movement, and end of dragging actions.
<motion.div
    drag
    dragConstraints={{ left: 0, right: 200 }}
    onDragStart={() => console.log("Drag started")}
    onDrag={(e, info) => console.log("Dragging", info.point)}
    onDragEnd={() => console.log("Drag ended")}
>
    Drag me around
</motion.div>
Components of Framer Motion
Framer Motion offers components for smooth animations and interactions in React apps.
- Motion Components: Core components like <motion.div /> animate HTML or SVG elements with added animation and gesture functionality.
- Animate Presence: Used for animating elements when they are removed from the React tree.
- Layout Group: Groups motion components for smooth layout transitions.
- Lazy Motion: Optimizes performance by loading motion features as needed.
- Reorder: Enables drag-to-reorder functionality for lists or items.
