import 'dart:io';

class Node {
  var data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class DlinkedList {
  Node? head;
  Node? tail;

  bool get isEmpty => head == null;

  add(var value) {
    var newNode = Node(value);
    if (isEmpty) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  insertAt(int index, var value) {
    var newNode = Node(value);
    var temp = head;
    if (index == 0) {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    } else {
      for (var i = 0; i < index - 1; i++) {
        temp = temp!.next;
      }
      newNode.next = temp!.next;
      newNode.prev = temp;
      temp.next!.prev = newNode;
      temp.next = newNode;

    }
  }

  prinList() {
    var temp = head;
    while (temp != null) {
      stdout.write(temp.data);
      temp = temp.next;
    }
  }

  miidleNode() {
    var slow = head;
    var fast = head;
    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    stdout.write(slow!.data);
  }
}

void main() {
  DlinkedList dList = DlinkedList();
  dList.add(5);
  dList.add(10);
  dList.add(15);
  dList.prinList();
  print('\n');
  dList.miidleNode();
  print('\n');
  dList.prinList();
}
