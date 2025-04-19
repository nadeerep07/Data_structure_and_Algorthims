// class TreeNode {
//   int data;
//   TreeNode? left;
//   TreeNode? right;
//   TreeNode(this.data);
// }

// class BST {
//   TreeNode? root;

//   insert(int val) {
//     // var newNode = TreeNode(val);
//     // if (root == null) {
//     //   root = newNode;
//     //   return;
//     // }

//     // var current = root;
//     // while (current != null) {
//     //   if (val < current.data) {
//     //     if (current.left == null) {
//     //       current.left = newNode;
//     //       return;
//     //     } else {
//     //       current = current.left;
//     //     }
//     //   } else {
//     //     if (current.right == null) {
//     //       current.left = newNode;
//     //       return;
//     //     } else {
//     //       current = current.right;
//     //     }
//     //   }
//     // }

//     insertHelper(root, val);
//   }

//   insertHelper(TreeNode? node, val) {
//     if (root == null) {
//       root = val;
//       return;
//     }

//     while (true) {
//       if (val < node!.data) {
//         if (node.left == null) {
//           node.left = val;
//           return;
//         } else {
//           insertHelper(node.left, val);
//         }
//       } else {
//         if (node.right == null) {
//           node.right = val;
//         } else {
//           insertHelper(node.right, val);
//         }
//       }
//     }
//   }

//   contain(val) {
//     if (root == null) return null;
//     var current = root;
//     while (true) {
//       if (val == current!.data) {
//         return true;
//       } else if (val < current.left) {
//         current = current.left;
//       } else {
//         current = current.right;
//       }
//       return false;
//     }
//   }

//   remove(int val) {
//     removeHelper(root, val);
//   }

//   removeHelper(TreeNode? node, val) {
//     if (node == null) return;

//     if (val < node.data) {
//       node.left = removeHelper(node.left, val);
//     } else if (val > node.data) {
//       node.right = removeHelper(node.right, val);
//     } else {
//       if (node.left == null && node.right == null) {
//         return null;
//       } else if (node.left == null) {
//         return node.right;
//       } else if (node.right == null) {
//         return node.left;
//       } else {
//         TreeNode? minNode = getMin(node.right);
//         node.data = minNode!.data;
//         node.right = removeHelper(node.right, minNode.data);
//       }
//     }
//   }

//   secondeLargest() {
//     if (root == null) return null;
//     var current = root;
//     while (current != null) {
//       if (current.right != null &&
//           current.right!.left == null &&
//           current.right!.right == null)
//         return current.right;
//     }
//     if (current!.right == null) {
//       return current.data;
//     }
//   }

//   getMin(TreeNode? node) {
//     while (node!.left != null) {
//       node = node.left;
//     }
//     return node;
//   }

//   isValidBST() {
//     return isValidate(root, null, null);
//   }

//   isValidate(TreeNode? node, int? min, int? max) {
//     if (node == null) return true;
//     if ((min != null && node.data <= min) || (max != null && node.data >= max))
//       return false;
//     return isValidate(node.left, min, node.data) &&
//         isValidate(node.right, node.data, max);
//   }

//   // findNearest(int target) {
//   //   if (root == null) return null;
//   //   int closest = root!.data;
//   //   while (root != null) {
//   //     if ((target - closest).abs() > (target - root!.data)) {
//   //       closest = root!.data;
//   //     }
//   //     if (target < root!.data) {
//   //       root = root!.left;
//   //     } else if (target > root!.data) {
//   //       root = root!.right;
//   //     } else {
//   //       break;
//   //     }
//   //   }
//   // }
//   findLosest(var target) {
//     if (root == null) return null;
//     var current = root;
//     int closest = root!.data;
//     while (current != null) {
//       if ((target - closest).abs() > (target - current.data).abs()) {
//         closest = current.data;

//         if (target < current.left) {
//           current = current.left;
//         } else if (target > current.right) {
//           current = current.right;
//         }
//       }
//       return closest;
//     }

//     // secondLargest() {
//     //   if (root == null) return null;

//     //   var current = root;
//     //   while (current != null) {
//     //     if (current.right != null &&
//     //         current.right!.left == null &&
//     //         current.right!.right == null) {
//     //       return current.right!.data;
//     //     }
//     //     if (current.right == null) {
//     //       return current.data;
//     //     }
//     //   }
//     // }
//   }
// }
class Node {
  int data;
  Node? left;
  Node? right;
  Node(this.data);
}

class BST {
  Node? root;

  insert(int value) {
    Node newNode = Node(value);

    if (root == null) {
      root = newNode;
      return this;
    }

    Node currentNode = root!;
    while (true) {
      if (value < currentNode.data) {
        // Move to the left
        if (currentNode.left == null) {
          currentNode.left = newNode;
          return this;
        }
        currentNode = currentNode.left!;
      } else {
        // Move to the right
        if (currentNode.right == null) {
          currentNode.right = newNode;
          return this;
        }
        currentNode = currentNode.right!;
      }
    }
  }

  void postOrder() {
    postHelper(root);
  }

  void postHelper(Node? node) {
    if (node != null) {
      postHelper(node.left);
      postHelper(node.right);
      print(node.data);
    }
  }
}

void main() {
  BST bst = BST();
  bst.insert(10);
  bst.insert(30);
  bst.insert(12);
  bst.insert(8);
  // bst.remove(5);
  bst.postOrder();
}
