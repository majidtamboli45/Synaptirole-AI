# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-using-babel/

Now we know that what Babel is, we will focus on how to install it on your machine using node. Babel can be installed easily after following these simple steps. 
Requirements : 
 
- A code editor like atom, sublime text or Visual studio code.
- Node should be installed on the machine with npm too.
We will install Babel using Node. Open your text editor, then create your directories structure like the one below: 
 
  |--node_modules
  |--src
    --app.js
  |--.babelrc
  |--package.json
  |--package.lock.json
If you know how node works then you know about node_modules, package.json, and package.lock.json. These are automatically formed once we run some commands. 
Now, open the command line and set the path to the directory of the folder then write these lines in the cmd: 
 
npm install --save-dev @babel/core @babel/cli @babel/preset-env @babel/node
npm install nodemon --save-dev
The first npm commands will install babel dependencies and the second will is used to install nodemon which allows us to update the browser content without refreshing it. 
After entering the command we will get: 
 
As we can see in the above image, the command that we used to install babel dependencies are now visible in our 'package.json' file. 
It is also important to add the below line inside the .babelrc file which we have in our project directory. 
 
// .babelrc
{
  "presets": ["@babel/preset-env"]
}
Now we finally need to add scripts into our 'package.json' file. 
 
"start": "nodemon --exec babel-node src/app.js" // inside your scripts tag
The final 'package.json' will look like this: 
 
Now we are all set we just need to write normal ES6, 7, 8 code in our app.js file and run it with 'npx babel filename' command where 'filename' is replaced by app.js here, and we will get the ES5 output in the console. 
Example: 
 
// next generation javascript code
let alice = () => {};
let bob = (b) => b;
const usingMap = [1, 2, 3].map((number) => number * 2);
console.log(usingMap); // [2, 4, 6]
var immukul = {  
    _name: "Mukul",  
    _friends: ["Mukul", "Mayank"], 
     printFriends(){
         this._friends.forEach(
             f =>console.log(this._name + " knows " + f));  
            }
        };
console.log(immukul.printFriends());
Output:
