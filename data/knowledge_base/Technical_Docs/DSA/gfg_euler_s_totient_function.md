# Euler's Totient Function

> Source: https://www.geeksforgeeks.org/dsa/eulers-totient-function

Given an integer n, find the value of Euler's Totient Function, denoted as Φ(n). The function Φ(n) represents the count of positive integers less than or equal to n that are relatively prime to n. 
Euler's Totient function Φ(n) for an input n is the count of numbers in {1, 2, 3, ..., n-1} that are relatively prime to n, i.e., the numbers whose GCD (Greatest Common Divisor) with n is 1.
If n is a positive integer and its prime factorization is; 
Where 
Examples:
Input: n = 11
Output: 10
Explanation: From 1 to 11, 1,2,3,4,5,6,7,8,9,10 are relatively prime to 11.
Input: n = 16
Output:  8
Explanation: From 1 to 16, 1,3,5,7,9,11,13,15  are relatively prime to 16.
Table of Content
[Naive Approach] Iterative GCD Method - O(n * log n) Time and O(1) Space
For every number from 1 to n - 1, the idea is to check whether it is coprime with n, meaning their GCD is 1. We start the count from 1, since 1 is always coprime with n, and increment the count whenever gcd(i, n) == 1.
- Initialize result = 1, as 1 is always coprime with n.
- Iterate through every number i from 2 to n - 1.
- Calculate gcd(i, n) using the Euclidean algorithm.
- If gcd(i, n) == 1, increment result.
- After checking all numbers, return result.
#include <iostream>
using namespace std;
// Function to return gcd of a and b
int gcd(int a, int b)
{
    if (a == 0)
        return b;
    return gcd(b % a, a);
}
// A simple method to evaluate Euler Totient Function
int etf(int n)
{
    int result = 1;
    for (int i = 2; i < n; i++)
        if (gcd(i, n) == 1)
            result++;
    return result;
}
int main()
{
    int n = 11;
    cout << etf(n) << endl;
    return 0;
}
class GFG {
    // Function to return gcd of a and b
    static int gcd(int a, int b)
    {
        if (a == 0)
            return b;
        return gcd(b % a, a);
    }
    // Function to compute Euler's Totient Function
    static int etf(int n)
    {
        int result = 1;
        for (int i = 2; i < n; i++) {
            if (gcd(i, n) == 1)
                result++;
        }
        return result;
    }
    public static void main(String[] args)
    {
        int n = 11;
        System.out.println(etf(n));
    }
}
# Function to return gcd of a and b
def gcd(a, b):
    if a == 0:
        return b
    return gcd(b % a, a)
# A simple method to evaluate Euler Totient Function
def etf(n):
    result = 1
    for i in range(2, n):
        if gcd(i, n) == 1:
            result += 1
    return result
# Driver Code
if __name__ == "__main__":
    n = 11
    print(etf(n))
using System;
class GFG {
    // Function to return gcd of a and b
    static int gcd(int a, int b)
    {
        if (a == 0)
            return b;
        return gcd(b % a, a);
    }
    // A simple method to evaluate Euler Totient Function
    static int etf(int n)
    {
        int result = 1;
        for (int i = 2; i < n; i++) {
            if (gcd(i, n) == 1)
                result++;
        }
        return result;
    }
    static void Main()
    {
        int n = 11;
        Console.WriteLine(etf(n));
    }
}
// Function to return gcd of a and b
function gcd(a, b)
{
    if (a === 0)
        return b;
    return gcd(b % a, a);
}
// A simple method to evaluate Euler Totient Function
function etf(n)
{
    let result = 1;
    for (let i = 2; i < n; i++) {
        if (gcd(i, n) === 1)
            result++;
    }
    return result;
}
// Driver Code
let n = 11;
console.log(etf(n));
Output
10
[Expected Approach] Euler’s Product Formula - O(sqrt(n)) Time and O(1) Space
The idea is based on Euler's product formula which states that the value of totient functions is below the product overall prime factors p of n.
- It uses the distinct prime factors of n and removes the fraction of numbers divisible by each prime factor.
- For every prime factor p of n, the formula multiplies the current count by (1 - 1/p).
- After applying this for every distinct prime factor, result gives the number of integers coprime with n.
- Initialize result = n.
- Iterate through possible factors p from 2 to sqrt(n).
- If p divides n, it is a prime factor; remove all its occurrences from n.
- Update result using result -= result / p.
- If a prime factor greater than sqrt(n) remains (n > 1), update result for it.
- Return result, which is φ(n), the count of numbers coprime with n.
#include <iostream>
using namespace std;
int etf(int n)
{
    int result = n;
    // Consider all prime factors of n
    // and subtract their multiples
    // from result
    for (int p = 2; p * p <= n; ++p)
    {
        // Check if p is a prime factor.
        if (n % p == 0)
        {
            // If yes, then update n and result
            while (n % p == 0)
                n /= p;
            result -= result / p;
        }
    }
    // If n has a prime factor greater than sqrt(n)
    // (There can be at-most one such prime factor)
    if (n > 1)
        result -= result / n;
    return result;
}
int main()
{
    int n = 11;
    cout << etf(n) << endl;
    return 0;
}
class GFG {
    static int etf(int n)
    {
        int result = n;
        // Consider all prime factors of n
        // and subtract their multiples
        // from result
        for (int p = 2; p * p <= n; ++p) {
            if (n % p == 0) {
                while (n % p == 0)
                    n /= p;
                result -= result / p;
            }
        }
        // If n has a prime factor greater than sqrt(n)
        // (There can be at-most one such prime factor)
        if (n > 1)
            result -= result / n;
        return result;
    }
    public static void main(String[] args)
    {
        int n = 11;
        System.out.println(etf(n));
    }
}
def etf(n):
    result = n
    # Consider all prime factors of n
    # and subtract their multiples
    # from result
    p = 2
    while p * p <= n:
        if n % p == 0:
            while n % p == 0:
                n //= p
            result -= result // p
        p += 1
    # If n has a prime factor greater than sqrt(n)
    # (There can be at-most one such prime factor)
    if n > 1:
        result -= result // n
    return result
# Driver Code
if __name__ == "__main__":
    n = 11
    print(etf(n))
using System;
class GFG {
    static int etf(int n)
    {
        int result = n;
        // Consider all prime factors of n
        // and subtract their multiples
        // from result
        for (int p = 2; p * p <= n; ++p) {
            // Check if p is a prime factor.
            if (n % p == 0) {
                // If yes, then update n and result
                while (n % p == 0)
                    n /= p;
                result -= result / p;
            }
        }
        // If n has a prime factor greater than sqrt(n)
        // (There can be at-most one such prime factor)
        if (n > 1)
            result -= result / n;
        return result;
    }
    static void Main()
    {
        int n = 11;
        Console.WriteLine(etf(n));
    }
}
function etf(n)
{
    let result = n;
    // Consider all prime factors of n
    // and subtract their multiples
    // from result
    for (let p = 2; p * p <= n; ++p) {
        if (n % p === 0) {
            while (n % p === 0)
                n = Math.floor(n / p);
            result -= Math.floor(result / p);
        }
    }
    // If n has a prime factor greater than sqrt(n)
    // (There can be at-most one such prime factor)
    if (n > 1)
        result -= Math.floor(result / n);
    return result;
}
// Driver Code
const n = 11;
console.log(etf(n));
Output
10
Some Interesting Properties of Euler's Totient Function
1) For a prime number p, 
Proof :
We know that 
Number for which 
\phi(p) = p - 1 , where p is any prime numbergcd(p, k) = 1 where k is any random number andk \neq p \\ Total number from 1 to p = pgcd(p, k) = 1 is1 , i.e the number p itself, so subtracting 1 from p\phi(p) = p - 1 
Examples :
\phi(5) = 5 - 1 = 4 \\ \phi(13) = 13 - 1 = 12 \\ \phi(29) = 29 - 1 = 28 .
2) For two prime numbers a and b
Proof :
Let a and b be distinct primes.
Then:
- ϕ(a)=a−1, ϕ(b)=b−1
Total numbers from 1 to ab: ab
 Multiples of a: b numbers
 Multiples of b: a numbers
 Common multiple (i.e., double-counted): only ab
So, numbers not coprime to ab:
a+b−1
Then,
ϕ(ab) = ab − (a + b − 1) = ab − a − b + 1 = (a−1)(b−1)
Hence,
ϕ(ab) = ϕ(a)* ϕ(b)
Examples :
- ϕ(5⋅7) = ϕ(5)⋅ϕ(7) = (5−1) (7−1) = 4⋅6 = 24
- ϕ(3⋅5) = ϕ(3)⋅ϕ(5) = (3−1) (5−1) = 2⋅4 = 8
- ϕ(3⋅7) = ϕ(3)⋅ϕ(7) = (3−1) (7−1) = 2⋅6 = 12
3) For a prime number p and integer k ≥ 1:
ϕ(pk) = pk−pk−1
Proof :
Removing these multiples as with them 
Examples :
 p = 2, k = 5, 
Multiples of 2 (as with them 
4) Special Case : gcd(a, b) = 1
\phi(a \cdot b) = \phi(a) \cdot \phi(b) \cdot \frac {1} {\phi(1)} = \phi(a) \cdot \phi(b) .
Examples :
Special Case:
 
Normal Case:
 
5) Sum of values of totient functions of all divisors of n is equal to n. 
 
Example :
n = 6 , factors = {1, 2, 3, 6} 
n = 
6) The most famous and important feature is expressed in Euler's theorem :
The theorem states that if n and a are coprime
(or relatively prime) positive integers, then
aΦ(n) Φ 1 (mod n) 
The RSA cryptosystem is based on this theorem:
In the particular case when m is prime say p, Euler's theorem turns into the so-called Fermat's little theorem : 
ap-1 Φ 1 (mod p)
Related Article: 
Euler’s Totient function for all numbers smaller than or equal to n 
Optimized Euler Totient Function for Multiple Evaluations
