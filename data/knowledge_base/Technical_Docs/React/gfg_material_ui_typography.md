# Material UI Typography

> Source: https://www.geeksforgeeks.org/reactjs/material-ui-typography/

Material-UI is a user interface library that provides pre-defined and customizable React components for faster and easy web development, these Material-UI components are based on top of Material Design by Google. In this article let's discuss the Typography component in the Material-UI library.
Typography:
Typography is a Material-UI component used to standardize the text and its related CSS properties without worrying about browser compatibility issues.
Example:
<Typography variant="h1"> h1 - Heading Variant </Typography>
Installing React App:
Step 1: Create a React app using the following command.
npx create-react-app typography-example
Step 2: Now get into the project directory by the following command:
cd typography-example
Installing Material-UI:
Installing Material-UI's source files via npm/yarn, and they take care of injecting the CSS needed.
npm install @mui/material @emotion/react @emotion/styled
// OR
yarn add @mui/material @emotion/react @emotion/styled
Importing Typography:
You can import <Typography /> component from @mui/material using the following code.
import Typography from '@mui/material/Typography';
// or
import { Typography } from '@mui/material';
Important Props and its values:
- align: It is used to align the text on the component. Example: inherit, left, center, right, or justify.
- color: It is used to set the text color of the component. Example: initial, inherit, primary, secondary, textPrimary, textSecondary, or error.
- variant: It is used to set the theme typography styles. Example: h1, h2, h3, h4, h5, h6, subtitle1, subtitle2, body1, body2, caption, button, overline, srOnly or inherit.
- classes: It is the custom CSS object to override the styles.
- paragraph: If this is true the text will have a bottom margin. Example: true or false.
Example: Implementing H1, H2, H3 styling using <Typography /> in App.js file.
import { Typography } from '@mui/material';
function App() {
  return (
    <div className="App">
      {/* Setting the text styling to H1*/}
      <Typography variant="h1">
        H1.Heading
      </Typography>
      {/* Setting the text to center with align prop */}
      <Typography align="center" variant="h2">
        H2.Heading
      </Typography>
      {/* Setting the text color to primary*/}
      <Typography color="primary" variant="h3">
        H3.Heading
      </Typography>
      {/* Setting the text type styling to be like a button */}
      <Typography variant="button">
        Button
      </Typography>
    </div>
  );
}
export default App;
Step to Run Application: Run the application using the following command from the root directory of the project:
npm start
Output:
