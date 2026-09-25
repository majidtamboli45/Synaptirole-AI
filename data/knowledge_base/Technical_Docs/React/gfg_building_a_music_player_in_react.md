# Building a Music Player in React

> Source: https://www.geeksforgeeks.org/reactjs/building-a-music-player-in-react/

The "Music Player" project is a web application built using React that offers users an interface to play, pause, and manage their music collection. It has a responsive design,song making it effortless for users to enjoy their songs. It has a separate data file using which the users can add their songs to the list and can listen to their personalized songs playlist.
Let's have a quick look at what the final application will look like:
Approach and Functionalities of Music Player
The Music Player project incorporates the following functionalities and approaches:
- User-friendly Interface: The project showcases an interface, with controls, for playing, pausing, adjusting volume, and tracking progress.
- Music Library Management: Users can effortlessly manage their music library by adding or removing songs and selecting tracks to play.
- Audio Controls: The application provides options to play, pause, and control volume levels.
- Track Progress Display: Users can easily track the progress of the playing song.
The design of the project is responsive. Functions effectively, on both desktop computers and mobile devices.
Steps to Create Music Player in React
Step 1: Create a new React JS project using the following command
npm create vite@latest music-player
Step 2: Change to the project directory
cd music-player
Step 3: Install some npm packages required for this project using the following command:
npm install --save @fortawesome/react-fontawesome
npm install --save @fortawesome/free-solid-svg-icons
npm install sass
Project Structure:
The updated dependencies in package.json will look like this:
 "dependencies": {
"@fortawesome/free-solid-svg-icons": "^6.7.2",
"@fortawesome/react-fontawesome": "^0.2.2",
"react": "^19.1.0",
"react-dom": "^19.1.0",
"sass": "^1.89.2"
}
Example: Write the following code in respective files
// FileName: App.js
import { useRef, useState } from "react";
import Player from "./components/PlayerSong";
import Song from "./components/Song";
import "./styles/app.scss";
// Importing DATA
import data from "./data";
import Library from "./components/Library";
import Nav from "./components/Navb";
function App() {
  const [songs, setSongs] = useState(data());
  const [currentSong, setCurrentSong] = useState(songs[0]);
  const [isPlaying, setIsPlaying] = useState(false);
  const [libraryStatus, setLibraryStatus] = useState(false);
  const audioRef = useRef(null);
  const [songInfo, setSongInfo] = useState({
    currentTime: 0,
    duration: 0,
    animationPercentage: 0,
  });
  const timeUpdateHandler = (e) => {
    const current = e.target.currentTime;
    const duration = e.target.duration;
    //calculating percentage
    const roundedCurrent = Math.round(current);
    const roundedDuration = Math.round(duration);
    const animation = Math.round((roundedCurrent / roundedDuration) * 100);
    console.log();
    setSongInfo({
      currentTime: current,
      duration,
      animationPercentage: animation,
    });
  };
  const songEndHandler = async () => {
    let currentIndex = songs.findIndex((song) => song.id === currentSong.id);
    await setCurrentSong(songs[(currentIndex + 1) % songs.length]);
    if (isPlaying) audioRef.current.play();
  };
  return (
    <div>
      <Nav libraryStatus={libraryStatus} setLibraryStatus={setLibraryStatus} />
      <Song currentSong={currentSong} />
      <Player
        id={songs.id}
        songs={songs}
        songInfo={songInfo}
        setSongInfo={setSongInfo}
        audioRef={audioRef}
        isPlaying={isPlaying}
        setIsPlaying={setIsPlaying}
        currentSong={currentSong}
        setCurrentSong={setCurrentSong}
        setSongs={setSongs}
      />
      <Library
        libraryStatus={libraryStatus}
        setLibraryStatus={setLibraryStatus}
        setSongs={setSongs}
        isPlaying={isPlaying}
        audioRef={audioRef}
        songs={songs}
        setCurrentSong={setCurrentSong}
      />
      <audio
        onLoadedMetadata={timeUpdateHandler}
        onTimeUpdate={timeUpdateHandler}
        src={currentSong.audio}
        ref={audioRef}
        onEnded={songEndHandler}
      ></audio>
    </div>
  );
}
export default App;
// FileName: data.js
import { v4 as uuidv4 } from "uuid";
function chillHop() {
  return [
    {
      name: "Sunrise Serenade",
      cover:
"https://media.geeksforgeeks.org/wp-content/uploads/20210224040124/JSBinCollaborativeJavaScriptDebugging6.png",
      artist: " Harmony Harp",
      audio:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004185212/Jawan-Prevue-Theme.mp3",
      color: ["#205950", "#2ab3bf"],
      id: uuidv4(),
      active: true,
    },
    {
      name: "Urban Groove",
      cover:
        "https://media.geeksforgeeks.org/wp-content/uploads/20231004210806/DemotivationalPosterfull936506.jpg",
      artist: "Beatmaster B",
      audio:
        "https://media.geeksforgeeks.org/wp-content/uploads/20231004184006/SoundHelix-Song-10.mp3",
      color: ["#EF8EA9", "#ab417f"],
      id: uuidv4(),
      active: false,
    },
    {
      name: "Mystic Echo",
      cover:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004210619/3408428b23c516b1687c748cb7de7be7.webp",
      artist: " Harmony Harp",
      audio:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004185212/Jawan-Prevue-Theme.mp3",
      color: ["#CD607D", "#c94043"],
      id: uuidv4(),
      active: false,
    },
    {
      name: "Electro Vibes",
      cover:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004184219/gfglogo0.jpg",
      artist: "Synthwave Sensation",
      audio:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004191840/Zinda-Banda---Jawan-(1).mp3",
      color: ["#EF8EA9", "#ab417f"],
      id: uuidv4(),
      active: false,
    },
    {
      name: "Jazzy Whispers",
      cover:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004210806/DemotivationalPosterfull936506.jpg",
      artist: "Smooth Sax Serenade",
      audio:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004184006/SoundHelix-Song-10.mp3",
      color: ["#CD607D", "#c94043"],
      id: uuidv4(),
      active: false,
    },
    {
      name: "Tropical Breez",
      cover:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004210619/3408428b23c516b1687c748cb7de7be7.webp",
      artist: "Island Rhythms",
      audio:
"https://media.geeksforgeeks.org/wp-content/uploads/20231004191840/Zinda-Banda---Jawan-(1).mp3",
      color: ["#205950", "#2ab3bf"],
      id: uuidv4(),
      active: false,
    },
  ];
}
export default chillHop;
- These five files Library.js, LibrarySong.js, PlayerSong.js, Navb.js and Song.js will be in the components folder of src folder.
// FileName: Library.js
import React from "react";
import LibrarySong from "./LibrarySong";
const Library = ({
    songs,
    setCurrentSong,
    audioRef,
    isPlaying,
    setSongs,
    setLibraryStatus,
    libraryStatus,
}) => {
    return (
        <div className={`library ${libraryStatus ? "active" : ""}`}>
            <h2 style={{ color: "white" }}>All songs</h2>
            <div className="library-songs">
                {songs.map((song) => (
                    <LibrarySong
                        setSongs={setSongs}
                        isPlaying={isPlaying}
                        audioRef={audioRef}
                        songs={songs}
                        song={song}
                        setCurrentSong={setCurrentSong}
                        id={song.id}
                        key={song.id}
                    />
                ))}
            </div>
        </div>
    );
};
export default Library;
// FileName: LibrarySong.js
import React from "react";
const LibrarySong = ({
    song,
    songs,
    setCurrentSong,
    audioRef,
    isPlaying,
    setSongs,
    id,
}) => {
    const songSelectHandler = async () => {
        await setCurrentSong(song);
        //active
        const newSongs = songs.map((song) => {
            if (song.id === id) {
                return {
                    ...song,
                    active: true,
                };
            } else {
                return {
                    ...song,
                    active: false,
                };
            }
        });
        setSongs(newSongs);
        //check if song is playing
        if (isPlaying) audioRef.current.play();
    };
    return (
        <div
            onClick={songSelectHandler}
            className={`library-song ${song.active ? "selected" : ""}`}
        >
            <img src={song.cover} alt={song.name} />
            <div className="song-description">
                <h3>{song.name}</h3>
                <h4>{song.artist}</h4>
            </div>
        </div>
    );
};
export default LibrarySong;
// FileName: Navb.js
import React from "react";
const Nav = ({ setLibraryStatus, libraryStatus }) => {
    return (
        <nav>
            <h1>GeeksforGeeks Music Player</h1>
            <button
                onClick={() => {
                    setLibraryStatus(!libraryStatus);
                }}
            >
                <h4>Library</h4>
            </button>
        </nav>
    );
};
export default Nav;
// FileName: PlayerSong.js
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import {
    faPlay,
    faAngleLeft,
    faAngleRight,
    faPause,
} from "@fortawesome/free-solid-svg-icons";
const Player = ({
    currentSong,
    isPlaying,
    setIsPlaying,
    audioRef,
    setSongInfo,
    songInfo,
    songs,
    setCurrentSong,
    id,
    setSongs,
}) => {
    //useEffect
    const activeLibraryHandler = (nextPrev) => {
        const newSongs = songs.map((song) => {
            if (song.id === nextPrev.id) {
                return {
                    ...song,
                    active: true,
                };
            } else {
                return {
                    ...song,
                    active: false,
                };
            }
        });
        setSongs(newSongs);
        console.log("Hey from useEffect form player JS");
    };
    //Event Handlers
    const dragHandler = (e) => {
        audioRef.current.currentTime = e.target.value;
        setSongInfo({ ...songInfo, currentTime: e.target.value });
    };
    const playSongHandler = () => {
        if (isPlaying) {
            audioRef.current.pause();
            setIsPlaying(!isPlaying);
        } else {
            audioRef.current.play();
            setIsPlaying(!isPlaying);
        }
    };
    const getTime = (time) =>
        Math.floor(time / 60) + ":" + ("0" + Math.floor(time % 60)).slice(-2);
    const skipTrackHandler = async (direction) => {
        let currentIndex = songs.findIndex(
            (song) => song.id === currentSong.id
        );
        if (direction === "skip-forward") {
            await setCurrentSong(songs[(currentIndex + 1) % songs.length]);
            activeLibraryHandler(songs[(currentIndex + 1) % songs.length]);
        }
        if (direction === "skip-back") {
            if ((currentIndex - 1) % songs.length === -1) {
                await setCurrentSong(songs[songs.length - 1]);
                // playAudio(isPlaying, audioRef);
                activeLibraryHandler(songs[songs.length - 1]);
                return;
            }
            await setCurrentSong(songs[(currentIndex - 1) % songs.length]);
            activeLibraryHandler(songs[(currentIndex - 1) % songs.length]);
        }
        if (isPlaying) audioRef.current.play();
    };
    //adding the styles
    const trackAnim = {
        transform: `translateX(${songInfo.animationPercentage}%)`,
    };
    return (
        <div className="player">
            <div className="time-control">
                <p>{getTime(songInfo.currentTime)}</p>
                <div
                    style={{
                        background: 
`linear-gradient(to right, ${currentSong.color[0]}, ${currentSong.color[1]})`,
                    }}
                    className="track"
                >
                    <input
                        min={0}
                        max={songInfo.duration || 0}
                        value={songInfo.currentTime}
                        onChange={dragHandler}
                        type="range"
                    />
                    <div style={trackAnim} className="animate-track"></div>
                </div>
                <p>
                    {songInfo.duration ? getTime(songInfo.duration) : "00:00"}
                </p>
            </div>
            <div className="play-control">
                <FontAwesomeIcon
                    onClick={() => skipTrackHandler("skip-back")}
                    size="2x"
                    className="skip-back"
                    icon={faAngleLeft}
                />
                {!isPlaying ? (
                    <FontAwesomeIcon
                        onClick={playSongHandler}
                        size="2x"
                        className="play"
                        icon={faPlay}
                    />
                ) : (
                    <FontAwesomeIcon
                        onClick={playSongHandler}
                        size="2x"
                        className="pause"
                        icon={faPause}
                    />
                )}
                <FontAwesomeIcon
                    onClick={() => skipTrackHandler("skip-forward")}
                    size="2x"
                    className="skip-forward"
                    icon={faAngleRight}
                />
            </div>
        </div>
    );
};
export default Player;
// FileName: Song.js
import React from "react";
const Song = ({ currentSong }) => {
    return (
        <div className="song-container">
            <img src={currentSong.cover} alt={currentSong.name} />
            <h2>{currentSong.name}</h2>
            <h3>{currentSong.artist}</h3>
        </div>
    );
};
export default Song;
- These five files library.scss, app.scss, nav.scss, player.scss and song.scss will be in the styles folder of src folder.
/* FileName: app.scss */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: "Gilroy", sans-serif;
}
body {
    background: rgb(231, 235, 214);
    background: linear-gradient(
        180deg,
        rgba(231, 235, 214, 1) 0%,
        rgba(55, 102, 44, 1) 100%
    );
}
@import "./library";
@import "./player";
@import "./song";
@import "./nav";
h2,
h3 {
    color: #133a1b;
}
h3,
h4 {
    font-weight: 600;
}
button {
    font-weight: 700;
}
/* FileName: library.scss */
.library {
    position: fixed;
    top: 0;
    left: 0;
    width: 20rem;
    height: 100%;
    background: #32522b;
    box-shadow: 2px 2px 50px rgba(0, 0, 0, 0.205);
    overflow: scroll;
    transform: translateX(-100%);
    transition: all 0.2s ease;
    opacity: 0;
    h2 {
        padding: 2rem;
    }
}
.library-song {
    display: flex;
    align-items: center;
    padding: 1rem 2rem 1rem 2rem;
    img {
        width: 30%;
    }
    &:hover {
        background: rgb(120, 248, 160);
    }
}
.song-description {
    padding-left: 1rem;
    h3 {
        color: #ffffff;
        font-size: 1rem;
    }
    h4 {
        color: gray;
        font-size: 0.7rem;
    }
}
::-webkit-scrollbar {
    width: 5px;
}
::-webkit-scrollbar-thumb {
    background: rgb(255, 183, 183);
    border-radius: 10px;
}
::-webkit-scrollbar-track {
    background: rgb(221, 221, 221);
}
.selected {
    background: rgb(255, 230, 255);
    h3 {
        color: #306b26;
    }
}
.active {
    transform: translateX(0%);
    opacity: 1;
}
@media screen and (max-width: 768px) {
    .library {
        width: 100%;
    }
}
/*FileName: nav.scss */
h1,
h4 {
    color: rgb(9, 70, 9);
}
nav {
    min-height: 10vh;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 20px;
    button {
        background: transparent;
        border: none;
        cursor: pointer;
        font-size: 16px;
        margin-left: 20%;
        border: 2px solid rgb(41, 216, 25);
        padding: 0.8rem;
        transition: all 0.3s ease;
        &:hover {
            background: rgb(89, 219, 77);
            color: white;
        }
    }
}
@media screen and (max-width: 768px) {
    nav {
        button {
            z-index: 10;
        }
    }
}
/* FileName: player.scss */
.player {
    min-height: 20vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: space-between;
}
.time-control {
    width: 50%;
    display: flex;
    align-items: center;
    input {
        width: 100%;
        background-color: transparent;
        cursor: pointer;
    }
    p {
        padding: 1rem;
        font-weight: 700;
    }
}
.play-control {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    width: 30%;
    svg {
        cursor: pointer;
    }
}
input[type="range"]:focus {
    outline: none;
}
input[type="range"]::-webkit-slider-thumb {
    -webkit-appearance: none;
    height: 16px;
    width: 16px;
}
.track {
    background: lightblue;
    width: 100%;
    height: 1rem;
    position: relative;
    border-radius: 1rem;
    overflow: hidden;
}
.animate-track {
    background: rgb(204, 204, 204);
    width: 100%;
    height: 100%;
    position: absolute;
    top: 0;
    left: 0;
    transform: translateX(0%);
    pointer-events: none;
}
@media screen and (max-width: 768px) {
    .time-control {
        width: 90%;
    }
    .play-control {
        width: 80%;
    }
}
/* FileName: song.scss */
.song-container {
    min-height: 60vh;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    img {
        width: 20%;
        //
    }
    h2 {
        padding: 3rem 1rem 1rem 1rem;
    }
    h3 {
        font-size: 1rem;
    }
}
@media screen and (max-width: 768px) {
    .song-container {
        img {
            width: 60%;
        }
    }
}
@keyframes rotate {
    from {
        transform: rotate(0deg);
    }
    to {
        transform: rotate(360deg);
    }
}
.rotateSong {
    animation: rotate 20s linear forwards infinite;
}
Steps to run the project:
- Step 1: Type the following command in terminal.
npm run dev
- Step 2: Open web-browser and type the following URL
http://localhost:5173/
Output:
