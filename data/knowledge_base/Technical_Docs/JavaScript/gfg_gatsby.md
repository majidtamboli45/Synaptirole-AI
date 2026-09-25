# Gatsby Introduction

> Source: https://www.geeksforgeeks.org/javascript/gatsby-introduction/

Gatsby is a free, open-source framework built on React that empowers developers to create blazing-fast websites and apps. Gatsby sites are fully functional React applications, enabling the development of dynamic, responsive, and secure web applications. It uses various optimization techniques, such as code splitting, server-side rendering, and prefetching resources, to ensure exceptionally fast loading times, which is crucial for both user experience and search engine performance. In this article, we will explore how to install and use Gatsby on your device to create high-performance web applications.
Steps to Install and Run Next.js Application:
Step 1: Installation of Gatsby, require npm and node.js. You can install node.js from here. Confirm the installation by running these commands on the terminal.
node -v
npm -v
Step 2: Now run the below code in the terminal to create a new Gatsby site.
npm init gatsby
It will ask the name of your application and the project folder. For this example, we are using "gfg" as the name.
Step 3: Move to the application folder that you just created using the below code:
cd gfg
Project Folder Strucutre:
Step 4: Run the below command in the terminal to start the development server.
npm run develop
Go to 'http://localhost:8000' in the browser, and you can see your application.
Step 5: Now we are going to change the content on the homepage. For this, add the below content in the 'index.js' file.
import * as React from "react"
const IndexPage = () => {
  return (
    <main >
      <h3>GeeksforGeeks - Demo Gatsby Page</h3>
    </main>
  )
}
export default IndexPage
Run the below command in the terminal to start the development server.
npm run develop
Output:
