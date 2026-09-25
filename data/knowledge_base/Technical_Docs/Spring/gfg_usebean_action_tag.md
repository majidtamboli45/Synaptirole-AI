# UseBean action tag

> Source: https://www.geeksforgeeks.org/advance-java/jsp-usebean-action-tag

The <jsp:useBean> action tag in JSP is used to create or access JavaBean objects within a JSP page. It helps separate business logic from presentation by using Java classes to store data. This makes JSP pages cleaner, modular, and easier to maintain.
- Used to create or access JavaBean objects in JSP
- Works with <jsp:setProperty> and <jsp:getProperty>
- Helps in separating logic (Java) from presentation (JSP)
Syntax
<jsp:useBean id="beanName" class="fully.qualified.ClassName" scope="scope" />
Attributes:
- id -> Name used to reference the bean
- class -> Fully qualified JavaBean class name
- scope -> Lifecycle of bean (page ,request ,session ,application )
Note: The <jsp:useBean> tag is used to create or retrieve an existing JavaBean instance in a JSP page. Once created, you can set or get its properties using the <jsp:setProperty> and <jsp:getProperty> tags.
Step-by-Step Implementation of <jsp:useBean> Tag
Step 1: Create the JavaBean Class
Create a simple Java class that represents a data model.
- The class EmployeeBean follows the JavaBean convention.
- It has private fields, public getter/setter methods, and a no-argument constructor (implicit here).
EmployeeBean.java:
package example;
public class EmployeeBean {
    private String name;
    private double salary;
    // Getter and Setter methods
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public double getSalary() {
        return salary;
    }
    public void setSalary(double salary) {
        this.salary = salary;
    }
}
Step 2: Create the JSP Page
Now create a JSP file to use and display the bean properties.
index.jsp
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="example.EmployeeBean" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>useBean Example</title>
</head>
<body>
<h2>useBean Action Tag Example</h2>
<!-- Create or access a JavaBean -->
<jsp:useBean id="employee" class="example.EmployeeBean" scope="session" />
<!-- Set properties of the bean -->
<jsp:setProperty name="employee" property="name" value="Mahesh Kadambala" />
<jsp:setProperty name="employee" property="salary" value="50000" />
<!-- Display bean properties -->
<p><b>Name:</b> <jsp:getProperty name="employee" property="name" /></p>
<p><b>Salary:</b> <jsp:getProperty name="employee" property="salary" /></p>
</body>
</html>
Step 3: Deploy and Run the Project
- Compile the EmployeeBean.java file and place it under your web application’s WEB-INF/classes/example directory.
- Place index.jsp in the web root folder (webapp or WebContent).
- Run the JSP application on a servlet container such as Apache Tomcat.
- Open your browser and visit:
http://localhost:8080/JSPUseBeanExample/index.jsp
Output:
Below we can see the output in browser.
Explanation:
- The <jsp:useBean> tag creates an instance of the EmployeeBean class with the ID employee.
- The scope is set to session, meaning the bean remains available throughout the user session.
- The <jsp:setProperty> tags assign values to the name and salary properties.
- The <jsp:getProperty> tags fetch and display those property values on the page.
Scopes in <jsp:useBean>
- page: Bean is available only within the current JSP page (default).
- request: Bean is accessible during a single HTTP request across multiple pages using forward or include.
- session: Bean persists across multiple requests within the same user session.
- application: Bean is shared across the entire application for all users.
