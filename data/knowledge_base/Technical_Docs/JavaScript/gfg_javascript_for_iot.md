# JavaScript for IoT

> Source: https://www.geeksforgeeks.org/javascript/javascript-for-iot/

JavaScript (JS) is the most popular lightweight, interpreted compiled programming language. It can be used for both Client-side as well as Server-side developments. JavaScript is also known as a scripting language for web pages.
However, it has become increasingly popular for building Internet of Things (IoT) applications. IoT refers to the connection of everyday devices to the internet, allowing them to communicate with each other and with us. In this blog, we will explore how to use JavaScript to build IoT applications, including controlling hardware devices such as sensors and actuators, and how to use popular platforms such as Raspberry Pi and Arduino.
What is IoT?
IoT stands for Internet of Things. It refers to the interconnectedness of physical devices, such as appliances and vehicles, that are embedded with software, sensors, and connectivity which enables these objects to connect and exchange data. This technology allows for the collection and sharing of data from a vast network of devices, creating opportunities for more efficient and automated systems.
Why use JavaScript for IoT?
JavaScript is a popular programming language that is widely used for creating web applications. It is lightweight, flexible, and easy to learn. JavaScript also has a wide range of libraries and frameworks that can be used for IoT applications. Furthermore, JavaScript is compatible with many hardware platforms such as Raspberry Pi and Arduino, making it a great choice for IoT development.
Building IoT applications with JavaScript: To build an IoT application with JavaScript, we need to use a hardware platform that supports it. Two popular hardware platforms that support JavaScript are Raspberry Pi and Arduino.
Raspberry Pi: Raspberry Pi is a credit-card-sized computer that can be used for various applications, including IoT. It is equipped with input/output (I/O) pins that allow us to connect various sensors and actuators to it. Raspberry Pi also supports various programming languages, including JavaScript.
To build an IoT application with Raspberry Pi, we need to follow these steps:
- Set up Raspberry Pi: We need to set up the Raspberry Pi by installing the operating system and connecting it to the internet. We can use a variety of operating systems such as Raspbian, Ubuntu, and many more. Once we have installed the operating system, we need to connect the Raspberry Pi to the internet by connecting it to a Wi-Fi network or using an Ethernet cable.
- Set up Raspberry Pi: We need to set up the Raspberry Pi by installing the operating system and connecting it to the internet. We can use a variety of operating systems such as Raspbian, Ubuntu, and many more. Once we have installed the operating system, we need to connect the Raspberry Pi to the internet by connecting it to a Wi-Fi network or using an Ethernet cable.
- Write JavaScript code: We can write JavaScript code to read data from the sensors and control the actuators. For example, to read the temperature values from the sensor, we can use the following code:
Example: This example shows the basic implementation of the above approach.
const sensor = require('ds18b20');
// Replace with your sensor ID
const sensorId = '28-00000abcdefg';
sensor.temperature(sensorId, (err, value) => {
    if (err) {
        console.error(err);
        return;
    }
    console.log(`Temperature: ${value}°C`);
});
Note: This code uses the ds18b20 library to read the temperature from the sensor with the ID 28-00000abcdefg. We can then use this temperature value to control other devices, such as a fan or a heater.
Arduino: Arduino is an open-source electronics platform that is designed for building IoT applications. It is equipped with input/output (I/O) pins that allow us to connect various sensors and actuators to it. Arduino also supports various programming languages, including JavaScript.
To build an IoT application with Arduino, we need to follow these steps:
- We need to set up the Arduino by installing the Arduino software and connecting it to the computer using a USB cable. Once we have installed the Arduino software, we can write and upload the code to the Arduino board.
- Connect sensors and actuators: We need to connect the sensors and actuators to the Arduino using the I/O pins. For example, if we want to connect a light sensor to the Arduino, we can connect the sensor's output pin to one of the Arduino's analog input pins. We can then read the light values using JavaScript.
- Write JavaScript code: We can write JavaScript code to read data from the sensors and control the actuators. For example, to read the light values from the sensor, we can use the following code:
Example: This example shows the basic implementation of the above approach.
const five = require('johnny-five');
const board = new five.Board();
board.on('ready', function () {
    const light = new five.Sensor('A0');
    light.on('change', function () {
        console.log(`Light value: ${this.value}`);
    });
});
Note: This code uses the Johnny-five library to read the light value from the sensor connected to the analog input pin A0. We can then use this light value to control other devices, such as a motor or a LED.
Libraries and frameworks for IoT with JavaScript: There are various libraries and frameworks available for building IoT applications with JavaScript. Some popular ones are:
- Node-RED: Node-RED is a visual programming tool that allows us to create IoT applications using a web browser. It uses a drag-and-drop interface to connect various nodes that represent sensors, actuators, and other components. Node-RED also supports JavaScript, making it easy to write custom code to control the devices.
- Cylon.js: Cylon.js is a JavaScript framework that provides a simple and elegant way to build IoT applications. It supports various hardware platforms, including Raspberry Pi, Arduino, and many more. Cylon.js also supports various programming languages, including JavaScript, CoffeeScript, and Ruby.
- Johnny-Five: Johnny-Five is a JavaScript robotics and IoT platform that provides a simple and intuitive way to control hardware devices. It supports various hardware platforms, including Arduino, BeagleBone, and many more. Johnny-Five also supports various programming languages, including JavaScript and CoffeeScript.
- Noduino: Noduino is an easy Javascript and Node.js framework that allows online applications built with HTML5, Socket.IO, and Node.js to access basic Arduino controls.
Conclusion: In this blog, we have explored how to use JavaScript to build IoT applications, including controlling hardware devices such as sensors and actuators, and how to use popular platforms such as Raspberry Pi and Arduino. JavaScript is a lightweight, flexible, and easy-to-learn programming language that is widely used for creating web applications. Its compatibility with various hardware platforms and availability of libraries and frameworks make it a great choice for IoT development. With the help of libraries such as Node-RED, Cylon.js, and Johnny-Five, we can easily build complex IoT applications with JavaScript.
