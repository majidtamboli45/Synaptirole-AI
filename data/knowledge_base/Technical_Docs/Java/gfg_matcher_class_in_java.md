# Matcher Class in Java

> Source: https://www.geeksforgeeks.org/java/matcher-class-in-java/

Regular Expressions in Java provide a way to match, search, and manipulate text. The Matcher class is part of the java.util.regex package is used to perform matching operations on an input string using a compiled regular expression (Pattern). The Matcher class provides methods to:
- Check matches
- Retrieve match positions
- Study the matching state
- Replace matched content
import java.util.regex.*;
public class GFG {
    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("java");
        Matcher matcher = pattern.matcher("java is java");
        System.out.println(matcher.find());
    }
}
Output
true
Explanation:
- Pattern.compile("java") creates a regex pattern to search for the word "java".
- matcher.find() checks whether the pattern occurs anywhere in the string "java is java", so it returns true.
Methods of Matcher class:
1. Match Methods
Match methods are used to check whether a pattern matches the input string, either completely or partially.
| Method | Description | 
|---|---|
| matches() | Checks if the entire input matches the pattern | 
| find() | Finds the next occurrence of the pattern | 
| lookingAt() | Checks if the pattern matches from the beginning | 
Example: Difference between matches(), lookingAt(), and find()
import java.util.regex.*;
public class GFG{
    
    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("java");
        Matcher matcher = pattern.matcher("java is java");
        System.out.println(matcher.matches());
        System.out.println(matcher.lookingAt());
        while (matcher.find()) {
            System.out.println("Match found");
        }
    }
}
Output
false
true
Match found
Explanation:
- matches() fails because the entire string is not exactly "java"
- lookingAt() succeeds as the string starts with "java"
- find() locates each occurrence of "java"
- find() can be called multiple times
- Matching state is maintained internally
2. Index Methods
Index methods return positional information about the current match in the input string.
| Method Name | Description | 
|---|---|
| start() | returns the start index of the previous match. | 
| start(int group) | returns the start index of the subsequence captured by the given group during the previous match operation. | 
| end() | returns the offset after the last character is matched. | 
| end(int group) | returns the offset after the last character of the subsequence captured by the given group during the previous match operation. | 
Example: Retrieving match positions using index methods
import java.util.regex.*;
public class GFG {
    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("(java)");
        Matcher matcher = pattern.matcher("I love java");
        if (matcher.find()) {
            System.out.println(matcher.start());
            System.out.println(matcher.end());
            System.out.println(matcher.start(1));
            System.out.println(matcher.end(1));
        }
    }
}
Output
7
11
7
11
Explanation:
- find() locates the match
- start() returns the index where the match begins
- end() returns the index after the match ends
- Group-based methods return positions of captured groups
- Indexing is zero-based
3. Study Methods
Study methods are used to inspect the state and behavior of the matcher during pattern matching.
| Method Name | Description | 
|---|---|
| groupCount() | Returns number of capturing groups | 
| group() | Returns the matched substring | 
| hitEnd() | Checks if match reached end of input | 
| requireEnd() | Checks if more input could change the result | 
Example: Inspecting matcher state using study methods
import java.util.regex.*;
public class GFG {
    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("(java)(\\d)");
        Matcher matcher = pattern.matcher("java5");
        if (matcher.find()) {
            System.out.println(matcher.group());
            System.out.println(matcher.groupCount());
            System.out.println(matcher.hitEnd());
            System.out.println(matcher.requireEnd());
        }
    }
}
Output
java5
2
false
false
Explanation:
- group() returns the complete match
- groupCount() returns number of capturing groups
- hitEnd() checks if matcher reached input end
- requireEnd() checks if more input may affect the match
- Useful in stream-based matching
4. Replacement Methods:
Replacement methods are used to modify the input string based on regex matches.
| Method Name | Description | 
|---|---|
| appendReplacement(StringBuffer sb, String replacement) | Performs a non-terminal append-and-replace operation. | 
| appendTail(StringBuffer sb) | Appends the remaining input after the last match. | 
| replaceAll(String replacement) | Replaces all matching subsequences. | 
| replaceFirst(String replacement) | Replaces the first matching subsequence. | 
Example: Replacing matched text using Matcher methods
import java.util.regex.*;
public class GFG {
    public static void main(String[] args) {
        Pattern pattern = Pattern.compile("java");
        Matcher matcher = pattern.matcher("java is java");
        System.out.println(matcher.replaceFirst("Java"));
        System.out.println(matcher.replaceAll("Java"));
        matcher.reset();
        StringBuffer sb = new StringBuffer();
        while (matcher.find()) {
            matcher.appendReplacement(sb, "Java");
        }
        matcher.appendTail(sb);
        System.out.println(sb.toString());
    }
}
Output
Java is java
Java is Java
Java is Java
Explanation:
- replaceFirst() replaces only the first match
- replaceAll() replaces every match
- appendReplacement() builds result incrementally
- appendTail() appends remaining text
- Maintains original string structure
