# Validate Password in JS

> Source: https://www.geeksforgeeks.org/javascript/javascript-program-to-validate-password-using-regular-expressions/

Password validation in JavaScript using regular expressions ensures that user passwords meet specific security requirements. It helps distinguish between strong and weak passwords based on defined rules.
- Checks for a mix of uppercase, lowercase, numbers, and special characters.
- Enforces minimum and maximum length constraints.
- Improves security by preventing weak or easily guessable passwords.
let regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@.#$!%*?&])[A-Za-z\d@.#$!%*?&]{8,15}$/;
let s1 = "Geeks@123";
let s2 = "GeeksforGeeks";
let s3 = "Geeks123";
console.log(s1, regex.test(s1));
console.log(s2, regex.test(s2));
//Driver Code Starts
console.log(s3, regex.test(s3));
//Driver Code Ends
Regular Expression Breakdown:
- ^(?=.*[a-z]): Ensures at least one lowercase letter.
- (?=.*[A-Z]): Ensures at least one uppercase letter.
- (?=.*\d): Ensures at least one digit.
- (?=.*[@$!%*?&]): Ensures at least one special character.
- [A-Za-z\d@$!%*?&]{8,}$: Ensures the password is at least 8 characters long.
Multiple Output based on Password Strength
In this method, we will set the password strength on the basis of the number of combinations for numbers, letters, special symbols, etc.
//Driver Code Starts
const levels = {
    1: "Very Weak",
    2: "Weak",
    3: "Medium",
    4: "Strong",
};
//Driver Code Ends
function checkPwd(pwd) {
    if (pwd.length > 15) {
        return console.log(pwd + " - Too lengthy");
    } else if (pwd.length < 8) {
        return console.log(pwd + " - Too short");
    }
    const checks = [
        /[a-z]/,     // Lowercase
        /[A-Z]/,     // Uppercase
        /\d/,        // Digit
        /[@.#$!%^&*.?]/ // Special character
    ];
    let score = checks.reduce((acc, rgx) => acc + rgx.test(pwd), 0);
    console.log(pwd + " - " + levels[score]);
}
//Driver Code Starts
let pwds = [
    "u4thdkslfheogica",
    "G!2ks",
    "GeeksforGeeks",
    "Geeks123",
    "GEEKS123",
    "Geeks@123#",
];
pwds.forEach(checkPwd);
//Driver Code Ends
