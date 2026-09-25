# React JSX in Depth

> Source: https://www.geeksforgeeks.org/reactjs/react-jsx-in-depth/

As we have seen in this article React.js (Introduction and Working), how React works, Breaking down our application into smaller reusable parts which we call components. These components are tree-like HTML or Component structure. In that article, we have seen how to create elements using createElement in react. But if we've to work with React's createElement method just to create elements then it would be fine for demo purposes or for a small app but not for a large application. You just should not use it.
React.createElement is fine to create elements for a small app or for demo purposes but not for a large salable app because it would be very hard to maintain or debug. we've to call React.createElement method every time for creation of React element even if it just a span tag with no attributes.
You can build whole application using React.createElement method(which I don't recommend).
If we shouldn't use createElement use JSX. It is JavaScript and XML. It is a JavaScript extension that allows us to define React elements using a tag-based style syntax within our JS code. How cool is that?
Sometimes new developer get confuses JSX with HTML because they look very familiar. JSX is just another way of creating React elements. The react team created JSX to make it more readable like HTML and XML. So that we don't have to create React elements manually with the createElement method. let say you want to create a button with class btn, btn-primary.
<button className="btn btn-primary"> save </button>
This is JSX syntax look like HTML, but with small differences, we will discuss later in this article. JSX also works with components as well,
<Component className="card">
    <div>Hello world</div>
</Component>
The following image shows how to compose React Element from React.createElement method and JSX.
From the above image, you can clearly see that we can easily create a React element with JSX. Readability is also the main reason which comes along with simplicity for the implementation of JSX by the React team.
Browser doesn't understand JSX syntax out of the box, you have to transpile/compile your JSX code to JavaScript code. For this, you can use Babel. You can add Babel in your HTML file using the CDN link in the script tag. We have to externally specify from where Babel should transpile. For this we've to add type attribute(text/babel) in our script tag.
<body>
    // Root element of React code
    <div id="root"></div>    
    
    <script crossorigin src=
"https://unpkg.com/react@17.0.2/umd/react.development.js">
    </script>
    <script crossorigin src=
"https://unpkg.com/react-dom@17.0.2/umd/react-dom.development.js">
    </script>
    
    // Babel
    <script src=
"https://unpkg.com/@babel/standalone@7.28.1/babel.min.js">
    </script>
    
    // Our JS code
    <script src="./main.js" type="text/babel"></script>
    
</body>
There are certain rules to consider while starting with JSX:
- type: As you all know, we have to specify as the first argument to React.createElement method to tell react what kind of element we want to create. While creating an element with JSX we have to tell react by specifying the type of element as a tag(HTML like). It could be an HTML tag or custom component e.g. In the above image we want to create a custom component named Component then we have to create an HTML-like tag. It comes in 2 flavors.
  - Opening and closing tag: If we have children that come under our component then we have to specify children between the opening and the closing tag.
  - Self-closing: If we do not have children to specify then we can use a self-closing tag also.
<ButtonComponent>    // Opening tag of ButtonComponent
     // Self closing tag because it 
     // doesn't have children
    <span> name </span>
    <ButtonImageComponent />   
// Closing tag of ButtonComponent
</ButtonComponent>    
If we want to create an element that doesn't have children then we can use both opening and closing tag and self-closing tag.
Under the hood all your JSX will get compiled to React.createElement.
- props: When we create an element using React.createElement then we have to specify its properties as the second argument but with JSX we can specify its properties as attributes(like old-style HTML attributes). Let say we want to specify class and id to a button.
const id = Math.floor(Math.random() * 10e8);    // Random number
const ButtonComponent = ( <button className="btn btn-primary" id={ id }>
    click me
</button> );
    
ReactDOM.render(ButtonComponent, document.querySelector("#root"));
In this code snippet, we can see that we've specified the properties as an attribute to ButtonComponent.
As per convention we should Capitalise on the first character of our custom component. This convention doesn't apply to built-in HTML tags like span, div, h1, etc.
- children: If we want to add children of a component then we've to specify between the opening and closing tag of the React element.
const listComponent = (
  <ul>
    <li>Alex</li>
    <li>Ragnar</li>
    <li>Akbar</li>
    <li>Mandy</li>
  </ul>
);
ReactDOM.render(
    listComponent,
    document.querySelector('#root')
)
/************** OR **************
const listCustomComponent = (
    <NameComponent>
        <ListComponetn name="Alex"></ListComponetn>
        <ListComponetn name="Ragnar"></ListComponetn>
        <ListComponetn name="Akbar"></ListComponetn>
        <ListComponetn name="Mandy"></ListComponetn>
    </NameComponent>
)
ReactDOM.render(
    listCustomComponent,
    document.querySelector('#root')
)
JavaScript Expression: JavaScript's expression should be wrapped in a single curly brace and should indicate where the variable will get evaluated in JSX. Let say you want to specify the title. {title} get evaluated and replaced with the string 'Human beings'.
const title = "Human beings";
const HumanComponent = (
    <h1> { title } </h1>
)
Values of type other than string should also specify in curly braces. e.g.
const isHuman = true;
const IsHumanComponent = (
    <h4>Ronaldo is human: { isHuman }<h4>
)
/****** OR **********\
const IsHumanComponent = (
    <h4>Ronaldo is human { true }<h4>
)
As expression between curly brace will get evaluated, so we could also use in concatenation or addition operations also.
    { "Hello" + "World" }
    { Math.random() * 100 }
    { [1, 2, 3, 4, 5].reduce((acc, curr) => acc  + curr) }
Mapping array with JSX: JSX is javascript, so you can loop over the array and create elements with JSX also.
const names = ["React.js", "Angular", "Node.js", "jQuery", "underscore.js"]
const Command = (
    <h4>
        {
            names.map( function creatNameElement(name){
                        return <li key={ name }> { name } </li>
            })
        }
    </h4>
);
ReactDOM.render(
    Command,
    document.querySelector('#root')
)
Output:
 
Choosing the type at Runtime: If you want to specify the name of react element runtime then you can't use an expression in place of type. You first have to create a capitalized variable first and then use that variable in place of type. This could be helpful if you want to show components based on the props.
function Add({a, b}) {
    return (
        <h1>Addition is { a + b }</h1>
    )
}
function Multiplication( { a, b } ) {
    return (
        <h1>Subtraction is { a * b }</h1>
    )
}
function Show( props ) {
    const components = {
        add: Add,
        multiplication: Multiplication,
      };
    const MathComponent = components[props.type];
    return (
        <MathComponent a={10} b={ 20 }/>
    )
}
ReactDOM.render(<Show type="multiplication" />, document.querySelector("#root"));
JavaScript Expressions as Props: You can also pass javascript expression as props. For this to work just wrap your prop in curly braces.
function JavaScriptExpressionAsProps({ num }) {
    return (
        <h1>Prop Number is: { num }</h1>
    )
}
ReactDOM.render(
  /* Addition is evaluated and assign its value to num */
  <JavaScriptExpressionAsProps num={ 1+ 2 + 3 + 4 + 5} />,
  document.querySelector("#root")
);
String literal/Template literal as prop: You can also use string literal or template literal as a prop. s
function NameComponent({ name }) {
    return (
        <h1>{ name }</h1>
    )
}
ReactDOM.render( <NameComponent name='Praveen kumar string literal' />, 
                 document.querySelector( "#root" ) );
