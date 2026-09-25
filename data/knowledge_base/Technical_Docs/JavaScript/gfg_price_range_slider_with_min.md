# Price Range Slider with Min

> Source: https://www.geeksforgeeks.org/javascript/price-range-slider-with-min-max-input-using-html-css-and-javascript/

Here, we implement a Price Range Slider using HTML, CSS, and JavaScript. Users can select their desired price range by moving the slider or by manually entering minimum and maximum values. JavaScript is used to synchronize inputs and add interactivity.
- HTML structures the slider and input fields.
- CSS styles the slider for a clean, user-friendly UI.
- JavaScript handles price updates and user interactions.
Preview
Prerequisites: HTML, CSS, JavaScript
Approach
- Create the structure of this project using HTML tags, like <div>, <h2> for the heading, <p> to display the Instructions, HTML input tags to enter a required range, and also give a Class name to each div.
- Style the structure with CSS using classes and elements.
- In JavaScript, Select the price range slider element using the document method querySelector().
- Add eventListeners to price and range input elements.
- Handle price input changes: Update slider and input values based on conditions.
- Handle range input changes: Adjust input values to meet the price gap or update price input values and slider positions.
<!-- index.html -->
<html>
<head>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div class="main">
        <div class="gfg">
            <p>GeeksForGeeks</p>
        </div>
        <div class="custom-wrapper">
            <div class="header">
                <h2 class="projtitle">Price Range Slider</h2>
            </div>
            <div class="price-input-container">
                <div class="price-input">
                    <div class="price-field">
                        <span>Minimum Price</span>
                        <input type="number" class="min-input" value="2500">
                    </div>
                    <div class="price-field">
                        <span>Maximum Price</span>
                        <input type="number" class="max-input" value="8500">
                    </div>
                </div>
                <div class="slider">
                    <div class="price-slider"></div>
                </div>
            </div>
            <!-- Slider -->
            <div class="range-input">
                <input type="range" class="min-range" min="0" max="10000" value="2500" step="1">
                <input type="range" class="max-range" min="0" max="10000" value="8500" step="1">
            </div>
        </div>
    </div>
    <script src="script.js"></script>
</body>
</html>
/* Style.css */
* {
    margin: 0;
    padding: 0;
}
body {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 100vh;
    background: #ffffff;
    flex-direction: column;
}
.main {
    background-color: #fff;
    border-radius: 15px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
    padding: 20px;
    transition: transform 0.2s;
    width: 600px;
}
.main:hover {
    transform: scale(1.05);
}
.gfg {
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 24px;
    font-weight: 600;
    color: #01940b;
}
.custom-wrapper {
    margin: 0;
    width: 70%;
    padding: 0px 25px 40px;
    position: relative;
    left: 63px;
}
.header h2 {
    font-size: 30px;
    color: #01940b;
    display: flex;
    justify-content: center;
    padding: 20px;
}
/* Styles for the price input container */
.price-input-container {
    width: 100%;
}
.price-input .price-field {
    display: flex;
    margin-bottom: 22px;
}
.price-field span {
    margin-right: 10px;
    margin-top: 6px;
    font-size: 17px;
}
.price-field input {
    flex: 1;
    height: 35px;
    font-size: 15px;
    font-family: "DM Sans", sans-serif;
    border-radius: 9px;
    text-align: center;
    border: 0px;
    background: #e4e4e4;
}
.price-input {
    width: 100%;
    font-size: 19px;
    color: #555;
}
/* Remove Arrows/Spinners */
input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
    -webkit-appearance: none;
    margin: 0;
}
.slider {
    width: 100%;
}
.slider {
    height: 6px;
    position: relative;
    background: #e4e4e4;
    border-radius: 5px;
}
.slider .price-slider {
    height: 100%;
    left: 25%;
    right: 15%;
    position: absolute;
    border-radius: 5px;
    background: #01940b;
}
.range-input {
    position: relative;
}
.range-input input {
    position: absolute;
    width: 100%;
    height: 5px;
    background: none;
    top: -5px;
    pointer-events: none;
    cursor: pointer;
    -webkit-appearance: none;
}
/* Styles for the range thumb in WebKit browsers */
input[type="range"]::-webkit-slider-thumb {
    height: 18px;
    width: 18px;
    border-radius: 70%;
    background: #555;
    pointer-events: auto;
    -webkit-appearance: none;
}
@media screen and (max-width: 768px) {
    .main {
        width: 80%;
        margin-right: 5px;
    }
    .custom-wrapper {
        width: 100%;
        left: 0;
        padding: 0 10px;
    }
    .projtitle {
        width: 100%;
        position: relative;
        right: 26px;
    }
    .price-input {
        flex-direction: column;
        align-items: center;
    }
    .price-field {
        margin-bottom: 10px;
    }
}
// Script.js
const rangevalue = document.querySelector(".slider .price-slider");
const rangeInputvalue = document.querySelectorAll(".range-input input");
// Set the price gap
let priceGap = 500;
// Adding event listeners to price input elements
const priceInputvalue = document.querySelectorAll(".price-input input");
for (let i = 0; i < priceInputvalue.length; i++) {
    priceInputvalue[i].addEventListener("input", e => {
        // Parse min and max values of the range input
        let minp = parseInt(priceInputvalue[0].value);
        let maxp = parseInt(priceInputvalue[1].value);
        let diff = maxp - minp
        if (minp < 0) {
            alert("minimum price cannot be less than 0");
            priceInputvalue[0].value = 0;
            minp = 0;
        }
        // Validate the input values
        if (maxp > 10000) {
            alert("maximum price cannot be greater than 10000");
            priceInputvalue[1].value = 10000;
            maxp = 10000;
        }
        if (minp > maxp - priceGap) {
            priceInputvalue[0].value = maxp - priceGap;
            minp = maxp - priceGap;
            if (minp < 0) {
                priceInputvalue[0].value = 0;
                minp = 0;
            }
        }
        // Check if the price gap is met and max price is within the range
        if (diff >= priceGap && maxp <= rangeInputvalue[1].max) {
            if (e.target.className === "min-input") {
                rangeInputvalue[0].value = minp;
                let value1 = rangeInputvalue[0].max;
                rangevalue.style.left = `${(minp / value1) * 100}%`;
            }
            else {
                rangeInputvalue[1].value = maxp;
                let value2 = rangeInputvalue[1].max;
                rangevalue.style.right = `${100 - (maxp / value2) * 100}%`;
            }
        }
    });
    // Add event listeners to range input elements
    for (let i = 0; i < rangeInputvalue.length; i++) {
        rangeInputvalue[i].addEventListener("input", e => {
            let minVal = parseInt(rangeInputvalue[0].value);
            let maxVal = parseInt(rangeInputvalue[1].value);
            let diff = maxVal - minVal
            
            // Check if the price gap is exceeded
            if (diff < priceGap) {
            
                // Check if the input is the min range input
                if (e.target.className === "min-range") {
                    rangeInputvalue[0].value = maxVal - priceGap;
                }
                else {
                    rangeInputvalue[1].value = minVal + priceGap;
                }
            }
            else {
            
                // Update price inputs and range progress
                priceInputvalue[0].value = minVal;
                priceInputvalue[1].value = maxVal;
                rangevalue.style.left = `${(minVal / rangeInputvalue[0].max) * 100}%`;
                rangevalue.style.right = `${100 - (maxVal / rangeInputvalue[1].max) * 100}%`;
            }
        });
    }
}
Output
