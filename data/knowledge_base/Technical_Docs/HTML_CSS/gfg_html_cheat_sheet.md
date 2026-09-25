# HTML Cheat Sheet

> Source: https://www.geeksforgeeks.org/html/html-cheat-sheet

HTML (HyperText Markup Language) is the core language of the web, structuring content and defining how web pages display and interact across all platforms.
- Forms the backbone of every web page.
- Structures text, images, videos, and other content.
- Universally supported across all browsers and frameworks.
- Includes semantic elements for meaningful markup.
- Supports mobile optimization and responsive design.
- Cheat sheets provide quick reference for beginners and pros.
Main root
The <html> element represents the root (top-level element) of an HTML document also called the document element. All other elements must be descendants of this element.
<html> … </html>
Boilerplate
<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Description of the document -->
    <meta charset="UTF-8" />
    <title>
        <!-- title goes here -->
        Geeks For Geeks
    </title>
</head>
<body>
    <!-- your content goes here -->
    Welcome to Geeks for Geeks
</body>
</html>
- Sets up a basic HTML page with UTF-8 character encoding and a title: “Geeks For Geeks”.
- Displays the text “Welcome to Geeks for Geeks” in the body of the page.
Headings
HTML heading tags (<h1> to <h6>) are used to define headings and subheadings on your webpage.
The <h1> tag is typically reserved for the page’s main title, while the others denote subheadings in descending order of importance.
| Heading Tags | Description | Syntax | 
|---|---|---|
| <h1> | Used for title generally once per page and has a font size of 2em. | <h1>....</h1> | 
| <h2> | Used for medium sized titles and has a font size of 1.5em. | <h2>....</h2> | 
| <h3> | Used for subsections and has a font size of 1.17em. | <h3>....</h3> | 
| <h4> | Used for highlighting text with font size of 1em. | <h4>....</h4> | 
| <h5> | Fifth level heading with font size of .83em. | <h5>....</h5> | 
| <h6> | Displays least significant details and has a font size of .67em | <h6>....</h6> | 
<!DOCTYPE html>
<html>
<head>
    <title>Heading Tags</title>
</head>
<body>
    <h1>GeeksforGeeks</h1>
    <h2>GeeksforGeeks</h2>
    <h3>GeeksforGeeks</h3>
    <h4>GeeksforGeeks</h4>
    <h5>GeeksforGeeks</h5>
    <h6>GeeksforGeeks</h6>
</body>
</html>
- Displays the text “GeeksforGeeks” using all six heading levels: <h1> (largest) to <h6> (smallest).
- Demonstrates how HTML headings decrease in size and importance from h1 to h6.
Container
Container tags in HTML are used to group other elements together. They provide a way to structure your HTML and apply styles to multiple elements at once. The several container tags in HTML are:
| Tags | Description | Syntax | 
|---|---|---|
| <div> | Block element that defines a division in HTML document. | <div>... </div> | 
| <span> | Inline element used to mark up a part of a text or document. | <span>...</span> | 
| <p> | Used to represent a paragraph. | <p>...</p> | 
| <pre> | Represents pre-formatted text to present exactly as written in the HTML file. | <pre>...</pre> | 
| <code> | Used to represent source codes | <code>...</code> | 
<!DOCTYPE html>
<html>
<head>
    <title> GeeksforGeeks </title>
    <meta name="keywords" content="Meta Tags, Metadata" />
    <meta name="description" content="Geeksforgeeks is a computer science portal." />
    <style type="text/css">
        body {
            background-color: powderblue;
        }
        
        h1 {
            color: black;
            font-family: arial;
        }
    </style>
