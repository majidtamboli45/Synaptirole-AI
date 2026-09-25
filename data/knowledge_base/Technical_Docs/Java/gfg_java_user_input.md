# Java User Input

> Source: https://www.geeksforgeeks.org/java/java-user-input-scanner-class/

The Scanner class, introduced in Java 5, belongs to the java.util package allows developers to read input from different sources easily.
- The Scanner class can read input from keyboard (console), files, strings, and data streams.
- Beginners prefer it due to its simple syntax and ease of use compared to older approaches like BufferedReader.
Steps of Using Scanner in Our Code
Follow these steps to take user input using the Scanner class:
1. Import the Scanner class using import java.util.Scanner;
2. Create a Scanner object
- Scanner sc = new Scanner(System.in); // System.in represents standard input (keyboard).
3. When we want to ask the user for input, first print a prompt message so they know what to enter. Then use one of Scanner's handy methods to read the response:
- nextInt() for whole numbers
- nextLine() for full text lines
- nextDouble() for decimal numbers
- next() for single words
4. Close the Scanner (recommended) using sc.close();
Example 1: Reading Two Numbers and Adding Them
import java.util.Scanner;
class Geeks {
    public static void main(String[] args)
    {
        // Creating Scanner object
        Scanner scn = new Scanner(System.in);
        System.out.print("Enter First Number: ");
        int a = scn.nextInt();
        System.out.print("Enter Second Number: ");
        int b = scn.nextInt();
        System.out.println("Sum: " + (a + b));
        scn.close();
    }
}
Output:
Example 2: Taking Multiple Types of Input
In this example, we read different types of input such as strings, integers, and floating-point values.
import java.util.Scanner;
public class Geeks {
    public static void main(String[] args) {
        Scanner scn = new Scanner(System.in);
        // Reading a single line string
        System.out.print("Enter a sentence: ");
        String sentence = scn.nextLine();
        System.out.println("Entered Sentence: " + sentence);
        // Reading an integer
        System.out.print("Enter an integer: ");
        int x = Integer.parseInt(scn.nextLine());
        System.out.println("Entered Integer: " + x);
        // Reading a float value
        System.out.print("Enter a float value: ");
        float f = Float.parseFloat(scn.nextLine());
        System.out.println("Entered Float Value: " + f);
        scn.close();
    }
}
Output:
Enter a sentence: Java is easy
Entered Sentence: Java is easy
Enter an integer: 10
Entered Integer: 10
Enter a float value: 3.5
Entered Float Value: 3.5
Note: Using nextLine() consistently helps avoid common input issues caused by leftover newline characters.
Common Methods of Scanner Class
The Scanner class provides several methods to read different types of input. Some commonly used methods are listed below:
| Method | Description | 
|---|---|
| nextBoolean() | Used for reading Boolean value. | 
| nextByte() | Used for reading Byte value. | 
| nextDouble() | Used for reading Double value. | 
| nextFloat() | Used for reading Float value. | 
| nextInt() | Used for reading Int value. | 
| nextLine() | Used for reading Line value. | 
| nextLong() | Used for reading Long value. | 
| nextShort() | Used for reading Short value. | 
| next() | Used for reading a single word | 
BufferedReader vs Scanner Class
| Aspects | BufferedReader | Scanner | 
|---|---|---|
| Primary Use | Efficient reading of character streams. | Reading formatted input (e.g., integers, strings). | 
| Speed | Faster for large input as it does less parsing. | Slower due to parsing overhead (e.g., nextInt(), nextFloat()). | 
| Exception Handling | Throws checked exceptions (e.g., IOException). | No checked exceptions; easier to use. | 
| Flexibility | Allows reading larger input efficiently. | Best suited for reading simple data types. | 
| Thread Safety | Synchronized, making it thread-safe. | Not thread-safe by default. | 
| Common Use | Used for reading large input efficiently. | Commonly used for smaller, formatted input. |
