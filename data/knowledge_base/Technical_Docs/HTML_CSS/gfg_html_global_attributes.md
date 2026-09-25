# HTML Global Attributes

> Source: https://www.geeksforgeeks.org/html/html-global-attributes

HTML attributes provide additional information about an element and define its properties. Global attributes are special types of attributes that can be used with any HTML element, offering common functionality to enhance behavior and presentation.
- Global attributes can be applied to any HTML element, such as <div>, <p>, <img>, and more.
- They control various aspects like styling, identification, accessibility, and interaction, improving web page design and functionality.
- Common global attributes include id, class, style, title, and lang.
Working with Global Attributes
These attributes help enhance HTML elements by adding functionality, accessibility, and styling.
1. accesskey
The accesskey attribute defines a keyboard shortcut to activate/focus an element.
<html>
<body>
    <button accesskey="s">Save</button>
</body>
</html>
- The button can be activated by pressing Alt + S on Windows or Option + S on macOS.
- This provides a quick way for users to interact with the button without using a mouse.
2. autofocus
The autofocus attribute automatically focuses an element when the page loads.
<html>
<body>
    <input type="text" placeholder="Type here..." autofocus />
</body>
</html>
- The input field receives focus automatically when the page is loaded.
- Users can start typing immediately without needing to click on the input field.
3. lang
The lang attribute specifies the language of the element's content.
<html>
<body>
    <p lang="es">Hola, Mundo!</p>
</body>
</html>
- The paragraph text is in Spanish (es).
- This helps search engines and screen readers recognize the language of the content, improving accessibility and SEO.
4. class
The class attribute assigns one or more class names to an element, enabling CSS styling or JavaScript manipulation.
<html>
<head>
    <style>
        .highlight {
            color: red;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <p class="highlight">This is a highlighted text.</p>
</body>
</html>
- The paragraph text is styled with a red color and bold font using the highlight class.
- The class attribute links the HTML element to the CSS rule, making it easy to apply consistent styling.
List of Global Attributes:
Global attributes are common HTML attributes that can be used on almost all elements to control identification, styling, behavior, and accessibility, helping developers create consistent and interactive web pages.
| Global Attributes | Description | 
|---|---|
| accesskey | It is the keyboard shortcuts to activate/focus specific elements. | 
| autocapitalize | Automatically capitalizes text entered by the user. | 
| autofocus | : Specifies that an element should get focus when the page loads. | 
| class | It specifies one or more class names for an HTML element. | 
| contenteditable | Indicates whether the content of an element can be edited. | 
| contextmenu | Specifies a custom context menu for an element | 
| data-* | It can be used to define our own custom data attributes. | 
| dir | It is used to specify the text direction of the element content. | 
| draggable | It is used to specify whether an element is draggable or not. Links and images are by default draggable. | 
| enterkeyhint | It provides a hint on what label or icon to present on a virtual keyword while pressing keys. | 
| hidden | It is used to define the visibility of elements. It contains a boolean value. If this attribute is used then browsers will not display elements that have the hidden attribute specified. | 
| id | Provides a unique identifier for an element. | 
| inputmode | It is used mainly to provide a hint to browsers on which virtual keyboard configuration to use when editing this element or its contents. | 
| is | Specifies a custom built-in element. | 
| itemid | Provides a unique global identifier for an item. | 
| itemprop | Adds properties to an item. | 
| itemscope | It works with item types to ensure that the HTML contained in a block is about a particular item. | 
| itemtype | It specifies the URL vocabulary which is used to define itemprops. | 
| lang | It is used to specify the language of the element content. Some examples of languages are en for English, es for Spanish, etc. | 
| nonce | It is a cryptographic nonce ("number used once") used by a content security policy to check given fetch allowed to proceed or not. | 
| part | It is a space-separated list of the part names of the element. | 
| slot | It is used to assign a slot in a shadow DOM shadow tree to an element. | 
| spellcheck | The Spell Check feature in HTML is used to detect grammatial or spelling mistakes in the text fields. | 
| style | Style in HTML are basically rules that describe how a document will be presented in a browser. | 
| tabindex | It is used to specify the tab order of an element. It is used when the tab button is used for navigating. | 
| title | It is used to define the title of an HTML document, sets the title in the browser toolbar, and provides the title for the web page when it is added to favorites. | 
| translate | The translate attribute in HTML is used to specify whether the content of an element is translated or not. | 
Best Practices for HTML Global Attributes
Best Practices for HTML global attributes include using them consistently, ensuring unique values for identifiers, and relying on CSS for styling to enhance accessibility, functionality, and maintainability.
- Use global attributes like id, class, style, title, etc., consistently to enhance the accessibility, functionality, and styling of your HTML elements.
- Ensure attributes like id are unique within a page to prevent conflicts.
- For styling and layout, prefer using external or internal CSS rather than inline styles for maintainability.
