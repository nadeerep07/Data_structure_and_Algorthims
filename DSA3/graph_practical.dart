class Graph {
  Map<int, List<int>> graph = {};

  insertEdge(int start, int dest) {
    graph.putIfAbsent(start, () => []).add(dest);
    // graph.putIfAbsent(dest, () => []).add(start);
  }

  addvertex(int start) {
    graph.putIfAbsent(start, () => []);
  }

  removeedge(int start, int dest) {
    if (graph.containsKey(start)) {
      graph[start]!.remove(dest);
    }
  }

  removeVertex(int start) {
    // Remove all edges TO this vertex
    for (var key in graph.keys) {
      graph[key]!.remove(start);
    }

    // Then remove the vertex itself
    graph.remove(start);
  }

  bfs(int start) {
    List<int> result = [];
    List<int> visited = [];
    List<int> queue = [];
    queue.add(start);
    while (queue.isNotEmpty) {
      var vertex = queue.removeAt(0);
      if (!visited.contains(vertex)) {
        visited.add(vertex);
        result.add(vertex);
        for (var ele in graph[vertex] ?? []) {
          if (!visited.contains(ele)) {
            queue.add(ele);
          }
        }
      }
    }
    return result;
  }

  dfs(var start) {
    List<int> result = [];
    List<int> visited = [];
    List<int> stack = [];
    stack.add(start);
    while (stack.isNotEmpty) {
      var vertex = stack.removeLast();
      if (!visited.contains(vertex)) {
        visited.add(vertex);
        result.add(vertex);
        for (var ele in graph[vertex] ?? []) {
          if (!visited.contains(ele)) {
            stack.add(ele);
          }
        }
      }
    }
    return result;
  }

  display() {
    graph.forEach((key, value) {
      print('$key -> $value');
    });
  }
}

void main() {
  Graph gr = Graph();
  gr.insertEdge(1, 2);
  gr.insertEdge(1, 3);
  gr.insertEdge(2, 4);
  gr.insertEdge(2, 6);
  gr.insertEdge(2, 7);
  gr.insertEdge(2, 9);
  gr.insertEdge(2, 8);
  // gr.removeedge(1, 2);
  gr.removeVertex(1);
  // print(gr.dfs(2));
  gr.display();
  // print(gr.bfs(1));

  // gr.display();
}
