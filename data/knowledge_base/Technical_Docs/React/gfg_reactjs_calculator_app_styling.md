# ReactJS Calculator App (Styling)

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-calculator-app-styling/

Now that we have added functionality to our Calculator app and successfully created a fully functional calculator application using React. But that does not look good despite being fully functional. This is because of the lack of CSS in the code. Let's add CSS to our app to make it look more attractive and beautiful.
Remember we had created a file named "index.css" initially? We will write all our CSS codes in this file. But before that, let's include this file in our index.js file so that we can immediately see the effect of changes we are making in our CSS in the browser. Write the below line of code in our index.js file at the top:
Syntax:
import './index.css';
Now, let us begin writing our CSS. Follow the below-given instructions one by one and complete your styling part of the project.
- The very first thing we will do is set default values for all elements. Write the below code at top of the index.css file:
*{
    margin:0px;
    padding:0px;
    border-radius: 0px;
    box-sizing: border-box;
    font-size: 110%;
}
#root{
    text-align:center;
}
- The next thing we will do is we will add style to our CalculatorTitle component. Add the below code to style the CalculatorTitle component.
.calculator-title{
    font-size:30px;
    background: #fff;
    width: 400px;
    padding: 10px 10px;
    margin: 0 auto;
    margin-top: 20px;
    margin-bottom: 20px;
    border-radius: 2px;
    border: 2px solid black;
    color: #4CAF50;
}
- To style our calculator add the below code for the parent element with className as “mainCalc”.
.mainCalc{
    margin:0px;
    padding:0px;
    border-radius: 0px;
    box-sizing: border-box;
}
- To style the input field of the screenRow component We will add width, background, color, padding, etc. to this element. The below code is used for this purpose.
.screen-row input{
        width: 400px;
    background: #ddd;
    border: 0px;
    color: #222;
    padding: 10px;
    text-align: right;
}
- The below code is used to style the buttons of the Calculator app.
input[type="button"]{
    width: 100px;
    background: #4CAF50;
    border: 1px solid #222;
    padding: 10px 20px;
    color: black;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
input[type="button"]:active{
    background: #ccc;
}
- After adding all the above pieces of code in the index.css file. The index.css file will look like the below code.
*{
    margin:0px;
    padding:0px;
    border-radius: 0px;
    box-sizing: border-box;
    font-size: 110%;
}
.calculator-title{
    font-size:30px;
    background: #fff;
    width: 400px;
    padding: 10px 10px;
    margin: 0 auto;
    margin-top: 20px;
    margin-bottom: 20px;
    border-radius: 2px;
    border: 2px solid black;
    color: #4CAF50;
}
.mainCalc{
    margin:0px;
    padding:0px;
    border-radius: 0px;
    box-sizing: border-box;
}
input[type='button']{
    width: 100px;
    background: #4CAF50;
    border: 1px solid #222;
    padding: 10px 20px;
    color: black;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 16px;
}
input[type='button']:active{
    background: #ccc;
}
#root{
    text-align:center;
}
.screen-row input{
    width: 400px;
    background: #ddd;
    border: 0px;
    color: #222;
    padding: 10px;
    text-align: right;
}
Output: You can see the change in the app in the browser window. You will now have the exact same app as shown in the very first article with the exact same functionalities. Below is a glimpse of the final ready project: 
 
Reaching this far was not easy. We had learned a lot through this project and there is a lot more left to learn about React which we will see in the upcoming articles. This was just an introductory project to get your hands ready on React.
