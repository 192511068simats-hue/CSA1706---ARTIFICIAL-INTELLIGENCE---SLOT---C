
graph = {
    'A': ['B', 'D'],
    'B': ['A', 'C', 'E'],
    'C': ['B', 'F'],
    'D': ['A', 'E', 'G'],
    'E': ['B', 'D', 'F', 'H'],
    'F': ['C', 'E', 'I'],
    'G': ['D', 'H', 'J'],
    'H': ['E', 'G', 'I', 'J'],
    'I': ['F', 'H', 'J'],
    'J': ['G', 'H', 'I']
}

colors = ['Red', 'Green', 'Blue', 'Yellow']
color_map = {}

def is_safe(region, color):
    for neighbor in graph[region]:
        if color_map.get(neighbor) == color:
            return False
    return True

def map_coloring(regions):
    if not regions:
        return True

    region = regions[0]

    for color in colors:
        if is_safe(region, color):
            color_map[region] = color

            if map_coloring(regions[1:]):
                return True

            del color_map[region]

    return False

if map_coloring(list(graph.keys())):
    print("Map Coloring Solution:")
    for region in graph:
        print(region, ":", color_map[region])
else:
    print("No solution exists")
