# Book Inventory System Using Spring Boot

> Source: https://www.geeksforgeeks.org/advance-java/book-inventory-system-using-spring-boot/

The Book Inventory System in Spring Boot plays an important role in Business logic. Mostly the online Book Inventory System is developed with the required business logic. Here we created a simple Spring Boot Application for the Book Inventory System, This application provides basic functionalities for understanding the Book Inventory System. Those are adding new book information, searching for book information, deleting book information, getting information about available books, and other features. For this Application, we have used Spring MVC with the Thymeleaf Java library.
Application Functionality:
In this Book Inventory System application, we provide basic functions to understand the Book Inventory System.
- Add Book: In this function, we collected book-related information by using the form in the HTML with the help of Thymeleaf. Below we provide what kind of information is collected from the book.
  - id
  - bookid
  - title
  - author
  - publisher
  - publicationYear
  - price
  - quantity
  - language
  - total
  - totalauthor
  - totalprice
- Delete Book: In this function, we can delete unwanted book information by using bookid and below we provide the related logic below with output.
- Search Book: In this function, we can search book information by using bookid and below we provide the related logic below with output.
- Book Info: This is special function in this application, In this function It will show book details with It's availability.
Prerequisites:
- Spring Boot Framework
- Thymeleaf
- MongoDB
- Spring MVC Pattern
- Bootstrap Framework
- Project Type is Gradle
- Spring Tool Suite IDE (STS)
Gradle Dependencies:
dependencies {
implementation 'org.springframework.boot:spring-boot-starter-data-mongodb'
implementation 'org.springframework.boot:spring-boot-starter-thymeleaf'
implementation 'org.springframework.boot:spring-boot-starter-web'
compileOnly 'org.projectlombok:lombok'
developmentOnly 'org.springframework.boot:spring-boot-devtools'
annotationProcessor 'org.projectlombok:lombok'
testImplementation 'org.springframework.boot:spring-boot-starter-test'
}
Project Folder:
Book Inventory System Project in Spring Boot
Spring Initializr:
Using Spring Initializr we will will create our project structure.
- Here we have selected the Project type that is Gradle.
- Then we filled the Metadata of the Project that are: Group Id, Artifact Id, Name, Description, Java version.
- Also, we have added here all the required Gradle dependencies which we can see in the build.gradle file.
Model Layer
Here we created one POJO class for handling database operation with repository interface. The POJO class name is Book and we used one dependency that is Lombok which is available in Spring Boot. This is used for Parameterized and non-Parameterized constructors using @Data, @AllArgsConstructor, @NoArgsConstructor, @Document.
Book.java:
package com.book.inventory.app.domain;
import org.springframework.data.annotation.Id;
import org.springframework.data.annotation.Transient;
import org.springframework.data.mongodb.core.mapping.Document;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * Represents a book entity stored in the database.
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Document(collection = "bookdata")
public class Book {
    @Id
    private String id;
    
    private String bookid;
    private String title;
    private String author;
    private String publisher;
    private String publicationYear;
    private double price;
    private String quantity;
    private String language;
    
    // Transient fields are not persisted in the database
    @Transient
    private String total;
    @Transient
    private String totalauthor;
    @Transient
    private double totalprice;
}
View Layer
In this layer, we have create a view by using HTML, CSS and Bootstrap 5. And we use Thymeleaf Java framework to integrate the both view layer and controller layer with help of the model layer. And The Thymeleaf provide dynamic rendering the application while any change in the controller layer and reflected on the view layer. And in this layer we created different HTML files for different purposes. Below We will provide detailed information for your reference.
index.html:
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/7078/7078214.png">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Book Inventory</title>
</head>
<style>
    @import url('https://fonts.googleapis.com/css2?family=Poetsen+One&display=swap');
    .navbar-brand {
        font-weight: bold;
        color: white !important;
    }
    .nav-link {
        color: white !important;
        text-decoration: none;
        font-weight: 500;
        margin-left: 2rem;
    }
    #left-column {
        background-image: url('https://cdn.pixabay.com/photo/2016/12/27/19/30/book-1934675_1280.jpg');
        background-color: #f5f5f5;
        height: 90vh;
        padding: 20px;
        overflow-y: auto;
        background-size: cover;
        background-position: center;
    }
    #right-column {
        padding: 20px;
        background-color: white;
        height: 90vh;
        overflow-y: auto;
    }
    #book_text {
        margin-top: 2rem;
        font-size: 29px;
        font-family: "Poetsen One", sans-serif;
        font-weight: 200;
        font-style: normal;
        color: green;
    }
    .progress-bar-divider {
        display: flex;
    }
    .progress-bar-divider > div {
        padding: 10px;
        text-align: center;
    }
    .progress-bar-divider > div:not(:last-child) {
        border-right: 3px solid #000;
    }
</style>
<body>
    <nav class="navbar navbar-expand-sm navbar-light bg-success p-3">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> Book Inventory</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
                aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav m-auto mt-2 mt-lg-2 ">
                    <li class="nav-item">
                        <a class="nav-link active" href="/"><i class="fa fa-home" aria-hidden="true"></i> Home
                            <span class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/addBook"><i class="fa fa-plus" aria-hidden="true"></i> Add Book</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="/search"><i class="fa fa-search" aria-hidden="true"></i> Search
                            Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/deleteBook"><i class="fa fa-trash" aria-hidden="true"></i> Delete
                            Book</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="/info"><i class="fa fa-info" aria-hidden="true"></i> Other Info</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main class="container-fluid">
        <div class="row">
            <div class="col-md-6 p-0" id="left-column">
            </div>
            <div class="col-md-6" id="right-column">
                <div class="p-5 text text-center">
                    <p class="text" id="book_text">When I look back, I am so impressed again with the life-giving power
                        of literature. If I were a young person today, trying to gain a sense of myself in the world, I
                        would do that again by reading, just as I did when I was young.</p>
                    <br><br><br>
                    <div class="row p-3 mt-5 progress-bar-divider">
                        <div class="col-sm-4">
                            <h4 class="text text-success">Book</h4>
                        </div>
                        <div class="col-sm-4">
                            <h4 class="text text-success">Read</h4>
                        </div>
                        <div class="col-sm-4">
                            <h4 class="text text-success">Knowledge</h4>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
Output:
Below is the index page of our project.
addbook.html:
Now, we will write code for add book feature.
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/7078/7078214.png">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Add New Book</title>
</head>
<style>
    .navbar-brand {
        font-weight: bold;
        color: white !important;
    }
    .nav-link {
        color: white !important;
        text-decoration: none;
        font-weight: 500;
        margin-left: 2rem;
    }
    form {
        height: auto;
        box-shadow: rgba(9, 30, 66, 0.25) 0px 4px 8px -2px, rgba(9, 30, 66, 0.08) 0px 0px 0px 1px;
    }
    #addbook {
        font-weight: 600;
        font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
    }
    label {
        font-weight: 600;
        font-size: 18px;
        color: black;
        margin-bottom: 4px;
    }
</style>
<body>
    <script>
        function generateRandomId(length) {
            const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            let result = '';
            for (let i = 0; i < length; i++) {
                result += chars.charAt(Math.floor(Math.random() * chars.length));
            }
            return result;
        }
        document.addEventListener('DOMContentLoaded', function () {
            const bookIdInput = document.getElementById('bookid');
            bookIdInput.value = generateRandomId(8); // Set the length of the random bookid as needed
        });
    </script>
    <nav class="navbar navbar-expand-sm navbar-light bg-success p-3">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> Book Inventory</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
                aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav m-auto mt-2 mt-lg-2 ">
                    <li class="nav-item">
                        <a class="nav-link active" href="/"><i class="fa fa-home" aria-hidden="true"></i> Home
                            <span class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/addBook"><i class="fa fa-plus" aria-hidden="true"></i> Add Book</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="/search"><i class="fa fa-search" aria-hidden="true"></i> Search
                            Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/deleteBook"><i class="fa fa-trash" aria-hidden="true"></i> Delete
                            Book</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <main>
        <div class="container mt-5">
            <div th:if="${message}" class="alert alert-success mt-3 alert-dismissible fade show" role="alert">
                <span th:text="${message}"></span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>    
            </div>
            <div th:if="${error}" class="alert alert-danger mt-3 alert-dismissible fade show" role="alert">
                <span th:text="${error}"></span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>    
            </div>
            <form th:action="@{/addBook}" method="post" class="form-control p-3">
                <h2 class="text text-success text-center p-3 mb-5" id="addbook"><strong>Add New Book</strong></h2>
                <div class="row p-4">
                    <div class="col-sm-6">
                        <div class="mb-3">
                            <label>Book Id</label>
                            <input type="text" class="form-control" id="bookid" name="bookid" th:value="${book.bookid}" readonly required/>
                        </div>
                        <div class="mb-3">
                            <label>Book Title</label>
                            <input type="text" class="form-control" id="title" name="title" th:value="${book.title}" required/>
                        </div>
                        <div class="mb-3">
                            <label>Author Name</label>
                            <input type="text" class="form-control" id="author" name="author"
                                th:value="${book.author}" required/>
                        </div>
                        <div class="mb-3">
                            <label>Publisher</label>
                            <input type="text" class="form-control" id="publisher" name="publisher"
                                th:value="${book.publisher}" required/>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="mb-3">
                            <label>Publication Year</label>
                            <input type="text" class="form-control" id="publicationYear" name="publicationYear"
                                th:value="${book.publicationYear}" required/>
                        </div>
                        <div class="mb-3">
                            <label>Book Price</label>
                            <input type="text" class="form-control" id="price" name="price" th:value="${book.price}" required/>
                        </div>
                        <div class="mb-3">
                            <label>Book Quantity</label>
                            <input type="text" class="form-control" id="quantity" name="quantity"
                                th:value="${book.quantity}" required/>
                        </div>
                        <div class="mb-3">
                            <label>Language</label>
                            <input type="text" class="form-control" id="language" name="language"
                                th:value="${book.language}" required/>
                        </div>
                    </div>
                </div>
                <button class="btn btn-success text text-light text-bold mb-2" type="submit"
                    style="margin-left: 1.6rem; font-weight: bolder; font-size: 20px;">Add Book</button>
            </form>
        </div>
    </main>
