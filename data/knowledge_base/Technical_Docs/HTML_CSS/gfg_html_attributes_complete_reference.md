# HTML Attributes Complete Reference

> Source: https://www.geeksforgeeks.org/html/html-attributes-complete-reference

HTML attributes are special words written inside the opening tag of an HTML element. They provide additional information about the element and help define its behavior, appearance, or purpose.
Parts of an HTML Attribute
Each HTML attribute consists of two main parts:
1. Attribute Name
The Attribute Name defines which property of an HTML element is being set, such as id, class, href, src, or style.
- Specifies what property of the element is being defined.
- Examples: id, class, href, src, style.
2. Attribute Value
The Attribute Value sets the specific value for an HTML attribute, written after = and enclosed in double quotes " ".
- Specifies the value of that property.
- Written after an equal sign =.
- Always enclosed in double quotes " ".
Syntax:
<tag_name attribute_name="value"> Contents... </tag_name>
<html>
<body>
	<h1>HTML Attributes Example</h1>
	<img src="https://media.geeksforgeeks.org/wp-content/uploads/20241230152400887784/Salesforce-Governance-Model.webp" 
	alt="Example image" width="500">
</body>
</html>
- src Attribute: Specifies the URL of the image to be displayed. In this example, the image is loaded from "https://www.example.com/image.jpg".
- alt Attribute: Provides alternative text for the image, which is displayed if the image cannot be loaded. It also improves accessibility and SEO.
- width Attribute: Sets the width of the image in pixels, making it responsive and visually appealing.
Types of HTML Attributes
HTML attributes can be categorized into different types based on their functionality. Some common types of attributes include:
- Style attributes: Used to define the visual styling of elements, such as color, background, and font.
- Event attributes: Used to specify actions that occur in response to user interactions, such as mouse clicks or key presses.
- Attribute-element Attributes: Used to define the relationship between elements, such as the src attribute of the img element.
- Form Attributes: Used to define the behavior of form elements, such as the action attribute of the form element.
Complete References
The complete list of HTML attributes are given below.
| Attributes: | Description | 
|---|---|
| accept | This attribute can be used with <input> element only. | 
| accept-charset | Define character encoding and is used for form submission. | 
| accesskey | The keyboard shortcuts to activate/focus specific elements. | 
| action | Specify where the form data is to be sent to the server after submission of the form. | 
| align | Specify the alignment of text content of The Element. | 
| alt | Show or display something if the primary attribute | 
| async | Only works for external scripts (and used only in when src attribute is present ). | 
| autocomplete | Specify whether the input field has autocompleted would be on or off. | 
| autoplay | The audio/video should automatically start playing when web page is loaded. | 
| autofocus | The element should get focused when the page loads. It is a boolean attribute. | 
| bgcolor | Set the background color of an HTML element. | 
| border | Set visible border width to most HTML elements within the body. | 
| charset | Define character encoding. | 
| checked | Indicate whether an element should be checked when the page loads up. It is a Boolean attribute. | 
| cite | Specify the URL of the document that explains the quotes, message or text which describes why the text was inserted. | 
| Class | Specifies one or more class names for an HTML element. | 
| cols | The number of columns a cell should span. | 
| colspan | HTML specifies the number of columns a cell should span. | 
| content | The values that are related to the http-equiv or name attribute. | 
| contenteditable | Specify whether the content present in the element is editable or not. | 
| controls | It is a Boolean attribute and also new in HTML5 | 
| coords | Specify the coordinate of an area in an image-map | 
| data | Specify the URL of the Embedded file of the Object. | 
| data-* | Specific to HTML5 and you can use the data-* attribute on all HTML elements. | 
| datetime | Specify the date and time of the inserted and the deleted text. | 
| default | Specify that the track will be enabled if the user’s preferences do not indicate that another track would be more appropriate. | 
| defer | Executed when the page has finished parsing. | 
| dir | The text direction of the element content. | 
| dirname | Enable the text direction of the input and the Textarea Field after submitting the form. | 
| disabled | The disabled attribute in HTML indicates whether the element is disabled or not. | 
| download | Download the element when the user clicks on the hyperlink | 
| draggable | Specify whether an element is draggable or not. | 
| dropzone | Specify whether the dragged data is copied, moved, or linked when it is dropped on any element. | 
| enctype | That data will be present in the form and should be encoded when submitted to the server. | 
| for | For Attribute is used in both the <label> and the <output> element. | 
| form | That the element can contain one or more forms | 
| formaction | Specify where to send the data of the form. After submission of the form, the formaction attribute is called. | 
| headers | The HTML headers attribute specifies one or additional header cells a table cell is expounded to. | 
| height | height attribute is used to specify the height of the Element. | 
| hidden | The hidden attribute in HTML is used to define the visibility of elements. | 
| high | The range where the value of gauge is considered to be of high value. | 
| href | It is used to specify the URL of the document. | 
| hreflang | The language for a linked document. It is used only when the href attribute is set. | 
| http-equiv | Provide header information or value of the content Attribute. | 
| Id | It is used by CSS and JavaScript to perform a certain task for a unique element. | 
| ismap | The HTML ismap attribute is a boolean attribute. | 
| kind | The kind of track. This attribute is only used in <Track> element. | 
| label | The title of the Text Track is used by the browser when listing available text tracks. | 
| lang | Specify the language of the element content. | 
| list | List of pre-defined options for an <input> element to suggest the user. | 
| loop | Restart the audio and video again and again after finishing it. It contains the Boolean value. | 
| low | The range where the value of gauge is considered to be low. | 
| max | Specifies the maximum value of an element. | 
| maxlength | The maximum number of characters in the <input> element. Its default value is 524288. | 
| media | The media attribute is used with the <link> and <style> elements to specify the type of media (screen, print, etc.) the document is optimized for. | 
| method | The HTTP method is used to send data while submitting the form. | 
| min | Specify the lower bound of the gauge. | 
| multiple | Allowed to select more than one value that is present in an element. | 
| muted | The audio output of the video is muted, it is a Boolean attribute. | 
| name | Specify a name for the element. | 
| novalidate | That the form-data should not be validated when submitting the form. | 
| onblur | That moment when the element loses focus. | 
| oncopy | The user copied the content present in an element. | 
| oncut | The user cut or delete the content that has been present in the element. | 
| onkeypress | when a user presses a key on the Keyboard. | 
| onmousedown | Order of events occurs related to the onmousedown event. | 
| onscroll | This onscroll attribute works when an element scrollbar is being scrolled. | 
| optimum | The optimum attribute in HTML indicates the optimal numeric value for the gauge. | 
| pattern | Specifies a regular expression pattern that the input value must match to be valid. | 
| placeholder | Specifies a short hint that describes the expected value of an input field/text area. | 
| readonly | Specify that the text written in input or text area Element is read-only. | 
| required | Specify that the input element must be filled out before submitting the Form. | 
| reversed | Ordered the list in Descending Order(9, 8, 7, 6 …..) instead of ascending order(1, 2, 3 ….) | 
| rows | The number of visible text lines for the control i.e the number of rows to display. | 
| rowspan | The number of rows a cell should span. | 
| selected | Specify which option should be by default selected when the page loads. | 
| size | Specify the initial width for the input field and a number of visible rows for the select element. | 
| spellcheck | Applied to HTML forms using the spellcheck attribute. | 
| srclang | Specify the language of the track text. | 
| start | The start value for numbering the individual list item. | 
| step | Set the discrete step size of the <input> element. | 
| style | There are 3 ways of implementing style in HTML. | 
| tabindex | When the tab button is used for navigating. | 
| target | Specifies where to open the linked document (e.g., in a new window/tab, in the same window/tab, etc.). | 
| title | Specify extra information about the element. | 
| translate | Specify whether the content of an element is translated or not. | 
| value | Specify the value of the element with which it is used. | 
| wrap | The wrap attribute specifies how text should be wrapped in a <textarea> element (either by spaces or by the browser's default). It determines how text is handled when the form is submitted. | 
Best Practices
Proper use of HTML attributes improves functionality, accessibility, and maintainability. Key practices include:
- Implementing HTML attributes: correctly enhances the functionality, accessibility, and maintainability of your web pages. Here are some best practices to consider:
- Use Lowercase Attribute Names: While HTML is case-insensitive, it's recommended to use lowercase for attribute names to maintain consistency and readability.
- Avoid Inline Styles: Instead of using the style attribute for inline CSS, apply external or internal stylesheets. This approach promotes separation of content and presentation, enhancing maintainability.
