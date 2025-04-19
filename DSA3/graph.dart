class Graph {
  Map<int, List<int>> graph = {};

  // void addEdge(int start, int destination) {
  //   graph.putIfAbsent(start, () => []).add(destination);
  //   graph.putIfAbsent(destination, () => []).add(start);
  // }

  addEdge(int start, int destination) {
    graph.putIfAbsent(start, () => []).add(destination);
    graph.putIfAbsent(destination, () => []).add(start);
  }

  // List<int> bfs(int start) {
  //   List<int> result = [];
  //   List<int> visited = [];
  //   List<int> queue = [];

  //   queue.add(start);
  //   while (queue.isNotEmpty) {
  //     int vertex = queue.removeAt(0);
  //     if (!visited.contains(vertex)) {
  //       visited.add(vertex);
  //       result.add(vertex);
  //       for (var ele in graph[vertex]!) {
  //         if (!visited.contains(ele)) {
  //           queue.add(ele);
  //         }
  //       }
  //     }
  //   }
  //   return result;
  // }

  // List<int> bfs(int start) {
  //   List<int> result = [];
  //   List<int> visited = [];
  //   List<int> queue = [];
  //   queue.add(start);
  //   while (queue.isNotEmpty) {
  //     int vertex = queue.removeAt(0);
  //     if (!visited.contains(vertex)) {
  //       visited.add(vertex);
  //       result.add(vertex);
  //       for (var ele in graph[vertex]!) {
  //         if (!visited.contains(ele)) {
  //           queue.add(ele);
  //         }
  //       }
  //     }
  //   }
  //   return result;
  // }
  bfs(int start) {
    List<int> result = [];
    List<int> visited = [];
    List<int> queue = [];
    queue.add(start);
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
    }
    return result;
  }

  // List<int> dfs(int start) {
  //   List<int> visited = [];
  //   List<int> result = [];
  //   List<int> stack = [];

  //   stack.add(start);
  //   while (stack.isNotEmpty) {
  //     int vertex = stack.removeLast();
  //     if (!visited.contains(vertex)) {
  //       visited.add(vertex);
  //       result.add(vertex);
  //       for (int ele in graph[vertex]!) {
  //         if (!visited.contains(ele)) {
  //           stack.add(ele);
  //         }
  //       }
  //     }
  //   }
  //   return result;
  // }

  dfs(int start) {
    List<int> result = [];
    List<int> visted = [];
    List<int> stack = [];

    stack.add(start);
    while (stack.isNotEmpty) {
      int vertex = stack.removeLast();
      if (!visted.contains(vertex)) {
        visted.add(vertex);
        result.add(vertex);
        for (var ele in graph[vertex]!) {
          if (!visted.contains(ele)) {
            stack.add(ele);
          }
        }
      }
    }
    return result;
  }

  // weighted( int start, int end){
  //   List<int> visited = [];
  //   List<int> stack = [];

  //   stack.add(start);
  //   while(stack.isNotEmpty){
  //     int vertex = stack.removeLast();
  //     if(!visited.contains(vertex)){
  //       visited.add(vertex);
  //       if(vertex == end){
  //         return visited;
  //       }
  //       for(int ele in graph[vertex]!){
  //         if(!visited.contains(ele)){
  //           stack.add(ele);
  //         }
  //       }
  //     }
  //   }
  //   return visited;
  // }
}

void main() {
  Graph graph = Graph();
  graph.addEdge(1, 2);
  graph.addEdge(1, 3);
  graph.addEdge(2, 0);
  graph.addEdge(2, 5);
  graph.addEdge(3, 6);
  graph.addEdge(3, 7);
  print(graph.bfs(1));
  print(graph.dfs(1));
}

class Graph2 {
  Map<String, List<String>> graph = {};

  // Add a vertex to the graph
  void addVertex(String vertex) {
    if (!graph.containsKey(vertex)) {
      graph[vertex] = [];
    }
  }

  // Add a directed edge from src to dest
  void addEdge(String src, String dest) {
    if (graph.containsKey(src)) {
      graph[src]!.add(dest);
    } else {
      graph[src] = [dest];
    }
  }

  // Remove a vertex and all associated edges
  void removeVertex(String vertex) {
    if (graph.containsKey(vertex)) {
      // Remove all edges pointing to the vertex
      for (var v in graph.keys) {
        graph[v]!.remove(vertex);
      }
      // Remove the vertex itself
      graph.remove(vertex);
    }
  }

  // Remove a directed edge from src to dest
  void removeEdge(String src, String dest) {
    if (graph.containsKey(src)) {
      graph[src]!.remove(dest);
    }
  }

  // Find a path using DFS
  List<String>? findPath(String start, String end, [List<String>? path]) {
    path ??= [];
    path = List.from(path)..add(start);

    if (start == end) {
      return path;
    }

    if (!graph.containsKey(start)) {
      return null;
    }

    for (var neighbor in graph[start]!) {
      if (!path.contains(neighbor)) {
        var newPath = findPath(neighbor, end, path);
        if (newPath != null) {
          return newPath;
        }
      }
    }
    return null;
  }

  // Find the shortest path using BFS
  List<String>? shortestPath(String start, String end) {
    if (!graph.containsKey(start) || !graph.containsKey(end)) {
      return null;
    }

    List<List<String>> queue = [
      [start],
    ];

    while (queue.isNotEmpty) {
      var path = queue.removeAt(0);
      var current = path.last;

      for (var neighbor in graph[current]!) {
        if (neighbor == end) {
          return [...path, end];
        }
        if (!path.contains(neighbor)) {
          queue.add([...path, neighbor]);
        }
      }
    }
    return null;
  }

  // Display the adjacency list
  void display() {
    graph.forEach((vertex, edges) {
      print('$vertex -> $edges');
    });
  }
}
