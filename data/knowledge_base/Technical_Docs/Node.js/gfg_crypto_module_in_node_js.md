# Crypto Module in Node.js

> Source: https://www.geeksforgeeks.org/node-js/node-js-crypto-complete-reference/

The Node.js crypto module provides cryptographic functionality used to secure data and protect information in applications and network communications.
- The crypto module is used to perform cryptographic operations in Node.js.
- Cryptography is an important part of network security.
- Cryptography refers to the science of secret writing used to keep data confidential.
    // Importing crypto module
    const crypto = require('crypto');
    
    // Creating and initializing algorithm and password
    const algorithm = 'aes-192-cbc';
    const password = 'Password used to generate key';
    
    // Getting key for the cipher object
    const key = crypto.scryptSync(password, 'salt', 24);
    
    // Creating and initializing the static iv
    const iv = Buffer.alloc(16, 0);
    
    // Creating and initializing the cipher object
    const cipher = crypto.createCipheriv(algorithm, key, iv);
    
    // Getting buffer value
    // by using final() method
    let value = cipher.final('hex');
    
    // Display the result
    console.log("buffer :- " + value);
Output:
buffer :- b9be42878310d599e4e49e040d1badb9
Methods of the Node.js Crypto Module
The Complete List of crypto module are listed below:
1. Cipher Methods
These methods are used to perform encryption operations using a cipher object.
- cipher.final() returns the buffer containing the final encrypted data of the cipher object.
- cipher.update() updates the cipher with data according to the given encoding format.
2. Decipher Methods
These methods are used to decrypt encrypted data using a decipher object.
- decipher.update() updates the decipher with encrypted data according to the encoding format.
- decipher.final() returns the buffer containing the final decrypted value of the decipher object.
3. Cipher and Decipher Creation
These methods are used to create objects required for performing encryption and decryption.
- crypto.createCipheriv() creates a Cipher object using a specified algorithm, key, and initialization vector.
- crypto.createDecipheriv() creates a Decipher object using a specified algorithm, key, and initialization vector.
4. Encryption and Decryption
These methods are used to encrypt and decrypt data using public and private keys.
- crypto.publicEncrypt() encrypts data using a public key.
- crypto.privateDecrypt() decrypts data using a private key.
- crypto.privateEncrypt() encrypts data using a private key.
- crypto.publicDecrypt() decrypts data using a public key.
5. Hashing and Message Authentication
These methods are used to generate secure hashes and message authentication codes.
- crypto.createHash() creates a hash object used to generate hash digests using a specified algorithm.
- crypto.createHmac() creates an HMAC object using a given algorithm and secret key.
- crypto.getHashes() returns an array containing the names of all supported hash algorithms.
6. Random Data Generation
These methods generate cryptographically secure random data for security purposes.
- crypto.randomBytes() generates cryptographically secure random data.
- crypto.randomFill() fills a buffer with cryptographically secure random values.
- crypto.randomFillSync() synchronously fills a buffer with random data.
7. Password-Based Key Derivation
These methods generate secure keys from passwords using key derivation algorithms.
- crypto.pbkdf2() provides an asynchronous implementation of the PBKDF2 key derivation function.
- crypto.pbkdf2Sync() provides a synchronous implementation of PBKDF2.
- crypto.scrypt() provides an asynchronous implementation of the scrypt key derivation algorithm.
8. Diffie-Hellman Key Exchange
These methods implement the Diffie-Hellman algorithm used for secure key exchange.
- crypto.getDiffieHellman() creates a predefined Diffie-Hellman key exchange object.
- crypto.createDiffieHellmanGroup() creates a Diffie-Hellman group used for key exchange.
- crypto.createDiffieHellman(primeLength, generator) creates a Diffie-Hellman key exchange object using a generated prime number.
- crypto.createDiffieHellman(prime, primeEncoding, generator, generatorEncoding) creates a Diffie-Hellman key exchange object using a specified prime.
9. Elliptic Curve Cryptography
These methods support elliptic curve cryptography for secure communication.
- crypto.createECDH() creates an Elliptic Curve Diffie-Hellman key exchange object.
- crypto.getCurves() returns an array containing the names of supported elliptic curves.
10. Digital Signatures
These methods are used to create and verify digital signatures.
- crypto.createSign() creates a Sign object used to generate digital signatures.
- crypto.createVerify() creates a Verify object used to verify digital signatures.
11. Key Generation
These methods generate asymmetric public and private key pairs.
- crypto.generateKeyPair() generates a new asymmetric key pair of the specified type.
- crypto.generateKeyPairSync() synchronously generates a new asymmetric key pair.
12. Other Methods
These additional methods provide utility functions related to cryptography.
- crypto.getCiphers() returns an array containing the names of all supported cipher algorithms.
