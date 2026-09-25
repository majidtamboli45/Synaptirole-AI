# Issues in GitHub

> Source: https://www.geeksforgeeks.org/git/issues-in-github/

GitHub is more than just a platform for hosting code; it’s a powerful tool for managing projects and collaborating with teams. One of the key features that provides this is the Issues system. GitHub Issues helps developers track bugs, enhancements, and tasks, ensuring that projects stay organized and on track. In this article, we'll see what GitHub Issues are, how to use them effectively, and best practices for managing them.
What are GitHub Issues?
GitHub Issues are a way to track and manage the work needed to improve your projects. Each issue can represent a task, bug report, or feature request and can be assigned to team members, tagged with labels, and linked to milestones.
Key Features of GitHub Issues:
- Title and Description: Each issue has a title and a detailed description to explain the problem or task.
- Labels: Labels help categorize and prioritize issues (e.g., bug, enhancement, documentation).
- Assignees: Issues can be assigned to team members responsible for addressing them.
- Comments: Team members can discuss and provide updates on the issue within the comments section.
- Milestones: Milestones group issues into specific goals or stages of the project.
- References: Issues can reference other issues or pull requests to create a linked history.
How to Create an Issue
Creating an issue on GitHub is simple. Here’s a step-by-step guide:
- Navigate to the Repository: Go to the repository where you want to create an issue.
- Go to the Issues Tab: Click on the "Issues" tab at the top of the repository page.
- Click New Issue: Click the "New issue" button.
- Fill Out the Issue Form: Provide a clear and concise title and detailed description. You can also assign labels and assignees at this stage.
- Submit the Issue: Click the "Submit new issue" button to create the issue.
Issues tab as shown below:
After navigating to the issues tab, click on
New Issues
to create an Issue for your project as shown below:
Then give a suitable heading and detailed information about the issue. As an example, let us take a look at angular repository which is a web framework:
Features of Issues
An issue contains the following entities:
- A title and a description which clearly explains what the issue is about. It should be concise and should be clear to understand.
- Color-coded labels that help to filter out specific issues for you. This is similar to the categorization we see in emails. An issue can have more than one label and can be filtered out by one or many labels at a time. An issue with labels looks like this:
-  Milestones help to track issues and merge requests to achieve a broader goal in a certain duration of time. They can be visualized as containers for specific type of issues. These can be of various types for example: 
  - Version 1.0 - For a specific release of a software version.
  - Beta Launch - File bugs that you need to fix before you'll launch the beta version of your project.
  - March Due - File issues that you'd like to work in March.
  - Redesign - Issues related to the design of your project.
- An assignee, who is responsible to work on a specific issue at a time and to take the issue forward. They are also assigned by the repository owner.
- Comments which can be done by anyone who has an access to the repository.
Some other useful features in issues are:
- @mention - A great way to reference other users within GitHub is using the @mention feature. To notify other users of a particular issue and to seek help or guidance from them, tag them by using @username which sends them a notification to look into the issue and contribute to it. It can also be used to notify teams rather than individuals, in which all the team members will be notified.
- References - Sometimes some issues are dependent on other issues. These issues can be referenced by placing a # in front of issue_number of the other issue which is dependent on the current issue and prefacing the commits with "Fixed", "Fixes", "Closed", "Closes" or "Close".
- Searches - At the top-right in the issues section, there is a search box which lets you search through the issues present. Issues can be searched on the basis of keywords, states or assignees.
Finally, there is an issue dashboard which lists all your issues from all the projects you've been working on and includes:
- All issues in repositories you own and collaborate in.
- Issues that are assigned to you.
- Issues that you have created.
