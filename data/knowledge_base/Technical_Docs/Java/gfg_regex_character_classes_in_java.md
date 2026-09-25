# Regex Character Classes in Java

> Source: https://www.geeksforgeeks.org/java/regex-character-cases-in-java/

Regular Expressions in Java provide a way to match, search, and manipulate text. One of the most important building blocks of regex is the Character Class, which allows you to match one character from a defined set of characters.
- Match multiple characters using a single pattern
- Reduce complex conditions
- Write shorter and more readable regex patterns
- Validate inputs like usernames, phone numbers, and passwords
public class GFG{
    
    public static void main(String[] args){
        
        String input = "abc123";
        System.out.println(input.matches(".*[a-z]+.*")); // true
    }
}
Output
true
Explanation:
- .* allows any characters before and after the pattern.
- [a-z]+ checks that the string contains at least one lowercase letter, so "abc123" matches and returns true.
Syntax
[characters]
Types of Character Classes in Java Regex
1. Simple Character Class
A simple character class matches exactly one character from the given set inside square brackets. It is used when you want to allow multiple specific characters at a single position
public class GFG{
    
    public static void main(String[] args){
        
        String regex = "[abc]";
        System.out.println("a".matches(regex));
        System.out.println("b".matches(regex)); 
        System.out.println("d".matches(regex)); 
    }
}
Output
true
true
false
Explanation:
- The regex "[abc]" allows only one character, and it must be either a, b, or c, which is why "a" and "b" return true.
- The string "d" does not belong to the defined character set in the regex, so "d".matches(regex) returns false.
2. Range Character Class
Range Character Class matches one character within a specified range using a hyphen (-). It is commonly used to validate digits, lowercase letters, or uppercase letters efficiently.
public class Main {
    public static void main(String[] args) {
        String regex = "[0-9]";
        System.out.println("5".matches(regex)); 
        System.out.println("a".matches(regex)); 
    }
}
Output
true
false
Explanation:
- The regex "[0-9]" matches any single digit from 0 to 9, so "5" returns true.
- The character "a" is outside the numeric range, so the match returns false.
3. Multiple Ranges in a Character Class
Multiple Range Character Class allows combining several character ranges in one set. This is useful when validating inputs that can contain letters and digits together.
public class Main {
    public static void main(String[] args) {
        String regex = "[a-zA-Z0-9]";
        System.out.println("A".matches(regex)); 
        System.out.println("7".matches(regex)); 
        System.out.println("@".matches(regex)); 
    }
}
Output
true
true
false
Explanation:
- The regex "[a-zA-Z0-9]" accepts uppercase letters, lowercase letters, or digits, so "A" and "7" match successfully.
- The character "@" is not included in any specified range, so the match returns false.
4. Negated Character Class
A Negated Character Class is used to match any single character except the ones specified inside the brackets. It is identified by the caret (^) placed at the beginning of the character set.
public class Main {
    public static void main(String[] args) {
        String regex = "[^0-9]";
        System.out.println("a".matches(regex)); 
        System.out.println("5".matches(regex)); 
    }
}
Output
true
false
Explanation:
- The regex [^0-9] matches any non-digit character, so "a" returns true.
- The character "5" is a digit and is explicitly excluded, so the match returns false.
5. Predefined Character Classes
Java provides predefined character classes for commonly used patterns.
| Regex | Description | 
|---|---|
| \d | Digit [0-9] | 
| \D | Non-digit | 
| \w | Word character [a-zA-Z0-9_] | 
| \W | Non-word character | 
| \s | Whitespace (space, tab, newline) | 
| \S | Non-whitespace | 
Quantifiers with Character Classes
Quantifiers are used to specify how many times a character from a defined set or range should appear. They make regex patterns more powerful for validating repeated characters like digits, letters, or symbols.
| Quantifier | Meaning | Description | Example | 
|---|---|---|---|
| * | Zero or more times | Allows any number of occurrences of a character class | [0]*[0-9] | 
| + | One or more times | Requires at least one occurrence of a character class | [0]+[0-9] | 
| ? | Zero or one time | Makes a character class optional | [A-Za-z][A-Za-z]-?[0-9][0-9] | 
| {m} | Exactly m times | Matches a character class exactly m times | [0-9]{3} | 
| {m,} | At least m times | Matches a character class m or more times | [0-9]{2,} | 
| {m,n} | At least m and at most n times | Matches a character class between m and n times | [0-9]{2,4} | 
Note:
- Quantifiers always apply to the preceding character class
- [0-9]{3} -> digit class repeated 3 times
- -? -> optional hyphen using quantifier on a character
