# HTML Description Lists

> Source: https://www.geeksforgeeks.org/html/html-description-lists

An HTML description list is used to represent term-definition or name–value pairs in a structured format. It provides semantic grouping of related data for better readability and accessibility.
- Organizes data in term-description pairs.
- Improves content clarity and semantic meaning.
- Enhances accessibility for screen readers.
- Allows flexible structure with multiple descriptions per term.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h2>HTML Description Lists</h2>
    <dl>
        <dt>HTML</dt>
        <dd>
            HyperText Markup Language
        </dd>
        <dt>CSS</dt>
        <dd>
            Cascading Style Sheets
        </dd>
        <dt>JavaScript</dt>
        <dd>
           Scripting language for Web pages
        </dd>
    </dl>
</body>
</html>
Syntax:
<dl>
<dt>Coffee</dt>
<dd>A hot drink made from roasted coffee beans.</dd>
<dt>Espresso</dt>
<dd>Strong coffee brewed with steam through ground beans.</dd>
</dl>
Nested Description List
A nested description list is when we add a description list inside another description list. This allows for organizing related terms and their definitions in a hierarchical structure.
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <h3>Technology Overview</h3>
    <dl>
        <dt>Hardware</dt>
        <dd>Physical devices</dd>
        <dd>
            <dl>
                <dt>CPUs</dt>
                <dd>Processors</dd>
                <dt>GPUs</dt>
                <dd>Graphics</dd>
            </dl>
        </dd>
        <dt>Software</dt>
        <dd>Programs/Apps</dd>
        <dd>
            <dl> 
                <dt>System</dt>
                <dd>OS</dd>
                <dt>Application</dt>
                <dd>Tools</dd>
            </dl>
        </dd>
    </dl>
</body>
</html>
Applications of HTML Description Lists
Description lists are ideal for presenting structured term-value data where clear association between labels and explanations is required.
- FAQs: Helps pair questions with their corresponding answers in a clean, readable format.
- Glossaries: Effectively displays technical terms alongside their definitions for quick reference.
- Product details: Organizes product attributes like features, pricing, and specifications in a structured way.
- Technical documentation: Clearly maps parameters, properties, or configurations with their descriptions.
- Metadata display: Useful for showing key-value information such as author, date, version, etc.
