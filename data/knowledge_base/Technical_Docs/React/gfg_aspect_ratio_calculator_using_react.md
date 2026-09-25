# Aspect Ratio Calculator using React

> Source: https://www.geeksforgeeks.org/reactjs/aspect-ratio-calculator-using-react/

In this React project, we'll build an interactive Aspect Ratio Calculator where users can upload images to visualize aspect ratios and adjust width and height values for live previews.
Preview of final output: Let us have a look at how the final output will look like.
Prerequisites
Approach to create Aspect Ratio Calculator
- Created the basic GUI structure using React-Bootstrap styling elements such as labels and buttons.
- Implemented a drop-down list containing commonly used aspect ratios for users to select and preview.
- Utilized CSS properties and attributes to style components, including background colors, layout adjustments, and effects.
- Enabled users to select a ratio from the dropdown and view live previews.
- Implemented a download button for users to download the updated resolution image.
Steps to Create the React Application
Step 1: Set up the React project using the below command in VSCode IDE.
npm create vite@latest aspect-ratio --template react
Step 2: Navigate to the newly created project folder by executing the below command.
cd aspect-ratio
Step 3: Installing the required modules:
npm install bootstrap react-bootstrap
Project Structure:
The updated dependencies in package.json will look like this:
"dependencies": {
"bootstrap": "^5.1.3",
"react": "^17.0.2",
"react-bootstrap": "^2.0.0",
"react-dom": "^17.0.2",
"vite": "^2.7.2"
}
Example: Below is the practical implementation of the aspect ratio calculator using ReactJS:
/* App.css */
body {
    font-family: 'Arial', sans-serif;
    background:
        linear-gradient(to bottom, #ed624a, #9fffe7);
    color: #333;
    text-align: center;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
.container {
    width: 80%;
    background-color: #fff;
    padding: 20px;
    border-radius: 15px;
    box-shadow: 0 2px 14px 0px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    align-items: center;
}
h1 {
    font-size: 40px;
    margin-bottom: 30px;
    color: green !important;
    font-weight: bold;
}
.image-input {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
}
.input-section {
    width: 100%;
    display: flex;
    flex-direction: row;
}
.input-field {
    width: 50%;
    border: 2px solid #007bff;
    border-radius: 5px;
    font-size: 30px;
    text-align: center;
}
.common-ratio {
    width: 100%;
    margin-bottom: 10px;
}
.result {
    font-weight: bold;
    font-size: 24px;
    margin-top: 30px;
    text-align: center;
    color: #007bff;
    width: 100%;
}
.image-container {
    background-color: #f5f5f5;
    border: 2px solid #007bff;
    border-radius: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 500px;
    width: 60%;
}
img {
    max-width: 100%;
    max-height: 500px;
    border-radius: 10px;
    box-shadow: 0 2px 24px 0px rgba(0, 0, 0, 0.2);
}
.label-text {
    font-size: 20px;
    margin-top: 30px;
    color: #ff0000;
    font-weight: bold;
}
//App.js
import React,
{ useState } from 'react';
import './App.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import {
	Container, Row, Col,
	Button, Form, InputGroup
} from 'react-bootstrap';
function App() {
	const [file, setFile] = useState(null);
	const [selectedRatio, setSelectedRatio] = useState('16:9');
	const commonRatios = {
		"16:9": [1920, 1080],
		"5:4": [1280, 1024],
		"4:3": [1024, 768],
		"3:2": [1440, 960],
		"8K": [7680, 4320],
		"5K": [5120, 2880],
		"4K": [3840, 2160],
		"Retina": [2048, 1536],
		"iPhone6plus": [1920, 1080],
		"iPhone6": [1334, 750],
		"iPhone5": [1136, 640],
		"iPad": [1024, 768],
		"Twitter": [1024, 512],
		"WebBanner": [728, 90],
		"VGA": [640, 480],
		"HVGA": [320, 480],
	};
	const [selectedWidth, setSelectedWidth] =
		useState(commonRatios[selectedRatio][0]);
	const [selectedHeight, setSelectedHeight] =
		useState(commonRatios[selectedRatio][1]);
	const handleFileChange = (e) => {
		const uploadedFile = e.target.files[0];
		setFile(URL.createObjectURL(uploadedFile));
	};
	const downloadImage =
		() => {
			const canvas = document.createElement('canvas');
			const ctx = canvas.getContext('2d');
			canvas.width = selectedWidth;
			canvas.height = selectedHeight;
			const img = new Image();
			img.src = file;
			img.onload =
				() => {
					ctx.drawImage(
						img, 0, 0,
						selectedWidth,
						selectedHeight);
					canvas.toBlob(
						(blob) => {
							const url = URL.createObjectURL(blob);
							const a = document.createElement('a');
							a.href = url;
							a.download = 'resized_image.png';
							a.click();
						}, 'image/png');
				};
		};
	return (
		<Container className="container">
			<h1>
				GeeksforGeeks Aspect Ratio
				Calculator with Live Preview
			</h1>
			<Row className="image-input">
				<Col>
					<Form.Group controlId="customImage">
						<Form.Label className="label-text">
							Upload an image:
						</Form.Label>
						<Form.Control
							type="file"
							onChange={handleFileChange}
						/>
					</Form.Group>
				</Col>
			</Row>
			<Row className="common-ratio">
				<Col>
					<Form.Group controlId="commonRatios">
						<Form.Label className="label-text">
							Select Common Ratio:
						</Form.Label>
						<Form.Control
							as="select"
							onChange={
								(e) => {
									setSelectedRatio(e.target.value);
									const [width, height] =
										commonRatios[e.target.value];
									setSelectedWidth(width);
									setSelectedHeight(height);
								}}
							value={selectedRatio}>
							{
								Object.keys(commonRatios)
									.map(
										(ratio) => (
											<option key={ratio}
												value={ratio}>
												{ratio}
												({
													commonRatios[ratio][0]
												}x{commonRatios[ratio][1]})
											</option>
										))
							}
						</Form.Control>
					</Form.Group>
				</Col>
			</Row>
			<Row className="image-container">
				<Col>
					<img
						id="previewImage"
						src={file || 'https://via.placeholder.com/300'}
						alt="Preview Image"
						width={selectedWidth}
						height={selectedHeight}
					/>
				</Col>
			</Row>
			<Row>
				<Col>
					<Button onClick={downloadImage}>
						Download Image
					</Button>
				</Col>
			</Row>
		</Container>
	);
}
export default App;
Steps to run the application:
npm run dev
Output: Type the following URL in the address bar http://localhost:5173/
