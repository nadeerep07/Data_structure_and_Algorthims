// import 'dart:io';

// class Node {
//   int data;
//   Node? next;
//   Node(this.data);
// }

// class HashTable {
//   List<Node?> table;
//   int size;

//   HashTable(this.size) : table = List<Node?>.filled(size, null);

//   int hash(int key) {
//     return key % size;
//   }

//   void insert(int key, int value) {
//     int index = hash(key);
    
//     Node newNode = Node(value);
//     if (table[index] == null) {
//       table[index] = newNode;
//     } else {
//       Node? current = table[index];
//       while (current!.next != null) {
//         current = current.next;
//       }
//       current.next = newNode;
//     }
//   }

//   remove(int key) {
//     int index = hash(key);
//     Node? current = table[index];
//     Node? prev = null;

//     while (current != null && current.data != key) {
//       prev = current;
//       current = current.next;
//     }

//     if (current == null) {
//       print('Key not found');
//       return;
//     }

//     if (prev == null) {
//       table[index] = current.next;
//     } else {
//       prev.next = current.next;
//     }
//   }

//   search(int key) {
//     int index = hash(key);
//     Node? current = table[index];

//     while (current != null) {
//       if (current.data == key) {
//         print('Key found: $key');
//         return;
//       }
//       current = current.next;
//     }
//     print('Key not found: $key');
//   }

//   update(int key, int newValue) {
//     int index = hash(key);
//     Node? current = table[index];

//     while (current != null) {
//       if (current.data == key) {
//         current.data = newValue;
//         print('Key updated: $key to $newValue');
//         return;
//       }
//       current = current.next;
//     }
//     print('Key not found: $key');
//   }

//   bool containsKey(int key) {
//     int index = hash(key);
//     Node? current = table[index];

//     while (current != null) {
//       if (current.data == key) {
//         return true;
//       }
//       current = current.next;
//     }
//     return false;
//   }

//   int get(int key) {
//     int index = hash(key);
//     Node? current = table[index];

//     while (current != null) {
//       if (current.data == key) {
//         return current.data;
//       }
//       current = current.next;
//     }
//     throw Exception('Key not found: $key');
//   }

//   void clear() {
//     for (int i = 0; i < size; i++) {
//       table[i] = null;
//     }
//   }

//   void display() {
//     for (int i = 0; i < size; i++) {
//       stdout.write('Index $i: ');
//       Node? current = table[i];
//       while (current != null) {
//         stdout.write('${current.data} -> ');
//         current = current.next;
//       }
//       print('null');
//     }
//   }
// }

// void main() {
//   HashTable ht = HashTable(10);
//   ht.insert(1, 10);
//   ht.insert(2, 20);
//   ht.insert(11, 30);
//   ht.insert(12, 40);
//   // ht.get(2);
//   ht.update(2, 25);
//   ht.remove(11);
//   ht.search(1);
//   ht.search(11);

//   ht.display();
// }
class HashMap {
    constructor(size = 10) {
        this.map = new Array(size);
    }

    hash(key) {
        let hash =0;
        for(let i=0;i< key.length;i++){
            hash += key.charCodeAt(i);
        }
        return hash % this.map.length;
    }

    set(key, value) {
        let index = this.hash(key);

        if(!this.map[index]) {
            this.map[index] = [];
        }

        for(let pair of this.map[index]) {
            if(pair[0] === key) {
                pair[1] = value;
                return;
            }
        }

        this.map[index].push([key, value]);
    }

    get(key) {
        let index = this._hash(key);

        if(!this.map[index]) return undefined;

        for(let pair of this.map[index]) {
            if(pair[0] === key) {
                return pair[1];
            }
        }

        return undefined;
    }

    remove(key) {
        let index = this._hash(key);

        if(!this.map[index]) return false;

        for(let i=0; i< this.map[index].length; i++) {
            if(this.map[index][i][0] === key) {
                this.map[index].splice(i, 1);
                return true;
            }
        }

        return false;
    }

    display() {
        for(let i=0; i< this.map.length; i++) {
            if(this.map[i]) {
                console.log(i, ":", this.map[i]);
            }
        }
    }
}

const hashMap = new HashMap();
hashMap.set('name', 'John Doe');
hashMap.set('age', 30);
hashMap.set('salary', 45000);
hashMap.set('city', 'New York');

console.log(hashMap.get('name'));
console.log(hashMap.get('age'));
console.log(hashMap.get('city'));

// hashMap.remove('age');

hashMap.display();