
import heapq

graph = {
    'A': ['B', 'C', 'D'],
    'B': ['A', 'E'],
    'C': ['A', 'E', 'F'],
    'D': ['A', 'F'],
    'E': ['B', 'C', 'H'],
    'F': ['C', 'D', 'G'],
    'G': ['F', 'H'],
    'H': ['E', 'G']
}

h = {
    'A': 40,
    'B': 32,
    'C': 23,
    'D': 33,
    'E': 19,
    'F': 17,
    'G': 0,
    'H': 10
}

def gbfs(start, goal):
    queue = [(h[start], start, [start])]
    visited = set()

    while queue:
        _, node, path = heapq.heappop(queue)

        if node in visited:
            continue

        visited.add(node)

        if node == goal:
            print("Path:", " -> ".join(path))
            total = sum(h[n] for n in path)
            print("Total Heuristic Value:", total)
            return

        for neighbor in graph[node]:
            if neighbor not in visited:
                heapq.heappush(
                    queue,
                    (h[neighbor], neighbor, path + [neighbor])
                )

    print("Goal not found")

gbfs('A', 'G')
