# How to Configure Dispatcher Servlet in web.xml File

> Source: https://www.geeksforgeeks.org/advance-java/how-to-configure-dispatcher-servlet-in-web-xml-file

In Spring MVC, the DispatcherServlet acts as the Front Controller that handles all incoming requests and forwards them to the appropriate controllers. It is configured in the web.xml file to enable request processing and initialize the Spring MVC framework in the application.
- Configure DispatcherServlet in the web.xml deployment descriptor.
- Define URL mappings for handling client requests.
- Initialize the Spring MVC application context for the project.
Front Controller
A Front Controller is a design pattern that provides a single entry point for handling all client requests in a web application. In Spring MVC, the DispatcherServlet acts as the Front Controller and manages request processing and response handling.
- Receives all incoming HTTP requests from clients.
- Routes requests to the appropriate controller methods.
- Handles centralized tasks like authentication, logging, and validation.
Workflow
- The client sends an HTTP request to the server.
- The DispatcherServlet receives the request.
- It identifies the appropriate controller for processing the request.
- The controller executes the business logic and returns a response.
- The DispatcherServlet sends the final response back to the client.
Example: If a client sends a request to /student/save, the DispatcherServlet forwards the request to the controller method responsible for handling the /save operation.
How to Create a Front Controller in Spring MVC?
The below diagram illustrates how the Front Controller (DispatcherServlet) receives client requests and forwards them to the appropriate controller methods for processing in a Spring MVC application.
web.xml
The web.xml file is the deployment descriptor used in Java web applications to configure servlets, filters, listeners, and URL mappings. It helps define how the web application behaves on the server.
- Configures servlets such as DispatcherServlet in Spring MVC.
- Defines URL patterns for handling client requests.
- Manages application initialization and deployment settings.
It resides inside:
src/main/webapp/WEB-INF/web.xml
Steps to configure Dispatcher Servlet in web.xml file.
Follow the below steps to configure Dispatcher Servlet in web.xml File.
Step 1: Create a Dynamic Web Project
Create a Spring MVC Dynamic Web Project in Eclipse IDE.
Step 2: Add Spring MVC Dependencies
Add the required Spring MVC JAR files or Maven dependencies to the project.
Step 3: Open the web.xml File
Navigate to the WEB-INF folder and open the web.xml deployment descriptor file.
Step 4: Configure DispatcherServlet in web.xml
Add the DispatcherServlet configuration inside the web.xml file.
Step 5: Create Servlet Configuration
Makes the configuration in web.xml file inside the servlet mapping tag.
<servlet-mapping>
<!-- Match the servlet name -->
<servlet-name>frontcontroller-dispatcher</servlet-name>
<!-- Map all URLs starting with /gfg.com/ -->
<url-pattern>/gfg.com/*</url-pattern>
</servlet-mapping>
Complete web.xml file:
Below is the complete web.xml file containing the DispatcherServlet configuration.
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xmlns="http://xmlns.jcp.org/xml/ns/javaee"
         xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee 
         http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd"
         version="4.0">
    <display-name>myfirst-mvc-project</display-name>
    <!-- Default welcome files -->
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>default.html</welcome-file>
        <welcome-file>default.jsp</welcome-file>
        <welcome-file>default.htm</welcome-file>
    </welcome-file-list>
    <!-- DispatcherServlet Configuration -->
    <servlet>
        <servlet-name>frontcontroller-dispatcher</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <servlet-name>frontcontroller-dispatcher</servlet-name>
        <url-pattern>/gfg.com/*</url-pattern>
    </servlet-mapping>
</web-app>
Step 6: Create Spring Configuration File
Each DispatcherServlet requires an associated Spring configuration file. The file name should follow this convention:
<servlet-name>-servlet.xml
Example: frontcontroller-dispatcher-servlet.xml
Example Configuration:
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xsi:schemaLocation="
           http://www.springframework.org/schema/beans
           https://www.springframework.org/schema/beans/spring-beans.xsd
           http://www.springframework.org/schema/context
           https://www.springframework.org/schema/context/spring-context.xsd">
    <!-- Component scanning or bean definitions can be added here -->
</beans>
Step 7: Testing the Application
- Deploy the application on a server (like Apache Tomcat).
- Check the server console logs.
If the DispatcherServlet initializes successfully without exceptions, the setup is correct.
Example Console Output:
Example: This confirms that the DispatcherServlet has been correctly configured and initialized.