/************ OR ***********/
ReactDOM.render( <NameComponent name=
            {'Praveen kumar string literal as expression'} />, 
            document.querySelector("#root"));
/************ OR ***********/
ReactDOM.render(
  <NameComponent name=
      {`Praveen kumar string template literal as expression`} />,
  document.querySelector("#root")
);
Prop defaults to True boolean value: If you want to specify the true boolean value to a component as a prop then you can externally specify true as a value or you couldn't pass any value then by default value is considered as true.
function IdentifyHuman( { name, isHuman } ) {
    if ( isHuman === true ) {
        return <h1>{ name } is human</h1>
    } else {
        return <h1>{ name } is not human</h1>
    }
}
ReactDOM.render(
  <IdentifyHuman name="Praveen kumar" isHuman={true} />,
  document.querySelector("#root")
);
/************** OR ********************/
ReactDOM.render(
  <IdentifyHuman name="Praveen kumar" isHuman />,
  document.querySelector("#root")
);
It is recommended to specify the boolean value externally to remove confusion.
Spread Attributes: As we know that props is just a javascript object. If we want to assign these all properties to another component as it is, then we can spread these properties.
function PrintName( { name, isHuman } ) {
    if ( isHuman === true ) {
        return <h4>{name} is Human</h4>;
    } else {
        return <h4>{name} is Super Human</h4>;
    }
}
function ShowHuman( props ) {
    return (
        <div>
            <h1>Human</h1>
            <PrintName {...props}/>
        </div>
    )
}
ReactDOM.render(
    <ShowHuman name="Praveen kumar" isHuman={ false } />,
  document.querySelector("#root")
);
This is a very useful technique to pass all props in a component but passing all props but it also passes the unwanted or unnecessary props that may be not required by that component.
Children in JSX: In JSX syntax, whatever you pass in the opening and closing tag then it will become children. You can see those children as props.children property.
String literal as Children: We can use pass a string literal as children and it will directly get assigned that string to children property of props. JSX trims the beginning and ending whitespaces or newline. If you add a new line in between string then newline get replace with single space
function ListComponent( props ) {
    console.log( props.children );    // Child string
    return (
        <h1>List component</h1>
    )
}
ReactDOM.render(
    <ListComponent>
        Child
        string
      </ListComponent>,
      document.querySelector("#root")
);
JSX Children: If we want to add some children of a component then we have to specify in between the opening and closing tags. It could be a string or it could be a custom component or both.
function ShowList( { list } ) {
    console.log( list );
    return (
        <ul>
            { list.map( (el, index) => <li key={index}>{ el }</li>) }
        </ul>
    );
}
function ListHeading() {
    return (
        <div>
            <h1>List component</h1>
        </div>
  );
}
ReactDOM.render(
    <div>
        <ListHeading />
        This is just a dummy text
        <ShowList list={['first', 'second', 'third']}/>
      </div>,
      document.querySelector("#root")
);
Functions as Children: You can also pass function as a child and then we can directly access using props.children property.
function ListComponent(props) {
    props.children();    // invoke function;
    return (
        <div>
        <h1>List component</h1>
        </div>
    );
}
ReactDOM.render(
    <ListComponent >
        {function print() {
            console.log( 'This is print function passed as a child' );
        }}
    </ListComponent>,
      document.querySelector("#root")
);
Hope you have learned something new. Thanks for reading this article.
