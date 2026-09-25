# Spring Cloud Contract

> Source: https://www.geeksforgeeks.org/advance-java/spring-cloud-contract

Spring Cloud Contract is a framework that supports Consumer-Driven Contract (CDC) testing in Spring-based microservices applications. It enables developers to define and verify contracts between service providers and consumers, ensuring that services communicate correctly and consistently. By automating contract testing, Spring Cloud Contract helps reduce integration failures and improves the reliability of distributed systems.
- Enables automated contract verification between microservices.
- Supports both producer-side and consumer-side testing.
- Helps detect API compatibility issues early in the development lifecycle.
Consumer-Driven Contract (CDC)
Consumer-Driven Contract (CDC) is an approach where the consumer service defines the expected behavior of the provider service. The provider then verifies that it fulfills the consumer's expectations. This ensures that changes in one service do not break communication with another service.
Real world Example: if a User Service consumes data from an Order Service, the User Service can define a contract specifying the expected request and response structure. The Order Service verifies this contract during testing.
Banefits
- Reduces integration failures between microservices.
- Ensures API compatibility between providers and consumers.
- Automates contract verification and testing.
- Supports independent development and deployment.
- Improves confidence in distributed systems.
How Spring Cloud Contract Works
Spring Cloud Contract follows a producer-consumer model:
- The consumer defines the expected contract.
- The producer implements the API.
- Spring Cloud Contract generates tests automatically.
- The generated tests verify whether the producer satisfies the contract.
- Verified contracts can then be shared with consumers.
Steps used to configure Spring Cloud Contract
Step 1: Add Dependencies
We may include the Spring Cloud Contract Verifier dependency and plugin in our build file, as shown in the following example:
<dependency>
    <groupId>org.springframework.cloud</groupId>
    <artifactId>spring-cloud-starter-contract-verifier</artifactId>
    <scope>test</scope>
</dependency>
Step 2: Specify the Base Test Class
The following example from pom.xml demonstrates how to provide the basic test class.
<build>
    <plugins>
        <plugin>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-contract-maven-plugin</artifactId>
            <version>3.1.2.RELEASE</version>
            <extensions>true</extensions>
            <configuration>
                <baseClassForTests>com.example.contractTest.BaseTestClass</baseClassForTests>
            </configuration>
        </plugin>
        <plugin>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-maven-plugin</artifactId>
        </plugin>
    </plugins>
</build>
Step 3: Include a Basic Class in the Package
This test class creates a mock environment and a Spring context for testing a Spring Boot application. It sets up the required configuration for the tests to function properly and initializes a controller for testing.
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.contract.verifier.messaging.boot.AutoConfigureMessageVerifier;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.test.web.servlet.setup.StandaloneMockMvcBuilder;
import io.restassured.module.mockmvc.RestAssuredMockMvc;
import com.example.controllers.EvenOddController;
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@DirtiesContext
@AutoConfigureMessageVerifier
public class YourNewTestClass {
    @Autowired
    private EvenOddController evenOddController;
    @Before
    public void setup() {
        StandaloneMockMvcBuilder standaloneMockMvcBuilder 
          = MockMvcBuilders.standaloneSetup(evenOddController);
        RestAssuredMockMvc.standaloneSetup(standaloneMockMvcBuilder);
    }
}
Step 4: Configure the Consumer – Client Side
To preserve the contract, the consumer side of our CDC will consume stubs created by the producer side via HTTP interaction; hence, any modifications on the producer side will break the contract.
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;
@RestController
public class NewMathController {
    @Autowired
    private RestTemplate newRestTemplate;
    @GetMapping("/calculate")
    public String checkOddAndEven(@RequestParam("number") Integer number) {
        HttpHeaders httpHeaders = new HttpHeaders();
        httpHeaders.add("Content-Type", "application/json");
        ResponseEntity<String> responseEntity = newRestTemplate.exchange(
          "http://localhost:8090/validate/prime-number?number=" + number,
          HttpMethod.GET,
          new HttpEntity<>(httpHeaders),
          String.class);
        return responseEntity.getBody();
    }
}
Step 5: Available stubs information
Now set up stub runner, which will notify consumers about the available stubs in local Maven repository:
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.contract.stubrunner.spring.AutoConfigureStubRunner;
import org.springframework.cloud.contract.stubrunner.spring.StubRunnerProperties;
import org.springframework.http.MediaType;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
@RunWith(SpringRunner.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.MOCK)
@AutoConfigureMockMvc
@AutoConfigureJsonTesters
@AutoConfigureStubRunner(
  stubsMode = StubRunnerProperties.StubsMode.LOCAL,
  ids = "org.geeksforgeeks.spring.cloud:spring-cloud-contract-producer:+:stubs:8090")
public class NewMathControllerIntegrationTest {
    @Autowired
    private MockMvc newMockMvc;
    @Test
    public void given_WhenPassEvenNumberInQueryParam_ThenReturnEven()
      throws Exception {
 
        newMockMvc.perform(MockMvcRequestBuilders.get("/calculate?number=2")
          .contentType(MediaType.APPLICATION_JSON))
          .andExpect(status().isOk())
          .andExpect(content().string("Even"));
    }
}
After successful contract verification, Spring Cloud Contract automatically generates stubs that simulate the provider service behavior. These stubs allow consumers to perform testing without requiring the actual provider service to be running.
Advantages of Spring Cloud Contract
- Supports Consumer-Driven Contract testing.
- Automatically generates verification tests.
- Automatically generates service stubs.
- Detects API compatibility issues early.
- Reduces dependency on fully deployed environments.
Limitations of Spring Cloud Contract
- Initial setup can be complex for beginners.
- Requires maintaining contract files.
- Adds additional build time.
- May increase maintenance effort in large projects.
