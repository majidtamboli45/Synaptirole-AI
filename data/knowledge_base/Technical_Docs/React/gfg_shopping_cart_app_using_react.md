# Shopping Cart app using React

> Source: https://www.geeksforgeeks.org/reactjs/shopping-cart-app-using-react/

In this article, we will create an Interactive and Responsive Shopping Cart Project Application using the famous JavaScript FrontEnd library ReactJS. We have named or Application as "GeeksforGeeks Shopping Cart". The application or project which we have developed mainly focuses on the functional components and also, manages the various state of the application. The developed project provides the feature to the user to browse different products or items, add the items to their cart, and also process the purchases. Users can also see the real-time amount of their purchase, and they can be able to remove the product added to the cart efficiently.
Let's have an interactive look at what our final project will look like:
Technologies Used/Pre-requisites:
Approach:
The given code presents the simple but functional full Shopping Cart project which we have named "GeeksforGeeks Shopping Cart". This project is completely developed using ReactJS and styling is applied in CSS. The developed interface allows users to perform different activities that Amazon cart and Flipkart cart provides like browsing the courses, adding that course to their cart, removing the course, seeing the real-time purchase amount, and projecting to the checkout. Integration of different functionalities can be easily done in this application like adding a payment gateway or adding more products or courses.
Project Structure:
The dependencies in package.json will look like this:
{
"name": "gfg-shopping-cart",
"version": "0.1.0",
"private": true,
"dependencies": {
"react": "^18.2.0",
"react-dom": "^18.2.0",
"vite": "^4.0.0",
"@vitejs/plugin-react": "^3.0.0"
}
}
Steps to create the application:
Step 1: Set up React project using the below command in VSCode IDE.
npm create vite@latest <<name-of-project>> --template react
Step 2: Navigate to the newly created project folder by executing the below command.
cd <<Name_of_project>>
Step 3: Create the components directory and create files SearchComponent.js, ShowCourseComponent.js, UserCartComponent.js
Example: Insert the below code in the App.js and App.css files mentioned in the above directory structure.
- App.js: This file represents the main component of the Shopping Cart Application, managing the state and managing the entire logic of adding the course to the cart, removing, managing the amount, and checkout.
- App.css: This file consists of all the styling code, whether it is h1 tag styling or cart empty message styling. All the look and feel of the application are specified in this styling file.
- SearchComponent.jsx: This file code holds the logic of the search bar, from which the user can search specific courses.
- ShowCourseComponent.jsx: This file consists of the code if showing the matched course as per the user input. In simple words, the card in which the course is been shown is rendered from this file.
- UserCartComponent.jsx: This file holds the logic to the user cart. Here, by using different props, the added course can be removed, user can select a quantity and perform different functionalities.
/* App.css */
body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #ffffff;
}
.App-header {
    background-color: #6cc24a;
    padding: 20px;
    color: white;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    text-align: center;
}
.App-main {
    display: flex;
    flex-wrap: wrap;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 20px;
}
/* Search Component */
.search-bar {
    width: 100%;
    max-width: 400px;
    margin: 0 auto;
    display: flex;
    align-items: center;
    background-color: white;
    border-radius: 20px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    padding: 5px 10px;
}
.search-bar input {
    flex: 1;
    padding: 10px;
    border: none;
    border-radius: 5px;
    font-size: 16px;
    background-color: #ffffff;
    transition: background-color 0.3s ease-in-out;
}
.search-bar input:focus {
    outline: none;
    background-color: #ffffff;
}
.search-icon {
    font-size: 1.2rem;
    margin-right: 10px;
    color: #6cc24a;
}
/* Product Display */
.product-list {
    flex: 2;
    display: flex;
    gap: 20px;
}
.product {
    background-color: rgb(255, 245, 245);
    border: 1px solid #1b4e1f;
    border-radius: 10%;
    padding: 10px 60px;
    text-align: center;
    width: 33%;
    transition: transform 0.2s ease-in-out;
    cursor: pointer;
    overflow: hidden;
    position: relative;
}
.product:hover {
    transform: translateY(-5px) scale(1.03);
}
.product img {
    max-width: 150px;
    /* Increased image size */
    height: auto;
    margin-bottom: 10px;
    border-radius: 50%;
    box-shadow: 0px 6px 12px rgba(0, 0, 0, 0.2);
    /* Enhanced box shadow */
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
    /* Added box shadow transition */
}
.product:hover img {
    transform: scale(1.1);
    z-index: 1;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.3);
    /* Enhanced box shadow on hover */
}
.product h2 {
    font-size: 1.5rem;
    margin: 10px 0;
    color: #323754;
}
.product p {
    font-size: 1.1rem;
    color: #777;
    margin: 5px 0;
}
/* Cart Checkout */
.cart {
    flex: 1;
    min-width: 300px;
    margin-top: 3%;
    background-color: #fff9e6;
    border: 2px solid #193d10;
    border-radius: 20px;
    padding: 10px 20px;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.1);
    display: none;
    position: sticky;
    top: 20px;
}
.cart.active {
    display: block;
}
.cart h2 {
    font-size: 1.8rem;
    color: #323754;
    margin-top: 0;
    text-align: center;
}
.cart ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
.cart-item {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
    align-items: center;
    margin: 15px 0;
    padding: 10px;
    border-bottom: 1px solid #e0e0e0;
}
.cart-item .item-image img {
    max-width: 90px;
    height: auto;
    margin-right: 20px;
    border-radius: 50%;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease-in-out;
}
.cart-item .item-image img:hover {
    transform: scale(1.1);
}
.cart-item .item-details {
    flex: 1;
    display: inline;
}
.cart-item h3 {
    display: inline;
    font-size: 1.4rem;
    margin: 0;
    color: #323754;
}
.cart-item p {
    font-size: 1.1rem;
    color: #777;
    margin: 5px 0;
}
.cart-item .item-actions {
    display: flex;
    flex-direction: row;
    align-items: center;
}
.cart-item .item-actions button {
    background-color: #6cc24a;
    border: none;
    color: white;
    padding: 8px 15px;
    border-radius: 20px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
    font-size: 1rem;
}
.cart-item .item-actions button:hover {
    background-color: #449e30;
}
.cart-item .quantity {
    display: flex;
    flex-direction: row;
    margin-left: 15px;
    font-size: 1rem;
    color: #323754;
}
.cart .total {
    font-size: 1.4rem;
    margin: 20px 0;
    text-align: right;
    color: #323754;
}
.cart .checkout-button {
    background-color: #6cc24a;
    border: none;
    color: white;
    padding: 10px 15px;
    border-radius: 20px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
    font-size: 1.2rem;
    float: left;
}
.cart .checkout-button:hover {
    background-color: #449e30;
}
.checkout-message {
    font-size: 1.4rem;
    margin-top: 30px;
    color: #6cc24a;
    text-align: center;
}
.no-results,
.empty-cart {
    text-align: center;
    font-size: 1.4rem;
    color: #777;
    margin-top: 20px;
}
@media screen and (max-width: 768px) {
    .App-main {
        flex-direction: column;
        align-items: center;
    }
    .product-list {
        width: 100%;
        margin-bottom: 5px;
    }
    .product {
        width: 50%;
    }
    .cart {
        min-width: unset;
        margin-top: 30px;
    }
}
.add-to-cart-button {
    background-color: #6cc24a;
    border: none;
    color: white;
    padding: 8px 15px;
    border-radius: 20px;
    cursor: pointer;
    transition: background-color 0.3s ease-in-out;
    font-size: 1rem;
}
.add-to-cart-button:hover {
    background-color: #449e30;
}
.item-info {
    display: flex;
    flex-direction: row;
}
.item-details {
    margin-top: 4%;
}
.item-actions .quantity p {
    margin: 10% 10%;
}
.product-list {
    padding-bottom: 5%;
    border-bottom: 2px solid green;
}
.checkout-section {
    float: right;
    margin: 0;
}
.checkout-section .checkout-button {
    background-color: #323754;
}
.checkout-section .checkout-button:hover {
    background-color: #4c5cb6;
}
//App.js
import React, { useState } from 'react';
import './App.css';
import SearchComponent from './components/SearchComponent';
import ShowCourseComponent from './components/ShowCourseComponent';
import UserCartComponent from './components/UserCartComponent';
function App() {
	const [courses, setCourses] = useState([
		{ id: 1, 
		name: 'GFG T-shirt', 
		price: 499, 
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20230823165506/gfg1.png'
		},
		{ id: 2, 
		name: 'GFG Bag', 
		price: 699, 
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20230823165553/gfg2.jpg'
		},
		{ id: 3, 
		name: 'GFG Hoodie', 
		price: 799, 
		image: 
'https://media.geeksforgeeks.org/wp-content/uploads/20230823165623/gfg3.jpg'
		}
	]);
	const [cartCourses, setCartCourses] = useState([]);
	const [searchCourse, setSearchCourse] = useState('');
	const addCourseToCartFunction = (GFGcourse) => {
		const alreadyCourses = cartCourses
							.find(item => item.product.id === GFGcourse.id);
		if (alreadyCourses) {
			const latestCartUpdate = cartCourses.map(item =>
				item.product.id === GFGcourse.id ? { 
				...item, quantity: item.quantity + 1 } 
				: item
			);
			setCartCourses(latestCartUpdate);
		} else {
			setCartCourses([...cartCourses, {product: GFGcourse, quantity: 1}]);
		}
	};
	const deleteCourseFromCartFunction = (GFGCourse) => {
		const updatedCart = cartCourses
							.filter(item => item.product.id !== GFGCourse.id);
		setCartCourses(updatedCart);
	};
	const totalAmountCalculationFunction = () => {
		return cartCourses
			.reduce((total, item) => 
						total + item.product.price * item.quantity, 0);
	};
	const courseSearchUserFunction = (event) => {
		setSearchCourse(event.target.value);
	};
	const filterCourseFunction = courses.filter((course) =>
		course.name.toLowerCase().includes(searchCourse.toLowerCase())
	);
	return (
		<div className="App">
			<SearchComponent searchCourse={searchCourse} 
							courseSearchUserFunction=
								{courseSearchUserFunction} />
			<main className="App-main">
				<ShowCourseComponent
					courses={courses}
					filterCourseFunction={filterCourseFunction}
					addCourseToCartFunction={addCourseToCartFunction}
				/>
				<UserCartComponent
					cartCourses={cartCourses}
					deleteCourseFromCartFunction={deleteCourseFromCartFunction}
					totalAmountCalculationFunction={
						totalAmountCalculationFunction
					}
					setCartCourses={setCartCourses}
				/>
			</main>
		</div>
	);
}
export default App;
//components/SearchComponent.js
import React from 'react';
function SearchComponent({ searchCourse, courseSearchUserFunction }) {
	return (
		<header className="App-header">
			<h1>GeeksforGeeks Shopping Cart</h1>
			<div className="search-bar">
				<input
					type="text"
					placeholder="Search for GFG Products..."
					value={searchCourse}
					onChange={courseSearchUserFunction}
				/>
			</div>
		</header>
	);
}
export default SearchComponent;
//components/ShowCourseComponent.js
import React from 'react';
function ShowCourseComponent({ courses, 
	filterCourseFunction, 
	addCourseToCartFunction }) {
	return (
		<div className="product-list">
			{filterCourseFunction.length === 0 ? (
				<p className="no-results">
					Sorry Geek, No matching Product found.
				</p>
			) : (
				filterCourseFunction.map((product) => (
					<div className="product" key={product.id}>
						<img src={product.image} alt={product.name} />
						<h2>{product.name}</h2>
						<p>Price: ₹{product.price}</p>
						<button
							className="add-to-cart-button"
							onClick={() => addCourseToCartFunction(product)}
						>
							Add to Shopping Cart
						</button>
					</div>
				))
			)}
		</div>
	);
}
export default ShowCourseComponent;
//components/UserCartComponent.js
import React from 'react';
function UserCartComponent({
	cartCourses,
	deleteCourseFromCartFunction,
	totalAmountCalculationFunction,
	setCartCourses,
}) {
return (
<div className={`cart ${cartCourses.length > 0 ? 'active' : ''}`}>
	<h2>My Cart</h2>
	{cartCourses.length === 0 ? (
	<p className="empty-cart">Geek, your cart is empty.</p>
	) : (
<div>
	<ul>
		{cartCourses.map((item) => (
			<li key={item.product.id} className="cart-item">
				<div>
					<div className="item-info">
						<div className="item-image">
							<img src={item.product.image} 
								alt={item.product.name} />
						</div>
						<div className="item-details">
							<h3>{item.product.name}</h3>
							<p>Price: ₹{item.product.price}</p>
						</div>
					</div>
					<div>
						<div className="item-actions">
							<button
								className="remove-button"
								onClick={() => 
								deleteCourseFromCartFunction(item.product)}>
								Remove Product
							</button>
							<div className="quantity">
								<button style={{ margin: "1%" }} 
									onClick={(e) => {
									setCartCourses((prevCartCourses) => {
										const updatedCart = prevCartCourses.map(
										(prevItem) =>
										prevItem.product.id === item.product.id
												? { ...prevItem, quantity: 
												item.quantity + 1 }
												: prevItem
										);
										return updatedCart;
									})
								}}>+</button>
								<p className='quant'>{item.quantity} </p>
								<button 
									onClick={(e) => {
									setCartCourses((prevCartCourses) => {
										const updatedCart = prevCartCourses.map(
										(prevItem) =>
										prevItem.product.id === item.product.id
												? { ...prevItem, quantity:
												Math.max(item.quantity - 1, 0) }
												: prevItem
										);
										return updatedCart;
									})
								}}>-</button>
							</div>
						</div>
					</div>
				</div>
			</li>
		))}
	</ul>
	<div className="checkout-section">
		<div className="checkout-total">
			<p className="total">Total Amount: 
				₹{totalAmountCalculationFunction()}
			</p>
		</div>
		<button
			className="checkout-button"
			disabled={cartCourses.length === 0 || 
			totalAmountCalculationFunction() === 0}
		>
			Proceed to Payment
		</button>
	</div>
</div>
			)}
</div>
	);
}
export default UserCartComponent;
Steps to run the application:
1. Run the application by executing the following command in the terminal.
npm run dev
2. Open a web browser like Chrome or Firefox and type the following URL in the address bar.
http://localhost:5173/
Output:
