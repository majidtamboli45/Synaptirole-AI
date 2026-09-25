# Sorting Algorithms in JavaScript

> Source: https://www.geeksforgeeks.org/javascript/sorting-algorithms-in-javascript/

Sorting is an important operation in computer science that arranges elements of an array or list in a certain order (either ascending or descending).
Example
//Sort in JavaScript
let arr = [25, 12, 22, 11];
for (let i = 0; i < arr.length - 1; i++) {
    for (let j = 0; j < arr.length - i - 1; j++) {
        if (arr[j] > arr[j + 1]) {
            // Swap elements
            let temp = arr[j];
            arr[j] = arr[j + 1];
            arr[j + 1] = temp;
        }
    }
}
console.log("Sorted Array:", arr);
Types of Sorting
Bubble Sort
Bubble Sort is one of the simplest sorting algorithms. It repeatedly compares adjacent elements and swaps them if they are in the wrong order.
// JavaScript Program for Bubble Sort
function bubbleSort(arr, n) {
    let swapped = false;
    for(let i = 0;i < n; i++){
        swapped = false;
        for(let j = 0 ; j < n - i -1; j++){
            if( arr[j] > arr[j+1]){
                [arr[j], arr[j+1]] = [arr[j+1], arr[j]];
                swapped = true;
            }
        }
        
        if( swapped === false) break;
    }
    return arr;
}
let a = [2, 1, 3, 4];
a = bubbleSort(a, 4);
console.log(a);
Time Complexity: O(n2)
Auxiliary Space: O(1)
Selection Sort
Selection Sort is a simple comparison-based algorithm. It divides the array into two parts: sorted and unsorted. In each iteration, it selects the smallest (or largest) element from the unsorted part and moves it to the sorted part. It is in place algorithm.
Notes: Selection sort it does less memory write compared to other Algorithm but Cycle sort is Optimal in terms of memory Writes.
// JavaScript Program for selectionSort
function selectionSort(arr) {
    let n = arr.length;
    for (let i = 0; i < n - 1; i++) {
        let minIndex = i;
        for (let j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIndex]) {
                minIndex = j;
            }
        }
        // Swap arr[i] and arr[minIndex]
        let temp = arr[i];
        arr[i] = arr[minIndex];
        arr[minIndex] = temp;
    }
    return arr;
}
let arr = [64, 25, 12, 22, 11];
console.log(selectionSort(arr));
Time Complexity: O(n2)
Auxiliary Space: O(1)
Insertion Sort
Insertion Sort is a simple and stable sorting algorithm that builds the final sorted array one element at a time. It works by iterating through the array and inserting each element into its correct position in the already sorted portion of the array.
Characteristics of Insertion Sort:
- This algorithm is one of the simplest algorithm with simple implementation
- Basically, Insertion sort is efficient for small data values
- Insertion sort is adaptive in nature, i.e. it is appropriate for data sets which are already partially sorted.
// JavaScript Program for InsertionsSort
function insertionSort(arr) {
    let n = arr.length;
    for (let i = 1; i < n; i++) {
        let key = arr[i];
        let j = i - 1;
        while (j >= 0 && arr[j] > key) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
    return arr;
}
// Example usage:
let arr = [12, 11, 13, 5, 6];
console.log(insertionSort(arr));
Time Complexity: O(n2)
Auxiliary Space: O(1)
Merge Sort
Merge Sort is a divide-and-conquer algorithm. It divides the array into two halves, recursively sorts them, and merges the sorted halves.
// JavaScript Program for Merge Sort
function mergeSort(arr) {
    if (arr.length <= 1) {
        return arr;
    }
    const mid = Math.floor(arr.length / 2);
    const left = mergeSort(arr.slice(0, mid));
    const right = mergeSort(arr.slice(mid));
    return merge(left, right);
}
function merge(left, right) {
    let result = [];
    let i = 0;
    let j = 0;
    while (i < left.length && j < right.length) {
        if (left[i] < right[j]) {
            result.push(left[i]);
            i++;
        } else {
            result.push(right[j]);
            j++;
        }
    }
    return result.concat(left.slice(i), right.slice(j));
}
// Example usage
let arr = [38, 27, 43, 3, 9, 82, 10];
console.log(mergeSort(arr)); 
Time Complexity: O(n log n)
Auxiliary  Space: O(n)
Quick Sort Using Lomuto
Quick Sort is another divide-and-conquer algorithm. It works by selecting a 'pivot' element from the array and partitioning the other elements into two sub-arrays, according to whether they are less than or greater than the pivot.
Lomuto Partition :
- In Lomuto Partition, the last element is chosen as the pivot.
- It maintains two pointers: one for smaller elements and another for iterating through the array.
- Lomuto Partition is less efficient than Hoare's Partition because it performs more swaps and handles repeated elements poorly.
Hoare's Partition :
- In Hoare's Partition, the first element is chosen as the pivot.
- It uses two pointers starting from both ends of the array and moves them toward each other.
- Hoare's Partition generally provides better performance, especially with repeated elements, but it is slightly harder to implement.
function quickSort(arr, low = 0, high = arr.length - 1) {
    if (low < high) {
        let pivot = arr[high];
        let i = low - 1;
        for (let j = low; j < high; j++) {
            if (arr[j] < pivot) {
                i++;
                [arr[i], arr[j]] = [arr[j], arr[i]];
            }
        }
        [arr[i + 1], arr[high]] = [arr[high], arr[i + 1]];
        let pi = i + 1;
        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
    return arr;
}
// Example usage:
let arr = [10, 7, 8, 9, 1, 5];
console.log(quickSort(arr));
Time complexity: O(n log n), but in worst case it takes O(n2) time.
Auxiliary Space: O(log n)