</head>
<body>
    <p>
        GeeksforGeeks is a
        <!-- span tag starts-->
        <span style="color:red;font-weight:bolder">
            computer science</span> portal for
        <span style="background-color: lightgreen;">
            geeks
        </span>
        <!-- span tag ends -->
        <!-- pre tag starts here -->
    <pre>
        This
        is    a pre tag.
      </pre>
    </p>
    <!-- html pre tag ends here -->
    <!--code Tag starts here -->
    code tag: Displays code snippets.
    <code>
        #include<stdio.h>
            int main() {
            printf("Hello Geeks");
            }
            <!--code Tag ends here -->
    </code>
    <p>
        Click on the following link
        <!-- anchor tag starts -->
        <a href="https://www.geeksforgeeks.org/">
            GeeksforGeeks
        </a>
        <!-- anchor tag ends -->
    </p>
</body>
</html>
- Sets page title, meta keywords, description, and internal CSS for background and heading styles.
- Displays a paragraph where <span> is used to highlight text in red and light green.
- Uses <pre> to show preformatted text preserving spaces and line breaks.
Document Information
This section encompasses HTML tags that provide a comprehensive summary of the content within the HTML document. These tags offer a snapshot of what the document contains, enhancing the understanding of its structure and content.
| Tags | Description | Syntax | 
|---|---|---|
| <head> | Container for metadata which is data about data. | <head>...</head> | 
| <link> | Used to link external style sheets or documents. | <link> | 
| <meta> | Defines metadata about HTML document. | <meta/> | 
| <title> | Defines the document's title | <title>...</title> | 
| <style> | Used to define style information (CSS) for a document. | <style>...</style> | 
<!DOCTYPE html>
<html>
<!-- head tag starts here -->
<head>
    <!-- title tag -->
    <title>Title goes here </title>
    <!-- link tag  -->
    <link rel="stylesheet" type="text/css" href="style.css">
    <!-- meta tag starts -->
    <meta name="keywords" content="Meta Tags, Metadata" />
    <!-- meta tag ends -->
    <!-- style tag starts here -->
    <style>
        #first {
            font-family: Castellar;
            background-color: green;
            color: white;
        }
        
        .second {
            text-align: center;
            background-color: white;
            font-size: 30px;
            color: red;
        }
    </style>
    <!-- style tag ends here -->
</head>
<!-- head tag ends here -->
<body>
    <p id="first">Hello GeeksforGeeks.</p>
    <p class="second">Welcome Geeks</p>
</body>
</html>
- Sets up the page with a title, external CSS link, and meta keywords in the <head>.
- Defines internal CSS using a <style> block for #first and .second styling.
- Displays two <p> elements applying these styles with different formatting.
Semantic Element
Semantic Element in HTML are elements that clearly describe their meaning in terms of content and function, both to the browser and the developer.
| Tags | Description | Syntax | 
|---|---|---|
| <header> | Used to give introductory content about the document. | <header>... </header> | 
| <main> | Represents the main dominant content of a document. | <main>... </main> | 
| <section> | Structural HTML element used to group together related elements. | <section>... </section> | 
| <nav> | Represents a section of a page to provide navigation links | <nav>...</nav> | 
| <article> | Represents a self-contained composition which is independently distributable or reusable. | <article>... </article> | 
| <aside> | Defines some content aside from the content it is placed in. | <aside>... </aside> | 
| <footer> | Represents a footer for its sectioning root element | <footer>... </footer> | 
| <address> | Provides contact information for a person, people, or an organization. | <address>..</address> | 
<!DOCTYPE html>
<html>
<body>
    <h3>HTML Header Tag</h3>
    <hr>
    <article>
        <!-- header tag starts -->
        <header>
            <h3>GeeksforGeeks Learning</h3>
            <h3> HTML nav Tag</h3>
            <!-- nav tag starts -->
            <nav>
                <a href="#">Home</a> |
                <a href="#">Interview</a> |
                <a href="#">Languages</a> |
                <a href="#">Data Structure</a> |
                <a href="#">Algorithm</a>
            </nav>
            <!-- nav tag ends -->
        </header>
        <!-- header tag ends -->
    </article>
    <!-- main tag starts here -->
    <main>
        <!-- HTML section tag is used here -->
        <section>
            <h1>Geeksforgeek: Section 1</h1>
            <p>Content of section </p>
        </section>
        <!-- HTML section tag ends here -->
        <!-- aside tag starts here -->
        <aside>
            <h1>This is heading text in aside Tag</h1>
            <p>This is paragraph text in aside Tag</p>
        </aside>
        <!-- aside tag ends here -->
    </main>
    <!-- main tag ends here -->
    <!--HTML footer tag starts here-->
    <footer>
        <article>
            <!-- address tag starts from here -->
            <address>
                Organization Name: GeeksforGeeks <br>
                Web Site:
                <a href="https://www.geeksforgeeks.org//about/contact-us/">
                    GeeksforGeeks</a><br>
                visit us:<br>
                GeeksforGeeks<br>
                A-118, Sector 136, Noida, <br>
                Uttar Pradesh (201305)
            </address>
            <!-- address tag ends here -->
        </article>
        <br>
        <a href="https://www.geeksforgeeks.org//about/">
            About Us
        </a>|
        <a href="https://www.geeksforgeeks.org/legal/privacy-policy/">
            Privacy Policy
        </a>|
        <a href="https://accounts.zoho.in/signin?servicename=ZohoRecruit&hide_signup=false&serviceurl=%2Frecruit%2FIAMSecurityError.do%3Fisload%3Dtrue&hide_secure=true">
            Careers
        </a>
        <p>@geeksforgeeks, Some rights reserved</p>
    </footer>
    <!-- footer tag ends here -->
</body>
</html>
- Displays a page header with the title “GeeksforGeeks Learning” and a navigation menu with links like Home, Interview, Languages, etc.
- The <main> section contains a content section (Section 1) and a sidebar (aside) with additional text.
- The <footer> shows organization contact info using <address> and includes links for About Us, Privacy Policy, and Careers, along with a copyright note.
Text Formatting and Inline Text Semantics
Text formatting tags in HTML, are used to format text in different ways, like making text bold, italicized, or monospaced. The HTML inline text semantics is used to define the meaning, structure, or style of a word, line, or any arbitrary piece of text.
| Tags | Description | Syntax | 
|---|---|---|
| <em> | Used to put stress on some text or show some degree of emphasis. | <em>...</em> | 
| <strong> | Indicates that the content has strong importance. | <strong>...</strong> | 
| <sub> | Writes the text as subscript. | <sub>...</sub> | 
| <sup> | Writes the text as superscript. | <sup>...</sup> | 
| <abbr> | Represents an abbreviation or acronym. | <abbr>... </abbr> | 
| <mark> | Highlights important text for reference or notation purposes. | <mark>...</mark> | 
| <cite> | Describes the title of a creative work. | <cite>...</cite> | 
| <time> | Used to represent a specific period of time. | <time>...</time> | 
<!DOCTYPE html>
<html>
<head>
    <title> Geeks for Geeks </title>
</head>
<body>
    <!-- emphasis -->
    <div><em>Emphasized text</em></div>
    <!-- strong -->
    <div><strong>Important text!</strong></div>
    <!-- subscript -->
    <div>GFG<sub>subscript text</sub></div>
    <!-- superscript -->
    <div>GFG<sup>Superscript text</sup></div>
    <!-- abbreviation -->
    <div><abbr>Abbreviation</abbr></div>
    <!-- mark -->
    <div><mark>Highlighted text</mark></div>
    <!-- cite -->
    <div><cite>Title of creative work</cite></div>
    <!-- time -->
    <div>Time<time>9:00 am</time>
        to <time>7:00 pm</time>
    </div>
