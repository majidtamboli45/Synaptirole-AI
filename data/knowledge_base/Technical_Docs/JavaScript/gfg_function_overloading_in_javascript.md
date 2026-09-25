# Function Overloading in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/function-overloading-in-javascript/

Function Overloading is a feature found in many object-oriented programming languages, where multiple functions can share the same name but differ in the number or type of parameters. While languages like C++ and Java natively support function overloading, JavaScript does not support this feature directly.
In JavaScript, if two or more functions share the same name, the last defined function will overwrite the previous ones. This is because JavaScript treats functions as objects, and a subsequent function with the same name simply reassigns the function reference.
Unlike other programming languages, JavaScript Does not support Function Overloading.
Example: Here is a small code that shows that JavaScript does not support Function Overloading.
function foo(arg1) {
    console.log(arg1);
}
/* The above function will be
   overwritten by the function 
   below, and the below function 
   will be executed for any number
   and any type of arguments */
function foo(arg1, arg2) {
    console.log(arg1, arg2);
}
// Driver code
foo("Geeks")
Output
Geeks undefined
Explanation:
- JavaScript does not natively support function overloading.
- In the above example, the second function foo(arg1, arg2) overwrites the first function foo(arg1). When you call foo("Geeks"), the function with two parameters is called, but the second argument remains undefined because only one argument was passed.
We have seen that function Overloading is not supported in JavaScript, but we can implement the function Overloading on our own, which is pretty much complex when it comes to more numbers and more types of arguments.
Example: The following code will help you to understand how to implement the function Overloading in JavaScript.
// Creating a class  "foo"
class foo {
    // Creating an overloadable method/function.
    overloadableFunction() {
        // Define three overloaded functions
        let function1 = function (arg1) {
            console.log("Function1 called with"
                    + " arguments : " + arg1);
            return arg1;
        };
        let function2 = function (arg1, arg2) {
            console.log("Function2 called with"
                    + " arguments : " + arg1 
                    + " and " + arg2);
            return arg1 + arg2;
        };
        let function3 = function (arg1) {
            let concatenated__arguments = " ", temp = " "
            // Concatenating all the arguments 
            // and storing them into a string
            for (let i = 0; i < arg1.length; i++) {
                concatenated__arguments = 
                    concatenated__arguments + arg1[i]
            }
            /* Just ignore this loop and temp letiable, 
               we are using this loop to concatenate 
               arguments with a space between them */
            for (let i = 0; i < arg1.length; i++) {
                temp = temp + " " + arg1[i]
            }
            console.log("Function3 called with this"
                + " array as an argument : [" + temp + "]");
            console.log("Output of log is : ")
            // Returns concatenated argument string
            return concatenated__arguments; 
        };
        /* Here with the help of the length of the
           arguments and the type of the argument 
           passed ( in this case an Array ) we 
           determine which function to be executed */
        if (arguments.length === 1 
                && Array.isArray(arguments[0])) {
            return function3(arguments[0]);
        } else if (arguments.length === 2) {
            return function2(arguments[0], arguments[1]);
        } else if (arguments.length === 1 
                && !Array.isArray(arguments[0])) {
            return function1(arguments[0]);
        }
    }
}
// Driver Code
// Instantiate an object of the "foo" class
let object = new foo();
// Call the overloaded functions using the
// function overloadableFunction(...)
// We are passing 1 argument so executes function1
console.log(object.overloadableFunction("Geeks"));
// We are passing two arguments so executes function2
console.log(object.overloadableFunction("Geeks", "for"));
// We are passing an array so executes function3
console.log(object.overloadableFunction(
                ["Geeks", "for", "Geeks"]));  
Output:
Function1 called with arguments : Geeks
Geeks
Function2 called with arguments : Geeks and for
Geeksfor
Function3 called with this array as an argument : [ Geeks for Geeks]
GeeksforGeeks
Output of log is :
GeeksforGeeks
Explanation: In the above program, when a different number of arguments are passed to the same function, then based on the number and type of arguments, the arguments will be passed to the respective function.
In this case, we have used three different functions (function1, function2, function3) for function Overloading.
JavaScript does not support function overloading in the same way that languages like C++ or Java do. However, we can simulate function overloading by checking the number or types of arguments using tools like the arguments object, rest parameters, or type checks.
