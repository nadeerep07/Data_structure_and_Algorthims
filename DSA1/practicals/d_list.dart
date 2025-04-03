// import 'dart:io';

// class Node {
//   var data;
//   Node? next;
//   Node? prev;
//   Node(this.data);
// }

// class DlinkedList {
//   Node? head;
//   Node? tail;

//   bool get isEmpty => head == null;

//   add(var value) {
//     var newNode = Node(value);
//     if (isEmpty) {
//       head = newNode;
//       tail = newNode;
//     } else {
//       tail!.next = newNode;
//       newNode.prev = tail;
//       tail = newNode;
//     }
//   }

//   addFirst(var value) {
//     var newNode = Node(value);
//     if (isEmpty) {
//       head = newNode;
//       tail = newNode;
//     } else {
//       newNode.next = head;
//       head!.prev = newNode;
//       head = newNode;
//     }
//   }

//   deleteFirst() {
//     if (head == null) {
//       return;
//     }

//     head = head!.next;
//     head!.prev = null;
//   }

//   insertAt(int index, var value) {
//     var newNode = Node(value);
//     var temp = head;
//     if (index == 0) {
//       newNode.next = head;
//       head!.prev = newNode;
//       head = newNode;
//     } else {
//       for (var i = 0; i < index - 1; i++) {
//         temp = temp!.next;
//       }
//       newNode.next = temp!.next;
//       newNode.prev = temp;
//       temp.next!.prev = newNode;
//       temp.next = newNode;
//     }
//   }

//   deleteVal(int val) {
//     var current = head;
//     if (current!.data == val) {
//       head = current.next;
//       head!.prev = null;
//     } else {
//       while (current!.next != null) {
//         if (current.next!.data == val) {
//           current.next = current.next!.next;
//           current.next!.prev = current;
//           break;
//         }
//         current = current.next;
//       }
//     }
//   }

//   deleteAt(int index) {
//     var current = head;
//     if (index == 0) {
//       head = head!.next;
//       head!.prev = null;
//     } else {
//       for (var i = 0; i < index - 1; i++) {
//         current = current!.next;
//       }
//       current!.next = current.next!.next;
//       current.next!.prev = current;
//     }
//   }

//   findMiddle() {
//     var slow = head;
//     var fast = head;
//     while (fast != null && fast.next != null) {
//       slow = slow!.next;
//       fast = fast.next!.next;
//     }
//     print(slow!.data);
//   }

//   prinList() {
//     var temp = head;
//     while (temp != null) {
//       stdout.write('${temp.data}->');
//       temp = temp.next;
//     }
//   }
// }

// void main() {
//   var list = DlinkedList();
//   list.add(1);
//   list.add(2);
//   list.add(3);
//   list.add(4);
//   list.add(5);
//   list.addFirst(0);
//   list.insertAt(3, 2);
//   list.deleteAt(3);
//   list.findMiddle();
//   list.deleteFirst();
//   list.prinList();
// }

class Node {
  int data;
  Node? next;
  Node? prev;
  Node(this.data);
}

class DlinkedList {
  Node? head;
  Node? tail;

  addFirst(var val) {
    var newNode = Node(val);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      newNode.next = head;
      head!.prev = newNode;
      head = newNode;
    }
  }

  add(var val) {
    var newNode = Node(val);
    if (head == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      newNode.prev = tail;
      tail = newNode;
    }
  }

  deleteNode(int val) {
    var current = head;
    if (current!.data == val) {
      head = current.next;
      head!.prev = null;
    } else {
      while (current!.next != null) {
        if (current.next!.data == val) {
          current.next = current.next!.next;
          current.next!.prev = current;
          break;
        }
        current = current.next;
      }
    }
  }

  reverseList(){
    Node? prev = null;
    Node? current = head;
    Node? next;
    while(current != null){
      next = current.next;
      current.next = prev;
      prev = current;
      current = next;
    }
    head = prev;

    
  }

  deleteMiddle() {
    var slow = head;
    var fast = head;
    while (fast != null && fast.next != null) {
      slow = slow!.next;
      fast = fast.next!.next;
    }
    slow!.prev!.next = slow.next;
    slow.next!.prev = slow.prev;
  }

  addAt(int index, var val) {
    var newNode = Node(val);
    var current = head;
    if (index == 0) {
      addFirst(val);
    } else {
      for (var i = 0; i < index - 1; i++) {
        current = current!.next;
      }
      newNode.next = current!.next;
      newNode.prev = current;
      current.next!.prev = newNode;
      current.next = newNode;
    }
  }

  printList() {
    var current = head;
    var result = '';
    while (current != null) {
      result += current.data.toString() + ' -> ';
      current = current.next;
    }
    result += 'null';
    print(result);
  }
}

void main() {
  DlinkedList ll = DlinkedList();
  ll.addFirst(10);
  ll.addFirst(30);
  ll.add(20);
  ll.printList();
}
