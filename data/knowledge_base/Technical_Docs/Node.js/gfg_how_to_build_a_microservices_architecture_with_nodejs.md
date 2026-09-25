# How to Build a Microservices Architecture with NodeJS

> Source: https://www.geeksforgeeks.org/node-js/how-to-build-a-microservices-architecture-with-nodejs/

Microservices architecture allows us to break down complex applications into smaller, independently deployable services. Node.js, with its non-blocking I/O and event-driven nature, is an excellent choice for building microservices.
Microservices architecture can involve designing the application as a collection of loosely coupled services. Each service is independent, deployable, and communicates over the network. This article will guide you through creating a microservices architecture using NodeJS.
Prerequisites
Approach
We can build the microservices architecture with NodeJS. We will create a basic microservice architecture for Users. where we can create and access the list of users. we are going to do this all:
- Identify and define the individual services.
- Set up the environment for the each services
- Implement the each service independently.
- Set up the API Gateway to route the requests to the appropriate services.
- Ensure communication between the services using REST APIs.
Steps to Build Microservices Architecture with NodeJS
We will create the user-service that will show the small architecture of user management. where we can create a user and that will store in the mongodb database and we can access all the users.
Step 1: Initialize the Project
We can initialize the project using below command.
mkdir user-service
cd user-service
npm init -y
Step 2: Install the Required Dependencies
The user service required dependencies are express, mongoose and body-parser of the application. Use the following command
npm install express mongoose body-parser
Project Structure
Updated dependencies
"dependencies": {
"express": "^4.19.2",
"mongoose": "^8.4.4"
}
Example: Create the files for the schema and the controller functions.
//models / userModel.js
const mongoose = require('mongoose');
const userSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true,
        unique: true
    }
});
const User = mongoose.model('User', userSchema);
module.exports = User;
// controllers/userController.js
const User = require('../models/userModel');
exports.createUser = async (req, res) => {
    try {
        const user = new User(req.body);
        await user.save();
        res.status(201).send(user);
    } catch (error) {
        res.status(400).send(error);
    }
};
exports.getUsers = async (req, res) => {
    try {
        const users = await User.find();
        res.status(200).send(users);
    } catch (error) {
        res.status(500).send(error);
    }
};
//index.js
const express = require('express');
const bodyParser = require('body-parser');
const mongoose = require('mongoose');
const userController = require('./controllers/userController');
const app = express();
app.use(bodyParser.json());
mongoose.connect('mongodb://localhost:27017/users',
    { useNewUrlParser: true, useUnifiedTopology: true });
app.post('/users', userController.createUser);
app.get('/users', userController.getUsers);
app.listen(3000, () => {
    console.log('User service running on port 3000');
});
Run the application using the following command
npm run start Step 3: Testing the user-service
- Create the User
- Method: POST
- paste the URL in the postman
 http://localhost:3000/users
Output
- Get All the Users
- Method: GET
- paste the URL in the postman
http://localhost:300/users
Output:
