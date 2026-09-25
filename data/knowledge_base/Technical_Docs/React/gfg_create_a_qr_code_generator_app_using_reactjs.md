# Create a QR code generator app using ReactJS

> Source: https://www.geeksforgeeks.org/reactjs/create-a-qr-code-generator-app-using-reactjs/

In this article, we will create a simple QR Code generator app. A QR code is a two-dimensional barcode that can be read by smartphones. It allows the encoding of more than 4,000 characters in a compact format. QR codes can be used for various purposes, such as displaying text to users, opening URLs, storing contact information in an address book, or sending messages.
Prerequisites:
Approach:
Our app consists of two sections. In the first section, we will collect user inputs such as the text to encode, the size of the QR code, and the background color of the QR code, and store these inputs in state variables. Subsequently, we will construct the necessary API string to fetch the QR code image. In the second section, we will display the generated QR code.
Creating a React application:
Step 1: Create a react application by typing the following command in the terminal.
npm create vite@latest qrcode-gen --template react
Step 2: Now, go to the project folder i.e qrcode.gen by running the following command.
cd qrcode-gen
Project Structure:.
Example: Here App.js is the only default component of our app that contains all the logic. We will be using a free opensource (no auth requires) API called ‘create-qr-code’ to fetch the required QR code image. We will also have a button to download the QR code image.
Now write down the following code in the App.js file.
 import { useEffect, useState } from 'react';
import './App.css';
 
function App() {
  const [temp, setTemp] = useState("");
  const [word, setWord] = useState("");
  const [size, setSize] = useState(400);
  const [bgColor, setBgColor] = useState("ffffff");
  const [qrCode, setQrCode] = useState("");
 
  // Update QR Code URL when user changes input
  useEffect(() => {
    if (word) { // only generate when word is not empty
      setQrCode(
        https://api.qrserver.com/v1/create-qr-code/?data=${encodeURIComponent(
          word
        )}&size=${size}x${size}&bgcolor=${bgColor}
      );
    }
  }, [word, size, bgColor]);
 
  // Update the input word when user clicks generate button
  function handleClick() {
    setWord(temp);
  }
 
  return (
    <div className="App">
      <h1>QR Code Generator</h1>
      <div className="input-box">
        <div className="gen">
          <input
            type="text"
            onChange={(e) => setTemp(e.target.value)}
            placeholder="Enter text to encode"
          />
          <button className="button" onClick={handleClick}>
            Generate
          </button>
        </div>
        <div className="extra">
          <h5>Background Color:</h5>
          <input
            type="color"
            onChange={(e) => setBgColor(e.target.value.substring(1))}
          />
          <h5>Dimension:</h5>
          <input
            type="range"
            min="200"
            max="600"
            value={size}
            onChange={(e) => setSize(e.target.value)}
          />
        </div>
      </div>
 
      <div className="output-box">
        {qrCode && <img src={qrCode} alt="Generated QR Code" />}
        {qrCode && (
          <a href={qrCode} download="QRCode">
            <button type="button">Download</button>
          </a>
        )}
      </div>
    </div>
  );
}
 
export default App;
Now, let's edit the file named App.css to design our app.
/* Reset */
 {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}
 
body {
  background: #f2f6ff;
  color: #222;
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
}
 
.App {
  background: #ffffff;
  padding: 2rem;
  border-radius: 1.5rem;
  box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
  max-width: 480px;
  width: 100%;
  text-align: center;
}
 
h1 {
  font-size: 1.8rem;
  margin-bottom: 1.5rem;
  color: #333;
}
 
/ Input Section /
.input-box {
  margin-bottom: 1.5rem;
}
 
.gen {
  display: flex;
  gap: 0.5rem;
  margin-bottom: 1rem;
}
 
.gen input {
  flex: 1;
  padding: 0.6rem 0.8rem;
  border: 1px solid #ccc;
  border-radius: 0.5rem;
  outline: none;
  font-size: 1rem;
}
 
.button {
  background: #4f46e5;
  color: white;
  padding: 0.6rem 1rem;
  border: none;
  border-radius: 0.5rem;
  cursor: pointer;
  transition: background 0.2s ease-in-out;
}
 
.button:hover {
  background: #4338ca;
}
 
/ Extra Options /
.extra {
  text-align: left;
  margin-top: 1rem;
}
 
.extra h5 {
  margin: 0.5rem 0 0.3rem;
  font-size: 0.9rem;
  font-weight: 600;
}
 
.extra input[type="color"] {
  width: 60px;
  height: 35px;
  border: none;
  cursor: pointer;
}
 
.extra input[type="range"] {
  width: 100%;
}
 
/ Output Section */
.output-box {
  margin-top: 2rem;
}
 
.output-box img {
  border: 5px solid #eee;
  border-radius: 1rem;
  margin-bottom: 1rem;
  max-width: 100%;
}
 
.output-box button {
  background: #16a34a;
  color: white;
  padding: 0.6rem 1.2rem;
  border: none;
  border-radius: 0.5rem;
  cursor: pointer;
  transition: background 0.2s ease-in-out;
}
 
.output-box button:hover {
  background: #15803d;
}
Step to Run Application: Run the application using the following command from the root directory of the project:
npm run dev
Output: Now open your browser and go to http://localhost:5173/, you will see the following output:
