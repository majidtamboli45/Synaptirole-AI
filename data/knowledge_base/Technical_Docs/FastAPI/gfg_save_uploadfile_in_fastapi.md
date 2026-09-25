# Save UploadFile in FastAPI

> Source: https://www.geeksforgeeks.org/python/save-uploadfile-in-fastapi/

UploadFile is a class provided by FastAPI to handle file uploads efficiently. It allows to receive uploaded files as function parameters in API endpoints. UploadFile class has the following attributes for getting information about the file submitted by the user:
- filename: Name of the uploaded file
- content_type: It stores information about the content type in the uploaded file. It is also of type string.
- file: File object (used to read/write data)
"/upload/" endpoint is defined to handle file uploads. An HTML form sends the file to this endpoint, where it is received as an UploadFile object.
Setting up the Project
The directory structure should look like this:
Uploading Single Files
form.html is a HTML form that allows users to select a file and submit it to the /upload/ endpoint on localhost.
<!DOCTYPE html>
<html>
<body>
    <form action="http://127.0.0.1:8000/upload/" method="post" enctype="multipart/form-data">
        <input type="file" name="file">
        <button type="submit">Upload</button>
    </form>
</body>
</html>
Form data without files uses application/x-www-form-urlencoded, while file uploads use multipart/form-data. To handle file inputs, install python-multipart using the following pip command.
pip install python-multipart
In app.py, we import FastAPI and UploadFile, create a FastAPI app instance, define a POST/upload/endpoint and implement an async function that handles the uploaded file.
from fastapi import FastAPI, UploadFile, File
app = FastAPI()
@app.post("/upload/")
async def upload_file(file: UploadFile = File(...)):
    with open(file.filename, "wb") as f:
        content = await file.read()
        f.write(content)
    return {"message": "File uploaded successfully"}
Explanation:
- app = FastAPI() Initializes the FastAPI application.
- await file.read() reads the file content asynchronously.
- with open(file.filename, "wb") as f: Opens/creates a file on the server in write-binary mode.
Now to be able to access the /upload endpoint we need to use uvicorn. Run below commmand in the terminal:
python -m uvicorn app:app --reload
The command specifies the file name and FastAPI instance (app:app). The --reload flag restarts the server automatically on code changes. It runs the server locally at:
http://127.0.0.1:8000/
Now open the form.html file in the browser and select a file to save and submit it. The file will be stored on the server at the path specified in the code.
Uploading Multiple Files
To handle multiple file uploads, update the endpoint to accept list[UploadFile]. This allows all uploaded files to be received and processed as a list. Change the Above HTML code to take multiple file inputs:
<!DOCTYPE html>
<html>
<head>
    <title>GFG</title>
</head>
<body>
    <form action="http://127.0.0.1:8000/upload/" method="POST" enctype="multipart/form-data">
        <label for="files">Choose files:</label>
        <input type="file" id="files" name="files" accept=".jpg,.jpeg,.png,.pdf" multiple>
        <br><br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>
In app.py, the function accepts list[UploadFile] to handle multiple files, then iterates through each file and saves it on the server
from typing import List, Annotated
from fastapi import FastAPI, UploadFile, File
app = FastAPI()
@app.post("/upload/")
async def upload_files(files: Annotated[List[UploadFile], File(description="Upload multiple files")]):
    results = []
    for file in files:
        content = await file.read()
        with open(file.filename, "wb") as f:
            f.write(content)
        results.append({"filename": file.filename, "size": len(content)})
    return {"message": "Files uploaded successfully", "files": results}
Explanation:
- @app.post("/upload/") defines a POST endpoint /upload/ for uploading files.
- content = await file.read() reads the file content asynchronously.
- from typing import List, Annotated used to specify that multiple files will be received and to attach metadata (File) to the parameter.
Now to be able to access the /upload endpoint we need to use uvicorn. Run below commmand in the terminal:
python -m uvicorn app:app --reload
In the above image from the interface, select the file and click the upload button. This action redirects to the /upload endpoint and returns a response {"message": "File uploaded successfully"}. The file is then stored on the local server.
