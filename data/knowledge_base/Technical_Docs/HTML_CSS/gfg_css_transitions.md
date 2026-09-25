# CSS Transitions

> Source: https://www.geeksforgeeks.org/css/css-transitions

CSS transitions are used to create smooth animations between two states of an element, enhancing interactivity and user experience.
- Transitions can animate properties like color, size, and position.
- Use selectors and pseudo-classes (e.g., :hover) to trigger transitions.
- Key transition properties include transition-property, transition-duration, transition-timing-function, and transition-delay.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            transition: background-color 0.5s;
        }
        .box:hover {
            background-color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class defines a square <div> with a blue background and a transition effect for the background-color property over 0.5 seconds.
- When the user hovers over the <div>, the :hover pseudo-class changes the background color to green, triggering the transition.
CSS Transition Properties
1. transition-property
This property allows you to select the CSS properties that you want to animate during the transition(change).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            transition-property: width;
            transition-duration: 0.5s;
        }
        .box:hover {
            width: 200px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class defines a square <div> with a blue background.
- The transition-property is set to width, and transition-duration is set to 0.5s, enabling a smooth transition effect when the width changes.
- When the user hovers over the <div>, the :hover pseudo-class increases the width from 100px to 200px, triggering the transition.
Syntax:
transition-property: none | all | property | property1, property2, ..., propertyN;
Values:
- none is used to specify that no property should be selected.
- all is used to specify all the properties to be selected.
- We can specify a single property or a set of comma-separated properties property1, property2, ..., propertyN.
2. transition-duration
This property allows you to determine how long it will take to complete the transition from one CSS property to the other.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            transition-duration: 0.5s;
        }
        .box:hover {
            background-color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class defines a square <div> with a blue background and a transition duration of 0.5 seconds.
- When the user hovers over the <div>, the :hover pseudo-class changes the background color to green, and the transition occurs over 0.5 seconds.
Syntax:
transition-duration: time;
Here, time can be in seconds(s) or milliseconds(ms), you should use 's' or 'ms' after the number (without quotes).
3. transition-timing-function
- Controls the speed and timing of a transition.
- Defines how the change progresses (e.g., fast start, slow end).
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            transition: background-color 0.5s;
            transition-timing-function: ease-in-out;
        }
        .box:hover {
            background-color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class defines a square <div> with a blue background and a transition effect for the background-color property over 0.5 seconds.
- The transition-timing-function is set to ease-in-out, causing the transition to start and end slowly, with a faster change in the middle.
Syntax:
transition-timing-function: ease|ease-in|ease-out|ease-in-out|linear|
step-start|step-end;
4. transition-delay
This property allows you to determine the amount of time to wait before the transition actually starts to take place.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            transition: background-color 0.5s;
            transition-delay: 1s;
        }
        .box:hover {
            background-color: green;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class defines a square <div> with a blue background and a transition effect for the background-color property over 0.5 seconds.
- The transition-delay is set to 1s, causing a 1-second pause before the transition starts.
Syntax:
transition-delay: time;
Shorthand Property
You can combine all four transition properties into a single shorthand property, which simplifies the code and ensures readability.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            transition: width 0.5s ease-in-out 1s;
        }
        .box:hover {
            width: 200px;
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The transition shorthand combines width, duration (0.5s), ease-in-out, and delay (1s) into one property.
- On hover, the width smoothly changes from 100px to 200px after a 1-second delay.
- The ease-in-out makes the transition start and end slowly, with a faster middle phase.
Syntax:
transition: (property name) | (duration) | (timing function) | (delay);
- property: The CSS property you want to animate (e.g., width, background-color).
- duration: The time the transition takes to complete (e.g., 0.5s for half a second).
- timing-function: The speed curve of the transition (e.g., ease-in-out for a transition that starts and ends slowly).
- delay: The time to wait before starting the transition (e.g., 1s for a one-second delay).
Best Practices for CSS Transitions
Here are some best practices for CSS Transitions:
- Use the transition shorthand to simplify and organize your code.
- Apply transitions only to animatable properties like width, height, or background-color.
- Test transitions across devices to ensure consistent performance and smooth effects.
