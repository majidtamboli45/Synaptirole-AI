# Spinnaker vs Jenkins

> Source: https://www.geeksforgeeks.org/devops/spinnaker-vs-jenkins/

Both Spinnaker and Jenkins are CI/CD tools that add value to application delivery pipelines. Jenkins is for Continuous Integration and spinnaker is for Continuous Deployment. Jenkins is currently the most popular Continuous Integration Tool but both large and smaller organizations can benefit from Spinnaker’s automation.
Spinnaker
Spinnaker is an open-source continuous delivery platform. It has a range of cluster management and deployment management features, originally developed at Netflix. It enables IT teams to manage complex pipelines. It is a Continuous Deployment Tool that manages continuous deployment pipelines with multiple deployment strategies. For creating load balancers, resizing clusters, and rollbacks, it offers built-in support. It includes faster deployments, user confirmation when needed, and access control.
Advantages
- It is a free, open-source CD software platform.
- Google Cloud offers it as a built-in integration.
- It has an active community.
- It is suitable for both small and large-scale divisions.
- It supports a comprehensive set of cloud providers.
- It offers built-in deployment strategies like blue-green, canary, rolling updates, and Highlander.
Disadvantages
- The user interface is confusing sometimes.
- No option for authorization at the level of the pipeline.
- Integration with an external authentication mechanism is not an easy task.
- Authorization management is not easy.
- There is no support to deploy the artifacts without re-creating the servers.
Jenkins
Jenkins is considered to be the best build tool in the software industry as it is an open-source continuous integration server that is extendable. It makes it possible to integrate every type of automation solution. It was never designed for cloud deployment. Basically, it was developed to support Kubernetes.
Advantages
- A huge plugin library is available.
- It is self-hosted.
- It has complete control of the workspace
- Various languages are supported.
- It has great support from the developer community.
- It provides accurate data support to project management.
Disadvantages
- Setting up small projects is manual.
- It does not provide analytics.
- It was not designed for cloud deployment.
- The Jenkins tool is not easy to install and configure.
- This tool is not compatible with all plugins.
Difference between Spinnaker and Jenkins
| Parameters | Spinnaker | Jenkins | 
|---|---|---|
| Management | Designed for Continuous Delivery purposes only | Designed for Continuous Integration purposes only | 
| Dashboard | It provides dashboard support with all one feature. | It provides a dashboard feature through plugin installation. | 
| Reliability | It is reliable on continuous delivery. | It is reliable for continuous integration. | 
| Market Trend | It is used by entelo, Top Hat, LaunchDarkly, and Chime | It is used by big firms like Facebook. Netflix, Lyft. | 
| Integration tools | GitHub, Git, Docker, Slack, and Amazon EC2 | Slack, Datadog, BrowserStack, Azure DevOps, and Coveralls | 
| Alternatives | TeamCity, Bamboo, and Apache Maven. | Circle CI and Travis CI. | 
| Deployment | It is designed for cloud deployment purposes. | It is not designed for cloud deployment purposes. | 
| Suitability | Suitable for small and large-scale divisions. | Suitable for small divisions. | 
| Pipeline | This feature is cloud-centered for continuous delivery. | This feature is server-centered for continuous integration purposes. | 
Conclusion
Both Spinnaker and Jenkins are the best tools in their field but Spinnaker cannot replace Jenkins as a CI tool, though it can make the deployment to the cloud process much more straightforward. Both tools have their own pros and cons and are on the user to choose the tool as per their requirement.
