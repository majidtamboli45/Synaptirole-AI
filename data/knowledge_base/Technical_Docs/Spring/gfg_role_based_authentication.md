# Role Based Authentication

> Source: https://www.geeksforgeeks.org/advance-java/spring-security-role-based-authentication/

Spring Security Role-Based Authentication is a security mechanism that restricts access to application resources based on user roles such as ADMIN and USER. After successful authentication, Spring Security checks the user's assigned role and grants or denies access to specific endpoints. This helps protect sensitive resources and enforce authorization rules within the application.
- Assigns different access permissions to users based on their roles.
- Prevents unauthorized users from accessing protected APIs.
- Supports multiple roles using methods like hasRole() and hasAnyRole().
Step-by-step implementation of Role-Based Authentication
Step 1: Create the project
Generate a Spring Boot project with the following dependencies:
- Spring Web
- Spring Data JPA
- Spring Security
- Lombok
Step 2: Add Dependencies in pom.xml
Make sure the following dependencies are added:
<dependencies>
    <!-- Spring Boot Starters -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-web</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-data-jpa</artifactId>
    </dependency>
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-security</artifactId>
    </dependency>
    <!-- DevTools for hot reload -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-devtools</artifactId>
        <scope>runtime</scope>
        <optional>true</optional>
    </dependency>
    <!-- Lombok -->
    <dependency>
        <groupId>org.projectlombok</groupId>
        <artifactId>lombok</artifactId>
        <optional>true</optional>
    </dependency>
    <!-- Testing -->
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-test</artifactId>
        <scope>test</scope>
    </dependency>
</dependencies>
Step 3: Create Controller
Create a REST controller containing endpoints for different users. Defines the APIs that will be protected using role-based authorization.
- /api/getApi → Accessible only by ADMIN
- /api/getAll → Accessible by ADMIN and USER
- /public/api/ → Accessible by everyone
package org.technous.batchPrac3.controller;
import jdk.jfr.Description;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.technous.batchPrac3.dto.BookDTO;
import org.technous.batchPrac3.model.Book;
import org.technous.batchPrac3.service.BookService;
import java.util.List;
@RestController
@RequestMapping("/api")
public class BookController {
    @Autowired
    private BookService bookService;
    @Autowired
    private RestTemplate restTemplate;
    @GetMapping("/book/get")
    public String getAll(){
        return "get all employee";
    }
    @GetMapping("/getAll")
    public String getOne(){
        return "Get only one Employee ";
    }
    @GetMapping("/getApi")
    public String getAip(){
       return restTemplate.getForObject("https://dummyjson.com/products/1",String.class);
    }
    @PostMapping("/saveBook")
    public ResponseEntity<BookDTO> saveBook(@RequestBody BookDTO bookDTO){
        BookDTO mybookDTO = bookService.createBook(bookDTO);
        return new ResponseEntity<>(mybookDTO, HttpStatus.OK);
    }
}
Step 4: Configure Spring Security
Create a configuration class and define security rules using SecurityFilterChain.
- Disable CSRF (for testing/demo APIs).
- Protect endpoints using hasRole() and hasAnyRole().
package org.technous.batchPrac3.config;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.web.client.RestTemplate;
@Configuration
public class MyConfig {
    
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .cors(cors -> cors.disable())
                .authorizeHttpRequests(req -> req
                        
                        .requestMatchers("/api/getApi").hasRole("ADMIN").anyRequest().authenticated()
                       ).httpBasic(Customizer.withDefaults());
        return http.build();
    }
    @Bean
    public UserDetailsService userDetailsService() {
        UserDetails user = User.builder()
                .username("user")
                .password(passwordEncoder().encode("user123"))
                .roles("USER")
                .build();
        UserDetails admin = User.builder()
                .username("admin")
                .password(passwordEncoder().encode("admin123"))
                .roles("ADMIN")
                .build();
        return new InMemoryUserDetailsManager(user,admin);
    }
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
Now, you need to make one Configuration class. here your configure multiple request mapper and also configure role in this there one method hasAnyRole("USER","ADMIN"). This way multiple role we defined. then your also define permission all to all general public without any role. this configuration like this.
 @Bean
 public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .cors(cors -> cors.disable())
                .authorizeHttpRequests(req -> req
                        .requestMatchers("/public/api/*").permitAll()
                        .requestMatchers("/api/getApi").hasRole("ADMIN").anyRequest().authenticated()
                        .requestMatchers("api/getAll").hasAnyRole("ADMIN","USER").anyRequest().authenticated()
                       ).httpBasic(Customizer.withDefaults());
        return http.build();
    }
Step 5: Run and testing the API
If you don't have a role or credential you do not access any resources.
Now, the admin and user can access this API.
