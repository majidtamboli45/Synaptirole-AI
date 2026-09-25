# HTML DOM Complete Reference

> Source: https://www.geeksforgeeks.org/html/html-dom-complete-reference

HTML DOM (Document Object Model) is a programming interface that represents the elements of an HTML document in a tree-like structure.
- Allows developers to change content and layout using JavaScript.
- Enables dynamic updates and user interaction on websites.
- Facilitates the addition, removal, or modification of HTML elements.
<html>
<head>
	<script>
		function changeText() {
			document.getElementById("demo").textContent = "Hello, World!";
		}
	</script>
</head>
<body>
	<p id="demo">Original Text</p>
	<button onclick="changeText()">Change Text</button>
</body>
</html>
HTML DOM Attribute Object:
Methods:
| Methods | Description | 
|---|---|
| getNamedItem() | Return the attribute node from the NamedNodeMap object. | 
| item() | Return the node to the specified index. | 
| removeNamedItem() | Remove the node with the specified name in a named node object. | 
Properties:
| Properties | Description | 
| isId | Returns a true if the Element has an attribute type of ID, otherwise, it returns a false | 
| length | Get the number of items in a NodeList object. | 
| specified | It returns true if the element has a specified attribute, otherwise, it returns a false | 
| value | Return the value of any attribute. | 
Console Object Methods:
| Methods | Description | 
|---|---|
| assert( ) | Write a message for user on the console only if the expression evaluates to false | 
| clear() | Clear the console and writes some message | 
| count() | Write the number of times the console.count() method is called. | 
| error() | Display an error message on the console | 
| group() | Create a group of messages in the console | 
| groupCollapsed() | Create a collapsed group of messages in the console. | 
| groupEnd() | To indicate the end of a group of messages in the console | 
| info() | Writing a message in the console. | 
| log() | It is used for writing a message in the console. | 
| table() | It is used for writing data in tabular form in the console view. | 
| time() | It is used to start a timer in the console view. | 
| timeEnd() | It is used to end a timer started by the console.time() method. | 
| trace() | It is used to display the trace which represents how the code ended up at a certain point. | 
| warn() | It is used to write a warning message in the console. | 
Document Object Properties:
| Properties | Description | 
|---|---|
| activeElement | Return the currently active elements in the HTML document. | 
| baseURI | Return the base Uniform Resource Identifier (URI) of the document. | 
| body | It only returns the content present in the <body> Tag. | 
| cookie | cookies are used by websites to keep track of user-specific information. | 
| characterSet | Return the character encoding for the document at the time of parsing. | 
| defaultView | It is used to return the document Window Object | 
| designMode | It is used to specify whether the document is editable or not. | 
| doctype | Return the doctype of any HTML document. | 
| documentElement | Return the documentElement as an Element Object | 
| documentMode | Detect the document mode used by the browser to render the current page. | 
| domain | Return the domain name of the website server that is loaded or running in the current document. | 
| fullscreenElement | Return the element that is currently in fullscreen. | 
| head | Return the first occurrence of the head if multiple heads in the document | 
| images Collection | Return the collection of <img> elements in the document. | 
| implementation | Returns the DOMImplementation object associated with the current document. | 
| inputEncoding | Returns the character encoding used for parsing the document. | 
| lastModified | Return the date and time of the current document that was last modified. | 
| readyState | Return the loading status of the current document. This property is used for read-only. | 
| referrer | Return the URI of the page that linked to the current page. | 
| strictErrorChecking | Returns whether strict error checking can be enforced on a document or not. | 
| title | It is used to sets the value of the title in the document. | 
| URL | Return a string that contains the complete URL of the current document. | 
| Methods | Description | 
|---|---|
| addEventListener() | Attaches an event handler to the specified element. | 
| adoptNode() | It is used to adopt a node from another document. | 
| close() | It is used to close the output stream. | 
| createAttribute() | It is used to create an attribute with the specified name and returns the attribute object. | 
| createComment() | Create a comment node with some specified text. | 
| createDocumentFragment() | A new document fragment that can be inserted into any document can be created using the offscreen node. | 
| createElement() | The document.createElement() is a method used to create the HTML element. | 
| createEvent() | Creates an event object of the specified type. | 
| createTextNode() | Create a TextNode which contains element node and a text node. | 
| execCommand() | Execute a command specified by the user on the editable selected section. | 
| fullscreenEnabled() | Check the document can be viewed in full screen mode or not. | 
| getElementById() | Returns an element with a specified value. | 
| getElementsByClassName() | Returns a collection of elements with a specified class name(s). | 
| getElementsByName() | Returns collection of all elements of particular document by name. | 
| getElementsByTagName() | Returns the collection of all the elements in the document with the given tag name. | 
| hasFocus() | Indicating whether an element or document has the focus or not. | 
| importNode() | Copy of a node from another document and imports it to the current document. | 
| normalize() | The normalize() method does not require any parameter. | 
| normalizeDocument() | Normalize an HTML document by remove any empty text nodes if exists. | 
| open() | The open() method allows you to write on a document. | 
| querySelector() | Return the first element that matches a specified CSS selector(s) in the document. | 
| removeEventListener() | Remove an event handler associated with the addEventListener() method | 
| renameNode() | It is used to rename the nodes. | 
| write() | It is used to write some content or JavaScript code in a Document. | 
| writeln() | It is used to write a document with additional property of newline character after each statement. | 
| Collection | Description | 
|---|---|
| anchors | Return the collection of all <a> element in a HTML document. | 
| applets | Return a collection of all possible elements available in the HTML | 
| embeds | Return the collection of all embedded elements. | 
| forms | Return the collection of all <form> elements in a HTML document. | 
| links | Return the collection of all <a> and <area> elements with “href” attribute in a HTML document. | 
| scripts | Return the collection of all <script> element in HTML document. | 
| Properties | Description | 
|---|---|
| accessKey | Return the accesskey attribute of an element. | 
| attributes | Returns the group of node attributes specified by NamedNodeMap objects. | 
| childElementCount | It counts only child element except for text and comment nodes. | 
| childNodes | Returns a node’s child nodes as a nodeList object. | 
| children | Return HTMLcollection of all the child elements of the specified element. | 
| classList | Returns the class names of the element in the form of DOMTokenlist() | 
| className | Return the value of an element’s class attribute. | 
| clientHeight | Return the viewable height of an element in terms of the pixel. | 
| clientLeft | Return the width of the left border to an element in terms of pixel. | 
| clientTop | Return the width of the top border to an element in terms of pixel. | 
| clientWidth | It is used to return the viewable width of a specific element | 
| dir | Return the value of dir attribute in an Element. | 
| firstChild | Return the firstchild Node of its parent node element. | 
| firstElementChild | Return the first child of any node PreRequisites | 
| innerHTML | Return the HTML content of an element | 
| innerText | Returns the text content of a specified node and its descendants. | 
| isContentEditable | Return a boolean where true means the content of an element is editable. | 
| lastChild | Return the last child of the specified node. | 
| lastElementChild | Return the last child element of the specified element or null if there is no last element. | 
| nextSibling | Return the next node of the specified node as Node object | 
| nextElementSibling | Return the immediate next element of the specified element, | 
| nodeName | Return the name of the specified node as a string. | 
| nodeType | Find out the type of the node that we are referring to. | 
| nodeValue | Its used to set or get the nodeValue in Any Html document. | 
| offsetHeight | Returns the layout height of an element as an integer. | 
| offsetWidth | Returns the layout width of an element as an integer. | 
| offsetLeft | Returns the left position in pixels. | 
| offsetParent | Return the nearest ancestor of an element. | 
| offsetTop | Return the top position which is relative to the top of the offsetParent element. | 
| ownerDocument | Returns the top-level document object of the node. | 
| parentNode | Return the parent node of the specified node as Node object. It is a read-only property. | 
| parentElement | Returns the parent element of a particular child element. | 
| previousSibling | Return the previous node of the specified node as Node | 
| previousElementSibling | Return the previous element of the same level of the given element. | 
| scrollHeight | It is used to return the height of an element. | 
| scrollLeft | It is used to return or set the number of pixels an element | 
| scrollTop | Return or set the number of pixels an element is scrolled vertically. | 
| scrollWidth | It is used to return the width of an element. | 
| tagName | It is used to return the tagname of the Element. | 
| textContent | Return the text content of the specified node and all its descendants. | 
| title | It is used to return the title of the HTML document | 
| Methods | Description | 
|---|---|
| addEventListener() | Attaches an event handler to the specified element. | 
| appendChild() | Create a text node as the last child of the node. | 
| blur() | Remove the keyboard focus from the current element | 
| click() | It is used to simulate the mouse click on an element. | 
| cloneNode() | It is used to copy or clone a node on which the cloneNode() method is called. | 
| compareDocumentPosition() | It is used to compare two nodes and it returns an integer | 
| contains() | It is used to find whether the specified node is a descendant of the given node. | 
| exitFullscreen() | It is currently in a full-screen mode to be taken out of full-screen mode. | 
| focus() | Remove the focus with the help of blur() method. | 
| getAttribute() | It is used to get the value of the attribute of the element. | 
| getAttributeNode() | Return the attribute node with the specified name of an element, as an attribute object. | 
| getBoundingClientRect() | Returns the relative positioning to the viewport. | 
| getElementsByClassName() | Returns a collection of elements with a specified class name(s). | 
| getElementsByTagName() | Returns the collection of all the elements in the document with the given tag name. | 
| insertAdjacentElement() | Inserts the specified element at the specified position | 
| insertAdjacentHTML() | Inserts HTML code into a specified position. | 
| insertAdjacentText() | Inserts a a text into a specified position. | 
| insertBefore() | Insert a new node before the existing node as specified by the user. | 
| isDefaultNamespace() | Return boolean true if the specified namespace is default otherwise, it returns boolean false | 
| isEqualNode() | Checks whether the two nodes are equal or not. | 
| isSameNode() | Checks whether the two nodes are same or not. | 
| Node isSupported() | Check the specified feature is supported by the specified node or not. | 
| normalize() | Merge the adjacent text nodes with the first text node | 
| querySelector() | Return the first element that matches a specified CSS selector(s) in the document. | 
| querySelectorAll() | Return a collection of an element’s child elements | 
| removeAttribute() | Remove an attribute with specified name from the element. | 
| removeAttributeNode() | Remove the specified attribute from the current element. | 
| removeChild() | Remove a specified child node of the given element. | 
| removeEventListener() | Remove an event handler associated with the addEventListener() method. | 
| replaceChild() | Replace a child node with a new node within the given parent node. | 
| setAttributeNode() | It is used to add the specified attribute node to an element. | 
Geolocation Object:
| Properties | Description | 
|---|---|
| Geolocation coordinates | Return the position and altitude of the device on Earth. | 
| Geolocation position | Return the position of a device on Earth. | 
History Object:
| Methods | Description | 
|---|---|
| History back() | It is used to load the previous URL in the history list. | 
| History forward() | It is used to load the next URL in the history list. | 
| History go() | It is used for loading a specific URL from the history list. | 
| Properties | Description | 
|---|---|
| History length Property | Return the count of URLs in the history list of the current browser window. | 
DOM HTMLCollection:
| Properties | Description | 
|---|---|
| length | Return the collection of all HTML elements in a document. | 
| Methods | Description | 
|---|---|
| item() | Return the content of the element at the given index of the collection of all HTML elements. | 
| namedItem() | Return the element with having the specified ID, OR, name, or content | 
Location Object
| Properties | Description | 
|---|---|
| hash | Return the anchor part of a URL. | 
| host | Returns the hostname and port of a URL. | 
| hostname | Return the hostname of the current URL. | 
| href | Return the complete URL of the current page. | 
| origin | Return the protocol, hostname, and port number of a URL. | 
| pathname | Returns a string that represents the pathname of the URL. | 
| port | Sets the port number of the current URL. | 
| protocol | Return the protocol or set the protocol of the current URL. | 
| Search | Set or return the query part of URL including the question mark. | 
| Methods | Description | 
|---|---|
| assign( ) | It is used for loading a new document | 
| reload() | It is used to reload the current document. | 
| replace() | It is used to replace the current document with the specified one. | 
The Navigator Object:
| Properties | Description | 
|---|---|
| appCodeName | Returning the code name of the browser. | 
| appName | It is used for returning the name of the browser. | 
| appVersion | Returns a string that represents the version information of the browser. | 
| cookieEnabled | It returns true if cookies are enabled else it returns false. | 
| geolocation | Return a geolocation object by the browser which can be used to locate a user’s position. | 
| language | It is used for returning the browser’s language version. | 
| onLine | Return Boolean value which specifies whether a browser is in the online or offline mode. | 
| platform | Return the platform for which the browser is compiled. | 
| product | Return the browser’s engine(product) name. | 
| userAgent | It is used for returning the user-agent header’s value sent to the server by the browser. | 
| Methods | Description | 
|---|---|
| javaEnabled( ) | It is used for returning a Boolean value that specifies | 
| taintEnabled() | This method would always return a Boolean false value. | 
Screen Object:
| Properties | Description | 
|---|---|
| availHeight | It is used for returning the height of the user’s screen, in pixels. | 
| availWidth | It is used for returning the width of the user’s screen, in pixels. | 
| colorDepth | Return the bit depth of the color palette for displaying images, in bits per pixel. | 
| height | It is used for returning the total height of a user’s screen. | 
| pixelDepth | It is used for returning the color resolution of the visitor’s screen. | 
| width | It is used for returning the total width of a user’s screen. | 
Style object:
| Properties | Description | 
|---|---|
| alignContent | It is used to align the items of a flexible container | 
| alignItems | Return the default alignment of items in a flexible container. | 
| alignSelf | Return the alignment for a selected item inside a flexible container | 
| animation | To animate transitions from one CSS style to another CSS style | 
| animationDelay | Returns the delay after which the animation should start. | 
| animationDirection | Return the animation direction. | 
| animationDuration | To set the time interval to complete one cycle of an animation. | 
| animationFillMode | The animation is not playing or when an animation is finished or when there is a delay in animation | 
| animationIterationCount | Return how many times an animation should be played. | 
| animationName | Returns a name for @keyframes animation. | 
| animationTimingFunction | The time of transition between the styles to make transitions smooth. | 
| animationPlayState | It is used to specify whether an animation is running or paused. | 
| background | Return the background of an element. | 
| backgroundAttachment | Return whether the background image should be fixed or scroll with the content. | 
| backgroundColor | Return the background-color of an element. | 
| backgroundImage | Return the background image of an element. | 
| backgroundPosition | Return position of the background-image in an element. | 
| backgroundRepeat | HTML DOM is used to set or return the CSS | 
| backgroundClip | Return the painting area of the background. | 
| backgroundOrigin | The background image is relative to in position. | 
| backgroundSize | Return the size of the background image. | 
| backfaceVisibility | Element visible or invisible when the element is not facing the screen. | 
| border | It is used to sets or returns the style of an element’s border. | 
| borderBottomStyle | Returns the three different border-bottom property such as border-bottom-width,etc. | 
| borderBottomColor | Return the color of bottom border of an element. | 
| borderBottomLeftRadius | Return the radius of the border of the bottom-left corner. | 
| borderBottomRightRadius | Set the style of the radius of the bottom-right corner of its border. | 
| borderBottom | Return the style of the bottom border of an element. | 
| borderBottomWidth | Return the width of bottom border of an element. | 
| borderCollapse | Returns the border of the table collapsed into a single border or not. | 
| borderColor | Specifies the color of the element’s border. | 
| borderImage | It is used for setting the borderImageSource, borderImageSlice,etc. | 
| borderImageOutset | The border, image is to be painted is called the border-image space. | 
| borderImageRepeat | Return the borderImageRepeat property. | 
| borderImageSlice | Specify the value of this property in terms of percentage, number or global values. | 
| borderImageSource | Return the image to be used instead of the styles given by the border-style property. | 
| borderImageWidth | Return the width of the border image. | 
| borderLeft | It is used to set or returns the three different | 
| borderLeftColor | Get the color to left border of element. | 
| borderLeftStyle | Set or return the left border style of an element. | 
| borderLeftWidth | Return the width of the left border of an element. | 
| borderRadius | Return the four different borderRadius | 
| borderRight | Returns the three different border-right property | 
| borderRightColor | Return the style of right border of an element. | 
| borderRightWidth | Return the width of the right border of an element. | 
| borderSpacing | Return the spacing between the cells in a table. | 
| borderStyle | Return the border style of an element. | 
| borderTop | Returns the three different border-top property | 
| borderTopColor | Get the color of top border of element. | 
| borderTopLeftRadius | Return the radius of the top left border of an element. | 
| borderTopRightRadius | Return the radius of the top right border of an element. | 
| borderTopStyle | Return the top border style of an element. | 
| borderTopWidth | Return the width of the top border of an element. | 
| borderWidth | Return the width of the border element. | 
| boxShadow | Return the drop-shadow of an element. | 
| boxSizing | It is used when fitting elements into their desired position by automatically calculating their dimensions. | 
| captionSide | Return the position of the caption in a table. | 
| clear | Get the position of the specific element relative to floating objects. | 
| clip | Return the visible part of a positioned element. | 
| color | Return the color of the text. | 
| columnCount | That defines the number of columns an element should be divided into. | 
| columnFill | Specifies how to fill a column(balanced or not). | 
| columnGap | Specifies the gap between the columns. | 
| columnRule | Sets the width, style, and color of the rule between columns. | 
| columnRuleColor | Specifies the color of the rule between columns. | 
| columnRuleStyle | Determine the style of rule between columns. | 
| columnRuleWidth | Determine the width of the rule between the columns. | 
| columns | Set the width of the column & column count. | 
| columnSpan | Specify how many columns an element should span across. | 
| counterIncrement | The counter should be incremented on each occurrence of a selector. | 
| counterReset | It is used with the counterincrement property and the content property. | 
| cursor | Return the type of cursor to display for the mouse pointer. | 
| direction | Return the text direction of an element. | 
| display | Return the display type of an element. | 
| emptyCells | It is used to display borders and background for the empty cells. | 
| filter | It is used to add visual effects or filter effects to images. | 
| flex | Returns the length of the item, relative to rest of flexible items inside the same container. | 
| flexBasis | Return the initial length of a flexible item | 
| flexDirection | Return the main-axis direction of the flexible items. | 
| flexFlow | It is used to specify the value for two different properties | 
| flexGrow | An item will grow relative to the rest of the flexible items inside the same container. | 
| flexShrink | Set how the specific item can be shrink in relation to the remaining flexible items within the container. | 
| flexWrap | It is used to determine whether the flexible items should wrap or not. | 
| cssFloat | Returns the horizontal alignment of element. | 
| font | It is used to change the element’s font properties. | 
| fontFamily | Return a list of Font-Family names and generic-family names for text in an element. | 
| fontSize | Get the font size of characters in a word should appear. | 
| fontStyle | Get font style of an element dynamically. | 
| fontVariant | It s used to set the font in capital letters. | 
| fontWeight | Return how thick or thin characters in a word should appear. | 
| fontSizeAdjust | The font size if the first choice of font is not available. | 
| height | It is used to set or get height of an element dynamically. | 
| isolation | Whether an element must necessarily create a new stacking context. | 
| justifyContent | It is used to align the items horizontally when they are not able to use all the available space. | 
| left | It is used for setting or returning the left position of a positioned element. | 
| letterSpacing | It is used to set the space between the characters. | 
| lineHeight | It is used for setting or returning the distance between lines in a text. | 
| listSytle | It is used to set up to three Properties | 
| listStyleImage | Return an image as the list-item icon. | 
| listStylePosition | Returns the position of the list-item marker. | 
| listStyleType | It is used for setting or returning the list-item marker type. | 
| margin | Returns the margin of an element. | 
| marginBottom | Return the bottom margin of an element. | 
| marginLeft | Get the left margin of an element. | 
| marginRight | Return the right margin of an element. | 
| marginTop | Return the top margin of an element. | 
| maxHeight | Return the maximum height of an element. | 
| maxWidth | Return the maximum width of an element. | 
| minHeight | Return the minimum height of an element. | 
| minWidth | Return the minimum width of an element. | 
| objectFit | Return how an image or video element is resized to fit it’s container. | 
| objectPosition | Return how an image or video would be positioned in their own content box. | 
| opacity | It is used to set opacity level for an element. | 
| order | The order of a flexible element relative to the rest of the flexible elements | 
| orphans | The minimum number of lines in a paragraph split on the old page. | 
| outline | Return all outline properties in one declaration. | 
| outlineColor | Returns the color of the outline around an Element. | 
| outlineOffset | It is used for offsetting an outline and draw it beyond the border edge. | 
| outlineStyle | Return the style of the outline around an element. | 
| outlineWidth | Return the width of the outline around an element. | 
| overflow | It is used to specify the behavior of the content when it overflows the element box. | 
| overflowX | Specify the behavior of the content when it overflows an element’s left and right edges. | 
| overflowY | Specify the behavior of the content when it overflows an element’s top and bottom edges | 
| padding | It is used for setting or returning the padding of an element | 
| paddingBottom | It is used for setting or returning the bottom padding of an element. | 
| paddingLeft | It is used for setting or returning the left padding of an element. | 
| paddingRight | It is used for setting or returning the right padding of an element. | 
| paddingTop | It is used for setting or returning the top padding of an element. | 
| pageBreakAfter | Returning the page-break behavior after an element in printing or print preview. | 
| pageBreakBefore | Return the page-break-before characteristics before the specified element in HTML document. | 
| pageBreakInside | Returning the page-break behavior inside an element in printing or print preview. | 
| perspective | It is used to determine how far an element is placed from the Z plane. | 
| perspectiveOrigin | It is used to describe the exact position of a 3D element based on the x and y-axis. | 
| position | Returns the type of positioning method used by the element. | 
| quotes | It is used to represent the HTML < q > element. | 
| resize | It is used to specify whether an element is resizable in height and width by the user. | 
| right | Return the right position of a positioned element including padding, scrollbar, border, and margin. | 
| tableLayout | Return how a table and its cells, rows, and columns should be laid out. | 
| tabSize | Return the length of the space used in place of the tab character. | 
| textAlign | It is pretty much similar to the text-align property in the CSS. | 
| textAlignLast | set the alignment of the last line of the text. | 
| textDecoration | It is used to set one or more decorations for a text. | 
| textDecorationColor | Set the color of the text-decoration like underlines, overlines, etc. | 
| textDecorationLine | It is used to set the decoration for a line | 
| textDecorationStyle | It is used to set the line. | 
| textIndent | It is used for indentation of the first line in each block of text. | 
| textOverflow | It is used to specify the behavior of the text when it overflows the containing element box. | 
| textShadow | It is used to set the shadow effects for text. | 
| textTransform | Return the capitalization of text. | 
| top | Return the top position of a positioned element including padding, scrollbar,etc. | 
| transform | It is used to transform the object. The transform property allows to rotate, scale, move, etc. | 
| transformOrigin | This position is described using co-ordinate geometry using x-axis and y-axis. | 
| transformStyle | Return, the different ways nested elements use for their rendering in 3D space. | 
| transition | It is used to change the appearance of any DIV element. | 
| transitionproperty | Set the name of the CSS property for the transition effect. | 
| transitionDuration | Return the length of time(in seconds or milliseconds) to complete the transition effect. | 
| transitionTimingFunction | Allows a transition effect to change speed over its duration. | 
| transitionDelay | Time in seconds or milliseconds when execution of transition starts. | 
| unicodeBidi | It is used with direction property to determine how multi-directional text is displayed. | 
| userSelect | Return whether the text can be selected by the user or not. | 
| verticalAlign | Return the vertical alignment of the content in an element. | 
| visibility | It is used to set the visibility for an element. | 
| width | Return the width of an element which can be block-level elements or elements with fixed position. | 
| wordBreak | Return the word-break property. | 
| wordSpacing | It is used to set the spacing between words | 
| wordWrap | Return whether long words should be broken to wrap around to the next line. | 
| zIndex | Return the stack order of a positioned element. | 
Window Object:
| Properties | Description | 
|---|---|
| Window closed | Return a value that indicates whether the referred window is closed or not. | 
| defaultStatus | Return the default text in the status bar at the bottom side of the browser. | 
| frameElement | Returns the iframe element in which the window is embedded or stored. | 
| frames | Return the frame element in the form of an array object. | 
| innerHeight | Returning the height of a window’s content area. | 
| innerWidth | Returning the width of a window’s content area. | 
| length | Returning the number of <iframe> elements in the current window. | 
| localStorage | Properties allow you to store value pairs in web browsers using objects. | 
| name | It is used for setting or returning the name of a window. | 
| opener | Return the reference of newly created windows. | 
| outerHeight | It is used for returning the outer height of the browser window. | 
| outerWidth | It is used for returning the outer width of the browser window. | 
| pageXOffset | It is used for returning the pixels of the current document | 
| parent | Returns the parent window of the current window. | 
| screenLeft | Returning the ‘x’ or horizontal coordinate of a window relative to a screen. | 
| screenTop | Returning the ‘y’ or vertical coordinate of a window relative to a screen. | 
| screenX | Returning the ‘x’ or the horizontal coordinates of a window relative to the screen. | 
| screenY | Returning the ‘y’ or the vertical coordinates of a window relative to the screen. | 
| sessionStorage( ) | It is used for saving key/value pairs in a web browser. | 
| self | It is used for returning the current window. | 
| status | Return the text in the status bar at the bottom of the browser. | 
| top | Return the topmost browser window of a current window. | 
| Methods | Description | 
|---|---|
| alert( ) | It is used to display an alert box. | 
| atob( ) | It is used for decoding a base-64 encoded string. | 
| Blur() | Remove focus from the current window. | 
| Focus() | It is used to focus on the new open window. | 
| btoa( ) | It is used for encoding a string in base-64 format. | 
| clearTimeout() | Set by the setTimeout()function before that. | 
| clearInterval() | Clears the interval which has been set by the setInterval() function before that. | 
| confirm() | Display a dialog box with an optional message and two buttons, OK and Cancel. | 
| getComputedStyle() | Get all the computed CSS property and values of the specified element. | 
| moveBy() | Moving a window with a specified number of pixels relative to its current coordinates. | 
| moveTo() | It is used in the window to moves the window from the left and top coordinates. | 
| Open() | It is used to open the web pages into a new window or a new tab. | 
| Close | Depends on the browser settings and the values that are assigned to the parameter. | 
| print() | The print() method prints the contents of the current window. | 
| prompt() | Display a dialog box with an optional message prompting the user to input some text. | 
| resizeBy() | Resize a window by the specified amount, relative to its current size. | 
| resizeTo() | Resize a window to the specified width and height. | 
| scrollTo() | Scroll to a particular set of coordinates in the document. | 
| setTimeout() | Executes a function, after waiting a specified number of milliseconds. | 
| setInterval() | Repeats a given function at every given time interval. | 
| stop() | Loading resources in the current browsing context, similar to the browser’s stop button. | 
Storage Object:
| Methods | Description | 
|---|---|
| key() | Return the name of the key with the specified index. | 
| getItem() | It is used to retrieve the storage object which is specified by the user. | 
| setItem() | It is used to set the storage object item which is specified by the user. | 
| removeItem() | It is used to remove the specified storage object item. | 
| clear() | Removes all the Storage Object items for the current domain. | 
| Properties | Description | 
|---|---|
| length | Return the number of items stored in the Storage Object. | 
Best Practices for HTML DOM
- Use getElementById() for Performance: Access elements by their id for faster and more efficient DOM manipulation.
- Minimize DOM Manipulation: Batch updates to the DOM to reduce reflows and improve performance.
- Avoid Inline JavaScript: Use external JavaScript files to keep code organized and maintainable.
- Add Event Listeners Dynamically: Use addEventListener instead of inline event attributes to separate behavior from structure.
