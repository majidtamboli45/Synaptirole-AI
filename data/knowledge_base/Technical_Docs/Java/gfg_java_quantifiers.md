# Java Quantifiers

> Source: https://www.geeksforgeeks.org/java/quantifiers-in-java/

Java Quantifiers are special symbols in Regular Expressions (Regex) that specify how many times a character, character class, or group can occur in a pattern. They make regex more powerful and flexible for tasks such as input validation, searching, parsing, and text manipulation.
- Control the number of occurrences of a pattern.
- Work with characters, character classes, and groups.
public class GFG {
    public static void main(String[] args) {
        String input = "0007";
        System.out.println(input.matches("0*\\d")); 
    }
}
Output
true
Explanation:0* allows zero or more occurrences of 0 . \d matches a digit. The string "0007" satisfies the pattern
Common Quantifier Symbols Used in Java
These symbols specify how many times a character, character class, or group can occur in a regular expression. They represent the basic quantifier symbols, while their matching behavior can be Greedy, Reluctant, or Possessive.
- X* –> Zero or more occurrences of X
- X? –> Zero or one occurrence of X
- X+ –> One or more occurrences of X
- X{n} –> Exactly n occurrences of X
- X{n,} –> At least n occurrences of X
- X{n,m} –> Between n and m occurrences of X (inclusive)
Types of Quantifiers in Java Regex
1. Greedy Quantifier
Greedy quantifiers try to match as much of the input as possible while still allowing the overall pattern to match. This is the default behavior in Java Regex.
public class GFG {
    public static void main(String[] args) {
        String regex = "a+";
        System.out.println("aaaa".matches(regex));
    }
}
Output
true
Explanation:
- + is greedy by default
- It matches the maximum possible number of a characters
2. Reluctant Quantifier
Reluctant quantifiers try to match as little of the input as possible. They are created by appending ? to a quantifier symbol.
public class GFG {
    public static void main(String[] args) {
        String regex = "a+?";
        System.out.println("aaaa".matches(regex));
    }
}
Output
true
Explanation:
- +? makes the quantifier reluctant
- It matches the minimum number of characters required
3. Possessive Quantifier
Possessive quantifiers match as much as possible and do not backtrack. They are created by appending + to a quantifier symbol.
public class GFG {
    public static void main(String[] args) {
        String regex = "a++a";
        System.out.println("aaaa".matches(regex));
    }
}
Output
false
Explanation: In this example, a++ consumes all a characters and does not allow backtracking. As a result, the remaining a in the pattern cannot be matched, and the match fails.
Greedy vs Reluctant vs Possessive Quantifiers
| Aspect | Greedy Quantifiers | Reluctant (Lazy) Quantifiers | Possessive Quantifiers | 
|---|---|---|---|
| Matching Behaviour | Matches as much as possible while still allowing the overall match | Matches as little as possible to satisfy the pattern | Matches as much as possible without giving up characters | 
| Backtracking | Allows backtracking | Allows backtracking | Does not allow backtracking | 
| Syntax / Usage | Default quantifiers (*, +, {m,n}) | Append ? after the quantifier (*?, +?, {m,n}?) | Append + after the quantifier (*+, ++, {m,n}+) | 
| Control Over Matching | Least control (default behavior) | Highest control over minimal matching | Strictest control, no backtracking | 
| Performance | Can be slower due to backtracking | Can be slower due to frequent backtracking | Often faster, but may cause match failure | 
| Common Use Case | General-purpose matching | Precise or minimal matching scenarios | Performance-critical patterns where backtracking is unnecessary | 
Advantages of Java Quantifiers
- Simplify Regular Expressions by reducing repetitive pattern definitions.
- Control Repetition using exact, minimum, maximum, or unlimited occurrences.
- Improve Pattern Matching for complex text and input formats.
- Support Input Validation for emails, phone numbers, passwords, and IDs.
- Enhance Readability by making regex patterns shorter and easier to understand.
- Optimize Performance with possessive quantifiers by avoiding unnecessary backtracking.
