class Node {
  var val;
  List<Node?> data = [];
  Node(this.val);
}

class TREE {
  Node? root;

  insert(var val) {
    // var newNode = Node(val);
    if (root == null) {
      root = Node(val);
      return;
    }
    var current = root;
    while (current != null) {
      if (val < current.val) {
        if (current.data.isEmpty) {
          current.data.add(Node(val));
          return;
        } else {
          current = current.data[0];
        }
      } else {
        if (current.data.length < 2) {
          current.data.add(Node(val));
          return;
        } else {
          current = current.data[1];
        }
      }
    }
  }

  printTree() {
    if (root == null) {
      print("Tree is empty");
      return;
    }
    var current = root;
    while (current != null) {
      print(current.val);
      if (current.data.isNotEmpty) {
        current = current.data[0];
      } else {
        current = null;
      }
    }
  }
}

void main() {
  TREE tree = TREE();
  tree.insert(5);
  tree.insert(3);
  tree.insert(7);
  tree.insert(2);
  tree.insert(4);
  tree.insert(6);
  tree.insert(8);
  tree.printTree();
}
