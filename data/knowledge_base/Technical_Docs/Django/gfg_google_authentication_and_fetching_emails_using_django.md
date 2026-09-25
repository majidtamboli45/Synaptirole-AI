# Google Authentication and Fetching Emails using Django

> Source: https://www.geeksforgeeks.org/python/python-django-google-authentication-and-fetching-mails-from-scratch/

Google OAuth2 is a secure authorization protocol that enables applications to access user data without requiring login credentials. Instead of asking for a username and password, OAuth2 allows users to log in via Google and grants the app permission to access specific services (such as Gmail) on their behalf.
Let's build a Django app from scratch that uses Google OAuth2 to authenticate users and access their Gmail inbox. We’ll use official Google libraries to handle the OAuth flow and interact with the Gmail API.
Step 1: Create and Configure a Django Project
Consider a project named 'gfg_auth_project' having an app named 'gfg_auth_app'.
Install the required packages:
pip install django google-auth google-auth-oauthlib google-api-python-client
Step 2: Get Google OAuth Credentials
OAuth credentials enable the Django app to securely communicate with Google’s servers. They contain the app’s identity and permissions. A credentials.json file, which includes the client ID, client secret, and redirect URIs, is required for the OAuth 2.0 flow.
Follow these steps to get the credentials file:
- Go to Google Cloud Console
- Create a new project (or select an existing one)
- Go to Enabled api & services and Enable the Gmail API
- Navigate to APIs & Services- Credentials
- Click Create Credentials- OAuth client ID
- Set Application type: Web application and Authorized redirect URI to: "http://localhost:8000/google/callback/"
- Download the credentials.json file and place it in your Django project's root directory.
Step 3: Modify manage.py to Allow Insecure OAuth
For development, enable OAuth over HTTP by setting the environment variable "OAUTHLIB_INSECURE_TRANSPORT" in "manage.py":
"""Django's command-line utility for administrative tasks."""
import os
import sys
def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'gfg_auth_project.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'  # Allow HTTP for OAuth (development only)    
    execute_from_command_line(sys.argv)
if __name__ == '__main__':
    main()
Step 4: Define Views to Handle Google OAuth and Gmail Fetching
Define views for login, callback, and email fetching to handle Google authentication and retrieve emails.
In gfg_auth_app/views.py
from django.shortcuts import render, redirect
import os
import json
from django.urls import reverse
from google_auth_oauthlib.flow import InstalledAppFlow
from googleapiclient.discovery import build
from django.shortcuts import redirect
from django.http import HttpResponse
from django.conf import settings
from google.auth.transport.requests import Request
from google.oauth2.credentials import Credentials
from google_auth_oauthlib.flow import Flow
# Google OAuth2 client ID and secret
CLIENT_SECRETS_FILE = os.path.join(settings.BASE_DIR, 'credentials.json')
SCOPES = ['https://www.googleapis.com/auth/gmail.readonly']
REDIRECT_URI = 'http://localhost:8000/google/callback/'
def home(request):
    return HttpResponse("Welcome! <a href='/google/login/'>Login with Google</a>")
    
def google_login(request):
    flow = Flow.from_client_secrets_file(
        CLIENT_SECRETS_FILE, 
        scopes=SCOPES,
        redirect_uri=REDIRECT_URI
    )
    authorization_url, state = flow.authorization_url(access_type='offline', prompt='consent')
    
    # Store the state in the session
    request.session['state'] = state
    return redirect(authorization_url)
    
