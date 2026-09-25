# Difference Between Jenkins and Bamboo

> Source: https://www.geeksforgeeks.org/devops/difference-between-jenkins-and-bamboo/

Pre-requisite: Jenkins
If you are thinking of building software, you can use tools like Jenkins and Bamboo made just for it. Imagine you push new code to Git, and without any manual steps, your application gets tested and deployed to staging. That’s the power of CI/CD tools. Jenkins and Bamboo are two popular choices, but they work in different ways and suit different teams.
Jenkins is a free, open-source tool with a massive plugin library that gives you lots of flexibility, but it often needs more setup and maintenance. Bamboo, created by Atlassian, is more user-friendly and works smoothly with tools like Jira and Bitbucket, but it comes with a cost. In this article, we’ll break down their key differences so you can pick the right one for your workflow.
What is Jenkins?
It is the best tool in the software industry as it is an open-source continuous integration server that is extendable. It can be integrated with every type of automation solution. It was never designed for cloud deployment. Basically, it was developed to support Kubernetes. Companies that use this software are Facebook, Delivery Hero, Instacart, LinkedIn, and many more.
Features of Jenkins
The following are the features of Jenkins:
- Easy customization and highly extensible.
- Security features like authentication, authorization, and encryption of sensitive information.
- Support for large teams and complex projects.
- Unlimited plugin support
Advantages of Jenkins
Some of the advantages of Jenkins are:
- Its User Interface is quite attractive.
- It has complete control of the workspace
- Various languages are supported in this tool.
- The developer community is at its best.
Disadvantages of Jenkins
The following are the some disadvantages of using Jenkins:
- Setting up small projects is manual.
- It does not provide analytics.
- It was not designed for cloud deployment.
- Every plugin is not compatible with this tool.
What is Atlassian Bamboo?
Bamboo is a continuous integration (CI) server. It was developed in 2007 by Atlassian and is built in Java programming language. Developers can use it as a platform to combine their code changes, develop and evaluate applications, and then provide the finished products in various environments. It is able to adapt to different development workflows as it supports a vast variety of programming languages, version control systems, and build tools. Companies that use this software are SparkPost, Armut, AIA Singapore, and many more.
Architecture of Atlassian Bamboo
Plans include stages, stages include jobs, and jobs contain tasks in the standard flow of execution in Bamboo. Once a plan is triggered, Bamboo executes each stage in turn, completing the jobs within each stage. Finally, each job consists of one or more tasks that are carried out in sequence.
- Plans: A plan is an implementation of a CI/CD pipeline for a specific software project. It specifies the sequence in which different tasks and phases must be completed so as to create, test, and deploy the application. In a version control repository, a plan often relates to a branch or specific configuration.
- Stages: Within a plan, a stage is a logical arrangement of related tasks. It helps in streamlining and illustrating the many pipeline procedures. The outcomes of one step are used as the input for the next one and is carried out progressively. Build, test, deploy, and release are common phrases.
- Jobs: A job indicates a specific assignment or set of duties that must be carried out during a stage. Within a stage, jobs can be parallelized for faster completion and higher efficiency. Each job often corresponds to a particular build, test, or deployment operation, such as coding, testing, or distributing artifacts to a specific environment.
- Tasks: The smallest executable elements within a job are called tasks. They represent specific duties that are carried out as a component of the whole job. Bamboo has a variety of built-in actions, including running tests, executing scripts, packaging artifacts, and deploying to specific platforms. Bamboo further enables the creation and pipeline integration of customizable work.
Features of Atlassian Bamboo
The following are the features of atlassian bamboo:
- Support for Docker
- Customizable workflows
- Easy integration with other Atlassian tools
- Built-in support for multiple code branches
Advantages of Atlassian Bamboo
The following are the advantages of using atlassian bamboo:
- It has professional technical support.
- It has an automated integration facility.
- Agents can run on multiple machines.
- It has specific language support for Ruby.
Disadvantages of Atlassian Bamboo
The following are the disadvantages of atlassian bamboo:
- As it is not open-source software, so one needs to pay for using it.
- It has limited options available in terms of Operating systems.
- It has limited integration with non-Atlassian tools.
- Developers need to invest time to learn it.
- Less number of plugins are available.
Difference between Jenkins and Bamboo
The following table helps you in understanding the key differences between Jenkins and Bamboo:
| Parameters | Jenkins | Bamboo | 
|---|---|---|
| Developed | It was developed in 2011. | It was developed in 2007. | 
| Open Source | It is open-source software. | It is not open-source software. | 
| User Interface | Its User Interface is quite attractive. | Its User Interface is not attractive. | 
| Installation | Installation is simple. | Installation is quite complicated. | 
| Browsers | This software is compatible with Chrome and Firefox. | This software is compatible with Chrome, Firefox, Microsoft Edge, and Safari. | 
| Operating Systems | It has support for Windows, Ubuntu, Red Hat, and Mac OS. | It has support for Windows, Linux, and Solaris operating systems. | 
| Pricing | It is free of cost to use as it is open-source software. | It provides free trials for 30 days and then it costs $1200/remote agent. | 
| Community Support | The community support of Jenkins is great. | Community support for Bamboo is not high in | 
| Plugins | Many plugins are supported by Jenkins. | Less a number of plugins in comparison with Jenkins supported by Bamboo. | 
Jenkins or Bamboo- Which is preferred?
Jenkins is the leading open-source continuous integration server but bamboo has in-built features which make it easy to use for the user. One could opt for Jenkins as it is open-source software and also has great community support but is only compatible with Chrome and Firefox whereas Bamboo is compatible with Chrome, Firefox, Microsoft Edge, and Safari. If a user already uses other Atlassian tools, wants a user-friendly web interface, or wants built-in deployment and release management functionality, Atlassian Bamboo may be opted for. These two tools are having their own pros and cons. In the end, it is all up to the user's choice to choose which tool according to their own requirement.
Conclusion
Both Jenkins and Bamboo are great tools for automating your software build, test, and deployment process. If you want a free and flexible tool with strong community support, Jenkins is a great choice. It needs more setup but gives you full control. If you prefer a tool that’s easy to use and works well with Atlassian tools like Jira and Bitbucket, Bamboo might be better even though it will charge you. In the end, pick the one that fits your team’s needs, budget, and tools you already use.
