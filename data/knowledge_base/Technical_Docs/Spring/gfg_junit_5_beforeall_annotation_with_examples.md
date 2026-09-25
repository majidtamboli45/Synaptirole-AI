# JUnit 5 @BeforeAll Annotation with Examples

> Source: https://www.geeksforgeeks.org/advance-java/junit-5-beforeall-annotation-with-examples/

JUnit 5 is the unit testing framework in Java, and it is not a tool rather the JUnit 5 framework contains a set of tools and libraries that are used to write and run test cases. The Junit 5 Framework was introduced in 2017, This was developed by Kent Beck, Erich Gamma, David Saff, and Kris Vasudevan. Its Operating System is cross-platform and this framework is written in Java. This Framework makes it easier to extend the framework, and we can able integrate with other testing frameworks also, In JUnit 5 several new Annotations are introduced those are @BeforeAll, @AfterAll, @BeforeEach, @AfterEach, @TestFactory, @DisplayName, @Disabled, @Nested, @Tag. Among these annotations, I give Information about @BeforeAll annotation.
Features of JUnit 5
There are certain features of JUnit 5 as mentioned below:
- Supporting Java 8 Features like
- Introduced new test organization features like tags & categories
- JUnit 5 Framework Support Parallel test execution
- It can support the New Extension Model and also
- It can support parameterized tests
- This framework supports Assumptions
Note : If you want use JUnit 5 in your Project for write and run tests, It requires Java 8 or higher Runtime
@BeforeAll in JUnit 5
@BeforeAll is an annotation that is announced in the JUnit 5 framework, The @BeforeAll is used to signal that the annotated method should be executed before all test cases. And @BeforeAll methods are executed only once for assigned test cases. One more thing is that it should be used with the static method in the test class.
Now I provide the basic syntax of the @BeforeAll annotation below please follow the syntax for better understanding.
Basic Syntax
class GFG {
@BeforeAll
public static void Test1(){
// your own testing code here
}
@Test
public void test2(){
// your code
}
}
If you want to work with @BeforeAll then you need to have strong knowledge of JUnit 4.
Note: In the above syntax we use the static method for @BeforeAll.
Prerequisites for the Topic
- Method Signature: @BeforeAll methods must have a void return type and it is a static type.
- Test classes: @BeforeAll methods are not supported in nested test classes.
- Execution: @BeforeAll executed only once for assigned test cases.
Note : @BeforeAll methods mush have return type void and must not be private.
Examples of JUnit 5 - @BeforeAll
Example 1 :
Let us take an example, we have written a test for the String Handler class to check whether the given string is empty or not
//Class to test String trim method
public class StringHandler {
  
    //To Perform operations on the input string
    public static String manipulateString(String input) {
        
          // Trim the input string
        return input.trim(); 
    }
}
Now we write a test case for it to check whether the given String is empty or not
In the above code, I take a string value and remove white spaces by using the trim() string function then return that string value.
// Testing file to test the manipulate
// String Class 
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertTrue;
//Testing Class
public class StringTest {
    private static String testString;
    // This method is executed once before any of the test methods in the class
    @BeforeAll
    static void init() {
      
        // Manipulate the input string and store it in the testString variable
        testString = StringHandler.manipulateString("  Hello, GFG!  ");
      
        // Print the manipulated test string
        System.out.println("Test String: '" + testString + "'");
    }
  
