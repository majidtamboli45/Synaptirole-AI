# How to Create Your First Model in Spring MVC?

> Source: https://www.geeksforgeeks.org/advance-java/how-to-create-your-first-model-in-spring-mvc/

Spring MVC is a powerful Web MVC framework for building web applications. It is designed around the Model-View-Controller (MVC) pattern, which separates the application into three main components Model, View and Controller.
- Model is used to transfer data from controller to view.
- Uses Model interface to store key-value pairs.
- Data can be accessed in JSP using Expression Language (EL)
Prerequisites
- Eclipse (EE version)
- Spring JAR Files
- Apache Tomcat
Step-by-Step Implementation
Followings are the steps to implement the first model in Spring MVC:
Step 1: Create Dynamic Web Project
- Open STS/Eclipse
- Create a Dynamic Web Project
- Ensure proper project structure is generated
Step 2: Add Spring JAR Files
- Download required Spring JARs
- Go to: src > main > webapp > WEB-INF > lib
- Paste all JAR files in this folder
Step 3: Configure Apache Tomcat Server
- Add Tomcat server in IDE
- Configure it with your project
- Ensure server starts successfully
Step 4: Configure Dispatcher Servlet (web.xml)
- Go to: src > main > webapp > WEB-INF > web.xml file.
- Add servlet configuration
File: web.xml:
<?xml version="1.0" encoding="UTF-8"?>
<web-app xmlns:xsi="https://www.geeksforgeeks.org/2001/XMLSchema-instance/"
         xmlns="http://www.oracle.com/webfolder/technetwork/jsc/xml/ns/javaee/index.html"
         xsi:schemaLocation="http://www.oracle.com/webfolder/technetwork/jsc/xml/ns/javaee/index.html 
                             http://www.oracle.com/webfolder/technetwork/jsc/xml/ns/javaee/index.html/web-app_4_0.xsd"
    id="WebApp_ID" version="4.0">
    <display-name>springmvc-view-resolver</display-name>
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.jsp</welcome-file>
        <welcome-file>index.htm</welcome-file>
        <welcome-file>default.html</welcome-file>
        <welcome-file>default.jsp</welcome-file>
        <welcome-file>default.htm</welcome-file>
    </welcome-file-list>
    <absolute-ordering />
    <servlet>
        <!-- Provide a Servlet Name -->
        <servlet-name>viewresolver-dispatcher</servlet-name>
        <!-- Provide a fully qualified path to the DispatcherServlet class -->
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <servlet-mapping>
        <!-- Provide a Servlet Name that you want to map -->
        <servlet-name>viewresolver-dispatcher</servlet-name>
        <!-- Provide a url pattern -->
        <url-pattern>/demo.com/*</url-pattern>
    </servlet-mapping>
</web-app>
Note: One should be well aware of what is Dispatcher Servlet in Spring as it is a crucial concept to understand prior adhering ahead.
Step 5: Create Spring Configuration File
- Go to: src > main > webapp > WEB-INF and create an XML file
- Create file: viewresolver-dispatcher-servlet.xml
And the name of the file must be in this format:
YourServletName-servlet.xml
For example: For this project, the name of the file must be
viewresolver-dispatcher-servlet.xml
So either you can create a Spring Configuration File or you can just create a simple XML file and add the below lines of code inside that file.
File: viewresolver-dispatcher-servlet.xml:
<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans/"
       xmlns:xsi="https://www.geeksforgeeks.org/2001/XMLSchema-instance/"
       xmlns:context="http://www.springframework.org/schema/context/"
       xsi:schemaLocation="http://www.springframework.org/schema/beans/
        https://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context/
        https://www.springframework.org/schema/context/spring-context.xsd">
  
  <!-- This Line is used for scanning all the packages that have controller classes -->
  <context:component-scan base-package="com.demo.controllers"></context:component-scan>
</beans>
Step 6: Create Controller Class
- Go to: src/main/java
- Create package (e.g., com.demo.controllers)
- Create class DemoController
- Annotate with @Controller
@Controller
public class DemoController {}
Note: Spring will automatically initialize the class having a @Controller annotation and register that class with the spring container.
- Use @RequestMapping("/hello")
- Return view name "demo"
// Annotation 
@RequestMapping("/hello")
// Method 
public String helloWorld() 
{
return "";
}
Now in the return statement, we have to return some views (web pages), so whenever the endpoint '/hello' is invoked we can see our result on the web page. So let's create our first View.
Step 7: Create View (JSP Page)
- Go to: WEB-INF
- Create folder: views
- Create file: demo.jsp
File: demo.jsp:
<!DOCTYPE html>
<html>
<body>
    <h1 align="center">GeeksforGeeks Welcome Page!</h1>
</body>
</html>
Now go to the DemoController class and inside the helloWorld() method we have to return a value something like this.
return "demo";
File: DemoController.java:
// Java Program to Illustrate DemoController Class
package com.demo.controllers;
// Importing required classes
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// Class
@Controller
public class DemoController {
    // Method
    @RequestMapping("/hello") public String helloWorld()
    {
        // Just return the page name
        // No Path, no extension
        return "demo";
    }
}
Step 8: Create Model and Send Data
Modify controller method:
- Add Model parameter
- Add data: model.addAttribute("myNameValue", myName)
- Create data: String myName = "Amiya Rout"
File: DemoController.java:
package com.demo.controllers;
// Importing required classes 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
// Class 
@Controller
public class DemoController {
    // Method 
    @RequestMapping("/hello")
    public String helloWorld(Model model) {
      
        // Sending data to view (jsp page)
        String myName = "Amiya Rout";
        model.addAttribute("myNameValue", myName);
        
        // Just return the page name
        // No Path, no extension
        return "demo";
    }
}
Step 9: Display Data in JSP
- Use Expression Language (EL)
- And to display the data inside our jsp page we have to modify the demo.jsp page.
- And we can do it by the following line of code
${myNameValue}
Now the complete code for Demo.jsp is given below and you are done.
<!DOCTYPE html>
<html>
<body>
    <h1 align="center">GeeksforGeeks Welcome Page!</h1>
    <hr>
    My name is: ${myNameValue}
</body>
</html>
Step 10: Run Application
- Right-click project ->Run on Server
After that use the following URL to run your controller
http://localhost:8080/springmvc-view-resolver/demo.com/hello
Output:
