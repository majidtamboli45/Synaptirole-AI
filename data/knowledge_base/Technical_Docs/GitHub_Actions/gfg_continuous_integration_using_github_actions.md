# Continuous Integration Using GitHub Actions

> Source: https://www.geeksforgeeks.org/springboot/spring-boot-continuous-integration-using-github-actions

Let's say we have two or more developers who are merging code into a single repository. There can be issues in merging code from different developers. So the Continuous Integration tools help in solving not just that but many other things like:
- Run an automated build after successful merging (like build, test code coverage, etc.).
- We can also automate deployment after proper checks.
- Not just that, these platforms also provide a way to communicate with others with comments to let's say, solve a merging conflict or review a pull request.
- It also helps in running it on different OS.
One of the tools that we will be using here is GitHub Actions to accomplish our CI workflow. It is a powerful tool that can be utilized for continuous deployment as well.
Prerequisites:
- Keep IntelliJ Community(or related IDE)
- GitHub account
- JDK 11 and gitbash (or a related tool to push code)
Step-by-Step Implementation
Step 1: Let's create a basic Spring boot project first
a). Go to https://start.spring.io/
- Project: Maven | Language: Java | Spring Boot: 2.7.14
- Project Metadata:
- Group: com.example | Artifact: demo-springgithubactions | Name: demo-springgithubactions
- Description: Demo project for Spring Boot with GitHub actions
- Package name: com.example.demo-springgithubactions
- Packaging: Jar | Java: 11 | Dependencies: Spring Web
b). Open in IntelliJ. Run the following command in the terminal
./mvnw clean install
c). Create following folders (....\demo-springgithubactions\.github\workflows\build.yml) and file (build.yml) which will be detected and used by github to run workflows using github actions.
d). Update the file with following code
name: Build a JAR in spring boot using springboot
on:
  push:
    branches:
      - master
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Check out code
        uses: actions/checkout@v2
      - name: Set up JDK 11
        uses: actions/setup-java@v1
        with:
          java-version: '11'
      - name: Build with Maven
        run: mvn clean install
      - name: Upload artifact for deployment job
        uses: actions/upload-artifact@v2
        with:
          name: java-app
          path: '${{ github.workspace }}/target/*.jar'
      - name: Run Tests
        run: mvn test
e). Create following folders (....\src\main\java\com\example\demospringgithubactions\controller\HelloWorld.java) and file (HelloWorld.java). 
f). Update the file with following code.
package com.example.demospringgithubactions.controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
@RestController
public class HelloWorld {
    @GetMapping 
    public String hello()
    {
        return "<!DOCTYPE html>\n"
            + "<html>\n"
            + "<head>\n"
            + "<style>\n"
            + "h1 {text-align: center;}\n"
            + "</style>\n"
            + "</head>\n"
            + "<body>\n"
            + "\n"
            + "<h1>Yaay!! you did it XD</h1>\n"
            + "\n"
            + "</body>\n"
            + "</html>\n";
    }
}
g). Create following folders
(....\src\test\java\com\example\demospringgithubactions\DemoSpringgithubactionsApplicationTests.java) and file (DemoSpringgithubactionsApplicationTests.java).
h). Update the file with following code.
package com.example.demospringgithubactions;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import com.example.demospringgithubactions.controller.HelloWorld;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
@RunWith(SpringRunner.class)
@WebMvcTest(HelloWorld.class)
class DemoSpringgithubactionsApplicationTests {
    @Autowired
    private MockMvc mockMvc;
    @Test
    public void checkSuccessMessage() throws Exception
    {
        this.mockMvc
            .perform(get("/"))
            .andExpect(status().isOk())
            .andExpect(content().string(
                containsString("Yaay!! you did it XD")));
    }
}
i). Run the code and verify if you are able to hit "http://localhost:8080/" end point with message dispalyed "Yaay!! you did it XD".
Step 2: Let's push our code to GitHub
git init
git add -A
git commit -m 'Added my project'
git remote add origin <github-ssh-url>
git push -u -f origin main
