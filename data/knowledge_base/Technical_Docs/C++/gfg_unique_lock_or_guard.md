# unique_lock or lock_guard

> Source: https://www.geeksforgeeks.org/cpp/stdunique_lock-or-stdlock_guard-which-is-better/

Both std::unique_lock and std::lock_guard are mutex wrappers provided by the C++ Standard Library to synchronize access to shared resources. While both automatically release the mutex when they go out of scope, they differ in flexibility, performance, and use cases.
- Both provide RAII-based mutex management.
- std::lock_guard is lightweight, whereas std::unique_lock offers additional control.
std::unique_lock
std::unique_lock is a flexible mutex wrapper that supports manual locking and unlocking, deferred locking, timed locking, and ownership transfer. It is suitable for scenarios where greater control over mutex management is required. Following are some key features of unique_lock:
- Flexibility: Can lock and unlock multiple times within its scope.
- Timed Locking: Supports times and try-locking operations.
- Ownership Transfer: It allows transferring mutex ownership to another unique_lock.
Syntax
std::unique_lock<std::mutex> lock(mtx);
                              or
std::unique_lock<std::mutex> lock(mtx, std::defer_lock);
Where:
- lock is the unique_lock object.
- mtx is the mutex object.
- std::defer_lock creates the object without immediately locking the mutex.
Example: The following program illustrates the use of unique_lock in C++
#include <mutex>
#include <thread>
#include <iostream>
using namespace std;
// Global mutex to protect shared_data
mutex mtx;
// Shared data variable
int shared_data = 0;
// Function to increment shared_data
void increment_data() {
    // Create a unique_lock object, but defer locking the mutex
    unique_lock<mutex> lock(mtx, defer_lock); 
    
    // Explicitly acquire the lock
    lock.lock(); 
    
    // Critical section: safely modify shared_data
    shared_data += 2;
    
    // Manually release the lock
    lock.unlock(); 
}
int main() {
    // Create two threads that run the increment_data function
    thread t1(increment_data);
    thread t2(increment_data);
    
    // Wait for both threads to finish
    t1.join();
    t2.join();
    
    // Output the value of shared_data
    cout << "Value of shared variable: " << shared_data;
    return 0;
}
Output
Value of shared variable: 4
Explanation
- A unique_lock object is created with std::defer_lock and the mutex is explicitly locked using lock().
- The shared variable is updated inside the critical section, and the mutex is manually unlocked before the object goes out of scope.
Common Use Cases
Following are the use cases when you should consider using unique_lock:
- We need to defer locking or conditionally lock a mutex.
- We require timed locking to prevent blocking indefinitely.
- We need to transfer lock ownership between different scopes or threads.
std::lock_guard
std::lock_guard is a simple mutex wrapper that locks a mutex during construction and automatically unlocks it when the object goes out of scope. It is designed for straightforward synchronization with minimal overhead. Following are some key features of unique_lock:
- Simplicity: lock_guard is very simple to use with minimal overhead.
- RAII(Resource Acquisition Is Initialization) : Ensures that mutex is released when the lock_guard goes out of scope.
- No Unlocking: Does not support manual unlocking before the end of its scope.
Syntax
std::lock_guard<std::mutex> lock(mtx);
Where:
- lock is the lock_guard object.
- mtx is the mutex object.
Example: The following program illustrates the use of lock_guard in C++
#include <mutex>
#include <thread>
#include<iostream>
using namespace std;
// Global mutex to protect shared_data
mutex mtx;
// Shared data variable
int shared_data = 0;
// Function to increment shared_data
void increment_data() {
    // Create a lock_guard object which locks the mutex
    lock_guard<mutex> lock(mtx);
    
    // Critical section: safely modify shared_data
    shared_data+=2;
    
    // Lock is automatically released when 'lock' goes out of scope
}
int main() {
    // Create two threads that run the increment_data function
    thread t1(increment_data);
    thread t2(increment_data);
    
    // Wait for both threads to finish
    t1.join();
    t2.join();
    
    // Output the value of shared_data
    cout << "Value of shared variable: " << shared_data;
    
    return 0;
}
Output
Value of shared variable: 4
Common Use Cases
Following are the use cases when you should consider using lock_guard:
- It is used when you need simple lock that automatically unlocks when the scope ends.
- The locking operation is straightforward and does not require unlocking before scope ends.
- You prioritize minimal overhead and simplicity.
std::unique_lock Vs std::lock_guard
Following are some key differences between lock_guard and unique_lock in C++:
| Feature | std::lock_guard | std::unique_lock | 
|---|---|---|
| Locking behavior | Locks immediately and unlocks automatically at scope exit | Supports manual, deferred, and timed locking | 
| Manual lock/unlock | Not supported | Supported | 
| Deferred locking | Not supported | Supported | 
| Timed locking | Not supported | Supported | 
| Ownership transfer | Not supported | Supported | 
| std::condition_variable support | Cannot be used directly | Required by std::condition_variable | 
| Performance | Lower overhead | Slightly higher overhead | 
| Best suited for | Simple critical sections | Advanced synchronization scenarios |
