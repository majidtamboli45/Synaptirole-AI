# Button Tag vs Input Type="button" Attribute

> Source: https://www.geeksforgeeks.org/html/button-tag-vs-input-typebutton-attribute

The <input type="button"> and <button> tags both create buttons in HTML, but <button> provides greater flexibility by allowing nested content like text, images, or HTML elements, whereas <input> is limited to a single value.
- <button> can include text, images, or HTML elements inside it.
- <button> supports type attributes like submit, reset, or button.
- <input type="button"> only displays a single label via the value attribute.
- Buttons using <button> can be styled and structured more flexibly than <input>.
- <button> allows richer interactivity and layout customization within the element.
Note: The <button> tag uses opening and closing bracket but <input type="button"> attribute uses only single tag.
Example 1: This example uses <input type="button"> attribute to create button in HTML document.
<!DOCTYPE html>
<html>
<head>
    <script>
        function msg() {
            alert("values submitted");
        }
    </script>
</head>
<body style = "text-align:center;"> 
    <h1 style = "color:green;" >  GeeksForGeeks </h1> 
    <h2>Using Input type</h2> 
    <form>
        <label for="submit">
            Enter value
        </label>
        <input type = "text">
        <input type="button" id="submit" 
            onclick ="msg()" value="button"> 
    </form> 
    <p>
        here the input type button
        works properly
    </p>
</body>
</html>                    
Example 2: This example uses <button> tag to create button in HTML document.
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<body style = "text-align:center;"> 
    <h1 style = "color:green;"> GeeksForGeeks </h1> 
    <h2>The Button Element</h2>
<!--Driver Code Ends-->
    <form method="post" >
        <label for="uname"><b>Username</b></label>
        <input type="text" placeholder="Enter Username" 
                name="uname" required>
        <br>
        <label for="psw"><b>Password</b></label>
        <input type="password" placeholder="Enter Password"
                name="psw" required>
        <br>
        <button type="submit"><img src=
        "https://www.freeiconspng.com/uploads/login-button-png-4.jpg"
            height="40" width="100">
        </button><br>
        <button type="button" class="cancelbtn">Cancel</button>
        <span class="psw">Forgot <a href="#">password?</a></span>
    </form>
<!--Driver Code Starts-->
</body>
</html>                    
<!--Driver Code Ends-->
