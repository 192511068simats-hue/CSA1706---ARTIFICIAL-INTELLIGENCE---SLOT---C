
tree = {
    'A': ['B', 'C'],
    'B': ['D', 'E'],
    'C': ['F', 'G'],
    'D': [2, 3],
    'E': [5, 9],
    'F': [0, 1],
    'G': [7, 5]
}

def leaf_values(node):
    if isinstance(node, int):
        return [node]

    values = []
    for child in tree[node]:
        values.extend(leaf_values(child))
    return values

def alpha_beta(node, maximizing, alpha, beta):
    if isinstance(node, int):
        print("Visited leaf:", node)
        return node

    children = tree[node]

    if maximizing:
        value = float('-inf')

        for i, child in enumerate(children):
            result = alpha_beta(child, False, alpha, beta)
            value = max(value, result)
            alpha = max(alpha, value)

            if alpha >= beta:
                remaining = children[i + 1:]
                if remaining:
                    pruned = []
                    for item in remaining:
                        pruned.extend(leaf_values(item))
                    print("Pruned leaves:", pruned)
                break

    else:
        value = float('inf')

        for i, child in enumerate(children):
            result = alpha_beta(child, True, alpha, beta)
            value = min(value, result)
            beta = min(beta, value)

            if beta <= alpha:
                remaining = children[i + 1:]
                if remaining:
                    pruned = []
                    for item in remaining:
                        pruned.extend(leaf_values(item))
                    print("Pruned leaves:", pruned)
                break

    print(node, "=", value)
    return value

result = alpha_beta('A', True, float('-inf'), float('inf'))
print("Final Minimax Value:", result)
