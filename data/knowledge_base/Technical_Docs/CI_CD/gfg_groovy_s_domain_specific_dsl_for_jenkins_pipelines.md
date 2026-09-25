# Groovy's Domain-Specific Language (DSL) for Jenkins Pipelines

> Source: https://www.geeksforgeeks.org/devops/groovys-domain-specific-language-dsl-for-jenkins-pipelines

In CI/CD software development practice, Jenkins is well known powerful automation server which is developed on Java platform. This article provides knowledge of the most useful features of defining build pipelines via Groovy Domain-Specific Language (DSL) and launching it on localhost server. This post explores the basics for Groovy's DSL related to Jenkins pipelines, so you can easily understand even if your are newcomer or developer with some experience.
What is Groovy's Domain-specific Language (DSL)
The package then scans your Groovy source, and specifically looks for classes defining a Domain-specific Language (a DSL is just an expressive syntax to describe domain logic or configuration). Groovy is a dynamic language which runs on the Java Platform and has huge support for building up your own Domain Specific Languages (DSLs) by its concise, natural syntax, integrated meta-programming features and excellent interoperability with java.
Wrapping Up Groovy DSLs are a great way to simplify and clean up the definition of domain-specific logic as well as configuration in so many use-cases.
What is Jenkins Pipeline
Pipeline (Jenkins Pipeline) is a suite of plugins which supports implementing and integrating continuous delivery pipelines into Jenkins. A way to define a sequence of automated steps that are going to lead the delivery of software allowing, Continuous Integration and Continuous Delivery (CI/CD). Jenkins Pipelines are defined using a domain-specific language (DSL) based on Groovy, which gives you more flexibility to define complex build, test and deployment workflows.
What are the Primary Terminologies
- Jenkins Pipeline: Jenkins Pipeline has a set of plugins that supports implementing and integrating continuous delivery pipelines into Jenkins. It extends certain best practices by allowing you to process, test and deploy the script into your build. Groovy is an object-oriented programming platform for the Java language.
- Groovy: We know groovy as object-oriented programming language for the Java platform. Jenkins Pipelines use it to write scripts that describes the steps and sequence of your CI/CD process.
- Scripted Pipeline: A Scripted Pipeline is a general-purpose language that offers all the feature you need to implement continuous delivery pipeline as code. Great for complicated computations and scripting functionality
- Declarative Pipeline: The structure of a Declarative Pipeline is more clearly defined, faster to write and easier for everyone involved in the development process - from Developers to System Administrators! It is intended to cover most common use-cases with a simple syntax that does not require knowledge of Groovy deep API.
- Stages and Steps:
  - Stages: Logical divisions within the pipeline, such as “Build,” “Test,” and “Deploy.”
  - Steps: Individual tasks within a stage, like running a shell command or checking out code from a repository.
Step-by-Step Process for Jenkins Pipelines
Creating a Simple Declarative Pipeline
Step 1: Open Jenkins Dashboard
- Go to the Jenkins dashboard and create a new pipeline job.
Step 2: Define the Pipeline Script
- select the “Pipeline script” option in the pipeline configuration and start writing your pipeline code.
Step 3: Example Pipeline Script (Note*: following code is groovy (DSL))
pipeline {
agent any
stages {
stage('Build') {
steps {
echo 'Building...'
// Add build steps here
}
}
stage('Test') {
steps {
echo 'Testing...'
// Add test steps here
}
}
stage('Deploy') {
steps {
echo 'Deploying...'
// Add deployment steps here
}
}
}
}
Step 4: Save and Run
- Save the pipeline script and run the job.
What is Scripted and Declarative Pipelines
Scripted vs. Declarative Pipelines
Scripted Pipeline: Groovy-based DSL called Scripted Pipelines, offers tremendous power and flexibility for our CI/CD workflows. One of the best use case can be for complex tasks that you need well coded script to do it.
- Scripted Pipeline Example (Note*: following code is groovy (DSL)):
node {
stage('Build') {
echo 'Building...'
// Add your build steps here
}
stage('Test') {
echo 'Testing...'
// Add your test steps here
}
stage('Deploy') {
echo 'Deploying...'
// Add your deployment steps here
}
}
Declarative Pipeline: Declarative Pipelines provide a slightly more opinionated DSL on top of the Pipeline and are intended to offer a simplified, common approach for performing continuous delivery. These would allow you to cover most of the use cases, without using much deep groovy knowledge.
- Declarative Pipeline Example (Note*: following code is groovy (DSL)):
pipeline {
agent any
stages {
stage('Build') {
steps {
echo 'Building...'
// Add your build steps here
}
}
stage('Test') {
steps {
echo 'Testing...'
// Add your test steps here
}
}
stage('Deploy') {
steps {
echo 'Deploying...'
// Add your deployment steps here
}
}
}
}
Conclusion
In summary, the Groovy DSL for Jenkins Pipelines offers a very powerful way to define your CI/CD workflow. You can manage that by code according to your pipeline requirement — Scripted Pipeline or Declarative Pipelines. Using Jenkins Pipelines allows you to standardize your development workflows and facilitate communication between teams. Happy coding!
