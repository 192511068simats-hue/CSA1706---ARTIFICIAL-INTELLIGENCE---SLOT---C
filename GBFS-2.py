
import heapq

graph = {
    'P': [('R', 4), ('C', 4), ('A', 4)],
    'R': [('E', 5)],
    'A': [('M', 3)],
    'C': [('R', 2), ('M', 6), ('Y', 3)],
    'M': [('Y', 5), ('K', 2)],
    'K': [('N', 5)],
    'E': [('Y', 5), ('S', 1)],
    'Y': [('S', 4), ('N', 5)],
    'N': [('S', 6)],
    'S': []
}

h = {
    'P': 10,
    'R': 8,
    'A': 11,
    'C': 6,
    'M': 9,
    'K': 9,
    'E': 3,
    'Y': 2,
    'N': 6,
    'S': 0
}

def gbfs(start, goal):
    queue = [(h[start], start, [start], 0)]
    visited = set()

    while queue:
        _, node, path, cost = heapq.heappop(queue)

        if node in visited:
            continue

        visited.add(node)

        if node == goal:
            print("GBFS Path:", " -> ".join(path))
            print("Heuristic Values:", " -> ".join(str(h[n]) for n in path))
            print("Total Path Cost:", cost)
            return

        for neighbor, weight in graph[node]:
            if neighbor not in visited:
                heapq.heappush(
                    queue,
                    (h[neighbor], neighbor, path + [neighbor],
                     cost + weight)
                )

    print("Goal not found")

gbfs('P', 'S')
