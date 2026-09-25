# How to get Build Number in GitHub Actions ?

> Source: https://www.geeksforgeeks.org/devops/get-build-number-in-github-actions

GitHub Actions is a powerful automation tool provided by GitHub, designed to streamline workflows and enhance collaboration among developers. It plays a vital role in CI/CD pipelines by automating tasks such as testing, building, and deploying software projects. With GitHub Actions, developers can define custom workflows using YAML syntax directly within their repositories, allowing for seamless integration of various tools and processes into their development workflows. This enables teams to automate repetitive tasks, accelerate development cycles, and ensure the quality and reliability of their software releases.
Importance Of Build Numbers
Build numbers play a crucial role in CI/CD workflows by providing a unique identifier for each build of a software project. They are essential for tracking and identifying specific builds throughout the development lifecycle, enabling teams to quickly reference and retrieve information about past builds. Build numbers facilitate debugging and troubleshooting by allowing developers to pinpoint issues and errors that occurred in a particular build. Additionally, they ensure traceability and reproducibility by enabling teams to recreate builds with the same configuration and dependencies, aiding in collaboration and ensuring consistent results across environments. Overall, build numbers are essential for maintaining visibility, reliability, and consistency in CI/CD workflows.
Step-By-Step To Get Build Number In GitHub Actions
Step 1: Create a repository.
Step 2: Here is the GitHub repository called build number and the action file named blan.yaml.
Step 3: Here is the sample action file user the workflows named as blank.yaml.
name: Get Build Number
on:
push:
branches: [ main ]
jobs:
get-build-number:
runs-on: ubuntu-latest
steps:
- name: Output Run ID
run: echo ${{ github.run_id }}
- name: Output Run Number
run: echo ${{ github.run_number }}
- name: Output Run Attempt
run: echo ${{ github.run_attempt }}
- Output Run ID: This step prints the unique identifier (ID) assigned to the current workflow run. The ${{ github.run_id }} syntax is a GitHub Actions expression that retrieves the ID of the workflow run.
- Output Run Number: This step prints the sequential number assigned to the current workflow run. The ${{ github.run_number }} syntax is a GitHub Actions expression that retrieves the number of the workflow run.
- Output Run Attempt: This step prints the number of attempts made to run the workflow. The ${{ github.run_attempt }} syntax is a GitHub Actions expression that retrieves the attempt number of the workflow run.
Step 4: Her is the buld log executed after save the blank.yaml.
Step 5: We need to update the content on readme file and the action file executed now the pipeline is triggering the image and verify the buils number in the images as well.
Step 6: Here you can see the build number 3 on the console output.
- github.run_id: This is a unique identifier assigned to each individual workflow run in a repository. It remains the same even if you re-run the workflow.
- github.run_number: This is a unique number assigned to each run of a specific workflow in a repository. It starts from 1 for the first run and increments with each subsequent run, regardless of re-runs.
- github.run_attempt: This is a unique number assigned to each attempt of a particular workflow run in a repository. It starts from 1 for the initial run attempt and increments with each re-run of the workflow run.
Customizing Workflow Outputs In GitHub Actions
Outputting Build Numbers:
- Use workflow syntax to capture and output build numbers during workflow runs.
- Customize the format or content of build numbers to suit project requirements.
Accessing and Displaying Build Numbers:
- Utilize environment variables or context provided by the CI/CD platform to access build numbers.
- Incorporate code snippets within workflow steps to display build numbers in logs or outputs.
Best Practices:
- Standardize the naming convention and format of build numbers across workflows to ensure consistency.
- Consider including relevant metadata or context in build numbers for better traceability and debugging.
- Implement error handling mechanisms to gracefully handle scenarios where build numbers are unavailable or invalid.
Advanced Usage and Considerations
Critical Role of Build Numbers:
- Build numbers play a crucial role in versioning and release management.
- They enable precise tracking and identification of specific builds in complex CI/CD pipelines.
- Build numbers facilitate auditing, debugging, and troubleshooting processes by providing a unique identifier for each build.
Managing and Manipulating Build Numbers:
- Advanced techniques involve customizing build numbers to meet specific project requirements.
- Techniques include incorporating additional metadata or context into build numbers, such as commit hashes or branch names.
- Automation tools and scripts can be utilized to dynamically generate and assign build numbers based on predefined criteria.
Challenges and Limitations:
- One common challenge is ensuring consistency and uniqueness of build numbers across different workflows and environments.
- Handling scenarios where builds are triggered simultaneously or in parallel can lead to conflicts or inconsistencies in build numbers.
- Limitations may arise when integrating with external systems or tools that rely on specific formats or conventions for build numbers.
