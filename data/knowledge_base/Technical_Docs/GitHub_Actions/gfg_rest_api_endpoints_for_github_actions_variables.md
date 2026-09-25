# REST API Endpoints For GitHub Actions Variables

> Source: https://www.geeksforgeeks.org/git/rest-api-endpoints-for-github-actions-variables

GitHub Actions is used to automate workflows, build, test, and deploy code. To make workflows more dynamic and secure, GitHub Actions allows you to use variables, which can store data like configuration values, secrets, or other necessary information.
GitHub exposes a REST API to manage these variables efficiently, providing developers with full control over the setup, modification, and deletion of variables through API calls. In this article, we will explore more about REST API Endpoints For GitHub Actions Variables.
What are GitHub Actions Variables?
Variables in GitHub Actions allow you to store and reuse arbitrary data across workflows. They can be used to store anything from configuration settings to deployment keys, making your workflows more flexible and secure. There are two types of variables in GitHub Actions:
- Repository Variables: These variables are specific to a particular repository and can be accessed only within that repository's workflows.
- Organization Variables: These variables are shared across all repositories within an organization and can be accessed by workflows in any repository under that organization.
Overview of REST API Endpoints for GitHub Actions Variables
GitHub provides REST API endpoints to manage both repository and organization-level variables. These endpoints allow you to:
- List existing variables
- Create new variables
- Retrieve details of a specific variable
- Update existing variables
- Delete variables
This flexibility ensures that you can programmatically manage your workflow variables, automate processes, and maintain consistency across different repositories or environments.
Common Use Cases for GitHub Actions Variables API
The REST API for GitHub Actions variables can be used in various cases, such as:
- Automating CI/CD Pipelines: Dynamically update variables like deployment environments or build configurations.
- Centralized Management: Manage variables at the organization level to enforce consistency across multiple repositories.
- Security and Compliance: Programmatically create and manage sensitive data without exposing it in the source code.
- Simplified Maintenance: Easily update or delete variables without manually navigating through the GitHub UI.
List of REST API Endpoints for GitHub Actions Variables
1. List Repository Variables
- Endpoint: GET /repos/{owner}/{repo}/actions/variables
- Description: Retrieves a list of all variables defined in a specific repository.
- Example:curl -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
https://api.github.com/repos/owner/repo/actions/variables
2. Get a Repository Variable
- Endpoint: GET /repos/{owner}/{repo}/actions/variables/{name}
- Description: Fetches a specific variable from a repository by its name.
- Example:curl -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
https://api.github.com/repos/owner/repo/actions/variables/VAR_NAME
3. Create a Repository Variable
- Endpoint: POST /repos/{owner}/{repo}/actions/variables
- Description: Creates a new variable in the specified repository.
- Request Body:{ 
 "name": "VAR_NAME",
 "value": "variable_value"
}
- Example:curl -X POST -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
 -H "Content-Type: application/json" \
 -d '{"name": "NEW_VAR", "value": "new_value"}' \
https://api.github.com/repos/owner/repo/actions/variables
4. Update a Repository Variable
- Endpoint: PATCH /repos/{owner}/{repo}/actions/variables/{name}
- Description: Updates an existing variable in the repository.
- Request Body:{ 
 "value": "updated_value"
}
- Example:curl -X PATCH -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
 -H "Content-Type: application/json" \
 -d '{"value": "updated_value"}' \
https://api.github.com/repos/owner/repo/actions/variables/VAR_NAME
5. Delete a Repository Variable
- Endpoint: DELETE /repos/{owner}/{repo}/actions/variables/{name}
- Description: Deletes a specific variable from the repository.
- Example:curl -X DELETE -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
https://api.github.com/repos/owner/repo/actions/variables/VAR_NAME
6. List Organization Variables
- Endpoint: GET /orgs/{org}/actions/variables
- Description: Retrieves all variables defined at the organization level.
- Example:curl -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
https://api.github.com/orgs/org/actions/variables
7. Get an Organization Variable
- Endpoint: GET /orgs/{org}/actions/variables/{name}
- Description: Fetches a specific variable from an organization by its name.
- Example:curl -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
https://api.github.com/orgs/org/actions/variables/VAR_NAME
8. Create an Organization Variable
- Endpoint: POST /orgs/{org}/actions/variables
- Description: Creates a new variable for the organization.
- Request Body:{ 
 "name": "VAR_NAME",
 "value": "variable_value"
}
- Example:curl -X POST -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
 -H "Content-Type: application/json" \
 -d '{"name": "ORG_VAR", "value": "org_value"}' \
https://api.github.com/orgs/org/actions/variables
9. Update an Organization Variable
- Endpoint: PATCH /orgs/{org}/actions/variables/{name}
- Description: Updates an existing variable at the organization level.
- Request Body:{ 
 "value": "updated_value"
}
- Example:curl -X PATCH -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
 -H "Content-Type: application/json" \
 -d '{"value": "updated_value"}' \
https://api.github.com/orgs/org/actions/variables/VAR_NAME
10. Delete an Organization Variable
- Endpoint: DELETE /orgs/{org}/actions/variables/{name}
- Description: Deletes a specific variable from the organization.
- Example:curl -X DELETE -H "Authorization: token YOUR_GITHUB_TOKEN" \ 
https://api.github.com/orgs/org/actions/variables/VAR_NAME
Authentication and Permissions for GitHub Actions Variables API
To use these REST API endpoints, you need an access token with the appropriate permissions:
- Repository Variables: Requires repo orworkflow scope for personal access tokens (PAT).
- Organization Variables: Requires admin:org orworkflow scope for PAT.
Ensure that your access token has the necessary permissions to manage the variables for the respective repository or organization.
Example Use Cases and Code Snippets
Example 1: Automating Variable Creation for Multiple Repositories
Suppose you have multiple repositories and want to automate the creation of a common variable for all of them:
REPOS=("repo1" "repo2" "repo3")
for REPO in "${REPOS[@]}"
do
curl -X POST -H "Authorization: token YOUR_GITHUB_TOKEN" \
-H "Content-Type: application/json" \
-d '{"name": "COMMON_VAR", "value": "common_value"}' \
https://api.github.com/repos/owner/$REPO/actions/variables
done
Example 2: Updating Organization-Level Variables Based on Environment
You can use the API to dynamically update variables based on the environment:
ENVIRONMENT="staging"
if [ "$ENVIRONMENT" == "staging" ]; then
curl -X PATCH -H "Authorization: token YOUR_GITHUB_TOKEN" \
-H "Content-Type: application/json" \
-d '{"value": "staging_value"}' \
https://api.github.com/orgs/org/actions/variables/ORG_VAR
fi
Troubleshooting Common Issues with GitHub Actions Variables API
- Permission Denied: Ensure your token has the required scope (repo ,workflow ,admin:org ).
- Variable Name Conflicts: Verify that the variable name is unique within the context (repository or organization).
- Rate Limiting: GitHub APIs have rate limits. Make sure you are within the limit or use caching strategies.