</body>
</html>
- Displays emphasized text: “Emphasized text” and important text: “Important text!”.
- Shows subscript (GFGsubscript text) and superscript (GFGSuperscript text).
- Displays an abbreviation (Abbreviation) and highlighted text (Highlighted text).
- Shows a citation (Title of creative work).
- Displays time range from 9:00 am to 7:00 pm.
Lists
List tags in HTML, including <ul>, <ol>, and <li>, are used to create different types of lists. It can be either numerical, alphabetic, bullet, or other symbols. There are three list types in HTML:
- Unordered list: Used to group a set of related items in no particular order.
- Ordered list: Used to group a set of related items in a specific order.
- Description list: Used to display name/value pairs such as terms and definitions.
| Tags | Description | Syntax | 
|---|---|---|
| <ul> | Represents an unordered list of items list. | <ul>...</ul> | 
| <ol> | The HTML <ol> element represents an ordered list of items. | <ol>...</ol> | 
| <li> | Represents an item in a list. | <li>...</li> | 
| <dl> | Represents a description list. | <dl>...</dl> | 
| <dd> | Used to describe a term/name in a description list. | <dd>...</dd> | 
| <dt> | Specifies a term in a description. | <dt>...</dt> | 
<!DOCTYPE html>
<html>
<head>
    <title>GeeksforGeeks</title>
</head>
<body>
    <h2>Welcome To GeeksforGeeks Learning</h2>
    <h5>Unordered List</h5>
    <!-- Unordered List -->
    <ul>
        <li>Data Structures & Algorithm</li>
        <li>Web Technology</li>
        <li>Aptitude & Logical Reasoning</li>
    </ul>
    <h5>Ordered List</h5>
    <!-- Ordered List -->
    <ol>
        <li>Array</li>
        <li>Linked List</li>
        <li>Stacks</li>
    </ol>
    <h5>Description List</h5>
    <!-- Description List -->
    <dl>
        <dt>Courses:</dt>
        <dd>100 </dd>
        <dt> Quizes:</dt>
        <dd> 500 </dd>
        <dt> Interview Experiences:</dt>
        <dd>1000 </dd>
    </dl>
</body>
</html>
- <select> :Creates a dropdown list for choosing one option.
- <input> :Lets users enter data (text, email, date, etc.).
- <input type="radio"> :Lets users select one option from multiple choices.
- <datalist> :Provides suggested options for an input field.
- <textarea> :Lets users enter multi-line text (like an address).
- <button type="submit"> :Submits the form data.
- <progress> :Shows a progress bar with a value out of a maximum.
Tables
Table tags in HTML, such as <table>, <tr>, <td>, and <th>, are used to create and structure tables in HTML. They allow you to present data in rows and columns.
| Tags | Description | Syntax | 
|---|---|---|
| <caption> | Specifies caption of a table. | <caption>…</caption> | 
| <table> | Represents data in a two-dimensional table. | <table>…</table> | 
| <thead> | Used to provide a header to the group of content in an HTML table | <thead>…</thead> | 
| <tbody> | Used to group primary content of an HTML table. | <tbody>…</tbody> | 
| <th> | Defines a cell as header of a group of cells of the table. | <th>…</th> | 
| <td> | Defines a cell of a table. | <td>…</td> | 
| <tr> | Defines a row in an HTML table. | <tr>…</tr> | 
| <tfoot> | Defines a set of rows summarizing the columns of the table. | <tfoot>…</tfoot> | 
<!DOCTYPE html>
<html>
<head>
    <title>HTML Table</title>
</head>
<body>
    <!-- table starts here -->
    <table>
        <!-- Table Caption -->
        <caption>Geeks For Geeks Learning</caption>
        <!-- Table row starts -->
        <tr>
            <!--Headers -->
            <th>Programming Languages</th>
            <th>Development</th>
        </tr>
        <!-- Table row ends -->
        <tr>
            <!-- Table data -->
            <td>C programming </td>
            <td>Full stack development</td>
        </tr>
        <tr>
            <td>Java programming</td>
            <td>Backend development</td>
        </tr>
        <tr>
            <td>Angular </td>
            <td>Frontend Development</td>
        </tr>
        <!-- Table Footer starts here -->
        <tfoot>
            <tr>
                <td>Footer content</td>
            </tr>
        </tfoot>
        <!-- Table footer ends here -->
    </table>
