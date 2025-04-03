// import 'dart:io';

// class Node {
//   int data;
//   Node? next;
//   Node(this.data);
// }

// class LinkedList {
//   Node? head;
//   Node? tail;
//   bool get isEmty => head == null;

//   add(var value) {
//     var newNode = Node(value);
//     if (isEmty) {
//       head = newNode;
//       tail = newNode;
//     } else {
//       tail!.next = newNode;
//       tail = newNode;
//     }
//   }

//   addEnd(var value) {
//     if (isEmty) {
//       add(value);
//       return;
//     } else {
//       tail?.next = Node(value);
//       tail = tail?.next;
//     }
//   }

//   void reverse() {
//     Node? prev = null;
//     Node? current = head;

//     while (current != null) {
//       Node? next = current.next;
//       current.next = prev;
//       prev = current;
//       current = next;
//     }

//     tail = head;
//     head = prev;
//   }

//   insertAt(int index, var value) {
//     if (index == 0) {
//       var newNode = Node(value);
//       newNode.next = head;
//       head = newNode;
//     } else {
//       var temp = head;
//       for (var i = 0; i < index - 1; i++) {
//         temp = temp!.next;
//       }
//       var newNode = Node(value);
//       newNode.next = temp!.next;
//       temp.next = newNode;
//     }
//   }

//   middleNode() {
//     Node? slow = head;
//     Node? fast = head;

//     if (head != null) {
//       while (fast != null && fast.next != null) {
//         fast = fast.next!.next;
//         slow = slow!.next;
//       }
//       print('The middle element is ${slow!.data}');
//     }
//   }

//   removeAt(int index) {
//     if (index == 0) {
//       head = head!.next;
//     } else {
//       var temp = head;
//       for (var i = 0; i < index - 1; i++) {
//         temp = temp!.next;
//       }
//       temp!.next = temp.next!.next;
//     }
//   }

//   printList() {
//     var temp = head;
//     while (temp != null) {
//       stdout.write(temp.data);
//       temp = temp.next;
//     }
//   }
// }

// void main() {
//   LinkedList list = LinkedList();

//   list.add(1);
//   list.add(2);
//   list.add(3);
//   list.add(4);
//   list.add(5);
//   list.add(6);
//   list.add(7);
//   list.printList();

//   print('\n');
//   list.middleNode();
//   list.removeAt(3);
//   list.reverse();
//   list.printList();
// }

import 'dart:io';

class Node {
  var data;
  Node? next;
  Node(this.data);
}

class SlinkedList {
  Node? head;
  Node? tail;

  bool get isEmpty => head == null;

  addFirst(var val) {
    var newNode = Node(val);
    newNode.next = head;
    head = newNode;
  }

  add(var value) {
    var newNode = Node(value);
    if (isEmpty) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
  }

  reversedList() {
    Node? prev = null;
    Node? current = head;
    Node? next;

    while (current != null) {
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
  }

  printList() {
    var current = head;
    while (current != null) {
      stdout.write(current.data.toString() + ' ');
      current = current.next;
    }
  }

  reves() {
    Node? prev = null;
    Node? current = head;

    while (current != null) {
      Node? next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
  }

  // insertAt(int index, var val) {
  //   if (index == 0) {
  //     var newNode = Node(val);
  //     newNode.next = head;
  //     head = newNode;
  //   } else {
  //     var current = head;
  //     for (var i = 0; i < index - 1; i++) {
  //       current = current!.next;

  //       var newNode = Node(val);
  //       newNode.next = current!.next;
  //     }
  //   }
  // }

  insert(int i, var val) {
    Node newNode = Node(val);

    if (i == 0) {
      addFirst(val);
    } else {
      var current = head;
      for (int j = 0; j < i - 1; j++) {
        current = current!.next;
      }
      newNode.next = current!.next;
      current.next = newNode;
    }
  }
}

void main() {
  SlinkedList list = SlinkedList();
  list.add(1);
  list.add(2);
  list.add(3);
  list.addFirst(10);
  list.insert(2, 55);
  list.printList();
}
