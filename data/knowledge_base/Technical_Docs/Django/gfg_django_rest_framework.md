# API Permissions in Django REST Framework

> Source: https://www.geeksforgeeks.org/python/adding-permission-in-api-django-rest-framework/

Access control is essential in any API, granting unauthorized access to risky operations or restricted data can introduce major vulnerabilities. In DRF(Django REST Framework), permissions determine whether a request is allowed or denied, based on authentication and predefined access rules.
When a request arrives:
- Authentication runs first, identifying the user.
- Then permissions are checked; if any fail, the view code does not execute.
Common Built-in Permission Classes
DRF provides several built-in permission classes that cover typical access control scenarios.
| Permission Class | Description | 
|---|---|
| AllowAny | Grants unrestricted access, regardless of authentication. | 
| IsAuthenticated | Only authenticated users may access the view. | 
| IsAdminUser | Only users with is_staff=True may access. | 
| IsAuthenticatedOrReadOnly | Unauthenticated users get safe (read) access; authenticated users get full access. | 
| DjangoModelPermissions | Access determined by model-level add, change, delete permissions for logged-in users. | 
| DjangoModelPermissionsOrAnonReadOnly | Similar to above, but allows read-only access to anonymous users | 
| DjangoObjectPermissions | Provides per-object permission checks; used when individual model instances have custom permission rules | 
AllowAny
The AllowAny permission class grants unrestricted access to any user, whether authenticated or not. By default, DRF uses this permission if no other permission class is specified, meaning all incoming requests are allowed.
To make this explicit, add the following in settings.py:
REST_FRAMEWORK = {
    'DEFAULT_PERMISSION_CLASSES': [
        'rest_framework.permissions.AllowAny',
    ]
}
This permission can also be applied on a per-view basis, depending on whether the implementation uses class-based or function-based views.
Example: Class-Based View
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
from rest_framework.views import APIView
class ClassBasedView(APIView):
    permission_classes = [AllowAny]
    def get(self, request, format=None):
        content = {'status': 'request was permitted'}
        return Response(content)
Example: Function-Based View
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import AllowAny
from rest_framework.response import Response
@api_view(['GET'])
@permission_classes([AllowAny])
def function_view(request, format=None):
    content = {'status': 'request was permitted'}
    return Response(content)
This permission is typically used for public endpoints, such as open API documentation, health checks, or signup endpoints where access restrictions are not required.
IsAuthenticated
The IsAuthenticated permission class denies access to unauthenticated users, allowing API operations only for registered users. This ensures that sensitive endpoints are protected and accessible exclusively to authenticated users. The permission can be applied on a per-view basis.
For example, in a RESTful web service with RobotDetail and RobotList views:
from rest_framework.permissions import IsAuthenticated
from rest_framework import generics
from .models import Robot
from .serializers import RobotSerializer
class RobotDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-detail'
class RobotList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-list'
Testing the permission: Attempting to retrieve robots without credentials:
http :8000/robot/
Output: Access denied (unauthenticated requests are rejected).
Creating a new user via Django's interactive shell enables authenticated access. Using credentials:
http -a "sonu":"sn@pswrd" :8000/robot/
Output: Access granted, returning robot details.
Creating a new robot entry with authentication:
http -a "sonu":"sn@pswrd" POST :8000/robot/ name="IRB 1100" robot_category="Articulated Robots" currency="USD" price=25000 manufacturer="ABB" manufacturing_date="2020-05-10 00:00:00+00:00"
Output: Robot created successfully.
IsAdminUser
The IsAdminUser permission class grants access only to users with user.is_staff = True. This ensures that the API is accessible exclusively to trusted administrators.
Apply the permission to the RobotDetail and RobotList views.
from rest_framework.permissions import IsAdminUser
from rest_framework import generics
from .models import Robot
from .serializers import RobotSerializer
class RobotDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAdminUser]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-detail'
class RobotList(generics.ListCreateAPIView):
    permission_classes = [IsAdminUser]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-list'
