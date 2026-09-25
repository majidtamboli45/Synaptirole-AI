# Dependency Injection in FastAPI

> Source: https://www.geeksforgeeks.org/python/dependency-injection-in-fastapi/

This article explores Dependency Injection (DI) in FastAPI, a modern Python web framework for building APIs. FastAPI's versatility is evident when there's a need to reuse code or override specific sections. Dependency injection in FastAPI facilitates these tasks seamlessly, and we'll delve into its intricacies.
What is Dependency Injection in FastAPI?
Dependency Injection (DI) is a technique employed in programming to enhance code reusability and facilitate the decoupling of a class from its dependencies. In the context of FastAPI, dependency injection plays a pivotal role in optimizing the flexibility, testability, and overall architecture of applications.
Advantages of Dependency Injection
There are some advantages of Dependency Injection in FastAPI:
- Testability:
  - Dependency injection simplifies the testing process by enabling the substitution of real implementations with mock or fake objects. This capability ensures that unit tests focus solely on the component being examined, without involving its dependencies. Consequently, tests become more reliable and maintainable.
- Reusability:
  - FastAPI empowers users to reuse components seamlessly across different sections of an application or even in entirely distinct projects by providing dependencies from external sources. This flexibility allows the same class, with varying dependencies, to serve multiple purposes, promoting efficient code reuse.
- Flexibility:
  - By permitting the alteration of a component's behavior through the modification of injected dependencies, FastAPI promotes flexibility. This not only simplifies the app's functionality but also facilitates extensions or modifications without the need to alter core components.
- Parallel Development:
  - Dependency injection in FastAPI facilitates parallel development, allowing different teams or developers to work concurrently on various parts of the application. This is achieved by adhering to agreed-upon interfaces and dependencies, fostering collaborative development and integration efforts.
Methods of Dependency Injection in FastAPI
- Using the Depends Function in FastAPI
- Handling Sub-Dependencies in FastAPI
- Overriding Dependencies in FastAPI for Testing
Depends Function in FastAPI
In FastAPI, the Depends function is employed to manage dependency injection, serving as a common parameter for other functions. This allows for organized handling of dependencies within FastAPI, facilitating the management and injection of required components across different parts of the application.
Syntax:
- @app.get("URL"): Decorator specifying that the following function responds to HTTP GET requests at the specified URL.
- def main_function(value: str, list=Depends(dependency_function)):
  - value: A string parameter expected by the main function.
  - list: A parameter that depends on the result of the dependency_function. The Depends function is likely used for handling dependencies and obtaining values dynamically.
@app.get("URL")
def main_function(value:str, list = Depends(dependency_function)):
Example:
The code defines a FastAPI application with a list of fruits (main_fruits_list). The /fruits/ endpoint takes a query parameter (fruit) and appends it to the main fruits list, returning a message indicating the addition. The list of fruits is managed through a dependency (call_main_fruits).
# Import FastAPI,  HTTPException, status, Depends libraries
from fastapi import FastAPI, HTTPException, status, Depends
# Create a list for fruits
main_fruits_list = ["Apple"]
# Create a main FastAPI application
app = FastAPI()
# Call main fruits list
def call_main_fruits():
    return main_fruits_list
# Call main FastAPI app using Pydantic
@app.get("/fruits/")
def test_main_fruits(fruit:str, list = Depends(call_main_fruits)):
    list.append(fruit)
    print(list)
    return {"message":f"Added fruit {fruit} in the list!"}
Run the below command .
uvicorn main:app --reload
Output
Handling Sub-Dependencies in FastAPI
In FastAPI, managing sub-dependencies involves organizing and handling additional dependencies within your application. This allows for a structured approach to incorporating and utilizing secondary components or services in FastAPI, contributing to a modular and maintainable codebase.
Syntax:
The dependency_function is an asynchronous function that depends on the result of sub_dependency_function and takes an optional integer parameter value.
async def dependency_function(value: int = Depends(sub_dependency_function))
Example:
The FastAPI code defines a sub-dependency sub_dependency_price that sets a default price if none is provided. The main dependency dependency_fruits takes a fruit and an optional price, utilizing the sub-dependency. The /fruits endpoint uses this dependency to return a dictionary containing the provided fruit and its associated price.
# Import FastAPI and Depends libraries
from fastapi import Depends, FastAPI
# Create a FastAPI app
app = FastAPI()
# Creating a sub-dependency for price
async def sub_dependency_price(price: int):
    if price == 0:
        return 50
    else:
        return price
# Creating dependency of fruits
async def dependency_fruits(fruit: str, price: int = Depends(sub_dependency_price)):
    return {"Fruit": fruit, "Price": price}
# Call FastAPI app using Pydantic
@app.get("/fruits")
async def fetch_authors(fruits_list: dict = Depends(dependency_fruits)):
    return fruits_list
Run the below command in terminal
uvicorn main:app --reload
Output
Overriding Dependencies in FastAPI for Testing
In FastAPI, overriding dependencies for testing involves substituting or modifying dependencies to simulate different scenarios during testing. This allows for controlled testing environments, ensuring that specific dependencies can be manipulated for accurate and comprehensive testing of FastAPI applications.
Syntax:
- main_app_function: It is the function that you want to override.
- override_app_function: It is the function with which you want to override.
app.dependency_overrides[main_app_function] = override_app_function
Example:
This FastAPI code establishes an application with a list of fruits (main_fruits_list). The /fruits/ endpoint, triggered by an HTTP GET request, takes a query parameter fruit and appends it to the main fruits list. The modified list is printed and a response is returned, indicating the successful addition of the specified fruit. The list is managed through a dependency (call_main_fruits), showcasing the integration of dependencies in FastAPI.
# Import FastAPI,  HTTPException, status, Depends libraries
from fastapi import FastAPI, HTTPException, status, Depends
# Create a list for fruits
main_fruits_list = ["Apple"]
# Create a main FastAPI application
app = FastAPI()
# Call main fruits list
def call_main_fruits():
    return main_fruits_list
# Call main FastAPI app using Pydantic
@app.get("/fruits/")
def test_main_fruits(fruit:str, list = Depends(call_main_fruits)):
    list.append(fruit)
    print(list)
    return {"message":f"Added fruit {fruit} in the list!"}
Run the below command
uvicorn main:app --reload
Output
Conclusion
In conclusion, Dependency Injection in FastAPI is a powerful mechanism that enhances code modularity and maintainability. By efficiently managing and injecting dependencies, FastAPI allows developers to create more organized, scalable, and testable applications. Understanding and leveraging Dependency Injection can significantly contribute to the development of robust and efficient web APIs.
