# Build a QnA ChatBot using Gemini Pro

> Source: https://www.geeksforgeeks.org/machine-learning/build-a-qna-chatbot-using-gemini-pro/

A chatbot is a computer program designed to simulate human conversation, usually through text or voice interactions. They use natural language processing (NLP) and machine learning algorithms to understand and respond to user queries, providing a personalized experience.
Gemini is an AI model made by the Google Deepmind team. It is a very capable model which is a multimodal type. That means we can generate text, analyze images, audio, video, etc. We can make text generators, chatbots, image analyzers, etc.
In this tutorial, we will build a QnA ChatBot using Gemini Pro API and Flask in Python. The API is available for free with which we will create a web application.
Create An API for Gemini Pro
Below are the steps to create an API for Gemini Pro:
Get API Key
Navigate to Google AI Studio and click on Get API key.
Create a API Key
Create API Key in new project button, and copy the generated API key. Copy the API Key and use in generating the chatbot.
Creating a QnA Chatbot Using Flask
Below are the step by step procedure to build a QnA Chatbot using Gemini Pro and Flask in Python:
Installation
Before starting, we will have to install the following things to progress further:
File Structure
Project Structure should be as follows:
Create a Python File
In this Python code, a Flask web application is initialized with an instance named app. A route decorator directs the root URL to render the index.html template. When executed, the Flask application runs in debug mode, facilitating development with real-time error feedback.
app.py
from flask import Flask, render_template
app = Flask(__name__)
@app.route('/')
def index():
    return render_template('index.html')
if __name__ == '__main__':
    app.run(debug=True)
Create a UI in HTML
Inside the templates folder, create "index.html" file and start writing this code. In this HTML code, a chatbot interface is structured with a title, message display area, and input field. External libraries, Tailwind CSS for styling and Showdown for markdown conversion, are imported. Additionally, Google's Generative AI is integrated, and a JavaScript module (main.js) is included to manage chatbot interactions.
index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,
                                   initial-scale=1.0" />
    <title>Chatbot using Gemini | GeeksforGeeks</title>
    <script src="https://cdn.tailwindcss.com/3.4.16"></script>
    <script 
       src="https://cdnjs.cloudflare.com/ajax/libs/showdown/2.1.0/showdown.min.js"></script>
    <style type="text/tailwindcss">
      @layer base {
        ul {
          list-style-type: circle;
        }
        ol {
          list-style-type: decimal;
        }
      }
    </style>
  </head>
  <body class="flex flex-col justify-between h-screen">
    <div>
      <p class="text-xl font-bold text-center text-green-500">
        GeeksforGeeks Chatbot - Gemini
      </p>
      <div class="overflow-y-auto" style="max-height: 80vh">
        <div id="messageHolder" class="flex flex-col m-4"></div>
      </div>
    </div>
    <div class="flex flex-row m-4">
      <input
        type="text"
        class="flex-1 border rounded-md m-2 border-green-600 
               p-2 outline-none ring-2 ring-green-600 
               border-transparent"
        placeholder="Chat..."
        name="chat"
        id="chat"
      />
      <button id="btn" class="m-2 bg-blue-500 p-2 
                              rounded-md text-white">
        Send
      </button>
    </div>
    <script type="importmap">
      {
        "imports": {
          "@google/generative-ai": "https://cdn.jsdelivr.net/npm/@google/generative-ai/+esm"
        }
      }
    </script>
    <script type="module" src="{{ url_for('static', 
                               filename='main.js') }}"></script>
  </body>
</html>
Output
Write JavaScript File
Inside the static folder, create a "main.js" file and start writing this code. In this JavaScript code, the GoogleGenerativeAI module is initialized with an API key to establish a chat instance with the "gemini-pro" model. The chatGemini function manages user interactions, sending messages for processing and displaying the chatbot's responses. Utility functions render messages on the webpage, and event listeners capture user inputs for chat interactions.
- chatGemini(): Here we interact with the API and send the message and store the result in variable HTML after converting the markdown text to HTML using showdownjs.
- addMessage(): Here we add a div container with the message content each time a message is added from user as well as gemini pro bot.
import { GoogleGenerativeAI } from "@google/generative-ai";
const conv = new showdown.Converter();
const genAI = new GoogleGenerativeAI("AIzaSyCg3KDDSpMZGQnzlFWHAXhr4fBjkc_3uIE");
const gen_model = genAI.getGenerativeModel({ model: "gemini-pro" });
const chat = gen_model.startChat({
    generationConfig: {
        maxOutputTokens: 1000,
    },
});
const chatGemini = async (message) => {
    addMessage(message, "end");
    let res = await chat.sendMessage(message);
    res = await res.response;
    console.log(res);
    let html = conv.makeHtml(res.text());
    addMessage(html, "start");
}
const addMessage = (msg, direction) => {
    const messageHolder = document.getElementById("messageHolder");
    const message = document.createElement("div");
    const colour = direction !== "start" ? "blue" : "green";
    message.innerHTML = `
     <div class="flex flex-col items-${direction}">
            <div class="bg-${colour}-500 px-4 py-2 rounded-md text-white w-fit 
            max-w-4xl mb-1">${msg}</div>
          </div>
    `
    messageHolder.appendChild(message);
}
const messageInput = document.getElementById("chat");
const sendBtn = document.getElementById("btn");
sendBtn.addEventListener("click", function () {
    const message = messageInput.value;
    chatGemini(message);
    messageInput.value = "";
});
In Depth Explaination
To start a chat session, we first need to import the Google GenerativeAI module
import { GoogleGenerativeAI } from "@google/generative-ai";
Then, we need to create a model for chat sessions called gemini-pro.
const genAI = new GoogleGenerativeAI("API_KEY_HERE");
const gen_model = genAI.getGenerativeModel({ model: "gemini-pro" });
After creating the model, we need to start a chat session using the startChat() method and pass parameters accordingly.
const chat = gen_model.startChat({
generationConfig: {
maxOutputTokens: 1000,
},
});
To send a message and receive response, we use sendMessage and text methods.
let res = await chat.sendMessage(message);
res = await res.response;
let text= res.text();
The text returned is in markdown format and we will convert it into HTML for our purpose.
Run the Program
To run this Flask application, just write the following command in your terminal:
python app.py
Access the application in your web browser at http://127.0.0.1:5000
