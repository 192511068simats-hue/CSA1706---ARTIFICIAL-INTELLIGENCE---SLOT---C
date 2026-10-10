
graph = {
    1: [2, 3],
    2: [1, 4, 5],
    3: [1],
    4: [2, 5],
    5: [2, 4]
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
