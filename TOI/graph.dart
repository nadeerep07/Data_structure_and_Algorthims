class Graph {
  Map<int, List<int>> graph = {};

  addEdge(int start, int dest) {
    graph.putIfAbsent(start, () => []).add(dest);
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
