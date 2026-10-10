
graph = {
    0: [1],
    1: [3, 2],
    2: [],
    3: [4, 2],
    4: [5],
    5: [7],
    6: [4],
    7: [6]
}

def dfs(node, visited, order):
    if node not in visited:
        visited.add(node)
        order.append(node)

        for neighbor in graph[node]:
            dfs(neighbor, visited, order)

order = []
dfs(0, set(), order)
print("DFS:", order)