</body>
</html>
- <table> :Creates a table.
- <caption> :Adds a title above the table.
- <tr> :Defines a table row.
- <th> :Defines a header cell (bold and centered by default).
- <td> :Defines a regular table cell with data.
- <tfoot> :Defines the footer of the table, usually for summary or notes.
Forms
An HTML form is a section of a document that acts as a container for different types of input elements, such as text fields, passwords, menus, checkboxes, radio buttons, submit buttons, etc.
Generally, Form tags in HTML, like <form>, <input>, <textarea>, and <button>, are used to create forms for user input.
| Tags | Description | Syntax | 
|---|---|---|
| <form> | Represents a section containing controls for submitting information. | <form>...</form> | 
| <input> | Creates interactive controls for forms to accept data. | <input>...</input> | 
| <textarea> | Create a multi-line plain-text editing control | <textarea>...</textarea> | 
| <select> | Represents a control that provides a menu of options to select from. | <select>...</select> | 
| <option> | Defines an option in a select list. | <option>...</option> | 
| <optgroup> | Creates a grouping of options within a <select> element. | <optgroup>.</optgroup> | 
| <progress> | Displays an indicator showing the degree of completion of a task. | <progress>...</progress> | 
| <datalist> | Used to give predefined options for an <input> element and adds an autocomplete feature to it. | <datalist>...</datalist> | 
| <button> | Represents a clickable button. | <button>...</button> | 
| <label> | Specifies a label for an <input> element. | <label>...</label> | 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GfG</title>
</head>
<body>
    <form>
        <fieldset>
            <legend>Personal Details</legend>
            <p>
            <p>select used here:</p>
            <!-- label starts -->
            <label>
                Salutation
                <br />
                <!-- select starts -->
                <select name="salutation">
                    <option>--None--</option>
                    <option>Mr.</option>
                    <option>Ms.</option>
                    <option>Mrs.</option>
                </select>
                <!-- select ends -->
            </label>
            <!-- label ends -->
            </p>
            <p>
                <label>First name: 
                  <input name="firstName" placeholder="input element used here" />
                </label>
            </p>
            <p>
                <label>Last name: <input name="lastName" /></label>
            </p>
            <p>
                Gender :
                <label>
                  <input type="radio" name="gender" value="male" /> Male
                </label>
                <label>
                  <input type="radio" name="gender" value="female" /> Female
                </label>
            </p>
            <label Language preferred: </label>
                <input list="lang" placeholder="datalist used here">
                <!--datalist Tag starts here -->
                <datalist id="lang">
                    <option value="java"></option>
                    <option value="reactjs"></option>
                    <option value="php"></option>
                    <option value="python"></option>
                </datalist>
                <!--datalist Tag ends here -->
                <p>
                    <label>Email:
                       <input type="email" name="email" />
                    </label>
                </p>
                <p>
                    <label>Date of Birth:
                       <input type="date" name="birthDate"/>
                    </label>
                </p>
                <p>
                    <!-- HTML address tag -->
                    <label>
                        Address :
                        <br />
                        <!--Textarea  -->
                        <textarea name="address" 
                                  placeholder="Textarea used here">
                        </textarea>
                    </label>
                </p>
                <p>
                    <button type="submit">Submit</button>
                </p>
                <p>Progress tag used here:</p>
                Downloading progress for your profile:
                <!--HTML progress tag starts here-->
                <progress value="57" max="100" placeholder="progress tag used here">
                </progress>
                <!--HTML progress tag ends here-->
        </fieldset>
    </form>
</body>
</html>
- Creates a form using <form> and <fieldset> with a legend for grouping
- Uses <select> for salutation and <input> fields for name, email, and date of birth
- Includes <input type="radio"> for gender selection
- Uses <input list> with <datalist> for language suggestions
- Provides <textarea> for address input
- Adds a submit button to send form data
- Displays a <progress> bar to indicate download progress
Multimedia
Multimedia tags in HTML, such as <img>, <audio>, and <video>, are used to embed multimedia content like images, audio files, and videos into your webpage.
| Tags | Description | Syntax | 
|---|---|---|
| <img> | Used to link images to web pages. | <img /> | 
| <audio> | Used to include sound content in documents. | <audio>...</audio> | 
| <video> | Embeds a media player which supports video files in the document. | <video>...</video> | 
| <figure> | Groups various diagrams, images, illustrations, and code snippets into the document. | <figure>...</figure> | 
| <figcaption> | Used to provide the caption of the content. | <figcaption>...</figcaption> | 
| <embed> | Embeds multimedia on a Web page | <embed>...</embed> | 
| <object> | Includes objects, such as images, audio, videos, and Portable Document Format (PDF) on a Web page. | <object>...</object> | 
<!DOCTYPE html>
<html>
<body style="text-align: center;">
    <p>image here</p>
    <!-- image tag starts here-->
    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/geeksforgeeks-13.png" 
         width="420" height="100" alt="Geeksforgeeks.org">
    <!-- image tag ends here-->
    <p> Audio Sample</p>
    <!-- audio tag starts here -->
    <audio controls>
        <source src="test.mp3" type="audio/mp3">
        <source src="test.ogg" type="audio/ogg">
    </audio>
    <!-- audio tag ends here -->
    <p> Video sample</p>
    <!-- Video tag starts here -->
    <video width="400" height="350" controls>
        <source src="myvid.mp4" type="video/mp4">
        <source src="myvid.ogg" type="video/ogg">
    </video>
    <!-- Video tag ends here -->
    <p> HTML Figure here</p>
    <!--HTML figure tag starts here-->
    <figure>
        <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/geeks-25.png" 
             width="304" height="228" alt="The Pulpit Rock">
        <figcaption>Figure Caption goes here </figcaption>
    </figure>
    <!--HTML figure tag ends here-->
    <p> HTML Object here</p>
    <!--HTML object tag starts here-->
    <object data=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/Geek_logi_-low_res.png"
            width="550px" height="150px">
        GeeksforGeeks
        <!--HTML object tag ends here-->
    </object>
</body>
</html>
- This HTML page demonstrates multimedia and embedded content: it includes an image (<img>), audio (<audio>), video (<video>), figure with caption (<figure> + <figcaption>), and an object (<object>).
- Each media element uses attributes like src, width, height, controls, and alt to define the content, size, accessibility, and interactivity.
Characters and Symbols
Special characters and symbols in HTML, like & for an ampersand or < for a less-than sign, are used to display characters that have special meaning in HTML. Some of the most commonly used ones are:
| Symbol | Description | Entity Name | Number Code | 
|---|---|---|---|
| © | Copyright | © | © | 
| & | Ampersand | & | & | 
| > | Greater than | > | > | 
| < | Less than | < | < | 
| $ | Dollar | $ | $ | 
| " | Quotation mark | " | " | 
| ' | Apostrophe | ' | ' | 
<!DOCTYPE html>
<html lang="en">
<head>
    <title>HTML Characters and Symbols</title>
</head>
<body>
    <!-- Characters and Symbols are use inside of p element -->
    <p>This is the sign of copyright: © </p>
    <p>This is the sign of trademark: ™ </p>
    <p>This is the sign of ampersand: @ </p>
    <p>This is the sign of dollar : $ </p>
    <p>This is the sign of less than : < </p>
            <p>This is the sign of greater than : > </p>
            <p>This is the sign of quotation mark : " </p>
