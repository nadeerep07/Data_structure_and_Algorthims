class BuildHeap {
  buildHeap(List<int> arr) {
    var n = arr.length;

    for (int i = (n ~/ 2) - 1; i >= 0; i--) {
      heapify(arr, n, i);
    }
    return arr;
  }

  heapify(List<int> arr, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;

    if (left < n && arr[left] > arr[largest]) {
      largest = left;
    }
    if (right < n && arr[right] > arr[largest]) {
      largest = right;
    }
    if (largest != i) {
      int temp = arr[i];
      arr[i] = arr[largest];
      arr[largest] = temp;
      heapify(arr, n, largest);
    }
  }
}

void main() {
  BuildHeap hp = BuildHeap();
  print(hp.buildHeap([2, 3, 5, 4, 8, 5, 7, 8]));
}
