# HTML del Tag

> Source: https://www.geeksforgeeks.org/html/html-del-tag

The HTML <del> tag is used to indicate text that has been deleted from a document.
- It visually represents this deletion by striking through the text, which helps in tracking changes or revisions in documents.
- It provides semantic meaning for content that has been intentionally removed, such as in editing or version control scenarios.
<!DOCTYPE html>
<html>
<body>
  <p>
    GeeksforGeeks is a
    <del>mathematical</del>
    science portal
  </p>
</body>
</html>
Syntax:
<del attr="values"> Contents... </del>
- cite: The cite is used to specify the URL of the document or message which denotes the reason for deleting the text.
- datetime: The datetime is used to specify the date and time of the deleted text.
Example: <del> tag with datetime attribute
<!DOCTYPE html>
<html>
<head>
  <style>
    del {
      color: red;
      text-decoration: line-through;
    }
  </style>
</head>
<body>
  <p>
    The project deadline has been changed from
    <del datetime="2024-01-03T12:00:00Z">January 15, 2024</del>
    to January 30, 2024.
  </p>
  <p>
    The following feature was removed:
    <del datetime="2024-01-05T12:00:00Z">User authentication via email</del>.
  </p>
</body>
</html>
Note: The datetime attribute is semantic metadata only and does not affect the visual appearance unless explicitly rendered using CSS or JavaScript.
