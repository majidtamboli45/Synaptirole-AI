# HTML File Paths

> Source: https://www.geeksforgeeks.org/html/html-file-paths

HTML file paths specify the location of resources like images, videos, scripts, and documents so the browser can load them correctly.
- Help the browser locate and load external resources.
- Used for files such as images, videos, scripts, and documents.
- Specified using attributes like src and href.
Types of File Paths
File paths can be absolute or relative, depending on how the resource location is specified.
1. Absolute File Paths
It specifies the full URL or complete location of a resource, starting from the root of the website or including the domain name.
- Point directly to a resource's location on the internet and include the full URL, which consists of the protocol (http:// or https://), domain, and path to the resource.
- Best for resources that are hosted externally. The browser knows exactly where to find them regardless of the current document’s location.
Syntax:
<img src="https://media.geeksforgeeks.org/wp-content/uploads/geek.png" alt="My Image">
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<!--Driver Code Ends-->
<body>
    <img src=
"https://media.geeksforgeeks.org/wp-content/uploads/geek.png" 
         alt="My Image" 
         style="width: 400px" />
</body>
<!--Driver Code Starts-->
</html>
<!--Driver Code Ends-->
2. Relative File Paths
Relative file paths locate resources based on the HTML file’s location, keeping links portable.
- Specify the path to a resource in relation to the location of the HTML file currently being viewed.
- Ideal for resources within the same website. Keeps your HTML portable if the domain changes since the path doesn’t need to be updated.
Syntax:
<img src="images/geeks.jpg" alt="My Image">
<!--Driver Code Starts-->
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<!--Driver Code Ends-->
<body>
    <h2>File present in the same folder</h2>
    <img src="images/geeks.jpg" 
         alt="My Image" 
<!--Driver Code Starts-->
         style="width:400px">
</body>
</html>
<!--Driver Code Ends-->
The relative file path "images/geeks.jpg" indicates that the image file "geeks.jpg" is located in a subfolder named "images" relative to the current HTML file.
Relative Path Variants
Document-relative paths start from the HTML file’s folder, while root-relative paths start from the server’s root directory.
- Document-relative paths: As in the above example, the path starts from the directory of the current HTML document.
- Root-relative paths: Start with a slash (/), which tells the browser to look for the resource starting from the root directory of the server. Example:
<img src="/images/geeks.jpg">
Directory-relative paths: Use dot notation to navigate the directory structure:
- ./ refers to the current directory.
- ../ moves up one directory level.
<img src="../images/geeks.jpg"> <!-- Goes up one directory, then into the images folder -->
Best Practices for Using HTML File Paths
It Maintain a consistent folder structure, use relative paths for internal resources, test paths both locally and on the server, and avoid spaces in filenames.
- Keep a Consistent Structure: Organize your files in a logical structure which makes it easier to manage and reference your resources.
- Use Relative Paths for Internal Resources: This makes your website more portable and easier to maintain, especially if you migrate to a different domain.
- Test Paths Locally and on the Server: Paths that work on your local machine may not function the same way on a web server due to different directory structures or permissions.
- Avoid Spaces in Filenames: Spaces can cause issues in URLs and make linking more complex. Use hyphens or underscores instead.
