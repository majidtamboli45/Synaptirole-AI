# How To Customize Jenkins Functionality With Plugins ?

> Source: https://www.geeksforgeeks.org/devops/how-to-customize-jenkins-functionality-with-plugins/

Jenkins is an open-source tool used to automate the build, test, and deploy stages of software development. Jenkins provides many plugins to automate various stages of a CI/CD pipeline. In this guide, I will first discuss what Jenkins is. Then I will discuss what a plugin is and how they customize Jenkins functionality. After this, I will walk you through the different steps to customize Jenkins functionality with plugins. In this section, I will install a custom plugin to change the appearance of the Jenkins UI.
What is Jenkins?
Jenkins is an automation tool that automates the build, test, and deploy stages of a software development process. Developers write the new code and push all the changes to a version control system (like Github, Gitlab, etc.). The moment the new code is pushed to the version control system, Jenkins will automatically fetch the code, build it, and test it. If the new code is successfully integrated with the old code, then the build status will be successful; otherwise, the build status will fail. Based on build status, developers can know whether their code is properly working or not. The process of fetching, building, testing, and getting build status is automatic. This automation helps the developers fix errors quickly and add new features. Also, Jenkins provides a very user-friendly interface to configure and observe the pipelines. By automating the execution of various pipeline stages, Jenkins helps reduce any type of manual error occurrence and also helps improve efficiency. In summary, we can say Jenkins has become a very crucial tool for DevOps practices to accelerate software development lifecycles.
What is a plugin in Jenkins?
Jenkins plugins are extensions that provide additional features and capabilities to enhance the functionality of Jenkins. Users can choose any plugin from the available plugin section to do any specific task. Plugins help Jenkins integrate other external tools. For example, you can install the Prometheus plugin on Jenkins, which will help expose all the metrics of Jenkins. These exposed metrics can be used on the Prometheus server to scrape all the metrics of Jenkins, and later on, anyone can monitor the Jenkins metrics using Grafana. Jenkins also allows users to create their own custom plugins. Using plugins can automate various tasks on Jenkins. Plugins improve the detection of bugs and errors early in the development process, which increases the quality of the code. In summary, we can say plugins in Jenkins enable users to create more advanced CI/CD pipelines and automate various stages of the software development lifecycle.
Pre-requisites
Before moving on to the next section, make sure that you have installed Jenkins on your system. If not, then follow these detailed geeks for geeks articles to install Jenkins on your system.
- For Windows users : Installing Jenkins on Windows
- For Ubuntu users : How to Install and configure Jenkins on Debian Linux (Ubuntu/Kali/Mint)
Steps To Customize Jenkins Functionality With Plugins
Step 1: Open Jenkins dashboard and click manage Jenkins.
Step 2: Then click Plugins . Here you will find all the available plugins and installed plugins.
Step 3: In available plugins you can search any plugin you require . Here i will install a custom theme plugin Material Theme on Jenkins . This plugin will allow to customize Jenkins UI appearance.
Step 4: After successful installation of plugin Material Theme then move to manage Jenkins . Here you will see an Appearance section. Click this.
Step 5: Now you can select theme to change the appearance of Jenkins UI. After this you can apply and save the settings.
Conclusion
Here in this guide you have first learned what is Jenkins. Then learned about plugins in Jenkins . After this you followed the steps to install a plugin on Jenkins and customize the Jenkins functionality with this plugin. Here in this section you have installed a plugin Material Theme to customize the Jenkins user interface appearance.
