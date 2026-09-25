# Java String Methods

> Source: https://www.geeksforgeeks.org/java/java-string-methods/

Java String methods are built-in functions provided by the String class to perform various operations on strings. These methods help in manipulating, comparing, searching, and formatting text efficiently. They make string handling easier and more convenient in Java programs.
- Help in text manipulation and processing.
- Support string comparison.
- Allow searching within strings.
public class Geeks{
    public static void main(String[] args) {
        String str = "GeeksforGeeks";
        System.out.println("Length: " + str.length());  
        System.out.println("Uppercase: " + str.toUpperCase());
        System.out.println("Substring: " + str.substring(2, 6));
    }
}
Output
Length: 13
Uppercase: GEEKSFORGEEKS
Substring: eksf
Commonly Used Java String Methods.
Java provides a rich set of String methods that help perform various operations like comparison, searching, modification of string. Let's Understand one by one.
1. int length() Method
This method provides the total count of characters in the string.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.length());
    }
}
Output
13
2. charAt(int i) Method
This method returns the character at ith index.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.charAt(7));
    }
}
Output
W
3. String substring(int i) Method
This method return the substring from the ith index character to end.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.substring(7));
    }
}
Output
World!
4. String substring(int i, int j) Method
This method returns the substring from i to j-1 index.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.substring(7, 12));
    }
}
Output
World
5. String concat( String str) Method
This method appends the given string to the end of the current string.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.concat("!!!"));
    }
}
Output
Hello, World!!!!
6. int indexOf(String s) Method
This method returns the index within the string of the first occurrence of the specified string. If the specified string s is not found in the input string, the method returns -1 by default.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.indexOf("World"));
    }
}
Output
7
7. int indexOf(String s, int i) Method
This method returns the index within the string of the first occurrence of the specified string, starting at the specified index.
public class Geeks {
    public static void main(String[] args) {
        String str = "Hello, World!";
        System.out.println(str.indexOf("l", 4));
    }
}
Output
10
8. int lastIndexOf(String s) Method
This method returns the index within the string of the last occurrence of the specified string. If the specified string s is not found in the input string, the method returns -1 by default.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.lastIndexOf("l"));
    }
}
Output
10
9. boolean equals(Object otherObj) Method
This method compares this string to the specified object.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.equals("Hello, World!"));
    }
}
Output
true
10. boolean equalsIgnoreCase(String anotherString) Method
This method checks if two strings are equal, without considering letter case.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.equalsIgnoreCase("hello, world!"));
    }
}
Output
true
11. int compareTo(String anotherString) Method
This method compares two string lexicographically.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.compareTo("Hello, Java!"));
    }
}
Output
13
12. int compareToIgnoreCase(String anotherString) Method
This method compares two string lexicographically, ignoring case considerations.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.compareToIgnoreCase("hello, java!"));
    }
}
Output
13
13. String toLowerCase() Method
This method converts all the characters in the String to lower case.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.toLowerCase());
    }
}
Output
hello, world!
14. String toUpperCase() Method
This method converts all the characters in the String to upper case.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.toUpperCase());
    }
}
Output
HELLO, WORLD!
15. String trim() Method
This method returns the copy of the String, by removing whitespaces at both ends. It does not modify the whitespace characters present between the text.
public class Geeks {
    public static void main(String[] args) {
        String s = "   Hello, Trim!   ";
        System.out.println("'" + s.trim() + "'");
    }
}
Output
'Hello, Trim!'
16. String replace(char oldChar, char newChar) Method
This method returns a new string where all instances of oldChar are replaced by newChar.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.replace('l', 'x'));
    }
}
Output
Hexxo, Worxd!
17. boolean contains(CharSequence sequence) Method
This method returns true if string contains the given string.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.contains("World"));
    }
}
Output
true
18. char[] toCharArray() Method
This method converts the string into a new character array.
public class Geeks {
    public static void main(String[] args) {
        String str = "Hello";
        char[] chars = str.toCharArray();
        for(char c : chars) {
            System.out.print(c + " ");
        }
    }
}
Output
H e l l o 
19. boolean startsWith(String prefix) Method
This method returns true if string starts with this prefix.
public class Geeks {
    public static void main(String[] args) {
        String s = "Hello, World!";
        System.out.println(s.startsWith("Hello"));
    }
}
Output
true
Common String Methods in Java
| String Methods | Description | 
|---|---|
|  | Returns the number of characters in the String. | 
|  | Returns the character at ith index. | 
|  | Return the substring from the ith index character to end. | 
|  | Returns the substring from i to j-1 index. | 
|  | Concatenates specified string to the end of this string. | 
|  | Finds the position of the first occurrence of the given substring within the main string. If the specified string s is not found in the input string, the method returns -1 by default. | 
|  | Returns the index within the string of the first occurrence of the specified string, starting at the specified index. | 
|  | Returns the index within the string of the last occurrence of the specified string. If the specified string s is not found in the input string, the method returns -1 by default. | 
|  | Compares this string to the specified object. | 
|  | Compares string to another string, ignoring case considerations. | 
|  | Compares two string lexicographically. | 
|  | Compares two string lexicographically, ignoring case considerations. Note: In this case, it will not consider case of a letter (it will ignore whether it is uppercase or lowercase). | 
|  | Converts all the characters in the String to lower case. | 
|  | Converts all the characters in the String to upper case. | 
|  | Returns the copy of the String, by removing whitespaces at both ends. Whitespace characters between words remain unchanged. | 
|  | Generates a new string where every instance of oldChar is substituted with newChar. Note: s1 is still feeksforfeeks and s2 is geeksgorgeeks | 
|  | Returns true if string contains the given string. | 
|  | Converts this String to a new character array. | 
|  | Return true if string starts with this prefix. |
