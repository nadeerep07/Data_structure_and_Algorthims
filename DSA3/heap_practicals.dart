class MinHeap {
  List<int> heap = [];

  insert(var val) {
    heap.add(val);
    heapifyUp(heap.length - 1);
  }

  heapifyUp(int index) {
    int parent = (index - 1) ~/ 2;
    if (index > 0 && heap[index] < heap[parent]) {
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
    if (heap.length == 1) return heap.removeLast();
    int root = heap[0];
    heap[0] = heap.removeLast();
    if (heap.isNotEmpty) {
      heapifyDown(0);
    }
    return root;
  }

  heapifyDown(int index) {
    int smallest = index;
    int left = 2 * index + 1;
    int right = 2 * index + 2;

    if (left < heap.length && heap[left] < heap[smallest]) {
      smallest = left;
    }
    if (right < heap.length && heap[right] < heap[smallest]) {
      smallest = right;
    }
    if (smallest != index) {
      _swap(index, smallest);
      heapifyDown(smallest);
    }
  }

  heapSort() {
    List<int> sorted = [];
    while (heap.isNotEmpty) {
      sorted.add(remove());
    }
    return sorted;
  }

  display() {
    print(heap);
  }
}

void main() {
  var hp = MinHeap();
  hp.insert(10);
  hp.insert(9);
  hp.insert(8);
  hp.insert(5);
  hp.insert(7);
  hp.display();
  hp.remove();
  print('\nSorted Heap : ${hp.heapSort()}');
}
