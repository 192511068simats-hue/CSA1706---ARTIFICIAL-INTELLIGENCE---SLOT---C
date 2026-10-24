
def minimax(node, depth, maximizing):
    if depth == 0:
        return node

    if maximizing:
        return max(
            minimax(child, depth - 1, False)
            for child in node
        )
    else:
        return min(
            minimax(child, depth - 1, True)
            for child in node
        )

tree = [
    [[2, 3], [5, 9]],
    [[0, 1], [7, 5]]
]

def solve(tree):
    B = min(max(tree[0][0]), max(tree[0][1]))
    C = min(max(tree[1][0]), max(tree[1][1]))
    A = max(B, C)

    print("D =", max(tree[0][0]))
    print("E =", max(tree[0][1]))
    print("F =", max(tree[1][0]))
    print("G =", max(tree[1][1]))
    print("B =", B)
    print("C =", C)
    print("A (Minimax Value) =", A)

solve(tree)
