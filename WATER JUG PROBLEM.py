
from collections import deque

def water_jug():
    capacity = (5, 3)
    target = 4

    start = (0, 0)
    queue = deque([(start, [])])
    visited = {start}

    while queue:
        (a, b), path = queue.popleft()

        if a == target or b == target:
            print("Water Jug Solution:")
            for step in path + [(a, b)]:
                print(step)
            return

        states = [
            (5, b),                  # Fill 5L jug
            (a, 3),                  # Fill 3L jug
            (0, b),                  # Empty 5L jug
            (a, 0),                  # Empty 3L jug
            (a - min(a, 3 - b), b + min(a, 3 - b)),  # Pour 5L to 3L
            (a + min(b, 5 - a), b - min(b, 5 - a))   # Pour 3L to 5L
        ]

        for state in states:
            if state not in visited:
                visited.add(state)
                queue.append((state, path + [(a, b)]))

water_jug()