def google_callback(request):
    flow = Flow.from_client_secrets_file(
        CLIENT_SECRETS_FILE, 
        scopes=SCOPES, 
        redirect_uri=REDIRECT_URI,
        state=request.session.get('state')
    )
    
    flow.fetch_token(authorization_response=request.build_absolute_uri())
    credentials = flow.credentials
    with open('token.json', 'w') as token:
        token.write(credentials.to_json())
    service = build('gmail', 'v1', credentials=credentials)
    result = service.users().messages().list(userId='me', maxResults=5).execute()
    messages = result.get('messages', [])
    
    email_data = []
    for msg in messages:
        msg_detail = service.users().messages().get(userId='me', id=msg['id']).execute()
        headers = msg_detail['payload'].get('headers', [])
        
        subject = next((h['value'] for h in headers if h['name'] == 'Subject'), 'No Subject')
        sender = next((h['value'] for h in headers if h['name'] == 'From'), 'Unknown')
        snippet = msg_detail.get('snippet', '')
        email_data.append({
            'subject': subject,
            'sender': sender,
            'snippet': snippet,
        })
    return render(request, 'emails.html', {'emails': email_data})
def fetch_emails(request):
    creds = None
    if os.path.exists('token.json'):
        creds = Credentials.from_authorized_user_file('token.json', SCOPES)
    if not creds or not creds.valid:
        return HttpResponse("No valid credentials. Please log in first.")
    service = build('gmail', 'v1', credentials=creds)
    try:
        results = service.users().messages().list(userId='me', maxResults=5).execute()
        messages = results.get('messages', [])
        email_subjects = []
        if not messages:
            email_subjects.append('No messages found.')
        else:
            for message in messages:
                msg = service.users().messages().get(userId='me', id=message['id']).execute()
                snippet = msg.get('snippet', '(No snippet)')
                email_subjects.append(snippet)
        return HttpResponse('<br><br>'.join(email_subjects))
    except Exception as e:
        return HttpResponse(f"An error occurred: {str(e)}")
In the above views.py:
- home: Displays a link for users to log in with Google.
- google_login: Starts the OAuth flow, generates an authorization URL and state, stores the state in session, and redirects to Google login.
- google_callback: Handles the redirect from Google, exchanges the code for credentials, builds the Gmail API service, fetches the 5 most recent emails, extracts subject, sender, and snippet, and renders them in emails.html.
- fetch_emails: Uses saved credentials from token.json to fetch the 5 most recent email snippets and displays them. Validates credentials and handles errors if present.
Step 5: Create Template to Show Emails
Template displays the subject, sender, and snippet of each fetched email. If the templates folder does not exist in the "gfg_auth_app" folder, create it. Inside the templates folder, create an "emails.html" file:
<!DOCTYPE html>
<html>
<head>
    <title>Your Gmail Inbox</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
        }
        .email {
            border: 1px solid #ccc;
            padding: 12px;
            margin-bottom: 15px;
            border-radius: 6px;
        }
        .subject {
            font-weight: bold;
            color: #2c3e50;
        }
        .sender {
            color: #555;
        }
    </style>
</head>
<body>
    <h1>Fetched Emails</h1>
    {% if emails %}
        {% for email in emails %}
            <div class="email">
                <div class="subject">{{ email.subject }}</div>
                <div class="sender">From: {{ email.sender }}</div>
                <p>{{ email.snippet }}</p>
            </div>
        {% endfor %}
    {% else %}
        <p>No emails found.</p>
    {% endif %}
</body>
</html>
Step 6: Define URL Patterns
Define URL patterns that map specific URL paths to the corresponding views created earlier. This ensures Django can route incoming requests correctly. Create the URL configuration in the app and include it in the project's root URL configuration.
In gfg_auth_app/urls.py:
from django.urls import path
from . import views
urlpatterns = [
    path('', views.home, name='home'),
    path('google/login/', views.google_login, name='google_login'),
    path('google/callback/', views.google_callback, name='google_callback'),
    path('google/emails/', views.fetch_emails, name='fetch_emails'),
]
In gfg_auth_project/urls.py:
from django.contrib import admin
from django.urls import path, include
urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('gfg_auth_app.urls')),
]
When the application URLs are accessed, Django automatically invokes the corresponding view functions.
Step 7: Run the Project
Start the development server:
python manage.py runserver
Visit: http://127.0.0.1:8000
Output
Clicking the "Login with Google" hyperlink redirects to the login page:
Already logged-in accounts can be selected, or another account can be used. After selecting the account, click the Allow button to grant access. The page then redirects to display the five most recent emails from the selected account:
