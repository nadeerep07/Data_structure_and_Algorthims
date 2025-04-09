class Heap {
  List<int> heap = [];

  insert(var val) {
    heap.add(val);
    var index = heap.length - 1;
    while (index > 0) {
      int parent = (index - 1) ~/ 2;
      if (heap[parent] < heap[index]) {
        int temp = heap[parent];
        heap[parent] = heap[index];
        heap[index] = temp;

        index = parent;
      } else {
        break;
      }
    }
  }

  remove() {
    if (heap.isEmpty) return null;
    if (heap.length == 1) return heap.removeLast();
    int root = heap[0];
    heap[0] = heap.removeLast();
    heapify();
    return root;
  }

  heapify() {
    int index = 0;

    while (true) {
      int left = (2 * index) + 1;
      int right = (2 * index) + 2;
      int largest = index;
      if (left < heap.length && heap[left] > heap[largest]) {
        largest = left;
      }
      if (right < heap.length && heap[right] > heap[largest]) {
        largest = right;
      }
      if (index != largest) {
        _swap(index, largest);
        index = largest;
      } else {
        break;
      }
    }
  }

  _swap(int i, int j) {
    int temp = heap[i];
    heap[i] = heap[j];
    heap[j] = temp;
  }

  display() {
    print(heap);
  }
}

void main() {
  var hp = Heap();
  hp.insert(10);
  hp.insert(20);
  hp.insert(30);
  hp.insert(40);
  hp.remove();

  hp.display();
}
