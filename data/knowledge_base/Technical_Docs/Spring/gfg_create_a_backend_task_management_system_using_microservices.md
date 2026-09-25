# Create a Backend Task Management System using Microservices

> Source: https://www.geeksforgeeks.org/advance-java/create-a-backend-task-management-system-using-microservices/

Microservices is an architectural pattern where large applications are built as a collection of loosely coupled, independently deployable services. These services communicate using lightweight protocols (typically HTTP) via well-defined APIs.
For the Task Management System, we divide the backend into 5 microservices:
- Task User Service: Manages user authentication, authorization, profiles and roles (USER, ADMIN). Admins can create/approve tasks.
- Task Creation Service: Handles task creation, modification and assignment. Only Admins can create tasks.
- Task Submission Service: Manages user task submissions, validation and processing.
- Eureka Server: Enables service discovery and dynamic communication between microservices.
- API Gateway: Routes client requests to appropriate services.
TaskUserService Microservice
A Spring Boot microservice responsible for:
- User authentication & authorization (JWT-based).
- Managing user profiles.
- Supporting ROLE_USER and ROLE_ADMIN.
- Admin can create and approve tasks for users.
- Integrated with Eureka, Hystrix, Zipkin and MongoDB.
Project Setup
We can create the project using Spring STS IDE and on creating the project add the below dependencies into the project.
- Spring Web
- Spring Security
- Spring data for mongodb
- Spring Dev tools
- Lombok
- Spring Actuator
- Netflix Eureka client server
- Zipkin server
Once created the project includes the above dependencies the file structure below image:
Open the application.properties file and put the below code for server post assigning and data bases configuration, spring security and eureka client server configuration into the project.
server.port=8081
spring.data.mongodb.uri=mongodb://localhost:27017/userData
spring.application.name=USER-SERVICE
eureka.instance.prefer-ip-address=true
eureka.client.fetch-registry=true
eureka.client.register-with-eureka=true
eureka.client.service-url.defaultZone = http://localhost:8085/eureka
# Session Management Configuration
spring.security.filter.chain.content-negotiation.parameter-strategy=ignore
spring.security.filter.chain.any-request.authorized=permitAll
spring.security.filter.chain.request-matcher.path.pattern=/api/**
spring.security.filter.chain.request-matcher.path.authenticated=true
#Zipkin server configuration
spring.zipkin.base-url=http://localhost:9411
spring.sleuth.sampler.probability=1.0
Now that the project setup and dependencies are ready, let’s start building the TaskUserService microservice step by step
Step 1. Model Class
- Once completed the configuration of the database, eureka server, Spring security and Zipkin server. Create the one package in in.mahesh.tasks and named as usermodel and create the class named User into that package.
- Go to src -> java -> in.mahesh.tasks -> usermodel -> User and put the code below:
package in.mahesh.tasks.usermodel;
import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Document(collection = "user")
@AllArgsConstructor
@NoArgsConstructor
@Data
public class User {
    @Id
    private String id;
    private String fullName;
    private String email;
    @JsonProperty(access = JsonProperty.Access.WRITE_ONLY)
    private String password;
    private String role = "ROLE_CUSTOMER";
    private String mobile;
    
    private List<Long> completedTasks;
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public List<Long> getCompletedTasks() {
        return completedTasks;
    }
    public void setCompletedTasks(List<Long> completedTasks) {
        this.completedTasks = completedTasks;
    }
    public String get_id() {
        return id;
    }
    public void set_id(String id) {
        this.id = id;
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
Step 2. Repository
- Create the one package in in.mahesh.tasks and named as repository and create the interface named UserRepository into that package.
- Go to src -> java -> in.mahesh.tasks -> repository -> UserRepository and put the code below:
package in.mahesh.tasks.repository;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.data.mongodb.repository.Query;
import org.springframework.stereotype.Repository;
import in.mahesh.tasks.usermodel.User;
@Repository
public interface UserRepository extends MongoRepository<User,String> {
    @Query("{email :?0}")
    User findByEmail(String email);
}
Step 3. Services Classes
- Create the one package in in.mahesh.tasks and named as service and create the class named UserService into that package.
- Go to src -> java -> in.mahesh.tasks -> service -> UserService and put the code below:
package in.mahesh.tasks.service;
import in.mahesh.tasks.exception.UserException;
import in.mahesh.tasks.usermodel.User;
import java.util.List;
public interface UserService {
     
     public List<User> getAllUser()  throws UserException;
     
     public User findUserProfileByJwt(String jwt) throws UserException;
     
     public User findUserByEmail(String email) throws UserException;
     
     public User findUserById(String userId) throws UserException;
     public List<User> findAllUsers()
     }
Step 4. UserServiceImplementation
- Create the one more class in same package and it named as UserServiceImplementation into that package.
- Go to src -> java > in.mahesh.tasks -> service -> UserServiceImplementation and put the code below:
package in.mahesh.tasks.service;
import in.mahesh.tasks.exception.UserException;
import in.mahesh.tasks.repository.UserRepository;
import in.mahesh.tasks.taskSecurityConfig.JwtProvider;
import in.mahesh.tasks.usermodel.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class UserServiceImplementation implements UserService {
    @Autowired
    private UserRepository userRepository;
    
    @Override
    public User findUserProfileByJwt(String jwt) throws UserException {
        String email= JwtProvider.getEmailFromJwtToken(jwt);
        
        User user = userRepository.findByEmail(email);
        
        if(user==null) {
            throw new UserException("user not exist with email "+email);
        }
        return user;
    }
    
    public List<User> getAllUser()  throws UserException{
        return userRepository.findAll();
        
    }
    @Override
    public User findUserByEmail(String email) throws UserException {
        User user=userRepository.findByEmail(email);
        return user;
    }
    @Override
    public User findUserById(String userId) throws UserException {
        // TODO Auto-generated method stub
java.util.Optional<User> opt = userRepository.findById(userId);
        
        if(opt.isEmpty()) {
            throw new UserException("user not found with id "+userId);
        }
        return opt.get();
    }
    @Override
    public List<User> findAllUsers() {
        // TODO Auto-generated method stub
        return userRepository.findAll();
    }
}
Step 5. CustomerServiceImplementation
- Create the one more class in same package and it named as CustomerServiceImplementation into that package.
- Go to src -> java > in.mahesh.tasks -> service -> CustomerServiceImplementation and put the code below:
package in.mahesh.tasks.service;
import in.mahesh.tasks.repository.UserRepository;
import in.mahesh.tasks.usermodel.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.List;
@Service
public class CustomerServiceImplementation implements UserDetailsService {
    @Autowired
    private UserRepository userRepository;
    
    public CustomerServiceImplementation(UserRepository userRepository) {
        this.userRepository=userRepository;
    }
    
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepository.findByEmail(username);
        System.out.println(user);
       
        if(user==null) {
            throw new UsernameNotFoundException("User not found with this email"+username);
        }
        
        System.out.println("Loaded user: " + user.getEmail() + ", Role: " + user.getRole());
        List<GrantedAuthority> authorities = new ArrayList<>();
        return new org.springframework.security.core.userdetails.User(
                user.getEmail(),
                user.getPassword(),
                authorities);
    }
}
Step 6. Security Config
- Create the another package and it named as taskSecurityConfig and create the one class and it named as ApplicationConfig into that package.
- Go to src -> java -> in.mahesh.tasks -> taskSecurityConfig -> ApplicationConfig and put the code below:
package in.mahesh.tasks.taskSecurityConfig;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.www.BasicAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import java.util.Arrays;
import java.util.Collections;
@Configuration
public class ApplicatonConfig {
    @SuppressWarnings("deprecation")
    @Bean
    SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http.sessionManagement(management -> management.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
                .authorizeRequests(
                        authorize -> authorize.requestMatchers("/api/**")
                        .authenticated().anyRequest().permitAll())
                .addFilterBefore(new JwtTokenValidator(), BasicAuthenticationFilter.class)
                .csrf(csrf -> csrf.disable())
                .cors(cors -> cors.configurationSource(corsConfigurationSource()));
        return http.build();
    }
    private CorsConfigurationSource corsConfigurationSource() {
        return new CorsConfigurationSource() {
            @Override
            public CorsConfiguration getCorsConfiguration(HttpServletRequest request) {
                CorsConfiguration ccfg = new CorsConfiguration();
                ccfg.setAllowedOrigins(Arrays.asList("http://localhost:3000"));
                ccfg.setAllowedMethods(Collections.singletonList("*"));
                ccfg.setAllowCredentials(true);
                ccfg.setAllowedHeaders(Collections.singletonList("*"));
                ccfg.setExposedHeaders(Arrays.asList("Authorization"));
                ccfg.setMaxAge(3600L);
                return ccfg;
            }
        };
    }
    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
Step 7. Create JwtProvider
- Create the one more class in that same package and it named as JwtProvider into that package.
- Go to src -> java -> in.mahesh.tasks -> taskSecurityConfig -> JwtProvider and put the code below:
package in.mahesh.tasks.taskSecurityConfig;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import javax.crypto.SecretKey;
import java.util.Collection;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;
public class JwtProvider {
    static SecretKey key = Keys.hmacShaKeyFor(JwtConstant.SECRET_KEY.getBytes());
    public static String generateToken(Authentication auth) {
        Collection<? extends GrantedAuthority> authorities = auth.getAuthorities();
        String roles = populateAuthorities(authorities);
        @SuppressWarnings("deprecation")
        String jwt = Jwts.builder()
                .setIssuedAt(new Date())
                .setExpiration(new Date(new Date().getTime()+86400000))
                .claim("email", auth.getName())
                .claim( "authorities",roles)
                .signWith(key)
                .compact();
        System.out.println("Token for parsing in JwtProvider: " + jwt);
        return jwt;
    }
    private static String populateAuthorities(Collection<? extends GrantedAuthority> authorities) {
        Set<String> auths = new HashSet<>();
        for(GrantedAuthority authority: authorities) {
            auths.add(authority.getAuthority());
        }
        return String.join(",",auths);
    }
    @SuppressWarnings("deprecation")
    public static String getEmailFromJwtToken(String jwt) {
        jwt = jwt.substring(7); // Assuming "Bearer " is removed from the token
        try {
            //Claims claims=Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(jwt).getBody();
            Claims claims = Jwts.parser().setSigningKey(key).build().parseClaimsJws(jwt).getBody();
            String email = String.valueOf(claims.get("email"));
            System.out.println("Email extracted from JWT: " + claims);
            return email;
        } catch (Exception e) {
            System.err.println("Error extracting email from JWT: " + e.getMessage());
            e.printStackTrace();
            return null;
        }
    }
}
Step 8: Create JwtTokenValidator
- Create the one more class in that same package and it named as JwtTokenValidator into that package.
- Go to src -> java -> in.mahesh.tasks -> taskSecurityConfig -> JwtTokenValidator and put the code below:
package in.mahesh.tasks.taskSecurityConfig;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.filter.OncePerRequestFilter;
import javax.crypto.SecretKey;
import java.io.IOException;
import java.util.List;
public class JwtTokenValidator extends OncePerRequestFilter {
    @Override
    protected void doFilterInternal(HttpServletRequest request, HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String jwt = request.getHeader(JwtConstant.JWT_HEADER);
        System.out.println("JWT Token in JwtTokenValidator: " + jwt);
        if (jwt != null && jwt.startsWith("Bearer ")) {
            jwt = jwt.substring(7);
            
            System.out.println("JWT Token in JwtTokenValidator: " + jwt);
            try {
                SecretKey key = Keys.hmacShaKeyFor(JwtConstant.SECRET_KEY.getBytes());
                @SuppressWarnings("deprecation")
                Claims claims = Jwts.parser().setSigningKey(key).build().parseClaimsJws(jwt).getBody();
                System.out.print(claims);
                String email = String.valueOf(claims.get("email"));
                System.out.print(email);
                String authorities = String.valueOf(claims.get("authorities"));
                List<GrantedAuthority> auth = AuthorityUtils.commaSeparatedStringToAuthorityList(authorities);
                Authentication authentication = new UsernamePasswordAuthenticationToken(email, null, auth);
                SecurityContextHolder.getContext().setAuthentication(authentication);
            } catch (Exception e) {
                throw new BadCredentialsException("Invalid token", e);
            }
        }
        filterChain.doFilter(request, response);
    }
}
Step 9: Create JwtConstant
- Create the one more class in that same package and it named as JwtConstant into that package.
- Go to src -> java -> in.mahesh.tasks -> taskSecurityConfig -> JwtConstant and put the code below:
package in.mahesh.tasks.taskSecurityConfig;
public class JwtConstant {
    public static final String SECRET_KEY = "wpembytrwcvnryxksdbqwjebruyGHyudqgwveytrtrCSnwifoesarjbwe";
    public static final String JWT_HEADER = "Authorization";
}
Step 10: Create AuthController
- Create the new package named as the controller and create the one class in that same package and it named as AuthController into that package.
- Go to src -> java -> in.mahesh.tasks -> controller -> AuthController and put the code below:
package in.mahesh.tasks.controller;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import in.mahesh.tasks.exception.UserException;
import in.mahesh.tasks.repository.UserRepository;
import in.mahesh.tasks.request.LoginRequest;
import in.mahesh.tasks.response.AuthResponse;
import in.mahesh.tasks.service.CustomerServiceImplementation;
import in.mahesh.tasks.service.UserService;
import in.mahesh.tasks.taskSecurityConfig.JwtProvider;
import in.mahesh.tasks.usermodel.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private PasswordEncoder passwordEncoder;
   
    @Autowired
    private CustomerServiceImplementation customUserDetails;
    
    @Autowired
    private UserService userService;
    @HystrixCommand(fallbackMethod = "createUserFallback")
    @PostMapping("/signup")
    public ResponseEntity<AuthResponse> createUserHandler(@RequestBody User user) throws UserException {
        String email = user.getEmail();
        String password = user.getPassword();
        String fullName = user.getFullName();
        String mobile = user.getMobile();
        String role = user.getRole();
        User isEmailExist = userRepository.findByEmail(email);
        if (isEmailExist != null) {
            throw new UserException("Email Is Already Used With Another Account");
        }
        User createdUser = new User();
        createdUser.setEmail(email);
        createdUser.setFullName(fullName);
        createdUser.setMobile(mobile);
        createdUser.setRole(role);
        createdUser.setPassword(passwordEncoder.encode(password));
        
        User savedUser = userRepository.save(createdUser);
          userRepository.save(savedUser);
        Authentication authentication = new UsernamePasswordAuthenticationToken(email,password);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = JwtProvider.generateToken(authentication);
        AuthResponse authResponse = new AuthResponse();
        authResponse.setJwt(token);
        authResponse.setMessage("Register Success");
        authResponse.setStatus(true);
        return new ResponseEntity<AuthResponse>(authResponse, HttpStatus.OK);
    }
    public ResponseEntity<AuthResponse> createUserFallback(User user, Throwable throwable) {
        // Handle the fallback logic here, You can return a default response or log the error
        AuthResponse authResponse = new AuthResponse();
        authResponse.setMessage("User registration failed due to a temporary issue.");
        authResponse.setStatus(false);
        return new ResponseEntity<>(authResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @HystrixCommand(fallbackMethod = "signinFallback")
    @PostMapping("/signin")
    public ResponseEntity<AuthResponse> signin(@RequestBody LoginRequest loginRequest) {
        String username = loginRequest.getemail();
        String password = loginRequest.getPassword();
        System.out.println(username+"-------"+password);
        Authentication authentication = authenticate(username,password);
        SecurityContextHolder.getContext().setAuthentication(authentication);
        String token = JwtProvider.generateToken(authentication);
        AuthResponse authResponse = new AuthResponse();
        authResponse.setMessage("Login success");
        authResponse.setJwt(token);
        authResponse.setStatus(true);
        return new ResponseEntity<>(authResponse,HttpStatus.OK);
    }
    public ResponseEntity<AuthResponse> signinFallback(LoginRequest loginRequest, Throwable throwable) {
        // Handle the fallback logic here, You can return a default response or log the error
        AuthResponse authResponse = new AuthResponse();
        authResponse.setMessage("Login failed due to a temporary issue.");
        authResponse.setStatus(false);
        return new ResponseEntity<>(authResponse, HttpStatus.INTERNAL_SERVER_ERROR);
    }
    
    private Authentication authenticate(String username, String password) {
        System.out.println(username+"---++----"+password);
        UserDetails userDetails = customUserDetails.loadUserByUsername(username);
        System.out.println("Sig in in user details"+ userDetails);
        if(userDetails == null) {
            System.out.println("Sign in details - null" + userDetails);
            throw new BadCredentialsException("Invalid username and password");
        }
        if(!passwordEncoder.matches(password,userDetails.getPassword())) {
            System.out.println("Sign in userDetails - password mismatch"+userDetails);
            throw new BadCredentialsException("Invalid password");
        }
        return new UsernamePasswordAuthenticationToken(userDetails,null,userDetails.getAuthorities());
    }
}
Step 11. Create UserController
- Create the one class in that same package and it named as UserController into that package.
- Go to src -> java -> in.mahesh.tasks -> controller -> UserController and put the code below:
package in.mahesh.tasks.controller;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import in.mahesh.tasks.exception.UserException;
import in.mahesh.tasks.response.ApiResponse;
import in.mahesh.tasks.service.UserService;
import in.mahesh.tasks.usermodel.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
@RestController
@RequestMapping("/api/users")
public class UserController {
    @Autowired
    private UserService userService;
    
    public UserController(UserService userService) {
        this.userService = userService;
    }
    @HystrixCommand(fallbackMethod = "fallbackForGetUserProfile")
    @GetMapping("/profile")
    public ResponseEntity<User> getUserProfile(@RequestHeader("Authorization") String jwt) throws UserException {
        
        User user = userService.findUserProfileByJwt(jwt);
        user.setPassword(null);
        System.out.print(user);
        return new ResponseEntity<>(user, HttpStatus.OK);
    }
    public ResponseEntity<User> fallbackForGetUserProfile(String jwt, Throwable throwable) {
        // Handle the fallback logic here, For example, you can return a default user or a custom error message
        return new ResponseEntity<>(new User(), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @HystrixCommand(fallbackMethod = "fallbackForFindUserById")
    @GetMapping("/api/users/{userId}")
    public ResponseEntity<User> findUserById(
            @PathVariable String userId,
            @RequestHeader("Authorization") String jwt) throws UserException {
        User user = userService.findUserById(userId);
        user.setPassword(null);
        return new ResponseEntity<>(user, HttpStatus.ACCEPTED);
    }
    public ResponseEntity<User> fallbackForFindUserById(String userId, String jwt, Throwable throwable) {
        // Handle the fallback logic here, For example, you can return a default user or a custom error message
        return new ResponseEntity<>(new User(), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @HystrixCommand(fallbackMethod = "fallbackForFindAllUsers")
    @GetMapping("/api/users")
    public ResponseEntity<List<User>> findAllUsers(
            @RequestHeader("Authorization") String jwt)  {
        List<User> users = userService.findAllUsers();
        return new ResponseEntity<>(users, HttpStatus.ACCEPTED);
    }
    public ResponseEntity<List<User>> fallbackForFindAllUsers(String jwt, Throwable throwable) {
        // Handle the fallback logic here, For example, you can return an empty list or a custom error message
        return new ResponseEntity<>(List.of(), HttpStatus.INTERNAL_SERVER_ERROR);
    }
    @GetMapping()
    public ResponseEntity<?> getUsers(@RequestHeader("Authorization") String jwt) {
        try {
            List<User> users = userService.getAllUser();
            System.out.print(users);
            return new ResponseEntity<>(users, HttpStatus.OK);
        } catch (Exception e) {
            // Log the exception or handle it based on your application's requirements
            return new ResponseEntity<>("Error retrieving users", HttpStatus.INTERNAL_SERVER_ERROR);
        }
    }
}
Step 12. Create HomeController
- Create the one class in that same package and it named as HomeController into that package.
- Go to src -> java -> in.mahesh.tasks -> controller > HomeController and put the code below:
package in.mahesh.tasks.controller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import in.mahesh.tasks.response.ApiResponse;
@RestController
public class HomeController {
    
    @GetMapping
    public ResponseEntity<ApiResponse> homeController(){
        ApiResponse res=new ApiResponse("Welcome To Task Management Microservice Project",true);
        return new ResponseEntity<ApiResponse>(res,HttpStatus.ACCEPTED);
    }
    @GetMapping("/users")
    public ResponseEntity<ApiResponse> userHomeController(){
        ApiResponse res=new ApiResponse("Welcome To Task Management User Service",true);
        return new ResponseEntity<ApiResponse>(res,HttpStatus.ACCEPTED);
    }
}
Step 13. Create LoginRequest
- Create the new package named as request and create the one class in that same package and it named as LoginRequest into that package.
- Go to src -> java -> in.mahesh.tasks -> request -> LoginRequest and put the code below:
package in.mahesh.tasks.request;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import org.springframework.data.mongodb.core.mapping.Document;
@AllArgsConstructor
@NoArgsConstructor
@Document
public class LoginRequest {
    private String email;
    private String password;
    public String getemail() {
        return email;
    }
    public void setUsername(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public void setemail(String username) {
        // TODO Auto-generated method stub
        this.setUsername(username);
        
    }
}
Step 14. Create AuthReponse
- Create the new package named as response and create the one class in that same package and it named as AuthReponse into that package.
- Go to src -> java -> in.mahesh.tasks -> response -> AuthReponse and put the code below:
package in.mahesh.tasks.response;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
public class AuthResponse {
    private String jwt;
    private String message;
    private Boolean status;
    public String getJwt() {
        return jwt;
    }
    public void setJwt(String jwt) {
        this.jwt = jwt;
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public Boolean getStatus() {
        return status;
    }
    public void setStatus(Boolean status) {
        this.status = status;
    }
}
Step 15. Create ApiReponse
- Create the new package named as response and create the one class in that same package and it named as ApiReponse into that package.
- Go to src -> java -> in.mahesh.tasks -> response -> ApiReponse and put the code below
package in.mahesh.tasks.response;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
public class ApiResponse {
    private String message;
    private boolean status;
    public ApiResponse(String string, boolean b) {
        // TODO Auto-generated constructor stub
    }
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    public boolean isStatus() {
        return status;
    }
    public void setStatus(boolean status) {
        this.status = status;
    }
}
Step 16. UserException
- Create the new package named as exception and create the one class in that same package and it named as UserException into that package.
- Go to src -> java -> in.mahesh.tasks -> exception -> UserException and put the code below:
package in.mahesh.tasks.exception;
public class UserException extends Exception {
    
    public UserException(String message) {
        super(message);
    }
}
Step 17. Main Class
Open the main class and in that main class enables the Hystrix using @EnableHystrix annotation.
package in.mahesh.tasks;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
@SpringBootApplication
@EnableHystrix
public class TaskUserServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(TaskUserServiceApplication.class, args);
    }
}
Step 18. Run Application
Once completed the TaskUserService Microservice after that run the application once runs the application successfully looks like the below image.
Endpoints of the TaskUserService microservice:
| Endpoint Name | Method | Endpoint | 
|---|---|---|
| Sign Up | POST | http://localhost:8081/auth/signUp | 
| Sign In | POST | http://localhost:8081/auth/signin | 
| Get Profile | GET | http://localhost:8081/api/users/profile | 
| Get Profile by Id | GET | http://localhost:8081/api/users/{UserId} | 
| Get All Users | GET | http://localhost:8081/users | 
SignUp:
Sign Token:
Sign Crediedentials:
Profile:
All profiles:
TaskService Microservice
In this microservice, We can develop the microservice for creating the task and modification of the tasks and assigning the users and one more thing only admin can create the tasks and user unable to create the tasks.
Project Setup
Create the spring project using spring STS IDE on creating the spring project adding the below dependencies into the project.
- Spring Web
- Netflix eureka client server
- OpenFeign
- Spring data for mongodb
- Spring Actuator
- Spring Dev Tools
- Zipkin Server
- Lombok
Once the create the project including mention dependencies into the project then file structure look like below the image.
File Structure:
Open the application.properties file and put the below code for data base configuration and server port assigning the project.
server.port=8082
spring.data.mongodb.uri=mongodb://localhost:27017/userData
spring.application.name= TASK-SERVICE
#eureka server configuration
eureka.instance.prefer-ip-address=true
eureka.client.fetch-registry=true
eureka.client.register-with-eureka=true
eureka.client.service-url.defaultZone = http://localhost:8085/eureka
#Zipkin server configuration
spring.zipkin.base-url=http://localhost:9411
spring.sleuth.sampler.probability=1.0
Now that the project setup and dependencies are ready, let’s start building the TaskService microservice step by step
Step 1. Create Task Class
- Create the package in in.mahesh.tasks location and it named as the taskModel. In taskModel, Create the class named as Task.
- Go to src -> java -> in.mahesh.tasks -> TaskModel -> Task and put the below code:
package in.mahesh.tasks.taskModel;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import com.fasterxml.jackson.annotation.JsonFormat;
import in.mahesh.tasks.enums.TaskStatus;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@Document(collection="Tasks")
@AllArgsConstructor
@NoArgsConstructor
public class Task {
    
    @Id
    private String id;
    private String title;
    private String description;
    private String imageUrl;
    private String assignedUserId;
    
    @JsonFormat(shape = JsonFormat.Shape.STRING)
    private TaskStatus status;
    private LocalDateTime deadline;
    private LocalDateTime createAt;
    private List<String> tags = new ArrayList<>();
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getImageUrl() {
        return imageUrl;
    }
    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }
    public String getAssignedUserId() {
        return assignedUserId;
    }
    public void setAssignedUserId(String assignedUserId) {
        this.assignedUserId = assignedUserId;
    }
    public LocalDateTime getDeadline() {
        return deadline;
    }
    public void setDeadline(LocalDateTime deadline) {
        this.deadline = deadline;
    }
    public LocalDateTime getCreateAt() {
        return createAt;
    }
    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }
    public List<String> getTags() {
        return tags;
    }
    public void setTags(List<String> tags) {
        this.tags = tags;
    }
    public TaskStatus getStatus() {
        return status;
    }
    public void setStatus(TaskStatus status) {
        this.status = status;
    }
}
Step 2. Create UserDTO Class
- In taskModel, Create the one more class named as UserDTO
- Go to src -> java -> in.mahesh.tasks -> TaskModel -> UserDTO and put the below code:
package in.mahesh.tasks.taskModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    private String id;
    private String fullName;
    private String email;
    private String password;
    private String role;
    private String mobile;
    
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
    public String getMobile() {
        return mobile;
    }
    public void setMobile(String mobile) {
        this.mobile = mobile;
    }
}
Step 3. Create TaskStatus
- Create the package in in.mahesh.tasks location and it named as the enums. In enums, Create the enum named as TaskStatus.
- Go to src -> java -> in.mahesh.tasks -> TaskModel -> enums -> TaskStatus and put the below code:
package in.mahesh.tasks.enums;
import com.fasterxml.jackson.annotation.JsonFormat;
@JsonFormat(shape = JsonFormat.Shape.STRING)
public enum TaskStatus {
     PENDING("PENDING"),
        ASSIGNED("ASSIGNED"),
        DONE("DONE");
    private final String name;
    TaskStatus (String name) {
        this.name = name;
    }
    public String getName() {
        return name;
    }
}
Step 4. Create TaskRepository
- Create the package in in.mahesh.tasks location and it named as the repository. In repository, Create the interface named as TaskRepository.
- Go to src -> java -> in.mahesh.tasks -> repository -> TaskRepository and put the below code:
package in.mahesh.tasks.repository;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import in.mahesh.tasks.taskModel.Task;
import java.util.List;
import java.util.Optional;
@Repository
public interface TaskRepository extends MongoRepository<Task,String> {
    public List<Task> findByassignedUserId(String userId);
    public void deleteById(String id);
     public Task getTaskById(String id);
}
Step 5. Create TaskService
- Create the package in in.mahesh.tasks location and it named as the service. In service, Create the class named as TaskService.
- Go to src -> java -> in.mahesh.tasks -> service -> TaskService and put the below code:
package in.mahesh.tasks.service;
import java.util.List;
import in.mahesh.tasks.enums.TaskStatus;
import in.mahesh.tasks.taskModel.Task;
public interface TaskService {
    Task create(Task task, String requestRole) throws Exception;
    
    Task getTaskById(String id) throws Exception;
    
    List<Task> getAllTasks(TaskStatus taskStatus, String sortByDeadline, String sortByCreatedAt);
    
    Task updateTask(String id, Task updatedTask, String userId) throws Exception;
    
    void deleteTask(String id) throws Exception;
    
    Task assignedToUser(String userId, String id) throws Exception;
    
    List<Task> assignedUsersTask(String userId, TaskStatus taskStatus, String sortByDeadline, String sortByCreatedAt);
    
    Task completeTask(String taskId) throws Exception;
}
Step 6. Create TaskServiceImplementation
- In service, Create the class named as TaskServiceImplementation.
- Go to src -> java -> in.mahesh.tasks -> service -> TaskServiceImplementation and put the below code:
package in.mahesh.tasks.service;
import java.time.LocalDateTime;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;
import org.springframework.beans.factory.annotation.Autowired;
import in.mahesh.tasks.enums.TaskStatus;
import in.mahesh.tasks.repository.TaskRepository;
import in.mahesh.tasks.taskModel.Task;
import org.springframework.stereotype.Service;
@Service
public class TaskServiceImplementation implements TaskService {
    
    @Autowired
    private TaskRepository taskRepository;
     public TaskServiceImplementation(TaskRepository taskRepository) {
            this.taskRepository = taskRepository;
        }
    @Override
    public Task create(Task task, String requestRole) throws Exception {
        if (!requestRole.equals("ROLE_ADMIN")) {
            throw new Exception("Only admin can create tasks");
        }
        task.setStatus(TaskStatus.PENDING);
        task.setCreateAt(LocalDateTime.now());
        return taskRepository.save(task);
    }
    @Override
    public Task getTaskById(String id) {
        return taskRepository.findById(id).orElse(null); // Return null if task is not found
    }
    public List<Task> getAllTasks(TaskStatus taskStatus) {
        List<Task> allTasks = taskRepository.findAll();
        List<Task> fliteredTasks = allTasks.stream().filter(
                task -> taskStatus == null || task.getStatus().name().equalsIgnoreCase(taskStatus.toString())
        ).collect(Collectors.toList());
        // TODO Auto-generated method stub
        return fliteredTasks;
    }
    @Override
    public Task updateTask(String id, Task updatedTask, String userId) throws Exception {
        Task existingTasks = getTaskById(id);
        if(updatedTask.getTitle() != null) {
            existingTasks.setTitle(updatedTask.getTitle());
        }
        if(updatedTask.getImageUrl() != null) {
            existingTasks.setImageUrl(updatedTask.getImageUrl());
        }
        if (updatedTask.getDescription() != null) {
            existingTasks.setDescription(updatedTask.getDescription());
        }
        
          if (updatedTask.getStatus() != null) {
          existingTasks.setStatus(updatedTask.getStatus()); }
         
        if (updatedTask.getDeadline() != null) {
            existingTasks.setDeadline(updatedTask.getDeadline());
        }
        return taskRepository.save(existingTasks);
    }
    @Override
    public void deleteTask(String id) throws Exception {
        getTaskById(id);
        taskRepository.deleteById(id);
    }
    @Override
    public Task assignedToUser(String userId, String taskId) throws Exception {
        Task task = getTaskById(taskId);
        task.setAssignedUserId(userId);
        task.setStatus(TaskStatus.DONE);
        return taskRepository.save(task);
    }
    public List<Task> assignedUsersTask(String userId, TaskStatus taskStatus) {
        List<Task> allTasks = taskRepository.findByassignedUserId(userId);
        return allTasks.stream()
                .filter(task -> taskStatus == null || task.getStatus() == taskStatus)
                .collect(Collectors.toList());
    }
    @Override
    public Task completeTask(String taskId) throws Exception {
        Task task = getTaskById(taskId);
        task.setStatus(TaskStatus.DONE);
        // TODO Auto-generated method stub
        return taskRepository.save(task);
    }
    @Override
    public List<Task> getAllTasks(TaskStatus taskStatus, String sortByDeadline, String sortByCreatedAt) {
        // TODO Auto-generated method stub
        return null;
    }
     public List<Task> assignedUsersTask(String userId,TaskStatus status, String sortByDeadline, String sortByCreatedAt) {
            List<Task> allTasks = taskRepository.findByassignedUserId(userId);
            List<Task> filteredTasks = allTasks.stream().filter(task -> status == null || task.getStatus().name().equalsIgnoreCase(status.toString()))
                    .collect(Collectors.toList());
            if (sortByDeadline != null && !sortByDeadline.isEmpty()) {
                filteredTasks.sort(Comparator.comparing(Task::getDeadline));
            } else if (sortByCreatedAt != null && !sortByCreatedAt.isEmpty()) {
               // filteredTasks.sort(Comparator.comparing(Task::getCreatedAt));
            }
            return filteredTasks;
        }
}
Step 7. Create UserService
- In service, Create the class named as UserService.
- Go to src -> java -> in.mahesh.tasks -> service -> UserService and put the below code:
package in.mahesh.tasks.service;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import in.mahesh.tasks.taskModel.UserDTO;
//connect with taskUserService microService
@FeignClient(name = "user-SERVICE",url = "http://localhost:8081")
public interface UserService { 
    @GetMapping("/api/users/profile")
    public UserDTO getUserProfileHandler(@RequestHeader("Authorization") String jwt);
}
Step 8. Create HomeController
- Create the package in in.mahesh.tasks location and it named as the controller. In controller, Create the class named as HomeController.
- Go to src -> java -> in.mahesh.tasks -> controller -> HomeController and put the below code:
package in.mahesh.tasks.controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import in.mahesh.tasks.service.UserService;
@RestController
public class HomeController {
    @GetMapping("/tasks")
    public ResponseEntity<String> HomeController() {
        
        return new ResponseEntity<>("Welcome to task Service", HttpStatus.OK);
    }
}
Step 9. Create TaskController
- In Controller, Create the class named as TaskController.
- Go to src -> java -> in.mahesh.tasks -> controller -> TaskController and put the below code:
package in.mahesh.tasks.controller;
import in.mahesh.tasks.enums.TaskStatus;
import in.mahesh.tasks.service.TaskService;
import in.mahesh.tasks.service.UserService;
import in.mahesh.tasks.taskModel.Task;
import in.mahesh.tasks.taskModel.UserDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.util.List;
@RestController
@RequestMapping("/api/tasks")
public class TaskController {
      private TaskService taskService;
        private UserService userService;
        @Autowired
        public TaskController(TaskService taskService, UserService userService) {
            this.taskService = taskService;
            this.userService=userService;
        }
    // create Task API
    @PostMapping
    public ResponseEntity<Task> createTask(@RequestBody Task task, @RequestHeader("Authorization") String jwt)
            throws Exception {
        
         if(jwt==null){
                throw new Exception("jwt required...");
            }
        UserDTO user = userService.getUserProfileHandler(jwt);
        Task createdTask = taskService.create(task, user.getRole());
        return new ResponseEntity<>(createdTask, HttpStatus.CREATED);
    }
    @GetMapping("/{id}")
    public ResponseEntity<Task> getTaskById(@PathVariable String id, @RequestHeader("Authorization") String jwt)
            throws Exception {
         if(jwt==null){
                throw new Exception("jwt required...");
            }
        
        //UserDTO user = userService.getUserProfile(jwt);
        Task task = taskService.getTaskById(id);
        //return new ResponseEntity<>(task, HttpStatus.OK);
        return task != null ? new ResponseEntity<>(task, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
    }
     @GetMapping("/user")
        public ResponseEntity< List<Task> > getAssignedUsersTask(
                @RequestHeader("Authorization") String jwt,
                @RequestParam(required = false) TaskStatus status,
                @RequestParam(required = false) String sortByDeadline,
                @RequestParam(required = false) String sortByCreatedAt) throws Exception {
            UserDTO user=userService.getUserProfileHandler(jwt);
            List<Task> tasks = taskService.assignedUsersTask(user.getId(),status, sortByDeadline, sortByCreatedAt);
            return new ResponseEntity<>(tasks, HttpStatus.OK);
        }
    /*
     * Test with Posman with Post Method http://localhost:8082/api/tasks requestBody
     * and gobal config with JWT { "title":"New Website Creation using springBoot",
     * "image":"https://www.image.com/dhdbhjf.png",
     * "description":"Do it this Website as soon as possible ",
     * "deadline":"2024-02-29T12:34:38.9056991 " } reponse { "id":
     * "65b913d02071402a82b2f9b8", "title": "New Website Creation using springBoot",
     * "description": "Do it this Website as soon as possible ", "imageUrl": null,
     * "assignedUserId": 0, "status": "PENDING", "deadline":
     * "2024-02-29T12:34:38.9056991", "createAt": "2024-01-30T20:50:48.2276611" }
     */
     @GetMapping
        public ResponseEntity<List<Task>> getAllTasks(
                @RequestHeader("Authorization") String jwt,
                @RequestParam(required = false) TaskStatus status,
                @RequestParam(required = false) String sortByDeadline,
                @RequestParam(required = false) String sortByCreatedAt
        ) throws Exception {
            if(jwt==null){
                throw new Exception("jwt required...");
            }
            List<Task> tasks = taskService.getAllTasks(status, sortByDeadline, sortByCreatedAt);
            return new ResponseEntity<>(tasks, HttpStatus.OK);
        }
     
        @PutMapping("/{id}/user/{userId}/assigned")
        public ResponseEntity<Task> assignedTaskToUser(
                @PathVariable String id,
                @PathVariable String userId,
                @RequestHeader("Authorization") String jwt
        ) throws Exception {
            UserDTO user=userService.getUserProfileHandler(jwt);
            Task task = taskService.assignedToUser(userId,id);
            return new ResponseEntity<>(task, HttpStatus.OK);
        }
        @PutMapping("/{id}")
        public ResponseEntity<Task> updateTask(
                @PathVariable String id,
                @RequestBody Task req,
                @RequestHeader("Authorization") String jwt
        ) throws Exception {
            if(jwt==null){
                throw new Exception("jwt required...");
            }
            UserDTO user=userService.getUserProfileHandler(jwt);
            Task task = taskService.updateTask(id, req, user.getId());
            return task != null ? new ResponseEntity<>(task, HttpStatus.OK) : new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        @DeleteMapping("/{id}")
        public ResponseEntity<Void> deleteTask(@PathVariable String id) {
            try {
                taskService.deleteTask(id);
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            return new ResponseEntity<>(HttpStatus.NO_CONTENT);
        }
        @PutMapping("/{id}/complete")
        public ResponseEntity<Task> completeTask(@PathVariable String id) throws Exception {
            Task task = taskService.completeTask(id);
            return new ResponseEntity<>(task, HttpStatus.NO_CONTENT);
        }
}
Step 10. Run Application
Once completed the project and it run the application as spring project and once it will run successfully and then project runs as port number 8082. Refer the below image for the better understanding.
Endpoint of the TaskService microservice:
| Methods | Endpoints | 
|---|---|
| POST | http://localhost:8082/api/tasks | 
| GET | http://localhost:8082/api/tasks/{id} | 
| GET | http://localhost:8082/api/tasks/user | 
| PUT | http://localhost:8082/api/tasks/{id} | 
| GET | http://localhost:8082/ | 
| PUT | http://localhost:8082/api/tasks/{id}/user/{userId}/assigned | 
| PUT | http://localhost:8082/api/tasks/{id}/complete | 
| DELETE | http://localhost:8082/api/tasks/{id} | 
Refer the below Images:
Create the Task:
Get the Task by TaskId:
Get All Tasks:
TaskSubmissionService Microservice
In this microservice, we can develop the microservice can be manages the submission of the tasks by users and handles the related functionalities such as validation and processing.
Project Setup
Create the spring project using spring STS IDE on creating the spring project adding the below dependencies into the spring project.
- Spring Web
- Spring data for mongodb
- Spring Netflix Eureka client server
- OpenFeign
- Spring Dev Tools
- Lombok
- Zipkin server
Once create the spring project includes the mention dependencies into the project after creating the project then the file structure looks like the below image.
File structure:
Open the application.properties file and put the below code for the database configuration, server port assigning and Zipkin server configurations into the project
server.port=8083
spring.data.mongodb.uri=mongodb://localhost:27017/userSubmission
spring.application.name=TASK-SUBMISSION
logging.level.org.springframework=DEBUG
eureka.instance.prefer-ip-address=true
eureka.client.fetch-registry=true
eureka.client.register-with-eureka=true
eureka.client.service-url.defaultZone = http://localhost:8085/eureka
#Zipkin server configuration
spring.zipkin.base-url=http://localhost:9411
spring.sleuth.sampler.probability=1.0
Now that the project setup and dependencies are ready, let’s start building the TaskSubmissionService microservice step by step
Step 1. Create TaskSubmission
- Create the package in in.mahesh.tasks location and it named as the submissionModel and create the class in that package named as TaskSubmission
- Go to src > java > in.mahesh.tasks > submissionModel > TaskSubmission and put the code below:
package in.mahesh.tasks.submissionModel;
import java.time.LocalDateTime;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
@Document(collection = "taskSubmission")
@AllArgsConstructor
@NoArgsConstructor
public class TaskSubmission {
    
    @Id
    private String id;
    
    private String taskId;
    
    private String githubLink;
    
    private String userId;
    
    private String status = "PENDING";
    
    private LocalDateTime submissionTime;
    public LocalDateTime getSubmissionTime() {
        return submissionTime;
    }
    public void setSubmissionTime(LocalDateTime submissionTime) {
        this.submissionTime = submissionTime;
    }
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getTaskId() {
        return taskId;
    }
    public void setTaskId(String taskId) {
        this.taskId = taskId;
    }
    public String getGithubLink() {
        return githubLink;
    }
    public void setGithubLink(String githubLink) {
        this.githubLink = githubLink;
    }
    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
Step 2. Create TaskDTO
- In same package, We can create one more class and it named as TaskDTO
- Go to src > java > in.mahesh.tasks > submissionModel > TaskDTO and put the code below:
package in.mahesh.tasks.submissionModel;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
public class TaskDTO {
    
    private String id;
    private String title;
    private String description;
    private String image;
    //private String assignedUserId;
    private String status;
    private LocalDateTime deadline;
    private LocalDateTime createAt;
    //private List<String> tags = new ArrayList<>();
    public String getId() {
        return id;
    }
    public void setId(String id) {
        this.id = id;
    }
    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }
    public String getImage() {
        return image;
    }
    public void setImage(String image) {
        this.image = image;
    }
    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
    public LocalDateTime getDeadline() {
        return deadline;
    }
    public void setDeadline(LocalDateTime deadline) {
        this.deadline = deadline;
    }
    public LocalDateTime getCreateAt() {
        return createAt;
    }
    public void setCreateAt(LocalDateTime createAt) {
        this.createAt = createAt;
    }    
}
Step 3. Create UserDTO
- In same package, We can create one more class and it named as UserDTO
- Go to src -> java -> in.mahesh.tasks -> submissionModel -> UserDTO and put the code below:
package in.mahesh.tasks.submissionModel;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
@AllArgsConstructor
@NoArgsConstructor
public class UserDTO {
    
     private String id;
        private String fullName;
        private String email;
        //private String password;
        private String role;
        private String mobile;
        public String getId() {
            return id;
        }
        public void setId(String id) {
            this.id = id;
        }
        public String getFullName() {
            return fullName;
        }
        public void setFullName(String fullName) {
            this.fullName = fullName;
        }
        public String getEmail() {
            return email;
        }
        public void setEmail(String email) {
            this.email = email;
        }
        public String getRole() {
            return role;
        }
        public void setRole(String role) {
            this.role = role;
        }
        public String getMobile() {
            return mobile;
        }
        public void setMobile(String mobile) {
            this.mobile = mobile;
        }        
}
Step 4. Create TaskStatus
- In same package, We can create enum and it named as TaskStatus
- Go to src -> java -> in.mahesh.tasks -> submissionModel -> TaskStatus and put the code below:
package in.mahesh.tasks.submissionModel;
public enum TaskStatus {
    PENDING("PENDING"),
    ASSIGNED("ASSIGNED"),
    DONE("DONE");
    
    TaskStatus(String done) {
    }
}
Step 5. Create SubRepository
- Create the package in in.mahesh.tasks location and it named as the repository and create the class in that package named as SubRepository
- Go to src > java > in.mahesh.tasks > repository > SubRepository and put the code below:
package in.mahesh.tasks.repository;
import java.util.List;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import in.mahesh.tasks.submissionModel.TaskSubmission;
@Repository
public interface SubRepository extends MongoRepository<TaskSubmission,String>{
    //List<TaskSubmission> findByTaskId(String taskId);
}
Step 6. Create SubmissionService
- In same package, We can create one more interface and it named as SubmissionSerivce.
- Go to src > java > in.mahesh.tasks > service > SubmissionSerivce and put the code below:
package in.mahesh.tasks.service;
import java.util.List;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import in.mahesh.tasks.submissionModel.TaskSubmission;
@Component
public interface SubmissionService {
    
      TaskSubmission submitTask(String taskId, String githubLink, String userId,String jwt) throws Exception;
      
      TaskSubmission getTaskSubmissionById(String submissionId) throws Exception;
      
     List<TaskSubmission> getAllTaskSubmissions(); 
      
      List<TaskSubmission> getTaskSubmissionByTaskId(String taskId) ;
      
      TaskSubmission acceptDeclineSubmission(String id, String status) throws Exception;
}
Step 8. Create TaskSerivce
- In same package, we can create one more interface and it named as TaskSerivce.
- Go to src > java > in.mahesh.tasks > service > TaskSerivce and put the code below:
package in.mahesh.tasks.service;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import in.mahesh.tasks.submissionModel.TaskDTO;
@FeignClient(name = "TASK-SERVICE",url = "http://localhost:8082")
public interface TaskService {
    @GetMapping("/api/tasks/{id}")
    TaskDTO getTaskById(@PathVariable String id, @RequestHeader("Authorization") String jwt) throws Exception;
    @PutMapping("/api/tasks/{id}/complete")
    TaskDTO completeTask(@PathVariable
                         String id);
}
Step 9. Create UserService
- In same package, we can create one more interface and it named as UserService.
- Go to src > java > in.mahesh.tasks > service > UserService and put the code below:
package in.mahesh.tasks.service;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import in.mahesh.tasks.submissionModel.UserDTO;
//connect with taskUserService microService
@FeignClient(name = "USER-SERVICE",url = "http://localhost:8081")
public interface UserService {
    @GetMapping("/api/users/profile")
    public UserDTO getUserProfileHandler(@RequestHeader("Authorization") String jwt);
}
Step 10. Create HomeController
- Create the package in in.mahesh.tasks location and it named as the controller and create the class in that package named as HomeController
- Go to src > java > in.mahesh.tasks > controller > HomeController and put the code below:
package in.mahesh.tasks.controller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class HomeController {
    
    @GetMapping("/submissions")
    public ResponseEntity<String> homeController() {
        return new ResponseEntity<>("Welcome to Task Submission Service",HttpStatus.OK);
    }
}
Step 11. Create SubController
- In same package, We can create one more interface and it named as SubController.
- Go to src > java > in.mahesh.tasks > controller > SubController and put the code below:
package in.mahesh.tasks.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import in.mahesh.tasks.service.SubmissionService;
import in.mahesh.tasks.service.TaskService;
import in.mahesh.tasks.service.UserService;
import in.mahesh.tasks.submissionModel.TaskSubmission;
import in.mahesh.tasks.submissionModel.UserDTO;
import jakarta.inject.Qualifier;
@RestController
@RequestMapping("/api/submissions")
public class SubController {
    @Autowired
    private TaskService taskService;
    @Autowired
    private SubmissionService submissionService;
    @Autowired
    private UserService userService;
    public ResponseEntity<TaskSubmission> submitTask(@RequestParam String task_id,
                                                     @RequestParam String github_link, @RequestHeader("Authorization") String jwt) throws Exception {
        try {
            UserDTO user = userService.getUserProfileHandler(jwt);
            TaskSubmission sub = submissionService.submitTask(task_id, github_link, user.getId(), jwt);
            return new ResponseEntity<>(sub, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // Re-throwing the exception to propagate it up
        }
    }
    @GetMapping("/{submissionId}")
    public ResponseEntity<TaskSubmission> getTaskSubmissionById(@PathVariable String id) throws Exception {
        try {
            TaskSubmission sub = submissionService.getTaskSubmissionById(id);
            return new ResponseEntity<>(sub, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // Re-throwing the exception to propagate it up
        }
    }
    @GetMapping()
    public ResponseEntity<List<TaskSubmission>> getAllTaskSubmissions() throws Exception {
        try {
            List<TaskSubmission> sub = submissionService.getAllTaskSubmissions();
            return new ResponseEntity<>(sub, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // Re-throwing the exception to propagate it up
        }
    }
    @GetMapping("/task/{taskId}")
    public ResponseEntity<List<TaskSubmission>> getTaskSubmissionsByTaskId(@PathVariable String taskId) {
        try {
            List<TaskSubmission> submissions = submissionService.getTaskSubmissionByTaskId(taskId);
            return new ResponseEntity<>(submissions, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // Re-throwing the exception to propagate it up
        }
    }
    @PutMapping("/{id}")
    public ResponseEntity<TaskSubmission>
    acceptOrDeclineTaskSubmission(
            @PathVariable String id,
            @RequestParam("status") String status) throws Exception {
        try {
            TaskSubmission submission = submissionService.acceptDeclineSubmission(id, status);
            if (submission.getStatus().equals("COMPLETE")) {
                taskService.completeTask(submission.getTaskId());
            }
            return new ResponseEntity<>(submission, HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            throw e; // Re-throwing the exception to propagate it
        }
    }
}
Step 12. Main Class
Open the main class and in that class enables the feign clients using @EnableFeignClients annotation.
package in.mahesh.tasks;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.openfeign.EnableFeignClients;
@SpringBootApplication
@EnableFeignClients
public class TaskSubmissionServiceApplication {
    public static void main(String[] args) {
        SpringApplication.run(TaskSubmissionServiceApplication.class, args);
    }
}
Step 13. Run Application
Once completed the project and run the application as spring boot app and once the project runs successfully and it open the port number 8083. Refer the below image for the better understanding.
Endpoints of the TaskSubmissionService microservice:
| Method | Endpoints | 
|---|---|
| GET | http://localhost:8083/submissions | 
| GET | http://localhost:8083/api/submissions/{submissionId} | 
| GET | http://localhost:8083/api/submissions | 
| GET | http://localhost:8083/api/submissions/task/{taskId} | 
| PUT | http://localhost:8083/api/submissions/{id} | 
EurekaServerConfiguration microservice
In this microservice, we can develop the microservice and it can be used to establish the communication of the microservices using eureka server using discovery client and server with communicates with each dynamically.
Project Setup
Create the spring project using Spring STS IDE on creating the project adding the below dependencies into the project.
- Spring Web
- Spring Netflix Eureka Admin Server
- Spring boot Actuator
- Spring Dev Tools
- Zipkin Server
Once create the project on adding the mention dependencies into the project then the file structure of the project looks like the below image.
File Structure:
Open the application.properties file and put the below into it.
server.port=8085
eureka.instance.hostname=localhost
eureka.client.register-with-eureka=false
eureka.client.fetch-registry=false
eureka.client.service-url.defaultZone =http://${eureka.instance.hostname}:${server.port}/eureka
#Zipkin server configuration
spring.zipkin.base-url=http://localhost:9411
spring.sleuth.sampler.probability=1.0
Open the main class and enable the eureka server using @EnableEurekaServer annotation.
package in.mahesh.tasks;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
@SpringBootApplication
@EnableEurekaServer
public class EurekaServerConfigurationApplication {
    public static void main(String[] args) {
        SpringApplication.run(EurekaServerConfigurationApplication.class, args);
    }
}
Once completed the project run the application as spring boot app once the application successful and it will run the port 8085.Refer the below image for better understanding.
APIGatway microservice
In this microservice, we can develop the microservice and it can be used to API Gateway and establish the routing the client requests of the system.
Project Setup
Create the spring project using Spring STS IDE on creating the spring project add the below dependencies into the project.
- Spring Web
- Spring Netflix Eureka Client Server
- Spring Routing Gateway
- Spring Actuator
- Zipkin Server
Once completed the creation of the project then its file structure looks like the below image:
Open the application.properties file and renamed into the application.yml file and put the below into it.
server:
  port: 8090
spring:
  application:
    name: API-GATEWAY-SERVER
  zipkin:
    base-url: http://localhost:9411
  sleuth:
    sampler:
      probability: 1.0
  cloud:
    gateway:
      routes:
        - id: USER-SERVICE
          uri: lb://USER-SERVICE
          predicates:
            - Path=/auth/**, /users/**, /api/users/**, /
        - id: TASK-SERVICE
          uri: lb://TASK-SERVICE
          predicates:
            - Path=/api/tasks/**, /tasks/**
        - id: TASK-SUBMISSION
          uri: lb://TASK-SUBMISSION
          predicates:
            - Path=/api/submissions/**, /submissions
      default-filters:
        - DedupeResponseHeader=Access-Control-Allow-Credentials Access-Control-Allow-Origin
      globalcors:
        cors-configurations:
          '[/**]':
            allowedOrigins: "*"
            allowedMethods: "*"
            allowedHeaders: "*"     
eureka:
  instance:
    prefer-ip-address: true
  client:
    fetch-registry: true
    register-with-eureka: true
    service-url:
      defaultZone: http://localhost:8085/eureka
In this project there is no changes into the project once configure the application.yml then run the project.
package in.mahesh.tasks;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class ApiGateWayApplication {
    public static void main(String[] args) {
        SpringApplication.run(ApiGateWayApplication.class, args);
    }
}
Once complete the project run the project as spring boot application once runs the application successful it will run on the port 8090. Refer the below image for the better understanding.
Now all the microservice are run the single port 8090 after then routing the request using loadbalancer on the API Gateway.
Final Endpoints of the Application:
| SI.NO | Method | Endpoints | 
|---|---|---|
| 1 | POST | http://localhost:8090/auth/signUp | 
| 2 | POST | http://localhost:8090/auth/signin | 
| 3 | GET | http://localhost:8090/api/users/profile | 
| 4 | GET | http://localhost:8090/api/users/{UserId} | 
| 5 | GET | http://localhost:8090/users | 
| 6 | POST | http://localhost:8090/api/tasks | 
| 7 | GET | http://localhost:8090/api/tasks/{id} | 
| 8 | GET | http://localhost:8090/api/tasks/user | 
| 9 | PUT | http://localhost:8090/api/tasks/{id} | 
| 10 | GET | http://localhost:8082/api/tasks | 
| 11 | PUT | http://localhost:8090/api/tasks/{id}/user/{userId}/assigned | 
| 12 | PUT | http://localhost:8090/api/tasks/{id}/complete | 
| 13 | DELETE | http://localhost:8090/api/tasks/{id} | 
| 14 | GET | http://localhost:8090/submissions | 
| 15 | GET | http://localhost:8090/api/submissions/{submissionId} | 
| 16 | GET | http://localhost:8090/api/submissions | 
| 17 | GET | http://localhost:8090/api/submissions/task/{taskId} | 
| 18 | PUT | http://localhost:8090/api/submissions/{id} | 
Refer the below images for better understanding for working functionalities of the endpoints of the task management system.
Set the token as Global Environment Variables:
SignIn:
SignIn:
SignIn response:
Profile:
GET ALL Users:
Create the Task:
Get ALL Task:
Assign Tasks:
Delete Task:
Submission API:
