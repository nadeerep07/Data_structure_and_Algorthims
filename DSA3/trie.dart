// class TrieNode {
//   Map<String, TrieNode> children = {};
//   bool isEndOfWord = false;
// }

// class Trie {
//   TrieNode root = TrieNode();

//   // // Insert a word
//   // void insert(String word) {
//   //   TrieNode currentNode = root;
//   //   for (var char in word.split('')) {
//   //     currentNode.children[char] ??= TrieNode();
//   //     currentNode = currentNode.children[char]!;
//   //   }
//   //   currentNode.isEndOfWord = true;
//   // }

//   // void insert(String word) {
//   //   var currentNode = root;
//   //   for (var char in word.split('')) {
//   //     currentNode.children[char] ??= TrieNode();
//   //     currentNode = currentNode.children[char]!;
//   //   }
//   //   currentNode.isEndOfWord = true;
//   // }

//   // Search for a complete word
//   bool search(String word) {
//     TrieNode? currentNode = root;
//     for (var char in word.split('')) {
//       if (!currentNode!.children.containsKey(char)) {
//         return false;
//       }
//       currentNode = currentNode.children[char];
//     }
//     return currentNode!.isEndOfWord;
//   }

//   // Check if a prefix exists
//   bool startsWith(String prefix) {
//     TrieNode? currentNode = root;
//     for (var char in prefix.split('')) {
//       if (!currentNode!.children.containsKey(char)) {
//         return false;
//       }
//       currentNode = currentNode.children[char];
//     }
//     return true;
//   }

//   // Delete a word
//   void delete(String word) {
//     bool _delete(TrieNode node, String word, int index) {
//       if (index == word.length) {
//         if (!node.isEndOfWord) return false;
//         node.isEndOfWord = false;
//         return node.children.isEmpty;
//       }

//       String char = word[index];
//       if (!node.children.containsKey(char)) {
//         return false;
//       }

//       bool shouldDeleteCurrentNode = _delete(
//         node.children[char]!,
//         word,
//         index + 1,
//       );

//       if (shouldDeleteCurrentNode) {
//         node.children.remove(char);
//         return node.children.isEmpty && !node.isEndOfWord;
//       }

//       return false;
//     }

//     _delete(root, word, 0);
//   }

//   // Display (Optional helper method)
//   void displayTrie([TrieNode? node, String prefix = '']) {
//     node ??= root;
//     if (node.isEndOfWord) {
//       print(prefix);
//     }
//     for (var entry in node.children.entries) {
//       displayTrie(entry.value, prefix + entry.key);
//     }
//   }
// }
// class TrieNode {
//   Map<String, TrieNode> children = {};
//   bool isEndOfWord = false;
// }

// class Trie {
//   TrieNode root = TrieNode();

//   insert(String word) {
//     var currentNode = root;
//     for (var char in word.split('')) {
//       currentNode.children[char] ??= TrieNode();
//       currentNode = currentNode.children[char]!;
//     }
//     currentNode.isEndOfWord = true;
//   }
// }

class TrieNode {
  Map<String, TrieNode> children = {};
  bool isEndOfWord = false;

  TrieNode();
}

class Trie {
  TrieNode root = TrieNode();

  // void insert(String word) {
  //   TrieNode current = root;
  //   for (int i = 0; i < word.length; i++) {
  //     String char = word[i];
  //     if (!current.children.containsKey(char)) {
  //       current.children[char] = TrieNode();
  //     }
  //     current = current.children[char]!;
  //   }
  //   current.isEndOfWord = true;
  // }
  insert(String word) {
    var currentNode = root;
    for (var char in word.split('')) {
      currentNode.children[char] ??= TrieNode();
      currentNode = currentNode.children[char]!;
    }
    currentNode.isEndOfWord = true;
  }

  bool search(String word) {
    TrieNode current = root;
    for (int i = 0; i < word.length; i++) {
      String char = word[i];
      if (!current.children.containsKey(char)) {
        print('not in trie');
        return false;
      }
      current = current.children[char]!;
    }
    if (current.isEndOfWord) {
      print('word found in trie');
      return true;
    }
    return false;
  }

  void display({TrieNode? node, String word = ''}) {
    node ??= root;

    if (node.isEndOfWord) {
      print(word);
    }

    node.children.forEach((char, child) {
      display(node: child, word: word + char);
    });
  }

  List<String> autocomplete(String prefix) {
    TrieNode current = root;
    for (int i = 0; i < prefix.length; i++) {
      String char = prefix[i];
      if (!current.children.containsKey(char)) {
        return []; // No words with this prefix
      }
      current = current.children[char]!;
    }

    List<String> results = [];
    void collectWords(TrieNode node, String word) {
      if (node.isEndOfWord) {
        results.add(word);
      }
      node.children.forEach((char, child) {
        collectWords(child, word + char);
      });
    }

    collectWords(current, prefix);
    return results;
  }

  void delete(String word) {
    bool deleteHelper(TrieNode node, String word, int index) {
      if (index == word.length) {
        if (!node.isEndOfWord) {
          return false;
        }
        node.isEndOfWord = false;
        return node.children.isEmpty;
      }

      String char = word[index];
      TrieNode? child = node.children[char];
      if (child == null) {
        return false;
      }

      bool shouldDeleteChild = deleteHelper(child, word, index + 1);
      if (shouldDeleteChild) {
        node.children.remove(char);
        return node.children.isEmpty && !node.isEndOfWord;
      }
      return false;
    }

    deleteHelper(root, word, 0);
  }
}

void main() {
  Trie trie = Trie();
  trie.insert("hello");
  trie.insert("help");
  trie.insert("hi");

  trie.delete('hi');
  trie.display();
  print(trie.autocomplete("he"));
  print(trie.search("hello")); // Should print: word found in trie
  print(trie.search("hi")); // Should print: not in trie
}
