quickSorting(List<int> arr) {
  if (arr.length <= 1) return arr;
  int pivot = arr[arr.length ~/ 2]; // Choose the pivot element
  List<int> left = [];
  List<int> right = []; // Elements greater than pivot
  for (int i = 0; i < arr.length; i++) {
    if (arr[i] < pivot) {
      left.add(arr[i]);
    } else if (arr[i] > pivot) {
      right.add(arr[i]);
    }
  }
  return [...quickSorting(left), pivot, ...quickSorting(right)];
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6];
  List<int> sortedArr = quickSorting(arr);
  print("Sorted array: $sortedArr");
}
