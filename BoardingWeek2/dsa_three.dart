// class Node{
//   int data;
//   Node? right;
//   Node? left;
//   Node(this.data);
// }

// class BinarySearchTree{

//   Node? root;

//   insert(int value){
//     var newNode = Node(value);

//     var current = root;

//     if(root == null){
//       root = newNode;
//       return;
//     }

//     while(true){
//       if(current != null){
//         if(value < current.data){
//           if(current.left == null){
//             current.left = newNode;
//             return;
//           }else{
//             current = current.left;
//           }
//         }else{
//           if(current.right == null){
//             current.right = newNode;
//             return;
//           }else{
//             current = current.right;
//           }
//         }
//       }
//     }

//   }

//   inOrder(){
// inOrderHelper(root);
//   }

//   inOrderHelper(Node? node){
//     if(node !=null){
//       inOrderHelper(node.left);
//       print(node.data);
//       inOrderHelper(node.right);
//     }
//   }

//   contains(int val){
//    var current = root;
//     while(current != null){
//       if(val == current.data){
//         return true;
//       }else if(val < current.data){
//         current = current.left;
//       }else{
//         current = current.right;
//       }
//     }
//     return false;
//   }
// }

// void main(){
//   BinarySearchTree binary = BinarySearchTree();
//   binary.insert(1);
//   binary.inOrder();
//  print( binary.contains(1));
// }

class Graph {
  Map<int, List<int>> graph = {};

  addEdge(int start, int destination) {
    graph.putIfAbsent(start, () => []).add(destination);
  }

  bfs(int val) {
    List<int> result = [];
    List<int> visited = [];
    List<int> queue = [];

    queue.add(val);
    while (queue.isNotEmpty) {
      int vertex = queue.removeAt(0);
      if (!visited.contains(vertex)) {
        visited.add(vertex);
        result.add(vertex);

        for (var ele in graph[vertex]!) {
          if (!visited.contains(ele)) {
            queue.add(ele);
          }
        }
      }
      return result;
    }
  }

  dfs(int val) {
    List<int> result = [];
    List<int> visited = [];
    List<int> stack = [];

    stack.add(val);

    while (stack.isNotEmpty) {
      int vertex = stack.removeLast();

      if (!visited.contains(vertex)) {
        visited.add(vertex);
        result.add(vertex);

        for (var element in graph[vertex]!) {
          if (!visited.contains(element)) {
            stack.add(element);
          }
        }
      }
    }
    return result;
  }
}
