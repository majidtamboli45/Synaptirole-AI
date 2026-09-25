# Spring MVC Integration with MySQL

> Source: https://www.geeksforgeeks.org/advance-java/spring-mvc-integration-with-mysql/

Spring MVC Integration with MySQL allows a web application to interact with a MySQL database for storing and retrieving data. It combines Spring MVC for handling web requests with database connectivity using JDBC or ORM frameworks like Hibernate. This integration enables efficient data management and supports building dynamic, data-driven applications.
- Follows the MVC architecture to separate business logic, presentation, and data access layers.
- Supports CRUD (Create, Read, Update, Delete) operations for managing application data.
- Provides a scalable foundation for developing enterprise-level web applications with persistent data storage.
Architecture of Spring MVC
Spring MVC follows the Model-View-Controller (MVC) architecture, where the Controller handles user requests, interacts with the Model to process data and business logic, and returns a View to present the response to the user.
Step-by-Step Flow For Spring MVC Integration with MySQL
Follow these steps to connect your Spring MVC application with Mysql database.
Create Database Setup
We will create a database named test and a table studentsdetails to store student information.
1. Create the Database
CREATE DATABASE test;
USE test;
2. Create the Table
CREATE TABLE studentsdetails (
       id INT AUTO_INCREMENT PRIMARY KEY,
      name VARCHAR(25),
     caste VARCHAR(25),
    neet_marks INT,
   gender VARCHAR(10)
);
3. Insert Sample Records
INSERT INTO studentsdetails(name, caste, neet_marks, gender) VALUES
     ('Geek1', 'OBC', 600, 'Female'),
    ('Geek2', 'General', 700, 'Female'),
   ('Geek3', 'General', 600, 'Male'),
  ('Geek4', 'OBC', 670, 'Male'),
 ('Geek5', 'SC', 600, 'Female'),
('Geek6', 'SC', 500, 'Male');
4. Verify Records
SELECT * FROM studentsdetails;
The below image demonstrates a database table showing student data, including their names, caste, NEET marks and gender
Create Spring MVC Application Setup
Spring MVC Application Setup involves configuring the project structure, dependencies, DispatcherServlet, Spring configuration, and integrating components like Controller, Model, View, and database connectivity.
Step 1: Create Maven Project
- Create a Dynamic Web/Maven project
- Defines project structure and build configuration
Project Structure: The project structure for the Spring MVC application is as follows:
Step 2: Add Dependencies (pom.xml)
- Add spring-webmvc for MVC functionality
- Add spring-jdbc for database operations
- Add MySQL connector for DB connectivity
<dependencies>
    <!-- Spring Web MVC -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-webmvc</artifactId>
        <version>5.3.18</version>
    </dependency>
    <!-- Spring JDBC -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-jdbc</artifactId>
        <version>5.3.18</version>
    </dependency>
    <!-- MySQL Connector -->
    <dependency>
        <groupId>mysql</groupId>
        <artifactId>mysql-connector-java</artifactId>
        <version>8.0.28</version>
    </dependency>
    <!-- JUnit for testing -->
    <dependency>
        <groupId>junit</groupId>
        <artifactId>junit</artifactId>
        <version>4.13.2</version>
        <scope>test</scope>
    </dependency>
</dependencies>
Step 3: Configure Spring (spring-servlet.xml)
- Enable <context:component-scan> to detect controllers
- Use <mvc:annotation-driven> for annotations
- Central place for configuring beans
<context:component-scan base-package="com.students.controllers"/>
<mvc:annotation-driven/>
Step 4: Configure Database (DataSource + JdbcTemplate)
- Define DataSource with DB URL, username, password
- Configure JdbcTemplate for executing SQL queries
- Simplifies database interaction
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xsi:schemaLocation="
           http://www.springframework.org/schema/beans 
           http://www.springframework.org/schema/beans/spring-beans.xsd
           http://www.springframework.org/schema/context 
           http://www.springframework.org/schema/context/spring-context.xsd
           http://www.springframework.org/schema/mvc 
           http://www.springframework.org/schema/mvc/spring-mvc.xsd">
    <context:component-scan base-package="com.students.controllers"/>
    <mvc:annotation-driven/>
    <!-- Database Configuration -->
    <bean id="dataSource" class="org.springframework.jdbc.datasource.DriverManagerDataSource">
        <property name="driverClassName" value="com.mysql.cj.jdbc.Driver"/>
        <property name="url" value="jdbc:mysql://localhost:3306/test?useSSL=false&serverTimezone=UTC"/>
        <property name="username" value="root"/>
        <property name="password" value="yourpassword"/>
    </bean>
    <bean id="jdbcTemplate" class="org.springframework.jdbc.core.JdbcTemplate">
        <property name="dataSource" ref="dataSource"/>
    </bean>
    <!-- DAO Configuration -->
    <bean id="studentDao" class="com.students.dao.StudentDao">
        <property name="template" ref="jdbcTemplate"/>
    </bean>
    <!-- View Resolver -->
    <bean class="org.springframework.web.servlet.view.InternalResourceViewResolver">
        <property name="prefix" value="/WEB-INF/views/"/>
        <property name="suffix" value=".jsp"/>
    </bean>
