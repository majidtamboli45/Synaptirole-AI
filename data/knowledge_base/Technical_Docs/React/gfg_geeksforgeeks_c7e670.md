# GeeksforGeeks

> Source: https://www.geeksforgeeks.org/reactjs/reactjs-keys/

A key serves as a unique identifier in React, helping to track which items in a list have changed, been updated, or removed. It is particularly useful when dynamically creating components or when users modify the list.
When rendering a list, you need to assign a unique key prop to each element in the list. This helps React identify which elements have changed, been added, or been removed.
Syntax
const numbers = [1, 2, 3, 4, 5];
const updatedNums = numbers.map((number, index) =>
<li key={index}>
{number}
</li>
);
- map() loops over the numbers array.
- For each item, it creates an <li> element with the value of the number.
- The key for each <li> is assigned as the index of the item in the array.
Issue with index as keys
While React allows you to use the index of an array as a key, it is highly discouraged in most scenarios. Here’s why:
- Reordering the List: If the list items are reordered (e.g., through sorting), the keys will also change, as they are based on the array indices. This causes React to mistakenly treat the reordered items as entirely new elements, resulting in inefficient rendering and potentially losing the internal state of elements.
- Adding or Removing Items: When elements are added or removed, React may fail to correctly track the changes if the keys are based on the index. It might not efficiently update the DOM, leading to unnecessary re-renders and bugs.
Keys with Components
When extracting list items into separate components, assign the key to the component rather than the individual list items. This ensures that React can track changes to the component as a whole.
Incorrect usage of keys
import React from "react";
import ReactDOM from "react-dom/client";
// Component to be extracted
function MenuItems(props) {
	const item = props.item;
	return <li key={item.toString()}>{item}</li>;
}
// Component that will return an
// unordered list
function Navmenu(props) {
	const list = props.menuitems;
	const updatedList = list.map((listItems) => {
	return <MenuItems item={listItems} />; // Key is missing here
	});
	return <ul>{updatedList}</ul>;
}
const menuItems = [1, 2, 3, 4, 5];
const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
	<React.StrictMode>
		<Navmenu menuitems={menuItems} />
	</React.StrictMode>
);
Output
Correct usage of keys
import React from "react";
import ReactDOM from "react-dom";
// Component to be extracted
function MenuItems(props) {
    const item = props.item;
    return <li>{item}</li>;
}
// Component that will return an
// unordered list
function Navmenu(props) {
    const list = props.menuitems;
    const updatedList = list.map((listItems) => {
        return <MenuItems key={listItems.toString()} item={listItems} />;
    });
    return <ul>{updatedList}</ul>;
}
const menuItems = [1, 2, 3, 4, 5];
ReactDOM.render(
    <Navmenu menuitems={menuItems} />,
    document.getElementById("root")
);
Output
Uniqueness of Keys
It’s Important that keys assigned to the array elements are unique within the list. However, keys do not need to be globally unique, only unique within a specific array. This means that two different arrays can have the same set of keys without issues.
import React from "react";
import ReactDOM from "react-dom";
// Component to be extracted
function MenuItems(props) {
    const item = props.item;
    return <li>{item}</li>;
}
// Component that will return an
// unordered list
function Navmenu(props) {
    const list = props.menuitems;
    const updatedList = list.map((listItems) => {
        return <MenuItems key={listItems.toString()} item={listItems} />;
    });
    return <ul>{updatedList}</ul>;
}
const menuItems1 = [1, 2, 3, 4, 5];
const menuItems2 = [1, 2, 3, 4, 5, 6];
ReactDOM.render(
    <div>
        <Navmenu menuitems={menuItems1} />
        <Navmenu menuitems={menuItems2} />
    </div>,
    document.getElementById("root")
);
Output
Difference Between Keys and Props in React
| Props | Keys | 
|---|---|
| Used to pass data from parent to child components. | Used to uniquely identify elements in a list or collection. | 
| Props can be accessed within the component. | Keys are internal to React and cannot be accessed within the component. | 
| Passed into a component as data for rendering or behavior. | Assigned to elements (e.g., list items) to track them across renders. | 
| Props are passed and can be reused within the component. | Keys should be unique within the list but can be the same across different lists. | 
| Props define component behavior and data. | Keys help React optimize re-renders and track changes efficiently. |
