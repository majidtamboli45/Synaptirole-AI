# React MUI List API

> Source: https://www.geeksforgeeks.org/reactjs/react-mui-list-api/

Material-UI is a UI library providing predefined robust and customizable components for React for easier web development. The MUI design is based on top of Material Design by Google.
In this article, we will discuss the React MUI List API. Lists are continuous ranges of similar or identical items usually used to display a list of records. The API provides a lot of functionality and we will learn to implement them.
Import List API
import List from '@mui/material/List';
// or
import { List } from '@mui/material';
Props List: Here is the list of props used with this component. We can access them and modify them according to our needs.
- children(node): It is used to set the content of the component.
- classes(object): This overrides the existing styles or adds new styles to the component.
- component(elementType): This is used to access the root node.
- dense(bool): If set to true, the content padding is reduced and the children appear more closer. The default value is false.
- disablePadding(bool): If set to true, vertical padding is removed from the list. The default value is false.
- subheader(node): The subheader's content, which is often ListSubheader.
- sx( Array<func / object / bool>/ func / object): The system prop allows defining system overrides as well as additional CSS styles.
CSS Rules:
- root(.MuiList-root): It is the style applied to the root element.
- padding(.MuiList-padding): It is the style applied to the root element unless disablePadding is set to true.
- dense(.MuiList-dense): It is the style applied to the root element if dense.
- subheader(.MuiList-subheader): It is the style applied to the root element if a subheader is provided.
Syntax: Create a List component as follows:
<List>
  <ListItem>
      <ListItemText primary="Data Structures" />
  </ListItem>
</List>
Installing and Creating React app, and adding the MUI dependencies.
Step 1: Use the following command to create a react project:
npx create-react-app gfg_tutorial
Step 2: Get into the project directory
cd gfg_tutorial
Step 3: Install the MUI dependencies as follows:
npm install @mui/material @emotion/react 
npm install @emotion/styled @mui/lab @mui/icons-material
Project Structure: The project structure should look like the below:
Steps to run the application: Run the project as follows:
npm start
Example 1: In the following example, we have a List component with some items.
import "./App.css";
import * as React from "react";
import Box from "@mui/material/Box";
import List from "@mui/material/List";
import ListItem from "@mui/material/ListItem";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import Divider from "@mui/material/Divider";
import InboxIcon from "@mui/icons-material/Inbox";
import DraftsIcon from "@mui/icons-material/Drafts";
function App() {
    return (
        <div className="App">
            <div
                className="head"
                style={{
                    width: "fit-content",
                    margin: "auto",
                }}
            >
                <h1
                    style={{
                        color: "green",
                    }}
                >
                    GeeksforGeeks
                </h1>
                <strong>React MUI List API</strong>
            </div>
            <br />
            <Box
                sx={{
                    width: "100%",
                    maxWidth: 360,
                    margin: "auto",
                    bgcolor: "background.paper",
                }}
            >
                <nav>
                    <List>
                        <ListItem disablePadding>
                            <ListItemButton>
                                <ListItemText
                                    primary="Data Structures" />
                            </ListItemButton>
                        </ListItem>
                        <ListItem disablePadding>
                            <ListItemButton>
                                <ListItemText
                                    primary="Algorithms" />
                            </ListItemButton>
                        </ListItem>
                        <ListItem disablePadding>
                            <ListItemButton>
                                <ListItemText
                                    primary="Machine Learning" />
                            </ListItemButton>
                        </ListItem>
                    </List>
                </nav>
                <Divider />
            </Box>
        </div>
    );
}
export default App;
Output:
Example 2: In the following example, we have two lists one with padding and another without padding.
import "./App.css";
import * as React from "react";
import Box from "@mui/material/Box";
import List from "@mui/material/List";
import ListItem from "@mui/material/ListItem";
import ListItemButton from "@mui/material/ListItemButton";
import ListItemIcon from "@mui/material/ListItemIcon";
import ListItemText from "@mui/material/ListItemText";
import Divider from "@mui/material/Divider";
import InboxIcon from "@mui/icons-material/Inbox";
import DraftsIcon from "@mui/icons-material/Drafts";
function App() {
    return (
        <div className="App">
            <div
                className="head"
                style={{
                    width: "fit-content",
                    margin: "auto",
                }}
            >
                <h1
                    style={{
                        color: "green",
                    }}
                >
                    GeeksforGeeks
                </h1>
                <strong>React MUI List API</strong>
            </div>
            <br />
            <Box
                sx={{
                    width: "100%",
                    maxWidth: 360,
                    margin: "auto",
                    bgcolor: "background.paper",
                }}
            >
                <nav>
                    <List>
                        <ListItem>
                            <ListItemButton>
                                <ListItemText
                                    primary=
                                    "Data Structures" />
                            </ListItemButton>
                        </ListItem>
                        <ListItem>
                            <ListItemButton>
                                <ListItemText
                                    primary=
                                    "Algorithms" />
                            </ListItemButton>
                        </ListItem>
                        <ListItem>
                            <ListItemButton>
                                <ListItemText
                                    primary=
                                    "Machine Learning" />
                            </ListItemButton>
                        </ListItem>
                    </List>
                </nav>
                <nav>
                    <List dense>
                        <ListItem>
                            <ListItemButton>
                                <ListItemText
                                    primary=
                                    "Competitive Programming" />
                            </ListItemButton>
                        </ListItem>
                        <ListItem>
                            <ListItemButton>
                                <ListItemText
                                    primary=
                                    "Web development" />
                            </ListItemButton>
                        </ListItem>
                        <ListItem>
                            <ListItemButton>
                                <ListItemText
                                    primary=
                                    "Blockchain" />
                            </ListItemButton>
                        </ListItem>
                    </List>
                </nav>
                <Divider />
            </Box>
        </div>
    );
}
export default App;
Output:
Reference: https://mui.com/material-ui/api/list/#main-content
