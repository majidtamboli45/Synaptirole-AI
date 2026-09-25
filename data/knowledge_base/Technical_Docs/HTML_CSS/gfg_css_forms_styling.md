# CSS Forms Styling

> Source: https://www.geeksforgeeks.org/css/css-styling-forms

CSS Form Styling enhances the look and usability of HTML forms. It allows customization of input fields, buttons, labels, and layouts to create clean, consistent, and user-friendly form designs.
Try It:
CSS Forms Styling
There are many CSS properties available which can be used to create and style HTML forms to make them more interactive, some of which are listed below:
1. Attribute Selector
The attribute type of the input form can take a variety of form depending on user's choice. It could be anything out of the possible types like text, search, url, tel, email, password, date pickers, number, checkbox, radio, file etc. User needs to specify type while creating a form.
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
    <head> 
<!--Driver Code Ends-->
        <style> 
        body{ 
            background-color:green; 
        } 
        </style> 
<!--Driver Code Starts-->
    </head> 
    <body> 
        <center> 
            <b>Is Geeksforgeeks useful ?</b> 
            <form> 
                <input type="radio" name="useful" value="yes" checked> 
                Yes <br> 
                <input type="radio" name="useful" value="def_yes"> 
                Definitely Yes 
            </form> 
        </center> 
    </body> 
</html>                     
<!--Driver Code Ends-->
Consider another example where the input type is simply a text:
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        body{ 
            background-color:green; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
    <form> 
        <b>Do you find Geeksforgeeks helpful?</b> 
            <br> 
        <input type="text" name="info"><br> 
    </form> 
    </center> 
</body> 
</html>                     
<!--Driver Code Ends-->
2. Styling the Width of Input
The width property is used to set the width of the input field.
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width:10%; 
        } 
        
        body{ 
            background-color:green; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
    <form> 
        <b>Do you find Geeksforgeeks helpful?</b> 
            <br> 
        <input type="text" name="info"><br> 
    </form> 
    </center> 
</body> 
</html>                
<!--Driver Code Ends-->
3. Add Padding in Inputs
The paddingproperty is used to add spaces inside the text field.
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width:10%; 
            padding: 12px; 
        } 
        
        body{ 
            background-color:green; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
        <form> 
            <b>Do you find Geeksforgeeks helpful?</b><br> 
            <input type="text" name="info"><br> 
        </form> 
    </center> 
</body> 
</html>                 
<!--Driver Code Ends-->
4. Set Margin for Inputs
The margin property is used to add space outside the input field. It is helpful when there are many inputs.
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width:10%; 
            margin: 8px; 
        } 
        
        body{ 
            background-color:green; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
    <form> 
        <b>Mention two topics that you liked on Geeksforgeeks</b> 
            <br> 
        <input type="text" name="info"><br> 
        <input type="text" name="info"><br> 
    </form> 
    </center> 
</body> 
</html>    
<!--Driver Code Ends-->
5. Adding Border and Border-radius
The border property is used to bring change in the size and color of the border whereas border-radius property is used for adding rounded corners. Consider the below example where a 2px solid red border is created with a border radius of 4px.
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width:10%; 
            margin: 8px; 
            border: 2px solid red; 
            border-radius: 4px; 
        } 
        
        body{ 
            background-color:green; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
        <form> 
            <b> 
                Mention two topics that you liked on 
                Geeksforgeeks 
            </b> 
            <br> 
            <input type="text" name="info"><br> 
            <input type="text" name="info"><br> 
        </form> 
    </center> 
</body> 
</html>  
<!--Driver Code Ends-->
Note: User can also have border at any particular side and remove others or have all borders of different color. Consider the below example where user want border only on top(blue color) and bottom(red color).
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width:10%; 
            margin: 8px; 
            border: none; 
            border-top: 3px solid blue; 
            border-bottom: 3px solid red; 
        } 
        
        body{ 
            background-color:green; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
        <form> 
            <b> 
                Mention two topics that you liked on 
                Geeksforgeeks 
            </b> 
            <br> 
            <input type="text" name="info"><br> 
            <input type="text" name="info"><br> 
        </form> 
    </center> 
</body> 
</html>                     
<!--Driver Code Ends-->
6. Adding Color to text and Background
The colorproperty is used to change the color of the text in the input and the background-color property is used to change the color of the background of the input field.
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width:10%; 
            margin: 8px; 
            border: none; 
            background-color: green; 
            color: black; 
        } 
        
        body{ 
            background-color:white; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
        <form> 
            <b> 
                Mention two topics that you liked 
                on Geeksforgeeks 
            </b> 
            <br> 
            <input type="text" name="info"><br> 
            <input type="text" name="info"><br> 
        </form> 
    </center> 
</body> 
</html>      
<!--Driver Code Ends-->
7. Focus Selector
When we click on the input field it gets an outline of blue color. You can change this behaviour by using :focus selector. Consider the below example where user wants a 3px solid red outline and green background when focused.
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width:10%; 
            margin: 8px; 
            color: black; 
        } 
        
        input[type=text]:focus { 
        border: 3px solid red; 
        background-color: green; 
        } 
        
        body{ 
            background-color:white; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
    <form> 
        <b> 
            Mention two topics that you liked 
            on Geeksforgeeks 
        </b> 
        <br> 
        <input type="text" name="info"><br> 
        <input type="text" name="info"><br> 
    </form> 
    </center> 
</body> 
</html> 
<!--Driver Code Ends-->
8. Adding images in the Input form
The background-image property can be used to put an image inside the input form and it can be positioned using background-position property and user can also decide whether to repeat or not.   Consider the example below with image in background with no-repeat mode. 
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width: 20%; 
            background-image: url('search.png'); 
            background-position: 10px 10px; 
            background-repeat: no-repeat; 
            padding: 12px 20px 12px 40px; 
        } 
        
        body{ 
            background-color:white; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
    <form> 
        <b>Search on Geeksforgeeks</b><br> 
        <input type="text" name="info" placeholder="Search.."><br> 
    </form> 
    </center> 
</body> 
</html>  
<!--Driver Code Ends-->
9. Transition Property
The transition property can be used over the input field to bring change in the size of the field by specifying the relaxed width and focused width along with the time period for which operation will take place.
<!--Driver Code Starts-->
<!DOCTYPE html> 
<html> 
<head> 
<!--Driver Code Ends-->
    <style> 
        input{ 
            width: 15%; 
            -webkit-transition: width 1s ease-in-out; 
            transition: width 1s ease-in-out; 
        } 
        
        input[type=text]:focus { 
            width: 30%; 
            border:4px solid blue; 
        } 
        
        body{ 
            background-color:green; 
        } 
    </style> 
<!--Driver Code Starts-->
</head> 
<body> 
    <center> 
    <form> 
        <b>Search on Geeksforgeeks</b><br> 
        <input type="text" name="info" placeholder="Search.."><br> 
    </form> 
    </center> 
</body> 
</html>                   
<!--Driver Code Ends-->
