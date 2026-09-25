# DNS Module in Node.js

> Source: https://www.geeksforgeeks.org/node-js/node-js-dns/

The Node.js DNS module provides methods for performing DNS lookups and working with domain names. It helps resolve domain names into IP addresses for network communication.
- The DNS module is a core module in Node.js used for DNS-related operations.
- It allows resolving domain names to IP addresses and vice versa.
- It supports both synchronous and asynchronous DNS queries.
Features
The Node.js DNS module enables domain name resolution and DNS record queries.
- DNS Lookup: dns.lookup() resolves a domain name to its corresponding IP address for network communication.
- Reverse DNS Lookup: dns.reverse() retrieves the domain name associated with a given IP address.
- DNS Record Queries: dns.resolve() and dns.resolve4() fetch DNS records such as A (IPv4) and AAAA (IPv6).
- Caching: Node.js caches DNS lookups to improve performance and reduce repeated queries.
- Error Handling: Provides mechanisms to handle errors during DNS resolution and related operations.
Example 1: Print the IP address of GeeksforGeeks on the console.
// Include 'dns' module and create its object
const dns = require('dns');
const website = 'geeksforgeeks.org';
// Call to lookup function of dns
dns.lookup(website, (err, address, family) => {
    console.log('address of %s is %j family: IPv%s',
        website, address, family);
});
// Execute using $ node <filename>;
Output:
address of geeksforgeeks.org is "52.25.109.230" family: IPv4
Example 2: Print the IP address of GeeksforGeeks and perform a reverse DNS lookup to find the associated hostname.
// Include 'dns' module and create its object
const dns = require("dns");
// Call to reverse function along with lookup function.
dns.lookup("www.geeksforgeeks.org", 
	function onLookup(err, address, family) {
	console.log("address:", address);
    dns.reverse(address, function (err, hostnames) {
       	console.log(
       		"reverse for " + 
             address + ": " + 
             JSON.stringify(hostnames)
       	);
	});
});
Output:
address: 52.222.176.140
reverse for 52.222.176.140: ["server-52-222-176-140.bom52.r.cloudfront.net"]
Benefits
The Node.js DNS module enhances network operations by simplifying domain resolution and efficiently managing DNS queries.
- Domain Name Resolution: Eliminates the need to memorize IP addresses by mapping domain names to corresponding IP addresses.
- Efficient Network Operations: Simplifies domain resolution and IP address management for network-based applications.
- Versatile DNS Queries: Supports multiple methods for querying and resolving different DNS records.
- Performance Optimization: DNS caching reduces repeated server queries and minimizes latency.
- Robust Error Handling: Provides mechanisms to detect and handle errors during DNS resolution operations.
