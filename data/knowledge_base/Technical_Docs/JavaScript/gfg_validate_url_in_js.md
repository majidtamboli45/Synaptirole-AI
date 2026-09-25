# Validate URL in JS

> Source: https://www.geeksforgeeks.org/javascript/how-to-validate-url-using-regular-expression-in-javascript/

Validating a URL in JavaScript ensures that the entered string follows the correct web address format. It helps prevent invalid or malformed URLs from being processed or submitted.
- Use a regular expression (RegExp) to check the URL format.
- The .test() method returns true if the URL is valid, otherwise false.
- URL validation is useful in forms, input fields, and web applications.
All valid URLs follow a particular pattern. They have three main parts, which are:
- Protocol
- Domain name (or IP address)
- Port and path.
1. Using Regular Expression
To validate a URL in JavaScript using a regular expression (regex), we will use the following pattern to match the common URL format in the below example.
function isValid(url) {
    const pattern = /^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([\/\w .-]*)*\/?$/;
    return pattern.test(url);
}
//Driver Code Starts
console.log(isValid("https://www.example.com////"));
console.log(isValid("http://example.com////"));  
console.log(isValid("www.example.com"));   
console.log(isValid("invalid-url"));     
//Driver Code Ends
- ^(https?:\/\/)?: Matches an optional http:// or https://.
- ([\da-z.-]+): Matches the domain name (alphanumeric characters, dots, and hyphens).
- \.: Matches the dot before the domain extension.
- ([a-z.]{2,6}): Matches the domain extension (For ex., .com, .org).
- ([\/\w .-]*)*\/?: Matches the optional path, query strings, or fragments.
2. Using URL Object
- The URL object in JavaScript provides a built-in way to parse and validate URLs.
- It is robust, handles complex cases, and doesn't require writing or maintaining custom regular expressions.
function isValid(url) {
    try {
        new URL(url);
        return true;
    } catch (e) {
        return false;
    }
}
//Driver Code Starts
console.log(isValid("https://www.example.com////")); 
console.log(isValid("http://example.com////"));     
console.log(isValid("www.example.com"));      
console.log(isValid("invalid-url"));         
//Driver Code Ends
3. Using npm Packages
There are two npm packages is-url and is-url-http to validate URL. Install the packages with the following command:
npm install is-url
npm install is-url-http
Using is-url npm Packages
import isUrl from 'is-url';
console.log(isUrl("https://www.example.com////")); 
console.log(isUrl("http://example.com////"));   
console.log(isUrl("www.example.com"));       
console.log(isUrl("invalid-url"));           
4. Using is-url-http npm Packages
import isUrlHttp from 'is-url-http';
console.log(isUrlHttp("https://www.example.com////"));
console.log(isUrlHttp("http://example.com////"));   
console.log(isUrlHttp("www.example.com"));     
console.log(isUrlHttp("invalid-url"));