</body>
</html>
- The HTML <p> elements display various characters and symbols, including copyright (©), trademark (™), ampersand (@), dollar ($), less than (<), greater than (>), and quotation mark (").
- Each symbol is directly written inside the paragraph, demonstrating how special characters can be used in HTML content.
Attributes
Attributes in HTML are used to provide additional information about HTML elements. They are always specified in the start tag and usually come in name/value pairs like name="value". The name is the property you want to set and the value is the desired value of the attribute.
| Attributes | Description | Syntax | 
|---|---|---|
| alt | Used in the image tag to specify the alternative text of the image | < tag_name alt ="..." > | 
| href | Used to define a hyperlink. | < tag_name href ="..." > | 
| src | Specifies URL of the image to be used. | < tag_name src ="..." > | 
| width | Specifies the width of the image in pixels. | < tag_name width ="..." > | 
| height | Specifies the height of the image in pixels. | < tag_name height ="..." > | 
| style | Helps to change the look and feel of the document. | < tag_name style ="..." > | 
| id | Unique identifier used to specify an area of a webpage. | < tag_name id ="..." > | 
| class | Specifies one or more class names for an element. | < tag_name class ="..." > | 
| title | Specifies extra information about an element. | < tag_name title ="..." > | 
| Placeholder | Specifies a short hint that describes the expected value of an input field/text area | <tag_name placeholder=" "> | 
<!DOCTYPE html>
<html>
<head>
    <title>HTML Attributes</title>
    <style>
        #geeks {
            background-color: green;
            color: white;
        }
        
        .gfg {
            background-color: white;
            font-size: 30px;
            color: red;
        }
    </style>
</head>
<body>
    <!-- source attribute-->
    <div>
        <p>source attribute:</p>
        <img src=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/Geek_logi_-low_res.png">
    </div>
    <!--Alternative text: alt attribute -->
    <div><img src=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads../Geek_logi_-low_res.png" 
          alt="Alternative text here">
    </div>
    <br>
    <!-- Link: href attribute-->
    <a href="https://www.geeksforgeeks.org/">
        Click to open in the same tab
    </a>
    <br>
    <a href="https://www.geeksforgeeks.org/" target="_blank">
        Click to open in a different tab
    </a>
    <!-- title attribute-->
    <h2 title="GeeksforGeeks: A computer science
    portal for geeks">
        Title attribute: hover to see the effect
    </h2>
    <!-- Width and Height attribute-->
    <p>Using width and height attribute here:</p>
    <img src=
"https://media.geeksforgeeks.org/wp-content/cdn-uploads/Geek_logi_-low_res.png" 
         width="300px" height="100px">
    <!-- id attribute-->
    <h2 id="geeks">
        Styling using id attribute here
    </h2>
    <!-- class attribute -->
    <h2 class="gfg">
        Styling using class attribute here
    </h2>
    <!-- style -->
    <h2 style="font-family:Chaparral Pro Light; ">
        Styling using style attribute here
    </h2>
</body>
</html>
- Demonstrates HTML attributes in action using images, links, headings, and styling.
- Shows <img> with src (image source), alt (alternative text), and width/height.
- Shows <a> with href (link) and target (open in same or new tab).
- Uses title attribute on heading to show tooltip on hover.
- Applies id, class, and inline style attributes to style headings with CSS.
Link Tags
Link tags are used to define hyperlinks, which allow users to navigate between pages or sections within a webpage.
| Tag | Description | Syntax | 
|---|---|---|
| <a> | Defines a hyperlink (used for linking to other pages or sections). | <a href="URL">Link Text</a> | 
| <link> | Defines the relationship between the document and an external resource (usually for stylesheets) | <link rel="stylesheet" href="style.css"> | 
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML Link Tags Example</title>
    <!-- Link to an external stylesheet -->
    <link rel="stylesheet" href="styles.css">
    <!-- Link to a favicon -->
    <link rel="icon" href="favicon.ico" type="image/x-icon">
    <!-- Preload an image for faster loading -->
    <link rel="preload" href="image.jpg" as="image">
