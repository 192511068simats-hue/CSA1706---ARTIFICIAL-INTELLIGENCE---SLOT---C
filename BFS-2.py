
from collections import deque

graph = {
    1: [2, 7],
    2: [1, 3, 6],
    3: [2, 4, 5],
    4: [3],
    5: [3],
    6: [2],
    7: [1, 8, 10],
    8: [7, 9],
    9: [8],
    10: [7]
}

def bfs(start):
    visited = {start}
    queue = deque([start])
    order = []

    while queue:
        node = queue.popleft()
        order.append(node)

        for neighbor in graph[node]:
            if neighbor not in visited:
                visited.add(neighbor)
                queue.append(neighbor)

    print("BFS:", order)

bfs(1)
