# HTML Charsets

> Source: https://www.geeksforgeeks.org/html/html-charsets

HTML charsets define how characters are encoded so that text and symbols display correctly across different devices and browsers.
- Character encoding determines how text is represented and interpreted in an HTML document.
- The <meta> tag with the charset attribute specifies the encoding used by the webpage.
- Setting a charset ensures proper rendering of special characters and symbols.
- UTF-8 is the most commonly used charset as it supports multiple languages and symbols.
Common Character Encodings
Common character encodings define how text and symbols are represented for consistent display across devices and browsers.
1. ASCII
The American Standard Code for Information Interchange (ANSII) created this character encoding. This character encoding is used in C/C++ programming.
It has 128 alphanumeric characters consisting of alphabets(A-Z) and (a-z) and some special symbols like + - * / ( ) @ etc.
2. ANSI (Windows-1252)
American National Standards Institute (ANSI) created character encoding supported 256 characters. It is used as the default character set in Microsoft Windows.
3. ISO-8859-1
It is used as the default character set of HTML4 and also supports 256 characters. The International Standards Organization (ISO) defines the standard character sets for different alphabets/languages. It contains numbers, upper and lowercase English letters, and some special characters.
4. UTF-8
UTF-8 and UTF-16 standards was developed by Unicode Consortium, because the ISO-8859 character-sets are limited, and not compatible a multilingual environment. It consists all the character and punctuation symbols.
Attribute
Web browser must know the character encoding standard used in the html page and this we do as given below.
Example:
- HTML 4
<meta http-equiv="Content-Type" content="text/html;charset=ISO-8859-1">
- HTML 5
<meta charset="UTF-8">
Note:
- The first values from 0 to 127 are considered as the "Standard" ASCII character set.
- Characters with values from 128 to 255 are the "Extended" Character set.
Significance of Character Encoding
Character encoding ensures that text is correctly displayed and interpreted across different devices, browsers, and platforms, allowing consistent communication of letters, symbols, and special characters.
- Consistency: Encoding defines how text, numbers, and symbols are interpreted, ensuring that content appears correctly regardless of the user's device or browser.
- Global Compatibility: Without proper encoding, characters in different languages or special symbols may display as unreadable or incorrect.
- Web Development: By specifying the charset, you avoid issues with rendering characters and improve your site’s accessibility across diverse languages
Character set for different Character Encoding Standard
Following list shows different character encoding standards with their characters and their assigned number codes.
Table 1 (ASCII Device Control Characters)
This table contains Characters which are designed to control hardware devices. These are also known as control characters.
| Numbers | Characters | Descriptions | 
|---|---|---|
| 00 | NUL | null character | 
| 01 | SOH | start of header | 
| 02 | STX | start of text | 
| 03 | ETX | end of text | 
| 04 | EOT | end of transmission | 
| 05 | ENQ | enquiry | 
| 06 | ACK | acknowledge | 
| 07 | BEL | bell(ring) | 
| 08 | BS | backspace | 
| 09 | HT | horizontal tab | 
| 10 | LF | line feed | 
| 11 | VT | vertical tab | 
| 12 | FF | form feed | 
| 13 | CR | carriage return | 
| 14 | SO | shift out | 
| 15 | SI | shift in | 
| 16 | DLE | data link escape | 
| 17 | DC1 | device contyrol 1 | 
| 18 | DC2 | device contyrol 2 | 
| 19 | DC3 | device contyrol 3 | 
| 20 | DC4 | device contyrol 4 | 
| 21 | NAK | negative acknowledge | 
| 22 | SYN | synchronize | 
| 23 | ETB | end transmission block | 
| 24 | CAN | cancel | 
| 25 | EM | end of medium | 
| 26 | SUB | substitute | 
| 27 | ESC | escape | 
| 28 | FS | file separator | 
| 29 | GS | group separator | 
| 30 | RS | record separator | 
| 31 | US | unit separator | 
| 127 | DEL | delete | 
Table 2: This table contains characters having the same numbers assigned in different character encoding.
| NUMBER | Characters | Description | 
|---|---|---|
| 32 |  | Space | 
| 33 | ! | Exclamation Mark | 
| 34 | " | Quotation Mark | 
| 35 | # | Hash Sign | 
| 36 | $ | Dollar Sign | 
| 37 | % | Percent Sign | 
| 38 | & | Ampersand Sign | 
| 39 | ' | Apostrophe Sign | 
| 40 | ( | Opening Paranthesis | 
| 41 | ) | Closing Parenthesis | 
| 42 | * | Asterisk Sign | 
| 43 | + | Plus Sign | 
| 44 | , | Comma | 
| 45 | - | Hyphen/minus Sign | 
| 46 | . | Full-stop | 
| 47 | / | Slash/Divide Sign | 
| 48 | 0 | Number Zero | 
| 49 | 1 | Number One | 
| 50 | 2 | Number Two | 
| 51 | 3 | Number Three | 
| 52 | 4 | Number Four | 
| 53 | 5 | Number Five | 
| 54 | 6 | Number Six | 
| 55 | 7 | Number Seven | 
| 56 | 8 | Number Eight | 
| 57 | 9 | Number Nine | 
| 58 | : | Colon | 
| 59 | ; | Semicolon | 
| 60 | < | Lessthan Sign | 
| 61 | = | Equalto Sign | 
| 62 | > | Greaterthan Sign | 
| 63 | ? | Question Mark | 
| 64 | @ | at Sign | 
| 65 | A | Letter A | 
| 66 | B | Letter B | 
| 67 | C | Letter C | 
| 68 | D | Letter D | 
| 69 | E | Letter E | 
| 70 | F | Letter F | 
| 71 | G | Letter G | 
| 72 | H | Letter H | 
| 73 | I | Letter I | 
| 74 | J | Letter J | 
| 75 | K | Letter K | 
| 76 | L | Letter L | 
| 77 | M | Letter M | 
| 78 | N | Letter N | 
| 79 | O | Letter O | 
| 80 | P | Letter P | 
| 81 | Q | Letter Q | 
| 82 | R | Letter R | 
| 83 | S | Letter S | 
| 84 | T | Letter T | 
| 85 | U | Letter U | 
| 86 | V | Letter V | 
| 87 | W | Letter W | 
| 88 | X | Letter X | 
| 89 | Y | Letter Y | 
| 90 | Z | Letter Z | 
| 91 | [ | Opening Square Bracket | 
| 92 | \ | Backslash | 
| 93 | ] | Closing Square Bracket | 
| 94 | ^ | Circumflex Accent | 
| 95 | _ | Low Line | 
| 96 | ` | Grave Accent | 
| 97 | a | Letter a | 
| 98 | b | Letter b | 
| 99 | c | Letter c | 
| 100 | d | Letter d | 
| 101 | e | Letter e | 
| 102 | f | Letter f | 
| 103 | g | Letter g | 
| 104 | h | Letter h | 
| 105 | i | Letter i | 
| 106 | j | Letter j | 
| 107 | k | Letter k | 
| 108 | l | Letter l | 
| 109 | m | Letter m | 
| 110 | n | Letter n | 
| 111 | o | Letter o | 
| 112 | p | Letter p | 
| 113 | q | Letter q | 
| 114 | r | Letter r | 
| 115 | s | Letter s | 
| 116 | t | Letter t | 
| 117 | u | Letter u | 
| 118 | v | Letter v | 
| 119 | w | Letter w | 
| 120 | x | Letter x | 
| 121 | y | Letter y | 
| 122 | z | Letter z | 
| 123 | { | Opening Curly Bracket | 
| 124 | \| | Vertical Line | 
| 125 | } | Closing Curly Bracket | 
| 126 | ~ | Tilde | 
| 127 | DEL | delete | 
Table 3: This table contains character having different character encoding.
| Numbers | Description | 
|---|---|
| 128 | € | 
| 129 | not used | 
| 130 | ‚ | 
| 131 | ƒ | 
| 132 | „ | 
| 133 | … | 
| 134 | † | 
| 135 | ‡ | 
| 136 | ˆ | 
| 137 | ‰ | 
| 138 | Š | 
| 139 | ‹ | 
| 140 | Œ | 
| 141 | Not Used | 
| 142 | Ž | 
| 143 | Not Used | 
| 144 | Not Used | 
| 145 | ‘ | 
| 146 | ’ | 
| 147 | “ | 
| 148 | ” | 
| 149 | • | 
| 150 | – | 
| 151 | — | 
| 152 | ˜ | 
| 153 | ™ | 
| 154 | š | 
| 155 | › | 
| 156 | œ | 
| 157 | Not Used | 
| 158 | ž | 
| 159 | Ÿ | 
| 160 | no-break Space | 
| 161 | ¡ | 
| 162 | ¢ | 
| 163 | £ | 
| 164 | ¤ | 
| 165 | ¥ | 
| 166 | ¦ | 
| 167 | § | 
| 168 | ¨ | 
| 169 | © | 
| 170 | ª | 
| 171 | « | 
| 172 | ¬ | 
| 173 | � | 
| 174 | ® | 
| 175 | ¯ | 
| 176 | ° | 
| 177 | ± | 
| 178 | ² | 
| 179 | ³ | 
| 180 | ´ | 
| 181 | µ | 
| 182 |  | 
| 183 | · | 
| 184 | ¸ | 
| 185 | ¹ | 
| 186 | º | 
| 187 | » | 
| 188 | ¼ | 
| 189 | ½ | 
| 190 | ¾ | 
| 191 | ¿ | 
| 192 | À | 
| 193 | Á | 
| 194 |  | 
| 195 | Ã | 
| 196 | Ä | 
| 197 | Å | 
| 198 | Æ | 
| 199 | Ç | 
| 200 | È | 
| 201 | É | 
| 202 | Ê | 
| 203 | Ë | 
| 204 | Ì | 
| 205 | Í | 
| 206 | Î | 
| 207 | Ï | 
| 208 | Ð | 
| 209 | Ñ | 
| 210 | Ò | 
| 211 | Ó | 
| 212 | Ô | 
| 213 | Õ | 
| 214 | Ö | 
| 215 | × | 
| 216 | Ø | 
| 217 | Ù | 
| 218 | Ú | 
| 219 | Û | 
| 220 | Ü | 
| 221 | Ý | 
| 222 | Þ | 
| 223 | ß | 
| 224 | à | 
| 225 | á | 
| 226 | â | 
| 227 | ã | 
| 228 | ä | 
| 229 | å | 
| 230 | æ | 
| 231 | ç | 
| 232 | è | 
| 233 | é | 
| 234 | ê | 
| 235 | ë | 
| 236 | ì | 
| 237 | í | 
| 238 | î | 
| 239 | ï | 
| 240 | ð | 
| 241 | ñ | 
| 242 | ò | 
| 243 | ó | 
| 244 | ô | 
| 245 | õ | 
| 246 | ö | 
| 247 | ÷ | 
| 248 | ø | 
| 249 | ù | 
| 250 | ú | 
| 251 | û | 
| 252 | ü | 
| 253 | ý | 
| 254 | þ | 
| 255 | ÿ |
