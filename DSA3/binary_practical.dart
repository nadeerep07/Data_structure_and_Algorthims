class Node {
  var data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BST {
  Node? root;

  insert(var val) {
    var newNode = Node(val);
    if (root == null) {
      root = newNode;
      return;
    }
    var current = root;
    while (true) {
      if (val < current!.data) {
        if (current.left == null) {
          current.left = newNode;
          return;
        } else {
          current = current.left;
        }
      } else {
        if (current.right == null) {
          current.right = newNode;
          return;
        } else {
          current = current.right;
        }
      }
    }
  }

  contains(var val) {
    var current = root;
    while (current != null) {
      if (val == current.data) {
        return true;
      } else if (val < current.data) {
        current = current.left;
      } else if (val > current.data) {
        current = current.right;
      } else {
        break;
      }
    }
    return false;
  }

  isValid() {
    return validate(root, null, null);
  }

  validate(Node? node, int? min, int? max) {
    if (node == null) return true;
    if ((min != null && node.data <= min) ||
        (max != null && node.data >= max)) {
      return false;
    }
    return validate(node.left, min, node.data) &&
        validate(node.right, node.data, max);
  }

  remove(var val) {
    root = removeHelper(root, val);
  }

  removeHelper(Node? node, var val) {
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
        Node? minNode = getMin(node.right);
        node.data = minNode!.data;
        node.right = removeHelper(node.right, minNode.data);
      }
    }
    return node;
  }

  getMin(Node? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node;
  }

  postOrder() {
    postOrderHelper(root);
  }

  postOrderHelper(Node? node) {
    if (node != null) {
      postOrderHelper(node.left);
      postOrderHelper(node.right);
      print(node.data);
    }
  }
}

void main() {
  BST bst = BST();
  bst.insert(10);
  bst.insert(20);
  bst.insert(8);
  bst.insert(15);
  bst.remove(10);
  bst.postOrder();
  // print(bst.contains(9));

  // print(bst.isValid());
}