Testing the permission: Using normal user credentials
http -a "sonu":"sn@pswrd" :8000/robot/
Output: Access is denied because the user is not an administrator.
Using superuser credentials:
http -a "admin":"admin@123" :8000/robot/
Output: Access granted, allowing full operations on the robot endpoints.
IsAuthenticatedOrReadOnly
The IsAuthenticatedOrReadOnly permission class allows unauthenticated users to perform safe (read-only) operations, while authenticated users can perform any operations. This is useful for APIs where anonymous users can view data, but write operations are restricted to logged-in users.
Apply the permission to the RobotDetail and RobotList views:
from rest_framework.permissions import IsAuthenticatedOrReadOnly
from rest_framework import generics
from .models import Robot
from .serializers import RobotSerializer
class RobotList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-list' 
class RobotDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticatedOrReadOnly]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-detail'
Testing the permission: Retrieve robot details without authentication
http :8000/robot/
Output: Successful, because read operations are allowed.
Attempt to create a new robot without authentication:
http POST :8000/robot/ name="IRB 120" robot_category="Articulated Robots" currency="USD" price=35000 manufacturer="ABB" manufacturing_date="2020-08-10 00:00:00+00:00"
Output: Access denied.
Create a new robot with valid user credentials:
http -a "sonu":"sn@pswrd" POST :8000/robot/ name="IRB 120" robot_category="Articulated Robots" currency="USD" price=35000 manufacturer="ABB" manufacturing_date="2020-08-10 00:00:00+00:00"
Output: Successful, allowing write operations.
DjangoModelPermissions
The DjangoModelPermissions class grants access only if the user is authenticated and has the relevant model-level permissions. The required permissions are:
- add permission: Required to make POST requests.
- change permission: Required to make PUT and PATCH requests.
- delete permission: Required to make DELETE requests.
By default, GET requests are allowed for authenticated users. This permission class integrates with Django’s standard django.contrib.auth model permissions. It should only be applied to views that have a .queryset property or implement a get_queryset() method.
Import the class:
from rest_framework.permissions import DjangoModelPermissions
Apply to views:
from rest_framework import generics
from .models import Robot
from .serializers import RobotSerializer
from rest_framework.permissions import DjangoModelPermissions
class RobotList(generics.ListCreateAPIView):
    permission_classes = [DjangoModelPermissions]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-list'
class RobotDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [DjangoModelPermissions]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-detail'
Testing model permissions: Attempt to create a robot with a user who does not have the add permission:
http -a "sonu":"sn@pswrd" POST :8000/robot/ name="IRB 140" robot_category="Articulated Robots" currency="USD" price=35000 manufacturer="ABB" manufacturing_date="2021-01-10 00:00:00+00:00"
Output: Access denied.
Grant the add permission via Django admin (select the user under Users and enable the add_robot permission).
Retry the same command:
http -a "sonu":"sn@pswrd" POST :8000/robot/ name="IRB 140" robot_category="Articulated Robots" currency="USD" price=35000 manufacturer="ABB" manufacturing_date="2021-01-10 00:00:00+00:00"
Output: Request succeeds, confirming that model-level permissions are enforced correctly.
DjangoModelPermissionsOrAnonReadOnly
The DjangoModelPermissionsOrAnonReadOnly permission class works like DjangoModelPermissions, but unauthenticated users are allowed read-only access to the API. This is useful for APIs that should provide public read access but restrict modifications to authorized users.
Import the class:
from rest_framework.permissions import DjangoModelPermissionsOrAnonReadOnly
Apply to views:
from rest_framework import generics
from .models import Robot
from .serializers import RobotSerializer
from rest_framework.permissions import DjangoModelPermissionsOrAnonReadOnly
class RobotList(generics.ListCreateAPIView):
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-list'
class RobotDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-detail'
Testing public read access: Retrieve robots without authentication:
http :8000/robot/
Output: Successfully returns the list of robots.
DjangoObjectPermissions
The DjangoObjectPermissions class allows per-object permissions on models, meaning permissions can be set for individual rows (model instances). Only authenticated users with the appropriate permissions can perform actions on specific objects.
Model-level requirements for HTTP methods:
- POST: requires add permission on the model
- PUT / PATCH: requires change permission on the model
- DELETE: requires delete permission on the model
Usage
To use object-level permissions, subclass DjangoObjectPermissions and implement the has_object_permission() method. This allows customization of permission checks for each object instance.
from rest_framework.permissions import DjangoObjectPermissions
class CustomObjectPermissions(DjangoObjectPermissions):
    def has_object_permission(self, request, view, obj):
        # Custom logic to check object-level permissions
        return super().has_object_permission(request, view, obj)
Integration with views: DjangoObjectPermissions can be combined with DjangoModelPermissions to provide both model-level and object-level access control.
from rest_framework import generics
from .models import Robot
from .serializers import RobotSerializer
from .permissions import CustomObjectPermissions
class RobotDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [CustomObjectPermissions]
    queryset = Robot.objects.all()
    serializer_class = RobotSerializer
    name = 'robot-detail'
