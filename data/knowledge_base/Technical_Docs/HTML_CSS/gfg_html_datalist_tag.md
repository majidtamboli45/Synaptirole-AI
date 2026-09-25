# HTML datalist Tag

> Source: https://www.geeksforgeeks.org/html/html-datalist-tag

The <datalist> tag in HTML offers predefined options for an <input> field to assist user input.
- Users can select a value from the suggested list or enter a custom value.
- Enhances form usability by providing autocomplete suggestions.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<body>
  <form action="">
    <label>Your Cars Name: </label>
    <input list="cars">
<!--Driver Code Ends-->
    <datalist id="cars">
      <option value="BMW" />
      <option value="Bentley" />
      <option value="Mercedes" />
      <option value="Audi" />
      <option value="Volkswagen" />
    </datalist>
<!--Driver Code Starts-->
  </form>
</body>
</html>
<!--Driver Code Ends-->
Syntax:
<input list="datalist-id">
<datalist id="datalist-id">
<option value="Option 1">
<option value="Option 2">
<option value="Option 3">
...
</datalist>
Features of <datalist> Tag
The <datalist> tag provides a predefined list of options to an input field, enhancing user input with suggestions and flexibility.
- Autocomplete: Suggests matching options as the user types in the associated <input> field.
- User Input Flexibility: Allows users to select a listed option or enter a custom value.
- Cross-Browser Support: Supported by most modern browsers, with compatibility checks for older ones.
- Lightweight & Native: Works using pure HTML without any external libraries or JavaScript.
Example: This example demonstrates how the HTML <datalist> element provides predefined suggestions for an input field and displays the selected value dynamically using JavaScript when the button is clicked.
<!DOCTYPE html>
<html>
<body>
  <form action="">
    <label>Your Cars Name: </label>
    <input list="cars" id="carsInput" />
    <datalist id="cars">
      <option value="BMW" />
      <option value="Bentley" />
      <option value="Mercedes" />
      <option value="Audi" />
      <option value="Volkswagen" />
    </datalist>
    <button onclick="datalistcall()" type="button">
      Click Here
    </button>
  </form>
  <p id="output"></p>
  <script type="text/javascript">
    function datalistcall() {
      var o1 = document.getElementById("carsInput").value;
      document.getElementById("output").innerHTML =
        "You select " + o1 + " option";
    }
  </script>
</body>
</html>
