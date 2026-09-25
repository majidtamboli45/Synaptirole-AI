# UI with Next.js

> Source: https://www.geeksforgeeks.org/reactjs/how-to-use-material-ui-with-next-js/

Material-UI (MUI) is a popular React UI framework that provides ready-made components following Google’s Material Design. It integrates well with Next.js to build responsive, modern web interfaces quickly.
- Provides pre-built UI components like buttons, cards, dialogs, and navigation bars.
- Works smoothly with Next.js SSR (Server-Side Rendering) for better performance and SEO.
- Supports custom themes and styling to easily design consistent user interfaces.
Approach
To use Material-UI with Next.js
- Wrap the application with ThemeProvider to apply a consistent theme across all components.
- Use Material UI components inside Next.js pages or App Router components.
- Customize the theme and styling to build responsive and modern user interfaces.
Steps to Integrate Material UI with Next.js
Step 1: Create a New Next.js application using the following commands.
npx create-next-app@latest my-next-mui
Step 2: Move to the Project directory
cd my-next-mui
Step 3: Install Material-UI
To install the dependencies and save them in your package.json file, run:
npm install @mui/material @emotion/react @emotion/styled @mui/material-nextjs @emotion/cache
Project Structure
It will look like this.
The project contains the following important files and folders:
.next/ : Generated build output by Next.js.
node_modules/ : Installed project dependencies.
public/ : Stores static assets such as images and icons.
src/app/ : Contains the App Router files including page.js, layout.js, and global styles.
package.json : Stores project metadata and installed dependencies.
package-lock.json : Records the exact versions of installed packages.
next.config.mjs : Next.js configuration file.
README.md : Project documentation.
Step 4: Configure Material UI in the App Router
Create a src/theme.js file and update the src/app/layout.js file as shown below to configure Material UI with the Next.js App Router.
// Filename - src/theme.js
"use client";
import { createTheme } from "@mui/material/styles";
const theme = createTheme({
  palette: {
    primary: {
      main: "#1976d2",
    },
    secondary: {
      main: "#9c27b0",
    },
  },
});
export default theme;
Update the src/app/layout.js file
// Filename - src/app/layout.js
import { AppRouterCacheProvider } from "@mui/material-nextjs/v15-appRouter";
import { ThemeProvider } from "@mui/material/styles";
import CssBaseline from "@mui/material/CssBaseline";
import theme from "../theme";
import "./globals.css";
export const metadata = {
  title: "Material UI with Next.js",
  description: "Material UI integration",
};
export default function RootLayout({ children }) {
  return (
    <html lang="en">
      <body>
        <AppRouterCacheProvider>
          <ThemeProvider theme={theme}>
            <CssBaseline />
            {children}
          </ThemeProvider>
        </AppRouterCacheProvider>
      </body>
    </html>
  );
}
Step 5: Use Material UI Components
Open the src/app/page.js file and add the following code to display Material UI components.
import { Button, Typography } from "@mui/material";
export default function Home() {
  return (
    <main style={{ padding: "20px" }}>
      <Typography variant="h4" gutterBottom>
        Welcome to Material UI
      </Typography>
      <Button color="secondary" variant="contained">
        Get Started
      </Button>
    </main>
  );
}
Steps to run the application: To run the app, type the following command in the terminal.
npm run dev
Output:
