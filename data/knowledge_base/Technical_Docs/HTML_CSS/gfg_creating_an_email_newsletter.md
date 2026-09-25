# Creating an Email Newsletter

> Source: https://www.geeksforgeeks.org/html/how-to-create-an-email-newsletter

Creating an email newsletter involves using HTML for structure and CSS for styling, allowing you to deliver visually appealing updates directly to subscribers’ inboxes. Newsletters keep users informed about new content, updates, and important notifications.
- Use HTML to structure the newsletter content.
- Use CSS to style and format the newsletter.
- Notify subscribers about updates and new content.
- Keep users engaged and informed through regular emails.
Creating Structure: We will create a basic form structure for the email newsletter.
HTML code: It is used to design the structure of the newsletter form.
<!DOCTYPE html>
<html>
<head>
    <title>Email Newsletter</title>
</head>
<body>
    <form action="">
        <!-- Title and the content -->
        <h1>GeeksforGeeks</h1>
        <p>
            How many times were you frustrated while looking
            out for a good collection of programming/algorithm
            /interview questions? What did you expect and what
            did you get? This portal has been created to provide
            well written, well thought and well explained
            solutions for selected questions. Subscribe us to
            get daily tech update.
        </p>
        <!-- Fill up form for the user -->
        <div class="container">
            <input type="text" placeholder="Name" 
                   name="name" required>
            <input type="text" placeholder="E-mail" 
                   name="email" required>
            <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20191212104429/logo8.png">
            <br><br>
            <label>
                <input type="checkbox" checked="checked" 
                       name="check">
                Daily newsletter
            </label>
        </div>
        <!-- Button to subscribe -->
        <div class="btn">
            <button type="submit" placeholder="Subscribe" 
                    value="Subscribe">
                Subscribe
            </button>
            <p id=test> </p>
        </div>
    </form>
</body>
</html>
Designing Structure: In the previous section, we have created the structure of the basic form. In this section, we will design the structure for the email newsletter using CSS style.
CSS code: This CSS code is used with HTML code structure to make an email newsletter form.
h1 {
    color: green;
}
/* Container padding & border */
.container {
    padding: 24px;
    border: 2px solid #ccc;
}
/* Container image styling */
.container img {
    border-radius: 50%;
    width: 50px;
    float: right;
    margin: 5px;
}
/* input filed type text styling */
input[type=text] {
    width: 100%;
    padding: 12px;
    margin: 12px 0;
    border: 1px solid #ccc;
    box-sizing: border-box;
}
/* input filed type checkbox floating */
input[type=checkbox] {
    float: left;
}
/* button styling */
.btn button {
    background-color: #0E9D57;
    opacity: 0.8;
    color: white;
    font-size: 12px;
    width: 100%;
    padding: 12px;
    margin: 12px 0;
    border: none;
    border-radius: 5px;
    font-weight: bold;
}
/* hover affect on button */
.btn button:hover {
    opacity: 1;
}
Combining the HTML and CSS code: This example combines the above two sections (HTML and CSS code) to make an Email newsletter.
<!DOCTYPE html>
<html>
<head>
    <title>Email Newsletter</title>
    <style>
        h1 {
            color: green;
        }
        /* Container padding & border */
        .container {
            padding: 24px;
            border: 2px solid #ccc;
        }
        /* Container image styling */
        .container img {
            border-radius: 50%;
            width: 50px;
            float: right;
            margin: 5px;
        }
        /* input filed type text styling */
        input[type=text] {
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }
        /* input filed type checkbox floating */
        input[type=checkbox] {
            float: left;
        }
        /* button styling */
        .btn button {
            background-color: #0E9D57;
            opacity: 0.8;
            color: white;
            font-size: 12px;
            width: 100%;
            padding: 12px;
            margin: 12px 0;
            border: none;
            border-radius: 5px;
            font-weight: bold;
        }
        /* hover affect on button */
        .btn button:hover {
            opacity: 1;
        }
    </style>
</head>
<body>
    <form action="">
        <!-- Title and the content -->
        <h1>GeeksforGeeks</h1>
        <p>
            How many times were you frustrated while looking
            out for a good collection of programming/algorithm
            /interview questions? What did you expect and what
            did you get? This portal has been created to
            provide well written, well thought and well
            explained solutions for selected questions.
            Subscribe us to get daily tech update.
        </p>
        <!-- Fill up form for the user -->
        <div class="container">
            <input type="text" placeholder="Name" 
                   name="name" required>
            <input type="text" placeholder="E-mail" 
                   name="email" required>
            <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/20191212104429/logo8.png">
            <br><br>
            <label>
                <input type="checkbox" checked="checked" 
                       name="check">
                Daily newsletter
            </label>
        </div>
        <!-- Button to subscribe -->
        <div class="btn">
            <button type="submit" placeholder="Subscribe" 
                    value="Subscribe">
                Subscribe
            </button>
            <p id=test> </p>
        </div>
    </form>
</body>
</html>
Output:
