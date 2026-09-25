# JUnit – Executing Tests with Maven Build

> Source: https://www.geeksforgeeks.org/advance-java/junit-executing-tests-with-maven-build/

Unit is a popular Java testing framework used to write and run unit tests, and when integrated with Maven, it enables automated test execution as part of the build process.
- Maven uses the maven-surefire-plugin to run JUnit tests during the test phase.
- Test classes are placed in the src/test/java directory and executed using mvn test.
- JUnit dependencies are added with test scope, so they are only used during testing.
Maven
Maven is a build automation and project management tool that simplifies managing project dependencies, building, testing, and packaging applications. It uses the Project Object Model (POM) file to define project structure, dependencies, and build configurations.
- Maven is a build automation tool used to manage dependencies, build, and project lifecycle.
- It uses a POM file to configure project structure and plugins.
JUnit
JUnit is a Java testing framework used for testing individual units of source code. It allows developers to write test cases for methods and functionalities in isolation and verify that they produce the expected outcomes.
- JUnit is a testing framework used to write and execute unit tests in Java.
- It provides annotations and assertions (like @Test, assertEquals) to validate code functionality.
Maven and JUnit Integration
Maven integrates with JUnit through the Maven Surefire Plugin, responsible for running unit tests during the build process. When you run a Maven build, the Surefire Plugin automatically detects and runs test cases located in the src/test/java directory. These test cases are typically written using JUnit.
Maven follows a build lifecycle, where each lifecycle phase performs a specific task. The test phase is the step in the lifecycle where Maven runs the JUnit tests.
Lifecycle Phases in Maven:
- compile: Compiles the source code.
- test: Runs unit tests using the Surefire Plugin and JUnit.
- package: Packages the compiled code into a JAR or WAR file.
- install: Installs the built package into the local Maven repository.
JUnit Testing with Maven
This example project demonstrates how to set up JUnit tests with Maven. The project includes a simple Java class (Calculator) with methods to add and subtract numbers, along with the corresponding JUnit test class (CalculatorTest) to validate these methods.
Step 1: Create a New Maven Project
Create a new Maven project using IntelliJ IDEA. Choose the following options:
- Name: JUnitMavenExample
- Build system: Maven
- Click on the Create button.
Project Structure
After the project creation done successfully, then the folder structure will look like the below image:
Step 2: Add Dependencies to pom.xml
Open the pom.xml file and add the JUnit dependency, which is necessary for running the JUnit tests.
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0"
         xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.gfg</groupId>
    <artifactId>JUnitMavenExample</artifactId>
    <version>1.0-SNAPSHOT</version>
    <properties>
        <maven.compiler.source>17</maven.compiler.source>
        <maven.compiler.target>17</maven.compiler.target>
        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>
    </properties>
    <dependencies>
        <!-- JUnit dependency for testing -->
        <dependency>
            <groupId>junit</groupId>
            <artifactId>junit</artifactId>
            <version>4.13.2</version>
            <scope>test</scope> <!-- Indicates that this dependency is only required for the test phase -->
        </dependency>
    </dependencies>
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.22.2</version>
            </plugin>
        </plugins>
    </build>
</project>
The JUnit dependency is included with the test scope, meaning it's only used during the test phase. The maven-surefire-plugin ensures the tests are executed during the build process.
Step 3: Create the Calculator Class
Create the Calculator class, which will have basic arithmetic methods: add() and subtract().
Calculator.java
package com.gfg;
public class Calculator {
    // Method to add two numbers
    public int add(int a, int b) {
        return a + b; // Returns the sum of a and b
    }
    // Method to subtract one number from another
    public int subtract(int a, int b) {
        return a - b; // Returns the difference of a and b
    }
}
- add(int a, int b): This method adds the two numbers and returns the result.
- subtract(int a, int b): This method subtracts the second number from the first number.
Step 4: Create the Main Class
Create the Main class to perform the basic arithmetic operations and demonstrate the use of the Calculator class.
Main.java
package com.gfg;
//TIP To <b>Run</b> code, press <shortcut actionId="Run"/> or
// click the <icon src="AllIcons.Actions.Execute"/> icon in the gutter.
public class Main {
    public static void main(String[] args) {
        Calculator calculator = new Calculator();
        // Example of adding two numbers
        int sum = calculator.add(5, 3);
        System.out.println("Sum of 5 and 3 is: " + sum);  
        // Example of subtracting two numbers
        int difference = calculator.subtract(5, 3);
        System.out.println("Difference of 5 and 3 is: " + difference);
    }
}
The main method allows for the standalone execution of the class. It demonstrates the use of the add and subtract methods by creating an instance of the Calculator class and printing the results to the console.
Step 5: Create the JUnit Test Class
Create the CalculatorTest class containing test methods to verify the functionality of the Calculator class.
CalculatorTest.java
import com.gfg.Calculator;
import org.junit.Test;
import static org.junit.Assert.assertEquals;
public class CalculatorTest {
    // Instantiate the Calculator object
    Calculator calculator = new Calculator();
    // Test for the add method
    @Test
    public void testAdd() {
        int result = calculator.add(2, 3); // Calls the add method
        assertEquals(5, result);  // Verifies if 2 + 3 equals 5
    }
    // Test for the subtract method
    @Test
    public void testSubtract() {
        int result = calculator.subtract(5, 3); // Calls the subtract method
        assertEquals(2, result);  // Verifies if 5 - 3 equals 2
    }
}
- testAdd(): Checks if the add() method of theCalculator returns the correct sum.
- testSubtract(): Verifies the output of the subtract() method.
- assertEquals(expected, actual) : Asserts that the expected and actual values are the same.
Step 6: Run the Application
Once the project is complete, run the Main class, and you should see the following output:
Step 7: Run the Tests with Maven
To execute the tests, run the following Maven command in the project directory:
mvn test
This command compiles the code and runs the test cases located in the src/test/java directory.
Test Results:
Step 8: Generated Test Report
Maven's Surefire Plugin automatically generates a test report in the target/surefire-reports/ directory.
- Surefire report file: target/surefire-reports/CalculatorTest.txt
This file contains a detailed log of the test execution, including pass/fail status and stack traces for any failed tests.
This example project demonstrates how to set up the Maven project to work with JUnit, including, Creating the simple Calculator class with arithmetic methods and writing the corresponding the JUnit test class to verify the behavior of the Calculator class, Running the tests using the Maven command (mvn test) and viewing the generated reports.
Code Explanation
- pom.xml: Adds JUnit dependency and Surefire plugin to run tests during build.
- Calculator.java: Contains add() and subtract() methods.
- Main.java: Demonstrates method execution (normal run).
- CalculatorTest.java: Uses JUnit to test methods with assertEquals().
- mvn test: Runs all test cases and generates reports automatically.
