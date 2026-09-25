# React MUI Spacing

> Source: https://www.geeksforgeeks.org/reactjs/react-mui-spacing/

Material UI (MUI) is an open-source React component library based on Google’s Material Design. It provides prebuilt components and customization options for building user interfaces. MUI also includes utility classes for managing spacing between components using margin and padding properties.
- Provides reusable React UI components.
- Supports layout and design customization.
- Includes shorthand margin and padding utility classes.
- Helps control spacing without writing extra CSS.
MUI Setup in React:
Step 1: Type in the following command to create a new React app:
npx create-react-app mui-spacing
Project File Structure: Following is the file structure of the project. All the code will be written in the App.js file:
Step 2: Now move into the directory created and type the following command to install MUI's source files into the React app:
Step 3: To install MUI package using npm:
npm install @material-ui/core
Step 4: Run the react app by typing the command in root of the directory:
To run the React app using npm:
npm start
Spacing in React MUI:
The space utility converts shorthand margin and padding props to margin and padding CSS declarations. Following is the list of the shorthand properties for the property type and side provided by MUI:
MUI Spacing Utilities
MUI provides shorthand props for CSS margin and padding using m and p. It also supports side-specific props to apply spacing individually or by direction.
The side props are t, b, l, r, x, and y, representing top, bottom, left, right, horizontal, and vertical directions. These can be combined with m and p to control element spacing.
Syntax:
{property}{side}: {value}
where,
property: defines which CSS property to apply like margin, padding.
side: specifies the direction (top, right, bottom, left).
value: sets the size or amount based on a predefined scale like spacing units.
Margin and Padding Shorthand Props
Margin Properties:
| CSS property | prop | Description | 
|---|---|---|
| margin | m | Sets the specified margin from all sides of the element. | 
| margin-top | mt | Sets the margin from the top side of the element. | 
| margin-bottom | mb | Sets the margin from the bottom side of the element. | 
| margin-left | ml | Sets the margin from the left side of the element. | 
| margin-right | mr | Sets the margin from the right side of the element. | 
| margin-left and margin-right | mx | Sets the specified margin from both the left as well as the right side of the element. | 
| margin-top and margin-bottom | my | Sets the specified margin from both the top and the bottom side of the element. | 
Table for padding properties:
| CSS property | prop | Description | 
|---|---|---|
| padding | p | This property sets the specified padding from all sides of the element. | 
| padding-top | pt | This property sets the padding from the top side of the element. | 
| padding-bottom | pb | This property sets the padding from the bottom side of the element. | 
| padding-left | pl | This property sets the padding from the left side of the element. | 
| padding-right | pr | This property sets the padding from the right side of the element. | 
| padding-left and padding-right | px | This property sets the specified padding from both the left as well as the right side of the element. | 
| padding-top and padding-right | py | This property sets the specified padding from both the top as well as the bottom side of the element. | 
Example:
m  // Specifying margin on all sides
pt // Specifying padding-top
ml // Specifying margin-left
py // Specifying padding-top and padding-bottom
Note: Box components can be centered by setting horizontal margins to auto. MUI also allows margin and padding values in standard CSS units like px, em, rem, and %, apart from default numeric values.
Example:
m:4  // Sets margin 4 from all sides
pt:2 // Sets padding-top to the value 2
mx:'auto' // Centering element in the horizontal direction
p:'30px' // Setting the padding in px from all 4 sides
ml:'10%' // Setting margin-left in %
This is an example explaining how to specify the values of margin and padding properties using different units available in MUI:
import Box from "@mui/material/Box";
const App = () => {
    return (
        <div>
            <Box
                sx={{
                    bgcolor: "primary.main",
                    fontWeight: 700,
                    height: "150px",
                    width: "150px",
                    borderRadius: 2,
                    fontSize: "1.3rem",
                    pt: 10,
                }}
            >
                Setting padding top using MUI units
            </Box>
            <Box
                sx={{
                    bgcolor: "error.main",
                    fontWeight: 700,
                    height: "150px",
                    width: "150px",
                    borderRadius: 2,
                    fontSize: "1.3rem",
                    m: "50px",
                }}
            >
                Setting margin in px
            </Box>
            <Box
                sx={{
                    bgcolor: "warning.main",
                    fontWeight: 700,
                    height: "150px",
                    width: "150px",
                    borderRadius: 2,
                    fontSize: "1.3rem",
                    px: "15%",
                }}
            >
                Setting padding-x in %
            </Box>
            <Box
                sx={{
                    bgcolor: "success.main",
                    fontWeight: 700,
                    height: "150px",
                    width: "150px",
                    borderRadius: 2,
                    fontSize: "1.3rem",
                    mx: "auto",
                }}
            >
                Centering the Box horizontally
            </Box>
        </div>
    );
};
export default App;
Output:
Using theme.spacing():
Another way to add spacing in React MUI is by using the theme.spacing() helper. It maintains consistent spacing across the UI by multiplying the given value with the spacing factor. 
By default, MUI uses an 8px spacing factor. It also supports up to four arguments for top, right, bottom, and left spacing, and accepts non-numeric values like 'auto', '4rem', and '20%'.
Example: Demonstrating the use of the theme.spacing() helper. It demonstrates how to pass values, multiple values for different sides and values in the form of strings:
import Box from "@mui/material/Box";
import { ThemeProvider, createTheme } from "@mui/material/styles";
const theme = createTheme({
    spacing: 8, // Spacing factor
});
const App = () => {
    return (
        <div>
            <ThemeProvider theme={theme}>
                {/* Passing multiple values as arguments for
                 top, right, bottom, left sides in order */}
                <Box
                    sx={{
                        bgcolor: "error.main",
                        fontWeight: 700,
                        height: "150px",
                        width: "150px",
                        borderRadius: 2,
                        fontSize: "1.3rem",
                        m: theme.spacing(10, 8, 6, 4), 
                    }}
                >
                    This is box 1.
                </Box>
                {/* Spacing using the theme.spacing()
                helper */}
                <Box
                    sx={{
                        bgcolor: "primary.main",
                        fontWeight: 700,
                        height: "150px",
                        width: "150px",
                        borderRadius: 2,
                        fontSize: "1.3rem",
                        p: theme.spacing(4), 
                    }}
                >
                    This is box 2.
                </Box>
                {/* Passing values in form of 
                 strings as arguments */}
                <Box
                    sx={{
                        bgcolor: "warning.main",
                        fontWeight: 700,
                        height: "150px",
                        width: "150px",
                        borderRadius: 2,
                        fontSize: "1.3rem",
                        m: theme.spacing("5%", "auto"), 
                    }}
                >
                    This is box 3.
                </Box>
            </ThemeProvider>
        </div>
    );
};
export default App;
Output:
Reference: https://mui.com/system/spacing/
