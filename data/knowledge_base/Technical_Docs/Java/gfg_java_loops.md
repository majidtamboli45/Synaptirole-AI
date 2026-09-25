# Java Loops

> Source: https://www.geeksforgeeks.org/java/loops-in-java/

Loops in programming are used to execute a block of code repeatedly until a specified condition is met. They help reduce code duplication and make programs more efficient and readable. In Java, loops are essential for handling repetitive tasks.
- Allow execution of code multiple times based on a condition
- Improve efficiency by avoiding repetitive code
public class ForLoopExample2 {
    public static void main(String[] args) {
        for(int i = 2; i <= 10; i += 2) {
            System.out.println(i);
        }
    }
}
Output
2
4
6
8
10
Types of Loops in java
Java provides different types of loops that allow a block of code to be executed repeatedly based on a specified condition.
1. for loop
The for loop is used when we know the number of iterations (we know how many times we want to repeat a task). The for statement includes the initialization, condition, and increment/decrement in one line.
Example: Program demonstrates a for loop that prints numbers from 0 to 10 in a single line.
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        for (int i = 0; i <= 10; i++) {
            System.out.print(i + " ");
        }
    }
}
Output
0 1 2 3 4 5 6 7 8 9 10 
Syntax
for (initialization; condition; increment/decrement) {
// code to be executed
}
The image below demonstrates the flow chart of a for loop:
- Initialization condition: Here, we initialize the variable in use. It marks the start of a for loop. An already declared variable can be used or a variable can be declared, local to loop only.
- Testing Condition: It is used for testing the exit condition for a loop. It must return a boolean value. It is also an Entry Control Loop as the condition is checked prior to the execution of the loop statements.
- Statement execution: Once the condition is evaluated to true, the statements in the loop body are executed.
- Increment/ Decrement: It is used for updating the variable for next iteration.
- Loop termination:When the condition becomes false, the loop terminates marking the end of its life cycle.
Note: There is another form of the for loop known as Enhanced for loop or (for each loop).
Enhanced for loop (for each)
This loop is used to iterate over arrays or collections.
Example: The below Java program demonstrates an Enhanced for loop (for each loop) to iterate through an array and print names.
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        String[] names = { "Sweta", "Gudly", "Amiya" };
        for (String name : names) {
            System.out.println("Name: " + name);
        }
    }
}
Output
Name: Sweta
Name: Gudly
Name: Amiya
Syntax
for (dataType variable : arrayOrCollection) {
// code to be executed
}
2. while Loop
A while loop is used when we want to check the condition before executing the loop body.
Example: Program demonstrates a while loop that prints numbers from 0 to 10 in a single line.
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        int i = 0;
        while (i <= 10) {
            System.out.print(i + " ");
            i++;
        }
    }
}
Output
0 1 2 3 4 5 6 7 8 9 10 
Syntax
while (condition) {
// code to be executed
}
The below image demonstrates the flow chart of a while loop:
- While loop starts with the checking of Boolean condition. If it evaluated to true, then the loop body statements are executed otherwise first statement following the loop is executed. For this reason it is also called Entry control loop
- Once the condition is evaluated to true, the statements in the loop body are executed. Normally the statements contain an update value for the variable being processed for the next iteration.
- When the condition becomes false, the loop terminates which marks the end of its life cycle.
3. do-while Loop
The do-while loop ensures that the code block executes at least once before checking the condition.
Example: Program demonstrates a do-while loop that prints numbers from 0 to 10 in a single line.
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        int i = 0;
        do {
            System.out.print(i + " ");
            i++;
        } while (i <= 10);
    }
}
Output
0 1 2 3 4 5 6 7 8 9 10 
Syntax
do {
// code to be executed
} while (condition);
The below image demonstrates the flow chart of a do-while loop:
- do while loop starts with the execution of the statement. There is no checking of any condition for the first time.
- After the execution of the statements, and update of the variable value, the condition is checked for true or false value. If it is evaluated to true, next iteration of loop starts.
- When the condition becomes false, the loop terminates which marks the end of its life cycle.
- It is important to note that the do-while loop will execute its statements a tleast once before any condition is checked, and therefore is an example of exit control loop.
Common Loop Mistakes and How to Avoid them
If loops are not used correctly, they can introduce pitfalls and bugs that affect code performance, readability, and functionality. Below are some common pitfalls of loops:
1. Infinite Loops
This is one of the most common mistakes while implementing any sort of looping is that it may not ever exit, that is the loop runs for infinite time. This happens when the condition fails for some reason.
Types of Infinite Loops:
- infinite for Loop
- infinite while Loop
Example: Here, both the examples demonstrates the infinite loops.
// Java program to demonstrate 
// the infinite for loop
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        for (int i = 0; i < 5; i--) {
            System.out.println(
                "This loop will run forever");
        }
    }
}
// Java Program to demonstrate 
// the infinite while loop
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        while(true)
        {
            System.out.println(
                "Basic example of infinte loop");
        }
    }
}
Output: When you run both the above codes you will get TLE (Time Limit Exceeded) error.
2. Off-by-One Errors
Off-by-One Errors are caused when the loop runs one more or one fewer time than you wanted. It basically happens when the loop condition is not set correctly.
Example: The below Java program demonstrates an Off-by-One Error, where the loop runs 6 times and we expected it to run 5 times.
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        for (int i = 0; i <= 5; i++) {
            System.out.print(i + " ");
        }
    }
}
3. Modifying Loop Variables Inside the Loop
When we change the loop condition (like i) inside the loop, it can cause the loop to skip certain iterations or behave in ways that we did not expected. This might leads to errors or unexpected behavior.
Example: The below Java program demonstrates modifying the loop variable inside the loop, which cause the loop to skip certain iterations and behave unexpected.
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        for (int i = 0; i < 5; i++) {
            if (i == 2) {
              
                // Modifies the loop variable and skips
                // the next iteration
                i++;
            }
            System.out.println(i);
        }
    }
}
4. Empty Loop Body
An empty loop body occurs when a loop is written to iterate but does not perform any operations inside the loop. Running a loop without any useful operations inside it can be confusing.
Example: The below Java program demonstrate Empty loop body.
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        for (int i = 0; i < 10; i++) {
          
            // Empty body no operations
        }
    }
}
No output will be generated for this, because the body of the loop is empty.
Summary Table
| Loop Type | When to Use | Condition Checking | Executes At Least Once? | 
|---|---|---|---|
| for loop | When you want exact iterations | Before loop body, It is called Entry-controlled. | no | 
| while loop | When you need condition check first. | Before loop body, It is called Entry-controlled. | no | 
| do-while loop | When you need to run at least once | After loop body, It is called Exit-controlled. | yes | 
| for-each loop | When you process all collection items | Internally handled | no |
