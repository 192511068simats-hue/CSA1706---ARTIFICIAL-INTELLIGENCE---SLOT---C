
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

def dfs(node, visited, order):
    if node not in visited:
        visited.add(node)
        order.append(node)

        for neighbor in graph[node]:
            dfs(neighbor, visited, order)

order = []
dfs(1, set(), order)
print("DFS:", order)
