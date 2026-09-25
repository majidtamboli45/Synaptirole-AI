# Django Template Filters

> Source: https://www.geeksforgeeks.org/python/django-template-filters/

Django Template Engine provides filters to transform the values of variables and tag arguments. Unlike template tags, which control logic or structure, filters are specifically used to modify or format variable values.
Syntax
{{ variable_name | filter_name }}
Filters can be "chained", meaning the output of one filter can be applied to the next. {{ text | escape | linebreaks }} is a common idiom for escaping text contents, then converting line breaks to <p> tags.
Example:
{{ value | length }}
If value is ['a', 'b', 'c', 'd'], output will be 4.
Template Filters in Django
Django Template Filters transform the values of variables and tag arguments. Some most common template filters are listed below with example:
1. add
It is used to add an argument to the value.
Example:
{{ value | add:"2" }}
If value is 4, then the output will be 6. This filter is used to increment a variable in django Templates.
2. capfirst
It is used to capitalize the first character of the value. If the first character is not a letter, this filter has no effect.
Example:
{{ value | capfirst }}
If value is "rahul", the output will be "Rahul".
3. date
It is used to format a date according to the given format.
Example:
{{ value | date:"D d M Y" }}
If value is a datetime object (e.g., the result of datetime.datetime.now()), the output will be the string 'Thu 06 Feb 2020'.
4. default
It is used to give a default value to a variable. If variable evaluates to False, it will use the default argument given else the variable value itself.
Example:
{{ value | default:"nothing" }}
If value is "" (the empty string), the output will be nothing.
5. escape
The escape filter converts special HTML characters into safe representations to prevent rendering as HTML.
< is converted to <
> is converted to >
' (single quote) is converted to '
" (double quote) is converted to "
& is converted to &
Example:
{{ title | escape }}
6. length
It is used to return the length of the value. This works for both strings and lists.
Example:
{{ value | length }}
If value is ['a', 'b', 'c', 'd'] or "abcd", the output will be 4.
7. lower
It is used to converts a string into all lowercase.
Example:
{{ value | lower }}
If value is My Name is Rahul, the output will be my name is rahul.
8. upper
It is used to convert a string into all uppercase.
Example:
{{ value | upper }}
If value is "Rahul Kumar", the output will be "RAHUL KUMAR".
9. title
It is used to convert a string into titlecase by making words start with an uppercase character and the remaining characters lowercase. This filter makes no effort to keep “trivial words” in lowercase.
Example:
{{ value | title }}
If value is "my FIRST post", the output will be "My First Post".
10. join
It is used to join a list with a string, like Python’s str.join(list).
Example:
{{ value | join:" // " }}
If value is the list ['a', 'b', 'c'], the output will be the string "a // b // c".
11. addslashes
It is used to add slashes before quotes. Useful for escaping strings in CSV.
Example:
{{ value | addslashes }}
If value is "I'm Rahul", the output will be "I\'m Rahul".
12. center
It is used to center the value in a field of a given width.
Example:
"{{ value | center:"15" }}"
If value is "Rahul", the output will be "     Rahul     ". The text "Rahul" is centered within a 15-character-wide field.
Note: Total length is 15, including spaces on both sides.
13. cut
It is used to remove all values of arg from the given string.
Example:
{{ value | cut:" " }}
If value is "String with spaces", the output will be "Stringwithspaces".
14. dictsort
It takes a list of dictionaries and returns that list sorted by the key given in the argument.
Example:
{{ value | dictsort:"name" }}
If value is:
[
    {'name': 'zed', 'age': 19},
    {'name': 'amy', 'age': 22},
    {'name': 'joe', 'age': 31},
]
then the output would be:
[
    {'name': 'amy', 'age': 22},
    {'name': 'joe', 'age': 31},
    {'name': 'zed', 'age': 19},
] 
15. divisibleby
It returns True if the value is divisible by the argument.
Example:
{{ value | divisibleby:"3" }}
If value is 21, the output would be True.
16. filesizeformat
It is used to format the value like a ‘human-readable’ file size (i.e. '13 KB', '4.1 MB', '102 bytes', etc.).
Example:
{{ value | filesizeformat }}
If value is 123456789, the output would be 117.7 MB.
17. first
It is used to return the first item in a list.
Example:
{{ value | first }}
If value is the list ['a', 'b', 'c'], the output will be 'a'.
18. last
It is used to return the last item in a list.
Example:
{{ value | last }}
If value is the list ['a', 'b', 'c', 'd'], the output will be the string "d".
19. linenumbers
It is used to display text with line numbers.
Example:
{{ value | linenumbers }}
If value is:
one
two
three
the output will be HTML-formatted content with line numbers, not simple numbered lines.
1. one
2. two
3. three
20. make_list
It is used to return the value turned into a list. For a string, it’s a list of characters. For an integer, the argument is cast to a string before creating a list.
Example:
{{ value | make_list }}
If value is the string "Rahul", the output would be the list ['R', 'a', 'h', 'u', 'l']. If value is 123, the output will be the list ['1', '2', '3'].
21. random
It is used to return a random item from the given list.
Example:
{{ value | random }}
If value is the list ['a', 'b', 'c', 'd'], the output could be "b".
22. slice
It is used to return a slice of the list.
Example:
{{ some_list | slice:":2" }}
If some_list is ['a', 'b', 'c'], the output will be ['a', 'b'].
23. slugify
It is used to convert to ASCII. It converts spaces to hyphens and removes characters that aren’t alphanumerics, underscores, or hyphens. Converts to lowercase. Also strips leading and trailing whitespace.
Example:
{{ value | slugify }}
If value is "rahul is a slug", the output will be "rahul-is-a-slug".
24. time
It is used to format a time according to the given format.
Example:
{{ value | time:"H:i" }}
If value is equivalent to datetime.datetime.now(), the output will be the string "01:23".
25. timesince
It is used to format a date as the time since that date (e.g., “4 days, 6 hours”).
Example:
{{ blog_date | timesince:comment_date }}
if blog_date is a date instance representing midnight on 1 June 2006, and comment_date is a date instance for 08:00 on 1 June 2006, then the following would return “8 hours”.
26. unordered_list
It is used to recursively take a self-nested list and returns an HTML unordered list – WITHOUT opening and closing <ul> tags.
Example:
{{ var | unordered_list }}
if var contains ['States', ['Kansas', ['Lawrence', 'Topeka'], 'Illinois']], then {{ var|unordered_list }} would return:
<li>States
<ul>
        <li>Kansas
        <ul>
                <li>Lawrence</li>
                <li>Topeka</li>
        </ul>
        </li>
        <li>Illinois</li>
</ul>
</li>
27. wordcount
It is used to return the number of words.
Example:
{{ value | wordcount }}
If value is "Rahul is a slug", the output will be 4.