</body>
</html>
Output:
Below is the image of Add New Book feature of the Project.
search.html:
Now, we will write code for search feature of the project.
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/7078/7078214.png">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <meta charset="UTF-8">
    <title>Search Book Details</title>
</head>
<style>
    .navbar-brand {
        font-weight: bold;
        color: white !important;
    }
    .nav-link {
        color: white !important;
        text-decoration: none;
        font-weight: 500;
        margin-left: 2rem;
    }
    label{
        font-size: 15px;
        color: black;
        font-weight: 600;
    }
    th{
        text-transform: capitalize !important;
        color: white;
    }
</style>
<body>
    <nav class="navbar navbar-expand-sm navbar-light bg-success p-3">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> Book Inventory</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
                aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav m-auto mt-2 mt-lg-2 ">
                    <li class="nav-item">
                        <a class="nav-link active" href="/"><i class="fa fa-home" aria-hidden="true"></i> Home
                            <span class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/addBook"><i class="fa fa-plus" aria-hidden="true"></i> Add Book</a>
                    </li>
                   
                    <li class="nav-item">
                        <a class="nav-link" href="/search"><i class="fa fa-search" aria-hidden="true"></i> Search
                            Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/deleteBook"><i class="fa fa-trash" aria-hidden="true"></i> Delete
                            Book</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <main>
        <div class="container mt-5">
            <div class="search_data mt-5">
                <h5 class="text text-success mt-4 mb-2">Search Book Information</h5>
                <form th:action="@{/search}" method="post" class="form-control mt-5 mb-4 mb-3">
                    <div class="row p-3">
                        <label for="bookId" class="p-2">Book Id</label>
                        <input type="text" id="bookId" name="bookid" class="form-control" required placeholder="Enter Book Id">
                    </div>
                    <button type="submit" class="btn btn-primary mt-2 mb-3">Search Book</button>
                </form>
            </div>
            <div th:if="${book != null}" class="table-responsive">
                <table id="bookTable" class="table table-bordered">
                    <thead class="bg-success">
                    
                        <th>book id</th>
                        <th>title</th>
                        <th>author</th>
                        <th>publisher</th>
                        <th>publicationYear</th>
                        <th>price</th>
                        <th>quantity</th>
                        <th>language</th>
                    </thead>
                    <tbody>
                        <tr>                  
                            <td th:text="${book.bookid}"></td>
                            <td th:text="${book.title}"></td>
                            <td th:text="${book.author}"></td>
                            <td th:text="${book.publisher}"></td>
                            <td th:text="${book.publicationYear}"></td>
                            <td th:text="${book.price}"></td>
                            <td th:text="${book.quantity}"></td>
                            <td th:text="${book.language}"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="alert alert-danger mt-3 alert-dismissible fade show" role="alert" th:if="${errorMessage}">
                <span th:text="${errorMessage}"></span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>    
            </div>
        </div>
    </main>
