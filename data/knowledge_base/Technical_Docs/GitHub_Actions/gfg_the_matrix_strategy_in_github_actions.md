# The Matrix Strategy in GitHub Actions

> Source: https://www.geeksforgeeks.org/git/the-matrix-strategy-in-github-actions

GitHub Actions provides a platform for automating your CI/CD pipelines, allowing you to run workflows directly from your GitHub repositories. One of the most powerful features of GitHub Actions is the matrix strategy, which allows to run a single job in multiple configurations.
This can include different operating systems, language versions, environments, or any combination of factors. In this article, we'll dive deep into the matrix strategy in GitHub Actions, how it works, and how to use it effectively in your workflows.
Matrix Strategy in GitHub Actions
The matrix strategy in GitHub Actions allows you to run a job multiple times with different parameters. This is particularly useful for testing your code against different environments, such as various versions of programming languages, different operating systems, or different dependency versions. The matrix strategy defines multiple configurations, and GitHub Actions automatically generates and runs a job for each configuration.
How the Matrix Strategy Works?
When you define a matrix in a GitHub Actions workflow, the matrix generates a Cartesian product of all possible combinations of the defined variables. For example, if you specify two versions of Node.js (14 and 16) and two operating systems (ubuntu-latest and windows-latest), the matrix will generate four separate jobs to test each combination:
- Node.js 14 on Ubuntu
- Node.js 14 on Windows
- Node.js 16 on Ubuntu
- Node.js 16 on Windows
Common Use Cases for the Matrix Strategy
The matrix strategy is particularly useful in the following scenarios:
- Cross-Platform Testing: Ensures that your application runs consistently across multiple operating systems (e.g., Windows, macOS, Linux).
- Version Compatibility Testing: Tests your application against different versions of dependencies or programming languages (e.g., Python 3.7, 3.8, 3.9).
- Environment Testing: Runs your application in different environments or configurations (e.g., Node.js with different package versions).
- Parallel Execution: Reduces the total build and test time by running multiple jobs concurrently.
Defining a Matrix Strategy in Your Workflow
To define a matrix strategy, you need to specify it within the jobs.<job_id>.strategy.matrix section of your workflow YAML file. Here is a basic example of how to set up a matrix strategy:
name: Matrix Strategy Example
on: [push, pull_request]
jobs:
test:
runs-on: ${{ matrix.os }}
strategy:
matrix:
os: [ubuntu-latest, windows-latest, macos-latest]
node-version: [14, 16]
steps:
- uses: actions/checkout@v2
- name: Set up Node.js
uses: actions/setup-node@v2
with:
node-version: ${{ matrix.node-version }}
- run: npm install
- run: npm test
In this example, the test job is run on three different operating systems (Ubuntu, Windows, macOS) with two versions of Node.js (14 and 16), resulting in a total of 6 jobs.
Matrix Strategy Syntax
The matrix strategy syntax in GitHub Actions is simple and flexible. The key components include:
- matrix : Defines the variables and their possible values to create multiple job configurations.
- runs-on : Specifies the environment in which each job will run, often set dynamically using matrix variables.
- steps : The actions or commands to be executed for each matrix combination.
Here’s a more detailed breakdown of the syntax:
strategy:
matrix:
variable_name:
- value1
- value2
another_variable:
- valueA
- valueB
Each variable can have multiple values, and GitHub Actions will automatically generate all combinations of these variables.
Advanced Configuration Options
1. Excluding Specific Configurations
In some cases, certain combinations may not be valid or necessary. You can exclude specific configurations from the matrix using the exclude keyword:
strategy:
matrix:
os: [ubuntu-latest, windows-latest]
node-version: [14, 16]
exclude:
- os: windows-latest
node-version: 14
This configuration will run all combinations except for Node.js 14 on Windows.
2. Including Specific Configurations
You can use the include keyword to add specific configurations to the matrix, which may not be covered by the default combinations:
strategy:
matrix:
os: [ubuntu-latest, windows-latest]
node-version: [14]
include:
- os: windows-latest
node-version: 16
custom-variable: custom-value
Here, the matrix will run an additional job with Node.js 16 on Windows, alongside the default combinations.
3. Limiting Matrix Combinations
The max-parallel keyword allows you to control the number of jobs that run concurrently, which is particularly useful for limiting resource usage:
strategy:
matrix:
os: [ubuntu-latest, macos-latest]
node-version: [12, 14, 16]
max-parallel: 3
This configuration ensures that no more than three jobs run concurrently, even if more combinations are available.
Best Practices for Using the Matrix Strategy
- Use Exclusions Wisely: Exclude unnecessary combinations to save resources and reduce run times.
- Optimize Parallel Jobs: Set a reasonable max-parallel value to balance speed and resource usage.
- Use Includes: Use the include option for specific edge cases or custom configurations.
- Monitor Job Runs: Regularly review and optimize your matrix configurations based on test results and execution times.
Troubleshooting Common Issues
- Matrix Combinations Overwhelming Resources: Ensure you have set a max-parallel limit to avoid overloading the runners or hitting GitHub Actions' concurrency limits.
- Unnecessary Configurations Running: Use the exclude keyword to filter out unnecessary matrix combinations.
- Job Failures Due to Missing Dependencies: Make sure that the necessary dependencies for each environment are properly set up in your workflow steps.
Example Workflows Using the Matrix Strategy
Example 1: Testing a Python Application Across Multiple Versions
Here’s a workflow example for testing a Python application across multiple versions and operating systems:
name: Python Application CI
on: [push, pull_request]
jobs:
build:
runs-on: ${{ matrix.os }}
strategy:
matrix:
os: [ubuntu-latest, macos-latest, windows-latest]
python-version: [3.7, 3.8, 3.9]
steps:
- uses: actions/checkout@v2
- name: Set up Python
uses: actions/setup-python@v2
with:
python-version: ${{ matrix.python-version }}
- run: pip install -r requirements.txt
- run: pytest
This workflow tests the application against three versions of Python across three different operating systems, generating nine jobs in total.
Example 2: Running Multiple Browser Tests
Here’s a workflow that runs browser tests across different browsers and versions:
name: Browser Tests
on: [push, pull_request]
jobs:
test:
runs-on: ubuntu-latest
strategy:
matrix:
browser: [chrome, firefox]
browser-version: [latest, beta]
steps:
- uses: actions/checkout@v2
- name: Set up Browser Driver
run: |
if [ "${{ matrix.browser }}" == "chrome" ]; then
# Setup Chrome driver
elif [ "${{ matrix.browser }}" == "firefox" ]; then
# Setup Firefox driver
fi
- run: npm install
- run: npm run test
This workflow runs tests across different versions of Chrome and Firefox, ensuring compatibility and performance.
