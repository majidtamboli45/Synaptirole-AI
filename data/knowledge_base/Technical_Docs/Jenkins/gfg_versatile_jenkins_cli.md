# Versatile Jenkins CLI

> Source: https://www.geeksforgeeks.org/devops/project-idea-versatile-jenkins-cli/

Project Title: Versatile Jenkins CLI
Introduction: 
Jenkins is a self-contained, open source automation server which can be used to automate all sorts of tasks related to building, testing and delivering or deploying software.
The objective of this article is to create a user-friendly CLI without any external dependencies for implementing the basic features of Jenkins. It uses the Linux style of commands to operate the following features.
- Saving the configuration file
- Listing all the jobs for a particular credential
- Building a particular job (both parameterized and unparameterized)
- Build History for a Particular job
- Displaying the output console for a particular job and a specific build number.
- Jenkins Software
- Pylint for improving the performance and documentation of Python Script
- Jenkins HTTP API
- Unit test cases: To check the corner cases and versatility of a particular function.
- Curl Command: To check the correctness and validity of a particular API
-  Saving the configuration file:
   Jenkins-URL + "/job/" + JOBName + "/config.xml"
- 
 Listing Jobs:
    Jenkins-URL+ "/api/json?tree=jobs[name]"
-  Building a Job:
  -  Unparameterised Job:
        Jenkins-URL + "/job/" + JOBName + "/build"
  -   Parameterised Job:
         Jenkins-URL + "/job/" + JOBName + "/buildWithParameters?" + parametervalue
-  Unparameterised Job:
        
-  Build History:
         Jenkins-URL + "/job/" + JOBName + "/api/json?tree=allBuilds[*]"
-  Displaying Output Console For a Particular Job:
   Jenkins-URL + "/job/" + JOBName + "/" + BuildNumber + "/logText/progressiveText?start=0"
- Github Repository Link: https://github.com/viralivora/Jenkins-CLI
-  Research work done:
  - Learning about Jenkins API as the API's are not well documented.
  - Going through HTTP Protocols and HTTP RFC's
  - Curl Commands
