# Breadth-First Search (BFS)

## Pseudocode

```text
BFS(Graph, Start):
    Create an empty visited set
    Create an empty queue

    Add Start to visited
    Enqueue Start

    While queue is not empty:
        Node = Dequeue from queue
        Print Node

        For each Neighbor of Node:
            If Neighbor is not in visited:
                Add Neighbor to visited
                Enqueue Neighbor
```

## Time Complexity
O(V + E)

## Space Complexity
O(V)

Where V is the number of vertices and E is the number of edges.
