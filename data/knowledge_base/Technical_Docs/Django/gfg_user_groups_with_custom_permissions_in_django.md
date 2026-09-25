# User Groups with Custom Permissions in Django

> Source: https://www.geeksforgeeks.org/python/python-user-groups-custom-permissions-django/

Managing user access and permissions is crucial to ensure users can only perform authorized actions. Django provides a flexible system for managing user permissions and groups, enabling role-based access control (RBAC) efficiently.
Understanding Permissions in Django
Django's built-in permissions system works at the model level. By default, each model in Django has three permissions:
- add: Permission to add a new record.
- change: Permission to change an existing record.
- delete: Permission to delete a record.
These permissions are created automatically when running makemigrations and migrate.
Defining Custom Permissions
Consider a project having an app named 'users'. Custom permissions can be defined in the model's Meta class.
In users/models.py:
from django.contrib.auth.models import AbstractUser
from django.utils import timezone
from django.db import models
class User(AbstractUser):
    first_name = models.CharField(_('First Name of User'),
                            blank = True, max_length = 20)
                            
    last_name = models.CharField(_('Last Name of User'),
                            blank = True, max_length = 20)
                            
    class Meta:
        
        permissions = (
            ("can_go_in_non_ac_bus", "To provide non-AC Bus facility"),
            ("can_go_in_ac_bus", "To provide AC-Bus facility"),
            ("can_stay_ac-room", "To provide staying at AC room"),
            ("can_stay_ac-room", "To provide staying at Non-AC room"),
            ("can_go_dehradoon", "Trip to Dehradoon"),
            ("can_go_mussoorie", "Trip to Mussoorie"),
            ("can_go_haridwaar", "Trip to Haridwaar"),
            ("can_go_rishikesh", "Trip to Rishikesh")
        )
Migrate the Database
Run the following command for migrations:
python manage.py makemigrations users
python manage.py migrate
Creating Groups and Assigning Permissions
Option A: Using Django Admin Panel
- Login to Django admin.
- Click on Groups.
- Create groups like level0, level1, level2.
- Assign relevant permissions to each group.
Programmatically Creating Groups and Assigning Permissions
Open Django shell:
python manage.py shell
from django.contrib.auth.models import Group, Permission
from django.contrib.contenttypes.models import ContentType
from users.models import User
level0, created = Group.objects.get_or_create(name='level0')
level1, created = Group.objects.get_or_create(name='level1')
level2, created = Group.objects.get_or_create(name='level2')
user_ct = ContentType.objects.get_for_model(User)
perm_haridwar, created = Permission.objects.get_or_create(
    codename='can_go_haridwar',
    name='Can go to Haridwar',
    content_type=user_ct
)
level0.permissions.add(perm_haridwar)
- Groups represent user levels (e.g., Starter, Golden, Diamond).
- Permissions are linked to the User model via ContentType.
- user.groups.add(group) grants the user all permissions assigned to the group.
Assigning Users to Groups
Users can be added to groups through the Admin Panel or programmatically:
from django.contrib.auth.models import Group
from users.models import User
user = User.objects.get(username='john')
group = Group.objects.get(name='level0')
user.groups.add(group)
- Fetch a user and a group.
- Use user.groups.add() to assign the user to the group.
- The user automatically inherits all permissions associated with that group.
Restricting Access Based on Permissions in Views
1. Function-Based Views (FBVs)
Use Django's user_passes_test decorator or a custom group-based decorator:
from django.contrib.auth.decorators import user_passes_test
def group_required(*group_names):
    def in_groups(u):
        if u.is_authenticated:
            if bool(u.groups.filter(name__in=group_names)) or u.is_superuser:
                return True
        return False
    return user_passes_test(in_groups)
# Usage
@group_required('level0')
def my_view(request):
    # Your view logic here
    ...
- user_passes_test runs the in_groups function to verify group membership.
- If the user is not authenticated or not in the allowed groups, access is denied..
- Ensures only authorized groups can access specific views.
2. For Class-Based Views
Use a mixin to add reusable functionality that enforces group membership for accessing the view:
from django.contrib.auth.mixins import AccessMixin
class GroupRequiredMixin(AccessMixin):
    group_required = []  # List of groups allowed to access the view
    def dispatch(self, request, *args, **kwargs):
        if not request.user.is_authenticated:
            return self.handle_no_permission()
        
        user_groups = request.user.groups.values_list('name', flat=True)
        if not any(group in user_groups for group in self.group_required):
            return self.handle_no_permission()
        
        return super().dispatch(request, *args, **kwargs)
Example usage:
from django.views import View
class DemoView(GroupRequiredMixin, View):
    group_required = ['admin', 'manager']
    
    def get(self, request, *args, **kwargs):
        # View logic
        ...
- GroupRequiredMixin extends AccessMixin to handle permission denials.
- dispatch checks if the user is authenticated and belongs to allowed groups..
- Access is denied if checks fail (typically via login redirect or 403 page).
- Requests from authorized users are processed normally.
