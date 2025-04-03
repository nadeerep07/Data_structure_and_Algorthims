import 'dart:io';

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class Stack {
  Node? head;

  void push(var value) {
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

  // Convert Stack to Queue using another stack
  Stack stackToQueue() {
    if (head == null) {
      print("Stack is empty");
      return this;
    }

    Stack tempStack = Stack();
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
}

void main() {
  Stack st = Stack();
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
