import 'dart:io';

class Node<T> {
  T data;
  Node<T>? next;
  Node(this.data);
}

class Stack<T> {
  Node<T>? head;

  void push(T value) {
    var newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  pop() {
    if (head == null) {
      return null;
    }
    var poppedValue = head!.data;
    head = head!.next;
    return poppedValue;
  }

  void peek() {
    if (head == null) {
      print('Empty stack');
      return;
    } else {
      print(head!.data);
    }
  }

  void display() {
    var current = head;
    while (current != null) {
      stdout.write(current.data);
      current = current.next;
    }
  }

  reverseStack() {
    var tempStack = Stack();
    while (head != null) {
      var poppedValue = pop();
      if (poppedValue != null) {
        tempStack.push(poppedValue);
      }
    }
    return tempStack;
  }

  reverseString(str) {
    for (int i = 0; i < str.length; i++) {
      push(str[i]);
    }
    var reversed = '';
    while (head != null) {
      reversed += pop();
    }
    print(reversed);
  }

  insertBottom(T val) {
    if (head == null) {
      push(val);
      return;
    }
    T? temp = pop();
    insertBottom(val);
    push(temp!);
  }

  reverseStackrec() {
    if (head == null) return;
    T? top = pop();
    reverseStackrec();
    insertBottom(top!);
  }

  reverseStrings(str) {
    for (int i = 0; i < str.length; i++) {
      push(str[i]);
    }
    var reversed = '';
    while (head != null) {
      reversed += pop();
    }
    print(reversed);
  }
}

void main() {
  var st = Stack<int>();
  // st.push(10);
  // st.push(20);
  // st.push(30);
  // st.pop();
  // print("Original Stack:");
  // st.display();

  // print("\nConverting to Queue:");
  // Stack queue = st.stackToQueue();
  // queue.display();
  st.reverseString('hello how are you'); // Should print elements in FIFO order
}
