
from collections import deque

graph = {
    1: [2, 3],
    2: [1, 4, 5],
    3: [1],
    4: [2, 5],
    5: [2, 4]
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
