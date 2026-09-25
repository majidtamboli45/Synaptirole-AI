# Recipe Finder using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/recipe-finder-using-reactjs/

In this project article, we will be creating a recipe finder application using the React library. We have given the application the name "GeeksforGeeks Recipe Finder". This application is completely developed in ReactJS and mainly focuses on the functional components and also manages the various states of the application.
This application allows users to search for a wide range of recipes for different dishes. There are default recipes displayed to the user when the user visits the application for the first time. All the logic of recipe research, getting the results, and displaying them in the card format is implemented using JSX.
Preview Image
Prerequisites and Technologies
Approach:
For creating the Recipe Finder application using ReactJS, we have developed a search bar in which the user can input the dish name for which he or she needs the recipe. Once the user enters the dish name, the recipes are fetched from an Edamam API. This contains a large set of food databases, along with the dishes and their recipes. So according to the user's search, the matching dishes and their recipes are shown to the user in the form of card elements. We are using Tailwind CSS for styling the UI components of the application.
Project Structure:
Steps to create the application
Step 1: Set up the React project using the below command in VSCode IDE.
npm create vite@latest recipe-app --template react
Step 2: Navigate to the newly created project folder by executing the below command.
cd recipe-app
Step 3: As we are using Tailwind CSS for styling, we need to install it using the npm manager. So execute the below command in the terminal, to install the tailwind CSS.
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init
The updated dependencies in package.json will look like this:
  "dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0"
},
"devDependencies": {
"tailwindcss": "^3.3.3",
"postcss": "^8.4.0",
"autoprefixer": "^10.4.0"
}
Step 4: After executing the above command, a 'tailwind.config.js' will be generated, so paste the below content in this file for the correct configuration.
/** @type {import('tailwindcss').Config} */
module.exports = {
content: [
"./index.html",
"./src/**/*.{js,jsx,ts,tsx}",
],
theme: {
extend: {},
},
plugins: [],
}
Step 5: Now, in the src directory create a file as RecipeCard.jsx, which will consist of the code for presenting the recipes to the user.
Example: Insert the below code in the App.js and RecipeCard.jsx file mentioned in the above directory structure.
/* index.css */
@tailwind base;
@tailwind components;
@tailwind utilities;
// App.js
import React, { useEffect, useState } from 'react';
import RecipeCard from './RecipeCard';
const App = () => {
    const APP_ID = 'YOUR_API_ID';
    const APP_KEY = 'YOUR_API_KEY';
    const [food_recipes, setfood_recipes] = useState([]);
    const [search_recipe, setSearch_recipe] = useState('');
    const [search_query, setSearch_Query] = useState('chicken');
    useEffect(() => {
        getRecipesFunction();
    }, [search_query]);
    const getRecipesFunction = async () => {
        const response = await fetch(
`https://api.edamam.com/search?q=$%7Bsearch_query%7D&app_id=$%7BAPP_ID%7D&app_key=$%7BAPP_KEY%7D%60
        );
        const data = await response.json();
        setfood_recipes(data.hits);
    };
    const updateSearchFunction = (e) => {
        setSearch_recipe(e.target.value);
    };
    const getSearchFunction = (e) => {
        e.preventDefault();
        setSearch_Query(search_recipe);
        setSearch_recipe('');
    };
    return (
        <div className="bg-blue-50 min-h-screen font-sans">
            <header className="bg-blue-500 py-4 text-white">
                <div className="container mx-auto text-center">
                    <h1 className="text-3xl sm:text-4xl 
                                   md:text-5xl lg:text-6xl
                                   font-extrabold tracking-tight">
                        <span className="block">GeeksforGeeks
                            Recipe Finder</span>
                    </h1>
                </div>
            </header>
            <div className="container mx-auto mt-8 p-4 
                            sm:px-6 lg:px-8">
                <form
                    onSubmit={getSearchFunction}
                    className="bg-white p-4 sm:p-6 
                               lg:p-8 rounded-lg shadow-md 
                               flex flex-col sm:flex-row items-center 
                               justify-center space-y-4 sm:space-y-0 
                               sm:space-x-4"
                >
                    <div className="relative justify-center flex-grow
                                    w-full sm:w-1/2">
                        <input
                            type="text"
                            name="search"
                            value={search_recipe}
                            onChange={updateSearchFunction}
                            placeholder="Search for recipes..."
                            className="w-full py-3 px-4 bg-gray-100 
                                       border border-blue-300 focus:ring-blue-500 
                                       focus:border-blue-500 rounded-full 
                                       text-gray-700 outline-none transition-colors 
                                       duration-200 ease-in-out focus:ring-2 
                                       focus:ring-blue-900 focus:bg-transparent 
                                       focus:shadow-md"
                        />
                    </div>
                    <button
                        type="submit"
                        className="bg-blue-500 hover:bg-blue-600 focus:ring-2 
                        focus:ring-blue-900 text-white font-semibold py-3 px-6 
                        rounded-full transform hover:scale-105 transition-transform 
                        focus:outline-none focus:ring-offset-2 
                        focus:ring-offset-blue-700"
                    >
                        Search Recipe
                    </button>
                </form>
            </div>
            <div className="container mx-auto mt-8 p-4 sm:px-6 lg:px-8">
                <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 
                lg:grid-cols-4 gap-4">
                    {food_recipes.map((recipe) => (
                        <RecipeCard key={recipe.recipe.label} recipe={recipe.recipe} />
                    ))}
                </div>
            </div>
        </div>
    );
};
export default App;
// RecipeCard.jsx
import React from 'react';
const RecipeCard = ({ recipe }) => {
  return (
    <div className="bg-white shadow-lg rounded-lg 
                        overflow-hidden hover:shadow-xl 
                        transition-transform hover:scale-105">
      <div className="relative">
        <img
          className="w-full h-48 object-cover 
                               object-center rounded-t-lg"
          src={recipe.image}
          alt={recipe.label}
        />
        <div className="absolute top-2 left-2 bg-indigo-500 
                                text-white py-1 px-2 rounded">
          {recipe.dishType[0]}
        </div>
      </div>
      <div className="p-4">
        <h1 className="text-2xl font-semibold text-gray-800 
                               mb-2 capitalize">
          {recipe.label}
        </h1>
        <div className="text-gray-600 mb-4">
          <span className="block mb-1">
            <b>Ingredients:</b>
          </span>
          {recipe.ingredientLines.map((ingredient, index) => (
            <span key={index} className="block pl-4">
              {ingredient}
            </span>
          ))}
        </div>
        <div className="flex items-center justify-between">
          <a
            href={"/"}
            target="_blank"
            rel="noopener noreferrer"
            className="text-indigo-500 font-semibold 
                                   hover:underline"
          >
            View Recipe
          </a>
          <div className="flex items-center text-gray-600">
            <span className="flex items-center mr-4">
              <svg
                xmlns="https://www.w3.org/2000/svg"
                className="h-4 w-4 mr-1"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="2"
                  d="M12 5v14m0 0V5m0 
                                    0v14m0-14h14m-14 0H5"
                />
              </svg>
              1.2K
            </span>
            <span className="flex items-center">
              <svg
                xmlns="https://www.w3.org/2000/svg"
                className="h-4 w-4 mr-1"
                fill="none"
                viewBox="0 0 24 24"
                stroke="currentColor"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth="2"
                  d="M6 18L18 6M6 6l12 12"
                />
              </svg>
              6
            </span>
          </div>
        </div>
      </div>
    </div>
  );
};
export default RecipeCard;
Steps to run the application:
Step 1: Run the application by executing the following command in the terminal.
npm run dev
Step 2: Open a web browser like Chrome or Firefox and type the following URL in the address bar.
http://localhost:5173/
Step 3: Change API Key and API Code in your App.js
 const APP_ID = 'YOUR_API_ID';
const APP_KEY = 'YOUR_API_KEY';
Output:
