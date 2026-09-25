# Spring Security Integration with Spring Boot

> Source: https://www.geeksforgeeks.org/advance-java/spring-security-integration-with-spring-boot/

Spring Security integrates with Spring Boot to provide a robust and flexible way to handle authentication and authorization in applications. It helps secure web applications and REST APIs with minimal configuration while offering powerful customization options.
- Provides built-in support for authentication and role-based access control.
- Easily integrates with Spring Boot auto-configuration for quick setup.
- Secures REST APIs and web applications using filters and security chains.
Step-by-Step Implementation of Spring Security with Spring Boot
Follow the steps below to implement Spring Security in a Spring Boot application.
Step 1: Create Spring Boot Project
Create a Spring Boot project using Spring Initializr or your IDE- Eclipse/ Intellij
Step 2: Add Dependencies
Add the required Spring Boot and Spring Security dependencies to your project.
Maven:
<dependencies>
     <dependency>
               <groupId>org.springframework.boot</groupId>
               <artifactId>spring-boot-starter-web</artifactId>
       </dependency>
          <dependency>
             <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
         </dependency>
         <dependency>
                   <groupId>org.springframework.security</groupId>
                  <artifactId>spring-security-test</artifactId>
                 <scope>test</scope>
       </dependency>
</dependencies>
Gradle:
dependencies {
      implementation 'org.springframework.boot:spring-boot-starter-web'
     implementation 'org.springframework.boot:spring-boot-starter-security'
  testImplementation 'org.springframework.security:spring-security-test'
}
Step 3: Configure Basic Security
Defines authentication and authorization rules using SecurityFilterChain.
@Configuration
public class SecurityConfig {
    @Bean
    public SecurityFilterChain
    securityFilterChain(HttpSecurity http) throws Exception
    {
        http.csrf(csrf -> csrf.disable())
            .authorizeHttpRequests(
                auth
                -> auth.requestMatchers("/", "/home")
                       .permitAll()
                       .anyRequest()
                       .authenticated())
            .formLogin();
        return http.build();
    }
    @Bean public PasswordEncoder passwordEncoder()
    {
        return new BCryptPasswordEncoder();
    }
}
Step 4: Advanced Authentication
Defines multiple in-memory users with roles for role-based access control.
@Bean public UserDetailsService userDetailsService()
{
    UserDetails user
        = User.withUsername("regularUser")
              .password(
                  passwordEncoder().encode("userPass"))
              .roles("USER")
              .build();
    UserDetails admin
        = User.withUsername("superAdmin")
              .password(
                  passwordEncoder().encode("adminPass"))
              .roles("ADMIN")
              .build();
    return new InMemoryUserDetailsManager(user, admin);
}
Step 5: Securing RESTful APIs
Configures stateless API security with role-based endpoint restrictions.
@Bean
public SecurityFilterChain apiSecurity(HttpSecurity http)
    throws Exception
{
    http.csrf(csrf -> csrf.disable())
        .sessionManagement(
            session
            -> session.sessionCreationPolicy(
                SessionCreationPolicy.STATELESS))
        .authorizeHttpRequests(
            auth
            -> auth.requestMatchers("/api/public/**")
                   .permitAll()
                   .requestMatchers("/api/user/**")
                   .hasAnyRole("USER", "ADMIN")
                   .requestMatchers("/api/admin/**")
                   .hasRole("ADMIN")
                   .anyRequest()
                   .authenticated());
    return http.build();
}
Step 6: Implement UserDetailsService
Loads user details from the database for authentication.
@Service
public class MyUserDetailsService
    implements UserDetailsService {
    @Autowired private UserRepository userRepository;
    @Override
    public UserDetails loadUserByUsername(String username)
        throws UsernameNotFoundException
    {
        User user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException(
                "User not found");
        }
        return new org.springframework.security.core
            .userdetails.User(user.getUsername(),
                              user.getPassword(),
                              new ArrayList<>());
    }
}
Step 7: Create Controller
Defines endpoints to test user and admin access.
@RestController
public class DemoController {
    @GetMapping("/user/home") public String userHome()
    {
        return "User Home";
    }
    @GetMapping("/admin/home") public String adminHome()
    {
        return "Admin Home";
    }
}
Step 8: Testing Security Configuration
Tests role-based access using MockMvc and mock users.
@SpringBootTest
@AutoConfigureMockMvc
public class AuthenticationTests {
    @Autowired private MockMvc mockMvc;
    @Test
    @WithMockUser(username = "normalUser",
                  roles = { "USER" })
    public void
    testUserAccess() throws Exception
    {
        mockMvc.perform(get("/user/home"))
            .andExpect(status().isOk());
    }
    @Test
    @WithMockUser(username = "normalUser",
                  roles = { "USER" })
    public void
    testAdminAccessDenied() throws Exception
    {
        mockMvc.perform(get("/admin/home"))
            .andExpect(status().isForbidden());
    }
}
Step 9: Run Application
Runs the Spring Boot application with the given maven command.
mvn spring-boot:run
Step 10: Run Tests
Executes test cases to verify security behavior with given maven command.
mvn test
After running the test command, all test results are displayed in the console showing passed and failed test cases along with their execution status.
