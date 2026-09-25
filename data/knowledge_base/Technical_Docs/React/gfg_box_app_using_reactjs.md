# Box App using ReactJS?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-color-box-app-using-reactjs/

Basically we want to build an app that shows the number of boxes which has different colors assigned to each of them. Each time the app loads different random colors are assigned. when a user clicks any of the boxes, it changes its color to some different random color that does not equal to its previous color value.
We create three components 'App' and 'BoxContainer' and 'Box'. The app component renders a single BoxContainer component only. There is no actual logic put inside the App component. BoxContainer component contains all the behind logics. It has a default prop 'num' that accounts for a number of different color boxes shows to the screen. It is a stateful component and has a single state that contains an array of RGB color values. We map over each color of state 'colors' and for each color, we render a 'Box' component. The box component is responsible to show each individual boxes with their proper color set in the background of the box. The Box component sets a click event handler to each box component and when the user clicks on any box, some logic is executed that changes the color of that box. BoxContainer component uses the props system to communicate with the Box component.
Example:
index.js:
import React from 'react'
import ReactDOM from 'react-dom'
import App from './App'
ReactDOM.render(<App />, document.querySelector('#root'))
App.js : App component renders single BoxContainer component only
import React from 'react';
import BoxContainer from './BoxContainer'
function App() {
  return (
    <div className="App">
      <BoxContainer />
    </div>
  );
}
export default App;
BoxContainer.js : It contains all the behind the logic. It is a stateful component. There is a single state that contains an array of RGB color values. number of colors(number of color boxes want to render by when the application starts) set as default props. We map over each color of state colors and for each color, we render a 'Box' component. BoxConatiner component also contains a method changeColor that is responsible to change the color of the box, each time a box is clicked. It generates a new random color until the new color value is not equal to the previous color of the box and updates the state colors by inserting that new color in place of the previous color value.
import React,{ Component } from 'react'
import './BoxContainer.css'
import Box from './Box'
import { rgbValue, generateColors } from './helper'
class BoxContainer extends Component{
  // Number of color boxes want shows by default
  static defaultProps = {
    num : 18
  }
  constructor(props){
    super(props)
    this.state = {
    
      // Color state contains array of rgb color values
      colors : generateColors(this.props.num)
    }
    this.changeColor = this.changeColor.bind(this)
  }
  changeColor(c){
  
    // Create new random rgb color
    let newColor
    do{
      newColor = `rgb(
        ${rgbValue()},
        ${rgbValue()},
        ${rgbValue()}
      )`
      
    // If new rgb color is equal to previous 
    // color of the box then again create new 
    // rgb color value
    }while(newColor === c)
    // Change colors array state by inserting 
    // new color value in place of previous color
    this.setState(st => ({
      colors : st.colors.map(color => {
        if(color !== c) return color
        return newColor
      })
    }))
  }
  render(){ 
    return(
      <div className='BoxContainer'>
        {this.state.colors.map(color => (
        
          // For each color make a box component
          <Box color={color} changeColor={this.changeColor}/>
        ))}
      </div>
    )
  }
}
export default BoxContainer
Box.js : It is responsible to show each box with its proper color set in the background. It also set a click handler to each div component and executes a callback each time user clicks on the box. The click handler callback in return calls the changeColor method of the BoxContainer component passing the current color of the box. BoxContainer component communicates with the Coin component using the props system.
import React,{ Component } from 'react'
class Box extends Component{
  constructor(props){
    super(props)
    this.handleChangeColor = this.handleChangeColor.bind(this)
  }
  // Handler callback
  handleChangeColor(){
  
    // Call parent component cahngeColor  method passing the
    // color value of div
    this.props.changeColor(this.props.color)
  }
  render(){
  
    // Create a div component and assign the given 
    // color value by BoxContainer component as its
    // background color
    return <div
    
    // Set click handler to the div and pass a callback
      onClick={this.handleChangeColor} 
      style={{backgroundColor:this.props.color, 
                  width:'13em', height:'13em'}} 
    />
  }
}
export default Box
helper.js : It creates and returns some helper function that is used in our main components.
// Method return a random number from 0 to 255 
const rgbValue = () => {
  return Math.floor(Math.random() * 256)
}
// Method generates an array of rgb colors
const generateColors = (num) => {
  let colors = []
  
  for(let i=0; i<num; i++){
    const red = rgbValue()
    const blue = rgbValue()
    const green = rgbValue()
    colors.push(`rgb(${red},${blue},${green})`)
  }
  return colors
}
export { rgbValue, generateColors }
BoxContainer.css :
.BoxContainer{
  display:flex;
  flex-wrap:wrap;
  justify-content: center;
  align-items: center;
  flex:1
}
Output :
