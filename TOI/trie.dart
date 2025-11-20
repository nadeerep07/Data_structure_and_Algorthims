class TrieNode{
  Map<String,TrieNode> children = {};

  bool endOfWord = false;

}

class Trie {
  TrieNode root = TrieNode();

 void insert(String word) {
    var currentNode = root;
    for (var char in word.split('')) {
      currentNode.children[char] ??= TrieNode();
      currentNode = currentNode.children[char]!;
    }
    currentNode.endOfWord = true;
}

}