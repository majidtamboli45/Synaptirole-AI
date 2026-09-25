# Create a meme generator by using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/create-a-meme-generator-by-using-reactjs/

In this tutorial, we’ll create a meme generator using ReactJS. In the meme generator, we have two text fields in which we enter the first text and last text. After writing the text when we click the Gen button, it creates a meme with an image and the text written on it.
Preview Image:
Prerequisite
The pre-requisites for this project are:
Approach to Create Meme Generator using React JS
To create the meme generator we will be using the api 'https://api.imgflip.com/get_memes' and fetch method to get and render the meme. It will also have 2 text inputs to add the text to the rendered image along with a button to update a new meme on the page.
Steps to Create Meme Generator using React
Step 1: Create new React app and install the required modules. Check this article for setting up the react app.
Step 2: Define the memeGenerator component and coresponding stylings as given in below example.
Example: This example demonstrates the meme-generator app using the api to generate and display random memes.
/*Filename - App.css*/
.meme {
  position: relative;
  width: 59%;
  max-width: 500px;
  max-height: 500px;
  margin: auto;
  text-align: center;
}
.meme > img {
  margin: auto;
  height: 50%;
  max-width: 500px;
  max-height: 500px;
}
.meme > h2 {
  position: absolute;
  width: 80%;
  text-align: center;
  left: 50%;
  transform: translateX(-50%);
  margin: 15px 0;
  padding: 0 5px;
  font-family: impact, sans-serif;
  font-size: 1em;
  text-transform: uppercase;
  color: white;
  letter-spacing: 1px;
  text-shadow: 2px 2px 0 #000;
}
.meme > .bottom {
  bottom: 0;
}
.meme > .top {
  top: 0;
}
form {
  padding-top: 25px;
  text-align: center;
}
// Filename - App.js
import React from 'react'
import './App.css'
class App extends React.Component {
  state = {
    topText: '',
    bottomText: '',
    allMemeImgs: [],
    randomImg: ''
  }
  // componentDidMount() method to fetch
  // images from the API
  componentDidMount () {
    // Fetching data from the API
    fetch('https://api.imgflip.com/get_memes')
      // Converting the promise received into JSON
      .then(response => response.json())
      .then(content =>
        // Updating state variables
        this.setState({
          allMemeImgs: content.data.memes
        })
      )
  }
  // Method to change the value of input fields
  handleChange = event => {
    // Destructuring the event. target object
    const { name, value } = event.target
    // Updating the state variable
    this.setState({
      [name]: value
    })
  }
  // Method to submit from and create meme
  handleSubmit = event => {
    event.preventDefault()
    const { allMemeImgs } = this.state
    const rand = allMemeImgs[Math.
                floor(Math.random() * allMemeImgs.length)].url
    this.setState({
      randomImg: rand
    })
  }
  render () {
    return (
      <div>
        {/* // Controlled form */}
        <form className='meme-form' onSubmit={this.handleSubmit}>
          {/* // Input field to get First
                    text */}
          <input
            placeholder='Enter Text'
            type='text'
            value={this.state.topText}
            name='topText'
            onChange={this.handleChange}
          />
          {/* // Input field to get Lsst
                    text */}
          <input
            placeholder='Enter Text'
            type='text'
            value={this.state.bottomText}
            name='bottomText'
            onChange={this.handleChange}
          />
          {/* // Button to generate meme */}
          <button>Generate</button>
        </form>
        <br />
        <div className='meme'>
          {/* // Only show the below
                    elements when the image is
                    ready to be displayed */}
          {this.state.randomImg === '' ? (
            ''
          ) : (
            <img src={this.state.randomImg} alt='meme' />
          )}
          {this.state.randomImg === '' ? (
            ''
          ) : (
            <h2 className='top'>{this.state.topText}</h2>
          )}
          {this.state.randomImg === '' ? (
            ''
          ) : (
            <h2 className='bottom'>{this.state.bottomText}</h2>
          )}
        </div>
      </div>
    )
  }
}
export default App
Step 3: Run the app using this command in the terminal:
npm run dev
Output: This output will be visible on the http://localhost:5173/ on browser window
