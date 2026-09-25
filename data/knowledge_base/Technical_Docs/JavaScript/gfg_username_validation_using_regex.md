# Username Validation using Regex

> Source: https://www.geeksforgeeks.org/javascript/username-validation-in-js-regex/

We are going to validate usernames in JavaScript. Username validation is a common requirement in user registration forms, ensuring that usernames meet the specific criteria
- It must start with a letter.
- Can contain letters, numbers, and underscores.
- Must be between 3 and 16 characters long.
Simple Regular Expression-Based Validation
In this approach, we are using only simple regular expressions to validate usernames.
function validateUsername(username) {
    const pattern = /^[a-zA-Z][a-zA-Z0-9_]{2,15}$/;
    return pattern.test(username);
}
//Driver Code Starts
// Test cases
console.log(validateUsername("user123"));
console.log(validateUsername("_user"));  
console.log(validateUsername("u"));      
console.log(validateUsername("user_name123"));
console.log(validateUsername("user@name")); 
//Driver Code Ends
- ^ : Start of the string
- [a-zA-Z] : The username must start with a letter (uppercase or lowercase).
- [a-zA-Z0-9_] : The username can contain letters, numbers, and underscores.
- {2,15} : The username must be between 3 and 16 characters long (since the first character is already matched, we use {2,15} for the remaining length).
- $ : End
Combined Logic for More Customization
In some cases, using only regular expressions might not be enough, especially if you have more complex validation rules.
function validateUsername(username) {
    if (username.length < 3) {
        return "Username is too short.";
    }
    if (username.length > 16) {
        return "Username is too long.";
    }
    // Regex to check valid characters: letters, numbers, dots, underscores
    const pattern = /^[a-zA-Z0-9._]+$/;
    if (!pattern.test(username)) {
        return "Username contains invalid characters. Only letters, numbers, dots, and underscores are allowed.";
    }
    // Check that it doesn't start or end with a dot or underscore
    if (username.startsWith('.') || username.startsWith('_')) {
        return "Username cannot start with a dot or underscore.";
    }
    if (username.endsWith('.') || username.endsWith('_')) {
        return "Username cannot end with a dot or underscore.";
    }
    return "Valid username.";
}
//Driver Code Starts
console.log(validateUsername("user.name"));
console.log(validateUsername(".username"));
console.log(validateUsername("username_"));
console.log(validateUsername("us"));
console.log(validateUsername("a_very_long_username_example"));
console.log(validateUsername("valid_user123"));
console.log(validateUsername("invalid#name"));
//Driver Code Ends
