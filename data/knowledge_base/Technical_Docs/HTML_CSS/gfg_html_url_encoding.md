# HTML URL Encoding

> Source: https://www.geeksforgeeks.org/html/html-url-encoding

A URL (Uniform Resource Locator) is the address of a website used by browsers to retrieve content, and URL encoding converts unsafe or special characters into a browser-safe format using % followed by two hexadecimal ASCII values.
- Only letters (A–Z, a–z), digits (0–9), and a few special characters are allowed directly; others are encoded.
- Spaces are encoded as %20 or +, and symbols like $ become %24.
- Encoded values represent the character’s ASCII code to ensure correct transmission over the web.
Syntax:
A web address follows these syntax rules:
scheme://subdomain.domain:port/path/filename
- Scheme: Specifies the protocol used for communication, such as https:// for secure communication or http:// for unsecured communication.
- Subdomain: An optional part (like www, blog, etc.) that helps identify a specific section of the website within the domain.
- Domain: Identifies the website’s primary address, such as example.com, representing its unique location on the Internet.
- Port: Optional and specifies a particular endpoint for communication. Common values are 80 for HTTP and 443 for HTTPS.
- Path: Specifies the directory or location on the server where the resource is stored.
- Filename: Refers to the specific file or resource within the given path.
Reserved Characters
Reserved characters in URLs, like /, ?, #, and :, have special purposes (e.g., / separates path segments) and must be encoded (e.g., %2F) when used as regular data to avoid misinterpretation.
| Character | Encoded Form | 
|---|---|
| ! | %21 | 
| * | %2A | 
| ' | %27 | 
| ( | %28 | 
| ) | %29 | 
| ; | %3B | 
| : | %3A | 
| @ | %40 | 
| & | %26 | 
| = | %3D | 
| + | %2B | 
| $ | %24 | 
| , | %2C | 
| / | %2F | 
| ? | %3F | 
| # | %23 | 
| [ | %5B | 
| ] | %5D | 
Some characters need to be encoded while some don't need to be. Here is the classification shows the group of characters that need to be encoded.
- Safe Characters: Alphanumeric i.e. 0-9, a-z, and A-Z, special characters $, -, _, ., +, !, *, ', (, ), are reserved characters used for their reserved purposes. These characters have no need to be encoded.
- ASCII Control characters: It includes characters ranging from 00-1F in hex (0-31 decimal) and 7F (127 decimal). These characters needs to be encoded.
- Non-ASCII Control characters: It includes 80-FF in hex (128-255 decimal). These characters needs to be encoded.
- Reserved characters: These characters are used for a special purpose and they require encoding.
- Unsafe characters: This character can be misunderstood within URLs for various reasons. So it requires encoding. The characters < and > are unsafe because they are used as the delimiters around URLs in free text, the quote mark (" ") is unsafe as it is used to delimit URLs in some systems.
Unsafe characters
Unsafe characters in URLs, such as spaces, <, >, and ", can break URL syntax or cause errors and must be encoded using % followed by their ASCII hexadecimal values.
| Character | Encoded Form | 
|---|---|
| space | %20 | 
| " | %22 | 
| < | %3C | 
| > | %3E | 
| # | %23 | 
| % | %25 | 
| { | %7B | 
| } | %7D | 
| \| | %7C | 
| \ | %5C | 
| ^ | %5E | 
| ~ | %7E | 
| [ | %5B | 
| ] | %5D | 
URL Encoded Characters
URL encoded characters replace unsafe or reserved characters with a % followed by two hexadecimal digits representing the character’s ASCII code, ensuring safe transmission in URLs.
| CHARACTER | ENCODED FORM | 
|---|---|
| backspace | %08 | 
| tab | %09 | 
| linefeed | %0A | 
| c return | %0D | 
| space | %20 | 
| ! | %21 | 
| " | %22 | 
| # | %23 | 
| $ | %24 | 
| % | %25 | 
| & | %26 | 
| ' | %27 | 
| ( | %28 | 
| ) | %29 | 
| * | %2A | 
| + | %2B | 
| , | %2C | 
| - | %2D | 
| . | %2E | 
| / | %2F | 
| 0 | %30 | 
| 1 | %31 | 
| 2 | %32 | 
| 3 | %33 | 
| 4 | %34 | 
| 5 | %35 | 
| 6 | %36 | 
| 7 | %37 | 
| 8 | %38 | 
| 9 | %39 | 
| : | %3A | 
| ; | %3B | 
| < | %3C | 
| = | %3D | 
| > | %3E | 
| ? | %3F | 
| @ | %40 | 
| A | %41 | 
| B | %42 | 
| C | %43 | 
| D | %44 | 
| E | %45 | 
| F | %46 | 
| G | %47 | 
| H | %48 | 
| I | %49 | 
| J | %4A | 
| K | %4B | 
| L | %4C | 
| M | %4D | 
| N | %4E | 
| O | %4F | 
| P | %50 | 
| Q | %51 | 
| R | %52 | 
| S | %53 | 
| T | %54 | 
| U | %55 | 
| V | %56 | 
| W | %57 | 
| X | %58 | 
| Y | %59 | 
| Z | %5A | 
| [ | %5B | 
| \ | %5C | 
| ] | %5D | 
| ^ | %5E | 
| _ | %5F | 
| ` | %60 | 
| a | %61 | 
| b | %62 | 
| c | %63 | 
| d | %64 | 
| e | %65 | 
| f | %66 | 
| g | %67 | 
| h | %68 | 
| i | %69 | 
| j | %6A | 
| k | %6B | 
| l | %6C | 
| m | %6D | 
| n | %6E | 
| o | %6F | 
| p | %70 | 
| q | %71 | 
| r | %72 | 
| s | %73 | 
| t | %74 | 
| u | %75 | 
| v | %76 | 
| w | %77 | 
| x | %78 | 
| y | %79 | 
| z | %7A | 
| { | %7B | 
| \| | %7C | 
| } | %7D | 
| ~ | %7E | 
|  | %7F | 
| ` | %E2%82%AC | 
|  | %81 | 
| ‚ | %E2%80%9A | 
| ƒ | %C6%92 | 
| „ | %E2%80%9E | 
| … | %E2%80%A6 | 
| † | %E2%80%A0 | 
| ‡ | %E2%80%A1 | 
| ˆ | %CB%86 | 
| ‰ | %E2%80%B0 | 
| Š | %C5%A0 | 
| ‹ | %E2%80%B9 | 
| Œ | %C5%92 | 
|  | %C5%8D | 
| Ž | %C5%BD | 
|  | %8F | 
|  | %C2%90 | 
| ‘ | %E2%80%98 | 
| ’ | %E2%80%99 | 
| “ | %E2%80%9C | 
| ” | %E2%80%9D | 
| • | %E2%80%A2 | 
| – | %E2%80%93 | 
| — | %E2%80%94 | 
| ˜ | %CB%9C | 
| ™ | %E2%84 | 
| š | %C5%A1 | 
| › | %E2%80 | 
| œ | %C5%93 | 
|  | %9D | 
| ž | %C5%BE | 
| Ÿ | %C5%B8 | 
|  | %C2%A0 | 
| ¡ | %C2%A1 | 
| ¢ | %C2%A2 | 
| £ | %C2%A3 | 
| ¤ | %C2%A4 | 
| ¥ | %C2%A5 | 
| ¦ | %C2%A6 | 
| § | %C2%A7 | 
| ¨ | %C2%A8 | 
| © | %C2%A9 | 
| ª | %C2%AA | 
| « | %C2%AB | 
| ¬ | %C2%AC | 
|  | %C2%AD | 
| ® | %C2%AE | 
| ¯ | %C2%AF | 
| ° | %C2%B0 | 
| ± | %C2%B1 | 
| ² | %C2%B2 | 
| ³ | %C2%B3 | 
| ´ | %C2%B4 | 
| µ | %C2%B5 | 
|  | %C2%B6 | 
| · | %C2%B7 | 
| ¸ | %C2%B8 | 
| ¹ | %C2%B9 | 
| º | %C2%BA | 
| » | %C2%BB | 
| ¼ | %C2%BC | 
| ½ | %C2%BD | 
| ¾ | %C2%BE | 
| ¿ | %C2%BF | 
| À | %C3%80 | 
| Á | %C3%81 | 
|  | %C3%82 | 
| Ã | %C3%83 | 
| Ä | %C3%84 | 
| Å | %C3%85 | 
| Æ | %C3%86 | 
| Ç | %C3%87 | 
| È | %C3%88 | 
| É | %C3%89 | 
| Ê | %C3%8A | 
| Ë | %C3%8B | 
| Ì | %C3%8C | 
| Í | %C3%8D | 
| Î | %C3%8E | 
| Ï | %C3%8F | 
| Ð | %C3%90 | 
| Ñ | %C3%91 | 
| Ò | %C3%92 | 
| Ó | %C3%93 | 
| Ô | %C3%94 | 
| Õ | %C3%95 | 
| Ö | %C3%96 | 
| × | %C3%97 | 
| Ø | %C3%98 | 
| Ù | %C3%99 | 
| Ú | %C3%9A | 
| Û | %C3%9B | 
| Ü | %C3%9C | 
| Ý | %C3%9D | 
| Þ | %C3%9E | 
| ß | %C3%9F | 
| à | %C3%A0 | 
| á | %C3%A1 | 
| â | %C3%A2 | 
| ã | %C3%A3 | 
| ä | %C3%A4 | 
| å | %C3%A5 | 
| æ | %C3%A6 | 
| ç | %C3%A7 | 
| è | %C3%A8 | 
| é | %C3%A9 | 
| ê | %C3%AA | 
| ë | %C3%AB | 
| ì | %C3%AC | 
| í | %C3%AD | 
| î | %C3%AE | 
| ï | %C3%AF | 
| ð | %C3%B0 | 
| ñ | %C3%B1 | 
| ò | %C3%B2 | 
| ó | %C3%B3 | 
| ô | %C3%B4 | 
| õ | %C3%B5 | 
| ö | %C3%B6 | 
| ÷ | %C3%B7 | 
| ø | %C3%B8 | 
| ù | %C3%B9 | 
| ú | %C3%BA | 
| û | %C3%BB | 
| ü | %C3%BC | 
| ý | %C3%BD | 
| þ | %C3%BE | 
| ÿ | %C3%BF |
