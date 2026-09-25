# How to create a food recipe app using ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-food-recipe-app-using-reactjs/

We are going to make a food recipe app using React.js.
Pre-requisite:
Approach: Here in this app we should have a component where we are going to show our food recipes. And we need to fetch all the required food recipes using a food recipe API. We will fetch the API data, store those data in a component structure using react hooks (useEffect, useState ).
Getting food recipe API KEY: First of all we will get all the food recipes by fetching the data from API. For this, we will use the platform called EDAMAM. ( https://developer.edamam.com/ )
- First we need to signup and then go to the APIs section in the navbar.
- Click start now in the Developer section.
- Then go the Dashboard section(top right)>click Application>in the left side
- There's a Recipe Search API option > click view on that section
- From there copy your Application ID and Application Keys and store it somewhere.
Creating the react app and installing all the required packages:
Step 1: Create a React application using the following command:
npm create vite@latest foldername --template react
Step 2: After creating your project folder i.e. foldername, move to it using the following command:
cd foldername
Project Structure: It will look like the following.
Step 3: Now inside src/App.js file, provide tour own app id and app key in the place of <YOUR_APP_ID> and <YOUR_APP_KEY> which you have got from EDAMAM.
import React, { useEffect, useState } from 'react'
import './App.css';
import Recipe from './Recipe';
const App = () => {
  const APP_ID = <YOUR_APP_ID>;
  const APP_KEY = <YOUR_APP_KEY>;
  const [recipes, setRecipes] = useState([]);
  const [search, setSearch] = useState("");
  const [query, setQuery] = useState("chicken");
  useEffect(() => {
    getRecipes();
  }, [query])
  const getRecipes = async () => {
    const response = await fetch
          (`https://api.edamam.com/search?q=$%7Bquery%7D&app_id=$%7BAPP_ID%7D&app_key=$%7BAPP_KEY%7D%60);
    const data = await response.json();
    setRecipes(data.hits);
    // console.log(data);
  };
  const updateSearch = e => {
    setSearch(e.target.value);
  };
  const getSearch = e => {
    e.preventDefault();
    setQuery(search);
    setSearch("");
  }
  return (
    <div className="App">
      <form className="search-form" onSubmit={getSearch}  >
        <input className="search-bar" type="text" value={search}
             onChange={updateSearch} />
        <button className="search-button" type="submit" >
             Search
        </button>
      </form>
      <div className="recipes">
        {recipes.map(recipe => (
          <Recipe
            key={recipe.recipe.label}
            title={recipe.recipe.label}
            calories={recipe.recipe.calories}
            image={recipe.recipe.image}
            ingredients={recipe.recipe.ingredients}
          />
        ))}
      </div>
    </div>
  );
}
export default App;
Step 4: Make a component file in the src folder named "Recipe.js"(You can name it with whatever you wish to) which is imported in App.js. Edit src/Recipe.js file. This file contains the whole structure for recipe cards.
import React from "react";
import style from './recipe.module.css';
const Recipe = ({title,calories,image,ingredients}) =>{
    return(
        <div className={style.recipe}>
            <h1>{title}</h1>
            <ol>
                {ingredients.map(ingredient=>(
                    <li>{ingredient.text}</li>
                ))}
            </ol>
            
<p>Calories : {calories}</p>
            <img className={style.image} src={image} alt=""/>
        </div>
    );
}
export default Recipe;
Step 5: Now add styling inside src/App.css.
.App{
  min-height: 100vh;
 background-image: linear-gradient(15deg, #13547a 0%, #80d0c7 100%);
}
.search-form{
  min-height: 10vh;
  display: flex;
  justify-content: center;
  align-items: center;
}
.search-bar{
  width: 50%;
  border:none;
  padding: 10px;
  border-radius: 5px;
  box-shadow: 5px 10px #979b91;
}
.search-button{
  background: #4da1ab;
  border: 5px solid white;
  border-radius: 8px;
  padding: 10px 20px;
  color: white;
  font-size: larger;
  margin: 0 0 0 10px;
}
.search-button:hover {
  background-color:#fa709a ;
}
.recipes{
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
Step 6: Create a new file called "recipe.module.css" in src folder. This file is for adding style to src/Recipe.js file.
&display=swap');
.recipe{
    border-radius: 10px;
    box-shadow: 0px 5px 20px rgb(63, 60, 60);
    margin: 20px;
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    background-image: linear-gradient(to right, 
        #e4afcb 0%, #b8cbb8 0%, #b8cbb8 0%, 
        #e2c58b 30%, #c2ce9c 64%, #7edbdc 100%);
    align-items: center;
    min-width: 40%;
    font-family: 'Lobster', cursive;   
}
.image{
    border-radius: 10px;
    margin:0px 0px 20px 0px;
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm run dev Output: Now open your browser and go to http://localhost:5173/, you will see the following output:
