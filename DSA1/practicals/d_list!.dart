import 'dart:io';

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class Dlist {
  Node? head;

  add(var value) {
    var newNode = Node(value);
    if (head == null) {
      head = newNode;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  insertAt(int index, int val) {
    var newNode = Node(val);
    if (head == 0) {
      newNode.next = head;
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

  miidle() {
    var slow = head;
    var fast = head;
    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    print(slow!.data);
  }

  prrintList() {
    var current = head;
    while (current != null) {
      stdout.write('${current.data} ->');
      current = current.next;
    }
  }
}

void main() {
  Dlist ll = Dlist();
  ll.add(10);
  ll.add(20);
  ll.insertAt(1, 15);
  ll.miidle();
  ll.prrintList();
}
