# HTML fieldset form Attribute

> Source: https://www.geeksforgeeks.org/html/html-fieldset-form-attribute

The form attribute in the <fieldset> tag specifies which <form> element the fieldset is associated with. It allows a <fieldset> to belong to a form even when it is placed outside the <form> element in the HTML document.
- Links a <fieldset> to a specific <form> using the form’s id
- Useful when <fieldset> is placed outside the <form> tag
- Ensures grouped form elements are submitted with the correct form
- Improves flexibility in form layout and structure
Syntax
<fieldset form="form_id">
Attribute Values
Attribute values specify the settings or options assigned to an HTML element’s attributes, determining its behavior or appearance.
form_id: The form attribute contains the form_id, which specifies the form that the <fieldset> element belongs to. The value should be the id of a <form> element.
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <style>
        h1,
        h2,
        .title {
            text-align: center;
        }
        
        fieldset {
            width: 50%;
            margin-left: 22%;
        }
        
        h1 {
            color: green;
        }
    </style>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h2>
      HTML <fieldset> 
      form Attribute
  </h2>
    <form id="mygeeks">
        <div class="title">
            Suggest article for video:
        </div>
    </form>
    <fieldset form="mygeeks">
        <legend>JAVA:</legend>
        Title:
        <input type="text">
        <br> Link:
        <input type="text">
        <br> User ID:
        <input type="text">
    </fieldset>
    <br>
    <fieldset form="mygeeks">
        <legend>PHP:</legend>
        Title:
        <input type="text">
        <br> Link:
        <input type="text">
        <br> User ID:
        <input type="text">
    </fieldset>
</body>
</html>
- <form id="mygeeks">: Defines a form container identified by an ID, used to associate external elements.
- <div class="title">: Displays a centered title section within the layout.
- <fieldset> elements: Linked to the form using form="mygeeks" even when placed outside it.
- First <fieldset>: Labeled "JAVA:" with inputs for Title, Link, and User ID.
- Second <fieldset>: Labeled "PHP:" with similar input structure.
Purpose of the form Attribute
The form attribute links a <fieldset> to a form elsewhere in the HTML, allowing its inputs to be submitted with that form even if not nested inside it, which is useful for complex page layouts.
- Links <fieldset> to a specific form using its id.
- Allows inputs to be part of the form data without being inside the <form> tag.
- Helps maintain layout flexibility while keeping logical form associations.
Important Points
By default, a <fieldset> belongs to the nearest <form> and helps group form elements logically, making the form more organized and accessible.
- By default, a <fieldset> is part of the nearest enclosing <form> element.
- A <fieldset> element located outside a form (but still a part of the form).
- It allows grouping form elements in a logical structure, making the form more organized and accessible.
