# Node.js DNS Complete Reference

> Source: https://www.geeksforgeeks.org/node-js/node-js-dns-complete-reference/

Node.js DNS is a node module used to do name resolution facility which is provided by the operating system as well as used to do an actual DNS lookup.
Example:
<script>
    // Node.js program to demonstrate the
    // dns.resolve() method
    
    // Accessing dns module
    const dns = require('dns');
    
    // Set the rrtype for dns.resolve() method
    const rrtype="A";
    
    // Calling dns.resolve() method for hostname
    // geeksforgeeks.org and print them in
    // console as a callback
    dns.resolve('geeksforgeeks.org', rrtype, (err, records)
            => console.log('records: %j', records));
</script>
Output:
records: ["8.8.8.8"]
The Complete List of NodeJS DNS are listed below:
| Node.js DNS | Description | 
|---|---|
| Node.js dns.getServers() Method | This is an inbuilt application programming interface of the dns module which is used to get IP addresses of the current server. | 
| Node.js dns.lookup() Method | This is used to resolve IP addresses of the specified hostname for given parameters into the first found A (IPv4) or AAAA (IPv6) record. | 
| Node.js dns.lookupService() Method | This is used to resolve the addresses and port number to hostname using operating system’s underlying getnameinfo implementation. | 
| Node.js dns.resolve() Method | This is used to resolve hostname into an array of the resource records. | 
| Node.js dns.resolve4() Method | This is used to resolve IPv4 address (‘A’ record) for the specified hostname using DNS protocol. | 
| Node.js dns.resolve6() Method | This is used to resolve IPv6 address (‘AAAA’ record) for the specified hostname using DNS protocol. | 
| Node.js dns.resolveAny() Method | This is used to resolve all records (i.e. ‘ANY’ or ‘*’) for the specified hostname using DNS protocol. | 
| Node.js dns.resolveCname() Method | This is used to resolve CNAME records for the specified hostname using DNS protocol. | 
| Node.js dns.resolveMx() Method | This is used to resolve MX or mail exchange records for the specified hostname using DNS protocol. | 
| Node.js dns.resolveNaptr() Method | This is used to resolve NAPTR record or regular expression based records for the specified hostname using DNS protocol. | 
| Node.js dns.resolveTxt() Method | This is used to resolve TXT or text queries records for the specified hostname using DNS protocol. | 
| Node.js dns.resolveNs() Method | This is used to resolve NS or name server records for the specified hostname using DNS protocol. | 
| Node.js dns.resolvePtr() Method | This is used to resolve PTR or pointer records for the specified hostname using DNS protocol. | 
| Node.js dns.resolveSoa() Method | This is used to resolve SOA or start of authority records for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.resolve() Method | This is used to resolve hostname into an array of the resource records. | 
| Node.js dnsPromises.lookup() Method | This is used to resolve IP addresses of the specified hostname for given parameters into the first found A (IPv4) or AAAA (IPv6) record. | 
| Node.js dnsPromises.lookupService() Method | This is used to resolve the addresses and port number to hostname and service using operating system’s underlying getnameinfo implementation. | 
| Node.js dnsPromises.resolveNs() Method | This is used to resolve NS or name server records for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.reverse() Method | This is used to resolve hostname for the specified IP address using reverse DNS query. | 
| Node.js dnsPromises.resolveTxt() Method | This is used to resolve TXT or text queries records for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.resolveSoa() Method | This is used to resolve SOA or start of authority records for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.resolveAny() Method | This is used to resolve all records (i.e. ‘ANY’ or ‘*’) for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.resolveMx() Method | This is used to resolve MX or mail exchange records for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.resolve4() Method | This is used to resolve IPv4 address (‘A’ record) for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.resolve6() Method | This is used to resolve IPv6 address (‘AAAA’ record) for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.resolveMx() Method | This is used to resolve MX or mail exchange records for the specified hostname using DNS protocol. | 
| Node.js dnsPromises.getServers() Method | This is used to get the IP addresses of the current server. |
