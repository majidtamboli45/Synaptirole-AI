# Flask Tutorial

> Source: https://www.geeksforgeeks.org/python/flask-tutorial/

Flask is a lightweight web framework used to build web applications and APIs. It follows a minimal design and provides core features like routing, request handling and template rendering while allowing developers to add extensions as needed. It is widely used for building small to medium web applications due to its simplicity and flexibility.
- Microframework: Lightweight framework with minimal dependencies, giving developers full control over application structure.
- Werkzeug & Jinja2: Uses Werkzeug for request/response handling and Jinja2 for dynamic HTML templating.
- Routing: Maps URLs to Python functions using simple decorators.
- Flexible Database Choice: No built-in ORM, allowing use of tools like SQLAlchemy or raw SQL.
- API Development: Well-suited for building RESTful APIs and backend services.
- Development Server: Includes a built-in server for local testing during development.
Introduction
This section introduces Flask, compares it with Django and shows how to install it on Windows to start building web applications.
Quick Start
Covers creating and running a basic Flask app, understanding routes, HTTP methods, variables, redirects and basic configurations.
Templates and Static Files
Explains creating dynamic web pages using templates and managing static files like CSS, JavaScript and images.
Form Handling
This section covers capturing user input, form validation, file uploads and security features like CSRF protection.
Configuration
It explains how to manage application settings such as debug mode, secret keys and environment-based configurations.
Database
Flask supports multiple databases for storing and managing data, including SQLite, PostgreSQL, MySQL, MongoDB and also allows using SQLAlchemy or executing raw SQL queries.
Middlewares
This section covers how middleware processes requests and responses for tasks like logging, authentication and modifications.
Authentication
Authentication is used to verify user identity and manage secure access to applications. It includes login systems, password hashing, session management and permission control.
Rest APIs
Flask makes building REST APIs easy by handling requests like GET, POST, PUT and DELETE. With Flask-RESTful, one can send and receive JSON data, manage authentication and secure the API.
Advanced Topics
Introduces advanced concepts like asynchronous programming, WebSockets and modular app structure using blueprints.
Deployment & Error Handling
After development, Flask apps must be deployed and properly handle errors. This section covers deployment methods and techniques for managing application errors.
Projects
This section includes practical Flask projects that demonstrate real-world applications such as portfolio websites, APIs, data visualization and sentiment analysis tools.
Additional Resources
This section provides helpful articles and references to deepen understanding of Flask and related topics.
