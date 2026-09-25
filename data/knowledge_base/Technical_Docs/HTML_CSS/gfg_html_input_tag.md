# HTML input Tag

> Source: https://www.geeksforgeeks.org/html/html-input-tag

The HTML <input> tag is used to create interactive form controls that allow users to enter data in a webpage. It supports multiple input types such as text, password, email, number, and more for collecting user information.
- Used inside the <form> element to take user input.
- Can include attributes such as placeholder, required, readonly, and disabled.
- Plays a crucial role in form validation and user interaction.
<html>
<body>
	<form>
		<label for="username">Username:</label>
		<input type="text" id="username" name="username">
	</form>
</body>
</html>
- The <label> element with the for attribute associates the label "Username:" with the <input> field, enhancing accessibility.
- The <input> element of type "text" creates a single-line text input field where users can enter their username.
Syntax:
<input type="text" ... />
Note: The <input> Tag supports the Global Attributes & the Event Attributes in HTML.
Input Tag Types
<input> types specify the kind of data a user can enter in a form, such as text, email, password, or number.
| Input Type | Description | 
|---|---|
| <input type="text"> | Single-line text input | 
| <input type="password"> | Masked text input for passwords | 
| <input type="checkbox"> | Toggle for selecting multiple options | 
| <input type="radio"> | Single selection from multiple options | 
| <input type="submit"> | Button to submit form data | 
| <input type="button"> | General-purpose button | 
| <input type="file"> | Input for uploading files | 
| <input type="number"> | Input for numerical values | 
| <input type="date"> | Input for selecting dates | 
| <input type="email"> | Input for email addresses | 
| <input type="color"> | Input for selecting colors | 
| <input type="range"> | Slider for selecting a numeric value within a range | 
| <input type="hidden"> | Hidden input for form data | 
| <input type="image"> | Input using an image for form submission | 
Attributes
Attributes provide additional information and control the behavior of HTML elements, such as type, name, value, and required for the <input> tag.
| Attributes | Descriptions | 
|---|---|
| type | It is used to specify the type of the input element. Its default value is text. | 
| value | It is used to specify the value of the input element. | 
| placeholder | Placeholder attribute is used to specify hint that describes the expected value of an input field. | 
| name | It is used to specify the name of the input element. | 
| alt | It is used to provide alternative text for an image if it cannot be displayed, and is mainly used with <input type="image">. | 
| autofocus | It specifies that an element should automatically get focus when the page loads. | 
| accesskey | It assigns a keyboard shortcut to activate or focus an input element. | 
| checked | It specifies that an element should be pre-selected (checked) when the page loads. | 
| disabled | The disabled attribute specifies that the element should be disabled | 
| form | The form attribute is used to specify one or more forms to which the <input> element belongs to. | 
| max | It is used to specify the maximum value for an < input > element. | 
| required | It specifies that an input field must be filled out before submitting the form. | 
| readonly | It specifies that an input field is read-only. A read-only input field cannot be modified. | 
| accept | It is used to specify the types of files that the server accepts. | 
| autocomplete | It s used to specify whether an <input> element should have autocomplete enabled | 
| dirname | It is used to specify that the text direction will be submitted. | 
| formaction | It is used to specify the URL of the file that will process the input control when the form is submitted | 
| formenctype | It is used to specify how the form-data should be encoded when submitting it to the server | 
| formmethod | It is used to defines the HTTP method for sending data to the action URL | 
| formnovalidate | It is used to defines that form elements should not be validated when submitted | 
| formtarget | It is used to specify where to display the response that is received after submitting the form | 
| height | It is used to specify the height of an <input> element | 
| list | It is used to refers to a <datalist> element that contains pre-defined options for an <input> element | 
| maxlength | It is used to specify the maximum number of characters allowed in an <input> element | 
| min | It is used to specify a minimum value for an <input> element | 
| multiple | It is used to specify that a user can enter more than one value in an <input> element | 
| pattern | It is used to specify a regular expression that an <input> element's value is checked against | 
| size | It is used to specify the width, in characters, of an <input> element | 
| src | It is used to specify the URL of the image to use as a submit button | 
| step | It is used to specify the legal number intervals for an input field | 
| width | It is used to specify the width of an <input> element (only for type="image") | 
Example: Styled Password Input Field
<html>
<head>
	<style>
		input[type="password"] {
			border: 2px solid #4CAF50;
			border-radius: 4px;
			padding: 10px;
			width: 200px;
		}
	</style>
</head>
<body>
	<form>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password">
	</form>
</body>
</html>
- The <input> element of type "password" creates a field where users can enter sensitive information, with input characters masked for privacy.
- The CSS styles apply a green border, rounded corners, and padding to enhance the input field's appearance.
Example: Email Input Field with Placeholder
<html>
<head>
	<style>
		input[type="email"] {
			border: 1px solid #ccc;
			padding: 8px;
			font-size: 14px;
			width: 250px;
		}
	</style>
</head>
<body>
	<form>
		<label for="email">Email:</label>
		<input type="email" id="email" name="email"
		 placeholder="example@example.com">
	</form>
</body>
</html>
Best Practices for HTML <input> Elements
The <input> element of type "email" provides a field for users to enter an email address, with built-in validation for correct email formatting.
- Use Descriptive Labels: Link each input with a <label> for better accessibility.
- Implement Client-Side Validation: Use HTML5 attributes like required, pattern, and maxlength.
- Choose Appropriate Input Types: Match input types (e.g., email, number) to the expected data to enhance user experience.
