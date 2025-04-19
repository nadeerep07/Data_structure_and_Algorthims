class QueueUsingStack {
  List<int> stack1 = [];
  List<int> stack2 = [];

  enqueue(int val) {
    stack1.add(val);
  }

  dequeue() {
    if (stack1.isEmpty) {
      return null;
    }
    while (stack1.length > 1) {
      stack2.add(stack1.removeLast());
    }
    int val = stack1.removeLast();
    stack1 = stack2.reversed.toList();
    stack2 = [];
    return val;
  }

  display() {
    for (int i = 0; i < stack1.length; i++) {
      print(stack1[i]);
    }
  }
}

void main() {
  var q = QueueUsingStack();
  q.enqueue(10);
  q.enqueue(30);
  q.enqueue(40);
  q.dequeue();
  q.display();
}