    // Test whether the manipulated string is not empty
    @Test
    void testStringNotEmpty() {
      
        // Print a message indicating that the testStringNotEmpty test is being run
        System.out.println("Running testStringNotEmpty...");
      
        // Assert that the manipulated test string is not empty
        assertTrue(!testString.isEmpty(), "The string should not be empty");
    }
    // Test whether an empty string is indeed empty
    @Test
    void testStringEmpty() {
      
        // Print a message indicating that the testStringEmpty test is being run
        System.out.println("Running testStringEmpty...");
      
        // Create an empty string for the test and assert that it is empty
        String emptyString = "";
        assertTrue(emptyString.isEmpty(), "The string should be empty");
    }
}
Output:
Test String: 'Hello, GFG!'
Running testStringNotEmpty...
Running testStringEmpty...
Explanation of the above Program:
In the above code, I created one static method for @BeforeAll,
- this static method is mandatory for work with @BeforeAll annotation.
- The @BeforeAll is checked first before all test cases are run.
- Only once after that, I create the testStringNotEmpty() function testing if the string is empty or not then return the Running testStringNotEmpty as output.
- After that, I created another testStringEmpty() method for if the string is empty it will return Running testStringEmpty() as an output you can observe the below output.
Example 2 :
Simple Java class to check whether a person is eligible to vote or not based on their age.
//Class to determine VotingEligibility
public class VotingEligibility {
      //Biz-logic for VotingEligibility method
    public static String checkEligibility(int age) { 
      
      // checking the age of the person
        if (age >= 18) {
          
          // if age is elibible then this block executed
            System.out.println("Person is eligible to vote.");
            return "Eligible to vote";
        } 
          else {
        
          // if age is not eligible then this code is executed
            System.out.println("Person is not eligible to vote.");
            return "Not eligible to vote";
        }
    }
}
- In the above code, I try to check whether the person is eligible to Vote or not based on the above condition (age >=18).
- If the person's age is less than 18 then the else block is executed.
- If the age is greater than 18 then the if block code is executed and print the Appropriate Output.
//TESTING file to test the VotingEligibility Class
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;
import static org.junit.jupiter.api.Assertions.assertEquals;
//Testing class for VotingEligibility
public class VotingEligibilityTest {
    // Variables to store the results of the voting eligibility checks
    private static String resultEligible;
    private static String resultNotEligible;
    // Method to perform setup operations before any of the test methods in the class
    @BeforeAll
    static void init() {
        // Check the eligibility for a person with age 25 and store the result
        resultEligible = VotingEligibility.checkEligibility(25);
        // Check the eligibility for a person with age 16 and store the result
        resultNotEligible = VotingEligibility.checkEligibility(16);
    }
    // Test method to check if a person is eligible to vote
    @Test
    void testEligibleToVote() {
        // Print a message indicating that the testEligibleToVote test is being run
        System.out.println("Running testEligibleToVote...");
        // Assert that a person with age 25 is eligible to vote
        assertEquals("Eligible to vote", resultEligible, "Should be eligible to vote");
    }
    // Test method to check if a person is not eligible to vote
    @Test
    void testNotEligibleToVote() {
        // Print a message indicating that the testNotEligibleToVote test is being run
        System.out.println("Running testNotEligibleToVote...");
        // Assert that a person with age 16 is not eligible to vote
        assertEquals("Not eligible to vote", resultNotEligible, "Should not be eligible to vote");
    }
}
Output:
Person is eligible to vote.
Person is not eligible to vote.
Running testEligibleToVote...
Running testNotEligibleToVote...
Explanation of the above Program:
In the above code, I created three methods for testing purposes the static method is for @BeforeAll annotation.
- The testEligibleToVote() method is used to check whether a person is greater than 18 or not if it is true then this returns output as Running testEligibleToVote.
- The other method is used for testNotEligibleToVote() is used for printing messages if the given age is not eligible to vote.
Importance Of Testing using JUnit
- Identifying Bugs and Issues
- Ensuring Software Quality
- Enhancing User Experience
- Maintaining Product Reputation
- Reducing Costs and Risks
- Compliance and Standards
- Facilitating Maintenance and Updates
Junit 5 vs Junit 4
The below table explains the major differences between the most widely used versions of JUnit 5 and JUnit 4.
| JUnit 5 | JUnit 4 | 
|---|---|
| It is a Modular Architecture | It is Monolithic Architecture | 
| It Requires Java 8 or Higher runtime | It Requires Java 5 or higher | 
| Better IDE Integration and Support | Limited IDE integration | 
| Support for creating dynamic tests at runtime | Dynamic tests are directly not Supported | 
| Assertions class for most assertions | Assert class for most assertions | 
| It is a more powerful extension model | Limited extension capabilities | 
| It Supports parameterized testing | Parameterized tests are less flexible | 
| It has a lot of annotations | It has Limited annotations only compared with JUnit 5 | 
Advantages of @BeforeAll
The @BeforeAll annotation in JUnit provides several advantages in the context of testing are mentioned below:
- Initialization of Resources
- Efficiency
- Improved Test Performance
- Shared State
- Clean Code
- Reduction of Code Duplication
- Support for Stateless Testing
- Explicit Order of Execution
- Scalability
Conclusion
The @BeforeAll annotation is used in JUnit 5 to give a signal that annotated method executes first in that test class before all the test methods.
- This is used for setting data for all the test cases.
- The @BeforeAll have a void return type and should not be private
- @BeforeAll methods can be used in conjunctions with @AfterAll Annotation to perform cleanup tasks.
