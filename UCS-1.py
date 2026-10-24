
import heapq

graph = {
    'S': {'A': 1, 'G': 12},
    'A': {'B': 3, 'C': 1},
    'B': {'D': 3},
    'C': {'D': 1, 'G': 2},
    'D': {'G': 3},
    'G': {}
}

def ucs(start, goal):
    queue = [(0, start, [start])]
    visited = set()

    while queue:
        cost, node, path = heapq.heappop(queue)

        if node in visited:
            continue

        visited.add(node)

        if node == goal:
            print("Optimal Path:", " -> ".join(path))
            print("Total Cost:", cost)
            return

        for neighbor, weight in graph[node].items():
            if neighbor not in visited:
                heapq.heappush(
                    queue,
                    (cost + weight, neighbor, path + [neighbor])
                )

    print("Goal not found")

ucs('S', 'G')
