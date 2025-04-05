import 'dart:io';

import '../stack/stacking.dart';

class Node<T> {
  T data;
  Node<T>? next;
  Node(this.data);
}

class Queue<T> {
  Node? head;
  Node? tail;

  void enqueue(T value) {
    var newNode = Node(value);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
  }

  int? dequeue() {
    if (head == null) {
      return null; // Queue is empty
    }
    var dequeuedValue = head!.data;
    head = head!.next;
    if (head == null) {
      tail = null; // Queue is now empty
    }
    return dequeuedValue;
  }

  display() {
    var current = head;
    while (current != null) {
      stdout.write(current.data);
      current = current.next;
    }
  }

  queueToStack() {
    var tempStack = Stack();
    while (head != null) {
      var dequeuedValue = dequeue();
      if (dequeuedValue != null) {
        tempStack.push(dequeuedValue);
      }
    }
    return tempStack;
  }
}

void main() {
  var queue = Queue<int>();
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(30);
  queue.display();
  print('\n');
  // print('Dequeued: ${queue.dequeue()}');
  // queue.display();
  Stack stack = queue.queueToStack();
  stack.display();
}
