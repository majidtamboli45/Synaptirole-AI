# Spring MVC with JSP View

> Source: https://www.geeksforgeeks.org/advance-java/spring-mvc-with-jsp-view

Spring MVC with JSP View is a web framework based on the Model–View–Controller (MVC) architecture, where Spring handles request routing and business logic while JSP is used to generate dynamic views.
- Uses Spring MVC controllers to handle requests and manage business logic
- JSP acts as the view layer to display dynamic data
- Supports annotation-based configuration and clear separation of concerns
Steps to implement Spring MVC with JSP
Below are the basic steps to implement Spring MVC with JSP, starting from project setup to rendering JSP views using controllers.
Step 1: Create the Project
- Eclipse IDE: File -> New -> Dynamic Web Project (check "Generate web.xml")
- IntelliJ: New -> Project > Maven -> Web App archetype
Step 2: Add Maven Dependencies
Add below dependencies in pom.xml file:
<dependency>
    <groupId>org.springframework</groupId>
    <artifactId>spring-webmvc</artifactId>
    <version>4.3.7</version>
</dependency>
<dependency>
    <groupId>jstl</groupId>
    <artifactId>jstl</artifactId>
    <version>1.2</version>
</dependency>
<dependency>
    <groupId>javax.servlet</groupId>
    <artifactId>javax.servlet-api</artifactId>
    <version>3.0.1</version>
    <scope>provided</scope>
</dependency>
Step 3: Configure web.xml
This file tells the servlet container how to load the Spring DispatcherServlet and which file has Spring configurations.
web.xml
<web-app xmlns="http://java.sun.com/xml/ns/javaee"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://java.sun.com/xml/ns/javaee 
                             http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
         version="3.0">
    <display-name>SampleMVC</display-name>
    <!-- Load Spring Context -->
    <listener>
        <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
    </listener>
    <!-- Location of Spring application context -->
    <context-param>
        <param-name>contextConfigLocation</param-name>
        <param-value>/WEB-INF/applicationContext.xml</param-value>
    </context-param>
    <!-- Spring DispatcherServlet -->
    <servlet>
        <servlet-name>mvc-dispatcher</servlet-name>
        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
        <load-on-startup>1</load-on-startup>
    </servlet>
    <!-- Servlet Mapping -->
    <servlet-mapping>
        <servlet-name>mvc-dispatcher</servlet-name>
        <url-pattern>/</url-pattern>
    </servlet-mapping>
    <!-- Welcome file -->
    <welcome-file-list>
        <welcome-file>index.html</welcome-file>
        <welcome-file>index.jsp</welcome-file> <!-- optional -->
    </welcome-file-list>
</web-app>
Step 4: Create Spring Configuration file
This file initializes Spring MVC, scans your Java classes and sets up view resolution (JSP mapping) WebApplicationContext. And this contains the MVC-specific configurations including view-resolvers, datasource, messagesource, multipart-resolver (file-upload), etc.
mvc-dispatcher-servlet.xml
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="...">
  <!-- Scan all Java classes in this package for Spring annotations -->
  <context:component-scan base-package="com.springsamples" />
  <!-- Enable Spring MVC Annotations (@Controller, @GetMapping, etc.) -->
  <mvc:annotation-driven />
  <!-- Allow static content (CSS, JS, images) -->
  <mvc:default-servlet-handler />
  <!-- Configure JSP view resolver -->
  <bean id="viewProvider" class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    <property name="prefix" value="/" />
    <property name="suffix" value=".jsp" />
  </bean>
</beans>
Step 5: Create the Controller
Create a controller class to handle requests, process data, and add it to the model.
package com.springsamples.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class HomeController {
    @GetMapping("/") public ModelAndView firstView()
    {
        // "greet" will map to greet.jsp
        ModelAndView mav = new ModelAndView("greet");
        mav.addObject(
            "greeting",
            "GeeksForGeeks Welcomes you to Spring!");
        return mav;
    }
}
Step 6: Create the JSP View
Place this file inside: src/main/webapp/greet.jsp
greet.jsp
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "- Transitional
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; 
 charset=ISO-8859-1">
<title>Start Spring MVC</title>
</head>
<body>
<h1>Start here</h1>
${greeting}
</body>
</html>
Step 7: Run the Application
- Deploy the project on Tomcat
- Open browser:
http://localhost:8080/SpringMVCApp/
Output:
