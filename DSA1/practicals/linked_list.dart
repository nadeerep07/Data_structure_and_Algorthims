class Node {
  int data;
  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  addFirst(int value) {
    var newNode = Node(value);
    if (head == null) {
      head = newNode;
      return;
    }
    newNode.next = head;
    head = newNode;
  }

  addLast(var val) {
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

  insertAt(int i, int val) {
    var newNode = Node(val);
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

  delete(int val) {
    var current = head;
    if (current!.data == val) {
      head = current.next;
    } else {
      while (current!.next != null) {
        if (current.next!.data == val) {
          current.next = current.next!.next;
          break;
        }
        current = current.next;
      }
    }
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

  deleteFirst() {
    head = head!.next;
  }

  printlist() {
    var current = head;

    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }
}

void main() {
  LinkedList ll = LinkedList();
  ll.addFirst(20);
  ll.addFirst(30);
  ll.addLast(40);
  ll.insertAt(1, 50);
  ll.insertAt(4, 60);
  ll.delete(50);
  ll.deleteLast();
  ll.deleteFirst();
  ll.delete(20);
  ll.printlist();
}
