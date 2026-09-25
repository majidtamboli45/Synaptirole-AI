# How To Integrate Jenkins With Slack ?

> Source: https://www.geeksforgeeks.org/devops/integrate-jenkins-with-slack/

In the present high-speed software development scene, consistent communication and collaboration efforts among teams are foremost. Jenkins, a software automation server, remains as a foundation for automating different undertakings across the product improvement lifecycle. Then again, Slack, a broadly taken-on team communication platform, offers an incorporated hub for continuous conversations, file sharing, and integration with a large number of tools and services. The integration of Jenkins with Slack presents a strong answer for overcoming any issues with automation and coordinated effort, working with streamlined work processes and further developing productivity inside development teams.
This article fills in as an extensive manual for integrating Jenkins with Slack, taking special care of both beginners and professionals. We'll dig into the key terminologies, clarify the step-by-step integration process, give functional models, and address normal questions through FAQs. By the end, you'll have a clear comprehension of how to use this integration to encourage better correspondence, upgrade teamwork, and speed up the conveyance of great software products.
Primary Terminologies
Jenkins: Jenkins is an open-source automation server utilized for automating different tasks in the software development lifecycle, like building, testing, and deploying software, it streamlines the continuous integration and continuous delivery (CI/CD) processes.
Slack: Slack is a cloud-based collaboration tool that empowers teams to communicate and cooperate continuously. It gives features like messaging, document sharing, channel-based communication, and integration with different tools and services.
Webhooks: Webhooks are automated messages sent starting with one application and then onto the next progressively, they are set off by unambiguous events and allow applications to communicate with one another by delivering data following an event.
Token: With regards to Jenkins and Slack integration, a token is a unique identifier utilized for authentication purposes. It ensures secure correspondence among Jenkins and Slack by confirming the identity of the sender and recipient, in this manner forestalling unapproved admittance to Slack channels.
What is Slack?
Slack is a cloud-based collaboration platform intended to work with communication and collaboration inside organizations. It gives a centralized hub point to continuous communication, document sharing, and coordinated effort across teams, departments, and tasks, with Slack, users can make channels for explicit topics, teams, or projects, where they can trade messages, share files, and team up on tasks.
Key features of Slack include:
Messaging
- Slack allows users to send direct messages to people or create channels for group conversations. Messages can incorporate text, emojis, files, and connections.
Channels
- Channels are devoted spaces for communication and collaboration around unambiguous topics, tasks, or teams. Users can join or leave channels depending on the situation, making it simple to organize conversations and offer data with relevant colleagues.
File Sharing
- Slack empowers users to transfer and share files, archives, pictures, and different media inside channels or through direct messages, documents are put away safely in the cloud and can be gotten to and looked whenever.
Integration
- Slack offers integration with an extensive variety of outsider tool and services, allowing users to bring external data, notifications, and work processes straightforwardly into Slack channels, well known integrations incorporate project management tools, version control system, and efficiency applications.
Search
- Slack gives strong pursuit usefulness, allowing users to rapidly track down messages, files, and discussions utilizing keywords, channels, and high level search questions.
Notifications
- Slack conveys constant notices to users for new messages, notices, and updates inside channels, notices can be tweaked in light of client inclinations and channel settings.
Step-by-Step Process To Integrate Jenkins With Slack
Step 1: Create account or Signup to slack
- Go to browser and browse slack.com and create account or login to account
- Here i am creating an account, Follow this to create account in slack, Now choose signing with email and provide email
- Now choose create a workspace, because we are new to slack.
- Give necessary information like project name, username and so on.
- Official dashboard of Slack, Here we can messages to team members, we can share files and folders
- Here we see that jenkins channel, this channel is regarding to our project.
- Our channel was created successfully and now we need to integrate with jenkins, so that purpose follow below procedure.
- Now click on Account name
- Choose Tools and settings in that there is a option manage apps
In manage apps search for Jenkins CI, we need to install this webhook in our slake
- Jenkins CI is a customizable continuous integration server with over 600 plugins, allowing you to configure it to meet your needs.
- Now choose add to Slack
- It's ask post to channel options. In this search for created name in previously and then click on Add jenkins CI integration.
- Here we see that Jenkins CI successfully added to our channel.
Step 2: Launch an EC2 Instance
- Now go to EC2 dashboard and launch EC2 instance
- Now connect with terminal
Step 3: Install Java and Jenkins
- In this step we need to install java because jenkins run time is java. Without java we cannot run our jenkins
- Install java by using following commands
sudo yum -y install java-17*
Now go to jenkins official page and copy jenkins package commands or follow below commands
sudo wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade
- Now install jenkins by using following command
sudo yum -y install jenkins
- Now start and enable jenkins by using following commands
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
- While executing status command it's shows administration password copy that password. It used to unlock jenkins.
- Now copy public IP and browse along with Port 8080, Because jenkins run on port 8080
- Here we see official page of jenkins
Step 4: Install Slack Notification Plugin
- In this step we are installing Slack Notification Plugin because to connect with our slack channel
- Go to manage jenkins --> Plugins --> Available plugins --> Slack Notification Plugin
- Here we see successfully installed
- Now add downloaded plugin into systems
- Manage jenkins --> Settings --> Slack
- In this we need to provide channel name and credentials
- Click on Manage Jenkins again in the left navigation, and then go to Configure System. Find the Global Slack Notifier Settings section and add the following values:
- Team Subdomain name
- Integration Token Credential ID: Create a secret text credential using glD1jIhpVtGwUxhsYq7RspCW as the value. This is provided when we installed jenkins CI.
Now click on save
Step 5: Create a Job
- Now go to dashboard select pipeline
- Give description of project
- Now go to pipeline option in that provide script for pipeline to run. Here is the sample script to run pipeline
def COLOR_MAP = [
FAILURE: 'danger',
SUCCESS: 'good'
]
pipeline {
agent any
stages {
stage('Hello') {
steps {
echo 'Hello World'
}
}
}
post {
always {
echo 'Slack Notifications'
script {
def color = COLOR_MAP[currentBuild.currentResult] ?: 'warning' // Default to 'warning' if build result is not FAILURE or SUCCESS
slackSend (
color: color,
channel: '#jenkins', #channel name
message: "${currentBuild.currentResult} Job ${env.JOB_NAME}\nbuild ${env.BUILD_NUMBER}\nMore info at: ${env.BUILD_URL}"
)
}
}
}
}
- Now save and click on build now
- Our job was successfully build, here is the pipeline view of job
Step 6: Verify in Slack
- Now go to slack channel and check notification
Here we see our job notification reflected in our slack channel.
Conclusion
In conclusion, Integrating Jenkins with Slack gives a powerful solution for enhancing communication and coordinated effort inside development teams. By using this integration, groups can streamline their work processes, further develop perceivability into the software development lifecycle, and facilitate the conveyance of quality software products.
All through this guide, We've covered fundamental terminologies, outlined a step by step integration process, gave viable models, and resolved normal various questions of feedback. By understanding the key concepts and following the illustrated procedures, you can effectively incorporate Jenkins with Slack and harness its advantages to improve your DevOps practices.
As organizations take a stab at readiness and efficiency in software development, tool like Jenkins and Slack assume vital parts in working with collaboration, automating cycles, and driving continuous improvement, by embracing integrations like Jenkins with Slack, groups can cultivate a culture of collaboration, development, and greatness, eventually conveying worth to customers and stakeholders.
Continue to exploring extra highlights, customization choices, and best practices to maximize the worth of Jenkins and Slack integration for your team. With powerful communication, streamlined work processes, and continuous improvement, you can move your advancement endeavors forward and make more prominent progress in delivering software solutions that address the issues of your users and business objectives.
