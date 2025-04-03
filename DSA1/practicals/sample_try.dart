import 'dart:io';

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;

  add(var val) {
    var newNode = Node(val);
    if (head == null) {
      head = newNode;
      return;
    }
    var current = head;
    while (current!.next != null) {
      current = current.next;
    }
    current.next = newNode;
  }

  insertAt(int index, int val) {
    var newNode = Node(val);
    if (index == 0) {
      head = newNode;
    } else {
      var current = head;
      for (int i = 0; i < index - 1; i++) {
        current = current!.next;
      }
      newNode.next = current!.next;
      current.next = newNode;
    }
  }

  prin() {
    var current = head;
    while (current != null) {
      stdout.write(current.data);
      current = current.next;
    }
  }
}

void main() {
  LinkedList ll = LinkedList();
  ll.add(1);
  ll.add(2);
  ll.insertAt(1, 6);
  ll.prin();
}

sumofdigits(int n) {
  if (n == 0) return 0;
  return sumofdigits(n ~/ 10) + n % 10;
}

sumofArray(List<int> arr, int n) {
  if (n >= arr.length) return 0;
  return sumofArray(arr, n + 1) + arr[n];
}
