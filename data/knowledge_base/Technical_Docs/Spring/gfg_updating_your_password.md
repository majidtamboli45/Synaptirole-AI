# Updating Your Password

> Source: https://www.geeksforgeeks.org/advance-java/spring-security-updating-your-password/

Spring Security provides a secure way to update user passwords in a Spring Boot application. The password update feature allows authenticated users to change their existing password safely by verifying the current password before storing the new password in encrypted format. This improves application security and protects user accounts from unauthorized access.
- Ensures only authenticated users can change passwords.
- Verifies the current password before updating.
- Uses BCryptPasswordEncoder to encrypt passwords.
Working of Update Password in Spring Security
- User Authentication: The user first logs into the application using valid credentials.
- Open Update Password Page: The user navigates to the update password page from the home page.
- Enter Password Details: The user enters current password, new password, and confirm password.
- Validate Passwords: The application checks: Current password is correct and New password and confirm password match
- Encode New Password: Spring Security encrypts the new password using BCryptPasswordEncoder .
- Update Database: The encoded password is saved into the database.
- Display Response: The application displays either success or error messages based on the result.
Implementation to Update Password in Spring Security
Step 1: Create a Spring Boot Project
Create a new Spring Boot Project using IntelliJ Idea on creating the project, choose the below options for the Project.
- Project Name: security-update-password
- Language: Java
- Type: Maven
- Packaging: Jar
Refer the below image for better understanding of creating new Spring Boot Project.
Step 2: Add the Dependencies
Add the following dependencies into the project.
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="https://maven.apache.org/POM/4.0.0" xmlns:xsi="https://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="https://maven.apache.org/POM/4.0.0 https://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>3.3.1</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <groupId>com.gfg</groupId>
    <artifactId>security-update-password</artifactId>
    <version>0.0.1-SNAPSHOT</version>
    <name>security-update-password</name>
    <description>security-update-password</description>
    <url/>
    <licenses>
        <license/>
    </licenses>
    <developers>
        <developer/>
    </developers>
    <scm>
        <connection/>
        <developerConnection/>
        <tag/>
        <url/>
    </scm>
    <properties>
        <java.version>17</java.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-data-jpa</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-thymeleaf</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.thymeleaf.extras</groupId>
            <artifactId>thymeleaf-extras-springsecurity6</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-devtools</artifactId>
            <scope>runtime</scope>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>com.mysql</groupId>
            <artifactId>mysql-connector-j</artifactId>
            <scope>runtime</scope>
        </dependency>
        <dependency>
            <groupId>org.projectlombok</groupId>
            <artifactId>lombok</artifactId>
            <optional>true</optional>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.springframework.security</groupId>
            <artifactId>spring-security-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
                <configuration>
                    <excludes>
                        <exclude>
                            <groupId>org.projectlombok</groupId>
                            <artifactId>lombok</artifactId>
                        </exclude>
                    </excludes>
                </configuration>
            </plugin>
        </plugins>
    </build>
</project>
After project creation done, the folder structure will look like below image:
Step 3: Configure the Application Properties
Open the application.properties file and add the MySQL database configuration properties of the project.
spring.application.name=security-update-password
   # MySQL database configuration 
spring.datasource.url=jdbc:mysql://localhost:3306/securityUser
 spring.datasource.username=root 
spring.datasource.password= spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver 
 # Hibernate properties
 spring.jpa.hibernate.ddl-auto=update 
 spring.jpa.show-sql=true 
 spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.MySQL8Dialect  
 spring.main.allow-bean-definition-overriding=true
 spring.main.allow-circular-references=true
