# CSS Animations

> Source: https://www.geeksforgeeks.org/css/css-animations

CSS animations control the movement and appearance of elements on web pages. We can animate HTML elements without using JavaScript.
- Use @keyframes to define the animation steps.
- Apply animations with properties like animation-name and animation-duration.
- Control the animation flow using animation-timing-function and animation-delay.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
	<style>
		.box {
			width: 100px;
			height: 100px;
			background-color: blue;
			animation: changeColor 3s infinite;
		}
		@keyframes changeColor {
			from {
				background-color: blue;
			}
			to {
				background-color: green;
			}
		}
	</style>
<!--Driver Code Starts-->
</head>
<body>
	<div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
CSS Animation Properties
| Property | Description | 
|---|---|
| @keyframes | The @keyframes rule in CSS is used to specify the animation rule. | 
| animation-name | It is used to specify the name of the @keyframes describing the animation. | 
| animation-duration | It is used to specify the time duration it takes animation to complete one cycle. | 
| animation-timing-function | It specifies how animations make transitions through keyframes. There are several presets available in CSS which are used as the value for the animation-timing-function like linear, ease,ease-in,ease-out, and ease-in-out. | 
| animation-delay | It specifies the delay of the start of an animation. | 
| animation-iteration-count | This specifies the number of times the animation will be repeated. | 
| animation-direction | It defines the direction of the animation. animation direction can be normal, reverse, alternate, and alternate-reverse. | 
| animation-fill-mode | It defines how styles are applied before and after animation. The animation fill mode can be none, forwards, backwards, or both. | 
| animation-play-state | This property specifies whether the animation is running or paused. | 
@keyframes Rule
The @keyframes rule defines how an element's styles change over time during an animation.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
	<style>
		.box {
			width: 100px;
			height: 100px;
			background-color: blue;
			animation: changeColor 3s infinite;
		}
		@keyframes changeColor {
			from {
				background-color: blue;
			}
			to {
				background-color: green;
			}
		}
	</style>
<!--Driver Code Starts-->
</head>
<body>
	<div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class creates a blue square and applies the changeColor animation that lasts 3 seconds and repeats infinitely.
- The @keyframes changeColor rule changes the background color from blue to green.
Syntax: @keyframes animation-name 
{ from { /* Initial Styles */ }
to
{ /* Final Styles */
}}
- The from defines the starting styles, and to defines the ending styles.
- You can also use percentage values to specify intermediate steps.
animation-name Property
The animation-name property specifies the name of the @keyframes animation to apply to an element.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            animation-name: moveRight;
            animation-duration: 2s;
            animation-iteration-count: infinite;
        }
        @keyframes moveRight {
            from {
                transform: translateX(0);
            }
            to {
                transform: translateX(200px);
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class applies the moveRight animation to the <div>.
- The animation-name links the element to the @keyframes moveRight sequence.
- The box moves horizontally from its original position to 200px to the right over 2 seconds, repeating infinitely.
Syntax: animation-name: animationName;
animation-timing-function property
The animation-timing-function property controls the speed curve of an animation, defining how the animation progresses over its duration.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            animation-name: slide;
            animation-duration: 3s;
            animation-timing-function: ease-in;
            animation-iteration-count: infinite;
        }
        @keyframes slide {
            from {
                transform: translateX(0);
            }
            to {
                transform: translateX(300px);
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class applies the slide animation to the <div>.
- The animation-timing-function: ease-in; makes the animation start slowly and then speed up.
Syntax:
animation-timing-function: timingFunction;
animation-delay property
The animation-delay property specifies a delay before an animation starts, controlling when the animation begins after being triggered.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            animation-name: fadeIn;
            animation-duration: 2s;
            animation-delay: 1s;
            animation-iteration-count: infinite;
        }
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box element is set to fade in using the fadeIn animation.
- The animation-delay: 1s; delays the start of the animation by one second.
- The animation lasts for 2 seconds and repeats infinitely.
Syntax: animation-delay: time;
animation-iteration-count property
The animation-iteration-count property specifies how many times an animation should repeat.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
	<style>
		.box {
			width: 100px;
			height: 100px;
			background-color: blue;
			animation: bounce 2s infinite;
		}
		@keyframes bounce {
			0% {
				transform: translateY(0);
			}
			50% {
				transform: translateY(-50px);
			}
			100% {
				transform: translateY(0);
			}
		}
	</style>
<!--Driver Code Starts-->
</head>
<body>
	<div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box element uses the bounce animation that lasts 2 seconds.
- animation-iteration-count: infinite; makes the animation loop endlessly.
Syntax: animation-iteration-count: number | infinite;
animation-direction property
The animation-direction property specifies whether an animation should play forward, backward, or alternate between the two directions.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
	<style>
		.box {
			width: 100px;
			height: 100px;
			background-color: blue;
			animation: move 2s infinite;
			animation-direction: alternate;
		}
		@keyframes move {
			from {
				transform: translateX(0);
			}
			to {
				transform: translateX(200px);
			}
		}
	</style>
<!--Driver Code Starts-->
</head>
<body>
	<div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box element moves from its original position to 200px to the right.
- animation-direction: alternate; makes the animation play forward on the first iteration and then backward on the next, creating a back-and-forth motion.
Syntax: animation-direction: normal | reverse | alternate | alternate-reverse;
animation-fill-mode property
The animation-fill-mode property specifies how a CSS animation should apply styles to its target before and after it is executing.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            animation: move 3s forwards;
        }
        @keyframes move {
            from {
                transform: translateX(0);
            }
            to {
                transform: translateX(200px);
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box element moves from its original position to 200px to the right over 3 seconds.
- animation-fill-mode: forwards; ensures that the box retains the final state of the animation after it completes.
Syntax: animation-fill-mode: none | forwards | backwards | both;
animation-play-state property
The animation-play-state property controls whether an animation is running or paused.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            animation: spin 4s linear infinite;
            animation-play-state: paused;
        }
        .box:hover {
            animation-play-state: running;
        }
        @keyframes spin {
            from {
                transform: rotate(0deg);
            }
            to {
                transform: rotate(360deg);
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box element has a spin animation that rotates it 360 degrees over 4 seconds infinitely.
- animation-play-state: paused; initially pauses the animation.
Syntax: animation-play-state: running | paused;
Animation Shorthand Property
The animation shorthand property allows you to set all animation-related properties in a single declaration, making your CSS code cleaner and more concise.
<!--Driver Code Starts-->
<html>
<head>
<!--Driver Code Ends-->
    <style>
        .box {
            width: 100px;
            height: 100px;
            background-color: blue;
            animation: move 2s ease-in 1s infinite alternate forwards;
        }
        @keyframes move {
            from {
                transform: translateX(0);
                background-color: blue;
            }
            to {
                transform: translateX(200px);
                background-color: green;
            }
        }
    </style>
<!--Driver Code Starts-->
</head>
<body>
    <div class="box"></div>
</body>
</html>
<!--Driver Code Ends-->
- The .box class uses the animation shorthand to apply the move animation.
- The animation lasts for 2 seconds, starts after a 1-second delay, runs infinitely, alternates direction, and retains the final state.
- The box moves from its original position to 200px to the right and changes color from blue to green smoothly.
Syntax:
animation: [animation-name] [animation-duration] [animation-timing-function] 
[animation-delay] [animation-iteration-count] [animation-direction] [animation-fill-mode]
[animation-play-state];
Best Practices for CSS Animations
Here are some best practices listed below:
- Use Animations Purposefully: Apply animations to enhance user experience without causing distractions.
- Animate Performance-Friendly Properties: Prefer animating properties like transform and opacity for smoother performance.
- Ensure Accessibility: Provide options for users to reduce or disable animations to accommodate those with motion sensitivities.
