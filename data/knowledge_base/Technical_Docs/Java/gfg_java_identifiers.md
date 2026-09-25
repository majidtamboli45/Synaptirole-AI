# Java Identifiers

> Source: https://www.geeksforgeeks.org/java/java-identifiers/

An identifier in Java is a name given to programming elements such as variables, classes, methods, packages, and interfaces. It is used to uniquely identify these elements in a program.
- Identifiers help in naming and accessing different elements in a Java program
- Each identifier must follow Java naming rules to avoid compilation errors
class Geeks{
    public static void main(String[] args){
        int x = 9; 
    }
}
The image below describes Identifiers in this program
Rules For Naming Java Identifiers
There are certain rules for defining a valid Java identifier. These rules must be followed, otherwise, we get a compile-time error. These rules are also valid for other languages like C and C++.
- The only allowed characters for identifiers are all alphanumeric characters([A-Z],[a-z],[0-9]), '$'(dollar sign) and '_' (underscore). For example, "geek@" is not a valid Java identifier as it contains a '@', a special character.
- Identifiers should not start with digits([0-9]). For example, "123geeks" is not a valid Java identifier.
- Java identifiers are case-sensitive.
- There is no limit on the length of the identifier, but it is advisable to use an optimum length of 4 - 15 letters only.
- Reserved Words can't be used as an identifier. For example, "int while = 20;" is an invalid statement as a while is a reserved word.
Note: Java has 53 reserved words (including 50 keywords and 3 literals), that are not allowed to be used as identifiers.
Examples of Valid Identifiers
MyVariable
MYVARIABLE
myvariable
x
i
x1
i1
_myvariable
$myvariable
sum_of_array
geeks123
Examples of Invalid Identifiers
My Variable                     // contains a space
123geeks                         // Begins with a digit
a+c                                 // plus sign is not an alphanumeric character
variable-2                    // hyphen is not an alphanumeric character
sum_&_difference    // ampersand is not an alphanumeric character
