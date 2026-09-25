# UI Introduction and Installation

> Source: https://www.geeksforgeeks.org/reactjs/react-material-ui-introduction-and-installation/

Material UI is the most powerful and efficient React UI Framework to build an Application by adding Designs and Animations and using it with technical and scientific innovation. It is basically a design language that was developed by Google in 2014. It uses more Design and Animations, grid-system and provides shadows and lightning effects.
Material UI can be used with all the JavaScript frameworks like AngularJS, VueJS, and libraries like ReactJS, to make the Application more amazing and responsive. With over 35,000 stars on the GitHub, Material UI is one of the top User Interface libraries for React.
Features of Material UI
Material UI provides low-level utility functions called "style functions" for building powerful design systems.
- Access the theme values directly from the component props.
- Encourage UI consistency.
- Write responsive style effortlessly.
- Work with any theme object.
- Less than KB g zipped.
- Fast enough to execute.
Prerequisite:
- A code editor like (VS Code, Atom, Sublime etc).
- NodeJS should be installed.
 Installation of Node.js on Windows
Installation of Node.js on linux
- Knowledge of creating a react app.
Installation:
To install Material UI run the below command in your working directory.
- Install Material UI by using npm.    npm install @material-ui/core
- Install Material UI by using yarn.yarn add @material-ui/core
Example: In this example we will make changes in App.js, we will import Material UI and place a button with the primary color.
<div className="App"> 
        <br />
        <Button variant="contained" color="primary" 
                size="large">
            GeeksforGeeks
        </Button>     
    </div>
    
    ); 
  }
 
}
export default App;
Output:
