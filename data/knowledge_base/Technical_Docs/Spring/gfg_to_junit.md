# Introduction to JUnit

> Source: https://www.geeksforgeeks.org/advance-java/introduction-of-junit/

JUnit is a popular Java testing framework used for writing and executing unit tests for individual classes and methods. It helps developers test individual units or components of code to ensure they work correctly. JUnit is widely used with frameworks like Spring Boot to verify application functionality during development.
- Used to write and execute automated tests for Java applications.
- Helps in detecting bugs early and improving code quality.
- Supports annotations like @Test, @BeforeEach, and @AfterEach for test execution.
Core Concepts in JUnit
JUnit provides essential components that help structure and execute unit tests effectively.
1. Test Case
A test case is a single unit of testing used to verify a specific functionality of the code. In JUnit, each test case is written as a method inside a test class.
- A test case checks one specific behavior or functionality.
- It is written as a method inside a test class using @Test annotation.
- Helps ensure that individual parts of the code work correctly.
- Can be executed multiple times automatically.
2. Annotations
JUnit provides annotations that control the execution flow of test cases in a structured way. In JUnit 5 (JUnit Jupiter), these annotations have been updated to provide better clarity and flexibility:
- @Test : Marks a method as a test case.
- @BeforeEach : Runs before each test method (replaces@Before in JUnit 4).
- @AfterEach : Runs after each test method (replaces@After in JUnit 4).
- @BeforeAll : Runs once before all test methods in the class (replaces@BeforeClass ).
- @AfterAll : Runs once after all test methods in the class (replaces@AfterClass ).
3. Assertions
Assertions are used to validate the expected outcome of a test by comparing it with the actual result.
- assertEquals() -> Checks if two values are equal.
- assertTrue() -> Checks if a condition is true.
- assertNotNull() -> Checks if an object is not null.
4. Test Suite
A Test Suite in JUnit is used to group multiple test classes and execute them together as a single unit. It helps organize and run related test cases efficiently.
- Allows execution of multiple test classes together.
- Useful for regression testing and large projects.
- Helps manage and organize related test cases.
- Commonly used in CI/CD pipelines for automated execution.
JUnit Setup (Maven/Gradle Dependency)
Before writing and executing JUnit test cases, the JUnit library must be added to the project. This is done using build tools like Maven or Gradle, which manage dependencies automatically.
Maven Dependency (JUnit 5)
Add the following dependency in the pom.xml file to use JUnit 5 in a Maven project.
<dependency>
    <groupId>org.junit.jupiter</groupId>
    <artifactId>junit-jupiter</artifactId>
    <version>5.10.2</version>
    <scope>test</scope>
</dependency>
Gradle Dependency (JUnit 5)
Add the following dependency in the build.gradle file to enable JUnit 5 support in a Gradle project.
testImplementation 'org.junit.jupiter:junit-jupiter:5.10.2'
Example of a JUnit Test
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.Assertions;
// Test class for the Calculator
public class CalculatorTest {
    // Test method to check addition functionality
    @Test
    public void testAddition() {
        // Create an instance of the Calculator class
        Calculator calculator = new Calculator();
        // Perform addition operation
        int result = calculator.add(2, 3);
        // Verify that the result matches expected value
        Assertions.assertEquals(5, result);
    }
}
Explanation of the key components in the above code:
- import org.junit.jupiter.api.Test -> Imports JUnit 5 test annotation
- import org.junit.jupiter.api.Assertions -> Imports assertion methods in JUnit 5
- @Test → Marks the method as a test case
- Calculator calculator = new Calculator(); -> Creates object of class under test
- calculator.add(2, 3); -> Calls the method being tested
- Assertions.assertEquals(5, result); -> Validates expected vs actual output
Advantages of JUnit
JUnit is a widely used testing framework that simplifies the process of writing and executing automated tests.
- Supports repeated and automated test execution, saving time and effort.
- Helps in early detection of bugs during the development phase.
- Encourages Test-Driven Development (TDD) by allowing tests to be written before actual code.
- Provides simple and powerful annotations like @Test for easy test creation.
- Offers a rich set of assertion methods to validate expected and actual results effectively.
Limitations of JUnit
Although JUnit is widely used for unit testing in Java applications, it also has certain limitations that should be considered during testing.
- Primarily supports Java applications and is not suitable for testing applications written in other programming languages.
- Requires additional tools or frameworks like Mockito for advanced mocking and dependency handling.
- Large test suites may increase execution time and affect build performance.
- GUI and end-to-end testing support is limited compared to specialized automation tools.
- Improperly designed test cases can become difficult to maintain as the project grows.
Applications of JUnit
JUnit is commonly used in software development to ensure code reliability and maintainability through automated testing.
- Used to test individual methods and classes to ensure correct functionality.
- Plays a key role in Test-Driven Development (TDD), where tests are created before writing code.
- Integrated into Continuous Integration (CI) pipelines to automate testing and detect issues early.
- Supports integration testing when combined with additional libraries such as Mockito for mocking dependencies.
