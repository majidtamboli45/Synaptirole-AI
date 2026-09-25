# Django Template Tags

> Source: https://www.geeksforgeeks.org/python/django-template-tags/

Django's template engine provides template tags that add logic and control flow to templates. Tags allow execution of operations such as conditional checks, loops, including external files, and extending base templates. Few things about template tags are that it:
- Enable adding logic (e.g., if, for, block, extends) directly in templates.
- Enclosed within {% %} delimiters.
- Can output content, control rendering, or include external resources.
- Often used alongside template variables ({{ }}) for dynamic rendering.
Syntax
{% tag_name [arguments] %}
Example: Tags are surrounded by {% and %} like this:
{% csrf_token %}
Most tags accept arguments, such as:
{% cycle 'odd' 'even' %}
Commonly Used Django Template Tags
1. Comment
Comment Ignores everything between {% comment %} and {% endcomment %}. Optionally add a note for documentation purposes.
{% comment "This is a note" %}
    This block will not be rendered
{% endcomment %}
2. Cycle
Cycles through a list of values with each loop iteration. Useful for alternating row classes.
<tr class="{% cycle 'row1' 'row2' %}">{{ item }}</tr>
{% endfor %}
The first iteration produces HTML that refers to class row1, the second to row2, the third to row1 again, and so on for each iteration of the loop.
3. Extends
Extends are used for template inheritance. Allows a template to inherit from a base template.
Example: Assume the following directory structure:
dir1/
    template.html
    base2.html
    my/
        base3.html
base1.html
In template.html, the following relative paths would be valid:
{% extends "./base2.html" %}
{% extends "../base1.html" %}
{% extends "./my/base3.html" %}
4. if, elif, else
Controls conditional logic within the template.
In the above, if athlete_list is not empty, the number of athletes will be displayed by the {{ athlete_list|length }} variable.
5. for loop
for loops iterate over each item in a list.
Example: display a list of athletes provided in athlete_list:
<ul>
{% for athlete in athlete_list %}
    <li>{{ athlete.name }}</li>
{% endfor %}
</ul>
6. for with empty
for with empty displays an alternate message if the list is empty.
<ul>
{% for athlete in athlete_list %}
    <li>{{ athlete.name }}</li>
{% empty %}
    <li>No athletes found.</li>
{% endfor %}
</ul>
7. Boolean Operators with if
"if" tag evaluates a variable, and if that variable is "true" (i.e. exists, is not empty, and is not a "false" boolean value) the contents of the block are output. One can use various boolean operators with If Template tag.
<ul> 
{% if score > 90 and passed %}
    Excellent!
{% endif %}
</ul> 
8. firstof
firstof displays the first argument variable that is not "false" (i.e. exists, is not empty, is not a "false" boolean value, and is not a zero numeric value). Outputs nothing if all the passed variables are "false". 
Example:
{% firstof var1 var2 var3 "Default Value" %}
This is equivalent to:
{% if var1 %}
    {{ var1 }}
{% elif var2 %}
    {{ var2 }}
{% elif var3 %}
    {{ var3 }}
{% else %}
    Default Value
{% endif %}
One can also use a literal string as a fallback value in case all passed variables are "false":
{% firstof var1 var2 var3 "fallback value" %}
9. include
include loads and renders another template within the current template.
{% include "foo/bar.html" %}
You can use relative paths like in extends.
10. lorem
lorem generates random "lorem ipsum" text, useful for placeholder content.
11. now
now displays the current date/time using the specified format.
It is currently {% now "D d M Y" %}
Will output something like: Tue 14 Oct 2025
12. url
url returns an absolute path reference (a URL without the domain name) matching a given view and optional parameters. This is a way to output links without violating the DRY principle by having to hard-code URLs in your templates.
{% url 'post-detail' post.id %}