</head>
<body>
    <!-- Hyperlink using <a> -->
    <a href="https://www.example.com/" target="_blank">Visit Example.com</a>
    <!-- Base tag to specify base URL for relative links -->
    <base href="https://www.example.com//">
    <a href="page.html">Go to Page</a> <!-- This will link to https://www.example.com//page.html -->
    <!-- Download link using <a> tag -->
    <a href="file.txt" download="SampleFile">Download File</a>
</body>
</html>
- The <head> section includes metadata, links to an external CSS file, a favicon, and preloads an image for faster page loading.
- The <body> contains <a> tags for a standard hyperlink (opens in new tab), a base-relative link, and a downloadable file link.
HTML Events Tags
HTML events are used to execute code when certain actions or user interactions occur. These can be applied to most HTML tags.
| Event | Description | Syntax | 
|---|---|---|
| onclick | Occurs when an element is clicked. | <button onclick="alert('Clicked!')">Click Me</button> | 
| onmouseover | Occurs when the mouse pointer is moved over an element. | <div onmouseover="changeColor()">Hover Me</div> | 
| onchange | Occurs when the value of an element changes. | <input type="text" onchange="alert('Changed!')"> | 
| onload | Occurs when a page or image has loaded. | <img src="image.jpg" onload="alert('Loaded!')"> | 
| onkeydown | Occurs when a key is pressed down. | <input type="text" onkeydown="checkKey()"> | 
| onfocus | Occurs when an element gains focus. | <input type="text" onfocus="this.style.background='yellow'"> | 
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HTML Event Example</title>
    <script>
        // Function to handle the click event
        function showClickAlert() {
            alert("You clicked the button!");
        }
        // Function to handle mouseover event
        function changeBackgroundColor() {
            document.getElementById("hoverDiv").style.backgroundColor = "lightblue";
        }
        // Function to handle onchange event
        function showChangeAlert() {
            alert("You changed the input value!");
        }
        // Function to handle onload event
        function showImageAlert() {
            alert("Image loaded successfully!");
        }
        // Function to handle onkeydown event
        function showKeyPressMessage(event) {
            alert("You pressed the " + event.key + " key.");
        }
        // Function to handle onfocus event
        function changeInputFocusColor() {
            document.getElementById("inputField").style.backgroundColor = "yellow";
        }
    </script>
</head>
<body>
    <h1>HTML Event Example</h1>
    <!-- Click event -->
    <button onclick="showClickAlert()">Click Me!</button>
    <!-- Mouseover event -->
    <div id="hoverDiv" onmouseover="changeBackgroundColor()" style="width: 200px; height: 100px; margin-top: 20px; text-align: center; line-height: 100px; background-color: lightgray;">
        Hover over me!
    </div>
    <!-- Change event -->
    <input type="text" onchange="showChangeAlert()" placeholder="Type something and change the value" style="margin-top: 20px;">
    <!-- Onload event -->
    <img src="https://via.placeholder.com/150" onload="showImageAlert()" alt="Example Image" style="margin-top: 20px;">
    <!-- Onkeydown event -->
    <input type="text" onkeydown="showKeyPressMessage(event)" placeholder="Press a key" style="margin-top: 20px;">
    <!-- Onfocus event -->
    <input type="text" id="inputField" onfocus="changeInputFocusColor()" placeholder="Click to focus" style="margin-top: 20px;">
</body>
</html>
Benefits of Using HTML Cheat Sheet
An HTML Cheat Sheet is a handy tool that makes creating websites faster and easier, helps your site show up in search results, and lets you build web pages that everyone can use and enjoy.
- Faster Development: Quickly find tags and syntax, saving time and boosting productivity.
- Complete Reference: Covers all HTML tags, from basics to advanced elements, for beginners and pros alike.
- Semantic & Accessible: Helps create meaningful, well-structured, and accessible web pages.
- Works with Other Tech: Essential when combining HTML with CSS, JavaScript, or frameworks.
- SEO-Friendly: Guides you to use proper tags for better search engine optimization.
- Rich Multimedia: Easily embed images, audio, and video for interactive web content.
