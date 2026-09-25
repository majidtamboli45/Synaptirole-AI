# Decision Making in Java

> Source: https://www.geeksforgeeks.org/java/decision-making-javaif-else-switch-break-continue-jump/

Decision-making statements in Java allow a program to choose different execution paths based on specified conditions. They help control the flow of a program by executing certain blocks of code only when particular conditions are true. These statements are essential for implementing logic, validations, and user-driven actions in applications.
- Improve flexibility and intelligence of programs.
- Support simple, multiple, and nested decision-making scenarios.
Types of Decision-Making Statements
Java provides the following decision-making statements:
1. Java if Statement
The if statement is the simplest decision-making statement. It executes a block of code only if a given condition is true.
class Geeks {
    public static void main(String args[])
    {
        int i = 10;
        if (i < 15) {
            System.out.println("Condition is True");
        }
    }
}
Output
Condition is True
Note: If curly braces {} are omitted, only the next line after if is considered part of the block.
The below diagram demonstrates the flow chart of an "if Statement execution flow" in programming.
Execution Flow
- Condition is evaluated.
- If the condition is true, the if block executes.
- If the condition is false, the block is skipped.
- Program continues with the next statement.
2. Java if-else Statement
The if-else statement allows you to execute one block if the condition is true and another block if it is false.
import java.util.*;
class Geeks {
    public static void main(String args[])
    {
        int i = 10;
        if (i < 15)
            System.out.println("i is smaller than 15");
        else
            System.out.println("i is greater than 15");
    }
}
Output
i is smaller than 15
The below diagram demonstrates the flow chart of an "if-else Statement execution flow" in programming
Execution Flow
- Condition is evaluated.
- If true, the if block executes.
- If false, the else block executes.
- Program proceeds to the next statement.
3. Java nested-if Statement
A nested-if is an if statement inside another if statement. It is useful when a second condition depends on the first.
class Geeks {
    public static void main(String args[])
    {
        int i = 10;
        // Outer if statement
        if (i < 15) {
            System.out.println("i is smaller than 15");
            // Nested if statement
            if (i == 10) {
                System.out.println("i is exactly 10");
            }
        }
    }
}
Output
i is smaller than 15
i is exactly 10
The below diagram demonstrates the flow chart of an "nested-if Statement execution flow" in programming.
Execution Flow
- Outer if condition is evaluated first.
- If the outer condition is true, the inner if condition is checked.
- If the inner condition is also true, its block executes.
- Program continues after the nested structure.
4. Java if-else-if ladder
The if-else-if ladder allows multiple independent conditions to be checked in order. As soon as one condition is true, its block executes, and the rest are skipped.
import java.util.*;
class Geeks {
    public static void main(String args[])
    {
        int i = 20;
        if (i == 10)
            System.out.println("i is 10");
        else if (i == 15)
            System.out.println("i is 15");
        else if (i == 20)
            System.out.println("i is 20");
        else
            System.out.println("i is not present");
    }
}
Output
i is 20
The below diagram demonstrates the flow chart of an "if-else-if ladder execution flow" in programming
Execution Flow
- Conditions are evaluated from top to bottom.
- The first condition that evaluates to true executes its block.
- Remaining conditions are skipped.
- If no condition is true, the else block executes.
5. Java Switch Case
The switch statement is a multiway branch statement. It provides an easy way to dispatch execution to different parts of code based on the value of the expression.
import java.io.*;
class Geeks {
    public static void main(String[] args)
    {
        int num = 20;
        switch (num) {
        case 5:
            System.out.println("It is 5");
            break;
        case 10:
            System.out.println("It is 10");
            break;
        case 15:
            System.out.println("It is 15");
            break;
        case 20:
            System.out.println("It is 20");
            break;
        default:
            System.out.println("Not present");
        }
    }
}
Output
It is 20
The below diagram demonstrates the flow chart of a "switch Statements execution flow" in programming.
- The expression inside the switch statement is evaluated.
- The value of the expression is compared with each case label.
- If a matching case is found, the statements associated with that case are executed.
- The break statement terminates the switch block and transfers control outside the switch.
- If break is omitted, execution continues to the next case statements (fall-through).
- If no case matches the expression value, the default block is executed (if present).
- After the switch statement finishes execution, control moves to the next statement in the program.
Note:
- The expression can be of type byte, short, int char, or an enumeration. Beginning with JDK7, the expression can also be of type String.
- Duplicate case values are not allowed.
- The default statement is optional.
- The break statement is used inside the switch to terminate a statement sequence.
- The break statements are necessary without the break keyword, statements in switch blocks fall through.
Ternary Operator (? :) in Java
The ternary operator in Java is a conditional operator that provides a shorthand way to write simple if-else statements
Syntax:
condition ? expression_if_true : expression_if_false;
class Geeks {
    public static void main(String args[]) {
        int a = 10, b = 20;
        int max = (a > b) ? a : b;
        System.out.println("Maximum is " + max);
    }
}
Output
Maximum is 20
Explanation: This program uses the ternary operator ( ? : ) to find the maximum of two numbers. It checks the condition a > b; if true, it assigns a to the variable max, otherwise it assigns b. Finally, it prints the maximum value.
if-else vs switch-case
The table below demonstrates the difference between if-else and switch-case.
| Features | if-else | switch-case | 
|---|---|---|
| Use Case | Suitable for condition-based checks | Best for exact value matching | 
| Readability | More readable for a few conditions | More readable and efficient for many cases | 
| Performance | Slower for many checks due to multiple conditions | Faster and optimized for handling many cases | 
| Flexibility | Supports ranges and complex conditions | Only supports exact matches of values |
