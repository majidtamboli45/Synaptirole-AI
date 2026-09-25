# UserDetailsService and UserDetails with Example

> Source: https://www.geeksforgeeks.org/advance-java/spring-security-userdetailsservice-and-userdetails-with-example/

Spring Security is a powerful framework used to secure Java web applications by handling authentication and authorization. It provides flexible mechanisms to define users, roles, and access rules efficiently.
- UserDetailsService is used to load user data during authentication
- UserDetails represents user information (username, password, roles)
- Spring Security now uses SecurityFilterChain (modern config) instead of deprecated classes
UserDetailsService and UserDetails
UserDetailsService: It is an interface in Spring Security used to load user-specific data during authentication.
- It is responsible for fetching user details from a data source such as a database, memory, or external service.
- It contains a single important method:
UserDetails loadUserByUsername(String username)
This method retrieves user information based on the provided username and returns a UserDetails object.
UserDetails: It is an interface that represents the authenticated user in Spring Security. It acts as a container for user-related information required during authentication and authorization. It typically includes:
- Username
- Password
- Roles / Authorities
- Account status (enabled, locked, expired, etc.)
Step-by-Step Implementation Project
A structured guide to build and configure the application step by step for implementing Spring Security with UserDetailsService and UserDetails.
Step 1: Create Project
- Create a Maven Web Application
- Configure Apache Tomcat Server
- Use Java 8+
Folder Structure
Step 2: Add Dependencies to pom.xml File
Add the following dependencies to your pom.xml file
<dependencies>
    <!-- Spring MVC -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-webmvc</artifactId>
        <version>5.3.30</version>
    </dependency>
    <!-- REQUIRED for ApplicationContext -->
    <dependency>
        <groupId>org.springframework</groupId>
        <artifactId>spring-context</artifactId>
        <version>5.3.30</version>
    </dependency>
    <!-- Servlet API -->
    <dependency>
        <groupId>javax.servlet</groupId>
        <artifactId>javax.servlet-api</artifactId>
        <version>4.0.1</version>
        <scope>provided</scope>
    </dependency>
    <!-- Spring Security -->
    <dependency>
        <groupId>org.springframework.security</groupId>
        <artifactId>spring-security-config</artifactId>
        <version>5.7.3</version>
    </dependency>
    <dependency>
        <groupId>org.springframework.security</groupId>
        <artifactId>spring-security-web</artifactId>
        <version>5.7.3</version>
    </dependency>
</dependencies>
Step 3: Configure Dispatcher Servlet
Create WebAppInitializer class.
public class WebAppInitializer extends 
AbstractAnnotationConfigDispatcherServletInitializer {
    protected Class<?>[] getRootConfigClasses() {
        return null;
    }
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { MyAppConfig.class };
    }
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }
}
Step 4: Spring MVC Configuration
File: MyAppConfig.java
@Configuration
@EnableWebMvc
@ComponentScan("com")
public class MyAppConfig {
    @Bean
    public InternalResourceViewResolver viewResolver() {
        InternalResourceViewResolver resolver = new InternalResourceViewResolver();
        resolver.setPrefix("/WEB-INF/views/");
        resolver.setSuffix(".jsp");
        return resolver;
    }
    // Password encoder (secure)
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
Step 5: Create Controller
Go to the src > main > java and create a class GfgController. Below is the code for the GfgController.java file.
File: GfgController.java
@Controller
public class GfgController {
    @GetMapping("/")
    public String home(Principal principal, Authentication auth, Model model) {
        String username = principal.getName();
        Collection<? extends GrantedAuthority> roles = auth.getAuthorities();
        model.addAttribute("username", username);
        model.addAttribute("roles", roles);
        return "hello-gfg";
    }
}
Go to the src > main > java and create a class LoginController. Below is the code for the LoginController.java file.
LoginController.java
@Controller
public class LoginController {
    @GetMapping("/customLogin")
    public String login() {
        return "custom-login";
    }
}
Step 6: Create Views (JSP)
File: hello-gfg.jsp
<h1>Hi ${username} !!</h1>
<form action="logout" method="post">
    <input type="submit" value="Logout">
</form>
Also, create another view named custom-login.jsp file. Below is the code for the custom-login.jsp file. We have created a simple login form inside that file.
File: custom-login.jsp
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<title>GFG Login Page</title>
<body bgcolor="green">
  <h1>Login Page</h1>
<form action="process-login" method="post">
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br>
    <input type="submit" value="Login">
</form>
Step 7: Create Users
Go to the src > main > java > MyAppConfig and set your ViewResolver like this
File: MyAppConfig.java
@Configuration
@EnableWebSecurity
public class MySecurityAppConfig {
    // Create users using UserDetailsService
    @Bean
    public UserDetailsService userDetailsService(PasswordEncoder encoder) {
        // Method 1 - Using constructor
        List<GrantedAuthority> roles = new ArrayList<>();
        roles.add(new SimpleGrantedAuthority("ROLE_USER"));
        roles.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
        UserDetails user1 = new User("anshul", encoder.encode("123"), roles);
        // Method 2 - Using builder (recommended)
        UserDetails user2 = User.withUsername("rahul")
                .password(encoder.encode("123"))
                .roles("USER")
                .build();
        return new InMemoryUserDetailsManager(user1, user2);
    }
}
Step 8: Configure Security
File: MySecurityAppConfig.java
@Bean
public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
    http
        .authorizeHttpRequests(auth -> auth
            .anyRequest().authenticated()
        )
        .formLogin(form -> form
            .loginPage("/customLogin")
            .loginProcessingUrl("/process-login")
            .permitAll()
        )
        .logout(logout -> logout.permitAll());
    return http.build();
}
Step 9: Security Initializer
File: SecurityInitializer.java
public class SecurityInitializer 
extends AbstractSecurityWebApplicationInitializer {
}
Step 10: Run Application
URL:
http://localhost:8080/springsecurity/customLogin
Login:
- Username: anshul
- Password: 123
And now you can access your homepage and you can see we get the Current Logged in User Name and display it in a view.
