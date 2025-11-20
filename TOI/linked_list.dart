class Node {
  var data;

  Node? next;

  Node(this.data);
}

class LinkedList {
  Node? head;

  insert(int val) {
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

  display() {
    var current = head;

    while (current != null) {
      print(current.data);
      current = current.next;
    }
  }

  reverese(){
    Node? prev;
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
}

void main() {
  LinkedList sl = LinkedList();

  sl.insert(10);
  sl.insert(1);
  sl.insert(5);
  sl.insert(7);
  sl.insert(21);
  sl.reverese();
  sl.display();
}
