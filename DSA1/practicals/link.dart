import 'dart:io';

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class LinkedList {
  Node? head;

  addFirst(var val) {
    var newNode = Node(val);
    if (head == null) {
      head = newNode;
      return;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  addEnt(var val) {
    var newNode = Node(val);
    if (head == null) {
      addFirst(val);
      return;
    }
    var current = head;
    while (current!.next != null) {
      current = current.next;
    }
    current.next = newNode;
  }

  insertAt(int index, int val) {
    if (index == 0) {
      addFirst(val);
    }
    var newNode = Node(val);
    var current = head;
    for (int i = 0; i < index - 1; i++) {
      current = current!.next;
    }
    newNode.next = current!.next;
    current.next = newNode;
  }

  deleteFirst() {
    head = head!.next;
  }

  void printreverse(Node? head) {
    if (head == null) return;
    printreverse(head.next);
    stdout.write(head.data);
  }

  deleteLast() {
    var current = head;
    if (current!.next == null) {
      head = null;
    } else {
      while (current!.next!.next != null) {
        current = current.next;
      }
      current.next = null;
    }
  }

  addFirst1(var val) {
    var newNode = Node(val);
    if (head == null) {
      head = newNode;
      return;
    } else {
      newNode.next = head;
      head = newNode;
    }
  }

  addLAst(var val) {
    var newNode = Node(val);
    if (head == null) {
      head = newNode;
      return;
    } else {
      var current = head;
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  void removeDuplicates() {
    if (head == null) return;

    Set<int> seen = {};
    Node? current = head;
    seen.add(current!.data);

    while (current!.next != null) {
      if (seen.contains(current.next!.data)) {
        current.next = current.next!.next; // Skip duplicate
      } else {
        seen.add(current.next!.data);
        current = current.next;
      }
    }
  }

  printl() {
    var current = head;
    while (current != null) {
      stdout.write('${current.data}->');
      current = current.next;
    }
  }
}

void main() {
  LinkedList ll = LinkedList();
  ll.addFirst(2);
  ll.addFirst(1);
  ll.addEnt(10);
  ll.addEnt(20);
  ll.addEnt(30);
  ll.addEnt(40);
  ll.addEnt(40);
  // ll.insertAt(2, 30);

  // ll.deleteFirst();
  // ll.addLAst(30);
  // ll.deleteLast();
  ll.printl();
  ll.printreverse(ll.head);
}
