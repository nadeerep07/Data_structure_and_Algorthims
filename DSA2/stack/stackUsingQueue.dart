void main() {
  var st = StackUsingQueue();
  st.push(10);
  st.push(20);
  st.push(30);
  st.pop();
  st.display();
}

class StackUsingQueue {
  var queue1 = <int>[];
  var queue2 = <int>[];

  void push(int value) {
    queue1.add(value);
  }

  // int? pop() {
  //   if (queue1.isEmpty) {
  //     return null;
  //   }

  //   while (queue1.length > 1) {
  //     queue2.add(queue1.removeAt(0));
  //   }

  //   int val = queue1.removeAt(0);

  //   queue1 = queue2;
  //   queue2 = [];

  //   return val;
  // }

  pop() {
    if (queue1.isEmpty) return null;
    while (queue1.length > 1) {
      queue2.add(queue1.removeAt(0));
    }
    int val = queue1.removeAt(0);
    queue1 = queue2;
    queue2 = [];
    return val;
  }

  display() {
    for (int i = 0; i < queue1.length; i++) {
      print(queue1[i]);
    }
  }
}
