
graph = {
    1: [2, 3],
    2: [1, 5, 6],
    3: [1, 4, 7],
    4: [3, 8],
    5: [2],
    6: [2],
    7: [3, 8],
    8: [4, 7]
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
