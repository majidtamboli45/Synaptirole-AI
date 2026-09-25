# Validate Email Address using RegExp in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/how-to-validate-email-address-using-regexp-in-javascript/

Validating an email address in JavaScript helps ensure that users enter data in the correct format before submission. Regular expressions (RegExp) offer a powerful and efficient way to verify email structure.
- Uses pattern matching to check proper email format (e.g., username@domain.com).
- Helps prevent invalid or incomplete email inputs.
- Improves data accuracy and user experience in forms.
Validate Email Addresses
Validating email addresses is important for a number of reasons:
- User Input: Ensure that users enter a correctly formatted email.
- Avoid Errors: Prevent errors caused by invalid email formats that might break functionality.
- User Experience: Provide real-time feedback to users about their email input, improving the overall experience.
- Security: Validating the email helps in preventing malicious input, reducing the risk of injection attacks.
Regular Expression
Regular Expressions (RegExp) are used in JavaScript to define patterns for searching and validating text. They are especially useful for checking whether inputs like email addresses follow the correct format.
- Helps verify if an email matches the standard structure (e.g., user@domain.com).
- Uses pattern matching to detect invalid or missing parts in an email.
- Widely used in form validation to ensure accurate user input.
A common RegExp pattern to validate email addresses looks like this:
/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$/.
Regex Breakdown:
- ^[a-zA-Z0-9._%+-]+ : Matches the username part of the email, allowing alphanumeric characters and some special characters like. ,_ ,% ,+ , and- .
- @ : Matches the literal "@" symbol that separates the username from the domain.
- [a-zA-Z0-9.-]+ : Matches the domain part, allowing letters, digits, dots, and hyphens.
- \. : Escapes the dot (. ) to match the literal period separating the domain from the top-level domain (TLD).
- [a-zA-Z]{2,}$ : Matches the top-level domain (TLD), which must consist of at least 2 alphabetic characters.
Validating Email Address Format in JavaScript Regex
You can use either the test() method or the match() method with a regular expression to validate an email.
1. Using the test() Method with RegExp
You can use either the test() method or the match() method with the RegExp pattern to validate the email format.
let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
let mail = "test@example.com";
if (regex.test(mail)) {
    console.log("Valid Email address");
} else {
    console.log("Invalid Email address");
}
- regex.test(mail) checks if the email matches the regular expression.
- If the email matches the pattern, it prints "Valid Email address."
- Otherwise, it prints "Invalid Email address."
2. Using match() with RegExp
Another approach is to use the match() method, which returns an array if the email matches the regular expression or null if it doesn’t.
//Driver Code Starts
let regex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
let mail = "user@domain.com";
//Driver Code Ends
let isValid = mail.match(regex);
if (isValid) {
    console.log("Valid email address");
} else {
    console.log("Invalid email address");
}
- mail.match(regex) tries to match the email against the regular expression.
- If there is a match, it returns an array with the matched string. If no match is found, it returns null.
- In this example, the result is stored in isValid and used to check if the email is valid.
