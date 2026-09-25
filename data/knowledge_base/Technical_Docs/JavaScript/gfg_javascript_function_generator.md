# JavaScript Function Generator

> Source: https://www.geeksforgeeks.org/javascript/javascript-function-generator/

A generator function is a special kind of function that can pause its execution and resume later. It is defined using the function* syntax and controls execution using the yield keyword.
- Generator functions return an iterator object.
- The yield keyword pauses execution and returns a value.
- Execution resumes from the last yield when the generator is called again.
function* generate() {
    yield 'Hello';
    yield 'World';
    return 'Done';
}
const generator = generate();
//Driver Code Starts
console.log(generator.next());
console.log(generator.next()); 
console.log(generator.next());
console.log(generator.next()); 
//Driver Code Ends
- The next() method is used to resume execution and retrieve the next value.
- The done property indicates whether the generator has finished executing.
Syntax
function* generatorFunction() {    
// Code that can yield multiple values
}
Working of Generators
Generators work by implementing the iterator protocol. When a generator function is called, it does not execute its body immediately. Instead, it returns a special iterator object called a generator object. This object can be used to control the execution of the generator.
1. Execution Control: The next() method resumes execution of the generator function until the next yield is encountered. It returns an object with two properties:
- value: The yielded value.
- done: A boolean indicating if the generator has completed execution.
2. State Preservation: Each call to next() resumes the function from where it was last paused, retaining the function’s state.
3. Termination: When the generator completes execution, the done property of the returned object becomes true.
function* example() {
    console.log("Step 1");
    yield 1;
    console.log("Step 2");
    yield 2;
    console.log("Step 3");
    return 3;
}
const gen = example();
//Driver Code Starts
console.log(gen.next());
console.log(gen.next());
console.log(gen.next());
//Driver Code Ends
Features of Generators
- Pause and Resume: Generators allow pausing function execution using yield and resuming it with the next() method.
- Iterable Interface: They return an iterator that conforms to the iterable protocol.
- Asynchronous Support: Ideal for working with asynchronous tasks using for-await-of loops.
Use Cases for Generators
Here are some use cases:
1. Custom Iterators
Generators simplify the creation of custom iterators, making it easy to generate sequences of values.
function* fibonacci(limit) {
    let [prev, current] = [0, 1];
    while (limit--) {
        yield current;
        [prev, current] = [current, prev + current];
    }
}
const fib = fibonacci(5);
console.log([...fib]); 
- The function fibonacci is a generator function defined with function*.
- The generator starts with two variables prev and current, initialized to 0 and 1 (the first two Fibonacci numbers).
- The while (limit--) loop runs until the limit is exhausted, yielding the current Fibonacci number each time.
- The values of prev and current are updated after each yield to produce the next Fibonacci number.
2. Asynchronous Programming
Generators, in combination with libraries like co or with async/await syntax, help manage asynchronous flows.
function* asyncTask() {
    console.log('Task 1');
    yield new Promise(resolve =>
        setTimeout(() =>
            resolve('Task 2'), 1000));
    console.log('Task 3');
}
const task = asyncTask();
task.next().value.then(console.log);
task.next(); 
- The generator asyncTask first logs 'Task 1'.
- It then yields a Promise that resolves with 'Task 2' after 1 second.
- After the Promise resolves, 'Task 3' is logged.
3. Infinite Sequences
Generators can create infinite sequences that only compute values on demand.
function* infiniteSeq() {
    let i = 0;
    while (true) {
        yield i++;
    }
}
const sequence = infiniteSeq();
console.log(sequence.next().value); 
//Driver Code Starts
console.log(sequence.next().value); 
console.log(sequence.next().value); 
//Driver Code Ends
- The infiniteSeq generator creates an infinite sequence starting from 0.
- Each time next() is called, it yields the current value of i and then increments it (i++).
- The loop is infinite because of while (true), so it keeps generating numbers indefinitely.
Advantages of Generator Functions
- Lazy Evaluation: Values are computed only when needed, improving performance for large or infinite sequences.
- Readable Asynchronous Code: Generators can make asynchronous workflows look synchronous, simplifying complex code.
- Modularity: Encapsulate logic for producing sequences or iterating over data within a generator.
- Customizable Iterators: Generators allow creating iterators without implementing the entire iterable protocol manually.
Limitations of Generator Functions
- Complexity: Understanding and debugging generator-based code can be challenging for beginners.
- Not Fully Asynchronous: While useful, generators alone are not a replacement for promises or async/await in handling asynchronous programming.
