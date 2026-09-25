# JSP Standard Tag Library

> Source: https://www.geeksforgeeks.org/advance-java/jstl-jsp-standard-tag-library

JSTL (JavaServer Pages Standard Tag Library) is a collection of custom tags that encapsulate core functionalities commonly used in JSP pages. It helps reduce Java code embedded in JSPs (known as scriptlets) and promotes a cleaner MVC-based web application design.
JSTL is part of the Jakarta EE (formerly Java EE) specification and is supported in all modern servlet containers.
Why Use JSTL?
- Eliminates the need for scriptlets (<% %>) in JSP pages
- Improves readability and maintainability of JSP files
- Provides built-in tags for iteration, conditional checks, and data formatting
- Supports internationalization (i18n) and localization
- Enables XML data processing and database interactions
JSTL Tag Libraries
| Library | Prefix | Description | 
|---|---|---|
| Core Tags | c | General-purpose tags for variables, flow control, loops, and URL handling | 
| Formatting Tags | fmt | For number, date, and message formatting with localization support | 
| SQL Tags | sql | For executing database queries and updates (for demo/testing only) | 
| XML Tags | x | For parsing and transforming XML documents | 
| Function Tags | fn | Contains utility functions for string and collection operations | 
Adding JSTL to a Project
To use JSTL in a JSP-based web application, you need to add the JSTL library to your project and declare the required tag libraries in JSP files.
Step 1: Add JSTL Dependency
For Maven projects, add the following dependency in pom.xml:
<dependency>
    <groupId>jakarta.servlet.jsp.jstl</groupId>
    <artifactId>jakarta.servlet.jsp.jstl-api</artifactId>
    <version>3.0.1</version>
</dependency>
<dependency>
    <groupId>org.glassfish.web</groupId>
    <artifactId>jakarta.servlet.jsp.jstl</artifactId>
    <version>3.0.1</version>
</dependency>
Explanation:
- jakarta.servlet.jsp.jstl-api provides the JSTL interfaces and tag definitions.
- jakarta.servlet.jsp.jstl is the reference implementation required at runtime.
- These versions are compatible with Jakarta EE 9+ and modern servlet containers such as Tomcat 10+.
Note: If you are using an older servlet container (Tomcat 9 or earlier), use the javax.servlet.jsp.jstl dependency instead.
Step 2: Declare JSTL Tag Libraries in JSP
After adding the dependency, include the required JSTL tag libraries at the top of your JSP file.
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
Explanation:
- c: Core tags (conditions, loops, variable handling)
- fmt: Formatting and internationalization
- fn: Utility functions for strings and collections
These URIs are standard and fixed identifiers used by JSP to locate JSTL tags. They do not represent actual URLs.
Step 3: Verify JSTL Configuration (Optional Check)
Ensure that:
- Your project is deployed on a JSP-supporting servlet container
- JSTL JARs are available in the application’s classpath
- JSP pages are compiled without tag-related errors
