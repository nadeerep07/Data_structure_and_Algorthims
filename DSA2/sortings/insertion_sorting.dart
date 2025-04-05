// insertionSorting(List<int> arr) {
//   int n = arr.length;
//   for (int i = 1; i < n; i++) {
//     int key = arr[i];
//     int j = i - 1;
//     while (j >= 0 && arr[j] > key) {
//       arr[j + 1] = arr[j];
//       j--;
//     }
//     arr[j + 1] = key;
//   }
//   return arr;
// }
insertionSorting(List<int> arr) {
  for (int i = 1; i < arr.length; i++) {
    int key = arr[i];
    int j = i - 1;
    while (j >= 0 && arr[j] > key) {
      arr[j + 1] = arr[j];
      j--;
    }
    arr[j + 1] = key;
  }
  return arr;
}

// Sorting Algorithms:

// Algorithm	              Best	           Average                    Worst	                 Space
// Bubble Sort     	        O(n)      	    O(n²)                       O(n²)	                 O(1)
// Selection Sort         	O(n²)          	O(n²)	                      O(n²)	                 O(1)
// Insertion Sort		        O(n)            O(n²)	                      O(n²)	                 O(1)
// Merge Sort	             	O(n log n)      O(n log n)                	O(n log n)             O(n)
// Quick Sort		            O(n log n)      O(n log n)	                O(n²)               	 O(log n)
// Heap Sort	              O(n log n)	    O(n log n)	                O(n log n)             O(1)

void mian() {
  List<int> arr = [12, 11, 13, 5, 6];
  insertionSorting(arr);
  print("Sorted array: $arr");
}
