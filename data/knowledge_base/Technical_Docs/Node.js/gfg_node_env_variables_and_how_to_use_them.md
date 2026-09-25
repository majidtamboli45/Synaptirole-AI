# NODE_ENV Variables and How to Use Them ?

> Source: https://www.geeksforgeeks.org/node-js/node_env-variables-and-how-to-use-them/

export NODE_ENV = production
$env:NODE_ENV = 'production'
NODE_ENV = production node app.js
set NODE_ENV=production&&node app.js
Because different operating systems require different command, there is a package available called cross-env which makes the command cross-platform.
npx cross-env NODE_ENV=production node app.js
The above code will work on any platform where the cross-env package is installed as a developer dependency.
If we are using express, we can provide environment-specific settings that are automatically called based on the environment we are working on. Syntax:
if(process.env.NODE_ENV == 'development') {
   // Code for Development Mode
} else {
   // Code for Testing Mode
}
Suppose our database server is the localhost when we are working on development mode and we'll be using https://production-server.com for production. The code can be set accordingly.
if(process.env.NODE_ENV == 'development') {
    db.connect('localhost:1234')
} else {
    db.connect('https://production-server.com')
}
The above code will check the environment and will set it's server accordingly.
Conclusion: Use of the production environment is a good practice because in the production environment, usually logging is kept minimum also more caching levels take place for optimized performance. So, it is always a good practice to set up the environment variable to production mode whenever we are deploying our app to the production server.
