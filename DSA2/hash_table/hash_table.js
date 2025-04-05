import 'dart:io';

class Node {
  int data;
  Node? next;
  Node(this.data);
}

class HashTable {
  List<Node?> table;
  int size;

  HashTable(this.size) : table = List<Node?>.filled(size, null);

  int hash(int key) {
    return key % size;
  }

  void insert(int key, int value) {
    int index = hash(key);
    
    Node newNode = Node(value);
    if (table[index] == null) {
      table[index] = newNode;
    } else {
      Node? current = table[index];
      while (current!.next != null) {
        current = current.next;
      }
      current.next = newNode;
    }
  }

  remove(int key) {
    int index = hash(key);
    Node? current = table[index];
    Node? prev = null;

    while (current != null && current.data != key) {
      prev = current;
      current = current.next;
    }

    if (current == null) {
      print('Key not found');
      return;
    }

    if (prev == null) {
      table[index] = current.next;
    } else {
      prev.next = current.next;
    }
  }

  search(int key) {
    int index = hash(key);
    Node? current = table[index];

    while (current != null) {
      if (current.data == key) {
        print('Key found: $key');
        return;
      }
      current = current.next;
    }
    print('Key not found: $key');
  }

  update(int key, int newValue) {
    int index = hash(key);
    Node? current = table[index];

    while (current != null) {
      if (current.data == key) {
        current.data = newValue;
        print('Key updated: $key to $newValue');
        return;
      }
      current = current.next;
    }
    print('Key not found: $key');
  }

  bool containsKey(int key) {
    int index = hash(key);
    Node? current = table[index];

    while (current != null) {
      if (current.data == key) {
        return true;
      }
      current = current.next;
    }
    return false;
  }

  int get(int key) {
    int index = hash(key);
    Node? current = table[index];

    while (current != null) {
      if (current.data == key) {
        return current.data;
      }
      current = current.next;
    }
    throw Exception('Key not found: $key');
  }

  void clear() {
    for (int i = 0; i < size; i++) {
      table[i] = null;
    }
  }

  void display() {
    for (int i = 0; i < size; i++) {
      stdout.write('Index $i: ');
      Node? current = table[i];
      while (current != null) {
        stdout.write('${current.data} -> ');
        current = current.next;
      }
      print('null');
    }
  }
}

void main() {
  HashTable ht = HashTable(10);
  ht.insert(1, 10);
  ht.insert(2, 20);
  ht.insert(11, 30);
  ht.insert(12, 40);
  // ht.get(2);
  ht.update(2, 25);
  ht.remove(11);
  ht.search(1);
  ht.search(11);

  ht.display();
}
