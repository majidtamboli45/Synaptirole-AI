# Spring @PathVariable Annotation

> Source: https://www.geeksforgeeks.org/advance-java/spring-pathvariable-annotation/

The @PathVariable annotation in Spring is used to extract values from the URL path and bind them to method parameters in a controller. It enables developers to create dynamic and RESTful URLs, making applications more flexible and easier to maintain.
- Extracts dynamic values directly from the URL path.
- Binds URL path variables to controller method parameters using @PathVariable.
- Commonly used in RESTful APIs to identify resources such as user IDs, product IDs, or order IDs.
Syntax:
@GetMapping("/users/{userId}")
public String getUser(@PathVariable("userId") String userId) {
    return "User ID is: " + userId;
}
Example of Spring @PathVariable Annotation
1. Basic @PathVariable Usage
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api")
public class UserController {
    @GetMapping("/users/{userId}")
    public String fetchUserById(@PathVariable("userId") Long userId) {
        return "Retrieved User ID: " + userId;
    }
}
Explanation:
- @RestController: Marks the class as a REST controller and returns data directly in the HTTP response.
- @RequestMapping("/api"): Sets /api as the base URL for all endpoints.
- @GetMapping("/users/{userId}"): Maps GET requests to the /users/{userId} endpoint.
- @PathVariable("userId"): Binds the userId value from the URL to the method parameter.
Output:
For a request to /api/users/123, the output would be: "Retrieved User ID: 123"
2. Handling Optional Path Variables
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
@RestController
@RequestMapping("/api")
public class UserController {
    @GetMapping("/users/{userId}/{userName}")
    public String fetchUserDetails(@PathVariable Map<String, String> pathVariables) {
        String userId = pathVariables.get("userId");
        String userName = pathVariables.get("userName");
        if (userId != null && userName != null) {
            return "User ID: " + userId + ", Name: " + userName;
        } else {
            return "Parameters are missing";
        }
    }
}
Explanation:
- @PathVariable(name = "postId", required = false): Marks the postId path variable as optional. If postId is not provided in the URL, it will be null.
Expected Output:
- For a request to /api/users/123/posts/456, the output would be: "User ID: 123 and Post ID: 456"
- For a request to /api/users/123/posts, the output would be: "User ID: 123 with no post specified."
3. Handling Multiple @PathVariable Parameters
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Map;
@RestController
@RequestMapping("/api")
public class UserController {
    @GetMapping("/users/{userId}/{userName}")
    public String fetchUserDetails(@PathVariable Map<String, String> pathVariables) {
        String userId = pathVariables.get("userId");
        String userName = pathVariables.get("userName");
        if (userId != null && userName != null) {
            return "User ID: " + userId + ", Name: " + userName;
        } else {
            return "Parameters are missing";
        }
    }
}
Explanation:
- @PathVariable Map<String, String> pathVariables: Binds all path variables to a Map. The keys of the map are the path variable names, and the values are the path variable values.
Expected Output:
- For a request to /api/users/123/john, the output would be: "User ID: 123, Name: john"
- For a request with missing parameters, the output would be: "Parameters are missing"
4. Basic Mapping for Class and Method Levels
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api/users")
public class UserController {
    @GetMapping("/details/{userId}/{userName}")
    public String retrieveUserDetails(@PathVariable("userId") String userId, @PathVariable("userName") String userName) {
        return "ID: " + userId + ", Name: " + userName;
    }
}
Explanation:
- @RequestMapping("/api/users"): Sets /api/users as the base URL for all endpoints.
- @GetMapping("/details/{userId}/{userName}"): Maps GET requests to the /details/{userId}/{userName} endpoint.
Expected Output:
For a request to /api/users/details/123/john, the output would be: "ID: 123, Name: john"
5. Including Default Values for Path Variables
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
@RequestMapping("/api")
public class UserController {
    @GetMapping({ "/users/required", "/users/required/{userId}" })
    public String getUserById(@PathVariable(required = false) String userId) {
        if (userId != null && !userId.isEmpty()) {
            return "User ID: " + userId;
        } else {
            return "User ID is missing";
        }
    }
}
Explanation:
- @PathVariable(required = false): Makes the userId path variable optional. If not provided, a default message is returned.
Expected Output:
- For a request to /api/users/required/123, the output would be: "User ID: 123"
- For a request to /api/users/required, the output would be: "User ID is missing"
6. Creating a Default Value for @PathVariable
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.Optional;
@RestController
@RequestMapping("/api/users")
public class UserController {
    @GetMapping({ "/default/optional", "/default/optional/{id}" })
    public String fetchUserWithOptionalId(@PathVariable Optional<String> id) {
        return id.map(value -> "User ID: " + value)
                 .orElse("User ID: Default User");
    }
}
Explanation:
- @PathVariable Optional<String> id: Uses Optional to handle the presence or absence of the path variable id. If id is not present, a default value is used.
Expected Output:
- For a request to /api/users/default/optional/123, the output would be: "User ID: 123"
- For a request to /api/users/default/optional, the output would be: "User ID: Default User"