</body>
</html>
Output:
Below is the screen of search book information.
deletebook.html:
Now, we will write code to delete book.
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/7078/7078214.png">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Delete Book</title>
</head>
<style>
    .navbar-brand {
        font-weight: bold;
        color: white !important;
    }
    .nav-link {
        color: white !important;
        text-decoration: none;
        font-weight: 500;
        margin-left: 2rem;
    }
    label{
        font-size: 15px;
        color: black;
        font-weight: 600;
    }
</style>
<body>
    <nav class="navbar navbar-expand-sm navbar-light bg-success p-3">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> Book Inventory</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
                aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav m-auto mt-2 mt-lg-2 ">
                    <li class="nav-item">
                        <a class="nav-link active" href="/"><i class="fa fa-home" aria-hidden="true"></i> Home
                            <span class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/addBook"><i class="fa fa-plus" aria-hidden="true"></i> Add Book</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="/search"><i class="fa fa-search" aria-hidden="true"></i> Search
                            Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/deleteBook"><i class="fa fa-trash" aria-hidden="true"></i> Delete
                            Book</a>
                    </li>
                    
                    
                </ul>
            </div>
        </div>
    </nav>
    
    <main>
        <div class="container mt-5">
            <div class="search_data mt-5">
                <h5 class="text text-success mt-4 mb-2">Search Book Information & Delete</h5>
                <form th:action="@{/deleteBook}" method="post" class="form-control p-3 mt-4 mb-3">
                    <div class="row p-3">
                        <label for="" class="p-2">Book Id</label>
                        <input type="text" name="bookid" id="" class="form-control" required placeholder="Enter Book Id">
                    </div>
                    <button class="btn btn-danger mt-2 mb-3">Delete Book</button>
                </form>
            </div>
            
            <div class="alert alert-success mt-3 alert-dismissible fade show" role="alert" th:if="${successMessage}">
                <span th:text="${successMessage}"></span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>    
            </div>
            
            <div class="alert alert-danger mt-3 alert-dismissible fade show" role="alert" th:if="${errorMessage}">
                <span th:text="${errorMessage}"></span>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>    
            </div>
        </div>
    </main>
</body>
</html>
Output:
Below is the screen of delete book by Id.
info.html:
Now, we will write code for book information.
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/7078/7078214.png">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    .navbar-brand {
        font-weight: bold;
        color: white !important;
    }
    .nav-link {
        color: white !important;
        text-decoration: none;
        font-weight: 500;
        margin-left: 2rem;
    }
</style>
<body>
    <nav class="navbar navbar-expand-sm navbar-light bg-success p-3">
        <div class="container">
            <a class="navbar-brand" href="#"><i class="fa fa-book" aria-hidden="true"></i> Book Inventory</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavId"
                aria-controls="collapsibleNavId" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="collapsibleNavId">
                <ul class="navbar-nav m-auto mt-2 mt-lg-2 ">
                    <li class="nav-item">
                        <a class="nav-link active" href="/"><i class="fa fa-home" aria-hidden="true"></i> Home
                            <span class="visually-hidden">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/addBook"><i class="fa fa-plus" aria-hidden="true"></i> Add Book</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="/search"><i class="fa fa-search" aria-hidden="true"></i> Search
                            Book</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/deleteBook"><i class="fa fa-trash" aria-hidden="true"></i> Delete
                            Book</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="/info"><i class="fa fa-info" aria-hidden="true"></i> Other Info</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <main>
        <div class="container p-5 mt-5" style="background-color: rgb(223, 255, 233);">
            <div class="row">
                <div class="col-sm-4 p-4 mt-2 mb-2 text-center">
                   <h3 class="text text-success"> Total Books</h3>
                   <h1 th:text="${totalBooks}"></h1>
                </div>
                <div class="col-sm-4 p-4 mt-2 mb-2 text-center">
                    <h3 class="text text-success"> Total Books Price</h3>
                    <h1 th:text="${totalBooksPrice}"></h1>
                </div>
                <div class="col-sm-4 p-4 mt-2 mb-2 text-center">
                    <h3 class="text text-success"> Total Authors</h3>
                    <h1 th:text="${totalAuthors}"></h1>
                </div>
            </div>
        </div>
        <div class="container mt-5">
            <div class="table-responsive ">
                <table class="table mt-4 table-bordered">
                    <thead class="bg-success">
                        <tr>
                            <th>Book ID</th>
                            <th>Title</th>
                            <th>Author</th>
                            <th>Publisher</th>
                            <th>Publication Year</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Language</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr th:each="book : ${books}">
                            <td th:text="${book.bookid}"></td>
                            <td th:text="${book.title}"></td>
                            <td th:text="${book.author}"></td>
                            <td th:text="${book.publisher}"></td>
                            <td th:text="${book.publicationYear}"></td>
                            <td th:text="${book.price}"></td>
                            <td th:text="${book.quantity}"></td>
                            <td th:text="${book.language}"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</body>
