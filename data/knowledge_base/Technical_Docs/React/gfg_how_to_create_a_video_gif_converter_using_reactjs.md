# How to create a video to GIF converter using ReactJS ?

> Source: https://www.geeksforgeeks.org/reactjs/how-to-create-a-video-to-gif-converter-using-reactjs/

When you think about a GIF image, a video is a must convert into a .gif format to an image. For this project, we are using FFMPEG library utility written in the C programming language. With the support of web Assembly, it can run in browsers easily without any need for a server, also here we are using the ReactJS library to make it simple and more understandable.
You can know about web Assembly from the below Links:
Also, you can learn about FFMPEG which is a free and open-source software project consisting of a large suite of libraries and programs for handling video, audio, and other multimedia files and streams you can check from the https://ffmpeg.org/ link.
FFMPEG: FFmpeg.wasm is a WebAssembly port of FFmpeg, which you can install via npm and use within Node or the browser just like any other JavaScript module. Create a simple client-side transcoder that streams data into a video element.
Before going to make this project you have a hands-on experience on ReactJS because we are using react hook that is useState. So, ok with that concept go further and create your directory for the project.
- Create our React app with snowpack by following the command:
npm create vite@latest gifconverter --template react
- After installation above command then installs another package called FFMPEG by the following command:
npm install @ffmpeg/ffmpeg  @ffmpeg/core
- For our styling purpose, you install the styled component by the following command. It is most likely CSS, but as we play with JavaScript it creates the user-defined variable, in that variable, we can write CSS properties, it is also used for making components without making a new JSX file.
npm i styled-components
Project Structure: All installation for the project is complete, and we are now going for developing our aiming project. Now you can see the project directory looks like the following and you're all dependencies are installed successfully than good to go.
Now you open your command prompt and type the following command to start your server by running the below command. Then your browser opens in port number 8080 where your app is running, If your browser looks like this then you are in the right place.
cd gifconverter
npm run dev
Now open your project folder in your code editor and make a folder in src directory called components and under this folder make various JSX components file by following
src/components:
- Button.jsx
- Dbutton.jsx
- Header.jsx
- Inputfile.jsx
- Inputvideo.jsx
- Resultimg.jsx
After creating the above JSX components, Let's go for add the code for our project:
Filename- Button.jsx: This component is a convert button, when you click on it automatically changes the .mp4 file to .gif file.
import React from "react";
import styled from "styled-components";
const Btn = styled.button`
  background-color: #000;
  color: #fff;
  border-radius: 18px;
  border: 1px solid #000;
  outline: none;
  font-weight: 700;
  cursor: pointer;
  font-size: 1.2em;
  padding: 10px;
  min-width: 20%;
  transition: all 0.2s ease-in-out;
  :hover {
    background-color: #3f3f3f;
    color: #efefef;
  }
`;
export const Button = ({ convertToGif }) => {
  return <Btn onClick={convertToGif}>Convert</Btn>;
};
Filename- Dbutton.jsx: This component is a download button where you can download the .gif image after the convert from the .mp4 file.
import React from "react";
import styled from "styled-components";
const Btn = styled.a`
  display: flex;
  left: 0;
  right: 0;
  margin: 20px auto;
  margin-top: -20px;
  background-color: #000;
  color: #fff;
  border-radius: 35.5px;
  border: 1px solid #000;
  outline: none;
  font-weight: 700;
  cursor: pointer;
  font-size: 1.2em;
  padding: 10px;
  padding-left: 50px;
  max-width: 10%;
  text-decoration: none;
  transition: all 0.2s ease-in-out;
  :hover {
    background-color: #3f3f3f;
    color: #efefef;
  }
`;
export const Dbutton = ({ gif, download }) => {
  return (
    <Btn href={gif} download onClick={(e) => download(e)}>
      Download
    </Btn>
  );
};
Filename- Header.jsx:
import React from "react";
import styled from "styled-components";
const H1 = styled.h1`
  margin: 0;
  padding: 12px;
  background-color: #000;
  color: #fff;
  font-family: sans-serif;
  font-size: 3em;
`;
export const Header = () => {
  return (
    <div>
      <H1>video to gif converter</H1>
    </div>
  );
};
Filename- Inputfile.jsx: This component used for getting user input of video file (.mp4 file)
import React from "react";
import styled from "styled-components";
const Section = styled.div`
  display: flex;
  left: 0;
  right: 0;
  margin: 50px auto;
  width: 30%;
  border: 2px dashed #000;
  border-radius: 18px;
  padding: 10px;
`;
export const Inputfile = ({ setVideo }) => {
  return (
    <Section>
      <input type="file" onChange={(e) => setVideo(e.target.files?.item(0))} />
    </Section>
  );
};
Filename- Inputvideo.jsx:
import React from "react";
import styled from "styled-components";
const Video = styled.video`
  width: 40%;
  margin: 20px;
  border: 1px dashed #045ca3;
`;
export const Inputvideo = ({ video }) => {
  return <Video controls width="250" src={URL.createObjectURL(video)} />;
};
Filename- Resultimage.jsx: This component is showing the .gif image which converter from a video file.
import React from "react";
import styled from "styled-components";
const Img = styled.img`
  width: 50%;
  height: 100%;
  border: 4px solid #000;
  margin: 40px auto;
`;
export const Resultimg = ({ gif }) => {
  return <Img src={gif} />;
};
From the above individual components you can see there are many useState props are passed in the arrow function using curly bracket, don't worry that state you can find in the App.jsx. I prefer to consider all hooks in the App.jsx.
So, we are adding all code for our required components that are used for our project. After the adding of all the code, then we have to import the components file to the App.jsx
Filename- App.jsx: Here is our App.jsx code. Let's import our components into this file. In the below App.jsx , we are importing a library as discussed previously that is FFmpeg as createFFmpeg , fetchFile.
We are in the last phase of our project to finalize is our project working well or not ?:) Then after refreshing, you can see what your GIF converter looks like in the following image.
import React, { useState, useEffect } from "react";
import "./App.css";
import { createFFmpeg, fetchFile } from "@ffmpeg/ffmpeg";
import { Button } from "./components/Button";
import { Inputfile } from "./components/Inputfile";
import { Header } from "./components/Header";
import { Resultimg } from "./components/Resultimage";
import { Inputvideo } from "./components/Inputvideo";
import { Dbutton } from "./components/Dbutton";
// Create the FFmpeg instance and load it
const ffmpeg = createFFmpeg({ log: true });
function App() {
  const [ready, setReady] = useState(false);
  const [video, setVideo] = useState();
  const [gif, setGif] = useState();
  const load = async () => {
    await ffmpeg.load();
    setReady(true);
  };
  useEffect(() => {
    load();
  }, []);
  const convertToGif = async () => {
    // Write the .mp4 to the FFmpeg file system
    ffmpeg.FS("writeFile", "video1.mp4", await fetchFile(video));
    
    // Run the FFmpeg command-line tool, converting 
    // the .mp4 into .gif file
    await ffmpeg.run(
      "-i",
      "video1.mp4",
      "-t",
      "2.5",
      "-ss",
      "2.0",
      "-f",
      "gif",
      "out.gif"
    );
    // Read the .gif file back from the FFmpeg file system
    const data = ffmpeg.FS("readFile", "out.gif");
    const url = URL.createObjectURL(
      new Blob([data.buffer], { type: "image/gif" })
    );
    setGif(url);
  };
  const download = (e) => {
    console.log(e.target.href);
    fetch(e.target.href, {
      method: "GET",
      headers: {},
    })
      .then((response) => {
        response.arrayBuffer().then(function (buffer) {
          const url = window.URL.createObjectURL(new Blob([buffer]));
          const link = document.createElement("a");
          link.href = url;
          link.setAttribute("download", "image.gif");
          document.body.appendChild(link);
          link.click();
        });
      })
      .catch((err) => {
        console.log(err);
      });
  };
  return ready ? (
    <div className="App">
      <Header />
      {video && <Inputvideo video={video} />}
      <Inputfile setVideo={setVideo} />
      <Button convertToGif={convertToGif} />
      <h1>Result</h1>
      {gif && <Resultimg gif={gif} />}
      {gif && <Dbutton gif={gif} download={download} />}
    </div>
  ) : (
    
<p>Loading...</p>
  );
}
export default App;
Output: If your browser gives this output, Then your project is running fine. Then choose a video file to convert into the image, After converting click on the convert button you can see it gives us a .gif format animated image.