</beans>
Step 5: Create Model Class (Student.java)
- Represents database table (studentsdetails )
- Contains fields + getters/setters
- Used to transfer data between layers
package com.students.beans;
public class Student {
    private int id;
    private String name;
    private String caste;
    private int neetMarks;
    private String gender;
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    public String getName() { return name; }
    public void setName(String name) { this.name = name; }
    public String getCaste() { return caste; }
    public void setCaste(String caste) { this.caste = caste; }
    public int getNeetMarks() { return neetMarks; }
    public void setNeetMarks(int neetMarks) { this.neetMarks = neetMarks; }
    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }
}
Step 6: Create DAO Class (StudentDao.java)
- Handles database operations using JdbcTemplate
- Executes queries like getStudentById, getStudentByName
- Returns data as objects
package com.students.dao;
import com.students.beans.Student;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.dao.EmptyResultDataAccessException;
import java.util.List;
public class StudentDao {
    private JdbcTemplate template;
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    public Student getStudentById(int id) {
        try {
            return template.queryForObject(
                "SELECT * FROM studentsdetails WHERE id=?",
                new Object[]{id},
                new BeanPropertyRowMapper<>(Student.class)
            );
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
    public Student getStudentByName(String name) {
        try {
            return template.queryForObject(
                "SELECT * FROM studentsdetails WHERE name=?",
                new Object[]{name},
                new BeanPropertyRowMapper<>(Student.class)
            );
        } catch (EmptyResultDataAccessException e) {
            return null;
        }
    }
    public List<Student> getStudentsByCaste(String caste) {
        return template.query(
            "SELECT * FROM studentsdetails WHERE caste=?",
            new Object[]{caste},
            new BeanPropertyRowMapper<>(Student.class)
        );
    }
    public List<Student> getStudentsByNeetMarks(int neetMarks) {
        return template.query(
            "SELECT * FROM studentsdetails WHERE neet_marks=?",
            new Object[]{neetMarks},
            new BeanPropertyRowMapper<>(Student.class)
        );
    }
}
Step 7: Create Controller (StudentController.java)
- Handles HTTP requests using @Controller
- Uses DAO to fetch data
- Sends data to view using Model/ModelAndView
package com.students.controllers;
import com.students.beans.Student;
import com.students.dao.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
@Controller
public class StudentController {
    private final StudentDao dao;
    @Autowired
    public StudentController(StudentDao dao) {
        this.dao = dao;
    }
    @RequestMapping("/studentsearchform")
    public String showSearchForm(Model model) {
        model.addAttribute("command", new Student());
        return "studentsearchform";
    }
    @RequestMapping(value = "/checkByNeetMarks", method = RequestMethod.POST)
    public ModelAndView checkByNeetMarks(@ModelAttribute("student") Student student) {
        ModelAndView mav = new ModelAndView("welcome");
        Student studentData = dao.getStudentByName(student.getName());
        if (studentData != null) {
            boolean isEligible = false;
            String caste = studentData.getCaste();
            int neetMarks = studentData.getNeetMarks();
            if (caste.equalsIgnoreCase("General") && neetMarks >= 600) isEligible = true;
            else if (caste.equalsIgnoreCase("OBC") && neetMarks >= 500) isEligible = true;
            else if (caste.equalsIgnoreCase("SC") && neetMarks >= 400) isEligible = true;
            mav.addObject("name", studentData.getName());
            mav.addObject("caste", caste);
            mav.addObject("neetMarks", neetMarks);
            mav.addObject("eligibility", isEligible ? "Eligible for Medical Seat" : "Not eligible");
        } else {
            mav.addObject("name", student.getName());
            mav.addObject("eligibility", "Student not found");
        }
        return mav;
    }
}
Step 8: Create JSP Views(studentsearchform.jsp)
- studentsearchform.jsp: Input form
- Acts as View layer in MVC
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<body>
    <form action="checkByNeetMarks" method="post">
        Name: <input type="text" name="name" /><br/>
        <input type="submit" value="Check Eligibility" />
    </form>
</body>
</html>
Step 9: Create JSP Views(welcome.jsp)
This file is used to display the result.
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<body>
<h2>Student: ${name}</h2>
<p>Caste: ${caste}</p>
<p>NEET Marks: ${neetMarks}</p>
<p>Status: ${eligibility}</p>
</body>
</html>
Step 10: Run the Application
- Right Click Project.
- Select Run As - Run on Server.
- Choose Apache Tomcat Server.
- Click Finish.
Open the browser and access:
http://localhost:8080/SpringMVCMedicalSeatAvailabilityBasedOnNEETMarks/
After clicking the link, we will get output as below:
Check for the url change. All should be aligned with controller
Usecase:
Enter student name to check eligibility.
According to the logic written, we are getting results, here:
- Geek1 is the name given for the search. It will be checked against the "studentsdetails" table
- Circled one indicates the name of the request mapping.
Advantages of This Integration
- Provides a data-driven web application architecture.
- Uses Spring MVC for clean separation of concerns.
- Leverages JdbcTemplate for simplified database operations.
- Flexible for adding new features like CRUD or advanced queries.
