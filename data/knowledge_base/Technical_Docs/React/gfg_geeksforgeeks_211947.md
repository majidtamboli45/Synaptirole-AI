# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-lists/

In React, lists are used to render multiple elements dynamically from arrays or objects, making UI development efficient and reusable. The map() function helps iterate over data and return JSX for repeated elements.
- Lists display dynamic data like users, products, or tasks in a structured way.
- The map() function iterates over arrays and returns JSX for each item.
- A unique key prop helps React efficiently update and re-render elements.
- Lists improve code readability, reusability, and overall performance.
function App() {
    const items = ['Apple', 'Banana', 'Cherry'];
    return (
        <div>
            <h1>My Fruit List</h1>
            <ul>
                {items.map((item, index) => (
                    <li key={index}>{item}</li>
                ))}
            </ul>
        </div>
    );
}
export default App;
Output
- The .map() function loops over the items array.
- Each item is rendered inside an <li> tag.
- The key prop should be added to uniquely identify each list item.
Note:
- Use a unique identifier like id when available.
- Avoid using array indexes as keys unless necessary (e.g., static lists without reordering).
const users = [
{ id: 1, name: "Aden" },
{ id: 2, name: "Alex" },
{ id: 3, name: "Nicol" }
];
Importance of the 'key' Prop in React Lists
In React lists, the key prop helps the DOM identify which elements are added, changed, or removed, enabling efficient updates and smoother rendering.
- Keys help React update only the changed elements instead of re-rendering the entire list.
- A unique key prevents unexpected UI behavior and improves performance.
List with Objects
Lists can also be created using objects where each item contains multiple properties.
const users = [
    { id: 1, name: 'Geeks', age: 30 },
    { id: 2, name: 'for', age: 25 },
    { id: 3, name: 'Geeks', age: 20 },
];
const App = () => {
    return (
        <ul>
            {users.map((user) => (
                <li key={user.id}>
                    {user.name} is {user.age} years old.
                </li>
            ))}
        </ul>
    );
}
export default App;
Output
Geeks is 30 years old.
for is 25 years old.
Geeks is 20 years old.
Conditional Rendering in Lists
Sometimes, you may want to render items conditionally based on certain conditions.
const App = () => {
    const users = [
        { id: 1, name: 'geeks', age: 30 },
        { id: 2, name: 'for', age: 25 },
        { id: 3, name: 'geeks', age: 35 },
    ];
    return (
        <ul>
            {users.map((user) => (
                user.age > 30 ? (
                    <li key={user.id}>{user.name} is over 30 years old</li>
                ) : (
                    <li key={user.id}>{user.name} is under 30 years old</li>
                )
            ))}
        </ul>
    );
};
export default App;
Output
geeks is under 30 years old
for is under 30 years old
geeks is over 30 years old
List with a Click Event
A React list with a click event displays items that trigger a function when clicked.
- Each list item uses an onClick event to handle user interaction.
- Clicking an item executes a function, often passing the item’s data.
- This makes lists interactive, allowing dynamic updates or UI changes based on user actions.
const App = () => {
    const COMPANY = ["GEEKS", "FOR", "GEEKS"];
    const handleClick = (COMPANY) => {
        alert(`You clicked on ${COMPANY}`);
    };
    return (
        <ul>
            {COMPANY.map((COMPANY, index) => (
                <button key={index} onClick={() => handleClick(COMPANY)}>
                    {COMPANY}
                </button>
            ))}
        </ul>
    );
};
export default App;
Output
- handleClick is a function that shows an alert with the name of the clicked item, triggered by the button’s onClick event.
- The list is rendered by iterating over the COMPANY array, generating a button for each item with a unique key prop.
