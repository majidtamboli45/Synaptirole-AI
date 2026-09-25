# Calories Tracker App using React

> Source: https://www.geeksforgeeks.org/reactjs/nutrition-meter-calories-tracker-app-using-react/

GeeksforGeeks Nutrition Meter application allows users to input the name of a food item or dish they have consumed, along with details on proteins, calories, fat, carbs, etc. Users can then keep track of their calorie intake and receive a warning message if their calorie limit is exceeded. The logic for inputting item data and saving results in a card format has been implemented using JSX. The application uses functional-based components and manages states using different hooks.
Preview of Final Output:
Prerequisites and Technologies:
Approach:
For creating the Nutrition Meter in the ReactJS library, we have used the functional-based components, where we have done a simple application that inputs the items consumed by the user and also takes the input like calories, fat, carbs, etc. Once the user enters the detail the data is been saved and presented in the form of Cards using Tailwind CSS. Also, the track of calories is been done and is visible to the user. The limit of 1000 calories is been set by default, so if the user exceeds the calorie limit, then the warning message is been shown. Users can also edit or delete the items which he has added.
Steps to create the application:
Step 1: Set up the React project using the below command in VSCode IDE.
npm create vite@latest nutrition-app --template react
Step 2: Navigate to the newly created project folder by executing the below command.
cd nutrition-app
Step 3: As we are using Tailwind CSS for styling, we need to install it using the npm manager. So execute the below command in the terminal, to install the tailwind CSS.
npm install -D tailwindcss postcss autoprefixer
npx tailwindcss init
Step 4: After executing the above command, a 'tailwind.config.js' will be generated, so paste the below content in this file for the correct configuration.
/** @type {import('tailwindcss').Config} */
module.exports = {
content: [
"./src/**/*.{js,jsx,ts,tsx}",
],
theme: {
extend: {},
},
plugins: [],
}
Step 5: Install the required dependencies using the below command:
npm install --save @fortawesome/react-fontawesome @fortawesome/free-solid-svg-icons font-awesome
Step 6: Now, in the src directory create a file as NutritionMeter.jsx, which will consist of the entire code for inputting the details of items along with the calories, fat, etc,
Project Structure:
The updated dependencies in package.json will look like this:
{
"name": "nutrition-app",
"version": "0.1.0",
"private": true,
"dependencies": {
"@fortawesome/free-solid-svg-icons": "^6.4.2",
"@fortawesome/react-fontawesome": "^0.2.0",
"font-awesome": "^4.7.0",
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0",
"web-vitals": "^2.1.4"
},
"devDependencies": {
"tailwindcss": "^3.0.0",
"postcss": "^8.3.0",
"autoprefixer": "^10.2.5"
}
}
Example: Insert the below code in the App.js and NutritionMeter.jsx file mentioned in the above directory structure.
- App.js: This file contains the rendering of NutritionMeter.jsx code. All the applications have been rendered from this file in the starting point.
- NutritionMeter.jsx: This file in the application consists of all the required logic like inputting the details from the user, calculating the calories, and having the track to the limit of calories. If the calories are exceeded then the message is been shown to the user.
- NutritionMeter.css: Supporting Styles and an attractive feel have been provided through this file. All the hovering effects etc. are been specified in this file.
- index.css: This file contains the Tailwind CSS directives for styling our Nutrition Meter application.
/*NutritionMeter.css File*/
body {
  font-family: Arial, sans-serif;
  background-color: #f3f3f3;
  margin: 0;
  padding: 0;
  color: #333;
}
.container {
  max-width: 800px;
  margin: 0 auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
  transition: box-shadow 0.3s, transform 0.3s;
}
.text-center {
  text-align: center;
}
.warning {
  background-color: #ff6b6b;
  color: white;
  padding: 10px;
  display: flex;
  align-items: center;
  border-radius: 8px;
  margin-bottom: 20px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
  transition: background-color 0.3s;
}
.warning svg {
  margin-right: 10px;
}
.clear-button {
  background-color: #e74c3c;
  color: white;
  border: none;
  padding: 10px 20px;
  border-radius: 8px;
  cursor: pointer;
  margin-bottom: 20px;
  display: block;
  width: 100%;
  text-align: center;
  font-weight: bold;
  transition: background-color 0.3s;
}
.clear-button:hover {
  background-color: #c0392b;
}
#nutrition-icon {
  color: #3498db;
  margin-left: 10px;
}
button {
  cursor: pointer;
  width: 48%;
  padding: 12px 0;
  background-color: #3498db;
  color: white;
  border: none;
  border-radius: 8px;
  transition: background-color 0.3s;
  font-weight: bold;
}
button.edit-button {
  margin-right:5%;
}
button.delete-button {
  margin-left: 5%;
}
button:hover {
  background-color: #2980b9;
}
.error-message {
  color: #e74c3c;
  font-size: 14px;
  margin-top: 5px;
}
@keyframes float {
  0% {
    transform: translateY(0);
  }
  50% {
    transform: translateY(-5px);
  }
  100% {
    transform: translateY(0);
  }
}
.gradient-background {
  background: linear-gradient(
    to right,
    #3498db,
    #6dd5fa
  );
}
/* index.css File */
@tailwind base;
@tailwind components;
@tailwind utilities;
//App.js
import React from "react";
import NutritionMeter from "./NutritionMeter";
function App() {
  return (
    <div className="bg-gray-100 min-h-screen">
      <NutritionMeter />
    </div>
  );
}
export default App;
//NutritionMeter.js File
import React, { useState, useEffect } from "react";
import "./NutritionMeter.css";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
  faEdit,
  faTrashAlt,
  faUtensils,
  faPlus,
  faMinus,
  faTimes,
} from "@fortawesome/free-solid-svg-icons";
const NutritionMeter = () => {
  const defaultItemsDisplayed = [
    {
      id: 1,
      name: "Apple",
      calories: 52,
      protein: 0.26,
      carbs: 14,
      fat: 1,
      quantity: 1,
    },
    {
      id: 2,
      name: "Banana",
      calories: 89,
      protein: 1.09,
      carbs: 23,
      fat: 5,
      quantity: 1,
    },
    {
      id: 3,
      name: "Grapes",
      calories: 40,
      protein: 0.2,
      carbs: 20,
      fat: 2,
      quantity: 1,
    },
    {
      id: 4,
      name: "Orange",
      calories: 35,
      protein: 0.15,
      carbs: 25,
      fat: 4,
      quantity: 1,
    },
  ];
  const [nutritionItems, setNutritionItems] = useState(defaultItemsDisplayed);
  const [newItem, setNewItem] = useState({
    name: "",
    calories: "",
    protein: "",
    carbs: "",
    fat: "",
  });
  const [editItem, setEditItem] = useState(null);
  const [totalCalories, setTotalCalories] = useState(0);
  const [showWarning, setShowWarning] = useState(false);
  const [inputError, setInputError] = useState(false);
  useEffect(() => {
    const calculateTotalCalories = nutritionItems.reduce(
      (total, item) => total + parseFloat(item.calories) * item.quantity,
      0
    );
    setTotalCalories(calculateTotalCalories);
    if (calculateTotalCalories > 1000) {
      setShowWarning(true);
    } else {
      setShowWarning(false);
    }
  }, [nutritionItems]);
  const addNutritionItem = () => {
    if (
      newItem.name &&
      newItem.calories >= 0 &&
      newItem.protein >= 0 &&
      newItem.carbs >= 0 &&
      newItem.fat >= 0
    ) {
      setNutritionItems([
        ...nutritionItems,
        { ...newItem, id: Date.now(), quantity: 1 },
      ]);
      setNewItem({
        name: "",
        calories: "",
        protein: "",
        carbs: "",
        fat: "",
      });
      setInputError(false);
    } else {
      setInputError(true);
    }
  };
  const removeAllItems = () => {
    setNutritionItems([]);
  };
  const editItemFunction = (item) => {
    setEditItem(item.id);
    setNewItem({ ...item });
  };
  const updateItemFunction = () => {
    if (
      newItem.name &&
      newItem.calories >= 0 &&
      newItem.protein >= 0 &&
      newItem.carbs >= 0 &&
      newItem.fat >= 0
    ) {
      const updatedItems = nutritionItems.map((item) =>
        item.id === newItem.id ? newItem : item
      );
      setNutritionItems(updatedItems);
      setNewItem({
        name: "",
        calories: "",
        protein: "",
        carbs: "",
        fat: "",
      });
      setEditItem(null);
      setInputError(false);
    } else {
      setInputError(true);
    }
  };
  const deleteItemFunction = (id) => {
    const updatedItems = nutritionItems.filter((item) => item.id !== id);
    setNutritionItems(updatedItems);
  };
  const inputErrorStyle = {
    borderColor: "red",
  };
  const updateItemQuantity = (id, change) => {
    const updatedItems = nutritionItems.map((item) =>
      item.id === id ? { ...item, quantity: Math.max(item.quantity + change, 1) } : item
    );
    setNutritionItems(updatedItems);
  };
  const totalProtein = () => {
    return nutritionItems.reduce(
      (total, item) => total + parseFloat(item.protein) * item.quantity,
      0
    );
  };
  const totalCarbs = () => {
    return nutritionItems.reduce(
      (total, item) => total + parseFloat(item.carbs) * item.quantity,
      0
    );
  };
  const totalFat = () => {
    return nutritionItems.reduce(
      (total, item) => total + parseFloat(item.fat) * item.quantity,
      0
    );
  };
  return (
    <div className="bg-green-200 min-h-screen">
      <div className="container mx-auto p-4">
        <h1 className="text-3xl font-semibold text-center mb-4">
          GeeksforGeeks Nutrition Meter
        </h1>
        {showWarning && (
          <div className="bg-red-500 text-white p-2 rounded-md text-center mb-4">
            <FontAwesomeIcon icon={faTimes} className="mr-2" />
            Total calories exceed recommended limit (1000 calories)!
          </div>
        )}
        <div className="mb-4">
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-4">
            <div>
              <input
                type="text"
                placeholder="Item Name"
                className={`w-full py-2 px-3 border rounded-md focus:outline-none 
                focus:ring focus:border-blue-300 ${
                  inputError && !newItem.name ? "border-red-500" : ""
                }`}
                style={inputError && !newItem.name ? inputErrorStyle : {}}
                value={newItem.name}
                onChange={(e) =>
                  setNewItem({ ...newItem, name: e.target.value })
                }
              />
            </div>
            <div>
              <input
                type="number"
                placeholder="Calories"
                className={`w-full py-2 px-3 border rounded-md 
                focus:outline-none focus:ring focus:border-blue-300 ${
                  inputError && newItem.calories < 0 ? "border-red-500" : ""
                }`}
                style={inputError && newItem.calories < 0 ? inputErrorStyle : {}}
                value={newItem.calories}
                onChange={(e) =>
                  setNewItem({ ...newItem, calories: e.target.value })
                }
              />
            </div>
            <div>
              <input
                type="number"
                placeholder="Protein (g)"
                className={`w-full py-2 px-3 border rounded-md focus:outline-none 
                focus:ring focus:border-blue-300 ${
                  inputError && newItem.protein < 0 ? "border-red-500" : ""
                }`}
                style={inputError && newItem.protein < 0 ? inputErrorStyle : {}}
                value={newItem.protein}
                onChange={(e) =>
                  setNewItem({ ...newItem, protein: e.target.value })
                }
              />
            </div>
            <div>
              <input
                type="number"
                placeholder="Carbs (g)"
                className={`w-full py-2 px-3 border rounded-md focus:outline-none 
                focus:ring focus:border-blue-300 ${
                  inputError && newItem.carbs < 0 ? "border-red-500" : ""
                }`}
                style={inputError && newItem.carbs < 0 ? inputErrorStyle : {}}
                value={newItem.carbs}
                onChange={(e) =>
                  setNewItem({ ...newItem, carbs: e.target.value })
                }
              />
            </div>
            <div>
              <input
                type="number"
                placeholder="Fat (g)"
                className={`w-full py-2 px-3 border rounded-md focus:outline-none 
                focus:ring focus:border-blue-300 ${
                  inputError && newItem.fat < 0 ? "border-red-500" : ""
                }`}
                style={inputError && newItem.fat < 0 ? inputErrorStyle : {}}
                value={newItem.fat}
                onChange={(e) =>
                  setNewItem({ ...newItem, fat: e.target.value })
                }
              />
            </div>
            <div className="col-span-2 sm:col-span-1"></div>
            
          </div>
          <div className="mt-3 flex justify-between">
              
              {editItem ? (
                <button
                  className="bg-blue-500 text-white p-3 rounded-md hover:bg-blue-600 mb-4 
                  font-semibold focus:outline-none text-xs"
                  onClick={updateItemFunction}
                >
                  Update Item
                </button>
              ) : (
                <button
                  className="bg-green-600 text-white p-3 rounded-md hover:bg-green-700 mb-4 
                  font-semibold focus:outline-none text-xs"
                  onClick={addNutritionItem}
                >
                  Add Item
                </button>
              )}
              <button
                className="bg-red-600 text-white p-3 rounded-md font-semibold mb-4 hover:bg-red-700 
                focus:outline-none text-xs"
                onClick={removeAllItems}
              >
                Clear All
              </button>
            </div>
        </div>
        <div className="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-2">
          {nutritionItems.map((item) => (
            <div
              key={item.id}
              className="bg-white p-4 rounded-md shadow-md border-2 border-blue-400 
              hover:border-blue-500 hover:shadow-lg transition transform hover:scale-105"
            >
              <h2 className="text-lg font-semibold text-gray-800">{item.name}</h2>
              <ul className="mt-3">
                <li>Calories: {item.calories * item.quantity}</li>
                <li>Protein: {item.protein * item.quantity}g</li>
                <li>Carbs: {item.carbs * item.quantity}g</li>
                <li>Fat: {item.fat * item.quantity}g</li>
                <li className="flex items-center mt-2">
                  <button
                    className="bg-green-500 text-white hover:bg-green-600 p-2 rounded-md font-semibol"
                    onClick={() => updateItemQuantity(item.id, 1)}
                  >
                    <FontAwesomeIcon icon={faPlus} />
                  </button>
                  <span className="mx-2">{item.quantity}</span>
                  <button
                    className="bg-red-500 text-white hover:bg-red-600 p-2 rounded-md font-semibol"
                    onClick={() => updateItemQuantity(item.id, -1)}
                  >
                    <FontAwesomeIcon icon={faMinus} />
                  </button>
                </li>
              </ul>
              <div className="mt-3 flex justify-between">
                <button
                  className="bg-blue-500 text-white pd-2 rounded-md hover:bg-blue-600 
                  font-semibold focus:outline-none text-xs"
                  onClick={() => editItemFunction(item)}
                >
                  <FontAwesomeIcon icon={faEdit} /> Edit
                </button>
                <button
                  className="bg-red-500 text-white pd-2 rounded-md hover:bg-red-600 
                  font-semibold focus:outline-none text-xs"
                  onClick={() => deleteItemFunction(item.id)}
                >
                  <FontAwesomeIcon icon={faTrashAlt} /> Delete
                </button>
              </div>
            </div>
          ))}
        </div>
        <div className="mt-8 text-center">
          <p className="text-xl font-semibold">
            Total Calories: {totalCalories}{" "}
            <span id="nutrition-icon">
              <FontAwesomeIcon icon={faUtensils} size="lg" />
            </span>
          </p>
          <p className="text-xl font-semibold">
            Total Protein: {totalProtein()}g
          </p>
          <p className="text-xl font-semibold">
            Total Carbs: {totalCarbs()}g
          </p>
          <p className="text-xl font-semibold">Total Fat: {totalFat()}g</p>
        </div>
      </div>
    </div>
  );
};
export default NutritionMeter;
Steps to run the application:
Step 1. Run the application by executing the following command in the terminal.
npm run dev
Step 2. Open a web browser like Chrome or Firefox and type the following URL in the address bar.
http://localhost:5173/
Output:
