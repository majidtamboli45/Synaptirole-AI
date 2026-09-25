# Introduction of Programming Paradigms

> Source: https://www.geeksforgeeks.org/system-design/introduction-of-programming-paradigms/

A programming paradigm is a method or style of solving problems using a programming language. It provides a structured approach and set of principles that guide how programs are designed and implemented.
- Different programming paradigms use different techniques and strategies to solve software development problems efficiently.
- A programming language may support one or more paradigms, allowing developers to choose the best approach based on project requirements.
Apart from the variety of programming languages available, there are several paradigms that address different demands and challenges in software development. These paradigms are discussed below
1. Imperative Programming Paradigm
Imperative programming is one of the oldest programming paradigms and is closely related to machine architecture and Von Neumann architecture. It works by changing the program state through assignment statements and executes tasks step-by-step to achieve the desired result.
Advantages
- Simple and easy to understand and implement.
- Supports programming constructs like variables, loops, and conditions.
Disadvantages
- Complex problems become difficult to manage and maintain.
- Less efficient for large-scale and parallel programming applications.
Examples of Imperative programming paradigm:
- C: developed by Dennis Ritchie and Ken Thompson
- Fortran: developed by John Backus for IBM
- Basic: developed by John G Kemeny and Thomas E Kurtz
#include <iostream>
int main() {
    // Array to store marks
    int marks[5] = { 12, 32, 45, 13, 19 };
    // Variable to store the sum of marks
    int sum = 0;
    // Variable to store the average
    float average = 0.0;
    // Calculate the sum of marks
    for (int i = 0; i < 5; i++) {
        sum = sum + marks[i];
    }
    // Calculate the average
    average = sum / 5.0;
    // Output the average
    std::cout << "Average of five numbers: " << average << std::endl;
    return 0;
}
#include <stdio.h>
int main() {
    // Array to store marks
    int marks[5] = { 12, 32, 45, 13, 19 };
    // Variable to store the sum of marks
    int sum = 0;
    // Variable to store the average
    float average = 0.0;
    // Calculate the sum of marks
    for (int i = 0; i < 5; i++) {
        sum = sum + marks[i];
    }
    // Calculate the average
    average = (float)sum / 5.0;
    // Output the average
    printf("Average of five numbers: %.2f\n", average);
    return 0;
}
public class Main {
    public static void main(String[] args) {
        // Array to store marks
        int[] marks = {12, 32, 45, 13, 19};
        // Variable to store the sum of marks
        int sum = 0;
        // Variable to store the average
        float average = 0.0f;
        // Calculate the sum of marks
        for (int i = 0; i < 5; i++) {
            sum = sum + marks[i];
        }
        // Calculate the average
        average = sum / 5.0f;
        // Output the average
        System.out.println("Average of five numbers: " + average);
    }
}
def main():
    # Array to store marks
    marks = [12, 32, 45, 13, 19]
    # Variable to store the sum of marks
    total_marks = sum(marks)
    # Calculate the average
    average = total_marks / len(marks)
    # Output the average
    print("Average of five numbers:", average)
if __name__ == "__main__":
    main()
#this code is added by Utkarsh
// Array to store marks
let marks = [12, 32, 45, 13, 19];
// Variable to store the sum of marks
let sum = 0;
// Variable to store the average
let average = 0.0;
// Calculate the sum of marks
for (let i = 0; i < 5; i++) {
    sum = sum + marks[i];
}
// Calculate the average
average = sum / 5.0;
// Output the average
console.log("Average of five numbers: " + average);
Output
Average of five numbers: 24.2
Imperative programming is divided into three broad categories: Procedural, OOP and parallel processing. These paradigms are as follows:
1. Procedural programming paradigm: This paradigm emphasizes on procedure in terms of under lying machine model. There is no difference in between procedural and imperative approach. It has the ability to reuse the code and it was boon at that time when it was in use because of its reusability.
Examples of Procedural programming paradigm:
- C: developed by Dennis Ritchie and Ken Thompson
- C++: developed by Bjarne Stroustrup
- Java: developed by James Gosling at Sun Microsystems
- ColdFusion: developed by J J Allaire
- Pascal: developed by Niklaus Wirth
#include <iostream>
using namespace std;
int main()
{
    int i, fact = 1, num;
    cout << "Enter any Number: ";
    cin >> number;
    for (i = 1; i <= num; i++) {
        fact = fact * i;
    }
    cout << "Factorial of " << num << " is: " << fact << endl;
    return 0;
}
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        // Create a Scanner object for reading input
        Scanner scanner = new Scanner(System.in);
        // Prompt user to enter a number
        System.out.println("Enter any Number: ");
        // Read number from user input
        int num = scanner.nextInt();
        // Initialize factorial to 1
        int fact = 1;
        // Calculate factorial using a for loop
        for (int i = 1; i <= num; i++) {
            fact = fact * i;
        }
        // Print the factorial of the number
        System.out.println("Factorial of " + num + " is: " + fact);
    }
}
# Prompt user to enter a number
num = int(input("Enter any Number: "))
fact = 1  # Initialize factorial variable
# Calculate factorial
for i in range(1, num + 1):
    fact = fact * i
# Print the factorial
print("Factorial of", num, "is:", fact)
// Prompt the user for input
let num = prompt("Enter any Number: ");
// Initialize the factorial value to 1
let fact = 1;
// Calculate the factorial of the number
for (let i = 1; i <= num; i++) {
    fact = fact * i;
}
// Print the factorial of the number
console.log("Factorial of " + num + " is: " + fact);
Then comes OOP,
2. Object oriented programming: The program is written as a collection of classes and object which are meant for communication. The smallest and basic entity is object and all kind of computation is performed on the objects only. More emphasis is on data rather procedure. It can handle almost all kind of real life problems which are today in scenario.
Examples of Object Oriented programming paradigm:
- Simula: first OOP language
- Java: developed by James Gosling at Sun Microsystems
- C++: developed by Bjarne Stroustrup
- Objective-C: designed by Brad Cox
- Visual Basic .NET: developed by Microsoft
- Python: developed by Guido van Rossum
- Ruby: developed by Yukihiro Matsumoto
- Smalltalk: developed by Alan Kay, Dan Ingalls, Adele Goldberg
// C++ program for the above approach
#include <bits/stdc++.h>
using namespace std;
// Class Signup
class Signup {
    int userid;
    string name;
    string emailid;
    char sex;
    long mob;
public:
    // Function to create and object using
    // the parameters
    void create(int userid, string name, string emailid,
                char sex, long mob)
    {
        cout << "Welcome to GeeksforGeeks\nLets create "
                "your account\n";
        this->userid = 132;
        this->name = "Radha";
        this->emailid = "radha.89@gmail.com";
        this->sex = 'F';
        this->mob = 900558981;
        cout << "your account has been created" << endl;
    }
};
// Driver Cpde
int main()
{
    cout << "GfG!" << endl;
    // Creating Objects
    Signup s1;
    s1.create(22, "riya", "riya2@gmail.com", 'F', 89002);
    return 0;
}
import java.io.*;
class GFG {
    public static void main(String[] args)
    {
        System.out.println("GfG!");
        Signup s1 = new Signup();
        s1.create(22, "riya", "riya2@gmail.com", 'F',
                  89002);
    }
}
class Signup {
    int userid;
    String name;
    String emailid;
    char sex;
    long mob;
    public void create(int userid, String name,
                       String emailid, char sex, long mob)
    {
        System.out.println(
            "Welcome to GeeksforGeeks\nLets create your account\n");
        this.userid = 132;
        this.name = "Radha";
        this.emailid = "radha.89@gmail.com";
        this.sex = 'F';
        this.mob = 900558981;
        System.out.println("your account has been created");
    }
}
class Signup:
    def __init__(self):
        self.userid = 0
        self.name = ""
        self.emailid = ""
        self.sex = ""
        self.mob = 0
    def create(self, userid, name, emailid, sex, mob):
        print("Welcome to GeeksforGeeks\nLets create your account\n")
        self.userid = 132
        self.name = "Radha"
        self.emailid = "radha.89@gmail.com"
        self.sex = 'F'
        self.mob = 900558981
        print("your account has been created")
if __name__ == "__main__":
    print("GfG!")
    s1 = Signup()
    s1.create(22, "riya", "riya2@gmail.com", 'F', 89002)
using System;
class GFG {
    static void Main(string[] args)
    {
        Console.WriteLine("GfG!");
        Signup s1 = new Signup();
        s1.create(22, "riya", "riya2@gmail.com", 'F',
                  89002);
    }
}
class Signup {
    public int userid;
    public string name;
    public string emailid;
    public char sex;
    public long mob;
    public void create(int userid, string name,
                       string emailid, char sex, long mob)
    {
        Console.WriteLine(
            "Welcome to GeeksforGeeks\nLets create your account\n");
        this.userid = 132;
        this.name = "Radha";
        this.emailid = "radha.89@gmail.com";
        this.sex = 'F';
        this.mob = 900558981;
        Console.WriteLine("your account has been created");
    }
}
// This code is contributed by akshatve2zi2
class Signup {
    constructor(userid, name, emailid, sex, mob) {
        this.userid = userid;
        this.name = name;
        this.emailid = emailid;
        this.sex = sex;
        this.mob = mob;
    }
    
    create(userid, name, emailid, sex, mob) {
        console.log("Welcome to GeeksforGeeks\nLets create your account\n");
        this.userid = 132;
        this.name = "Radha";
        this.emailid = "radha.89@gmail.com";
        this.sex = 'F';
        this.mob = 900558981;
        console.log("your account has been created");
    }
}
console.log("GfG!");
let s1 = new Signup();
s1.create(22, "riya", "riya2@gmail.com", 'F', 89002);
// This code is contributed by akshatve2zi2
Output
GfG!
Welcome to GeeksforGeeks
Lets create your account
your account has been created
3. Parallel processing approach: Parallel processing is the processing of program instructions by dividing them among multiple processors. A parallel processing system posses many numbers of processor with the objective of running a program in less time by dividing them. This approach seems to be like divide and conquer. Examples are NESL (one of the oldest one) and C/C++ also supports because of some library function.
2. Declarative programming paradigm
Declarative programming is a programming style that focuses on what needs to be done rather than how to do it. It expresses the logic of computation without describing the step-by-step control flow of the program. This paradigm includes logic, functional, and database programming and is often useful for simplifying complex and parallel programming tasks.
Advantages
- Simplifies code by focusing on the desired result instead of implementation details.
- Makes parallel programming and complex data processing easier to manage.
Disadvantages
- Provides less control over execution flow and performance optimization.
- Debugging and understanding internal execution can sometimes be difficult.
1. Logic programming paradigms: Logic programming is a paradigm based on facts, rules, and a knowledge base to solve logical problems such as puzzles and reasoning tasks. The program execution works like proving a mathematical statement, where the system derives results from given facts and rules.
predicates
  sumoftwonumber(integer, integer).
clauses
  sumoftwonumber(0, 0).
  sumoftwonumber(N, R) :-
    N > 0,
    N1 is N - 1,
    sumoftwonumber(N1, R1),
    R is R1 + N.
2. Functional programming paradigms: Functional programming is a paradigm based on mathematical functions where computation is performed through the execution of functions. It focuses on using functions for specific tasks while keeping data loosely coupled and minimizing changes in program state. Some of the languages like perl, javascript mostly uses this paradigm.
Examples of Functional programming paradigm:
- JavaScript: developed by Brendan Eich
- Haskell: developed by Lennart Augustsson, Dave Barton
- Scala: developed by Martin Odersky
- Erlang: developed by Joe Armstrong, Robert Virding
- Lisp: developed by John Mccarthy
- ML: developed by Robin Milner
- Clojure: developed by Rich Hickey
The next kind of approach is of Database.
3. Database/Data driven programming approach: Database or data-driven programming focuses on data and its movement rather than hard-coded program steps. In this approach, program behavior is controlled by data operations such as storage, retrieval, filtering, and reporting. It is widely used in business information systems and database applications for managing structured data efficiently.
CREATE DATABASE databaseAddress;
CREATE TABLE Addr (
    PersonID int,
    LastName varchar(200),
    FirstName varchar(200),
    Address varchar(200),
    City varchar(200),
    State varchar(200)
);
