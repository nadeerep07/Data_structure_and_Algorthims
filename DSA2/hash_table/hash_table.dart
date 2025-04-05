// class Node<K, V> {
//   K key;
//   V value;
//   Node(this.key, this.value);

//   @override
//   String toString() {
//     return '($key , $value)';
//   }
// }

// class HashTable<K, V> {
//   late List<List<Node<K, V>>?> _table;

//   HashTable([int size = 10]) {
//     _table = List.filled(size, null);
//   }

//   // 🔹 1️⃣ Hash Function: Converts a key to an index
//   int _hash(K key) {
//     return key.hashCode % _table.length;
//   }

//   // 🔹 2️⃣ Insert / Update a key-value pair
//   void set(K key, V value) {
//     int index = _hash(key);
//     _table[index] ??= [];

//     // Check if key already exists (update value)
//     for (var pair in _table[index]!) {
//       if (pair.key == key) {
//         pair = Node(key, value); // Update existing value
//         return;
//       }
//     }

//     // If key is new, add it
//     _table[index]!.add(Node(key, value));
//   }

//   // 🔹 3️⃣ Retrieve a value by key
//   dynamic get(K key) {
//     int index = _hash(key);
//     if (_table[index] == null) return null;

//     for (var pair in _table[index]!) {
//       if (pair.key == key) {
//         return pair.value; // Return value if key matches
//       }
//     }
//     return null; // Key not found
//   }

//   // 🔹 4️⃣ Remove a key-value pair
//   bool remove(K key) {
//     int index = _hash(key);
//     if (_table[index] == null) return false;

//     for (int i = 0; i < _table[index]!.length; i++) {
//       if (_table[index]![i].key == key) {
//         _table[index]!.removeAt(i); // Remove the entry
//         return true;
//       }
//     }
//     return false; // Key not found
//   }

//   // 🔹 5️⃣ Display the entire hash table
//   void display() {
//     for (int i = 0; i < _table.length; i++) {
//       if (_table[i] != null && _table[i]!.isNotEmpty) {
//         print('$i: ${_table[i]}');
//       }
//     }
//   }
// }

// void main() {
//   var hashTable = HashTable<String, String>(87);

//   // Insert values
//   hashTable.set('name', 'John Doe');
//   hashTable.set('age', '30');
//   hashTable.set('salary', '45000');
//   hashTable.set('city', 'New York');

//   // Get values
//   print(hashTable.get('name')); // John Doe
//   print(hashTable.get('age')); // 30
//   print(hashTable.get('city')); // New York

//   // Remove a value
//   // hashTable.remove('age');

//   // Display the entire hash table
//   hashTable.display();
// }

class Node<K, V> {
  K key;
  V value;
  Node(this.key, this.value);
}

class HashTable<K, V> {
  late List<List<Node<K, V>>?> table;
  HashTable([int size = 10]) {
    table = List.filled(size, null);
  }

  hash(K key) {
    return key.hashCode % table.length;

    // var hash = 0;
    // for (int i = 0; i < key.length; i++) {
    //   hash += key.codeUnits(i);
    // }
  }

  set(K key, V val) {
    int index = hash(key);
    table[index] ??= [];

    for (var pair in table[index]!) {
      if (pair.key == key) {
        pair = Node(key, val);
      }
    }
    table[index]!.add(Node(key, val));
  }

  get(K key) {
    int index = hash(key);
    if (table[index] == null) return null;
    for (var pair in table[index]!) {
      if (pair.key == key) {
        return pair.value;
      }
    }
    return false;
  }

  remove(K key) {
    int index = hash(key);
    if (table[index] == null) return null;
    for (var i = 0; i < table[index]!.length; i++) {
      if (table[index]![i].key == key) {
        table[index]!.removeAt(i);
        return;
      }
    }
    return false;
  }

  display() {
    for (var i = 0; i < table.length; i++) {
      if (table[i] != null && table[i]!.isNotEmpty) {
        for (var entry in table[i]!) {
          print(' Key: ${entry.key}, Value: ${entry.value}');
        }
      }
    }
  }
}

void main() {
  var hash = HashTable<String, String>(87);
  hash.set('name', 'John Doe');
  hash.set('age', '30');
  hash.set('salary', '45000');

  hash.set('city', 'New York');
  // hash.set('country', 'USA');
  // hash.set('state', 'NY');
  // hash.set('zip', '10001');
  hash.get('name');

  hash.display();
  print('\n');
  hash.get('age');
  hash.get('city');
  hash.display();
}
