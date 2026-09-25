# Best Security Practices in Node.js

> Source: https://www.geeksforgeeks.org/node-js/best-security-practices-in-node-js

The security of an application is extremely important when we build a highly scalable and big project. So in this article, we are going to discuss some of the best practices that we need to follow in Node.js projects so that there are no security issues at a later point of time.
In this article, we are going to discuss some of the common attacks and give suggestions to prevent them:
Compromised Database: The first and most important thing is database and attacker gained access to the database if we are not secure them. So to secure it, we need to follow two things that are:
- Strongly encrypt passwords with salt and hash: To encrypt a password in the express app, we are going to use the bcyrpt.js package which will encrypt a password and convert it into a hash code which is not readable by attackers.
- Strongly encrypt passwords reset token: Whenever the user going to rest a password, a newly hashcode of reset password should be generated so that no attackers will understand it.
- Use bcrypt.js package: It hashes the password when store it into database.
- Implement rate-limiting: In rate-limiting, it limits the number of requests coming from the single IP.
- Implement maximum login attempts for each user: You can set a limit that after some of the failed login attempts you are not able to log in until some specific amount of time.
- Store JWT tokens in HTTPonly cookies: Never store JWT tokens in local storage always use HTTP only cookies.
- Sanitize user input data: By sanitizing user input data means we are limiting the user to do not input a weird data.
- Set special HTTP headers: You can use the npm build-in package for adding some of the special headers so it helps in security. The helmet will set various HTTP headers to help protect your app.
- Implement rate-limiting: By using rate limiting you can easily prevent such types of attacks you build a rate-limiting function by which you can limit the numbers of the request made by users.
- Limit body-payload: We can also limit the amount of data send in body payload so that the load is not that high which crashes our application.
- Avoid evil regular expressions: This is the regular expressions that take exponential time to run for non-matching input.
- Create random passwords and reset tokens with an expiry date.
- Deny access to JWT token after the password change.
- Don’t commit sensitive data or config on git.
- Always use two-factor authentication.
- Always spent as much as possible time on Authentication, Authorization and Security features of your app.
