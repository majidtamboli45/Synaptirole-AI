# @PostMapping and @GetMapping Annotation

> Source: https://www.geeksforgeeks.org/advance-java/spring-postmapping-and-getmapping-annotation/

In Spring Boot, @GetMapping and @PostMapping are annotations used to handle HTTP requests in Spring MVC controllers. They help map specific HTTP methods to controller methods when building REST APIs.
- @GetMapping is used to retrieve data from the server.
- @PostMapping is used to send data to the server to create a new resource.
@PostMapping
@PostMapping in Spring MVC is used to handle HTTP POST requests in RESTful web services. It maps a specific URL to a handler method that processes data sent from the client, typically through the request body.
- Used to create or submit data to the server.
- Data is usually received in the request body (e.g., JSON or form data).
Example 1:
import org.springframework.web.bind.annotation.*;
@RestController
public class StudentController {
    @PostMapping("/addStudent")
    public String addStudent(@RequestBody String name) {
        return "Student " + name + " added successfully!";
    }
}
Explanation: the addStudent method is annotated with @PostMapping. It handles HTTP POST requests sent to the /addStudent URL. The student name is passed in the request body and processed by the method.
Example 2:
import org.springframework.web.bind.annotation.*;
@RestController
public class StudentController {
    @PostMapping("/students/{id}")
    public String updateStudent(@PathVariable int id, @RequestBody Student student) {
        return "Student with ID " + id + " updated successfully!";
    }
}
Explanation: the updateStudent method is annotated with @PostMapping. It handles POST requests sent to the /students/{id} URL. The student ID is received as a path variable, and the updated student object is passed in the request body.
GetMapping annotation
@GetMapping in Spring is used to handle HTTP GET requests in RESTful web services. It maps a specific URL to a controller method that retrieves data from the server.
- Used to retrieve or read data from the server.
- Parameters are usually passed through URL path variables or query parameters.
Examples of @GetMapping annotation
Example 1:
@GetMapping("/students")
public List<Student> getAllStudents() {
 return studentRepository.findAll();
}
Explanation: getAllStudents method is annotated with @GetMapping annotation. This means that getAllStudents method will be called when an HTTP Get request is received at the /students URL.
Example 2:
@RestController
public class StudentController {
    @GetMapping("/students/{rollNo}")
    public String getStudent(@PathVariable int rollNo) {
        return "Details of student with Roll No: " + rollNo;
    }
}
Explanation: the getStudent method is annotated with @GetMapping. It handles HTTP GET requests sent to the /students/{rollNo} URL. The roll number is passed as a path variable to fetch the student details.
@PostMapping Vs @GetMapping Annotation
| Feature | @GetMapping | @PostMapping | 
|---|---|---|
| HTTP Method | Handles GET requests | Handles POST requests | 
| Purpose | Used to retrieve data from the server | Used to send data to the server (create/update) | 
| Data Location | Data is passed through URL parameters / query strings | Data is sent in the request body | 
| Effect on Server | Does not modify server data | May modify or create server data | 
| Common Use Case | Fetching records, loading pages, reading APIs | Form submissions, creating resources in APIs |
