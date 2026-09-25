# What Is JaCoCo Plugin In Jenkins?

> Source: https://www.geeksforgeeks.org/devops/what-is-jacoco-plugin-in-jenkins

The name JaCoCo stands for Java code coverage it will help the developers measure, while testing the code, how much code was executed during the testing of the code. The code that is measured using jaCoCo Plugin is known as code coverage The higher code coverage indicates that a greater portion of your code is being tested.
What is the Jenkins JaCoCo Plugin?
The Jenkins jaCoCo plugin is mainly used in Jenkins for the code coverage of Java applications. It will be integrated with Jenkins's continuous integration and delivery (CI/CD).
The JaCoCo plugin will help in software development by measuring the percentage of code that is executed during automated tests. By which an organization can identify the areas of the code to improve test coverage and ensure the reliability and quality of their software.
Advantages Of JaCoCo Plugin
1. Code Coverage Metrics
Jenkins JaCoCo Plugin can be integrated with the Jenkins pipelines, where you can automate the build and test processes. This will ensure that the code coverage metrics are collected consistently and automatically with every build. This integration will help in tracking how much code is tested, which will make it easier to identify areas that need more testing. Additionally, it will also contribute to maintaining a reliable and high-quality codebase over time.
2. Quality Improvement
The JaCoCo plugin will help the developers analyze areas where testing was done. This information can be used further to maintain the quality of the code and also helps testers where they need to focus.
3. Integration with Jenkins Pipelines
Jenkins pipelines can be configured to use the JaCoCo Plugin as part of the automated build and test processes. This ensures that code coverage metrics are collected consistently and automatically during each build.
4. Report Generation
Jenkins will generate detailed HTML and XML reports based on the data collected during the build process in Jenkins. This will give DevOps engineers and testers a clear and visual representation of code coverage.
Complete Guide To Configure Jenkins JaCoCo Plugin
Step 1: First you need to configure the jaCoCo plugin in the jenkins for that click on manage jenkins.
Step 2: After clicking on the manage jenkins it will takes you to next page there click on manage plugins.
Step 3: After that click on the avalible plugins and search for the jacoco plugin. Select the plugin and click on the install without restart then it will start install the plugins.
Step 4: Plugin will be installed and it will be ready to use.Hence you have been selected install without restart your plugin will be installed and tyhe jenkins will not be restarted and it will not effect any of the proceses in the application.
Complete Guide Integrate JaCoCo Plugin With Your Jenkins Project
Follow the steps mentioned below to integrate the plugin with your jenkins project.
Step 1: Go to the project section and select the project which you want to integrate the the plugin with. Here i am using the jenkins freestyle project so scroll down to the last section of the project there you will find the "Add post build aztion",As shown in the image below.
Step 2: Once you click on the add post build action there you will find an option called "Record Jacoco Coverage Report" you will find this option when and only you configure the plugin in the jenkins by following the steps mentioned above.
Step 3: After that you will find an section where you need to fill all the the threshhold value. This value will helps you to coverage the code quality to the "80%". If the code was not reaching this level the build will automatically fail and it will generates complete report of the placeses you need to concentrate.
In the above image you can see that we are selecting the option called "Fail the build if coverege degrades more than the delta thresholds" the build will fail if the code quality was not reaching the threshholds value and also we have selected change "build status according to the defined thresholds".
Step 4: You can see the console output where it will mentions the build failed reason was jacoco plugin.
Step 5: Jacoco plugin also generate the complete report on the code quality like called "coverage report" you can see the complete report of the code where the developers can concentrate more.
By the steps all the mentioned above you can configure the JaCoCo plugin and integrate with any of your jenkins projects.
How to add JaCoCo plugin to Maven?
Adding the JaCoCo plugin to your Maven project allows you to generate code coverage reports, which is helpful for understanding how much of your code is being exercised by your tests.
<plugin>
<groupId>org.jacoco</groupId>
<artifactId>jacoco-maven-plugin</artifactId>
<version>0.8.7</version> <executions>
<execution>
<id>prepare-agent</id>
<goals>
<goal>prepare-agent</goal>
</goals>
</execution>
<execution>
<id>report</id>
<phase>verify</phase>
<goals>
<goal>report</goal>
</goals>
</execution>
</executions>
</plugin>
In the <build> section of your pom.xml file, add the following snippet within the <plugins> tag.
Conclusion
To sum up, the JaCoCo Plugin for Jenkins is a useful solution which is easily attaches to Jenkins projects, improving the Java-based projects' continuous integration and delivery (CI/CD) procedure. This plugin makes it easier to automatically gather code coverage numbers at build time, giving you insight into how well-automated tests are working. It helps developers to determine which parts of the codebase need more testing by producing comprehensive reports that include data on line and branch coverage.
