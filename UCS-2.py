
import heapq

graph = {
    'V1': {'V2': 9, 'V3': 4},
    'V2': {'V1': 9, 'V3': 2, 'V4': 7, 'V5': 3},
    'V3': {'V1': 4, 'V2': 2, 'V4': 1, 'V5': 6},
    'V4': {'V2': 7, 'V3': 1, 'V5': 4, 'V6': 8},
    'V5': {'V2': 3, 'V3': 6, 'V4': 4, 'V6': 2},
    'V6': {'V4': 8, 'V5': 2}
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

ucs('V1', 'V6')
