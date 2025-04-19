class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BST {
  Node? root;

  insert(var val) {
    root = insertHelper(root, val);
  }

  insertHelper(Node? node, int val) {
    if (node == null) {
      return Node(val);
    }
    if (val < node.data) {
      node.left = insertHelper(node.left, val);
    } else {
      node.right = insertHelper(node.right, val);
    }
    return node;
  }

  remove(int val) {
    root = removeHelper(root, val);
  }

  removeHelper(Node? node, int val) {
    if (node == null) {
      return null;
    }
    if (val < node.data) {
      node.left = removeHelper(node.left, val);
    } else if (val > node.data) {
      node.right = removeHelper(node.right, val);
    } else {
      // Node with only one child or no child
      if (node.left == null) {
        return node.right;
      } else if (node.right == null) {
        return node.left;
      }
      // Node with two children: Get the inorder successor (smallest in the right subtree)
      node.data = minValue(node.right!);
      // Delete the inorder successor
      node.right = removeHelper(node.right, node.data);
    }
    return node;
  }

  minValue(Node node) {
    int minv = node.data;
    while (node.left != null) {
      minv = node.left!.data;
      node = node.left!;
    }
    return minv;
  }

  inorder(Node? node) {
    if (node != null) {
      inorder(node.left);
      print(node.data);
      inorder(node.right);
    }
  }

  preorder(Node? node) {
    if (node != null) {
      print(node.data);
      preorder(node.left);
      preorder(node.right);
    }
  }

  postorder(Node? node) {
    if (node != null) {
      postorder(node.left);
      postorder(node.right);
      print(node.data);
    }
  }
}

void main() {
  BST bst = BST();
  bst.insert(50);
  bst.insert(30);
  bst.insert(20);
  bst.insert(40);
  bst.insert(70);
  bst.insert(60);
  bst.insert(80);

  print("Inorder traversal:");
  bst.inorder(bst.root);

  print("\nPreorder traversal:");
  bst.preorder(bst.root);

  print("\nPostorder traversal:");
  bst.postorder(bst.root);

  print("\nRemoving node with value 20:");
  bst.remove(20);
  print("Inorder traversal after removal:");
  bst.inorder(bst.root);
}
