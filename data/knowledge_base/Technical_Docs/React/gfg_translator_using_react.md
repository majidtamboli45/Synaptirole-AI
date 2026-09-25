# Language Translator using React

> Source: https://www.geeksforgeeks.org/reactjs/language-translator-using-react/

Translator is a web application software tool that facilitate the translation of text from one language to another language using ReactJS. This application allows users to give input Text and select input and output language Format from the list of languages and uses Microsoft Translator API. Users can also reverse the source and target languages and clear the input text. The component provides a user-friendly interface for language translation, with dynamic updates and error handling. This application is implemented using ReactJS and has a simple and responsive UI.
Lets have a quick look at what the final application will look like:
Approach/Functionalities:
This project basically implements functional components and manages states. This application uses the Microsoft Translator API for language translation, making POST requests with the input text and language preferences. Upon receiving the response, the translated text is updated in the component's state, and loading spinners are displayed during the API call. The component's interface allows users to select languages, input text, translate, and reverse language selection. If API call is rejected then it shows an error message during translation.
Steps to create the application:
Step 1: Set up React project using the command
npm create vite@latest react-app
Step 2: Navigate to the project folder using
cd react-app
Step 3: Create a folder “components” and add three new files in it and name them as Translator.js, language.json and Translator.css.
Folder Structure:
The updated dependencies in package.json will look like this:
 "dependencies": {
"react": "^19.1.0",
"react-dom": "^19.1.0"
},
"devDependencies": {
"@vitejs/plugin-react": "^4.6.0",
"vite": "^7.0.4"
}
Example: Write the below code in App.js file in the src directory.
/* Translator.css */
body {
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
.container {
  display: flex;
  align-items: center;
  min-height: 100vh;
  flex-direction: column;
  box-sizing: border-box;
  padding-top: 50px;
}
.row1 {
  width: calc(100% - 10px);
  max-width: 650px;
}
select {
  width: calc(50% - 20px);
  line-height: 40px;
  font-size: 14px;
  border: 1px solid #dadce0;
  border-radius: 8px;
  height: 40px;
  padding-left: 18px;
  position: relative;
  color: #1a0dab;
  cursor: pointer;
  outline: none;
  user-select: none;
}
.reversesvg {
  width: 20px;
  color: rgba(0, 0, 0, 0.26);
  line-height: 40px;
  opacity: 0.5;
  vertical-align: middle;
  cursor: pointer;
  margin: 0px 10px;
}
option {
  color: #202124;
}
.row2 {
  display: flex;
  justify-content: space-between;
  align-items: center;
  width: calc(100% - 10px);
  max-width: 650px;
  margin-top: 10px;
  position: relative;
}
.inputText {
  width: calc(50% - 20px);
  position: relative;
}
.outputText {
  width: calc(50% - 20px);
  height: 169px;
  font-family: monospace;
  box-sizing: border-box;
  padding: 15px;
  font-size: 20px;
  border-radius: 8px;
  overflow: auto;
  background: #edeff0;
  text-align: left;
}
.row2 textarea {
  width: 100%;
  height: 150px;
  resize: none;
  box-sizing: border-box;
  padding: 0px 35px 10px 10px;
  margin-top: 15px;
  border: none;
  font-size: 20px;
  overflow: auto;
  color: #202124;
  outline: none;
}
.removeinput {
  cursor: pointer;
  width: 20px;
  position: absolute;
  opacity: 0.5;
  top: 5px;
  right: 3px;
}
.row3 {
  width: calc(100% - 10px);
  max-width: 650px;
  margin-top: 15px;
  margin-bottom: 20px;
}
.btn {
  width: 100%;
  position: relative;
  padding: 10px;
  outline: none;
  background-color: #6d9eed;
  color: #fff;
  border: 2px solid #6d9eed;
  border-radius: 4px;
  cursor: pointer;
  font-size: 16px;
  letter-spacing: 0.5px;
}
.btn i {
  display: none;
}
@media screen and (max-width: 500px) {
  .row2 {
    flex-direction: column;
  }
  .inputText {
    width: 100%;
  }
  .outputText {
    width: 100%;
    margin-top: 20px;
  }
}
::-webkit-scrollbar {
  width: 4px;
}
::-webkit-scrollbar-track {
  display: none;
}
::-webkit-scrollbar-thumb {
  background: rgb(173, 172, 172);
  border-radius: 4px;
}
// App.js
import './App.css';
import Translator from './components/Translator';
function App() {
  return (
    <div className="App">
      <Translator />
    </div>
  );
}
export default App;
// language.json
{
    "af": { "name": "Afrikaans" },
    "ak": { "name": "Akan" },
    "sq": { "name": "Albanian" },
    "am": { "name": "Amharic" },
    "ar": { "name": "Arabic" },
    "hy": { "name": "Armenian" },
    "as": { "name": "Assamese" },
    "ay": { "name": "Aymara" },
    "az": { "name": "Azerbaijani" },
    "bm": { "name": "Bambara" },
    "eu": { "name": "Basque" },
    "be": { "name": "Belarusian" },
    "bn": { "name": "Bengali" },
    "bs": { "name": "Bosnian" },
    "bg": { "name": "Bulgarian" },
    "my": { "name": "Burmese" },
    "ca": { "name": "Catalan; Valencian" },
    "ny": { "name": "Chichewa; Chewa; Nyanja" },
    "zh": { "name": "Chinese" },
    "co": { "name": "Corsican" },
    "hr": { "name": "Croatian" },
    "cs": { "name": "Czech" },
    "da": { "name": "Danish" },
    "dv": { "name": "Divehi; Dhivehi; Maldivian;" },
    "nl": { "name": "Dutch" },
    "en": { "name": "English" },
    "eo": { "name": "Esperanto" },
    "et": { "name": "Estonian" },
    "ee": { "name": "Ewe" },
    "fi": { "name": "Finnish" },
    "fr": { "name": "French" },
    "gl": { "name": "Galician" },
    "ka": { "name": "Georgian" },
    "de": { "name": "German" },
    "el": { "name": "Greek, Modern" },
    "gn": { "name": "Guaraní" },
    "gu": { "name": "Gujarati" },
    "ht": { "name": "Haitian; Haitian Creole" },
    "ha": { "name": "Hausa" },
    "he": { "name": "Hebrew (modern)" },
    "hi": { "name": "Hindi" },
    "hu": { "name": "Hungarian" },
    "id": { "name": "Indonesian" },
    "ga": { "name": "Irish" },
    "ig": { "name": "Igbo" },
    "is": { "name": "Icelandic" },
    "it": { "name": "Italian" },
    "ja": { "name": "Japanese" },
    "jv": { "name": "Javanese" },
    "kn": { "name": "Kannada" },
    "kk": { "name": "Kazakh" },
    "km": { "name": "Khmer" },
    "rw": { "name": "Kinyarwanda" },
    "ky": { "name": "Kirghiz, Kyrgyz" },
    "ko": { "name": "Korean" },
    "ku": { "name": "Kurdish" },
    "la": { "name": "Latin" },
    "lb": { "name": "Luxembourgish, Letzeburgesch" },
    "lg": { "name": "Luganda" },
    "ln": { "name": "Lingala" },
    "lo": { "name": "Lao" },
    "lt": { "name": "Lithuanian" },
    "lv": { "name": "Latvian" },
    "mk": { "name": "Macedonian" },
    "mg": { "name": "Malagasy" },
    "ms": { "name": "Malay" },
    "ml": { "name": "Malayalam" },
    "mt": { "name": "Maltese" },
    "mi": { "name": "Māori" },
    "mr": { "name": "Marathi (Marāṭhī)" },
    "mn": { "name": "Mongolian" },
    "ne": { "name": "Nepali" },
    "no": { "name": "Norwegian" },
    "om": { "name": "Oromo" },
    "or": { "name": "Oriya" },
    "pa": { "name": "Panjabi, Punjabi" },
    "fa": { "name": "Persian" },
    "pl": { "name": "Polish" },
    "ps": { "name": "Pashto, Pushto" },
    "pt": { "name": "Portuguese" },
    "qu": { "name": "Quechua" },
    "ro": { "name": "Romanian, Moldavian, Moldovan" },
    "ru": { "name": "Russian" },
    "sa": { "name": "Sanskrit (Saṁskṛta)" },
    "sd": { "name": "Sindhi" },
    "sm": { "name": "Samoan" },
    "sr": { "name": "Serbian" },
    "gd": { "name": "Scottish Gaelic; Gaelic" },
    "sn": { "name": "Shona" },
    "si": { "name": "Sinhala, Sinhalese" },
    "sk": { "name": "Slovak" },
    "sl": { "name": "Slovene" },
    "so": { "name": "Somali" },
    "st": { "name": "Southern Sotho" },
    "es": { "name": "Spanish; Castilian" },
    "su": { "name": "Sundanese" },
    "sw": { "name": "Swahili" },
    "sv": { "name": "Swedish" },
    "ta": { "name": "Tamil" },
    "te": { "name": "Telugu" },
    "tg": { "name": "Tajik" },
    "th": { "name": "Thai" },
    "ti": { "name": "Tigrinya" },
    "tk": { "name": "Turkmen" },
    "tl": { "name": "Tagalog" },
    "tr": { "name": "Turkish" },
    "ts": { "name": "Tsonga" },
    "tt": { "name": "Tatar" },
    "ug": { "name": "Uighur, Uyghur" },
    "uk": { "name": "Ukrainian" },
    "ur": { "name": "Urdu" },
    "uz": { "name": "Uzbek" },
    "vi": { "name": "Vietnamese" },
    "cy": { "name": "Welsh" },
    "fy": { "name": "Western Frisian" },
    "xh": { "name": "Xhosa" },
    "yi": { "name": "Yiddish" },
    "yo": { "name": "Yoruba" }
}
// Translator.js
import React, { useState } from 'react'
import './Translator.css'
import languageList from './language.json';
export default function Translator() {
    const [inputFormat, setInputFormat] = useState('en');
    const [outputFormat, setOutputFormat] = useState('hi');
    const [translatedText, setTranslatedText] = useState('Translation');
    const [inputText, setInputText] = useState('');
    const handleReverseLanguage = () => {
        const value = inputFormat;
        setInputFormat(outputFormat);
        setOutputFormat(value);
        setInputText('');
        setTranslatedText('Translation');
    }
    const handleRemoveInputText = () => {
        setInputText('');
        setTranslatedText('Translation');
    }
    const handleTranslate = async () => {
        if (!inputText || !inputFormat || !outputFormat) return;
        document.querySelector('.fa.fa-spinner.fa-spin').style.display = "block";
        document.querySelector('.translate').style.display = 'none';
        const url = 
`https://microsoft-translator-text.p.rapidapi.com/translate?to%5B0%5D=$%7BoutputFormat%7D&api-version=3.0&profanityAction=NoAction&textType=plain%60;
        const options = {
            method: 'POST',
            headers: {
                'content-type': 'application/json',
                'X-RapidAPI-Key': {"YOUR_API_KEY"},
                'X-RapidAPI-Host': 'microsoft-translator-text.p.rapidapi.com'
            },
            body: JSON.stringify([
                {
                    Text: inputText
                }
            ])
        };
        try {
            const response = await fetch(url, options);
            const result = await response.text();
            const responseObject = JSON.parse(result);
            const translation = responseObject[0].translations[0].text;
            setTranslatedText(translation);
        } catch (error) {
            console.log(error);
            alert("Please Try Again! Some Error Occurred at your side");
        }
        document.querySelector('.fa.fa-spinner.fa-spin').style.display = "none";
        document.querySelector('.translate').style.display = 'block';
    }
    return (
        <div className="container">
            <div className="row1">
                <select value={inputFormat} 
                        onChange={(e) => setInputFormat(e.target.value)}>
                    {Object.keys(languageList).map((key, index) => {
                        const language = languageList[key];
                        return (
                            <option key={index} value={key}>{language.name}</option>
                        );
                    })}
                </select>
                <svg className='reversesvg' 
                     onClick={handleReverseLanguage} 
                     focusable="false" 
                     xmlns="https://www.w3.org/2000/svg" 
                     viewBox="0 0 24 24">
                <path d=
"M6.99 11L3 15l3.99 4v-3H14v-2H6.99v-3zM21 9l-3.99-4v3H10v2h7.01v3L21 9z">
                </path>
                </svg>
                <select value={outputFormat} onChange={(e) => {
                    setOutputFormat(e.target.value);
                    setTranslatedText('Translation');
                }}>
                    {Object.keys(languageList).map((key, index) => {
                        const language = languageList[key];
                        return (
                            <option key={index + 118} value={key}>{language.name}</option>
                        );
                    })}
                </select>
            </div>
            <div className="row2">
                <div className="inputText">
                    <svg className='removeinput' 
                         style={{ display: (inputText.length) ? "block" : "none" }} 
                         onClick={handleRemoveInputText} 
                         focusable="false" 
                         xmlns="https://www.w3.org/2000/svg" 
                         viewBox="0 0 24 24">
                         <path d=
"M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z">
                        </path>
                    </svg>
                    <textarea type="text" 
                              value={inputText} 
                              placeholder='Enter Text' 
                              onChange={(e) => setInputText(e.target.value)} />
                </div>
                <div className="outputText">{translatedText}</div>
            </div>
            <div className="row3">
                <button className='btn' 
                        onClick={handleTranslate}>
                        <i className="fa fa-spinner fa-spin"></i>
                        <span className='translate'>Translate</span>
                </button>
            </div>
        </div>
    )
}
Steps to run the application:
- Type the following command in terminal.
npm run dev
- Type the following URL in the browser:
 http://localhost:5173/
Output:
