# Action Tags

> Source: https://www.geeksforgeeks.org/advance-java/jsp-action-tags

JSP action tags are special elements that give instructions to the JSP container for handling various runtime tasks. They execute on the server side and help developers include external resources, forward requests, and interact with JavaBeans or plugins.
They are always enclosed within <jsp: ... > and can be placed anywhere in the JSP page where dynamic behavior is required.
Common JSP Action Tags
1. <jsp:include> Tag
Includes content from another resource (JSP, HTML, or servlet) into the current page at request time.
Syntax:
<jsp:include page="filename.jsp" />
Usage: Helps in modularizing JSP pages by reusing header, footer, or navigation components.
2. <jsp:forward> Tag
Forwards the current request to another resource such as a JSP, HTML, or servlet. The client is unaware of the forwarding.
Syntax:
<jsp:forward page="destination.jsp" />
Note: Once the forward tag is executed, the rest of the current page is skipped.
3. <jsp:useBean> Tag
Instantiates or locates an existing JavaBean to use within a JSP page.
Syntax:
<jsp:useBean id="beanId" class="packageName.ClassName" />
Example:
<jsp:useBean id="user" class="com.example.User" />
Note: If the bean does not exist in the specified scope, a new instance is automatically created.
4. <jsp:setProperty> Tag
Sets a property value of a JavaBean component.
Syntax:
<jsp:setProperty name="beanName" property="propertyName" value="propertyValue" />
Example:
<jsp:setProperty name="user" property="username" value="John" />
Note: It can also retrieve values directly from request parameters by using property="*".
5. <jsp:getProperty> Tag
Retrieves and displays the value of a JavaBean property.
Syntax:
<jsp:getProperty name="beanName" property="propertyName" />
Example:
<jsp:getProperty name="user" property="username" />
Usage: Commonly used to display data stored in JavaBeans directly on JSP pages.
6. <jsp:plugin> Tag
Generates HTML code for browser-specific plugins such as Java applets.
Syntax:
<jsp:plugin type="pluginType" code="pluginCode" />
Example:
<jsp:plugin type="applet" code="MyApplet.class" />
Note: This tag ensures that required browser plugins are loaded properly.
7. <jsp:attribute> Tag
Defines attribute values for custom JSP tags.
Syntax:
<jsp:attribute name="attributeName" value="attributeValue" />
Example:
<jsp:attribute name="color" value="blue" />
Usage: Used inside custom tag handlers to pass dynamic attributes.
8. <jsp:body> Tag
Defines the body content of a custom JSP tag.
Syntax:
<jsp:body> Body Content </jsp:body>
Example:
<jsp:body>
<p>This is the body content.</p>
</jsp:body>
Note: It is mainly used within custom tag implementations for flexible content rendering.
Example: JSP Project Demonstrating Action Tags
index.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Index Page</title>
    <style>
        body { font-family: Arial, sans-serif; }
        h1 { color: #333; }
        ul { list-style-type: none; padding: 0; }
        li { margin-bottom: 10px; }
        a { color: #007bff; text-decoration: none; }
        a:hover { text-decoration: underline; }
    </style>
</head>
<body>
    <h1>Welcome to JSP Action Tags Example</h1>
    <ul>
        <li><a href="include.jsp">Include Action</a></li>
        <li><a href="forward.jsp">Forward Action</a></li>
        <li><a href="setProperty.jsp">setProperty Action</a></li>
        <li><a href="getProperty.jsp">getProperty Action</a></li>
        <li><a href="useBean.jsp">useBean Action</a></li>
        <li><a href="plugin.jsp">plugin Action</a></li>
        <li><a href="attribute.jsp">attribute Action</a></li>
        <li><a href="body.jsp">body Action</a></li>
    </ul>
</body>
</html>
include.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Include Action</title>
</head>
<body>
    <jsp:include page="header.jsp" />
    <p>This is the content of include.jsp.</p>
</body>
</html>
forward.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:forward page="destination.jsp" />
destination.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Destination Page</title>
</head>
<body>
    <p>This is the forwarded page content.</p>
</body>
</html>
useBean.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="example.User" />
setProperty.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="example.User" />
<jsp:setProperty name="user" property="username" value="John" />
<!DOCTYPE html>
<html>
<head>
    <title>Set and Display Property</title>
</head>
<body>
    <h1>Set and Display Property</h1>
    <%
        String username = user.getUsername();
    %>
    <p>Username: <%= username %></p>
</body>
</html>
attribute.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<customTag:tagName>
    <jsp:attribute name="attributeName">attributeValue</jsp:attribute>
</customTag:tagName>
<!DOCTYPE html>
<html>
<head>
    <title>Display Attribute</title>
</head>
<body>
    <h1>Display Attribute</h1>
    <p>Attribute Value: <c:out value="${attributeName}" /></p>
</body>
</html>
body.jsp
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:body>
   <p>This is the body content.</p>
</jsp:body>
Outputs:
Index.jsp
Include Action:
Forward Action:
getProperty Action:
setProperty Action:
Attribute Action:
body Action:
