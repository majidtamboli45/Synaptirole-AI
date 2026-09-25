# Difference Between GitLab CI and Jenkins

> Source: https://www.geeksforgeeks.org/devops/difference-between-gitlab-ci-and-jenkins/

In the modern era, online platforms are in use at a very high rate. As the competition is very high in the market to release good and regular updates over online services or products, there is an urgent need for Continuous Integration (CI) and Continuous Development (CD) in the software development process. These help the engaging audience to use software applications by adding features from time to time. Both Jenkins and GitLabs are open-source CI/CD servers that enable automation for various stages of software development, testing, and deployment.
What is GitLab?
Gitlab is an open-source, and CI/CD tool. It supports a complete DevOps platform, providing end-to-end DevOps capabilities, and enables firms to collaborate with members across teams working on all project-related tasks such as project planning, code repository management, monitoring, and security.
Advantages:
- It allows parallel job execution.
- It supports a directed acyclic graph.
- Creating new jobs and handling conflicts is easy.
- Excellent security and privacy policies
Disadvantages:
- Artifacts need to be uploaded manually.
- Artifacts need to be downloaded for each job.
- It does not support the phases.
What is Jenkins?
Jenkins is considered to be the best build tool in the software industry as it is an open-source continuous integration server that is extendable. It makes it possible to integrate every type of automation solution.
Advantages:
- A huge plugin library is available.
- Self-hosted
- It has complete control of the workspace
- Various languages are supported.
Disadvantages:
- Setting up small projects is manual.
- It does not provide analytics.
Difference Table
| Basis | Gitlab | Jenkins | 
|---|---|---|
| Application Performance Monitoring | Displays performance metrics for every single application. | This feature is not available. | 
| Language | Ruby | Java | 
| Plugins | Limited Plugins | More than 1800 plugins | 
| Prerequisites | Ruby, Go, Git, Node.js, and Redis should be installed | JRE should be installed | 
| Self-monitoring | Self-monitoring features are available that make overall programming easy in deployment and maintenance. | Jenkins has a self-monitoring feature but not like Gitlab. | 
| Performance Alert | Coders are allowed to create service-level alerts for any notification occurring event. | The feature is not available. | 
| Container Registry | It provides container for the registry for security in the case of the docker images. | It does not provide any kind of container for the registry. | 
| Dashboard | A single dashboard can be modified for each user based on the pipeline history and the current status of projects. | Jenkins partially supports continuous integration dashboard and continuous deployment dashboard features in projects. | 
| Development Process | GitLab CI helps in boosting the development process. | Plugins are used to boost the development process. | 
| Repositories | One can manage Git repositories with complete user control. | One can manage repositories but up to some extent only. | 
| Host | It is a Self-Hosted platform. | It is a Hosted-Internally platform. | 
Conclusion
Both Gitlab and Jenkins have their own advantages and disadvantages and is all up to the user which one to choose as per the requirement. However, one can choose Jenkins as it is quite flexible and only requires JRE installed whereas, if one wants support for SLA and project management features, then Gitlab is the preferred option to choose.
