# How to add slug field inside Django Model

> Source: https://www.geeksforgeeks.org/python/add-the-slug-field-inside-django-model/

The slug field in Django models helps create clean and readable URLs for web pages. It generates URL-friendly text based on titles or similar fields.
- Makes URLs easier for users to read and understand.
- Improves SEO by creating meaningful and descriptive URL paths.
- Helps build consistent and structured links across the site.
- Useful for blog posts, products, and any content that uses text-based URLs.
Slug field in Django
Consider a project named 'blog' having an app named 'posts'. For a blog post titled “The Django book by GeeksforGeeks” with primary key id=2, the post may be referenced using:
www.geeksforgeeks.org/posts/2.
Or, can reference the title like:
www.geeksforgeeks.org/posts/The Django book by Geeksforgeeks.
But the problem is spaces are not valid in URLs, they need to be replaced by %20, which is ugly, making it the following:
www.geeksforgeeks.org/posts/The%20Django%20book%20by%20geeksforgeeks
But it is not solving meaningful URL. Another option can be:
www.geeksforgeeks.org/posts/the-django-book-by-geeksforgeeks
So, the slug is now the-django-book-by-geeksforgeeks. All letters are down cased and spaces are replaced by hyphens.
Adding Slug field in Django Models
The slug field, represented as models.SlugField in Django models, is used to store a URL-friendly version of a text-based field, such as a title. Its primary purpose is to create cleaner, more readable, and search engine-friendly URLs for content.
STATUS_CHOICES = (
    ('draft', 'Draft'),
    ('published', 'Published'),
)
class Post(models.Model):
    title = models.CharField(max_length=250)
    slug = models.SlugField(
        max_length=250,
        null=True,
        blank=True,   # slug kept optional; can be auto-generated later
    )
    text = models.TextField()
    published_at = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    status = models.CharField(
        max_length=10,
        choices=STATUS_CHOICES,
        default='draft'
    )
    class Meta:
        ordering = ('-published_at', )
    def __str__(self):
        return self.title  # returns title when printing the Post
Adding Slugify
A method is required to convert the title into a slug automatically, and this process should run whenever a new Post instance is created. To achieve this, signals are used. 
Add new file util.py in the same directory where settings.py file is saved. 
import string, random
from django.db.models.signals import pre_save
from django.dispatch import receiver
from django.utils.text import slugify
def random_string_generator(size=10, chars=string.ascii_lowercase + string.digits):
    return ''.join(random.choice(chars) for _ in range(size))
def unique_slug_generator(instance, new_slug=None):
    if new_slug is not None:
        slug = new_slug
    else:
        slug = slugify(instance.title)   # convert title to slug
    
    Klass = instance.__class__
    max_length = Klass._meta.get_field('slug').max_length
    slug = slug[:max_length]            # ensure slug length fits the field
    qs_exists = Klass.objects.filter(slug=slug).exists()  # check slug collision
    
    if qs_exists:
        new_slug = "{slug}-{randstr}".format(
            slug=slug[:max_length-5],
            randstr=random_string_generator(size=4)  # add random string to keep slug unique
        )
        return unique_slug_generator(instance, new_slug=new_slug)  # recursively generate unique slug
    
    return slug
Signals in Django
In many cases, when a model instance is modified, an action must be executed.
- Django provides an elegant mechanism for handling such situations through signals.
- Signals allow specific events to be associated with corresponding actions, enabling the definition of a function that is executed when the signal is triggered.
In models.py file of posts app where Post Model was defined, add this in the same file:
@receiver(pre_save, sender=Post)
def pre_save_receiver(sender, instance, *args, **kwargs):
   if not instance.slug:
       instance.slug = unique_slug_generator(instance)
The pre_save_receiver function should be placed separately outside the Post model.
Modify URL with Slug
To modify your urls.py file to use the slug field in Django model for generating URLs, create URL patterns that include the slug as a parameter:
from django.urls import path
from . import views
urlpatterns = [
    path('posts/<slug:slug>/', views.post_detail, name='post_detail'),
    # Other URL patterns
]
Modify Views
This 'detail' view function in Django takes a 'slug' parameter from the URL and searches for a post with a matching slug in a case-insensitive manner.
- If a post is found, it retrieves and renders the post's details using the 'details.html' template.
- If no matching post is found, it returns an "Post Not Found" response to inform users of the absence of the requested content.
In urls.py edit detail path with path('posts/<slug:slug>/', views.detail). In views.py edit the detail function with:
def detail(request, slug):
    # Filter posts based on the slug (case-insensitive)
    q = Post.objects.filter(slug__iexact=slug)
    if q.exists():
        # If a post with the given slug exists, retrieve the first matching post
        q = q.first()
    else:
        # If no post is found, return an "Post Not Found" response
        return HttpResponse('<h1>Post Not Found</h1>')
    # Create a context dictionary containing the retrieved post
    context = {'post': q}
    # Render the 'details.html' template with the context
    return render(request, 'posts/details.html', context)
The last step is to add the link in HTML file <a href="/posts/{{ a.slug }}" class="btn btn-primary">View</a>. Now ready to go to 127.0.0.1:8000/posts/title-you-have-added and it will show the page details.html.
