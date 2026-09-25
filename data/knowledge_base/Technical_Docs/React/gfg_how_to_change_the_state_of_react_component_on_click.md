# How to change the state of react component on click?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-change-the-state-of-react-component-on-click/

To change the state of the React component is useful when you are working on a single page application, it simply replaces the content of the existing component for the user without reloading the webpage.
We have to set initial state value inside constructor function and set click event handler of the element upon which click, results in changing state. Then pass the function to the click handler and change the state of the component inside the function using setState.
The setState function used to change the state of the component directly or with the callback approach as mentioned below.
Syntax:
this.setState({ stateName : new-state-value})
this.setState(st => {
st.stateName = new-state-value
})
Example 1: This example illustrates how to change the state of the component on click.
index.js:
import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'
ReactDOM.render(<App />, document.querySelector('#root'))
App.js:
import React, { Component } from 'react'
class App extends Component {
  constructor(props){
    super(props)
    
    // Set initial state
    this.state = {msg : 'Hi, There!'}
    
    // Binding this keyword
    this.handleClick = this.handleClick.bind(this)
  }
  handleClick(){
  
    // Changing state
    this.setState({msg : 'Welcome to the React world!'})
  }
  
  render(){
    return (
      <div>
        <h2>Message :</h2>
        
<p>{this.state.msg}</p>
        
        {/* Set click handler */}
        <button onClick={this.handleClick}>
          Click here!
        </button>
      </div>
    )
  }
}
export default App
Output:
Example 2:
index.js:
import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'
ReactDOM.render(<App />, document.querySelector('#root'))
App.js:
import React, { Component } from 'react'
class App extends Component {
  static defaultProps = {
    courseContent : [
      'JSX', 'React Props', 'React State', 
      'React Lifecycle Methods', 'React Event Handlers',
      'React Router', 'React Hooks', 'Readux',
      'React Context'
    ]
  }
  
  constructor(props){
    super(props)
    
    // Set initial state
    this.state = {msg : 'React Course', content:''}
    
    // Binding this keyword
    this.handleClick = this.handleClick.bind(this)
  }
  renderContent(){
    return (
      <ul>
        {this.props.courseContent.map(content => (
          <li>{content}</li>
        ))}
      </ul>
    ) 
  }
  handleClick(){
  
    // Changing state
    this.setState({
      msg : 'Course Content',
      content : this.renderContent()
    })
  }
  
  render(){
    return (
      <div>
        <h2>Message :</h2>
        
<p>{this.state.msg}</p>
        
<p>{this.state.content}</p>
        
        {/* Set click handler */}
        <button onClick={this.handleClick}>
           Click here to know contents!
        </button>
      </div>
    )
  }
}
export default App
Output:
