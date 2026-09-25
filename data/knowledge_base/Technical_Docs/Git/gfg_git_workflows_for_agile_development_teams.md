# Git Workflows For Agile Development Teams

> Source: https://www.geeksforgeeks.org/git/git-workflows-for-agile-development-teams/

Git Flow is a branching model that involves the use of different types of branches based on the objective of the task.
The Git Flow strategy consists of the following branches
- Main: This branch is used for production deployment.
- Develop: New features are merged into this branch.
- Feature: A branch was created to develop a new feature.
- Release: This branch prepares code for a production release.
- Hotfix: A branch for critical production fixes.
Agile Development Lifecycle
The Agile Development Lifecycle is a series of phases that a project goes through right from planning to launch. One of the common approach of Agile Lifecycle is to work through sprints. A sprint can last from one to four week based on the project requirement and releases. Let's have a look at the different stages of the Agile lifecycle.
- Plan/Requirement Gathering: This phase involves defining project goal, understanding the scope, plan and estimate the roadmap of the project.
- Design: The team will design wireframes/low fidelities to lay down the project architecture. The Product Owner works with the design team to incorporate the scope and finalise the theme of the user interface. This phase involves going back and forth to improve the user experience of the project.
- Development: The developers work on the assigned tasks based on the user stories created on each sprint. This includes code review, code quality and unit testing..
- Testing: At the end of every sprint, the QA team tests the entire scope of the user stories based on the defined acceptance criteria. This can also take place between the development phase based on how the builds are sent to the QA team. The Agile life cycle incorporates various types of testing including integration testing, acceptance testing, system testing, load and performance testing.
- Deployment: After successful testing, the product is deployed on the specific host/domain. This can be automated using CI/CD pipelines.
- Delivery/Release: Once the product is built, tested and reviewed internally, it's prepared for launch.
- Maintenance: After every release, the launched product is reviewed to improvise based on user's feedback.
Steps to Integrate Git In Your Agile Workflow
Let's see above flow through an example.
To get started with GitFlow integration, make sure you have git flow installed on your machine. Run below command on Mac to install git-flow.
brew install git-flow-avh
Initialise Gitflow on your command line as below. Select the names of your production and release branches. You can also rename feature, bugfix, release, hotfix and support branches.
Now, let's create a feature branch. Checkout at the development branch and execute the below command.
Add a file index.js and commit the file.
Once the feature is completed, execute below command to finish the feature branch. This command will merge the featured branch to development branch and delete it. You will be checked out at development branch.
Run git checkout -b release/0.1.0 to create a release branch. Once the changes are ready, merge them to main and develop. A hotfix branch needs to be created from the main branch and merged to both main and develop branch.
This workflow will be on every sprint of the Agile Development Life Cycle.
Choosing the Right Git Workflow
There are three types of Git Workflows to choose from:
- GitFlow: This workflow defines a structured set of branches to organise the development cycle. IT is suitable for projects with scheduled releases. The main branches include master, develop, feature, release and hotfix branches. Read more about this strategy at the start of this article.
- GitHub Flow: This is a simpler and lightweight workflows which includes main/master and feature or bugfix branch. The changes are approved and merged directly into the main branch and deployed to production.
- GitLab Flow: This workflow offers flexible and adaptable approach based on environment branches. The changes are merged to main branch and then to the specific environment branch as per requirement.
Choosing the right Git Workflow depends on your project structure and your team's preferences and needs.
- If you have a scheduled and strict releases, it's better to follow a formal development process by using the Gitflow Workflow. This is suitable for complex projects.
- If you have a smaller team and want to opt for a simplified process, GitHub Flow will be easier to learn and use.
- If you want to prioritise flexibility, move ahead with the GitLab Workflow.
Benefits of Git for Agile Teams
- Task Git branch. During the sprint planning, the Product Owner, Product Manager along with the Development team decide the scope of the upcoming sprint along with the user stories. These user stories consist of tasks and sub-tasks which are allocated to developers. Consider each task as a Git branch.
- With the help of code review, each task - each branch can be reviewed separately which helps in maintaining code quality.
- Once the development phase of a branch is complete, it can move to the next stage of the Agile Life Cycle; testing. The developer can inform the QA team that a particular feature has finished and can be tested. This helps testers to start with their work without waiting for the entire sprint tasks to be completed.
- The DevOps team can set up automated tests - continuous integration or continuous delivery which can be executed after every merge.
- Using Git strategy gives an overall transparency to the team to identify the work done on any feature and even track the changes made for any releases, bug fix or hotfixes.
