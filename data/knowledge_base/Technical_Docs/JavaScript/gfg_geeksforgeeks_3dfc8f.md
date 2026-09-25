# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/javascript/nuxtjs/

Nuxt.js is a famous open-source framework for building Vue.js applications. It is based on Vue.js, which is one of the greatest frameworks for JavaScript similar to React.js used for building user interfaces. It provides a wide variety of features to developers for quickly creating and deploying server-side rendered (SSR) Vue.js applications.
Nuxt.js allows developers to create SEO-friendly websites with faster page load times and good performance. It has a large and active community that helps us with resources, plugins, and modules. Nuxt.js has many contributors and they are constantly upgrading its features.
Nuxt.js does not require much configuration and the directory structure, as well as conventions, are easy to understand. It provides different rendering modes which allow us to run our application according to our demand. Importing and extension of modules along with features like Data fetching and Auto import makes it very popular among the developers.
Features of Nuxt.js:
- Server-Side Rendering: The components can be easily rendered on the server before sending HTML to the client
- On-demand rendering: The developer can decide at what level they want the component to be rendered and decide the best strategy to build a web application.
- SEO friendly: Applications created by Nuxt.JS are ranked well on the search engines ad it optimizes the content while keeping the quality of the website so the end-user experience not compromised.
- Flexible: The flexibility to choose between SSR and SSG makes the development process faster.
- File System Routing: The ability to automatically route and code splitting helps in the creation of static webpages which can also be modified to create dynamic routes
- Easy Transitions: Nuxt.js has an inbuilt <transition> element where animations and transitions can be easily handled.
Prerequisites: Before learning Nuxt.js a user should have basic knowledge of HTML, CSS, JavaScript, and Vue.js. After that the user should know about Node.js and a basic knowledge of NPM(Node Package Manager) is required.
Let's use the nuxi init CLI, and create our first Nuxt.js app.
Step 1: In the terminal of your computer or VS code terminal type the following command to create a project
npx nuxi init projectName
Step 2: Navigate to the project folder
cd projectName
Step 3: Install the dependencies by typing the following command
npm install
Project Structure:
Example: In this example, we will create a basic page. Write this code in app.vue file.
<template>
    <h1>GeeksforGeeks</h1>
    <div class="hello">
        Hello Nuxt Learners
      </div>
</template>
<style scoped>
h1 {
  color:green;
}
.hello {
  font-size: 1.5rem;
}
</style>
To run the code type the following command in the terminal:
npm run dev -- -o
Output:
Learn more about Nuxt JS:
