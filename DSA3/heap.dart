// class MaxHeap {
//   List<int> heap = [];

//   // void heapifyUp(int index) {
//   //   int parent = (index - 1) ~/ 2;
//   //   if (index > 0 && heap[index] > heap[parent]) {
//   //     int temp = heap[index];
//   //     heap[index] = heap[parent];
//   //     heap[parent] = temp;
//   //     heapifyUp(parent);
//   //   }
//   // }

//   // heapifyUp(int index) {
//   //   int parent = (index - 1) ~/ 2;
//   //   if (index > 0 && heap[index] > heap[parent]) {
//   //     _swap(index, parent);
//   //     heapifyUp(parent);
//   //   }
//   // }

//   // heapifyUp(int index) {
//   //   int parent = (index - 1) ~/ 2;
//   //   if (index > 0 && heap[index] > heap[parent]) {
//   //     _swap(index, parent);
//   //      heapifyUp(parent);
//   //   }

//   // }

//   heapifyUp(int index) {
//     int parent = (index - 1) ~/ 2;
//     if (index > 0 && heap[index] > heap[parent]) {
//       _swap(index, parent);
//       heapifyUp(parent);
//     }
//   }

//   // void heapifyDown(int index) {
//   //   int largest = index;
//   //   int left = 2 * index + 1;
//   //   int right = 2 * index + 2;

//   //   if (left < heap.length && heap[left] > heap[largest]) {
//   //     largest = left;
//   //   }

//   //   if (right < heap.length && heap[right] > heap[largest]) {
//   //     largest = right;
//   //   }

//   //   if (largest != index) {
//   //     int temp = heap[index];
//   //     heap[index] = heap[largest];
//   //     heap[largest] = temp;
//   //     heapifyDown(largest);
//   //   }
//   // }

//   // heapifyDown(int index) {
//   //   int largest = index;
//   //   int left = 2 * index + 1;
//   //   int right = 2 * index + 2;
//   //   if (left < heap.length && heap[left] > heap[largest]) {
//   //     largest = left;
//   //   }
//   //   if (right < heap.length && heap[right] > heap[largest]) {
//   //     largest = right;
//   //   }
//   //   if (largest != index) {
//   //     _swap(index, largest);
//   //     heapifyDown(largest);
//   //   }
//   // }

//   heapifyDown(int index) {
//     int largest = index;
//     int left = 2 * index + 1;
//     int right = 2 * index + 2;
//     if (left < heap.length && heap[left] > heap[largest]) {
//       largest = left;
//     }
//     if (right < heap.length && heap[right] > heap[largest]) {
//       largest = right;
//     }
//     if (largest != index) {
//       _swap(index, largest);
//       heapifyDown(largest);
//     }
//   }

//   // void insert(int value) {
//   //   heap.add(value);
//   //   heapifyUp(heap.length - 1);
//   // }

//   insert(int val) {
//     heap.add(val);
//     heapifyUp(heap.length - 1);
//   }

//   // int? remove() {
//   //   if (heap.isEmpty) return null;

//   //   int root = heap[0];
//   //   heap[0] = heap.removeLast();
//   //   if (heap.isNotEmpty) {
//   //     heapifyDown(0);
//   //   }
//   //   return root;
//   // }

//   // remove() {
//   //   if (heap.isEmpty) return null;

//   //   int root = heap[0];
//   //   heap[0] = heap.removeLast();
//   //   if (heap.isNotEmpty) {
//   //     heapifyDown(0);
//   //   }
//   //   return root;
//   // }

//   remove() {
//     if (heap.isEmpty) return null;

//     int root = heap[0];
//     heap[0] = heap.removeLast();
//     if (heap.isEmpty) {
//       heapifyDown(0);
//     }
//     return root;
//   }

//   _swap(int i, int j) {
//     int temp = heap[i];
//     heap[i] = heap[j];
//     heap[j] = temp;
//   }

//   void display() {
//     print(heap);
//   }
// }

import 'dart:io';

class MaxHeap {
  List<int> heap = [];

  insert(int val) {
    heap.add(val);
    heapifyUp(heap.length - 1);
  }

  heapifyUp(int index) {
    int parent = (index - 1) ~/ 2;
    if (index > 0 && heap[index] > heap[parent]) {
      _swap(index, parent);
      heapifyUp(parent);
    }
  }

  _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  remove() {
    if (heap.isEmpty) return null;

    int root = heap[0];
    heap[0] = heap.removeLast();
    if (heap.isNotEmpty) {
      heapifyDown(0);
    }
    return root;
  }

  heapifyDown(int index) {
    int largest = index;
    int left = 2 * index + 1;
    int right = 2 * index + 2;

    if (left < heap.length && heap[left] > heap[largest]) {
      largest = left;
    }

    if (right < heap.length && heap[right] > heap[largest]) {
      largest = right;
    }
  }

  display() {
    stdout.write(heap);
  }
}

void main() {
  MaxHeap heap = MaxHeap();

  List<int> values = [20, 15, 30, 10, 5];
  print("Inserting values: $values");
  for (int value in values) {
    heap.insert(value);
  }

  print("Heap after insertions:");
  heap.display();

  int? removed = heap.remove();
  print("Removed element: $removed");
  print("Heap after first removal:");
  heap.display();

  removed = heap.remove();
  print("Removed element: $removed");
  print("Heap after second removal:");
  heap.display();
}