</html>
Output:
Below is the screen of Total Book numbers, their price, and total number of authors.
Controller Layer
In Book Inventory System, we have created one Controller class with name BookController by using @Controller Spring Annotations. This class is used for define the API end points to hit the API through the Web Browser. Here every API have different request types like GET, POST. It holds all the business logic and provide the output on the web page by using Thymeleaf Framework.
BookRepo.java:
package com.book.inventory.app.repo;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;
import com.book.inventory.app.domain.Book;
@Repository
public interface BookRepo extends MongoRepository<Book, String> {
    Book findByBookid(String bookid);
    void deleteByBookid(String bookid);
}
BookController.java:
package com.book.inventory.app.controller;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import com.book.inventory.app.domain.Book;
import com.book.inventory.app.repo.BookRepo;
/**
 * Controller class responsible for handling HTTP requests related to books.
 */
@Controller
public class BookController {
    
    @Autowired
    private BookRepo repo;
    
    /**
     * Displays the index page.
     */
    @GetMapping("/")
    public String showIndex(Model model) {
        model.addAttribute("book", new Book());
        return "index";
    }
    
    /**
     * Displays the page for adding a new book.
     */
    @GetMapping("/addBook")
    public String showaddBook(Model model) {
        model.addAttribute("book", new Book());
        return "addbook";
    }
    
    /**
     * Displays the page for updating a book.
     */
    @GetMapping("/updateBook")
    public String showupdateBook(Model model) {
        model.addAttribute("book", new Book());
        return "updatebook";
    }
    
    /**
     * Displays the page for deleting a book.
     */
    @GetMapping("/deleteBook")
    public String showdeleteBook(Model model) {
        model.addAttribute("book", new Book());
        return "deletebook";
    }
    
    /**
     * Displays the page for searching a book.
     */
    @GetMapping("/search")
    public String searchBook(Model model) {
        model.addAttribute("book", new Book());
        return "search";
    }
    
    /**
     * Displays information about the books.
     */
    @GetMapping("/info")
    public String getInfo(Model model) {
        long totalBooks = repo.count();
        double totalBooksPrice = repo.findAll().stream().mapToDouble(Book::getPrice).sum();
        long totalAuthors = repo.findAll().stream().map(Book::getAuthor).distinct().count();
        
        // Fetch all books from the repository
        List<Book> books = repo.findAll();
        
        model.addAttribute("totalBooks", totalBooks);
        model.addAttribute("totalBooksPrice", totalBooksPrice);
        model.addAttribute("totalAuthors", totalAuthors);
        model.addAttribute("books", books); 
        
        return "info";
    }
    
    /**
     * Saves a new book to the database.
     */
    @PostMapping("/addBook")
    public String saveBook(@ModelAttribute Book book, Model model) {
        try {
            repo.save(book);
            model.addAttribute("message", "Book added successfully.");
        } catch (Exception e) {
            model.addAttribute("error", "Failed to add book: " + e.getMessage());
        }
        return "addBook";
    }
    
    /**
     * Searches for a book in the database.
     */
    @PostMapping("/search")
    public String searchBook(@ModelAttribute Book book, Model model) {
        Book foundBook = repo.findByBookid(book.getBookid());
        if (foundBook != null) {
            model.addAttribute("book", foundBook);
            model.addAttribute("errorMessage", null);
        } else {
            model.addAttribute("book", null);
            model.addAttribute("errorMessage", "Book not found!");
        }
        return "search";
    }
    