Step 4: Create User Entity Class
Create User.java inside the model package.
- Define fields like id, username, password, and enabled.
- Use JPA annotations such as @Entity and @Id.
package com.gfg.securityupdatepassword.model;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String password;
    private boolean enabled = true;
    // Getters and Setters
    public Long getId() {
        return id;
    }
    public void setId(Long id) {
        this.id = id;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public boolean isEnabled() {
        return enabled;
    }
    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }
}
Step 5: Create UserRepository Interface
Create UserRepository.java inside the repository package.
- Extend JpaRepository.
- Add method findByUsername() to fetch user details from the database.
package com.gfg.securityupdatepassword.repository;
import com.gfg.securityupdatepassword.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
}
Step 6: Create UserService Class
Create UserService.java inside the service package.
- Verify current password using PasswordEncoder.
- Encode new password before saving.
package com.gfg.securityupdatepassword.service;
import com.gfg.securityupdatepassword.model.User;
import com.gfg.securityupdatepassword.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import java.util.Optional;
@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
    /**
     * Updates the password for a given user if the current password is correct.
     * 
     * @param username The username of the user.
     * @param currentPassword The current password of the user.
     * @param newPassword The new password to be set.
     * @throws Exception if the current password is incorrect or the user is not found.
     */
    public void updatePassword(String username, String currentPassword, String newPassword) throws Exception {
        // Find the user by username or throw an exception if not found
        User user = userRepository.findByUsername(username)
                .orElseThrow(() -> new UsernameNotFoundException("User not found"));
        // Check if the current password matches
        if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
            throw new Exception("Current password is incorrect");
        }
        // Encode and set the new password, then save the user
        user.setPassword(passwordEncoder.encode(newPassword));
        userRepository.save(user);
    }
    /**
     * Checks if a user exists by username.
     * 
     * @param username The username to check.
     * @return true if the user exists, false otherwise.
     */
    public boolean existsByUsername(String username) {
        return userRepository.findByUsername(username).isPresent();
    }
    /**
     * Saves a user to the repository.
     * 
     * @param user The user to save.
     */
    public void saveUser(User user) {
        userRepository.save(user);
    }
}
This UserService class provides methods to handle user-related operations:
- updatePassword: Updates the user's password after verifying the current password.
- existsByUsername: Checks if a user with a given username exists in the repository.
- saveUser: Saves a user entity to the repository.
Step 7: Configure Spring Security
Create SecurityConfig.java inside the config package.
- Configure login and logout functionality.
- Permit access to register and update-password endpoints.
// Configuration class for Spring Security setup.
package com.gfg.securityupdatepassword.config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
/**
 * Configuration class for defining security rules and beans.
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {
    /**
     * Configures security filters for HTTP requests.
     *
     * @param http HttpSecurity object to configure security settings.
     * @return SecurityFilterChain configured with specified security rules.
     * @throws Exception If configuration encounters an error.
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeRequests(authorizeRequests ->
                        authorizeRequests
                                .requestMatchers("/register","update-password").permitAll()
                                //.requestMatchers("/update-password").authenticated()
                                .anyRequest().permitAll()
                )
                .formLogin(formLogin ->
                        formLogin
                                .loginPage("/login")
                                .defaultSuccessUrl("/home", true)
                                .permitAll()
                )
                .logout(logout -> logout.permitAll());
        return http.build();
    }
    /**
     * Provides an instance of BCryptPasswordEncoder for password encoding.
     *
     * @return BCryptPasswordEncoder instance.
     */
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
This SecurityConfig class configures Spring Security for a web application:
- It permits access to /register and /update-password endpoints without authentication.
- Defines a form-based login page at /login with a redirect to /home upon successful login.
- Uses BCryptPasswordEncoder for password hashing and authentication security.
Step 8: Create HomeController
Create HomeController.java inside the controller package.
- Map /home endpoint.
- Return home page after successful login.
package com.gfg.securityupdatepassword.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HomeController {
    @GetMapping("/home")
    public String home() {
        return "home";
    }
}
This HomeController class defines a Spring MVC controller:
- Annotates the class with @Controller for Spring to recognize it as a controller component.
- Provides a home() method mapped to /home that returns the string "home", indicating the view name to render.
- Directs requests to /home to display the corresponding view template, typically resolving to home.html.
Step 9: Create UserController
Create UserController.java inside the controller package.
- Handle user registration.
- Save encoded passwords into the database.
- Check if username already exists.
package com.gfg.securityupdatepassword.controller;
import com.gfg.securityupdatepassword.model.User;
import com.gfg.securityupdatepassword.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
@Controller
public class UserController {
    @Autowired
    private UserService userService; // Autowires UserService for handling user operations
    @Autowired
    private PasswordEncoder passwordEncoder; // Autowires PasswordEncoder for password encoding
    /**
     * Handles GET requests to "/register".
     * @return The view name "register" for user registration page.
     */
    @GetMapping("/register")
    public String register() {
        return "register";
    }
    /**
     * Handles POST requests to "/register".
     * Registers a new user with the provided username and password.
     * @param username The username of the new user.
     * @param password The password of the new user.
     * @param model The Spring MVC Model object for storing attributes.
     * @return The view name "register" if registration fails, "login" if successful.
     */
    @PostMapping("/register")
    public String registerUser(@RequestParam String username,
                               @RequestParam String password, Model model) {
        if (userService.existsByUsername(username)) {
            model.addAttribute("error", "Username already exists");
            return "register";
        }
        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        user.setEnabled(true); // Ensure the user is enabled by default
        userService.saveUser(user);
        model.addAttribute("message", "User registered successfully");
        return "login";
    }
}
- Dependency Injection: The controller injects UserService andPasswordEncoder beans to manage user registration and password encoding.
- Registration Handling: It defines methods for handling GET and POST requests to "/register", facilitating user registration with error handling for existing usernames.
- View Navigation: Renders "register" for user input and redirects to "login" upon successful registration, utilizing Spring MVC's Model for message handling.
Step 10: Create PasswordController
Create PasswordController.java inside the controller package.
- Display update password form.
- Validate current and new passwords.
package com.gfg.securityupdatepassword.controller;
import com.gfg.securityupdatepassword.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.Principal;
@Controller
public class PasswordController {
    @Autowired
    private UserService userService;
    // Handles GET requests to "/update-password" to render the password update form.
    @GetMapping("/update-password")
    public String updatePasswordForm() {
        return "update-password";
    }
    // Handles POST requests to "/update-password" for updating user password securely.
    @PostMapping("/update-password")
    public String updatePassword(@RequestParam String currentPassword,
                                 @RequestParam String newPassword,
                                 @RequestParam String confirmNewPassword,
                                 Principal principal, Model model) {
        try {
            // Validates and updates the password for the authenticated user.
            if (!newPassword.equals(confirmNewPassword)) {
                model.addAttribute("error", "New passwords do not match");
                return "update-password";
            }
            userService.updatePassword(principal.getName(), currentPassword, newPassword);
            model.addAttribute("message", "Password updated successfully");
        } catch (Exception e) {
            // Handles exceptions during password update process.
            model.addAttribute("error", e.getMessage());
        }
        return "update-password";
    }
}
Step 11: Main Class
Go to src > main > java > com.gfg.securityupdatepassword > SecurityUpdatePasswordApplication
package com.gfg.securityupdatepassword;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class SecurityUpdatePasswordApplication {
    public static void main(String[] args) {
        SpringApplication.run(SecurityUpdatePasswordApplication.class, args);
    }
}
Step 12: Create HTML Pages
Create Thymeleaf HTML pages:
- register.html
- login.html
- home.html
- update-password.html
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
    <title>Register</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .register-container {
            margin-top: 100px;
        }
        .register-card {
            border: 1px solid #28a745;
        }
        .register-card-header {
            background-color: #28a745;
            color: white;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container register-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card register-card">
                <div class="card-header register-card-header">
                    <h2 class="text-center">Register</h2>
                </div>
                <div class="card-body">
                    <form th:action="@{/register}" method="post">
                        <div class="form-group">
                            <label class="form-label">Username:</label>
                            <input type="text" name="username" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Password:</label>
                            <input type="password" name="password" class="form-control" />
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary btn-block">Register</button>
                        </div>
                        <div class="form-group text-center">
                            <a th:href="@{/login}" class="btn btn-link">Already have an account? Login here</a>
                        </div>
                        <div th:if="${error}" class="form-group text-center">
                            <p style="color: red;">[[${error}]]</p>
                        </div>
                        <div th:if="${message}" class="form-group text-center">
                            <p style="color: green;">[[${message}]]</p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
This HTML template is for a registration form using Thymeleaf with Bootstrap styling. It includes fields for username and password, styled with Bootstrap classes. Error and success messages are displayed conditionally. The form submits to "/register", and links are provided for login. The page uses Bootstrap for styling and includes necessary JavaScript dependencies for Bootstrap components.
Create the Login HTML Page
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .login-container {
            margin-top: 100px;
        }
        .login-card {
            border: 1px solid #28a745;
        }
        .login-card-header {
            background-color: #28a745;
            color: white;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container login-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card login-card">
                <div class="card-header login-card-header">
                    <h2 class="text-center">Login</h2>
                </div>
                <div class="card-body">
                    <form th:action="@{/login}" method="post">
                        <div class="form-group">
                            <label class="form-label">Username:</label>
                            <input type="text" name="username" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Password:</label>
                            <input type="password" name="password" class="form-control" />
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary btn-block">Login</button>
                        </div>
                        <div class="form-group text-center">
                            <a th:href="@{/register}" class="btn btn-link">Register</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
This HTML template is for a login form using Thymeleaf with Bootstrap styling. It includes fields for username and password, styled with Bootstrap classes. The form submits to "/login", and there's a link to register for new users. The page uses Bootstrap for styling and includes necessary JavaScript dependencies for Bootstrap components.
Create the Home HTML Page
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
    <title>Home</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .home-container {
            margin-top: 100px;
            text-align: center;
        }
        .home-card {
            border: 1px solid #28a745;
        }
        .home-card-header {
            background-color: #28a745;
            color: white;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
    </style>
</head>
<body>
<div class="container home-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card home-card">
                <div class="card-header home-card-header">
                    <h2>Welcome Home</h2>
                </div>
                <div class="card-body">
                    <a th:href="@{/update-password}" class="btn btn-primary btn-block">Update Password</a>
                    <a th:href="@{/logout}" class="btn btn-secondary btn-block">Logout</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
This HTML template creates a simple home page for authenticated users, styled with Bootstrap. It displays a greeting and provides buttons to update the password and logout. The buttons link to "/update-password" and "/logout" respectively. The page uses Bootstrap for styling and includes necessary JavaScript dependencies for Bootstrap components.
Create the update-password HTML Page
<!DOCTYPE html>
<html xmlns:th="https://www.thymeleaf.org/">
<head>
    <title>Update Password</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom CSS -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .update-password-container {
            margin-top: 100px;
        }
        .update-password-card {
            border: 1px solid #28a745;
        }
        .update-password-card-header {
            background-color: #28a745;
            color: white;
        }
        .btn-primary {
            background-color: #28a745;
            border-color: #28a745;
        }
        .btn-primary:hover {
            background-color: #218838;
            border-color: #218838;
        }
        .form-label {
            font-weight: bold;
        }
    </style>
</head>
<body>
<div class="container update-password-container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card update-password-card">
                <div class="card-header update-password-card-header">
                    <h2 class="text-center">Update Password</h2>
                </div>
                <div class="card-body">
                    <form th:action="@{/update-password}" method="post">
                        <div class="form-group">
                            <label class="form-label">Current Password:</label>
                            <input type="password" name="currentPassword" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">New Password:</label>
                            <input type="password" name="newPassword" class="form-control" />
                        </div>
                        <div class="form-group">
                            <label class="form-label">Confirm New Password:</label>
                            <input type="password" name="confirmNewPassword" class="form-control" />
                        </div>
                        <div class="form-group text-center">
                            <button type="submit" class="btn btn-primary btn-block">Update Password</button>
                        </div>
                        <div th:if="${error}" class="form-group text-center">
                            <p style="color: red;">[[${error}]]</p>
                        </div>
                        <div th:if="${message}" class="form-group text-center">
                            <p style="color: green;">[[${message}]]</p>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap JS and dependencies -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
This HTML template provides a form for updating the user's password, styled with Bootstrap. It includes fields for current password, new password, and confirm new password. The form submits to "/update-password" using Thymeleaf for server-side rendering. Error and success messages are displayed dynamically based on Thymeleaf model attributes. The page uses Bootstrap for styling and includes necessary JavaScript dependencies for Bootstrap components.
Step 13: Run the application
Now, run the application and it will start at port 8080 on Tomcat server.
Step 14: Testing the Application
1. Register page:
http://localhost:8080/register
Output:
2. Login page:
http://localhost:8080/login
Output:
3. Home Page:
http://localhost:8080/home
Output:
4. Update Password page:
http://localhost:8080/update-password
