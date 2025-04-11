class TreeNode {
  int data;
  TreeNode? left;
  TreeNode? right;
  TreeNode(this.data);
}

class BST {
  TreeNode? root;

  insert(int val) {
    // var newNode = TreeNode(val);
    // if (root == null) {
    //   root = newNode;
    //   return;
    // }

    // var current = root;
    // while (current != null) {
    //   if (val < current.data) {
    //     if (current.left == null) {
    //       current.left = newNode;
    //       return;
    //     } else {
    //       current = current.left;
    //     }
    //   } else {
    //     if (current.right == null) {
    //       current.left = newNode;
    //       return;
    //     } else {
    //       current = current.right;
    //     }
    //   }
    // }

    insertHelper(root, val);
  }

  insertHelper(TreeNode? node, val) {
    if (root == null) {
      root = val;
      return;
    }

    while (true) {
      if (val < node!.data) {
        if (node.left == null) {
          node.left = val;
          return;
        } else {
          insertHelper(node.left, val);
        }
      } else {
        if (node.right == null) {
          node.right = val;
        } else {
          insertHelper(node.right, val);
        }
      }
    }
  }

  contain(val) {
    if (root == null) return null;
    var current = root;
    while (true) {
      if (val == current!.data) {
        return true;
      } else if (val < current.left) {
        current = current.left;
      } else {
        current = current.right;
      }
      return false;
    }
  }

  remove(int val) {
    removeHelper(root, val);
  }

  removeHelper(TreeNode? node, val) {
    if (node == null) return;

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
        TreeNode? minNode = getMin(node.right);
        node.data = minNode!.data;
        node.right = removeHelper(node.right, minNode.data);
      }
    }
  }

  getMin(TreeNode? node) {
    while (node!.left != null) {
      node = node.left;
    }
    return node;
  }

  isValidBST() {
    return isValidate(root, null, null);
  }

  isValidate(TreeNode? node, int? min, int? max) {
    if (node == null) return true;
    if ((min != null && node.data <= min) || (max != null && node.data >= max))
      return false;
    return isValidate(node.left, min, node.data) &&
        isValidate(node.right, node.data, max);
  }

  findNearest(int target) {
    if (root == null) return null;
    int closest = root!.data;
    while (root != null) {
      if ((target - closest).abs() > (target - root!.data)) {
        closest = root!.data;
      }
      if (target < root!.data) {
        root = root!.left;
      } else if (target > root!.data) {
        root = root!.right;
      } else {
        break;
      }
    }
  }
}
