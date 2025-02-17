// Bhumika Basnet
// CSCI330
// 02/17/2025

#include <iostream>
#include <vector>
#include <stack>
#include <assert.h>

using namespace std;

/// @brief Partitions the array around a pivot element and returns its correct position.
/// @param arr The array to be partitioned.
/// @param low The starting index of the partition.
/// @param high The ending index of the partition.
/// @return The index of the pivot after partitioning.
int partition(std::vector<int>& arr, int low, int high) {
    int pivot = arr[high];  // Selecting the last element as the pivot
    int i = low - 1;        // Pointer for the smaller element

    // Traverse the array and swap elements smaller than the pivot to the left side
    for (int j = low; j < high; ++j) {
        if (arr[j] <= pivot) {
            ++i;
            swap(arr[i], arr[j]);
        }
    }

    // Place the pivot in its correct sorted position
    swap(arr[i + 1], arr[high]);
    return i + 1;  // Return the pivot index
}

/// @brief Iterative implementation of the Quicksort algorithm using a stack.
/// @param arr The array to be sorted.
void quicksort(vector<int>& arr) {
    if (arr.empty()) return;  // Edge case: If the array is empty, do nothing.

    stack<pair<int, int>> stack;  // Stack to store (low, high) index pairs

    // Push the initial range of the array onto the stack
    stack.push({0, arr.size() - 1});

    // Continue processing until there are elements in the stack
    while (!stack.empty()) {
        int low = stack.top().first;
        int high = stack.top().second;
        stack.pop();  // Remove the top element

        // Partition the array and get the pivot index
        int pivotIndex = partition(arr, low, high);

        // If there are elements on the left side of the pivot, push that range to the stack
        if (pivotIndex - 1 > low) {
            stack.push({low, pivotIndex - 1});
        }

        // If there are elements on the right side of the pivot, push that range to the stack
        if (pivotIndex + 1 < high) {
            stack.push({pivotIndex + 1, high});
        }
    }
}

// Main function to test the quicksort function with various test cases
int main() {
    // Test case 1: Unsorted array with duplicates
    vector<int> test1{1, 3, 3, 10, 11, 4, 5};
    vector<int> expected1{1, 3, 3, 4, 5, 10, 11};
    quicksort(test1);
    assert(test1 == expected1);

    // Test case 2: Random order of numbers
    vector<int> test2{9, 7, 5, 11, 2, 4, 6};
    vector<int> expected2{2, 4, 5, 6, 7, 9, 11};  // Fixing expected output
    quicksort(test2);
    assert(test2 == expected2);

    // Test case 3: All identical elements
    vector<int> test3{5, 5, 5, 5, 5, 5, 5};
    vector<int> expected3{5, 5, 5, 5, 5, 5, 5};
    quicksort(test3);
    assert(test3 == expected3);

    // Test case 4: Reverse sorted array
    vector<int> test4{10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
    vector<int> expected4{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    quicksort(test4);
    assert(test4 == expected4);

    // Test case 5: Single element
    vector<int> test5{1};
    vector<int> expected5{1};
    quicksort(test5);
    assert(test5 == expected5);

    cout << "Passed all test cases successfully!" << endl;
    return 0;
}

