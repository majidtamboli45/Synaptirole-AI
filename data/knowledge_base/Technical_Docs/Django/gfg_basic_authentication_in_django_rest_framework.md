# Basic Authentication in Django REST Framework

> Source: https://www.geeksforgeeks.org/python/basic-authentication-django-rest-framework/

Authentication is a mechanism that provides access control based on the credentials associated with incoming requests. Django REST Framework (DRF) offers several authentication schemes. Basic Authentication verifies users using their username and password and is generally suitable for testing purposes.
When a request is authenticated using Basic Authentication:
- request.user contains a Django User instance.
- request.auth is None.
If authentication fails:
- request.user is an instance of AnonymousUser.
- request.auth is None.
Setting the authentication scheme globally
1. Global Configuration
To apply Basic Authentication across all views, set it as the default authentication class in settings.py.
REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': [
        'rest_framework.authentication.BasicAuthentication',
    ]
}
2. Per-View Configuration
Function-Based Views: For function-based views, use @authentication_classes and @permission_classes decorators
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
@api_view(['GET'])  # Marks this as a function-based API view that only accepts GET requests
@authentication_classes([BasicAuthentication])  # Applies Basic Authentication to this view
@permission_classes([IsAuthenticated])  # Allows access only to authenticated users
def function_based_view(request, format=None):
    # Response payload containing the current user and authentication details
    content = {
        'user': str(request.user),  # The authenticated user object
        'auth': str(request.auth),  # Authentication credentials used
    }
    return Response(content)  # Sends the response back to the client
Class-Based Views: For class-based views, set authentication and permission classes in APIView
from rest_framework.authentication import BasicAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.views import APIView
from rest_framework.response import Response
class ClassBasedView(APIView):
    # Apply Basic Authentication to this view
    authentication_classes = [BasicAuthentication]
    # Allow access only to authenticated users
    permission_classes = [IsAuthenticated]
    def get(self, request, format=None):
        # Prepare response data for the authenticated user
        content = {
            'user': str(request.user),
            'auth': str(request.auth),
        }
        return Response(content)
The IsAuthenticated permission allows access only to authenticated users. By default, DRF uses AllowAny, which permits unrestricted access.
Applying Basic Authentication to a RESTful API
To enforce Basic Authentication globally for your API, add the following in settings.py.
REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework.authentication.BasicAuthentication',
    )
}
Then, set IsAuthenticated permission for API views:
from rest_framework import generics
from rest_framework.permissions import IsAuthenticated
from .models import Robot
from .serializers import RobotSerializer
class RobotDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]       # Authentication required
    queryset = Robot.objects.all()               # Base queryset
    serializer_class = RobotSerializer           # Serializer used
    name = 'robot-detail'
class RobotList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]      
    queryset = Robot.objects.all()          
    serializer_class = RobotSerializer      
    name = 'robot-list'
Testing the API
Retrieving Data Without Credentials
Using HTTP:
http :8000/robot/
Output: The server returns 401 Unauthorized because authentication credentials were not provided.
Retrieving Data With Credentials
Create a superuser and provide credentials.
http -a "admin":"admin@123" :8000/robot/
Output: List of robots retrieved successfully
Creating a New Entry
http -a "admin":"admin@123" POST :8000/robot/ name="SR-3iA" robot_category="SCARA Robots" currency="USD" price=25000 manufacturer="Fanuc" manufacturing_date="2020-05-10 00:00:00+00:00"
Output: Robot entry created successfully
Production Considerations
- Always use HTTPS when using Basic Authentication to prevent credentials from being exposed.
- For deployments using Apache with mod_wsgi, set WSGIPassAuthorization On to ensure headers are passed correctly.
