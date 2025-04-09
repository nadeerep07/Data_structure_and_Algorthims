import 'dart:io';

class Node {
  var data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BinarySearchTree {
  Node? root;

  // insert(int val) {
  //   var newNode = Node(val);
  //   var current = root;
  //   if (current == null) {
  //     root = newNode;
  //     return;
  //   }
  //   while (true) {
  //     if (val < current!.data) {
  //       if (current.left == null) {
  //         current.left = newNode;
  //         break;
  //       } else {
  //         current = current.left;
  //       }
  //     } else {
  //       if (current.right == null) {
  //         current.right = newNode;
  //         break;
  //       } else {
  //         current = current.right;
  //       }
  //     }
  //   }
  // }

  // insert(int val) {
  //   var newNode = Node(val);
  //   if (root == null) {
  //     root = newNode;
  //   }
  //   var current = root;
  //   while (true) {
  //     if (val < current!.data) {
  //       if (current.data == null) {
  //         current.left = newNode;
  //         break;
  //       } else {
  //         current = current.left;
  //       }
  //     } else {
  //       if (current.right == null) {
  //         current.right = newNode;
  //         break;
  //       } else {
  //         current = current.right;
  //       }
  //     }
  //   }
  // }

  // insert(int val) {
  //   var newNode = Node(val);
  //   if (root == null) {
  //     root = newNode;
  //     return;
  //   }
  //   var current = root;
  //   while (true) {
  //     if (val < current!.data) {
  //       if (current.left == null) {
  //         current.left = newNode;
  //         break;
  //       } else {
  //         current = current.left;
  //       }
  //     } else {
  //       if (current.right == null) {
  //         current.right = newNode;
  //         break;
  //       } else {
  //         current = current.right;
  //       }
  //     }
  //   }
  // }
  inserUsingRecursion(int val) {
    insertHelper(root, val);
  }

  insertHelper(Node? node, int val) {
    var newNode = Node(val);
    if (node == null) {
      root = newNode;
      return;
    }
    if (val < node.data) {
      if (node.left == null) {
        node.left = newNode;
      } else {
        insertHelper(node.left, val);
      }
    } else {
      if (node.right == null) {
        node.right = newNode;
      } else {
        insertHelper(node.right, val);
      }
    }
  }

  // contains(int val) {
  //   var current = root;
  //   while (current != null) {
  //     if (val == current.data) {
  //       return true;
  //     } else if (val < current.data) {
  //       current = current.left;
  //     } else {
  //       current = current.right;
  //     }
  //   }
  //   return false;
  // }

  // contains(int val) {
  //   var current = root;
  //   while (current != null) {
  //     if (val == current.data) {
  //       return true;
  //     } else if (val < current.data) {
  //       current = current.left;
  //     } else {
  //       current = current.right;
  //     }
  //   }
  //   return false;
  // }

  // remove(int val) {
  //   removeHelper(root, val);
  // }

  // Node? removeHelper(Node? node, int val) {
  //   if (node == null) return null;

  //   if (val < node.data) {
  //     node.left = removeHelper(node.left, val);
  //   } else if (val > node.data) {
  //     node.right = removeHelper(node.right, val);
  //   } else {
  //     // Node found
  //     if (node.left == null && node.right == null) {
  //       return null; // Case 1: No children
  //     } else if (node.left == null) {
  //       return node.right; // Case 2: One right child
  //     } else if (node.right == null) {
  //       return node.left; // Case 2: One left child
  //     } else {
  //       // Case 3: Two children
  //       Node minNode = getMin(node.right!);
  //       node.data = minNode.data;
  //       node.right = removeHelper(node.right, minNode.data);
  //     }
  //   }
  //   return node;
  // }
  remove(int val) {
    removeHelper(root, val);
  }

  removeHelper(Node? node, val) {
    if (node == null) return null;

    if (val < node.data) {
      node.left = removeHelper(node.left, val);
    } else if (val > node.data) {
      node.right = removeHelper(node.right, val);
    } else {
      if (node.left == null && node.right == null) {
        return null;
      } else if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      } else {
        Node minNode = getMin(node.right!);
        node.data = minNode.data;
        node.right = removeHelper(node.right, minNode.data);
      }
    }
    return node;
  }

  getMin(Node node) {
    while (node.left != null) {
      node = node.left!;
    }
    return node;
  }

  inOrderDisplay() {
    inOrderDisplayHelper(root);
  }

  inOrderDisplayHelper(Node? node) {
    if (node != null) {
      inOrderDisplayHelper(node.left);
      stdout.write('${node.data} ');
      inOrderDisplayHelper(node.right);
    }
  }

  preOrderDispaly() {
    preOrderDisplayHelper(root);
  }

  preOrderDisplayHelper(Node? node) {
    if (node != null) {
      stdout.write('${node.data} ');
      preOrderDisplayHelper(node.left);
      preOrderDisplayHelper(node.right);
    }
  }

  postOrderDisplay() {
    postOrderDisplayHelper(root);
  }

  postOrderDisplayHelper(Node? node) {
    if (node != null) {
      postOrderDisplayHelper(node.left);
      postOrderDisplayHelper(node.right);
      stdout.write('${node.data} ');
    }
  }

  // getMin(Node? node) {
  //   if (node?.left == null) {
  //     return node!.data;
  //   } else {
  //     return getMin(node!.left);
  //   }
  // }
}

void main() {
  BinarySearchTree bst = BinarySearchTree();
  bst.inserUsingRecursion(10);
  bst.inserUsingRecursion(5);
  bst.inserUsingRecursion(15);
  bst.inserUsingRecursion(3);
  bst.inserUsingRecursion(7);
  bst.inserUsingRecursion(12);
  bst.inserUsingRecursion(18);

  print("In-order display: ");
  bst.inOrderDisplay(); // 3 5 7 10 12 15 18
  bst.remove(5);
  bst.remove(10);
  print("\nPre-order display: ");
  bst.preOrderDispaly(); // 10 5 3 7 15 12 18
  print("\nPost-order display: ");
  bst.postOrderDisplay(); // 3 7 5 12 18 15 10
}
