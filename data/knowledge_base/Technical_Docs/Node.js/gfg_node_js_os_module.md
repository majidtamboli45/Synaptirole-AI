# Node.js OS Module

> Source: https://www.geeksforgeeks.org/node-js/node-js-os/

The os module provides access to operating system information such as hostname, CPU details, and memory usage, including free system memory in bytes.
- os.arch(): Returns the CPU architecture (e.g., x64, arm).
- os.cpus(): Returns an array with details of each CPU/core.
- os.freemem(): Returns free system memory in bytes.
- os.homedir(): Returns the current user’s home directory path.
- os.hostname(): Returns the system hostname.
- os.networkInterfaces(): Returns network interface information.
- os.platform(): Returns the operating system platform (e.g., linux, darwin).
- os.release(): Returns the operating system release version.
- os.totalmem(): Returns total system memory in bytes.
- os.uptime(): Returns system uptime in seconds.
Features
The os module offers utilities to inspect system details, monitor resources, and detect the operating system platform.
- System Information: Provides insights into the system’s hardware and software environment.
- Resource Monitoring: Helps in monitoring memory usage and system performance.
- Platform Detection: Identifies the platform and version of the operating system.
Example: Uses Node.js os module to fetch and display system details and memory info.
// Include os module and create its object
const os = require('os');
// return the cpu architecture
console.log("CPU architecture: " + os.arch());
// It returns the amount of free system memory in bytes
console.log("Free memory: " + os.freemem());
// It return total amount of system memory in bytes
console.log("Total memory: " + os.totalmem());
// It returns the list of network interfaces
console.log('List of network Interfaces: ' + os.networkInterfaces());
// It returns the operating systems default directory for temp files.
console.log('OS default directory for temp files : ' + os.tmpdir());
Output:
Example: Displays system endianness, hostname, OS name, platform, and release using the Node.js os module.
// Include os module and create its object
const os = require('os');
// return the endianness of system
console.log("Endianness of system: " + os.endianness());
// It returns hostname of system
console.log("Hostname: " + os.hostname());
// It return operating system name
console.log("Operating system name: " + os.type());
// It returns the platform of os
console.log('operating system platform: ' + os.platform());
// It returns the operating systems release.
console.log('OS release : ' + os.release());
Output:
Benefits
- Enhanced Functionality: Facilitates writing system-specific code.
- Performance: Allows monitoring and optimizing system resource usage.
- Cross-Platform Support: Ensures compatibility across different operating systems.