    /**
     * Deletes a book from the database.
     */
    @PostMapping("/deleteBook")
    public String deleteBook(@ModelAttribute Book book, Model model) {
        String bookId = book.getBookid();
        Book deleteBook = repo.findByBookid(bookId);
        if (deleteBook != null) {
            repo.delete(deleteBook);
            model.addAttribute("book", deleteBook);
            model.addAttribute("successMessage", "Book Deleted Successfully");
        } else {
            model.addAttribute("book", null);
            model.addAttribute("errorMessage", "Book not found!");
        }
        return "deletebook";
    }
}
In the above Controller class, we have different API end points for different purpose in our project. Below we provide details information about that APIs.
APIs Information:
In this application, we use different types APIs with various mappings for different purpose. Below we provide a detailed information for each API with related output for better understanding the concept.
1. @GetMapping("/"):
This API is used for display the home page by default to the end user where Hit this URL through browser. And Its mapping type is GET Mapping then only user can view the HTML page.
API Endpoint to display the index page:
http://localhost:8080/
@GetMapping("/")
public String showIndex(Model model) {
model.addAttribute("book", new Book());
return "index";
}
2. @GetMapping("/addBook"):
This API is used for display the Add New Book page to the end user where Hit this URL through browser. And Its mapping type is GET Mapping then only user can view the HTML page.
API Endpoint to display the add new book page:
http://localhost:8080/addBook
@GetMapping("/addBook")
public String showaddBook(Model model) {
model.addAttribute("book", new Book());
return "addbook";
}
3. @GetMapping("/deleteBook"):
This API is used for display the delete Book page to the end user where Hit this URL through browser. And Its mapping type is GET Mapping then only user can view the HTML page.
API Endpoint to display the delete book page:
http://localhost:8080/deleteBook
,@GetMapping("/deleteBook")
public String showdeleteBook(Model model) {
model.addAttribute("book", new Book());
return "deletebook";
}
4.@GetMapping("/search"):
This API is used for display the search Book page to the end user where Hit this URL through browser. And Its mapping type is GET Mapping then only user can view the HTML page.
API Endpoint to display the search book page:
http://localhost:8080/search
    @GetMapping("/search")
public String searchBook(Model model) {
model.addAttribute("book", new Book());
return "search";
}
5.@GetMapping("/info"):
This API is used for display the Book related information to the end user where Hit this URL through browser. And Its mapping type is GET Mapping then only user can view the HTML page.
API Endpoint of all book Information:
http://localhost:8080/info
    @GetMapping("/info")
public String getInfo(Model model) {
long totalBooks = repo.count();
double totalBooksPrice = repo.findAll().stream().mapToDouble(Book::getPrice).sum();
long totalAuthors = repo.findAll().stream().map(Book::getAuthor).distinct().count();
// Fetch all books from the repository
List<Book> books = repo.findAll();
model.addAttribute("totalBooks", totalBooks);
model.addAttribute("totalBooksPrice", totalBooksPrice);
model.addAttribute("totalAuthors", totalAuthors);
model.addAttribute("books", books);
return "info";
}
All Book Information:
6.@PostMapping("/addBook"):
This API is used for save Book related information in the database when end user Hit this URL through browser. And Its mapping type is POST Mapping, Once data is successfully saved in MongoDB then we will get Conformation Alert message. You observe in the blow output image.
Endpoint API to add new Book:
http://localhost:8080/addBook
    @PostMapping("/addBook")
public String saveBook(@ModelAttribute Book book, Model model) {
try {
repo.save(book);
model.addAttribute("message", "Book added successfully.");
} catch (Exception e) {
model.addAttribute("error", "Failed to add book: " + e.getMessage());
}
return "addBook";
}
Adding New Book:
7. @PostMapping("/search"):
This API is used for search Book related information in the database when end user Hit this URL through browser by using Book ID. And Its mapping type is POST Mapping, When Book Id is available the book information is displayed in the table otherwise show error alert message.
Endpoint API to search Book:
http://localhost:8080/search
    @PostMapping("/search")
public String searchBook(@ModelAttribute Book book, Model model) {
Book foundBook = repo.findByBookid(book.getBookid());
if (foundBook != null) {
model.addAttribute("book", foundBook);
model.addAttribute("errorMessage", null);
} else {
model.addAttribute("book", null);
model.addAttribute("errorMessage", "Book not found!");
}
return "search";
}
After searching correct Book Id, Book information found.
After searching Book by Id, Book not found:
8. @PostMapping("/deleteBook"):
This API is used for delete Book related information in the database when end user Hit this URL through browser by using Book ID. And Its mapping type is POST Mapping, When Book Id is available the book information is deleted in the table otherwise show error alert message.
Endpoint API to delete book:
http://localhost:8080/deleteBook
    @PostMapping("/deleteBook")
public String deleteBook(@ModelAttribute Book book, Model model) {
String bookId = book.getBookid();
Book deleteBook = repo.findByBookid(bookId);
if (deleteBook != null) {
repo.delete(deleteBook);
model.addAttribute("book", deleteBook);
model.addAttribute("successMessage", "Book Deleted Successfully");
} else {
model.addAttribute("book", null);
model.addAttribute("errorMessage", "Book not found!");
}
return "deletebook";
}
Book Deleted Successfully:
