# Django QuerySet

> Source: https://www.geeksforgeeks.org/python/django-query-set-order-by/

order_by() method in Django QuerySets is used to sort results based on one or more fields.
- Supports sorting in both ascending and descending order.
- Can sort by fields like name, date, salary, or any model field.
- Sorting happens at the database level for better performance.
- Helps display data in a structured and meaningful order.
Understanding the Dataset
Consider a project named 'projectApp' with a model 'EmployeeDetails'. In models.py:
from django.db import models
class EmployeeDetails(models.Model):
    EmployeeId = models.AutoField(primary_key=True)
    EmployeeName = models.CharField(max_length=20)
    EmployeeDepartment = models.CharField(max_length=20, blank=True, null=True)
    Country = models.CharField(max_length=20, blank=True, null=True)
    Salary = models.IntegerField(blank=True, null=True)
    
    def __str__(self):
        return self.EmployeeName
After creating this model, run the following two commands to create and apply migrations, which will create the corresponding database tables.
python manage.py makemigrations
python manage.py migrate
Add some sample data via the Django admin or shell before testing.
Using order_by()
Open the Django shell:
python manage.py shell
1. Sort Employees in Ascending Order by Salary
from yourapp.models import EmployeeDetails
# Retrieve all employees ordered by Salary (lowest first)
employees = EmployeeDetails.objects.all().order_by('Salary')
for emp in employees:
    print(emp.EmployeeName, emp.Salary)
This will display employees starting from the lowest salary:
2. Sort Employees by Salary in Descending Order
# Using '-' prefix to sort descending by Salary
employees = EmployeeDetails.objects.all().order_by('-Salary')
for emp in employees:
    print(emp.EmployeeName, emp.Salary)
The '-' before the field name reverses the order, so the highest salaries appear first:
3. Alternative Descending Order Approaches
# Approach 1: Reverse the QuerySet after ascending order
employees = EmployeeDetails.objects.all().order_by('Salary').reverse()
# Approach 2: Using Python list slicing (less efficient)
employees = list(EmployeeDetails.objects.all().order_by('Salary'))[::-1]
for emp in employees:
    print(emp.EmployeeName, emp.Salary)
While these approaches work, using -Salary with order_by() is often the most direct option. reverse() can also be useful when reversing an existing ordering.
4. Sort by Multiple Fields
# Order first by Salary ascending, then by EmployeeName ascending
employees = EmployeeDetails.objects.all().order_by('Salary', 'EmployeeName')
for emp in employees:
    print(emp.EmployeeName, emp.Salary)
Employees are sorted by salary, when salaries are equal, they are sorted alphabetically by name:
