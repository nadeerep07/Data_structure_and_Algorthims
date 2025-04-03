bubbleSorting(List<int> arr) {
  int n = arr.length;
  for (int i = 0; i < n - 1; i++) {
    for (int j = i + 1; j < n - 1; j++) {
      if (arr[j] < arr[i]) {
        int temp = arr[i];
        arr[i] = arr[j];
        arr[j] = temp;
      }
    }
  }
  return arr;
}

void main() {
  print(
    bubbleSorting([64, 34, 25, 12, 22, 11, 90]),
  ); // Output: Sorted array: [11, 12, 22, 25, 34, 64, 90]
}
