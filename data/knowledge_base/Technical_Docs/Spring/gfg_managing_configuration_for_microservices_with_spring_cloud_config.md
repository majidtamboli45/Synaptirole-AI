# Managing Configuration for Microservices with Spring Cloud Config

> Source: https://www.geeksforgeeks.org/advance-java/managing-configuration-for-microservices-with-spring-cloud-config/

Spring Cloud Config provides the centralized external configuration management system and it is designed to work well with modern microservices architectures. It is the part of larger Spring Config suite of the tools that aim to help the developers built the cloud-native applications.
Spring Cloud Config Server is the central place where all the configuration parameters of the applications are stored and maintained. It typically backend by the source control system like Git. It can serve the configuration across the multiple environments and applications.
Client microservices connect to the Config Server to fetch their configurations. This setup ensures all the configurations are centralized, version-controlled and maintained in the secure and efficient manner.
Key Terminologies:
- Config Server: A server in the Spring Cloud Config and its setup that can centralizes and manages all the configuration properties for the client applications.
- Config Client: The application that can fetches its the configuration from the Config Server using the Spring Cloud Config.
- @EnableConfigServer: This annotation can be used in Spring applications to designate them as the Config Server.
- Environment Repository: The storage system can be used by the Config Server to the hold and serve configuration properties and it is commonly backed by the Git repository.
- spring.config.import: The property in Spring Boot that can specifies the sources from which the application should import the additional configuration data of the Spring application.
Implementation of Managing Configuration for Microservices with Spring Cloud Config
Below are the implementations to manage configuration for Microservices with Spring Cloud Config.
Setup the Config Server
Step 1: Create the spring project using spring initializer and add the below required dependencies.
Dependencies:
- Spring Web
- Spring Dev Tools
- Lombok
- Spring Cloud Config
After creating the Spring project, the file structure will be like below image.
Step 2: Open the application.properties file and add the configuring the server port and git repository uri configuration of the application.
spring.application.name=config-server
server.port=8888
spring.cloud.config.server.git.uri=https://github.com/iammahesh123/spring-cloud-config-server
Git repository application.yml code:
user:
role: Admin
welcome:
message: Welcome to the Spring Cloud Config managed application!
Step 2: Open the main class, add the @EnableConfigServer to activate the Spring cloud config functionality of the application.
Go to src > main >java > org.example.configserver > ConfigServerApplication and put the below code.
package org.example.configserver;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;
@SpringBootApplication
@EnableConfigServer
public class ConfigServerApplication {
    public static void main(String[] args) {
        SpringApplication.run(ConfigServerApplication.class, args);
    }
}
Step 3: Run the application
Once the Spring project is completed and successfully runs as a Spring application, it will start at port 8888.
Setup the Client-application
Step 1: Create the spring project using spring initializer and add the below dependencies.
Dependencies:
- Spring Web
- Spring Dev Tools
- Lombok
- Spring Cloud Config Client
After creating the Spring project, the file structure will be like below:
Step 2: Open the application.properties file and add the configuring the server port and import git uri configuration
spring.application.name=client-application
spring.cloud.config.import=optional:configserver:http://localhost:8888
Step 3: Create the ConfigConsumer class.
Go to src > main >java > org.example.clientapplication > ConfigConsumer and put the below code.
package org.example.clientapplication;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
@Component
public class ConfigConsumer {
    @Value("${user.role}")
    private String userRole;
    @Value("${welcome.message}")
    private String welcomeMessage;
    // Getter methods
    public String getUserRole() {
        return userRole;
    }
    public String getWelcomeMessage() {
        return welcomeMessage;
    }
}
Step 4: Create the HomeController class.
Go to src > main >java > org.example.clientapplication > HomeController and put the below code.
package org.example.clientapplication;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class HomeController {
    @Value("${user.role}")
    private String userRole;
    @Value("${welcome.message}")
    private String welcomeMessage;
    @GetMapping("/config")
    public String getConfig() {
        return String.format("Role: %s, Message: %s", userRole, welcomeMessage);
    }
}
Step 5: Open the main class (No changes are required) and put the below code.
package org.example.clientapplication;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@SpringBootApplication
public class ClientApplication {
    public static void main(String[] args) {
        SpringApplication.run(ClientApplication.class, args);
    }
}
Step 6: Run the application
After the project completed, we will run this as a Spring Boot Application and it will start at port 8080.
Managing Configuration Testing API:
GET http://localhost:8080/config
Output:
This example demonstrates the implementation of the configuration for the microservices with Spring Cloud Config of the Spring Boot application.
