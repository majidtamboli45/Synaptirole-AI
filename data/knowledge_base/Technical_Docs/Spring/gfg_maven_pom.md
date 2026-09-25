# Maven POM

> Source: https://www.geeksforgeeks.org/advance-java/maven-pom/

POM stands for Project Object Model. The pom.xml file is the core configuration file of a Maven project. It defines project metadata, dependencies, plugins, and build configurations required to compile, test, package, and deploy the application.
A properly structured POM file ensures consistent builds and dependency management across environments.
Why pom.xml Is Used in Maven
The pom.xml file is used because it acts as the single source of truth for a Maven project. It tells Maven what the project is, how it should be built, and which dependencies it needs.
Key Reasons for Using pom.xml
- Centralized Project Configuration: All project metadata, dependencies, plugins, and build settings are defined in one file.
- Automatic Dependency Management: Maven downloads and manages required libraries (and their transitive dependencies) automatically.
- Consistent Builds Across Environments: Ensures the same build behavior on different machines, CI pipelines, and production servers.
- Standardized Build Lifecycle: Controls phases like compile, test, package, install, and deploy without custom scripts.
- Easy Version Control and Maintenance: Dependency versions and plugin configurations can be updated in one place using properties.
- Support for Multi-Module Projects: Enables parent–child POMs for managing large, modular applications.
Basic pom.xml Structure
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>com.geeks</groupId>
    <artifactId>spring-gateway-security</artifactId>
    <version>1.0-SNAPSHOT</version>
    <properties>
        <java.version>17</java.version>
        <spring-boot.version>3.2.0</spring-boot.version>
    </properties>
    <dependencies>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-gateway</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-security</artifactId>
        </dependency>
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-test</artifactId>
            <scope>test</scope>
        </dependency>
    </dependencies>
    <build>
        <plugins>
            <plugin>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-maven-plugin</artifactId>
            </plugin>
        </plugins>
    </build>
</project>
Maven POM Workflow
- Initialization: Maven reads the pom.xml and initializes the project.
- Dependency Resolution: Downloads all defined dependencies from repositories.
- Build Lifecycle Execution: Runs phases like compile, test, package, and verify.
- Plugin Execution: Executes plugin goals such as code compilation, testing, and analysis.
- Packaging: Generates JAR/WAR/EAR files as defined in the POM.
- Deployment: Uploads the final artifact to a remote repository or server.
Major Sections of pom.xml
1. Project Information (<project>)
This is the root element of the POM file. It contains all project-related metadata and configuration used by Maven to manage the build process.
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
         http://maven.apache.org/xsd/maven-4.0.0.xsd">
2. Project Coordinates
Defines unique identifiers for your project in a Maven repository.
<groupId>com.geeks</groupId>
<artifactId>maven-pom-example</artifactId>
<version>1.0-SNAPSHOT</version>
- groupId: Usually your organization’s domain in reverse.
- artifactId: Project or module name.
- version: Current version of the project.
3. Properties Section
Defines reusable variables to maintain consistency and simplify version updates.
<properties>
    <java.version>1.8</java.version>
    <selenium.version>4.6.0</selenium.version>
    <testng.version>7.4.0</testng.version>
</properties>
Using ${property.name} lets you reference these values across the file.
4. Dependencies Section
Lists all external libraries your project depends on. Maven automatically downloads them from configured repositories.
<dependencies>
    <dependency>
        <groupId>org.seleniumhq.selenium</groupId>
        <artifactId>selenium-java</artifactId>
        <version>${selenium.version}</version>
    </dependency>
</dependencies>
Each dependency includes:
- groupId: Library’s organization.
- artifactId: Library name.
- version: Library version.
5. Repositories Section
Defines remote repositories from where Maven retrieves dependencies.
<repositories>
    <repository>
        <id>central</id>
        <url>https://repo.maven.apache.org/maven2</url>
    </repository>
</repositories>
If no repository is specified, Maven defaults to Maven Central.
6. Build Section
Controls how the project is compiled, packaged, and deployed.
<build>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-compiler-plugin</artifactId>
            <version>3.8.1</version>
            <configuration>
                <source>${java.version}</source>
                <target>${java.version}</target>
            </configuration>
        </plugin>
    </plugins>
</build>
- Plugins: Define build tools such as compiler, JAR packager, or reporting tools.
- Configuration: Customizes how each plugin behaves.
7. Profiles Section
Allows defining environment-specific configurations such as development, testing, or production.
<profiles>
    <profile>
        <id>dev</id>
        <properties>
            <environment>development</environment>
            <debug>true</debug>
        </properties>
    </profile>
</profiles>
Activate profiles using:
mvn clean install -Pdev
8. Plugin Management Section
Defines default versions and configurations of plugins to ensure consistency across modules.
<pluginManagement>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-dependency-plugin</artifactId>
            <version>3.1.2</version>
        </plugin>
    </plugins>
</pluginManagement>
9. Reporting Section
Specifies plugins used to generate reports like Javadoc or test coverage.
<reporting>
    <plugins>
        <plugin>
            <groupId>org.apache.maven.plugins</groupId>
            <artifactId>maven-site-plugin</artifactId>
            <version>3.9.1</version>
        </plugin>
    </plugins>
</reporting>
