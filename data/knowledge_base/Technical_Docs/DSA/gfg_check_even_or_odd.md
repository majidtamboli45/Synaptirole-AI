# Check Even or Odd

> Source: https://www.geeksforgeeks.org/dsa/check-whether-given-number-even-odd

Given a number n, check whether it is even or odd. Return true for even and false for odd.
Examples:
Input: n = 15
Output: false
Explanation: 15 % 2 = 1, so 15 is odd .
Input: n = 44
Output: true
Explanation: 44 % 2 = 0, so 44 is even.
Table of Content
[Naive Approach] By Finding the Remainder - O(1) Time and O(1) Space
We can check the remainder when divided by 2. If the remainder is 0, the number is even, otherwise it is odd. For example, when we divide 13 by 2, we get remainder as 1 and when we divide 14 by 2, we get remainder as 0.
#include <iostream>
using namespace std;
bool isEven(int n)
{
    // finding remainder of n
    int rem = n % 2;
    if(rem == 0){
        return true;
    }
    else{
        return false;
    }
}
int main()
{
    int n = 15;
    if (isEven(n))
        cout << "true";
    else
        cout << "false";
    return 0;
}
#include <stdio.h>
#include <stdbool.h>
bool isEven(int n)
{
    return n % 2 == 0;
}
// Driver Code
int main()
{
    int n = 15;
    if (isEven(n))
        printf("true\n");
    else
        printf("false\n");
    return 0;
}
class GfG {
    public static boolean isEven(int n)
    {
        // finding remainder of n
        int rem = n % 2;
        if(rem == 0){
            return true;
        }
        else{
            return false;
        }
    }
    
    // Driver Code
    public static void main(String[] args)
    {
        int n = 15;
        if (isEven(n) == true)
            System.out.print("true");
        else
            System.out.print("false");
    }
}
def isEven(n):
    
    # finding remainder of n
    rem = n % 2; 
    if rem == 0:
        return True
    else:
        return False
if __name__ == "__main__":
    n = 15
    if isEven(n):
        print("true")
    else:
        print("false")
using System;
class Program
{
    static bool isEven(int n)
    {
        // finding remainder of n
        int rem = n % 2;
        if (rem == 0){
            return true;
        }
        else{
            return false;
        }
    }
    
    static void Main()
    {
        int n = 15;
        if (isEven(n))
            Console.WriteLine("true");
        else
            Console.WriteLine("false");
    }
}
function isEven(n) {
    
    // finding remainder of n
    let rem = n % 2;
    if(rem == 0){
        return true;
    }
    else{
        return false;
    }
}
// Driver code
let n = 15;
if (isEven(n)) {
    console.log("true");
}
else {
    console.log("false");
}
Output
false
[Efficient Approach] Using Bitwise AND Operator - O(1) Time and O(1) Space
The last bit of all odd numbers is always 1, while for even numbers it’s 0. So, when performing bitwise AND operation with 1, odd numbers give 1, and even numbers give 0.
Note: Bitwise operators are extremely fast and efficient because they operate directly at the binary level, making them significantly faster than arithmetic or logical operations.
Examples:
15  ->               1 1 1 1
                    &  0 0 0 1
                       -------
                       0 0 0 1 , so this we can say it is an odd number.
44 ->        1 0 1 1 0 0
            &  0 0 0 0 0 1
                 ----------
                0 0 0 0 0 0 , so this we can say it is an even number.
#include <iostream>
using namespace std;
bool isEven(int n)
{   
    // taking bitwise and of n with 1 
    if ((n & 1) == 0)
        return true;
    else
        return false;
}
int main()
{
    int n = 15;
    if (isEven(n) == true)
        cout << "true";
    else
        cout << "false";
    return 0;
}
#include <math.h>
#include <stdio.h>
#include <stdbool.h> // for using boolean datatype in c
bool isEven(int n)
{
    // taking bitwise and of n with 1 
    if ((n & 1) == 0)
        return true;
    else
        return false;
}
int main()
{
    int n = 15;
    if (isEven(n))
    {
        printf("true");
    }
    else
    {
        printf("false");
    }
    return 0;
}
class GfG {
    public static boolean isEven(int n)
    {
        // taking bitwise and of n with 1 
        if ((n & 1) == 0)
            return true;
        else
            return false;
    }
    
    public static void main(String[] args)
    {
        int n = 15;
        if (isEven(n) == true)
            System.out.print("true");
        else
            System.out.print("false");
    }
}
def isEven(n):
    # taking bitwise and of n with 1 
    if (n & 1) == 0:
        return True
    else:
        return False
if __name__ == "__main__":
    n = 15
    if isEven(n):
        print("true")
    else:
        print("false")
using System;
class GfG {
    public static bool isEven(int n)
    {
        // taking bitwise and of n with 1 
        if ((n & 1) == 0)
            return true;
        else
            return false;
    }
    
    public static void Main()
    {
        int n = 15;
        if (isEven(n) == true)
            Console.WriteLine("true");
        else
            Console.WriteLine("false");
    }
}
function isEven(n)
{
    // taking bitwise and of n with 1 
    if ((n & 1) === 0) {
        return true;
    }
    else {
        return false;
    }
}
// Driver Code
let n = 15;
if (isEven(n)) {
    console.log("true");
}
else {
    console.log("false");
}
Output
false
