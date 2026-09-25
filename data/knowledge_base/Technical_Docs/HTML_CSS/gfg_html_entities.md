# HTML Entities

> Source: https://www.geeksforgeeks.org/html/html-entities

HTML Entities are special codes used to display reserved characters, symbols, or invisible spaces in a webpage that cannot be typed directly or have special meanings in HTML (like <, >, or &).
- Always start with & and end with ; (example: < for <).
- Help avoid errors or misinterpretation in HTML code.
- Commonly used for symbols, non-breaking spaces, and mathematical signs.
- Make web content more readable and properly formatted.
<!DOCTYPE html>
<html>
<head>
  <title></title>
</head>
<body>
  <h2>Using HTML Entities</h2>
  <p>Less than symbol: <</p>
  <p>Greater than symbol: ></p>
  <p>Ampersand symbol: &</p>
  <p>Copyright symbol: © 2025 MyWebsite</p>
  <p>Registered symbol: ® Trademark</p>
  <p>Non-breaking space example: Hello World</p>
</body>
</html>
Commonly Used HTML Entities
Some commonly used symbols with their Entity name and Entity numbers are listed below:
| Symbols | Description | Entity name | Entity Number | 
|---|---|---|---|
|  | non-breaking space |   |   | 
| < | less than | < | < | 
| ® | registered trademark | ® | ® | 
| © | copyright | © | © | 
| € | euro | € | € | 
| ¥ | yen | ¥ | ¥ | 
| £ | pound | £ | £ | 
| ¢ | cent | ¢ | ¢ | 
| " | double quotation mark | " | " | 
| & | ampersand | & | & | 
| > | greater than | > | > | 
| ∂ | PARTIAL DIFFERENTIAL | ∂ | ∂ | 
| ∃ | THERE EXISTS | ∃ | ∃ | 
| ∅ | EMPTY SETS | ∅ | ∅ | 
| ∇ | NABLA | ∇ | ∇ | 
| ∈ | ELEMENT OF | ∈ | ∈ | 
| ∉ | NOT AN ELEMENT OF | ∉ | ∉ | 
| + | PLUS SIGN | + | + | 
| ∏ | N-ARY PRODUCT | ∏ | ∏ | 
| ∑ | N-ARY SUMMATION | ∑ | ∑ | 
| Α | Alpha | Α | Α | 
| Β | Beta | Β | Β | 
| Γ | Gamma | Γ | Γ | 
| Δ | delta | Δ | Δ | 
| Ε | Epsilon | Ε | Ε | 
| Ζ | Zeta | Ζ | Ζ | 
| ♥ | BLACK HEART SUIT = valentine | ♥ | ♥ | 
| ♣ | BLACK CLUB SUIT = shamrock | ♣ | ♣ | 
| ♠ | BLACK SPADE SUIT | ♠ | ♠ | 
| ↓ | DOWNWARDS ARROW | ↓ | ↓ | 
| → | RIGHTWARDS ARROW | → | → | 
| ↑ | UPWARDS ARROW | ↑ | ↑ | 
| ← | LEFTWARDS ARROW | ← | ← | 
| ™ | TRADEMARK | ™ | ™ | 
| ♦ | BLACK DIAMOND SUIT | ♦ | ♦ | 
| ° | degree | ° | ° | 
| ∞ | infinity | ∞ | ∞ | 
| ‰ | per-mille | ‰ | ‰ | 
| ⋅ | dot operator | ⋅ | ⋅ | 
| ± | plus-minus | ± | ± | 
| † | hermitian | ⊹ | ⊹ | 
| - | minus sign | − | − | 
| ¬ | not sign | ¬ | ¬ | 
| % | percent sign | &percent; | % | 
| f | Function | ƒ | ƒ | 
| ∥ | parallel | ∥ | ∥ | 
<!DOCTYPE html>
<html lang="en">
<head>
    <title></title>
</head>
<body>
    <h2>Currency Symbols Using HTML Entities</h2>
    <ul>
        <li>Dollar: $</li>
        <li>Euro: €</li>
        <li>Pound: £</li>
        <li>Yen: ¥</li>
        <li>Rupee: ₹</li>
        <li>Won: ₩</li>
        <li>Franco: ₣</li>
        <li>Bitcoin: ₿</li>
    </ul>
</body>
</html>
Reserved Characters
These characters are either reserved for HTML or those which are not present in the basic keyboard & can't use them directly. Some of the reserved characters representations are given below:
| Reserved Character | Entity Name | 
|---|---|
| & | & | 
| < | < | 
| > | > | 
| “ | " | 
Other Characters
Some characters that aren’t available directly on our keyboard, therefore such an entity can be used to represent it by using their entity number.
These keywords are directly not available to type, we need to specify their entity number. Here #x before the numbers represents the hexadecimal representation.
| Character | Entities | 
|---|---|
| ≥ | ≥ | 
| © | © | 
| € | € | 
| ∃ | ∃ | 
<!DOCTYPE html>
<html>
<head>
    <title></title>
</head>
<body>
    <p>Showing euro €</p>
    <p>Showing cent ¢</p>
    <p>Showing Copyright ©</p>
    <p>Showing BLACK DIAMOND SUIT ♦</p>
    <p>Showing TRADEMARK ™</p>
</body>
</html>
Non-breaking Space
- It is used to provide space that will not break into a new line.
- This HTML entity is represented by   that will separate the 2 words & will stick together without breaking it into a new line.
- We can also use the non-breaking space for preventing the browsers from truncating spaces in HTML pages.
- The non-breaking hyphen (‑) is used to define a hyphen character (‑) that does not break into a new line.
Example
- 12:00 PM
- 256 km/h
If we use to write 10 spaces in our text, then the browser will remove 9 of them. In order to add real spaces in our text, we can use the character entity.
Combining Diacritical Marks
- A diacritical mark is a symbol added to a letter.
- Marks like the grave accent ( ̀) and acute accent ( ́) are examples of diacritical marks.
- They can be placed above, below, or inside a letter, or even between two letters.
- These marks are combined with letters to create new characters not found in the basic character set.
Here are some examples:
| Mark | Character | Construct (HTML Code) | Final Result | 
|---|---|---|---|
| ̀ | a | à | à | 
| ́ | a | á | á | 
| ̂ | a | â | â | 
| ̃ | a | ã | ã | 
| ̀ | O | Ò | Ò | 
| ́ | O | Ó | Ó | 
| ̂ | O | Ô | Ô | 
| ̃ | O | Õ | Õ | 
Best Practices for Using HTML Entities
- Use Named Entities When Possible: Named entities (< instead of <) are easier to remember and make your code more readable.
- Verify Entity Codes: Always check your entity codes to ensure they display correctly across all browsers and platforms.
- Use Entities for Readability and Compliance: Besides reserved characters, use entities to improve the readability of your code and to comply with HTML standards, especially when dealing with characters that may not be directly supported by your page’s charset.
