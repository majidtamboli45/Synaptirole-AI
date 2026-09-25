# Spring Security Annotations

> Source: https://www.geeksforgeeks.org/advance-java/spring-security-annotations/

Spring Security annotations provide a declarative way to secure Spring Boot applications by controlling access at method and class levels. They help define authentication and authorization rules directly in the code, making security configuration simpler and more readable.
- Used to restrict access based on roles, permissions, or user authentication status.
- Improve security management by reducing complex XML or Java-based configuration.
- Enables fine-grained method-level security, allowing access control based on conditions, expressions, or user roles before method execution.
Spring Security Annotations
These annotation are commonly used Spring Security annotations with their purpose and syntax for securing Spring Boot applications.
1. @Secured
- Used to restrict access based on specific roles only
- Does not support SpEL (Spring Expression Language)
- Simple role-based authorization
Syntax
@Secured({"ROLE_ADMIN", "ROLE_USER"})
@GetMapping("/home")
public String home() {
    return "Home Page";
}
2. @PreAuthorize
- Used for method-level security before execution
- Supports SpEL expressions
- Most powerful and commonly used annotation
Syntax
@PreAuthorize("hasRole('ADMIN')")
@GetMapping("/admin")
public String admin() {
    return "Admin Panel";
}
3. @PostAuthorize
- Security check is done after method execution
- Useful when return object must be validated
- Supports SpEL with returnObject
Syntax
@PostAuthorize("returnObject.owner == authentication.name")
public String getData() {
    return "Secure Data";
}
4. @PreFilter
- Filters input collection before method execution
- Works on lists, arrays, collections
- Uses SpEL with filterObject
Syntax
@PreFilter("filterObject.owner == authentication.name")
public void process(List<String> data) {
    // filtered data is passed here
}
5. @PostFilter
- Filters output collection after method execution
- Ensures only authorized data is returned
Syntax
@PostFilter("filterObject.owner == authentication.name")
public List<String> getAllData() {
     return dataService.findAll();
}
6. @RolesAllowed
- Standard JSR-250 annotation
- Works similar to @Secured but more portable
- Can be used across different security frameworks
Syntax
@RolesAllowed({"ROLE_ADMIN", "ROLE_EDITOR"})
@GetMapping("/dashboard")
public String dashboard() {
      return "Dashboard";
}
7. @AuthenticationPrincipal
- Injects the currently logged-in user
- Used in controllers and services
- Gives access to UserDetails
Syntax
@GetMapping("/profile")
public String profile(@AuthenticationPrincipal UserDetails user) {
       return user.getUsername();
}
8. RoleHierarchy
- Used to define role inheritance (admin > editor > user)
- Configured using a bean, not annotation
Note: This is not an annotation; it is configured as a Spring Security bean to define role inheritance in the application.
Syntax
@Bean
public RoleHierarchy roleHierarchy() {
RoleHierarchyImpl hierarchy = new RoleHierarchyImpl();
hierarchy.setHierarchy("ROLE_ADMIN > ROLE_EDITOR > ROLE_USER");
        return hierarchy;
}
