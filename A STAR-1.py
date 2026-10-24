
import heapq

graph = {
    'S': [('A', 3), ('D', 4)],
    'A': [('S', 3), ('D', 5), ('B', 4)],
    'B': [('A', 4), ('C', 4)],
    'C': [('B', 4), ('E', 5)],
    'D': [('S', 4), ('A', 5), ('E', 2)],
    'E': [('D', 2), ('C', 5), ('F', 4)],
    'F': [('E', 4), ('G', 3.5)],
    'G': [('F', 3.5)]
}

h = {
    'S': 5,
    'A': 10.1,
    'B': 5.8,
    'C': 3.4,
    'D': 9.2,
    'E': 7.1,
    'F': 3.5,
    'G': 0
}

def a_star(start, goal):
    queue = [(h[start], 0, start, [start])]
    best_cost = {start: 0}

    while queue:
        f, g, node, path = heapq.heappop(queue)

        if g != best_cost.get(node):
            continue

        print(f"Node: {node}, g={g}, h={h[node]}, f={f}")

        if node == goal:
            print("\nOptimal Path:", " -> ".join(path))
            print("Total Path Cost:", g)
            return

        for neighbor, weight in graph[node]:
            new_g = g + weight

            if new_g < best_cost.get(neighbor, float('inf')):
                best_cost[neighbor] = new_g
                new_f = new_g + h[neighbor]

                heapq.heappush(
                    queue,
                    (new_f, new_g, neighbor, path + [neighbor])
                )

    print("Goal not found")

a_star('S', 'G')
